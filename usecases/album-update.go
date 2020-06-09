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
	Artist       string
	Album        models.Album
	Tracks       []models.Track
	Covers       []models.Cover
	NewCovers    []models.Cover
	DeleteCovers []uuid.UUID
}

func UpdateAlbum(deps UpdateAlbumDeps, ctx context.Context, params UpdateAlbumParams) error {
	tx, err := deps.SQLXClient().BeginTxx(ctx, &sql.TxOptions{})
	if err != nil {
		return fmt.Errorf("Can't start transaction: %w", err)
	}
	txQueries := deps.Queries().WithTx(tx)

	err = func() error {
		err := txQueries.UpdateAlbum(ctx, params.Album, params.Artist)
		if err != nil {
			return fmt.Errorf("Unable to update album: %w", err)
		}

		for _, draftTrack := range params.Tracks {
			err = txQueries.UpdateTrack(ctx, draftTrack)
			if err != nil {
				return fmt.Errorf("Unable to update track: %w", err)
			}
		}

		for _, draftCover := range params.Covers {
			err = txQueries.UpdateCover(ctx, draftCover)
			if err != nil {
				return fmt.Errorf("Unable to update cover: %w", err)
			}
		}

		for _, draftCover := range params.NewCovers {
			err = txQueries.InsertCover(ctx, draftCover)
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
