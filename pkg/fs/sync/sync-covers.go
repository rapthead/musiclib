package sync

import (
	"bytes"
	"context"
	"fmt"
	"time"

	"github.com/gofrs/uuid"

	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/thumbnailer"
)

type FuseCoverEntity interface {
	ID() uuid.UUID
	FusePath() string
	CTime() time.Time
	MTime() time.Time
}

func SyncCovers(
	storage coverstorage.FSCoverStorage,
	thumbnailer thumbnailer.Thumbnailer,
	fuseStore *store.FuseStore,
	entities []FuseCoverEntity,
) <-chan ProgressInfo {
	progressChan := make(chan ProgressInfo)
	go func() {
		defer close(progressChan)
		total := len(entities)
		for i, entity := range entities {
			_, file, err := storage.Get(entity.ID())
			if err != nil {
				progressChan <- ProgressInfo{
					Error: fmt.Errorf("Get file for %s error: %w", entity.FusePath(), err),
				}
				continue
			}
			defer file.Close()

			var thumbBuf bytes.Buffer
			thumbnailer.Thumbnail(&thumbBuf, file, 300, 300)

			fuseStore.AddCoverPath(context.TODO(), entity.FusePath(), &thumbBuf)

			progressChan <- ProgressInfo{
				entity.FusePath(),
				total,
				i + 1,
				nil,
			}
		}
	}()
	return progressChan
}
