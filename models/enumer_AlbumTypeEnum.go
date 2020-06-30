package models

import (
	"fmt"

	"github.com/rapthead/musiclib/views"
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

func (e AlbumTypeEnum) SelectInput(fieldName string) views.SelectInputData {
	allEnumValues := AllAlbumTypeEnum

	options := make([]views.SelectOption, len(allEnumValues), len(allEnumValues))
	for i, enumValue := range allEnumValues {
		options[i] = views.SelectOption{
			Label:    string(enumValue),
			Value:    string(enumValue),
			Selected: enumValue == e,
		}
	}
	return views.SelectInputData{
		Name:    fieldName,
		Options: options,
	}
}
