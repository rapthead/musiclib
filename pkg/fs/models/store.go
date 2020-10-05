package models

import "time"

type FlacData struct {
	OriginPath       string
	ReplacementStart int64
	ReplacementEnd   int64
	MetaBlock        []byte
	Size             uint64

	CTime time.Time
	MTime time.Time
}
