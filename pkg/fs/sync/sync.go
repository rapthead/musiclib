package sync

import (
	"fmt"
	"os"
	"path"

	"github.com/rapthead/musiclib/pkg/fs/pubsub"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/utils"
)

type ProgressInfo struct {
	Path    string
	Total   int
	Current int
}

func Sync(
	musiclibRoot string,
	fuseStore store.FuseStore,
	entities []pubsub.FuseEntity,
) (<-chan ProgressInfo, <-chan error) {
	errorChan := make(chan error)
	progressChan := make(chan ProgressInfo)
	go func() {
		total := len(entities)
		for i, entity := range entities {
			progressChan <- ProgressInfo{
				entity.OriginPath,
				total,
				i,
			}

			absPath := path.Join(musiclibRoot, entity.OriginPath)
			stat, err := os.Stat(absPath)
			if err != nil {
				errorChan <- fmt.Errorf("Stat origin path error %s: %w", absPath, err)
				continue
			}

			blockStart, blockEnd, err := utils.GetVorbisCommentPos(absPath)
			if err != nil {
				errorChan <- fmt.Errorf("Vorbis parsing error %s: %w", absPath, err)
				continue
			}

			metaBlock, err := utils.EncodeVorbisComment(
				"musiclib", entity.VorbisComments,
			)
			if err != nil {
				errorChan <- fmt.Errorf("Encode new vorbis error %s: %w", absPath, err)
				continue
			}

			fuseStore.AddFlacPath(entity.FusePath, store.FlacData{
				OriginPath:       absPath,
				ReplacementStart: blockStart,
				ReplacementEnd:   blockEnd,
				MetaBlock:        metaBlock,
				Size:             uint64(stat.Size() + int64(len(metaBlock)) - (blockEnd - blockStart)),
			})
		}
		close(progressChan)
		close(errorChan)
	}()
	return progressChan, errorChan
}
