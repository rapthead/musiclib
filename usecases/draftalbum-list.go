package usecases

import (
	"context"
	"fmt"

	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
)

type ListDraftAlbumsDeps interface {
	Queries() *persistance.Queries
}

func ListDraftAlbums(deps ListDraftAlbumsDeps, ctx context.Context) ([]models.DraftAlbum, error) {
	queries := deps.Queries()
	draftAlbums, err := queries.ListDraftAlbums(ctx)
	if draftAlbums == nil {
		draftAlbums = []models.DraftAlbum{}
	}
	if err != nil {
		return draftAlbums, fmt.Errorf("Unable to fetch draft albums list: %w", err)
	}
	return draftAlbums, nil
}
