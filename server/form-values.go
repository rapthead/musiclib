package server

import (
	"net/url"
	"strconv"
)

type values struct{ url.Values }

func (v values) GetInt(key string) int64 {
	strInt := v.Get(key)
	if strInt == "" {
		return 0
	}
	val, _ := strconv.ParseInt(strInt, 10, 64)
	return val
}
