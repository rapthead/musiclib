package models

import (
	"fmt"
	"time"

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

type Metadata struct {
	OriginalFilename string         `db:"original_filename"`
	AlbumID          uuid.UUID      `db:"album_id"`
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

// type MetadataPaths Metadata
//
// func (e MetadataPaths) sortAlbumArtist() string {
// 	return strings.TrimPrefix(e.AlbumArtist, "The ")
// }
//
// func (e MetadataPaths) date(delemiter string) string {
// 	if e.ReleaseYear.Valid &&
// 		e.OriginalYear != e.ReleaseYear.Int64 {
// 		return fmt.Sprintf(
// 			"%d%s%d",
// 			e.OriginalYear,
// 			delemiter,
// 			e.ReleaseYear.Int64,
// 		)
// 	} else {
// 		return strconv.FormatInt(e.OriginalYear, 10)
// 	}
// }
//
// func (e MetadataPaths) PlaylistFusePath() string {
// 	firstArtistChar := unicode.ToLower([]rune(e.sortAlbumArtist())[0])
// 	if (firstArtistChar >= '\u0430' && firstArtistChar <= '\u044F') || // is russian
// 		(firstArtistChar >= '\u0061' && firstArtistChar <= '\u007A') { // is latin
// 	} else {
// 		firstArtistChar = '#'
// 	}
//
// 	return joinParts(
// 		"grouped",
// 		string(firstArtistChar),
// 		e.AlbumArtist,
// 		fmt.Sprintf(
// 			"%s-%s.m3u",
// 			e.date("-"),
// 			e.AlbumTitle,
// 		),
// 	)
// }
//
// func joinParts(pathParts ...string) string {
// 	fusePath := ""
// 	for _, pathPart := range pathParts {
// 		fusePath = fusePath + "/" + pathReplacer.Replace(pathPart)
// 	}
// 	fusePath = strings.TrimPrefix(fusePath, "/")
// 	return fusePath
// }
//
// var pathReplacer = strings.NewReplacer(
// 	"<", "_",
// 	">", "_",
// 	":", "_",
// 	"\"", "_",
// 	"/", "_",
// 	"\\", "_",
// 	"|", "_",
// 	"?", "_",
// 	"*", "_",
// 	",", "_",
// )
