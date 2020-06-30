//go:generate go run github.com/rapthead/musiclib/cmd/enumer -type DownloadSourceEnum   -output enumer_DownloadSourceEnum.go github.com/rapthead/musiclib/models
//go:generate go run github.com/rapthead/musiclib/cmd/enumer -type CoverTypeEnum        -output enumer_CoverTypeEnum.go      github.com/rapthead/musiclib/models
//go:generate go run github.com/rapthead/musiclib/cmd/enumer -type AlbumTypeEnum        -output enumer_AlbumTypeEnum.go      github.com/rapthead/musiclib/models
//go:generate go run github.com/rapthead/musiclib/cmd/enumer -type AlbumStateEnum       -output enumer_AlbumStateEnum.go     github.com/rapthead/musiclib/models

package models

type DownloadSourceEnum string

const (
	DownloadSourceEnumMY         DownloadSourceEnum = "MY"
	DownloadSourceEnumWHATCD     DownloadSourceEnum = "WHAT_CD"
	DownloadSourceEnumWAFFLESFM  DownloadSourceEnum = "WAFFLES_FM"
	DownloadSourceEnumREDACTEDCH DownloadSourceEnum = "REDACTED_CH"
	DownloadSourceEnumWEB        DownloadSourceEnum = "WEB"
)

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

type AlbumStateEnum string

const (
	AlbumStateEnumDisabled AlbumStateEnum = "disabled"
	AlbumStateEnumEnabled  AlbumStateEnum = "enabled"
	AlbumStateEnumDeleted  AlbumStateEnum = "deleted"
	AlbumStateEnumDraft    AlbumStateEnum = "draft"
)
