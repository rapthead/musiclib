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

func SyncFlacs(
	musiclibRoot string,
	fuseStore *store.FuseStore,
	entities []FuseFlacEntity,
) <-chan ProgressInfo {
	progressChan := make(chan ProgressInfo)
	go func() {
		defer close(progressChan)
		total := len(entities)
		for i, entity := range entities {
			absPath := path.Join(musiclibRoot, entity.OriginPath())
			stat, err := os.Stat(absPath)
			if err != nil {
				if os.IsNotExist(err) {
					progressChan <- ProgressInfo{
						Error: fmt.Errorf("File not found %s", absPath),
					}
				} else {
					progressChan <- ProgressInfo{
						Error: fmt.Errorf("Stat origin path error %s: %w", absPath, err),
					}
				}
				continue
			}

			blockStart, blockEnd, err := utils.GetVorbisCommentPos(absPath)
			if err != nil {
				progressChan <- ProgressInfo{
					Error: fmt.Errorf("Vorbis parsing error %s: %w", absPath, err),
				}
				continue
			}

			metaBlock, err := utils.EncodeVorbisComment(
				"musiclib", entity.VorbisComments(),
			)
			if err != nil {
				progressChan <- ProgressInfo{
					Error: fmt.Errorf("Encode new vorbis error %s: %w", absPath, err),
				}
				continue
			}

			fuseStore.AddFlacPath(context.TODO(), entity.FusePath(), models.FlacData{
				OriginPath:       absPath,
				ReplacementStart: blockStart,
				ReplacementEnd:   blockEnd,
				MetaBlock:        metaBlock,
				Size:             uint64(stat.Size() + int64(len(metaBlock)) - (blockEnd - blockStart)),
				CTime:            entity.CTime(),
				MTime:            entity.MTime(),
			})

			progressChan <- ProgressInfo{
				entity.OriginPath(),
				total,
				i + 1,
				nil,
			}
		}
	}()
	return progressChan
}
