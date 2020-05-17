package models

import (
	"fmt"

	"github.com/gofrs/uuid"
	"gopkg.in/guregu/null.v4"
)

type Artist struct {
	ID   uuid.UUID `json:"id" db:"id"`
	Name string    `json:"name" db:"name"`
}

type DraftAlbum struct {
	ID             uuid.UUID          `json:"id" db:"id"`
	Path           string             `json:"path" db:"path"`
	ArtistID       uuid.NullUUID      `json:"artist_id" db:"artist_id"`
	Artist         null.String        `json:"artist" db:"artist"`
	Title          null.String        `json:"title" db:"title"`
	Date           null.Time          `json:"date" db:"date"`
	ReleaseDate    null.Time          `json:"release_date" db:"release_date"`
	Barcode        null.String        `json:"barcode" db:"barcode"`
	SourceID       null.String        `json:"source_id" db:"source_id"`
	Comment        null.String        `json:"comment" db:"comment"`
	EditionTitle   null.String        `json:"edition_title" db:"edition_title"`
	Mbid           null.String        `json:"mbid" db:"mbid"`
	RgPeak         float64            `json:"rg_peak" db:"rg_peak"`
	RgGain         float64            `json:"rg_gain" db:"rg_gain"`
	Type           AlbumTypeEnum      `json:"type" db:"type"`
	DownloadSource DownloadSourceEnum `json:"download_source" db:"download_source"`
	CreatedAt      null.Time          `json:"created_at" db:"created_at"`
	UpdatedAt      null.Time          `json:"updated_at" db:"updated_at"`
}

type DraftTrack struct {
	ID          uuid.UUID   `json:"id" db:"id"`
	AlbumID     uuid.UUID   `json:"album_id" db:"album_id"`
	TrackNum    null.Int    `json:"track_num" db:"track_num"`
	Title       null.String `json:"title" db:"title"`
	TrackArtist null.String `json:"track_artist" db:"track_artist"`
	Disc        null.Int    `json:"disc" db:"disc"`
	Lirycs      null.String `json:"lirycs" db:"lirycs"`
	RgPeak      null.Float  `json:"rg_peak" db:"rg_peak"`
	RgGain      null.Float  `json:"rg_gain" db:"rg_gain"`
	Path        string      `json:"path" db:"path"`
	Length      int         `json:"length" db:"length"`
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
