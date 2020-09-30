package usecases

import (
	"context"
	"fmt"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
)

const (
	doRefreshChannel = "fuse-refresh"
)

type RefreshDeps interface {
	RedisClient() *redis.Client
	Queries() *persistance.Queries
}

type FuseEntity struct {
	OriginPath     string      `json:"originPath"`
	FusePath       string      `json:"fusePath"`
	VorbisComments [][2]string `json:"vorbisComments"`
}

func Refresh(deps RefreshDeps, ctx context.Context) <-chan LogEvent {
	rdb := deps.RedisClient()
	queries := deps.Queries()
	conf := config.Config

	logChan := make(chan LogEvent)
	logError := func(err error) {
		logChan <- LogEntry{
			err: err,
		}
	}
	logInfo := func(info string) {
		logChan <- LogEntry{
			info: info,
		}
	}

	go func() {
		defer close(logChan)
		logInfo("GetAllMetadata query started")
		allMetadata, err := queries.GetAllMetadata(ctx)
		if err != nil {
			logError(fmt.Errorf("Unable to fetch metadata: %w", err))
			return
		}

		fuseEntities := make([]sync.FuseEntity, len(allMetadata), len(allMetadata))
		for i, meta := range allMetadata {
			fuseEntities[i] = sync.FuseEntity{
				OriginPath:     meta.OriginalFilename,
				FusePath:       meta.FusePath(),
				VorbisComments: meta.VorbisComments(),
			}
		}

		redisPipe := rdb.Pipeline()
		redisPipe.FlushDB()

		progressChan := sync.Sync(conf.MusiclibRoot, store.NewFuseStore(redisPipe), fuseEntities)
		var allErrors []string
		for pi := range progressChan {
			if pi.Error != nil {
				err := fmt.Errorf("sync error: %w", pi.Error)
				logError(err)
				allErrors = append(allErrors, err.Error())
			} else {
				logInfo(
					fmt.Sprintf("process %d of %d: %s", pi.Current, pi.Total, pi.Path),
				)
			}
		}

		for _, errText := range allErrors {
			logInfo(errText)
		}

		if _, err := redisPipe.Exec(); err != nil {
			logError(fmt.Errorf("redis pipeline exec error: %w", err))
		}
	}()
	return logChan
}
