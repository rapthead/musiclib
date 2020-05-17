package usecases

import (
	"context"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance2"
)

type GetDraftAlbumDetailsDeps interface {
	Queries2() *persistance2.Queries
}

type DraftAlbumDetails struct {
	Artist      *models.Artist
	DraftAlbum  models.DraftAlbum
	DraftTracks []models.DraftTrack
}

func GetDraftAlbumDetails(dep GetDraftAlbumDetailsDeps, ctx context.Context, id uuid.UUID) (DraftAlbumDetails, error) {
	queries := dep.Queries2()
	result := DraftAlbumDetails{}

	album, err := queries.GetDraftAlbumByID(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch album: %w", err)
	}
	result.DraftAlbum = album

	if album.ArtistID.Valid {
		artist, err := queries.GetArtistById(ctx, album.ArtistID.UUID)
		if err != nil {
			return result, fmt.Errorf("Unable to fetch artist: %w", err)
		}
		result.Artist = &artist
	}

	draftTracks, err := queries.GetDraftTracksByAlbumID(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch tracks: %w", err)
	}
	result.DraftTracks = draftTracks

	return result, nil
}
