package syncworker

import (
	"log"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/pkg/fs/pubsub"
	"github.com/rapthead/musiclib/pkg/fs/store"
	"github.com/rapthead/musiclib/pkg/fs/sync"
	"github.com/sirupsen/logrus"
)

const (
	doRefreshRecieveChannel = "fuse-refresh"
	doRefreshErrorsChannel  = "fuse-refresh-response"
)

type SyncWorker struct {
	refreshPubSub pubsub.Refresh
	rdb           *redis.Client
	logger        *logrus.Entry
	musiclibRoot  string
}

func NewSyncWorker(
	refreshPubSub pubsub.Refresh,
	rdb *redis.Client,
	logger *logrus.Entry,
	musiclibRoot string,
) SyncWorker {
	return SyncWorker{refreshPubSub, rdb, logger, musiclibRoot}
}

func (s SyncWorker) Serve() {
	ch := s.refreshPubSub.Sub()

	for entities := range ch {
		redisPipe := s.rdb.Pipeline()
		redisPipe.FlushDB()

		fuseStore := store.NewFuseStore(redisPipe)
		progressChan := sync.Sync(
			s.musiclibRoot,
			fuseStore,
			entities,
		)

		for pi := range progressChan {
			if pi.Error != nil {
				s.logger.Error("sync error:", pi.Error)
			} else {
				s.logger.Infof("process %d of %d: %s", pi.Current, pi.Total, pi.Path)
			}
		}

		if _, err := redisPipe.Exec(); err != nil {
			log.Fatal("redis pipeline exec error", err)
		}
	}
}
