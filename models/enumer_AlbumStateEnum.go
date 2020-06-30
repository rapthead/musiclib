package models

import (
	"fmt"

	"github.com/rapthead/musiclib/views"
)

var AllAlbumStateEnum = []AlbumStateEnum{
	AlbumStateEnumDisabled,
	AlbumStateEnumEnabled,
	AlbumStateEnumDeleted,
	AlbumStateEnumDraft,
}

func (e AlbumStateEnum) IsValid() bool {
	switch e {
	case
		AlbumStateEnumDisabled,
		AlbumStateEnumEnabled,
		AlbumStateEnumDeleted,
		AlbumStateEnumDraft:
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

func (e AlbumStateEnum) SelectInput(fieldName string) views.SelectInputData {
	allEnumValues := AllAlbumStateEnum

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
