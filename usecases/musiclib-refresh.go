package usecases

import (
	"context"
	"fmt"
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

func Refresh(deps RefreshDeps, ctx context.Context) <-chan LogEvent {
	rdb := deps.RedisClient()
	queries := deps.Queries()
	conf := config.Config

	logChan := make(chan LogEvent)
	logError := func(err error) {
		logChan <- LogEntry{
			err: err,
		}
	}
	logInfo := func(info string) {
		logChan <- LogEntry{
			info: info,
		}
	}

	go func() {
		defer close(logChan)
		logInfo("GetAllMetadata query started")
		allMetadata, err := queries.GetAllMetadata(ctx)
		if err != nil {
			logError(fmt.Errorf("Unable to fetch metadata: %w", err))
			return
		}

		fuseEntities := make([]sync.FuseEntity, len(allMetadata), len(allMetadata))
		for i, meta := range allMetadata {
			fusePathDirname := fmt.Sprintf(
				"%s–%s–%s",
				meta.ALBUMARTIST,
				meta.DATE,
				meta.ALBUM,
			)
			fusePathBaseName := fmt.Sprintf(
				"%02d-%s.flac",
				meta.TRACKNUMBER,
				meta.TITLE,
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
			fusePath := replacer.Replace(fusePathDirname) + "/"
			if meta.DISCTOTAL != 1 {
				fusePath = fusePath + fmt.Sprintf(
					"cd%d/",
					meta.DISCNUMBER,
				)
			}
			fusePath = fusePath + replacer.Replace(fusePathBaseName)

			vorbisComments := [][2]string{
				{"ALBUMARTIST", meta.ALBUMARTIST},
				{"ARTIST", meta.ARTIST},
				{"DATE", meta.DATE},
				{"ORIGINALDATE", meta.ORIGINALDATE},
				{"ALBUM", meta.ALBUM},
				{"TITLE", meta.TITLE},
				{"RELEASETYPE", string(meta.RELEASETYPE)},

				{"DISCNUMBER", fmt.Sprintf("%02d", meta.DISCNUMBER)},
				{"DISCTOTAL", fmt.Sprintf("%d", meta.DISCTOTAL)},

				{"TRACKNUMBER", fmt.Sprintf("%02d", meta.TRACKNUMBER)},
				{"TRACKTOTAL", fmt.Sprintf("%02d", meta.TRACKTOTAL)},

				{"REPLAYGAIN_REFERENCE_LOUDNESS", "89.0 dB"},
				{"REPLAYGAIN_ALBUM_GAIN", fmt.Sprintf("%.2f dB", meta.REPLAYGAIN_ALBUM_GAIN)},
				{"REPLAYGAIN_ALBUM_PEAK", fmt.Sprintf("%.8f", meta.REPLAYGAIN_ALBUM_PEAK)},

				{"REPLAYGAIN_TRACK_GAIN", fmt.Sprintf("%.2f dB", meta.REPLAYGAIN_TRACK_GAIN)},
				{"REPLAYGAIN_TRACK_PEAK", fmt.Sprintf("%.8f", meta.REPLAYGAIN_TRACK_PEAK)},

				{"ORIGINALFILENAME", meta.ORIGINALFILENAME},

				// CATALOGNUMBER=REBL021
				// DATE=2017
				// GENRE=Ska
				// GENRE=Punk
				// LABEL=Rebel Alliance Recordings
				// MEDIA=CD
				// TRACKTOTAL=8
			}
			fuseEntities[i] = sync.FuseEntity{
				OriginPath:     meta.ORIGINALFILENAME,
				FusePath:       fusePath,
				VorbisComments: vorbisComments,
			}
		}

		redisPipe := rdb.Pipeline()
		redisPipe.FlushDB()

		progressChan := sync.Sync(conf.MusiclibRoot, store.NewFuseStore(redisPipe), fuseEntities)
		var allErrors []string
		for pi := range progressChan {
			if pi.Error != nil {
				err := fmt.Errorf("sync error: %w", pi.Error)
				logError(err)
				allErrors = append(allErrors, err.Error())
			} else {
				logInfo(
					fmt.Sprintf("process %d of %d: %s", pi.Current, pi.Total, pi.Path),
				)
			}
		}

		for _, errText := range allErrors {
			logInfo(errText)
		}

		if _, err := redisPipe.Exec(); err != nil {
			logError(fmt.Errorf("redis pipeline exec error: %w", err))
		}
	}()
	return logChan
}
