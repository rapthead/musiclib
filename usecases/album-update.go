package usecases

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/go-redis/redis/v8"
	"github.com/gofrs/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/models/fuse_entities"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
)

type UpdateAlbumDeps interface {
	RedisClient() *redis.Client
	SQLXClient() *sqlx.DB
	Queries() *persistance.Queries
	ThumbnailStorage() coverstorage.ThumbnailStorage
}

type UpdateAlbumParams struct {
	Album        models.Album
	Tracks       []models.Track
	Covers       []models.Cover
	NewCovers    []models.Cover
	DeleteCovers []uuid.UUID

	Releases       []models.Release
	NewRelease     *models.Release
	DeleteReleases []uuid.UUID
}

func UpdateAlbum(deps UpdateAlbumDeps, ctx context.Context, params UpdateAlbumParams) error {
	conf := config.Config

	tx, err := deps.SQLXClient().BeginTxx(ctx, &sql.TxOptions{})
	if err != nil {
		return fmt.Errorf("Can't start transaction: %w", err)
	}
	txQueries := deps.Queries().WithTx(tx)

	rdb := deps.RedisClient()
	redisTXPipe := rdb.TxPipeline()
	fuseStore := store.NewFuseStore(redisTXPipe)

	fuseSync := sync.NewFuseSync(conf.MusiclibRoot, store.NewFuseStore(redisTXPipe))

	err = func() error {
		album := params.Album

		// remove old fuse data
		{
			metas, err := txQueries.GetAlbumMetadata(ctx, album.ID)
			if err != nil {
				return fmt.Errorf("Unable to fetch album metas: %w", err)
			}

			if len(metas) > 0 {
				fuseStore.RemovePath(ctx, models.PlaylistFusePath(metas[0]))
				for _, meta := range metas {
					fuseStore.RemovePath(ctx, models.FlacFusePath(meta))
				}
			}

			fuseCovers, err := txQueries.GetAlbumFuseCovers(ctx, album.ID)
			if err != nil {
				return fmt.Errorf("Unable to fetch album covers: %w", err)
			}

			for _, fuseCover := range fuseCovers {
				fuseStore.RemovePath(ctx, models.CoverFusePath(fuseCover))
			}
		}

		if album.State != models.AlbumStateEnumDraft && album.DraftArtist != "" {
			artist, err := txQueries.InsertOrGetArtist(ctx, album.DraftArtist)
			if err != nil {
				return fmt.Errorf("Unable to insert or get artist: %w", err)
			}
			album.ArtistID = uuid.NullUUID{UUID: artist.ID, Valid: true}
			album.DraftArtist = ""
		}

		err := txQueries.UpdateAlbum(ctx, album)
		if err != nil {
			return fmt.Errorf("Unable to update album: %w", err)
		}

		for _, track := range params.Tracks {
			err = txQueries.UpdateTrack(ctx, track)
			if err != nil {
				return fmt.Errorf("Unable to update track: %w", err)
			}
		}

		// covers processing {
		for _, cover := range params.Covers {
			err = txQueries.UpdateCover(ctx, cover)
			if err != nil {
				return fmt.Errorf("Unable to update cover: %w", err)
			}
		}

		for _, cover := range params.NewCovers {
			err = txQueries.InsertCover(ctx, cover)
			if err != nil {
				return fmt.Errorf("Unable to insert cover: %w", err)
			}
		}

		for _, coverID := range params.DeleteCovers {
			err = txQueries.DeleteCover(ctx, coverID)
			if err != nil {
				return fmt.Errorf("Unable to delete cover: %w", err)
			}
		}
		// covers processing }

		// release processing {
		for _, release := range params.Releases {
			err = txQueries.UpdateRelease(ctx, release)
			if err != nil {
				return fmt.Errorf("Unable to update release: %w", err)
			}
		}

		if params.NewRelease != nil {
			err = txQueries.InsertRelease(ctx, *params.NewRelease)
			if err != nil {
				return fmt.Errorf("Unable to insert release: %w", err)
			}
		}

		for _, releaseID := range params.DeleteReleases {
			err = txQueries.DeleteRelease(ctx, releaseID)
			if err != nil {
				return fmt.Errorf("Unable to delete release: %w", err)
			}
		}
		// release processing }

		err = txQueries.DeleteUnusedArtists(ctx)
		if err != nil {
			return fmt.Errorf("Unable to delete unused artists: %w", err)
		}

		// add new store data
		if album.State == models.AlbumStateEnumEnabled {
			{
				allMetadata, err := txQueries.GetAlbumMetadata(ctx, album.ID)
				if err != nil {
					return fmt.Errorf("Unable to fetch album metas: %w", err)
				}

				{
					flacEntities := make([]sync.FuseFlacEntity, len(allMetadata), len(allMetadata))
					for i, meta := range allMetadata {
						flacEntities[i] = fuse_entities.NewFuseFlacEntity(meta)
					}

					err := fuseSync.SyncFlacs(flacEntities)
					if err != nil {
						return err
					}
				}

				{
					err := fuseSync.SyncContent([]sync.ContentEntity{
						fuse_entities.NewPlaylistEntity(allMetadata),
					})
					if err != nil {
						return err
					}
				}
			}

			{
				coverDatas, err := txQueries.GetAlbumFuseCovers(ctx, album.ID)
				if err != nil {
					return fmt.Errorf("Unable to fetch album covers: %w", err)
				}

				contentEntities := make([]sync.ContentEntity, len(coverDatas), len(coverDatas))
				for i, coverData := range coverDatas {
					contentEntities[i] = fuse_entities.NewFuseCoverEntity(deps.ThumbnailStorage(), coverData)
				}

				err = fuseSync.SyncContent(contentEntities)
				if err != nil {
					return err
				}
			}
		}

		return nil
	}()

	if err != nil {
		tx.Rollback()
		redisTXPipe.Discard()
		return err
	} else {
		if err = tx.Commit(); err != nil {
			return fmt.Errorf("Unable to commit postgres transaction: %w", err)
		}
		if _, err = redisTXPipe.Exec(ctx); err != nil {
			return fmt.Errorf("Unable to commit redis transaction: %w", err)
		}
		return nil
	}
}
