package usecases

import (
	"context"
	"fmt"
	"log"
	"strconv"
	"strings"

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
		fusePathDirname := fmt.Sprintf(
			"%s–%d–%s",
			meta.AlbumArtistName,
			meta.Year,
			meta.AlbumTitle,
		)
		fusePathBaseName := fmt.Sprintf(
			"%02d-%s.flac",
			meta.TrackNumber,
			meta.TrackTitle,
		)

		replacer := strings.NewReplacer(
			"<", "_",
			">", "_",
			":", "_",
			"\"", "_",
			"/", "_",
			"\\", "_",
			"|", "_",
			"?", "_",
			"*", "_",
			",", "_",
		)
		fusePath := replacer.Replace(fusePathDirname) + "/" + replacer.Replace(fusePathBaseName)

		artistTag := meta.AlbumArtistName
		if meta.TrackArtistName.Valid {
			artistTag = meta.TrackArtistName.String
		}

		vorbisComments := [][2]string{
			{"ALBUMARTIST", meta.AlbumArtistName},
			{"ARTIST", artistTag},
			{"DATE", strconv.Itoa(int(meta.Year))},
			{"ALBUM", meta.AlbumTitle},
			{"TITLE", meta.TrackTitle},
			{"TRACKNUMBER", fmt.Sprintf("%02d", meta.TrackNumber)},

			{"REPLAYGAIN_REFERENCE_LOUDNESS", "89.0 dB"},
			{"REPLAYGAIN_ALBUM_GAIN", fmt.Sprintf("%.2f dB", meta.AlbumRgGain)},
			{"REPLAYGAIN_ALBUM_PEAK", fmt.Sprintf("%.8f", meta.AlbumRgPeak)},

			{"REPLAYGAIN_TRACK_GAIN", fmt.Sprintf("%.2f dB", meta.TrackRgGain)},
			{"REPLAYGAIN_TRACK_PEAK", fmt.Sprintf("%.8f", meta.TrackRgPeak)},

			// CATALOGNUMBER=REBL021
			// DATE=2017
			// DISCNUMBER=1
			// GENRE=Ska
			// GENRE=Punk
			// LABEL=Rebel Alliance Recordings
			// MEDIA=CD
			// DISCTOTAL=1
			// TRACKTOTAL=8
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
