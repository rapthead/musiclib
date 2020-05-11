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
	"time"

	"github.com/google/uuid"
	"github.com/mewkiz/flac"
	"github.com/mewkiz/flac/meta"
	"github.com/rapthead/musiclib/persistance"
)

type relPath string

type DraftData struct {
	Album  persistance.InsertDraftAlbumParams
	Tracks map[relPath]persistance.InsertDraftTrackParams
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
	var downloadSource persistance.DownloadSourceEnum
	switch pathComponents[0] {
	case "my":
		downloadSource = persistance.DownloadSourceEnumMY
	case "what.cd":
		downloadSource = persistance.DownloadSourceEnumWHATCD
	case "redacted.ch":
		downloadSource = persistance.DownloadSourceEnumREDACTEDCH
	case "bandcamp.com", "soundcloud.com":
		downloadSource = persistance.DownloadSourceEnumWHATCD
	default:
		log.Fatal("Unknown source:", pathComponents[0])
	}
	draftAlbum := persistance.InsertDraftAlbumParams{
		ID:             uuid.New(),
		Path:           string(albumTagsInfo.RelPath),
		Type:           persistance.AlbumTypeEnumLP,
		DownloadSource: downloadSource,
	}

	tracksInfo := albumTagsInfo.TracksInfo
	draftTracks := make(map[relPath]persistance.InsertDraftTrackParams, len(tracksInfo))
	for path, trackInfo := range tracksInfo {
		draftTrack := persistance.InsertDraftTrackParams{
			ID:      uuid.New(),
			AlbumID: draftAlbum.ID,
			Path:    string(path),
			Length:  int64(trackInfo.Seconds),
		}
		for _, tag := range trackInfo.Tags {
			tagName := tag[0]
			tagValue := tag[1]

			switch strings.ToLower(tagName) {
			case "album":
				draftAlbum.Title = sql.NullString{
					String: tagValue,
					Valid:  true,
				}
			case "artist":
				draftAlbum.Artist = sql.NullString{
					String: tagValue,
					Valid:  true,
				}
			case "date":
				if year, err := strconv.Atoi(tagValue); err == nil {
					draftAlbum.Date = sql.NullTime{
						Time:  time.Date(year, 1, 1, 0, 0, 0, 0, time.UTC),
						Valid: true,
					}
				}
			case "title":
				draftTrack.Title = sql.NullString{
					String: tagValue,
					Valid:  true,
				}
			case "tracknumber":
				if trackNum, err := strconv.Atoi(tagValue); err != nil {
					draftTrack.TrackNum = sql.NullInt64{
						Int64: int64(trackNum),
						Valid: true,
					}
				}
			case "discnumber":
				if discnumber, err := strconv.Atoi(tagValue); err == nil {
					draftTrack.Disc = sql.NullInt64{
						Int64: int64(discnumber),
						Valid: true,
					}
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

	existenCommitedPaths, err := queries.GetCommitedAlbumPaths(ctx)
	if err != nil {
		log.Fatal("Can't fetch existen commited album paths:", err)
	}

	existenDraftPaths, err := queries.GetDraftAlbumPaths(ctx)
	if err != nil {
		log.Fatal("Can't fetch existen commited album paths:", err)
	}

	existenAlbumPaths := make(
		map[relPath]struct{},
		len(existenCommitedPaths)+len(existenDraftPaths),
	)
	for _, path := range append(existenCommitedPaths, existenDraftPaths...) {
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

	draftData.Album.RgGain = sql.NullFloat64{
		Float64: calcResult.AlbumGain,
		Valid:   true,
	}
	draftData.Album.RgPeak = sql.NullFloat64{
		Float64: calcResult.AlbumPeak,
		Valid:   true,
	}

	updatedDraftTracks := make(map[relPath]persistance.InsertDraftTrackParams, len(draftData.Tracks))
	for _, trackGain := range calcResult.Tracks {
		relPath := r.absToRel(trackGain.Path)
		draftTrack := draftData.Tracks[relPath]

		draftTrack.RgPeak = sql.NullFloat64{
			Float64: trackGain.Peak,
			Valid:   true,
		}
		draftTrack.RgGain = sql.NullFloat64{
			Float64: trackGain.Gain,
			Valid:   true,
		}
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

		tx, err := sqlDB.Begin()
		if err != nil {
			log.Fatal("Can't start transaction", err)
		}

		txQueries := queries.WithTx(tx)
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

func Rescan(ctx context.Context) error {
	return rescanCase{ctx, musiclibRoot}.Do()
}
