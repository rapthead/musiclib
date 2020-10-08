package usecases

import (
	"context"
	"fmt"
	"strconv"
	"strings"
	"time"
	"unicode"

	"github.com/go-redis/redis/v8"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
)

type SyncDeps interface {
	RedisClient() *redis.Client
	Queries() *persistance.Queries

	CoversStorage() coverstorage.FSCoverStorage
	ThumbnailStorage() coverstorage.ThumbnailStorage
}

func Sync(deps SyncDeps, ctx context.Context) <-chan LogEvent {
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
		redisPipe := rdb.Pipeline()
		redisPipe.Select(ctx, config.FSSecondaryDBIndex)
		redisPipe.FlushDB(ctx)

		var allErrors []string

		logProgress := func(progressChan <-chan sync.ProgressInfo) {
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
		}

		// sync flac files
		{
			logInfo("GetAllMetadata query started")
			allMetadata, err := queries.GetAllMetadata(ctx)
			if err != nil {
				logError(fmt.Errorf("Unable to fetch metadata: %w", err))
				return
			}
			logInfo("GetAllMetadata query success")

			flacEntities := make([]sync.FuseFlacEntity, len(allMetadata), len(allMetadata))
			for i, meta := range allMetadata {
				flacEntities[i] = FuseFlacEntity{meta}
			}

			logProgress(sync.SyncFlacs(conf.MusiclibRoot, store.NewFuseStore(redisPipe), flacEntities))

			contentEntities := []sync.ContentEntity{}
			var currentPlaylist *PlaylistEntity
			for i, meta := range allMetadata {
				if i == 0 || allMetadata[i-1].AlbumID != meta.AlbumID {
					nextPlaylist := PlaylistEntity{
						fusePath:  FuseFlacEntity{meta}.groupingPlaylistFusePath(),
						itemPaths: []string{},
					}
					currentPlaylist = &nextPlaylist
					contentEntities = append(contentEntities, &nextPlaylist)
				}
				currentPlaylist.itemPaths = append(
					currentPlaylist.itemPaths, strings.Repeat("../", 4)+FuseFlacEntity{meta}.FusePath(),
				)
			}

			logProgress(sync.SyncContent(
				store.NewFuseStore(redisPipe),
				contentEntities,
			))
		}

		// sync covers
		{
			logInfo("GetFuseCovers query started")
			coverDatas, err := queries.GetFuseCovers(ctx)
			if err != nil {
				logError(fmt.Errorf("Unable to fetch metadata: %w", err))
				return
			}
			logInfo("GetFuseCovers query success")

			thumbnailStorage := deps.ThumbnailStorage()
			contentEntities := make([]sync.ContentEntity, len(coverDatas), len(coverDatas))
			for i, coverData := range coverDatas {
				contentEntities[i] = FuseCoverEntity{coverData, thumbnailStorage}
			}

			logProgress(sync.SyncContent(
				store.NewFuseStore(redisPipe),
				contentEntities,
			))
		}

		for _, errText := range allErrors {
			logInfo(errText)
		}

		redisPipe.SwapDB(ctx, config.FSPrimaryDBIndex, config.FSSecondaryDBIndex)
		if _, err := redisPipe.Exec(ctx); err != nil {
			logError(fmt.Errorf("redis pipeline exec error: %w", err))
		}
	}()
	return logChan
}

var pathReplacer = strings.NewReplacer(
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

func albumPathParts(
	sortAlbumArtist string,
	albumArtist string,
	dashDate string,
	albumTitle string,
	albumSuffix string,
) []string {
	pathParts := []string{
		"albums",
		fmt.Sprintf(
			"%s–%s–%s%s",
			albumArtist,
			dashDate,
			albumTitle,
			albumSuffix,
		),
	}
	return pathParts
}

// файл-плейлист
type PlaylistEntity struct {
	fusePath  string
	itemPaths []string
}

func (e PlaylistEntity) FusePath() string {
	return e.fusePath
}

func (e PlaylistEntity) Content() ([]byte, error) {
	return []byte("#EXTM3U\n" + strings.Join(e.itemPaths, "\n")), nil
}

// обертка, реализующая создание файла-обложки
type FuseCoverEntity struct {
	m           models.FuseCover
	thumbnailer coverstorage.ThumbnailStorage
}

func (e FuseCoverEntity) sortAlbumArtist() string {
	meta := e.m
	return strings.TrimPrefix(meta.AlbumArtist, "The ")
}

func (e FuseCoverEntity) albumSuffix() string {
	meta := e.m
	var albumSuffix string
	if meta.EditionTitle != "" && meta.EditionTitle != "Original Release" {
		albumSuffix = " ◆ " + meta.EditionTitle
	}
	return albumSuffix
}

func (e FuseCoverEntity) date(delemiter string) string {
	meta := e.m
	if meta.ReleaseYear.Valid &&
		meta.OriginalYear != meta.ReleaseYear.Int64 {
		return fmt.Sprintf(
			"%d%s%d",
			meta.OriginalYear,
			delemiter,
			meta.ReleaseYear.Int64,
		)
	} else {
		return strconv.FormatInt(meta.OriginalYear, 10)
	}
}

func (e FuseCoverEntity) FusePath() string {
	meta := e.m
	return joinParts(
		append(
			albumPathParts(
				e.sortAlbumArtist(),
				meta.AlbumArtist,
				e.date("_"),
				meta.AlbumTitle,
				e.albumSuffix(),
			),
			"cover.jpeg",
		)...,
	)
}

func (e FuseCoverEntity) Content() ([]byte, error) {
	_, content, err := e.thumbnailer.Get(context.TODO(), e.m.CoverID, 300, 300)
	if err != nil {
		return content, fmt.Errorf("Thumbnail processing error: %w", err)
	}
	return content, nil
}

// обертка, реализующая интерфейс flac-файла
type FuseFlacEntity struct {
	m models.Metadata
}

func (e FuseFlacEntity) groupingPlaylistFusePath() string {
	firstArtistChar := unicode.ToLower([]rune(e.sortAlbumArtist())[0])
	if (firstArtistChar >= '\u0430' && firstArtistChar <= '\u044F') || // is russian
		(firstArtistChar >= '\u0061' && firstArtistChar <= '\u007A') { // is latin
	} else {
		firstArtistChar = '#'
	}

	return joinParts(
		"grouped",
		string(firstArtistChar),
		e.m.AlbumArtist,
		fmt.Sprintf(
			"%s-%s.m3u",
			e.date("-"),
			e.m.AlbumTitle,
		),
	)
}

func (e FuseFlacEntity) sortAlbumArtist() string {
	return strings.TrimPrefix(e.m.AlbumArtist, "The ")
}

func (e FuseFlacEntity) albumSuffix() string {
	var albumSuffix string
	if e.m.EditionTitle != "" && e.m.EditionTitle != "Original Release" {
		albumSuffix = " ◆ " + e.m.EditionTitle
	}
	return albumSuffix
}

func (e FuseFlacEntity) date(delemiter string) string {
	if e.m.ReleaseYear.Valid &&
		e.m.OriginalYear != e.m.ReleaseYear.Int64 {
		return fmt.Sprintf(
			"%d%s%d",
			e.m.OriginalYear,
			delemiter,
			e.m.ReleaseYear.Int64,
		)
	} else {
		return strconv.FormatInt(e.m.OriginalYear, 10)
	}
}

func (e FuseFlacEntity) CTime() time.Time {
	return e.m.CreatedAt
}

func (e FuseFlacEntity) MTime() time.Time {
	return e.m.UpdatedAt
}

func (e FuseFlacEntity) OriginPath() string {
	return e.m.OriginalFilename
}

func (e FuseFlacEntity) FusePath() string {
	pathParts := albumPathParts(
		e.sortAlbumArtist(),
		e.m.AlbumArtist,
		e.date("_"),
		e.m.AlbumTitle,
		e.albumSuffix(),
	)

	pathSuffix := fmt.Sprintf(
		"%02d-%s.flac",
		e.m.TrackNumber,
		e.m.TrackTitle,
	)
	if e.m.DiscTotal != 1 {
		pathParts = append(pathParts, fmt.Sprintf(
			"%d.%s",
			e.m.DiscNumber,
			pathSuffix,
		))
	} else {
		pathParts = append(pathParts, pathSuffix)
	}

	return joinParts(pathParts...)
}

func (e FuseFlacEntity) VorbisComments() [][2]string {
	var albumSuffix string
	if e.m.EditionTitle != "" && e.m.EditionTitle != "Original Release" {
		albumSuffix = " ◆ " + e.m.EditionTitle
	}

	vorbisComments := [][2]string{
		{"SORTALBUMARTIST", e.sortAlbumArtist()},
		{"ALBUMARTIST", e.m.AlbumArtist},
		{"ARTIST", strCoalesce(e.m.TrackArtist, e.m.AlbumArtist)},
		{"DATE", e.date("/")},
		{"ORIGINALDATE", strconv.FormatInt(e.m.OriginalYear, 10)},
		{"ALBUM", e.m.AlbumTitle + albumSuffix},
		{"TITLE", e.m.TrackTitle},
		{"RELEASETYPE", string(e.m.ReleaseType)},

		{"DISCNUMBER", fmt.Sprintf("%02d", e.m.DiscNumber)},
		{"DISCTOTAL", fmt.Sprintf("%d", e.m.DiscTotal)},

		{"TRACKNUMBER", fmt.Sprintf("%02d", e.m.TrackNumber)},
		{"TRACKTOTAL", fmt.Sprintf("%02d", e.m.TrackTotal)},

		{"REPLAYGAIN_REFERENCE_LOUDNESS", "89.0 dB"},
		{"REPLAYGAIN_ALBUM_GAIN", fmt.Sprintf("%.2f dB", e.m.ReplayGainAlbumGain)},
		{"REPLAYGAIN_ALBUM_PEAK", fmt.Sprintf("%.8f", e.m.ReplayGainAlbumPeak)},

		{"REPLAYGAIN_TRACK_GAIN", fmt.Sprintf("%.2f dB", e.m.ReplayGainTrackGain)},
		{"REPLAYGAIN_TRACK_PEAK", fmt.Sprintf("%.8f", e.m.ReplayGainTrackPeak)},

		{"ORIGINALFILENAME", e.m.OriginalFilename},

		// CATALOGNUMBER=REBL021
		// GENRE=Ska
		// GENRE=Punk
		// MEDIA=CD
	}
	for _, label := range e.m.Labels {
		vorbisComments = append(vorbisComments, [2]string{
			"LABEL", label,
		})
	}
	return vorbisComments
}

func strCoalesce(strs ...string) string {
	for _, str := range strs {
		if str != "" {
			return str
		}
	}
	return ""
}

func joinParts(pathParts ...string) string {
	fusePath := ""
	for _, pathPart := range pathParts {
		fusePath = fusePath + "/" + pathReplacer.Replace(pathPart)
	}
	fusePath = strings.TrimPrefix(fusePath, "/")
	return fusePath
}
