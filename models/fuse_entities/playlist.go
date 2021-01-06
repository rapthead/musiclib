package fuse_entities

import (
	"strings"

	"github.com/rapthead/musiclib/models"
)

// файл-плейлист
type PlaylistEntity struct {
	fusePath  string
	itemPaths []string
}

func NewPlaylistEntity(mm []models.Metadata) PlaylistEntity {
	itemPaths := []string{}
	for _, m := range mm {
		itemPaths = append(
			itemPaths, strings.Repeat("../", 3)+NewFuseFlacEntity(m).FusePath(),
		)
	}

	return PlaylistEntity{
		fusePath:  models.PlaylistFusePath(mm[0]),
		itemPaths: itemPaths,
	}
}

func (e PlaylistEntity) FusePath() string {
	return e.fusePath
}

func (e PlaylistEntity) Content() ([]byte, error) {
	return []byte("#EXTM3U\n" + strings.Join(e.itemPaths, "\n")), nil
}
