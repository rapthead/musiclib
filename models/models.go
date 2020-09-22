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

type Metadata struct {
	ORIGINALFILENAME string         `db:"originalfilename"`
	ALBUMARTIST      string         `db:"albumartist"`
	ALBUM            string         `db:"album"`
	DATE             string         `db:"date"`
	ORIGINALDATE     string         `db:"originaldate"`
	ARTIST           string         `db:"artist"`
	TITLE            string         `db:"title"`
	RELEASETYPE      AlbumTypeEnum  `db:"releasetype"`
	LABELS           pq.StringArray `db:"labels"`

	DISCNUMBER int32 `db:"discnumber"`
	DISCTOTAL  int32 `db:"disctotal"`

	TRACKNUMBER int32 `db:"tracknumber"`
	TRACKTOTAL  int32 `db:"tracktotal"`

	REPLAYGAIN_ALBUM_GAIN float32 `db:"replaygain_album_gain"`
	REPLAYGAIN_ALBUM_PEAK float32 `db:"replaygain_album_peak"`
	REPLAYGAIN_TRACK_GAIN float32 `db:"replaygain_track_gain"`
	REPLAYGAIN_TRACK_PEAK float32 `db:"replaygain_track_peak"`
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
