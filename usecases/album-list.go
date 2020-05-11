package usecases

import (
	"context"
	"log"

	"github.com/rapthead/musiclib/persistance"
)

func ListAlbums(ctx context.Context) []persistance.ListAlbumsRow {
	albums, err := queries.ListAlbums(ctx)
	if err != nil {
		log.Fatal("Unable to fetch albums list:", err)
	}
	return albums
}
