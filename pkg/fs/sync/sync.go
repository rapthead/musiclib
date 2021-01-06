package sync

import (
	"context"
	"fmt"
	"os"
	"path"
	"time"

	"github.com/rapthead/musiclib/pkg/fs/models"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/utils"
)

type FuseFlacEntity interface {
	OriginPath() string
	FusePath() string
	VorbisComments() [][2]string
	CTime() time.Time
	MTime() time.Time
}

type ProgressInfo struct {
	Path    string
	Total   int
	Current int
	Error   error
}

type ContentEntity interface {
	FusePath() string
	Content() ([]byte, error)
}

type FuseSync struct {
	musiclibRoot string
	fuseStore    *store.FuseStore
}

func NewFuseSync(
	musiclibRoot string,
	fuseStore *store.FuseStore,
) FuseSync {
	return FuseSync{musiclibRoot, fuseStore}
}

func (f FuseSync) processFlacEntity(entity FuseFlacEntity) error {
	absPath := path.Join(f.musiclibRoot, entity.OriginPath())
	stat, err := os.Stat(absPath)
	if err != nil {
		if os.IsNotExist(err) {
			return fmt.Errorf("File not found %s", absPath)
		}
		return fmt.Errorf("Stat origin path error %s: %w", absPath, err)
	}

	blockStart, blockEnd, err := utils.GetVorbisCommentPos(absPath)
	if err != nil {
		return fmt.Errorf("Vorbis parsing error %s: %w", absPath, err)
	}

	metaBlock, err := utils.EncodeVorbisComment(
		"musiclib", entity.VorbisComments(),
	)
	if err != nil {
		return fmt.Errorf("Encode new vorbis error %s: %w", absPath, err)
	}

	f.fuseStore.AddFlacPath(context.TODO(), entity.FusePath(), models.FlacData{
		OriginPath:       absPath,
		ReplacementStart: blockStart,
		ReplacementEnd:   blockEnd,
		MetaBlock:        metaBlock,
		Size:             uint64(stat.Size() + int64(len(metaBlock)) - (blockEnd - blockStart)),
		CTime:            entity.CTime(),
		MTime:            entity.MTime(),
	})

	return nil
}

func (f FuseSync) processContent(entity ContentEntity) error {
	content, err := entity.Content()
	if err != nil {
		return fmt.Errorf("Getting item content error %s: %w", entity.FusePath(), err)
	}
	f.fuseStore.AddContentPath(context.TODO(), entity.FusePath(), content)
	return nil
}

func (f FuseSync) SyncFlacs(entities []FuseFlacEntity) error {
	for _, entity := range entities {
		err := f.processFlacEntity(entity)

		if err != nil {
			return err
		}
	}
	return nil
}

func (f FuseSync) SyncFlacsChan(entities []FuseFlacEntity) <-chan ProgressInfo {
	progressChan := make(chan ProgressInfo)
	go func() {
		defer close(progressChan)
		total := len(entities)
		for i, entity := range entities {
			err := f.processFlacEntity(entity)

			if err != nil {
				progressChan <- ProgressInfo{
					Error: err,
				}
			} else {
				progressChan <- ProgressInfo{
					entity.OriginPath(),
					total,
					i + 1,
					nil,
				}
			}
		}
	}()
	return progressChan
}

func (f FuseSync) SyncContent(entities []ContentEntity) error {
	for _, entity := range entities {
		err := f.processContent(entity)

		if err != nil {
			return err
		}
	}
	return nil
}

func (f FuseSync) SyncContentChan(entities []ContentEntity) <-chan ProgressInfo {
	progressChan := make(chan ProgressInfo)
	go func() {
		defer close(progressChan)
		total := len(entities)
		for i, entity := range entities {
			err := f.processContent(entity)
			if err != nil {
				progressChan <- ProgressInfo{
					Error: err,
				}
				continue
			}

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
