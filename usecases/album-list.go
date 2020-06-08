package usecases

import (
	"context"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
)

type ListAlbumsDeps interface {
	Queries() *persistance.Queries
}

type ListAlbumItem struct {
	Album  models.Album
	Artist models.Artist
}

func ListAlbums(deps ListDraftAlbumsDeps, ctx context.Context) ([]ListAlbumItem, error) {
	queries := deps.Queries()
	albums, err := queries.ListAlbums(ctx)
	if err != nil {
		return []ListAlbumItem{}, fmt.Errorf("Unable to fetch albums list: %w", err)
	}

	artists, err := queries.ListArtists(ctx)
	if err != nil {
		return []ListAlbumItem{}, fmt.Errorf("Unable to fetch album artists: %w", err)
	}

	artistsById := make(map[uuid.UUID]models.Artist)
	for _, artist := range artists {
		artistsById[artist.ID] = artist
	}

	result := make([]ListAlbumItem, len(albums), len(albums))
	for i, album := range albums {
		if artist, ok := artistsById[album.ArtistID]; ok {
			result[i] = ListAlbumItem{
				Album:  album,
				Artist: artist,
			}
		} else {
			return result, fmt.Errorf("Assertion error. Not found artist for album: %s", album.Title)
		}
	}

	return result, nil
}
