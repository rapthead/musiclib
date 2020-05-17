package usecases

import (
	"context"
	"fmt"

	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance2"
)

type ListDraftAlbumsDeps interface {
	Queries2() *persistance2.Queries
}

func ListDraftAlbums(deps ListDraftAlbumsDeps, ctx context.Context) ([]models.DraftAlbum, error) {
	queries := deps.Queries2()
	draftAlbums, err := queries.ListDraftAlbums(ctx)
	if draftAlbums == nil {
		draftAlbums = []models.DraftAlbum{}
	}
	if err != nil {
		return draftAlbums, fmt.Errorf("Unable to fetch draft albums list: %w", err)
	}
	return draftAlbums, nil
}
