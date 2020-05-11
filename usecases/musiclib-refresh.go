package usecases

import (
	"context"
	"fmt"
	"log"

	"github.com/rapthead/musiclib/pkg/fs/pubsub"
)

const (
	doRefreshChannel = "fuse-refresh"
)

type FuseEntity struct {
	OriginPath     string      `json:"originPath"`
	FusePath       string      `json:"fusePath"`
	VorbisComments [][2]string `json:"vorbisComments"`
}

func Refresh(ctx context.Context) {
	allMetadata, err := queries.GetAllMetadata(ctx)
	if err != nil {
		log.Fatal("Unable to fetch metadata", err)
	}

	fuseEntities := make([]pubsub.FuseEntity, len(allMetadata), len(allMetadata))
	for i, meta := range allMetadata {
		fusePath := fmt.Sprintf(
			"%s–%d–%s/%02d-%s.flac",
			meta.AlbumArtistName,
			meta.Year,
			meta.AlbumTitle,
			meta.TrackNumber,
			meta.TrackTitle,
		)

		artistTag := meta.AlbumArtistName
		if meta.TrackArtistName.Valid {
			artistTag = meta.TrackArtistName.String
		}

		vorbisComments := [][2]string{
			{"ALBUMARTIST", meta.AlbumArtistName},
			{"ARTIST", artistTag},
			{"DATE", string(meta.Year)},
			{"ALBUM", meta.AlbumTitle},
			{"TITLE", meta.TrackTitle},
			{"TRACKNUMBER", string(meta.TrackNumber)},
		}
		fuseEntities[i] = pubsub.FuseEntity{
			OriginPath:     meta.Path,
			FusePath:       fusePath,
			VorbisComments: vorbisComments,
		}
	}

	refreshPubSub.Pub(fuseEntities)
}
