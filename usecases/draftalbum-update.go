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

type UpdateDraftAlbumDeps interface {
	SQLXClient() *sqlx.DB
	Queries() *persistance.Queries
}

type UpdateDraftAlbumParams struct {
	Album        models.DraftAlbum   `schema:"album"`
	Tracks       []models.DraftTrack `schema:"tracks"`
	Covers       []models.DraftCover `schema:"covers"`
	NewCovers    []models.DraftCover `schema:"-"`
	DeleteCovers []uuid.UUID         `schema:"-"`
}

func UpdateDraftAlbum(deps UpdateDraftAlbumDeps, ctx context.Context, params UpdateDraftAlbumParams) error {
	tx, err := deps.SQLXClient().BeginTxx(ctx, &sql.TxOptions{})
	if err != nil {
		return fmt.Errorf("Can't start transaction: %w", err)
	}
	txQueries := deps.Queries().WithTx(tx)

	err = func() error {
		err := txQueries.UpdateDraftAlbum(ctx, params.Album)
		if err != nil {
			return fmt.Errorf("Unable to update album: %w", err)
		}

		for _, draftTrack := range params.Tracks {
			err = txQueries.UpdateDraftTrack(ctx, draftTrack)
			if err != nil {
				return fmt.Errorf("Unable to update track: %w", err)
			}
		}

		for _, draftCover := range params.Covers {
			err = txQueries.UpdateDraftCover(ctx, draftCover)
			if err != nil {
				return fmt.Errorf("Unable to update cover: %w", err)
			}
		}

		for _, draftCover := range params.NewCovers {
			err = txQueries.InsertDraftCover(ctx, draftCover)
			if err != nil {
				return fmt.Errorf("Unable to insert cover: %w", err)
			}
		}

		for _, coverID := range params.DeleteCovers {
			err = txQueries.DeleteDraftCover(ctx, coverID)
			if err != nil {
				return fmt.Errorf("Unable to delete cover: %w", err)
			}
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
