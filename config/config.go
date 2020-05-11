package config

import (
	"log"
	"os"

	"github.com/go-redis/redis/v7"
)

type ConfigData struct {
	PgHost     string
	PgPort     string
	PgUser     string
	PgPassword string
	PgDatabase string

	RedisOpts *redis.Options

	MusiclibRoot      string
	MusiclibMountPath string
}

var Config ConfigData

func init() {
	Config = ConfigData{
		PgHost:     MustGetEnv("PGHOST"),
		PgPort:     MustGetEnv("PGPORT"),
		PgUser:     MustGetEnv("PGUSER"),
		PgPassword: MustGetEnv("PGPASSWORD"),
		PgDatabase: MustGetEnv("PGDATABASE"),

		MusiclibRoot:      MustGetEnv("LIB_ROOT"),
		MusiclibMountPath: MustGetEnv("MOUNT_PATH"),
	}
	redisOptions, err := redis.ParseURL(MustGetEnv("REDIS_URL"))
	if err != nil {
		log.Fatal("can't parse MUSICLIB_REDIS_URL env")
	}
	Config.RedisOpts = redisOptions
}

func MustGetEnv(key string) string {
	envVal := os.Getenv("MUSICLIB_" + key)
	if envVal == "" {
		log.Fatal("expected environment variable")
	}
	return envVal
}
