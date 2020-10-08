package sync

import (
	"context"
	"fmt"

	"github.com/rapthead/musiclib/pkg/fs/store"
)

type ContentEntity interface {
	FusePath() string
	Content() ([]byte, error)
}

func SyncContent(
	fuseStore *store.FuseStore,
	entities []ContentEntity,
) <-chan ProgressInfo {
	progressChan := make(chan ProgressInfo)
	go func() {
		defer close(progressChan)
		total := len(entities)
		for i, entity := range entities {
			content, err := entity.Content()
			if err != nil {
				progressChan <- ProgressInfo{
					Error: fmt.Errorf("Getting item content error %s: %w", entity.FusePath(), err),
				}
				continue
			}
			fuseStore.AddContentPath(context.TODO(), entity.FusePath(), content)

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
