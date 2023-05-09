package fuse_entities

import (
	"strings"

	"github.com/rapthead/musiclib/models"
)

// файл-плейлист (группировка: <первая буква исполнителя (без the)>/<исполнитель>/<год>-<название альбома>.m3u)
type GroupedPlaylistEntity struct {
	fusePath  string
	itemPaths []string
}

func NewGroupedPlaylistEntity(mm []models.Metadata) GroupedPlaylistEntity {
	itemPaths := []string{}
	for _, m := range mm {
		itemPaths = append(
			itemPaths, strings.Repeat("../", 3)+NewFuseFlacEntity(m).FusePath(),
			// itemPaths, "/"+NewFuseFlacEntity(m).FusePath(),
		)
	}

	return GroupedPlaylistEntity{
		fusePath:  models.GroupedPlaylistFusePath(mm[0]),
		itemPaths: itemPaths,
	}
}

func (e GroupedPlaylistEntity) FusePath() string {
	return e.fusePath
}

func (e GroupedPlaylistEntity) Content() ([]byte, error) {
	return []byte("#EXTM3U\n" + strings.Join(e.itemPaths, "\n")), nil
}
