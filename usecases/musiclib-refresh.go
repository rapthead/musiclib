package usecases

import (
	"context"
	"fmt"
	"log"

	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
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
	conf := config.Config

	allMetadata, err := queries.GetAllMetadata(ctx)
	if err != nil {
		log.Fatal("Unable to fetch metadata", err)
	}

	fuseEntities := make([]sync.FuseEntity, len(allMetadata), len(allMetadata))
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
		fuseEntities[i] = sync.FuseEntity{
			OriginPath:     meta.Path,
			FusePath:       fusePath,
			VorbisComments: vorbisComments,
		}
	}

	redisPipe := rdb.Pipeline()
	redisPipe.FlushDB()

	progressChan, errorChan := sync.Sync(conf.MusiclibRoot, store.NewFuseStore(redisPipe), fuseEntities)
	for {
		select {
		case pi := <-progressChan:
			log.Printf("process %d of %d: %s", pi.Current, pi.Total, pi.Path)
		case err := <-errorChan:
			log.Print("sync error:", err)
		}

		if progressChan == nil && errorChan == nil {
			break
		}
	}

	if _, err := redisPipe.Exec(); err != nil {
		log.Fatal("redis pipeline exec error", err)
	}
}
