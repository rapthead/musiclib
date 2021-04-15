package usecases

import (
	"context"
	"errors"
	"fmt"

	"github.com/go-redis/redis/v8"
	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/models/fuse_entities"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
)

type AlbumFuseSyncDeps interface{}

type AlbumFuseSync struct {
	ctx              context.Context
	queries          *persistance.Queries
	fuseSync         sync.FuseSync
	thumbnailStorage coverstorage.ThumbnailStorage
}

func NewAlbumFuseSync(
	ctx context.Context,
	queries *persistance.Queries,
	rdb *redis.Client,
	thumbnailStorage coverstorage.ThumbnailStorage,
) (AlbumFuseSync, error) {
	rdbConn := rdb.Conn(ctx)
	if err := rdbConn.Select(ctx, config.FSPrimaryDBIndex).Err(); err != nil {
		return AlbumFuseSync{}, fmt.Errorf("can't select primary redis db %w", err)
	}

	conf := config.Config
	return AlbumFuseSync{
		ctx,
		queries,
		sync.NewFuseSync(conf.MusiclibRoot, store.NewFuseStore(rdbConn)),
		thumbnailStorage,
	}, nil
}

func (a AlbumFuseSync) RemoveOldFuseData(albumID uuid.UUID) error {
	metas, err := a.queries.GetAlbumMetadata(a.ctx, albumID)
	if err != nil {
		return fmt.Errorf("Unable to fetch album metas: %w", err)
	}

	if len(metas) > 0 {
		a.fuseSync.RemovePath(models.GroupedPlaylistFusePath(metas[0]))
		a.fuseSync.RemovePath(models.RecentPlaylistFusePath(metas[0]))
		for _, meta := range metas {
			a.fuseSync.RemovePath(models.FlacFusePath(meta))
		}
	}

	fuseCovers, err := a.queries.GetAlbumFuseCovers(a.ctx, albumID)
	if err != nil {
		return fmt.Errorf("Unable to fetch album covers: %w", err)
	}

	for _, fuseCover := range fuseCovers {
		a.fuseSync.RemovePath(models.CoverFusePath(fuseCover))
	}
	return nil
}

func (a AlbumFuseSync) MakeNewFuseData(albumID uuid.UUID) error {
	{
		allMetadata, err := a.queries.GetAlbumMetadata(a.ctx, albumID)
		if err != nil {
			return fmt.Errorf("Unable to fetch album metas: %w", err)
		}

		if len(allMetadata) == 0 {
			return errors.New("album has no tracks!")
		}

		{
			flacEntities := make([]sync.FuseFlacEntity, len(allMetadata), len(allMetadata))
			for i, meta := range allMetadata {
				flacEntities[i] = fuse_entities.NewFuseFlacEntity(meta)
			}

			err := a.fuseSync.SyncFlacs(flacEntities)
			if err != nil {
				return err
			}
		}

		{
			err := a.fuseSync.SyncContent([]sync.ContentEntity{
				fuse_entities.NewGroupedPlaylistEntity(allMetadata),
			})
			if err != nil {
				return err
			}
		}

		if allMetadata[0].IsRecent() {
			err := a.fuseSync.SyncContent([]sync.ContentEntity{
				fuse_entities.NewRecentPlaylistEntity(allMetadata),
			})
			if err != nil {
				return err
			}
		}
	}

	{
		coverDatas, err := a.queries.GetAlbumFuseCovers(a.ctx, albumID)
		if err != nil {
			return fmt.Errorf("Unable to fetch album covers: %w", err)
		}

		contentEntities := make([]sync.ContentEntity, len(coverDatas), len(coverDatas))
		for i, coverData := range coverDatas {
			contentEntities[i] = fuse_entities.NewFuseCoverEntity(a.thumbnailStorage, coverData)
		}

		err = a.fuseSync.SyncContent(contentEntities)
		if err != nil {
			return err
		}
	}
	return nil
}
