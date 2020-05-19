package usecases

import (
	"context"
	"log"

	"github.com/rapthead/musiclib/persistance"
)

type ListAlbumsDeps interface {
	Queries() *persistance.Queries
}

func ListAlbums(deps ListAlbumsDeps, ctx context.Context) []persistance.ListAlbumsRow {
	queries := deps.Queries()
	albums, err := queries.ListAlbums(ctx)
	if err != nil {
		log.Fatal("Unable to fetch albums list:", err)
	}
	return albums
}
