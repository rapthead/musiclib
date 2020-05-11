package main

import (
	"os"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/pkg/fs/fuse"
	"github.com/rapthead/musiclib/pkg/fs/pubsub"
	"github.com/rapthead/musiclib/pkg/fs/sync"
	"github.com/rapthead/musiclib/utils"
	"github.com/sirupsen/logrus"
)

func init() {
	logrus.SetOutput(os.Stdout)
	logrus.SetLevel(logrus.WarnLevel)
}

func syncWorker(rdb *redis.Client, logger *logrus.Entry, musiclibRoot string) {
	sync.NewSyncWorker(pubsub.NewRefresh(rdb), rdb, logger, musiclibRoot).Serve()
}

func main() {
	logger := logrus.New()

	musiclibRoot := utils.MustGetEnv("MUSICLIB_ROOT")
	mountPath := utils.MustGetEnv("MOUNT_PATH")

	rdb := redis.NewClient(&redis.Options{
		Addr:     os.Getenv("REDIS_ADR"),
		Password: "",
		DB:       1,
	})
	go syncWorker(
		rdb, logrus.NewEntry(logger).WithField("module", "sync"),
		musiclibRoot,
	)
	fuse.Mount(
		rdb, logrus.NewEntry(logger).WithField("module", "mount"),
		mountPath,
	)
}
