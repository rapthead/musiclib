package usecases

import (
	"context"
	"fmt"

	"github.com/go-redis/redis/v8"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
	"github.com/rapthead/musiclib/thumbnailer"
)

type SyncDeps interface {
	RedisClient() *redis.Client
	Queries() *persistance.Queries

	CoversStorage() coverstorage.FSCoverStorage
	Thumbnailer() thumbnailer.Thumbnailer
}

type FuseEntity struct {
	OriginPath     string      `json:"originPath"`
	FusePath       string      `json:"fusePath"`
	VorbisComments [][2]string `json:"vorbisComments"`
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
		redisPipe.Select(ctx, 1)
		redisPipe.FlushDB(ctx)

		var allErrors []string

		// sync flac files
		{
			logInfo("GetAllMetadata query started")
			allMetadata, err := queries.GetAllMetadata(ctx)
			if err != nil {
				logError(fmt.Errorf("Unable to fetch metadata: %w", err))
				return
			}

			flacEntities := make([]sync.FuseFlacEntity, len(allMetadata), len(allMetadata))
			for i, meta := range allMetadata {
				flacEntities[i] = meta
			}

			progressChan := sync.SyncFlacs(conf.MusiclibRoot, store.NewFuseStore(redisPipe), flacEntities)
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

		// sync covers
		{
			logInfo("GetFuseCovers query started")
			coverDatas, err := queries.GetFuseCovers(ctx)
			if err != nil {
				logError(fmt.Errorf("Unable to fetch metadata: %w", err))
				return
			}
			logInfo("GetFuseCovers query success")

			coverEntities := make([]sync.FuseCoverEntity, len(coverDatas), len(coverDatas))
			for i, coverData := range coverDatas {
				coverEntities[i] = coverData
			}

			progressChan := sync.SyncCovers(
				deps.CoversStorage(),
				deps.Thumbnailer(),
				store.NewFuseStore(redisPipe),
				coverEntities,
			)
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

		for _, errText := range allErrors {
			logInfo(errText)
		}

		redisPipe.SwapDB(ctx, 0, 1)
		if _, err := redisPipe.Exec(ctx); err != nil {
			logError(fmt.Errorf("redis pipeline exec error: %w", err))
		}
	}()
	return logChan
}
