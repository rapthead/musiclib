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
	"github.com/rapthead/musiclib/persistance2"
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

type rescanCase struct {
	ctx  context.Context
	root string

	sqlxClient  *sqlx.DB
	redisClient *redis.Client
	queries     *persistance2.Queries
}

func (r rescanCase) absToRel(absPath string) relPath {
	rel, err := filepath.Rel(r.root, absPath)
	if err != nil {
		log.Fatal("can't convert abs path to rel", err)
	}
	return relPath(rel)
}

func (r rescanCase) relToAbs(path relPath) string {
	return filepath.Join(r.root, string(path))
}

func (r rescanCase) processAlbumTags(albumTagsInfo AlbumFilesInfo) DraftData {
	pathComponents := strings.Split(string(albumTagsInfo.RelPath), string(os.PathSeparator))
	var downloadSource models.DownloadSourceEnum
	switch pathComponents[0] {
	case "my":
		downloadSource = models.DownloadSourceEnumMY
	case "what.cd":
		downloadSource = models.DownloadSourceEnumWHATCD
	case "redacted.ch":
		downloadSource = models.DownloadSourceEnumREDACTEDCH
	case "bandcamp.com", "soundcloud.com":
		downloadSource = models.DownloadSourceEnumWHATCD
	default:
		log.Fatal("Unknown source:", pathComponents[0])
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
			log.Fatal("error on normalizing track path:", err)
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
				if year, err := strconv.Atoi(tagValue); err == nil {
					draftAlbum.Year = zero.IntFrom(int64(year))
				}
			case "title":
				draftTrack.Title = zero.StringFrom(tagValue)
			case "tracknumber":
				if trackNum, err := strconv.Atoi(tagValue); err != nil {
					draftTrack.TrackNum = zero.IntFrom(int64(trackNum))
				}
			case "discnumber":
				if discnumber, err := strconv.Atoi(tagValue); err == nil {
					draftTrack.Disc = zero.IntFrom(int64(discnumber))
				}
			}
		}
		draftTracks[path] = draftTrack
	}
	return DraftData{draftAlbum, draftTracks}
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
		log.Fatal(err)
	}
	return flacPaths
}

func (r rescanCase) findNewAlbumDirs() []relPath {
	ctx := r.ctx

	absAlbumDirectories, err := filepath.Glob(r.root + "/*/*")
	if err != nil {
		log.Fatal("Can't glob while rescan:", err)
	}

	existenPaths, err := r.queries.GetExistenPaths(ctx)
	if err != nil {
		log.Fatal("Can't fetch existen album paths:", err)
	}

	existenAlbumPaths := make(
		map[relPath]struct{},
		len(existenPaths),
	)
	for _, path := range existenPaths {
		existenAlbumPaths[relPath(path)] = struct{}{}
	}

	var newAlbumDirs []relPath
	for _, absAlbumDir := range absAlbumDirectories {
		albumDir := r.absToRel(absAlbumDir)
		if _, found := existenAlbumPaths[albumDir]; found {
			continue
		}
		if fileInfo, err := os.Lstat(absAlbumDir); err != nil {
			log.Fatal("can't stat dir", absAlbumDir, err)
		} else if fileInfo.Mode()&os.ModeSymlink == os.ModeSymlink {
			continue
		}
		newAlbumDirs = append(
			newAlbumDirs,
			albumDir,
		)
	}
	return newAlbumDirs
}

func (r rescanCase) addReplayGain(draftData DraftData) DraftData {
	absTrackPaths := make([]string, 0, len(draftData.Tracks))
	for trackPath := range draftData.Tracks {
		absTrackPaths = append(absTrackPaths, r.relToAbs(trackPath))
	}

	calcResult, err := CalcReplaygain(absTrackPaths)
	if err != nil {
		log.Fatal("replaygain calculation failed", err)
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

	return DraftData{draftData.Album, updatedDraftTracks}
}

func (r rescanCase) getFlacInfo(flacPaths []relPath) (map[relPath]FlacFileInfo, error) {
	flacInfoMap := make(map[relPath]FlacFileInfo)
	for _, flacPath := range flacPaths {
		stream, err := flac.ParseFile(r.relToAbs(flacPath))
		if err != nil {
			log.Fatal("can't parse flac file!", flacPath, err)
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

func (r rescanCase) Do() error {
	ctx := r.ctx

	newAlbumDirs := r.findNewAlbumDirs()
	fmt.Println("newAlbumDirs", newAlbumDirs)

	for _, albumDir := range newAlbumDirs {
		flacPaths := r.findAlbumFlacFiles(albumDir)
		tracksTags, err := r.getFlacInfo(flacPaths)
		if err != nil {
			log.Print("album processing error", albumDir, err)
			continue
		}

		draftData := r.processAlbumTags(AlbumFilesInfo{albumDir, tracksTags})
		draftData = r.addReplayGain(draftData)
		log.Println("process result", draftData)

		txOptions := sql.TxOptions{}
		tx, err := r.sqlxClient.BeginTxx(ctx, &txOptions)
		if err != nil {
			log.Fatal("Can't start transaction", err)
		}

		txQueries := r.queries.WithTx(tx)
		if err := txQueries.InsertDraftAlbum(ctx, draftData.Album); err != nil {
			tx.Rollback()
			log.Fatal("Can't insert draft album: ", err)
		}
		for _, track := range draftData.Tracks {
			if err := txQueries.InsertDraftTrack(ctx, track); err != nil {
				tx.Rollback()
				log.Fatal("Can't insert draft album: ", err)
			}
		}
		tx.Commit()
	}
	return nil
}

type RescanDeps interface {
	MusiclibRoot() string
	SQLXClient() *sqlx.DB
	RedisClient() *redis.Client
	Queries2() *persistance2.Queries
}

func Rescan(deps RescanDeps, ctx context.Context) error {
	return rescanCase{
		ctx,
		deps.MusiclibRoot(),

		deps.SQLXClient(),
		deps.RedisClient(),
		deps.Queries2(),
	}.Do()
}
