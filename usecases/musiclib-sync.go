package usecases

import (
	"context"
	"fmt"
	"strconv"
	"strings"
	"time"

	"github.com/go-redis/redis/v8"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
	"github.com/rapthead/musiclib/utils"
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
						fusePath:  FuseFlacEntity{meta}.GroupingPlaylistFusePath(),
						itemPaths: []string{},
					}
					currentPlaylist = &nextPlaylist
					contentEntities = append(contentEntities, &nextPlaylist)
				}
				currentPlaylist.itemPaths = append(
					currentPlaylist.itemPaths, strings.Repeat("../", 3)+FuseFlacEntity{meta}.FusePath(),
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

func (e FuseCoverEntity) FusePath() string {
	return models.CoverFusePath(e.m)
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

func (e FuseFlacEntity) CTime() time.Time {
	return e.m.CreatedAt
}

func (e FuseFlacEntity) MTime() time.Time {
	return e.m.UpdatedAt
}

func (e FuseFlacEntity) OriginPath() string {
	return e.m.OriginalFilename
}

func (e FuseFlacEntity) VorbisComments() [][2]string {
	vorbisComments := [][2]string{
		{"SORTALBUMARTIST", e.m.SortAlbumArtist()},
		{"ALBUMARTIST", e.m.AlbumArtist},
		{"ARTIST", utils.StrCoalesce(e.m.TrackArtist, e.m.AlbumArtist)},
		{"DATE", e.m.Date("/")},
		{"ORIGINALDATE", strconv.FormatInt(e.m.OriginalYear, 10)},
		{"ALBUM", e.m.AlbumTitle + e.m.AlbumSuffix()},
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

func (e FuseFlacEntity) GroupingPlaylistFusePath() string {
	return models.PlaylistFusePath(e.m)
}

func (e FuseFlacEntity) FusePath() string {
	return models.FlacFusePath(e.m)
}
