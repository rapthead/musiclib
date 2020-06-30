package models

import (
	"fmt"

	"github.com/rapthead/musiclib/views"
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

func (e CoverTypeEnum) SelectInput(fieldName string) views.SelectInputData {
	allEnumValues := AllCoverTypeEnum

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
