package usecases

import (
	"context"
	"log"

	"github.com/google/uuid"
	"github.com/rapthead/musiclib/persistance"
)

type AlbumDetails struct {
	Artist persistance.Artist
	Album  persistance.Album
	Tracks []persistance.Track
}

func GetAlbumDetails(ctx context.Context, id uuid.UUID) AlbumDetails {
	album, err := queries.GetCommitedAlbumByID(ctx, id)
	if err != nil {
		log.Fatal("Unable to fetch album:", err)
	}

	artist, err := queries.GetArtistById(ctx, id)
	if err != nil {
		log.Fatal("Unable to fetch album:", err)
	}

	tracks, err := queries.GetCommitedTracksByAlbumID(ctx, id)
	if err != nil {
		log.Fatal("Unable to fetch album tracks:", err)
	}

	return AlbumDetails{
		Artist: artist,
		Album:  album,
		Tracks: tracks,
	}
}
