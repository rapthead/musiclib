package usecases

import (
	"context"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/persistance"
)

type DeleteDraftAlbumDeps interface {
	Queries() *persistance.Queries
	CoversStorage() coverstorage.FSCoverStorage
}

func DeleteDraftAlbum(dep DeleteDraftAlbumDeps, ctx context.Context, id uuid.UUID) error {
	coversStorage := dep.CoversStorage()
	queries := dep.Queries()

	covers, err := queries.GetDraftCoversByAlbumID(ctx, id)
	if err != nil {
		return fmt.Errorf("Unable to fetch covers: %w", err)
	}

	for _, cover := range covers {
		coversStorage.Delete(cover.ID)
	}

	err = queries.DeleteDraftAlbumByID(ctx, id)
	if err != nil {
		if err == persistance.DraftAlbumNotFound {
			return err
		} else {
			return fmt.Errorf("Unable to delete draft album: %w", err)
		}
	}
	return nil
}
