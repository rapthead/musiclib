package sync

import (
	"fmt"
	"os"
	"path"

	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/utils"
)

type FuseEntity struct {
	OriginPath     string      `json:"originPath"`
	FusePath       string      `json:"fusePath"`
	VorbisComments [][2]string `json:"vorbisComments"`
}

type ProgressInfo struct {
	Path    string
	Total   int
	Current int
	Error   error
}

func Sync(
	musiclibRoot string,
	fuseStore store.FuseStore,
	entities []FuseEntity,
) <-chan ProgressInfo {
	progressChan := make(chan ProgressInfo)
	go func() {
		defer close(progressChan)
		total := len(entities)
		for i, entity := range entities {
			absPath := path.Join(musiclibRoot, entity.OriginPath)
			stat, err := os.Stat(absPath)
			if err != nil {
				progressChan <- ProgressInfo{
					Error: fmt.Errorf("Stat origin path error %s: %w", absPath, err),
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
				"musiclib", entity.VorbisComments,
			)
			if err != nil {
				progressChan <- ProgressInfo{
					Error: fmt.Errorf("Encode new vorbis error %s: %w", absPath, err),
				}
				continue
			}

			fuseStore.AddFlacPath(entity.FusePath, store.FlacData{
				OriginPath:       absPath,
				ReplacementStart: blockStart,
				ReplacementEnd:   blockEnd,
				MetaBlock:        metaBlock,
				Size:             uint64(stat.Size() + int64(len(metaBlock)) - (blockEnd - blockStart)),
			})

			progressChan <- ProgressInfo{
				entity.OriginPath,
				total,
				i + 1,
				nil,
			}
		}
	}()
	return progressChan
}
