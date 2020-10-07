package sync

import (
	"context"
	"fmt"
	"time"

	"github.com/gofrs/uuid"

	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/pkg/fs/store"
)

type FuseCoverEntity interface {
	ID() uuid.UUID
	FusePath() string
	CTime() time.Time
	MTime() time.Time
}

func SyncCovers(
	thumbnailer coverstorage.ThumbnailStorage,
	fuseStore *store.FuseStore,
	entities []FuseCoverEntity,
) <-chan ProgressInfo {
	progressChan := make(chan ProgressInfo)
	go func() {
		defer close(progressChan)
		total := len(entities)
		for i, entity := range entities {
			_, content, err := thumbnailer.Get(context.TODO(), entity.ID(), 300, 300)
			if err != nil {
				progressChan <- ProgressInfo{
					Error: fmt.Errorf("Thumbnail processing error %s: %w", entity.FusePath(), err),
				}
				continue
			}

			fuseStore.AddCoverPath(context.TODO(), entity.FusePath(), content)

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
