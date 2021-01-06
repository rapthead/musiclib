package fuse_entities

import (
	"fmt"
	"strconv"
	"time"

	"github.com/rapthead/musiclib/models"
	"github.com/rapthead/musiclib/utils"
)

// обертка, реализующая интерфейс fuse-flac-файла
type FuseFlacEntity struct {
	m models.Metadata
}

func NewFuseFlacEntity(m models.Metadata) FuseFlacEntity {
	return FuseFlacEntity{m}
}

func (e FuseFlacEntity) CTime() time.Time {
	return e.m.CreatedAt
}

func (e FuseFlacEntity) MTime() time.Time {
	return e.m.UpdatedAt
}

func (e FuseFlacEntity) OriginPath() string {
	return e.m.OriginalFilename()
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

		{"ORIGINALFILENAME", e.m.OriginalFilename()},

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

func (e FuseFlacEntity) FusePath() string {
	return models.FlacFusePath(e.m)
}
