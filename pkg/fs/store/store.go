package store

import (
	"encoding/json"
	"errors"
	"fmt"
	"strings"

	redis "github.com/go-redis/redis/v7"
)

func fmtError(info string, err error) error {
	return fmt.Errorf("(store) %s: %v", info, err)
}

type FlacData struct {
	OriginPath       string
	ReplacementStart int64
	ReplacementEnd   int64
	MetaBlock        []byte
	Size             uint64
}

var NotFound = errors.New("entity not found")

type EntityType string

const (
	DIR       EntityType = "d"
	FLAC_FILE            = "f"
)

func preparePath(rawPath string) string {
	return strings.Trim(rawPath, "/")
}

type FuseStore struct {
	client redis.Cmdable
}

func NewFuseStore(client redis.Cmdable) FuseStore {
	return FuseStore{client}
}

func (s *FuseStore) AddFlacPath(rawPath string, input FlacData) error {
	fusePath := preparePath(rawPath)
	pathChunks := strings.Split(fusePath, "/")

	var parentPath string
	for i, pathChunk := range pathChunks {
		if i < len(pathChunks)-1 {
			s.client.SAdd(parentPath, string(DIR)+":"+pathChunk)
		} else {
			if propsJson, err := json.Marshal(input); err != nil {
				return fmtError("getting file type error", err)
			} else {
				s.client.SAdd(parentPath, string(FLAC_FILE)+":"+pathChunk)
				s.client.Set(fusePath, propsJson, 0)
			}
		}

		if i == 0 {
			parentPath = pathChunk
		} else {
			parentPath = parentPath + "/" + pathChunk
		}
	}
	return nil
}

func (s *FuseStore) Type(rawPath string) (EntityType, error) {
	fusePath := preparePath(rawPath)
	keyType, err := s.client.Type(fusePath).Result()
	if err != nil {
		return DIR, fmtError("getting file type error", err)
	}

	switch keyType {
	case "set":
		return DIR, nil
	case "string":
		return FLAC_FILE, nil
	default:
		return DIR, NotFound
	}
}

type ListDirItem struct {
	Name string
	Type EntityType
}

func (s *FuseStore) ListDir(rawPath string) ([]ListDirItem, error) {
	fusePath := preparePath(rawPath)
	members, err := s.client.SMembers(fusePath).Result()
	if err != nil {
		return []ListDirItem{}, fmtError("getting dir items error", err)
	}

	result := make([]ListDirItem, len(members))
	for i, member := range members {
		x := strings.SplitN(member, ":", 2)
		fuseType, name := EntityType(x[0]), x[1]
		result[i] = ListDirItem{
			Type: fuseType,
			Name: name,
		}
	}
	return result, nil
}

func (s *FuseStore) GetFlacProps(rawPath string) (FlacData, error) {
	fusePath := preparePath(rawPath)
	propsJson, err := s.client.Get(fusePath).Result()

	fd := FlacData{}
	if err != nil {
		return fd, fmtError("getting flac data error", err)
	}

	if err := json.Unmarshal([]byte(propsJson), &fd); err != nil {
		return fd, fmtError("parsing flac data error", err)
	}
	return fd, nil
}
