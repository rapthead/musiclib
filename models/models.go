package models

import (
	"fmt"
	"strconv"
	"strings"
	"time"
	"unicode"

	"github.com/gofrs/uuid"
	"github.com/guregu/null"
	"github.com/guregu/null/zero"
	"github.com/lib/pq"
)

type Artist struct {
	ID   uuid.UUID `db:"id"`
	Name string    `db:"name"`
}

type Release struct {
	ID            uuid.UUID   `db:"id"`
	AlbumID       uuid.UUID   `db:"album_id"`
	Label         string      `db:"label"`
	CatalogNumber zero.String `db:"catalog_num"`
}

type Album struct {
	ID             uuid.UUID          `db:"id"`
	ArtistID       uuid.NullUUID      `db:"artist_id"`
	DraftArtist    string             `db:"draft_artist"`
	State          AlbumStateEnum     `db:"state"`
	Path           string             `db:"path"`
	Title          string             `db:"title"`
	Year           zero.Int           `db:"year"`
	ReleaseYear    zero.Int           `db:"release_year"`
	Barcode        string             `db:"barcode"`
	Comment        string             `db:"comment"`
	EditionTitle   string             `db:"edition_title"`
	Mbid           uuid.NullUUID      `db:"mbid"`
	RgPeak         float64            `db:"rg_peak"`
	RgGain         float64            `db:"rg_gain"`
	Type           AlbumTypeEnum      `db:"type"`
	DownloadSource DownloadSourceEnum `db:"download_source"`
	SourceURL      string             `db:"source_url"`
	CreatedAt      time.Time          `db:"created_at"`
	UpdatedAt      time.Time          `db:"updated_at"`
}

type Track struct {
	ID          uuid.UUID      `db:"id"`
	AlbumID     uuid.UUID      `db:"album_id"`
	AlbumState  AlbumStateEnum `db:"album_state"`
	TrackNum    int            `db:"track_num"`
	Title       string         `db:"title"`
	TrackArtist string         `db:"track_artist"`
	Disc        int            `db:"disc"`
	Lirycs      string         `db:"lyrics"`
	RgPeak      float64        `db:"rg_peak"`
	RgGain      float64        `db:"rg_gain"`
	Path        string         `db:"path"`
	Length      uint           `db:"length"`
}

type Cover struct {
	ID         uuid.UUID      `db:"id"`
	AlbumID    uuid.UUID      `db:"album_id"`
	AlbumState AlbumStateEnum `db:"album_state"`
	Path       zero.String    `db:"path"`
	Sort       int            `db:"sort"`
	Type       CoverTypeEnum  `db:"type"`
	Filename   null.String    `db:"filename"`
}

type ImageTypeEnum string

func NewImageTypeEnum(mimeStr string) (ImageTypeEnum, error) {
	switch mimeStr {
	case string(ImageTypeEnumJPEG):
		return ImageTypeEnumJPEG, nil
	case string(ImageTypeEnumPNG):
		return ImageTypeEnumJPEG, nil
	default:
		return ImageTypeEnumJPEG, fmt.Errorf("unknown cover mime type: %s", mimeStr)
	}
}

const (
	ImageTypeEnumJPEG ImageTypeEnum = "image/jpeg"
	ImageTypeEnumPNG  ImageTypeEnum = "image/png"
)

func (e ImageTypeEnum) IsValid() bool {
	switch e {
	case
		ImageTypeEnumJPEG,
		ImageTypeEnumPNG:
		return true
	}
	return false
}

func (e ImageTypeEnum) MakeExt() string {
	switch e {
	case ImageTypeEnumJPEG:
		return "jpeg"
	case ImageTypeEnumPNG:
		return "png"
	default:
		panic("assertion error: unknown image type")
	}
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

type Metadata struct {
	OriginalFilename string         `db:"original_filename"`
	AlbumArtist      string         `db:"album_artist"`
	AlbumTitle       string         `db:"album_title"`
	OriginalYear     int64          `db:"original_year"`
	ReleaseYear      null.Int       `db:"release_year"`
	TrackArtist      string         `db:"track_artist"`
	TrackTitle       string         `db:"track_title"`
	EditionTitle     string         `db:"edition_title"`
	ReleaseType      AlbumTypeEnum  `db:"release_type"`
	Labels           pq.StringArray `db:"labels"`

	CreatedAt time.Time `db:"created_at"`
	UpdatedAt time.Time `db:"updated_at"`

	DiscNumber int32 `db:"disc_number"`
	DiscTotal  int32 `db:"disc_total"`

	TrackNumber int32 `db:"track_number"`
	TrackTotal  int32 `db:"track_total"`

	ReplayGainAlbumGain float32 `db:"replaygain_album_gain"`
	ReplayGainAlbumPeak float32 `db:"replaygain_album_peak"`
	ReplayGainTrackGain float32 `db:"replaygain_track_gain"`
	ReplayGainTrackPeak float32 `db:"replaygain_track_peak"`
}

func (meta Metadata) sortAlbumArtist() string {
	return strings.TrimPrefix(meta.AlbumArtist, "The ")
}

func (meta Metadata) albumSuffix() string {
	var albumSuffix string
	if meta.EditionTitle != "" && meta.EditionTitle != "Original Release" {
		albumSuffix = " ◆ " + meta.EditionTitle
	}
	return albumSuffix
}

func (meta Metadata) date(delemiter string) string {
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

func (meta Metadata) CTime() time.Time {
	return meta.CreatedAt
}

func (meta Metadata) MTime() time.Time {
	return meta.UpdatedAt
}

func (meta Metadata) OriginPath() string {
	return meta.OriginalFilename
}

func (meta Metadata) FusePath() string {
	firstArtistChar := unicode.ToLower([]rune(meta.sortAlbumArtist())[0])
	if (firstArtistChar >= '\u0430' && firstArtistChar <= '\u044F') || // is russian
		(firstArtistChar >= '\u0061' && firstArtistChar <= '\u007A') { // is latin
	} else {
		firstArtistChar = '#'
	}

	pathParts := albumPathParts(
		meta.sortAlbumArtist(),
		meta.AlbumArtist,
		meta.date("_"),
		meta.AlbumTitle,
		meta.albumSuffix(),
	)

	pathSuffix := fmt.Sprintf(
		"%02d-%s.flac",
		meta.TrackNumber,
		meta.TrackTitle,
	)
	if meta.DiscTotal != 1 {
		pathParts = append(pathParts, fmt.Sprintf(
			"%d.%s",
			meta.DiscNumber,
			pathSuffix,
		))
	} else {
		pathParts = append(pathParts, pathSuffix)
	}

	fusePath := ""
	for _, pathPart := range pathParts {
		fusePath = fusePath + "/" + pathReplacer.Replace(pathPart)
	}
	fusePath = strings.TrimPrefix(fusePath, "/")
	return fusePath
}

func (meta Metadata) VorbisComments() [][2]string {
	var albumSuffix string
	if meta.EditionTitle != "" && meta.EditionTitle != "Original Release" {
		albumSuffix = " ◆ " + meta.EditionTitle
	}

	vorbisComments := [][2]string{
		{"SORTALBUMARTIST", meta.sortAlbumArtist()},
		{"ALBUMARTIST", meta.AlbumArtist},
		{"ARTIST", strCoalesce(meta.TrackArtist, meta.AlbumArtist)},
		{"DATE", meta.date("/")},
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
		// GENRE=Ska
		// GENRE=Punk
		// MEDIA=CD
	}
	for _, label := range meta.Labels {
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

type FuseCover struct {
	CoverID      uuid.UUID `db:"id"`
	AlbumArtist  string    `db:"album_artist"`
	AlbumTitle   string    `db:"album_title"`
	OriginalYear int64     `db:"original_year"`
	ReleaseYear  null.Int  `db:"release_year"`
	EditionTitle string    `db:"edition_title"`

	CreatedAt time.Time `db:"created_at"`
	UpdatedAt time.Time `db:"updated_at"`
}

func (meta FuseCover) sortAlbumArtist() string {
	return strings.TrimPrefix(meta.AlbumArtist, "The ")
}

func (meta FuseCover) albumSuffix() string {
	var albumSuffix string
	if meta.EditionTitle != "" && meta.EditionTitle != "Original Release" {
		albumSuffix = " ◆ " + meta.EditionTitle
	}
	return albumSuffix
}

func (meta FuseCover) date(delemiter string) string {
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

func (meta FuseCover) CTime() time.Time {
	return meta.CreatedAt
}

func (meta FuseCover) MTime() time.Time {
	return meta.UpdatedAt
}

func (meta FuseCover) ID() uuid.UUID {
	return meta.CoverID
}

func (meta FuseCover) FusePath() string {
	pathParts := append(
		albumPathParts(
			meta.sortAlbumArtist(),
			meta.AlbumArtist,
			meta.date("_"),
			meta.AlbumTitle,
			meta.EditionTitle,
		),
		"cover.jpeg",
	)

	fusePath := ""
	for _, pathPart := range pathParts {
		fusePath = fusePath + "/" + pathReplacer.Replace(pathPart)
	}
	fusePath = strings.TrimPrefix(fusePath, "/")
	return fusePath
}

func albumPathParts(
	sortAlbumArtist string,
	albumArtist string,
	dashDate string,
	albumTitle string,
	albumSuffix string,
) []string {
	// firstArtistChar := unicode.ToLower([]rune(sortAlbumArtist)[0])
	// if (firstArtistChar >= '\u0430' && firstArtistChar <= '\u044F') || // is russian
	// 	(firstArtistChar >= '\u0061' && firstArtistChar <= '\u007A') { // is latin
	// } else {
	// 	firstArtistChar = '#'
	// }

	pathParts := []string{
		fmt.Sprintf(
			"%s%s–%s–%s",
			albumArtist,
			albumSuffix,
			dashDate,
			albumTitle,
		),
	}
	return pathParts
}
