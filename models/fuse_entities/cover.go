package fuse_entities

import (
	"context"
	"fmt"

	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/models"
)

// обертка, реализующая создание файла-обложки
type FuseCoverEntity struct {
	thumbnailer coverstorage.ThumbnailStorage
	m           models.FuseCover
}

func NewFuseCoverEntity(
	thumbnailer coverstorage.ThumbnailStorage,
	m models.FuseCover,
) FuseCoverEntity {
	return FuseCoverEntity{thumbnailer, m}
}

func (e FuseCoverEntity) FusePath() string {
	return models.CoverFusePath(e.m)
}

func (e FuseCoverEntity) Content() ([]byte, error) {
	_, content, err := e.thumbnailer.Get(context.TODO(), e.m.CoverID, 300, 300)
	if err != nil {
		return content, fmt.Errorf("Thumbnail processing error: %w", err)
	}
	return content, nil
}
