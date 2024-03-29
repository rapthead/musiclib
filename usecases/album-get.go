package usecases

import (
	"context"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
)

type GetAlbumDetailsDeps interface {
	Queries() *persistance.Queries
}

type AlbumDetails struct {
	AllArtists  []models.Artist
	AllLabels   []string
	ReleaseInfo []models.Release
	Album       models.Album
	Tracks      []models.Track
	Covers      []models.Cover
}

func GetAlbumDetails(dep GetAlbumDetailsDeps, ctx context.Context, id uuid.UUID) (AlbumDetails, error) {
	queries := dep.Queries()
	result := AlbumDetails{}

	album, err := queries.GetAlbumByID(ctx, id)
	if err != nil {
		if err == persistance.AlbumNotFound {
			return result, err
		} else {
			return result, fmt.Errorf("Unable to fetch album: %w", err)
		}
	}
	result.Album = album

	artists, err := queries.ListArtists(ctx)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch artist: %w", err)
	}
	result.AllArtists = artists

	labels, err := queries.ListLabels(ctx)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch labels: %w", err)
	}
	result.AllLabels = labels

	draftTracks, err := queries.GetTracksByAlbumID(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch tracks: %w", err)
	}
	result.Tracks = draftTracks

	draftCovers, err := queries.GetCoversByAlbumID(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch covers: %w", err)
	}
	result.Covers = draftCovers

	releaseInfo, err := queries.GetReleaseByAlbumID(ctx, id)
	if err != nil {
		return result, fmt.Errorf("Unable to fetch release info: %w", err)
	}
	result.ReleaseInfo = releaseInfo

	return result, nil
}
