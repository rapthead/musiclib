package models

import (
	"fmt"
	"time"

	"github.com/gofrs/uuid"
	"github.com/guregu/null"
	"github.com/guregu/null/zero"
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
	ArtistID       uuid.UUID          `db:"artist_id"`
	State          AlbumStateEnum     `db:"state"`
	Path           string             `db:"path"`
	Title          string             `db:"title"`
	Year           int                `db:"year"`
	ReleaseYear    zero.Int           `db:"release_year"`
	Barcode        zero.String        `db:"barcode"`
	Comment        zero.String        `db:"comment"`
	EditionTitle   zero.String        `db:"edition_title"`
	Mbid           zero.String        `db:"mbid"`
	RgPeak         float64            `db:"rg_peak"`
	RgGain         float64            `db:"rg_gain"`
	Type           AlbumTypeEnum      `db:"type"`
	DownloadSource DownloadSourceEnum `db:"download_source"`
	SourceURL      zero.String        `db:"source_url"`
	CreatedAt      time.Time          `db:"created_at"`
	UpdatedAt      time.Time          `db:"updated_at"`
}

type DraftAlbum struct {
	ID             uuid.UUID          `db:"id"`
	Path           string             `db:"path"`
	Artist         zero.String        `db:"artist"`
	Title          zero.String        `db:"title"`
	Year           zero.Int           `db:"year"`
	ReleaseYear    zero.Int           `db:"release_year"`
	Barcode        zero.String        `db:"barcode"`
	Comment        zero.String        `db:"comment"`
	EditionTitle   zero.String        `db:"edition_title"`
	Mbid           zero.String        `db:"mbid"`
	RgPeak         float64            `db:"rg_peak"`
	RgGain         float64            `db:"rg_gain"`
	Type           AlbumTypeEnum      `db:"type"`
	DownloadSource DownloadSourceEnum `db:"download_source"`
	SourceURL      zero.String        `db:"source_url"`
	CreatedAt      time.Time          `db:"created_at"`
	UpdatedAt      time.Time          `db:"updated_at"`
}

type Track struct {
	ID          uuid.UUID   `db:"id"`
	AlbumID     uuid.UUID   `db:"album_id"`
	TrackNum    int         `db:"track_num"`
	Title       string      `db:"title"`
	TrackArtist zero.String `db:"track_artist"`
	Disc        int         `db:"disc"`
	Lirycs      zero.String `db:"lirycs"`
	RgPeak      float64     `db:"rg_peak"`
	RgGain      float64     `db:"rg_gain"`
	Path        string      `db:"path"`
	Length      uint        `db:"length"`
}

type DraftTrack struct {
	ID          uuid.UUID   `db:"id"`
	AlbumID     uuid.UUID   `db:"album_id"`
	TrackNum    zero.Int    `db:"track_num"`
	Title       zero.String `db:"title"`
	TrackArtist zero.String `db:"track_artist"`
	Disc        zero.Int    `db:"disc"`
	Lirycs      zero.String `db:"lirycs"`
	RgPeak      float64     `db:"rg_peak"`
	RgGain      float64     `db:"rg_gain"`
	Path        string      `db:"path"`
	Length      uint        `db:"length"`
}

type Cover struct {
	ID      uuid.UUID     `db:"id"`
	AlbumID uuid.UUID     `db:"album_id"`
	Path    zero.String   `db:"path"`
	Sort    int           `db:"sort"`
	Type    CoverTypeEnum `db:"type"`
}

type DraftCover struct {
	ID               uuid.UUID     `db:"id"`
	OriginalFilename string        `db:"original_filename"`
	AlbumID          uuid.UUID     `db:"album_id"`
	Sort             zero.Int      `db:"sort"`
	Type             CoverTypeEnum `db:"type"`
}

type Metadata struct {
	Path            string      `db:"path"`
	AlbumArtistName string      `db:"album_artist_name"`
	AlbumTitle      string      `db:"album_title"`
	Year            int32       `db:"year"`
	DiscTotal       int32       `db:"disc_total"`
	TrackDisc       int32       `db:"track_disc"`
	TrackArtistName null.String `db:"track_artist_name"`
	TrackTitle      string      `db:"track_title"`
	TrackNumber     int32       `db:"track_number"`

	AlbumRgGain float32 `db:"album_rg_gain"`
	AlbumRgPeak float32 `db:"album_rg_peak"`
	TrackRgGain float32 `db:"track_rg_gain"`
	TrackRgPeak float32 `db:"track_rg_peak"`
}

type AlbumStateEnum string

const (
	AlbumStateEnumDisabled AlbumStateEnum = "disabled"
	AlbumStateEnumEnabled  AlbumStateEnum = "enabled"
	AlbumStateEnumDeleted  AlbumStateEnum = "deleted"
)

var AllAlbumStateEnum = []AlbumStateEnum{
	AlbumStateEnumDisabled,
	AlbumStateEnumEnabled,
	AlbumStateEnumDeleted,
}

func (e AlbumStateEnum) IsValid() bool {
	switch e {
	case
		AlbumStateEnumDisabled,
		AlbumStateEnumEnabled,
		AlbumStateEnumDeleted:
		return true
	}
	return false
}

func (e *AlbumStateEnum) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = AlbumStateEnum(s)
	case string:
		*e = AlbumStateEnum(s)
	default:
		return fmt.Errorf("unsupported scan type for AlbumStateEnum: %T", src)
	}
	return nil
}

type AlbumTypeEnum string

const (
	AlbumTypeEnumLP          AlbumTypeEnum = "LP"
	AlbumTypeEnumEP          AlbumTypeEnum = "EP"
	AlbumTypeEnumAnthology   AlbumTypeEnum = "Anthology"
	AlbumTypeEnumSoundtrack  AlbumTypeEnum = "Soundtrack"
	AlbumTypeEnumCompilation AlbumTypeEnum = "Compilation"
	AlbumTypeEnumSingle      AlbumTypeEnum = "Single"
	AlbumTypeEnumLive        AlbumTypeEnum = "Live"
)

var AllAlbumTypeEnum = []AlbumTypeEnum{
	AlbumTypeEnumLP,
	AlbumTypeEnumEP,
	AlbumTypeEnumAnthology,
	AlbumTypeEnumSoundtrack,
	AlbumTypeEnumCompilation,
	AlbumTypeEnumSingle,
	AlbumTypeEnumLive,
}

func (e AlbumTypeEnum) IsValid() bool {
	switch e {
	case
		AlbumTypeEnumLP,
		AlbumTypeEnumEP,
		AlbumTypeEnumAnthology,
		AlbumTypeEnumSoundtrack,
		AlbumTypeEnumCompilation,
		AlbumTypeEnumSingle,
		AlbumTypeEnumLive:
		return true
	}
	return false
}

func (e *AlbumTypeEnum) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = AlbumTypeEnum(s)
	case string:
		*e = AlbumTypeEnum(s)
	default:
		return fmt.Errorf("unsupported scan type for AlbumTypeEnum: %T", src)
	}
	return nil
}

type DownloadSourceEnum string

const (
	DownloadSourceEnumMY         DownloadSourceEnum = "MY"
	DownloadSourceEnumWHATCD     DownloadSourceEnum = "WHAT_CD"
	DownloadSourceEnumWAFFLESFM  DownloadSourceEnum = "WAFFLES_FM"
	DownloadSourceEnumREDACTEDCH DownloadSourceEnum = "REDACTED_CH"
	DownloadSourceEnumWEB        DownloadSourceEnum = "WEB"
)

var AllDownloadSourceEnum = []DownloadSourceEnum{
	DownloadSourceEnumMY,
	DownloadSourceEnumWHATCD,
	DownloadSourceEnumWAFFLESFM,
	DownloadSourceEnumREDACTEDCH,
	DownloadSourceEnumWEB,
}

func (e DownloadSourceEnum) IsValid() bool {
	switch e {
	case
		DownloadSourceEnumMY,
		DownloadSourceEnumWHATCD,
		DownloadSourceEnumWAFFLESFM,
		DownloadSourceEnumREDACTEDCH,
		DownloadSourceEnumWEB:
		return true
	}
	return false
}

func (e *DownloadSourceEnum) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = DownloadSourceEnum(s)
	case string:
		*e = DownloadSourceEnum(s)
	default:
		return fmt.Errorf("unsupported scan type for DownloadSourceEnum: %T", src)
	}
	return nil
}

type CoverTypeEnum string

const (
	CoverTypeEnumBackOut  CoverTypeEnum = "back out"
	CoverTypeEnumFrontOut CoverTypeEnum = "front out"
	CoverTypeEnumBackIn   CoverTypeEnum = "back in"
	CoverTypeEnumFrontIn  CoverTypeEnum = "front in"
	CoverTypeEnumDisc     CoverTypeEnum = "disc"
	CoverTypeEnumIn       CoverTypeEnum = "in"
	CoverTypeEnumOut      CoverTypeEnum = "out"
	CoverTypeEnumBooklet  CoverTypeEnum = "booklet"
	CoverTypeEnumOther    CoverTypeEnum = "other"
)

var AllCoverTypeEnum = []CoverTypeEnum{
	CoverTypeEnumBackOut,
	CoverTypeEnumFrontOut,
	CoverTypeEnumBackIn,
	CoverTypeEnumFrontIn,
	CoverTypeEnumDisc,
	CoverTypeEnumIn,
	CoverTypeEnumOut,
	CoverTypeEnumBooklet,
	CoverTypeEnumOther,
}

func (e CoverTypeEnum) IsValid() bool {
	switch e {
	case
		CoverTypeEnumBackOut,
		CoverTypeEnumFrontOut,
		CoverTypeEnumBackIn,
		CoverTypeEnumFrontIn,
		CoverTypeEnumDisc,
		CoverTypeEnumIn,
		CoverTypeEnumOut,
		CoverTypeEnumBooklet,
		CoverTypeEnumOther:
		return true
	}
	return false
}

func (e *CoverTypeEnum) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = CoverTypeEnum(s)
	case string:
		*e = CoverTypeEnum(s)
	default:
		return fmt.Errorf("unsupported scan type for CoverTypeEnum: %T", src)
	}
	return nil
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
