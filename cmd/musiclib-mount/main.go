package main

import (
	"os"

	"github.com/go-redis/redis/v7"
	"github.com/sirupsen/logrus"

	"github.com/rapthead/musiclib/cmd/musiclib-mount/syncworker"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/pkg/fs/fuse"
	"github.com/rapthead/musiclib/pkg/fs/pubsub"
)

func init() {
	logrus.SetOutput(os.Stdout)
	logrus.SetLevel(logrus.WarnLevel)
}

func syncWorker(rdb *redis.Client, logger *logrus.Entry, musiclibRoot string) {
	syncworker.NewSyncWorker(pubsub.NewRefresh(rdb), rdb, logger, musiclibRoot).Serve()
}

func main() {
	logger := logrus.New()
	conf := config.Config

	rdb := redis.NewClient(conf.RedisOpts)
	go syncWorker(
		rdb, logrus.NewEntry(logger).WithField("module", "sync"),
		conf.MusiclibRoot,
	)
	fuse.Mount(
		rdb, logrus.NewEntry(logger).WithField("module", "mount"),
		conf.MusiclibMountPath,
	)
}
