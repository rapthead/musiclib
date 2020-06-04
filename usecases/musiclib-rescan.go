package usecases

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/go-redis/redis/v7"
	"github.com/gofrs/uuid"
	"github.com/guregu/null/zero"
	"github.com/jmoiron/sqlx"
	"github.com/mewkiz/flac"
	"github.com/mewkiz/flac/meta"
	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/persistance"
)

type relPath string

type DraftData struct {
	Album  models.DraftAlbum
	Tracks map[relPath]models.DraftTrack
}

type FlacFileInfo struct {
	Seconds uint64
	Path    relPath
	Tags    [][2]string
}

type AlbumFilesInfo struct {
	RelPath    relPath
	TracksInfo map[relPath]FlacFileInfo
}

type Logger interface {
	Fatal(error)
	Error(error)
	Info(string)
}

type rescanCase struct {
	ctx    context.Context
	root   string
	logger Logger

	sqlxClient  *sqlx.DB
	redisClient *redis.Client
	queries     *persistance.Queries
}

func (r rescanCase) absToRel(absPath string) relPath {
	rel, err := filepath.Rel(r.root, absPath)
	if err != nil {
		r.logger.Fatal(fmt.Errorf("can't convert abs path to rel %w", err))
	}
	return relPath(rel)
}

func (r rescanCase) relToAbs(path relPath) string {
	return filepath.Join(r.root, string(path))
}

func (r rescanCase) processAlbumTags(albumTagsInfo AlbumFilesInfo) (DraftData, error) {
	pathComponents := strings.Split(string(albumTagsInfo.RelPath), string(os.PathSeparator))
	var downloadSource models.DownloadSourceEnum
	switch pathComponents[0] {
	case "my":
		downloadSource = models.DownloadSourceEnumMY
	case "what.cd":
		downloadSource = models.DownloadSourceEnumWHATCD
	case "waffles.fm":
		downloadSource = models.DownloadSourceEnumWAFFLESFM
	case "redacted.ch":
		downloadSource = models.DownloadSourceEnumREDACTEDCH
	case "bandcamp.com", "soundcloud.com":
		downloadSource = models.DownloadSourceEnumWEB
	default:
		return DraftData{}, fmt.Errorf("Unknown source: %s", pathComponents[0])
	}
	draftAlbum := models.DraftAlbum{
		ID:             uuid.Must(uuid.NewV4()),
		Path:           string(albumTagsInfo.RelPath),
		Type:           models.AlbumTypeEnumLP,
		DownloadSource: downloadSource,
	}

	tracksInfo := albumTagsInfo.TracksInfo
	draftTracks := make(map[relPath]models.DraftTrack, len(tracksInfo))
	for path, trackInfo := range tracksInfo {
		trackNormalPath, err := filepath.Rel(
			string(albumTagsInfo.RelPath),
			string(path),
		)
		if err != nil {
			return DraftData{}, fmt.Errorf("Error on normalizing track path: %w", err)
		}
		draftTrack := models.DraftTrack{
			ID:      uuid.Must(uuid.NewV4()),
			AlbumID: draftAlbum.ID,
			Path:    trackNormalPath,
			Length:  uint(trackInfo.Seconds),
		}
		for _, tag := range trackInfo.Tags {
			tagName := tag[0]
			tagValue := tag[1]

			switch strings.ToLower(tagName) {
			case "album":
				draftAlbum.Title = zero.StringFrom(tagValue)
			case "artist":
				draftAlbum.Artist = zero.StringFrom(tagValue)
			case "date":
				dateParts := strings.Split(tagValue, "-")
				if year, err := strconv.Atoi(dateParts[0]); err == nil {
					draftAlbum.Year = zero.IntFrom(int64(year))
				} else {
					r.logger.Error(fmt.Errorf("Can't decode date tag %w", err))
				}
			case "title":
				draftTrack.Title = zero.StringFrom(tagValue)
			case "tracknumber":
				if trackNum, err := strconv.Atoi(tagValue); err == nil {
					draftTrack.TrackNum = zero.IntFrom(int64(trackNum))
				} else {
					r.logger.Error(fmt.Errorf("Can't decode tracknumber tag %w", err))
				}
			case "discnumber":
				if discnumber, err := strconv.Atoi(tagValue); err == nil {
					draftTrack.Disc = zero.IntFrom(int64(discnumber))
				}
			}
		}
		draftTracks[path] = draftTrack
	}
	return DraftData{draftAlbum, draftTracks}, nil
}

func (r rescanCase) findAlbumFlacFiles(albumDir relPath) []relPath {
	flacPaths := make([]relPath, 0, 15)
	err := filepath.Walk(r.relToAbs(albumDir), func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if strings.HasSuffix(info.Name(), ".flac") {
			flacPaths = append(flacPaths, r.absToRel(path))
		}
		return nil
	})
	if err != nil {
		r.logger.Error(fmt.Errorf("Can't fs walk %w", err))
		return flacPaths
	}
	return flacPaths
}

func (r rescanCase) findNewAlbumDirs() ([]relPath, error) {
	ctx := r.ctx
	var newAlbumDirs []relPath

	absAlbumDirectories, err := filepath.Glob(r.root + "/*/*")
	if err != nil {
		return newAlbumDirs, fmt.Errorf("Can't glob while rescan: %w", err)
	}

	existenPaths, err := r.queries.GetExistenPaths(ctx)
	if err != nil {
		return newAlbumDirs, fmt.Errorf("Can't fetch existen album paths: %w", err)
	}

	existenAlbumPaths := make(
		map[relPath]struct{},
		len(existenPaths),
	)
	for _, path := range existenPaths {
		existenAlbumPaths[relPath(path)] = struct{}{}
	}

	for _, absAlbumDir := range absAlbumDirectories {
		albumDir := r.absToRel(absAlbumDir)
		if _, found := existenAlbumPaths[albumDir]; found {
			continue
		}
		if fileInfo, err := os.Lstat(absAlbumDir); err != nil {
			return newAlbumDirs, fmt.Errorf("can't stat dir %s %w", absAlbumDir, err)
		} else if fileInfo.Mode()&os.ModeSymlink == os.ModeSymlink {
			continue
		}
		newAlbumDirs = append(
			newAlbumDirs,
			albumDir,
		)
	}
	return newAlbumDirs, nil
}

func (r rescanCase) addReplayGain(draftData DraftData) (DraftData, error) {
	absTrackPaths := make([]string, 0, len(draftData.Tracks))
	for trackPath := range draftData.Tracks {
		absTrackPaths = append(absTrackPaths, r.relToAbs(trackPath))
	}

	calcResult, err := CalcReplaygain(absTrackPaths)
	if err != nil {
		return draftData, fmt.Errorf("replaygain calculation failed %w", err)
	}

	draftData.Album.RgGain = calcResult.AlbumGain
	draftData.Album.RgPeak = calcResult.AlbumGain

	updatedDraftTracks := make(map[relPath]models.DraftTrack, len(draftData.Tracks))
	for _, trackGain := range calcResult.Tracks {
		relPath := r.absToRel(trackGain.Path)
		draftTrack := draftData.Tracks[relPath]

		draftTrack.RgPeak = trackGain.Peak
		draftTrack.RgGain = trackGain.Gain
		updatedDraftTracks[relPath] = draftTrack
	}

	return DraftData{draftData.Album, updatedDraftTracks}, nil
}

func (r rescanCase) getFlacInfo(flacPaths []relPath) (map[relPath]FlacFileInfo, error) {
	flacInfoMap := make(map[relPath]FlacFileInfo)
	for _, flacPath := range flacPaths {
		stream, err := flac.ParseFile(r.relToAbs(flacPath))
		if err != nil {
			return flacInfoMap, fmt.Errorf("can't parse flac file! %s: %w", flacPath, err)
		}
		defer stream.Close()
		flacFileInfo := FlacFileInfo{
			Seconds: stream.Info.NSamples / uint64(stream.Info.SampleRate),
			Path:    flacPath,
		}

		for _, block := range stream.Blocks {
			if block.Header.Type == meta.TypeVorbisComment {
				block.Parse()
				m := block.Body.(*meta.VorbisComment)
				flacFileInfo.Tags = m.Tags
				flacInfoMap[flacPath] = flacFileInfo
				break
			}
		}
	}
	return flacInfoMap, nil
}

func (r rescanCase) Do() {
	ctx := r.ctx

	logError := func(description string, err error) {
		r.logger.Error(fmt.Errorf("%s: %w", description, err))
	}
	logInfo := func(info string) {
		r.logger.Info(info)
	}

	newAlbumDirs, err := r.findNewAlbumDirs()
	if err != nil {
		logError("can't find new album dirs", err)
	}

	{
		logStr := "new album dirs: "
		for i, newAlbumDir := range newAlbumDirs {
			if i != 0 {
				logStr += ", "
			}
			logStr += string(newAlbumDir)
		}
		logInfo(logStr)
	}

	for _, albumDir := range newAlbumDirs {
		logInfo("Processing dir: " + string(albumDir))

		flacPaths := r.findAlbumFlacFiles(albumDir)
		tracksTags, err := r.getFlacInfo(flacPaths)
		if err != nil {
			logError("Album processing error", err)
			continue
		}

		draftData, err := r.processAlbumTags(AlbumFilesInfo{albumDir, tracksTags})
		if err != nil {
			logError("Album tags processing error", err)
			continue
		}

		draftData, err = r.addReplayGain(draftData)
		if err != nil {
			logError("Replaygain calculation error", err)
			continue
		}

		logInfo(fmt.Sprintln("process result", draftData))

		txOptions := sql.TxOptions{}
		tx, err := r.sqlxClient.BeginTxx(ctx, &txOptions)
		if err != nil {
			logError("Can't start transaction", err)
			return
		}

		txQueries := r.queries.WithTx(tx)
		if err := txQueries.InsertDraftAlbum(ctx, draftData.Album); err != nil {
			tx.Rollback()
			logError("Can't insert draft album", err)
			return
		}
		for _, track := range draftData.Tracks {
			if err := txQueries.InsertDraftTrack(ctx, track); err != nil {
				tx.Rollback()
				logError("Can't insert draft track", err)
				return
			}
		}
		tx.Commit()
	}
}

type RescanDeps interface {
	MusiclibRoot() string
	SQLXClient() *sqlx.DB
	RedisClient() *redis.Client
	Queries() *persistance.Queries
}

type rescanLogger struct {
	ch chan<- LogEvent
}

func (r rescanLogger) Fatal(err error) {
	r.ch <- LogEntry{
		err: err,
	}
	log.Fatal(err)
}

func (r rescanLogger) Error(err error) {
	r.ch <- LogEntry{
		err: err,
	}
}

func (r rescanLogger) Info(info string) {
	r.ch <- LogEntry{
		info: info,
	}
}

func Rescan(deps RescanDeps, ctx context.Context) <-chan LogEvent {
	logChan := make(chan LogEvent)
	go func() {
		defer close(logChan)
		rescanCase{
			ctx,
			deps.MusiclibRoot(),

			rescanLogger{logChan},
			deps.SQLXClient(),
			deps.RedisClient(),
			deps.Queries(),
		}.Do()
	}()
	return logChan
}
