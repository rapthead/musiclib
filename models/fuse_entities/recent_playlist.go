package fuse_entities

import (
	"strings"

	"github.com/rapthead/musiclib/models"
)

// файл-плейлист (группировка: <первая буква исполнителя (без the)>/<исполнитель>/<год>-<название альбома>.m3u)
type RecentPlaylistEntity struct {
	fusePath  string
	itemPaths []string
}

func NewRecentPlaylistEntity(mm []models.Metadata) RecentPlaylistEntity {
	itemPaths := []string{}
	for _, m := range mm {
		itemPaths = append(
			itemPaths, "../"+NewFuseFlacEntity(m).FusePath(),
		)
	}

	return RecentPlaylistEntity{
		fusePath:  models.RecentPlaylistFusePath(mm[0]),
		itemPaths: itemPaths,
	}
}

func (e RecentPlaylistEntity) FusePath() string {
	return e.fusePath
}

func (e RecentPlaylistEntity) Content() ([]byte, error) {
	return []byte("#EXTM3U\n" + strings.Join(e.itemPaths, "\n")), nil
}
