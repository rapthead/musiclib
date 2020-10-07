package coverstorage

import (
	"bytes"
	"context"
	"fmt"
	"io"

	"github.com/go-redis/redis/v8"
	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/thumbnailer"
)

type OriginalsCoverStorage interface {
	Get(id uuid.UUID) (string, io.ReadCloser, error)
}

type ThumbnailStorage struct {
	coverStorage OriginalsCoverStorage
	tnailer      thumbnailer.Thumbnailer
	client       redis.Cmdable
}

func NewThumbnailStorage(
	coverStorage OriginalsCoverStorage,
	tnailer thumbnailer.Thumbnailer,
	client redis.Cmdable,
) ThumbnailStorage {
	return ThumbnailStorage{coverStorage, tnailer, client}
}

func (ts ThumbnailStorage) Get(ctx context.Context, coverID uuid.UUID, maxWidth, maxHeight uint) (string, []byte, error) {
	mime := "image/jpeg"
	redisKey := fmt.Sprintf("%s:%dx%d", coverID.String(), maxWidth, maxHeight)

	content, err := ts.client.Get(ctx, redisKey).Result()
	if err == nil && len(content) > 0 {
		return mime, []byte(content), nil
	} else if err != nil && err != redis.Nil {
		return mime, nil, fmt.Errorf("thumnail cache getting error: %w", err)
	}

	_, file, err := ts.coverStorage.Get(coverID)
	if err != nil {
		return mime, nil, fmt.Errorf("unable to get thumbnail from store: %w", err)
	}
	defer file.Close()

	var thumbBuf bytes.Buffer
	err = ts.tnailer.Thumbnail(&thumbBuf, file, 300, 300)
	if err != nil {
		return mime, nil, fmt.Errorf("error in streaming image to client: %w", err)
	}
	ts.client.Set(ctx, redisKey, thumbBuf.String(), 0)

	return mime, thumbBuf.Bytes(), nil
}
