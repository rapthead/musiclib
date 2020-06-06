package usecases

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/persistance"
)

type CommitDraftAlbumDeps interface {
	SQLXClient() *sqlx.DB
	Queries() *persistance.Queries
}

func CommitDraftAlbum(deps CommitDraftAlbumDeps, ctx context.Context, id uuid.UUID) error {
	tx, err := deps.SQLXClient().BeginTxx(ctx, &sql.TxOptions{})
	if err != nil {
		return fmt.Errorf("Can't start transaction: %w", err)
	}
	txQueries := deps.Queries().WithTx(tx)

	err = func() error {
		err = txQueries.CommitDraftAlbumByID(ctx, id)
		if err != nil {
			return fmt.Errorf("Unable to commit album: %w", err)
		}

		err = txQueries.CommitDraftTracksByAlbumID(ctx, id)
		if err != nil {
			return fmt.Errorf("Unable to commit tracks: %w", err)
		}

		err = txQueries.CommitDraftCoversByAlbumID(ctx, id)
		if err != nil {
			return fmt.Errorf("Unable to commit covers: %w", err)
		}

		err = txQueries.DeleteDraftAlbumByID(ctx, id)
		if err != nil {
			return fmt.Errorf("Unable to delete draft album: %w", err)
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
