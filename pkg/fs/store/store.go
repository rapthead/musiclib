package store

import (
	"context"
	"errors"
	"fmt"
	"path"
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

type FuseStore struct {
	client redis.Cmdable
}

func NewFuseStore(client redis.Cmdable) *FuseStore {
	return &FuseStore{client}
}

func (s *FuseStore) RemovePath(ctx context.Context, rawPath string) error {
	s.removeDirs(ctx, NewFusePath(rawPath))

	return nil
}

func (s *FuseStore) removeDirs(ctx context.Context, path IFusePath) {
	p := path
	for p != nil {
		parent := p.Parent()
		if parent == nil {
			return
		}

		dirname := parent.Path()
		s.client.SRem(ctx, "members:"+dirname, p.Base())
		scardVal, err := s.client.SCard(ctx, "members:"+dirname).Result()
		if err != nil {
			panic(err)
		}

		if scardVal == 0 {
			s.client.Del(ctx, "members:"+dirname)
			s.client.Del(ctx, "type:"+dirname)
		}

		p = parent
	}
}

func (s *FuseStore) AddFlacPath(ctx context.Context, rawPath string, input models.FlacData) error {
	serializedData, err := input.Marshal()
	if err != nil {
		return fmtError("flac file marshaling error", err)
	}

	path := NewFusePath(rawPath)
	s.addFileEntry(ctx, path, FLAC_FILE, serializedData)
	return nil
}

func (s *FuseStore) AddContentPath(ctx context.Context, rawPath string, data []byte) error {
	path := NewFusePath(rawPath)
	s.addFileEntry(ctx, path, CONTENT_FILE, data)
	return nil
}

func (s *FuseStore) addFileEntry(
	ctx context.Context,
	fusePath IFusePath,
	et entityType,
	content []byte,
) {
	parent := fusePath.Parent()
	if parent != nil {
		s.client.SAdd(ctx, "members:"+parent.Path(), fusePath.Base())
	}
	s.client.Set(ctx, "type:"+fusePath.Path(), string(et), 0).Val()
	s.client.Set(ctx, "content:"+fusePath.Path(), content, 0).Val()

	for p := fusePath.Parent(); p != nil; p = p.Parent() {
		s.addDirEntry(ctx, p)
	}
}

// return is parent exists (recursion stop flag)
func (s *FuseStore) addDirEntry(ctx context.Context, fusePath IFusePath) {
	parent := fusePath.Parent()
	if parent != nil {
		s.client.SAdd(ctx, "members:"+parent.Path(), fusePath.Base())
	}
	s.client.SetNX(ctx, "type:"+fusePath.Path(), string(DIR), 0).Result()
}

func (s *FuseStore) GetItem(ctx context.Context, path string) (models.FSItem, error) {
	itemType, err := s.getType(ctx, path)
	if err != nil {
		return nil, err
	}

	switch itemType {
	case DIR:
		return dirFsItem{}, nil
	case FLAC_FILE:
		return s.GetFlacFile(ctx, path)
	case CONTENT_FILE:
		return s.GetContentFile(ctx, path)
	default:
		return nil, NotFound
	}
}

func (s *FuseStore) GetFile(ctx context.Context, path string) (models.File, error) {
	itemType, err := s.getType(ctx, path)
	if err != nil {
		return nil, err
	}

	switch itemType {
	case FLAC_FILE:
		return s.GetFlacFile(ctx, path)
	case CONTENT_FILE:
		return s.GetContentFile(ctx, path)
	default:
		return nil, NotFound
	}
}

func (s *FuseStore) GetDir(ctx context.Context, fusePath string) ([]models.DirItem, error) {
	members, err := s.client.SMembers(ctx, "members:"+fusePath).Result()
	if err != nil {
		return nil, fmtError("getting dir items error", err)
	}

	typeKeys := make([]string, len(members))
	for i, member := range members {
		typeKeys[i] = "type:" + path.Join(fusePath, member)
	}

	vals, err := s.client.MGet(ctx, typeKeys...).Result()
	if err != nil {
		return nil, fmtError("getting dir item types error", err)
	}

	result := make([]models.DirItem, len(members))
	for i, val := range vals {
		if val == redis.Nil {
			return nil, fmt.Errorf("assertion error not found key: %s", typeKeys[i])
		}
		fsType := entityType(val.(string))

		name := members[i]
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

func (s *FuseStore) GetFlacFile(ctx context.Context, path string) (models.File, error) {
	serializedData, err := s.client.Get(ctx, "content:"+path).Result()

	if err != nil {
		return nil, fmtError("getting flac data error", err)
	}

	fd := models.FlacData{}
	if err := fd.Unmarshal([]byte(serializedData)); err != nil {
		return nil, fmtError("parsing flac data error", err)
	}

	return models.NewFlacFile(fd)
}

func (s *FuseStore) GetContentFile(ctx context.Context, path string) (models.File, error) {
	content, err := s.client.Get(ctx, "content:"+path).Result()

	if err != nil {
		return nil, fmtError(
			fmt.Sprintf("getting cover file error (%s)", path), err,
		)
	}

	return models.NewContentFile([]byte(content)), nil
}

func (s *FuseStore) getType(ctx context.Context, path string) (entityType, error) {
	strType, err := s.client.Get(ctx, "type:"+path).Result()
	if err != nil {
		if err == redis.Nil {
			return DIR, NotFound
		}
		return DIR, fmtError("getting file type error", err)
	}

	return entityType(strType), nil
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
