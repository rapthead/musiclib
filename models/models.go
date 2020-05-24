package models

import (
	"fmt"
	"time"

	"github.com/gofrs/uuid"
	"github.com/guregu/null"
	"github.com/guregu/null/zero"
)

type Artist struct {
	ID   uuid.UUID `json:"id"   db:"id"`
	Name string    `json:"name" db:"name"`
}

type DraftAlbum struct {
	ID             uuid.UUID          `schema:"id"                  json:"id"                db:"id"`
	Path           string             `schema:"-"                   json:"path"              db:"path"`
	ArtistID       uuid.NullUUID      `schema:"artist_id"           json:"artist_id"         db:"artist_id"`
	Artist         zero.String        `schema:"artist"              json:"artist"            db:"artist"`
	Title          zero.String        `schema:"title"               json:"title"             db:"title"`
	Year           zero.Int           `schema:"year"                json:"year"              db:"year"`
	ReleaseYear    zero.Int           `schema:"release_year"        json:"release_year"      db:"release_year"`
	Barcode        zero.String        `schema:"barcode"             json:"barcode"           db:"barcode"`
	SourceID       zero.String        `schema:"source_id"           json:"source_id"         db:"source_id"`
	Comment        zero.String        `schema:"comment"             json:"comment"           db:"comment"`
	EditionTitle   zero.String        `schema:"edition_title"       json:"edition_title"     db:"edition_title"`
	Mbid           zero.String        `schema:"mbid"                json:"mbid"              db:"mbid"`
	RgPeak         float64            `schema:"-"                   json:"rg_peak"           db:"rg_peak"`
	RgGain         float64            `schema:"-"                   json:"rg_gain"           db:"rg_gain"`
	Type           AlbumTypeEnum      `schema:"type"                json:"type"              db:"type"`
	DownloadSource DownloadSourceEnum `schema:"download_source"     json:"download_source"   db:"download_source"`
	CreatedAt      time.Time          `schema:"-"                   json:"created_at"        db:"created_at"`
	UpdatedAt      time.Time          `schema:"-"                   json:"updated_at"        db:"updated_at"`
}

type DraftTrack struct {
	ID          uuid.UUID   `schema:"id"            json:"id"              db:"id"`
	AlbumID     uuid.UUID   `schema:"-"             json:"album_id"        db:"album_id"`
	TrackNum    zero.Int    `schema:"track_num"     json:"track_num"       db:"track_num"`
	Title       zero.String `schema:"title"         json:"title"           db:"title"`
	TrackArtist zero.String `schema:"track_artist"  json:"track_artist"    db:"track_artist"`
	Disc        zero.Int    `schema:"disc"          json:"disc"            db:"disc"`
	Lirycs      zero.String `schema:"-"             json:"lirycs"          db:"lirycs"`
	RgPeak      float64     `schema:"-"             json:"rg_peak"         db:"rg_peak"`
	RgGain      float64     `schema:"-"             json:"rg_gain"         db:"rg_gain"`
	Path        string      `schema:"-"             json:"path"            db:"path"`
	Length      uint        `schema:"-"             json:"length"          db:"length"`
}

type DraftCover struct {
	ID               uuid.UUID     `schema:"id"              json:"id"                  db:"id"`
	OriginalFilename string        `schema:"-"               json:"original_filename"   db:"original_filename"`
	AlbumID          uuid.UUID     `schema:"-"               json:"album_id"            db:"album_id"`
	Sort             zero.Int      `schema:"sort"            json:"sort"                db:"sort"`
	Type             CoverTypeEnum `schema:"type"            json:"type"                db:"type"`
}

type Metadata struct {
	Path            string      `json:"path"                 db:"path"`
	AlbumArtistName string      `json:"album_artist_name"    db:"album_artist_name"`
	AlbumTitle      string      `json:"album_title"          db:"album_title"`
	Year            int32       `json:"year"                 db:"year"`
	TrackArtistName null.String `json:"track_artist_name"    db:"track_artist_name"`
	TrackTitle      string      `json:"track_title"          db:"track_title"`
	TrackNumber     int64       `json:"track_number"         db:"track_number"`
	AlbumRgGain     float32     `json:"album_rg_gain"        db:"album_rg_gain"`
	AlbumRgPeak     float32     `json:"album_rg_peak"        db:"album_rg_peak"`
	TrackRgGain     float32     `json:"track_rg_gain"        db:"track_rg_gain"`
	TrackRgPeak     float32     `json:"track_rg_peak"        db:"track_rg_peak"`
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
)

var AllDownloadSourceEnum = []DownloadSourceEnum{
	DownloadSourceEnumMY,
	DownloadSourceEnumWHATCD,
	DownloadSourceEnumWAFFLESFM,
	DownloadSourceEnumREDACTEDCH,
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
