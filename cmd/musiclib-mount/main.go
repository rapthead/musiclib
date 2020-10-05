package main

import (
	"os"

	"github.com/go-redis/redis/v8"
	"github.com/sirupsen/logrus"

	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/pkg/fs/fuse"
)

func main() {
	conf := config.Config

	logger := logrus.New()
	logger.SetOutput(os.Stdout)
	logger.SetLevel(conf.LogLevel)

	rdb := redis.NewClient(conf.RedisOpts)
	fuse.Mount(
		rdb, logrus.NewEntry(logger).WithField("module", "mount"),
		conf.MusiclibMountPath,
	)
}
