package usecases

import (
	"context"
	"fmt"
	"log"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
)

const (
	doRefreshChannel = "fuse-refresh"
)

type RefreshDeps interface {
	RedisClient() *redis.Client
	Queries() *persistance.Queries
}

type FuseEntity struct {
	OriginPath     string      `json:"originPath"`
	FusePath       string      `json:"fusePath"`
	VorbisComments [][2]string `json:"vorbisComments"`
}

func Refresh(deps RefreshDeps, ctx context.Context) {
	rdb := deps.RedisClient()
	queries := deps.Queries()
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

	// log.Println(fuseEntities)
	progressChan := sync.Sync(conf.MusiclibRoot, store.NewFuseStore(redisPipe), fuseEntities)
	var allErrors []string
	for pi := range progressChan {
		if pi.Error != nil {
			errorText := fmt.Sprintf("sync error: %s", pi.Error)
			allErrors = append(allErrors, errorText)
			log.Println(errorText)
		} else {
			log.Printf("process %d of %d: %s", pi.Current, pi.Total, pi.Path)
		}
	}

	for _, errText := range allErrors {
		log.Println(errText)
	}

	if _, err := redisPipe.Exec(); err != nil {
		log.Fatal("redis pipeline exec error:", err)
	}
}
