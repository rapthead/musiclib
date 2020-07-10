package usecases

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
)

type UpdateAlbumDeps interface {
	SQLXClient() *sqlx.DB
	Queries() *persistance.Queries
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
	tx, err := deps.SQLXClient().BeginTxx(ctx, &sql.TxOptions{})
	if err != nil {
		return fmt.Errorf("Can't start transaction: %w", err)
	}
	txQueries := deps.Queries().WithTx(tx)

	err = func() error {
		album := params.Album

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
		return nil
	}()

	if err != nil {
		tx.Rollback()
		return err
	} else if err = tx.Commit(); err != nil {
		return fmt.Errorf("Unable to commit transaction: %w", err)
	} else {
		return nil
	}
}
