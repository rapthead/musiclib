package usecases

import (
	"context"
	"fmt"
	"strconv"
	"strings"
	"unicode"

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

func strCoalesce(strs ...string) string {
	for _, str := range strs {
		if str != "" {
			return str
		}
	}
	return ""
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
			sortAlbumArtist := strings.TrimPrefix(meta.AlbumArtist, "The ")
			firstArtistChar := unicode.ToLower([]rune(sortAlbumArtist)[0])
			if (firstArtistChar >= '\u0430' && firstArtistChar <= '\u044F') || // is russian
				(firstArtistChar >= '\u0061' && firstArtistChar <= '\u007A') { // is latin
			} else {
				firstArtistChar = '#'
			}

			pathParts := []string{
				string(firstArtistChar),
				meta.AlbumArtist,
			}

			var date string
			if meta.ReleaseYear.Valid &&
				meta.OriginalYear != meta.ReleaseYear.Int64 {
				pathParts = append(pathParts, fmt.Sprintf(
					"%d-%d-%s",
					meta.OriginalYear,
					meta.ReleaseYear.Int64,
					meta.AlbumTitle,
				))
				date = fmt.Sprintf(
					"%d/%d",
					meta.OriginalYear,
					meta.ReleaseYear.Int64,
				)
			} else {
				pathParts = append(pathParts, fmt.Sprintf(
					"%d-%s",
					meta.OriginalYear,
					meta.AlbumTitle,
				))
				date = strconv.FormatInt(meta.OriginalYear, 10)
			}

			if meta.DiscTotal != 1 {
				pathParts = append(pathParts, fmt.Sprintf(
					"cd%d/",
					meta.DiscTotal,
				))
			}

			pathParts = append(pathParts, fmt.Sprintf(
				"%02d-%s.flac",
				meta.TrackNumber,
				meta.TrackTitle,
			))

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
			fusePath := ""
			for _, pathPart := range pathParts {
				fusePath = fusePath + "/" + replacer.Replace(pathPart)
			}
			fusePath = strings.TrimPrefix(fusePath, "/")

			var albumSuffix string
			if meta.EditionTitle != "" && meta.EditionTitle != "Original Release" {
				albumSuffix = " ◆ " + meta.EditionTitle
			}

			vorbisComments := [][2]string{
				{"SORTALBUMARTIST", sortAlbumArtist},
				{"ALBUMARTIST", meta.AlbumArtist},
				{"ARTIST", meta.TrackArtist},
				{"DATE", date},
				{"ORIGINALDATE", strconv.FormatInt(meta.OriginalYear, 10)},
				{"ALBUM", meta.AlbumTitle + albumSuffix},
				{"TITLE", meta.TrackTitle},
				{"RELEASETYPE", string(meta.ReleaseType)},

				{"DISCNUMBER", fmt.Sprintf("%02d", meta.DiscNumber)},
				{"DISCTOTAL", fmt.Sprintf("%d", meta.DiscTotal)},

				{"TRACKNUMBER", fmt.Sprintf("%02d", meta.TrackNumber)},
				{"TRACKTOTAL", fmt.Sprintf("%02d", meta.TrackTotal)},

				{"REPLAYGAIN_REFERENCE_LOUDNESS", "89.0 dB"},
				{"REPLAYGAIN_ALBUM_GAIN", fmt.Sprintf("%.2f dB", meta.ReplayGainAlbumGain)},
				{"REPLAYGAIN_ALBUM_PEAK", fmt.Sprintf("%.8f", meta.ReplayGainAlbumPeak)},

				{"REPLAYGAIN_TRACK_GAIN", fmt.Sprintf("%.2f dB", meta.ReplayGainTrackGain)},
				{"REPLAYGAIN_TRACK_PEAK", fmt.Sprintf("%.8f", meta.ReplayGainTrackPeak)},

				{"ORIGINALFILENAME", meta.OriginalFilename},

				// CATALOGNUMBER=REBL021
				// DATE=2017
				// GENRE=Ska
				// GENRE=Punk
				// LABEL=Rebel Alliance Recordings
				// MEDIA=CD
				// TRACKTOTAL=8
			}
			fuseEntities[i] = sync.FuseEntity{
				OriginPath:     meta.OriginalFilename,
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
