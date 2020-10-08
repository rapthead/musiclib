package store

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"strings"
	"syscall"
	"time"

	redis "github.com/go-redis/redis/v8"

	"github.com/rapthead/musiclib/pkg/fs/models"
)

func fmtError(info string, err error) error {
	return fmt.Errorf("(store) %s: %v", info, err)
}

// entity was not found
var NotFound = errors.New("entity not found")

type entityType string

const (
	DIR          entityType = "d"
	FLAC_FILE               = "f"
	CONTENT_FILE            = "c"
)

type fusePath string

func preparePath(rawPath string) string {
	return strings.Trim(rawPath, "/")
}

type FuseStore struct {
	client redis.Cmdable
}

func NewFuseStore(client redis.Cmdable) *FuseStore {
	return &FuseStore{client}
}

func (s *FuseStore) AddFlacPath(ctx context.Context, rawPath string, input models.FlacData) error {
	propsJson, err := json.Marshal(input)
	if err != nil {
		return fmtError("flac file marshaling error", err)
	}

	fusePath := preparePath(rawPath)
	s.addDirs(ctx, FLAC_FILE, fusePath)

	s.client.Set(ctx, "type:"+fusePath, string(FLAC_FILE), 0)
	s.client.Set(ctx, "content:"+fusePath, propsJson, 0)

	return nil
}

func (s *FuseStore) AddContentPath(ctx context.Context, rawPath string, data []byte) error {
	fusePath := preparePath(rawPath)
	s.addDirs(ctx, CONTENT_FILE, fusePath)

	s.client.Set(ctx, "type:"+fusePath, string(CONTENT_FILE), 0)
	s.client.Set(ctx, "content:"+fusePath, string(data), 0)
	return nil
}

func (s *FuseStore) addDirs(ctx context.Context, fileET entityType, path string) {
	pathChunks := strings.Split(path, "/")

	var parentPath string
	for i, pathChunk := range pathChunks {
		var et entityType
		if i < len(pathChunks)-1 {
			et = DIR
		} else {
			et = fileET
		}
		s.client.Set(ctx, "type:"+parentPath, string(DIR), 0)
		s.client.SAdd(ctx, "members:"+parentPath, string(et)+":"+pathChunk)

		if i == 0 {
			parentPath = pathChunk
		} else {
			parentPath = parentPath + "/" + pathChunk
		}
	}
}

func (s *FuseStore) GetItem(ctx context.Context, rawPath string) (models.FSItem, error) {
	fusePath := preparePath(rawPath)
	itemType, err := s.getType(ctx, fusePath)
	if err != nil {
		return nil, err
	}

	switch itemType {
	case DIR:
		return dirFsItem{}, nil
	case FLAC_FILE:
		return s.GetFlacFile(ctx, rawPath)
	case CONTENT_FILE:
		return s.GetContentFile(ctx, rawPath)
	default:
		return nil, NotFound
	}
}

func (s *FuseStore) GetFile(ctx context.Context, rawPath string) (models.File, error) {
	fusePath := preparePath(rawPath)
	itemType, err := s.getType(ctx, fusePath)
	if err != nil {
		return nil, err
	}

	switch itemType {
	case FLAC_FILE:
		return s.GetFlacFile(ctx, rawPath)
	case CONTENT_FILE:
		return s.GetContentFile(ctx, rawPath)
	default:
		return nil, NotFound
	}
}

func (s *FuseStore) GetDir(ctx context.Context, rawPath string) ([]models.DirItem, error) {
	fusePath := preparePath(rawPath)
	members, err := s.client.SMembers(ctx, "members:"+fusePath).Result()
	if err != nil {
		return nil, fmtError("getting dir items error", err)
	}

	result := make([]models.DirItem, len(members))
	for i, member := range members {
		x := strings.SplitN(member, ":", 2)
		fsType, name := entityType(x[0]), x[1]
		var item dirItem
		switch fsType {
		case DIR:
			item = dirItem{
				name,
				syscall.S_IFDIR,
			}
		default:
			item = dirItem{
				name,
				syscall.S_IFREG,
			}
		}
		result[i] = item
	}
	return result, nil
}

func (s *FuseStore) GetFlacFile(ctx context.Context, rawPath string) (models.File, error) {
	fusePath := preparePath(rawPath)
	propsJson, err := s.client.Get(ctx, "content:"+fusePath).Result()

	if err != nil {
		return nil, fmtError("getting flac data error", err)
	}

	fd := models.FlacData{}
	if err := json.Unmarshal([]byte(propsJson), &fd); err != nil {
		return nil, fmtError("parsing flac data error", err)
	}

	return models.NewFlacFile(fd)
}

func (s *FuseStore) GetContentFile(ctx context.Context, rawPath string) (models.File, error) {
	fusePath := preparePath(rawPath)
	content, err := s.client.Get(ctx, "content:"+fusePath).Result()

	if err != nil {
		return nil, fmtError(
			fmt.Sprintf("getting cover file error (%s)", fusePath), err,
		)
	}

	return models.NewContentFile([]byte(content)), nil
}

func (s *FuseStore) getType(ctx context.Context, rawPath string) (entityType, error) {
	fusePath := preparePath(rawPath)
	rawType, err := s.client.Get(ctx, "type:"+fusePath).Result()
	if err != nil {
		return DIR, fmtError("getting file type error", err)
	}

	return entityType(rawType), nil
}

// элемент списка файлов директории
type dirItem struct {
	name string
	mode uint32
}

func (d dirItem) Name() string {
	return d.name
}

func (d dirItem) Mode() uint32 {
	return d.mode
}

// захардкоженые атрибуты директории
type dirFsItem struct{}

func (d dirFsItem) Size() uint64 {
	return 0
}

func (d dirFsItem) Mode() uint32 {
	return syscall.S_IFDIR | 0755
}

func (d dirFsItem) ATime() *time.Time {
	return nil
}

func (d dirFsItem) MTime() *time.Time {
	return nil
}

func (d dirFsItem) CTime() *time.Time {
	return nil
}
