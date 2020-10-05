package deps

import (
	"github.com/go-redis/redis/v8"
	"github.com/rapthead/musiclib/config"
)

func makeRedis() *redis.Client {
	conf := config.Config
	return redis.NewClient(conf.RedisOpts)
}
