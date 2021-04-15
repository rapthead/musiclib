package usecases

import (
	"context"
	"fmt"

	"github.com/go-redis/redis/v8"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/models/fuse_entities"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
)

type SyncDeps interface {
	RedisClient() *redis.Client
	Queries() *persistance.Queries

	CoversStorage() coverstorage.FSCoverStorage
	ThumbnailStorage() coverstorage.ThumbnailStorage
}

func Sync(deps SyncDeps, ctx context.Context) <-chan LogEvent {
	rdb := deps.RedisClient()
	queries := deps.Queries()
	conf := config.Config

	logChan := make(chan LogEvent)
	logError := func(err error) {
		logChan <- LogEntry{
			err: err,
		}
	}
	logInfo := func(info string) {
		logChan <- LogEntry{
			info: info,
		}
	}

	go func() {
		defer close(logChan)
		redisPipe := rdb.Pipeline()
		redisPipe.Select(ctx, config.FSSecondaryDBIndex)
		redisPipe.FlushDB(ctx)

		var allErrors []string

		logProgress := func(progressChan <-chan sync.ProgressInfo) {
			for pi := range progressChan {
				if pi.Error != nil {
					err := fmt.Errorf("sync error: %w", pi.Error)
					logError(err)
					allErrors = append(allErrors, err.Error())
				} else {
					logInfo(
						fmt.Sprintf("process %d of %d: %s", pi.Current, pi.Total, pi.Path),
					)
				}
			}
		}

		fuseSync := sync.NewFuseSync(conf.MusiclibRoot, store.NewFuseStore(redisPipe))

		// sync flac files
		{
			logInfo("GetAllMetadata query started")
			allMetadata, err := queries.GetAllMetadata(ctx)
			if err != nil {
				logError(fmt.Errorf("Unable to fetch metadata: %w", err))
				return
			}
			logInfo("GetAllMetadata query success")

			flacEntities := make([]sync.FuseFlacEntity, len(allMetadata), len(allMetadata))
			for i, meta := range allMetadata {
				flacEntities[i] = fuse_entities.NewFuseFlacEntity(meta)
			}

			logProgress(fuseSync.SyncFlacsChan(flacEntities))

			contentEntities := []sync.ContentEntity{}
			albumMetas := []models.Metadata{}

			for i, meta := range allMetadata {
				albumMetas = append(albumMetas, meta)

				if i == len(allMetadata)-1 || allMetadata[i+1].AlbumID != meta.AlbumID {
					contentEntities = append(
						contentEntities,
						fuse_entities.NewGroupedPlaylistEntity(albumMetas),
					)
					if albumMetas[0].IsRecent() {
						contentEntities = append(
							contentEntities,
							fuse_entities.NewRecentPlaylistEntity(albumMetas),
						)
					}
					albumMetas = albumMetas[:0]
				}
			}

			logProgress(fuseSync.SyncContentChan(contentEntities))
		}

		// sync covers
		{
			logInfo("GetFuseCovers query started")
			coverDatas, err := queries.GetAllFuseCovers(ctx)
			if err != nil {
				logError(fmt.Errorf("Unable to fetch covers metadata: %w", err))
				return
			}
			logInfo("GetFuseCovers query success")

			thumbnailStorage := deps.ThumbnailStorage()
			contentEntities := make([]sync.ContentEntity, len(coverDatas), len(coverDatas))
			for i, coverData := range coverDatas {
				contentEntities[i] = fuse_entities.NewFuseCoverEntity(thumbnailStorage, coverData)
			}

			logProgress(fuseSync.SyncContentChan(contentEntities))
		}

		for _, errText := range allErrors {
			logInfo(errText)
		}

		redisPipe.SwapDB(ctx, config.FSPrimaryDBIndex, config.FSSecondaryDBIndex)
		if _, err := redisPipe.Exec(ctx); err != nil {
			logError(fmt.Errorf("redis pipeline exec error: %w", err))
		}
	}()
	return logChan
}
