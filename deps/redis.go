package deps

import (
	"fmt"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/config"
)

func makeRedis() *redis.Client {
	conf := config.Config
	fmt.Println(conf.RedisOpts)
	return redis.NewClient(conf.RedisOpts)
}
