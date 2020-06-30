package models

import (
	"fmt"

	"github.com/rapthead/musiclib/views"
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

func (e DownloadSourceEnum) SelectInput(fieldName string) views.SelectInputData {
	allEnumValues := AllDownloadSourceEnum

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
