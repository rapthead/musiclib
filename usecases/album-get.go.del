package usecases

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"github.com/rapthead/musiclib/persistance"
)

type GetAlbumDetailsDeps interface {
	Queries() persistance.Queries
}

type AlbumDetails struct {
	Artist persistance.Artist
	Album  persistance.Album
	Tracks []persistance.Track
}

func GetAlbumDetails(dep GetAlbumDetailsDeps, ctx context.Context, id uuid.UUID) (AlbumDetails, error) {
	queries := dep.Queries()

	result := AlbumDetails{}
	album, err := queries.GetCommitedAlbumByID(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch album: %w", err)
	}
	result.Album = album

	artist, err := queries.GetArtistById(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch artist: %w", err)
	}
	result.Artist = artist

	tracks, err := queries.GetCommitedTracksByAlbumID(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch tracks: %w", err)
	}
	result.Tracks = tracks

	return result, nil
}
