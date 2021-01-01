//go:generate msgp

package models

import (
    "time"
	// "encoding/json"
)

type FlacData struct {
	OriginPath       string
	ReplacementStart int64
	ReplacementEnd   int64
	MetaBlock        []byte
	Size             uint64

	CTime time.Time
	MTime time.Time
}

// msgpack {
func (d *FlacData) Marshal() ([]byte, error) {
    return d.MarshalMsg(nil)
}

func (d *FlacData) Unmarshal(b []byte) (error) {
    _, err := d.UnmarshalMsg(b)
    return err
}
// msgpack }

// json {
// func (d *FlacData) Marshal() ([]byte, error) {
//     return json.Marshal(*d)
// }
// 
// func (d *FlacData) Unmarshal(b []byte) (error) {
//     return json.Unmarshal(b, d)
// }
// json }
