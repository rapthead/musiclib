package config

import (
	"log"
	"os"

	"github.com/go-redis/redis/v7"
	"github.com/sirupsen/logrus"
)

type ConfigData struct {
	LogLevel   logrus.Level
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
		PgHost:     mustGetEnv("PGHOST"),
		PgPort:     mustGetEnv("PGPORT"),
		PgUser:     mustGetEnv("PGUSER"),
		PgPassword: mustGetEnv("PGPASSWORD"),
		PgDatabase: mustGetEnv("PGDATABASE"),

		MusiclibRoot:      mustGetEnv("LIB_ROOT"),
		MusiclibMountPath: mustGetEnv("MOUNT_PATH"),
	}

	logLevelEnv := getEnv("LOG_LEVEL")
	if logLevelEnv != "" {
		if logLevel, err := logrus.ParseLevel(getEnv("LOG_LEVEL")); err != nil {
			Config.LogLevel = logLevel
		} else {
			log.Fatalln("can't parse LOG_LEVEL environment variable", err)
		}
	} else {
		Config.LogLevel = logrus.WarnLevel
	}

	redisOptions, err := redis.ParseURL(mustGetEnv("REDIS_URL"))
	if err != nil {
		log.Fatal("can't parse MUSICLIB_REDIS_URL env")
	}
	Config.RedisOpts = redisOptions
}

func getEnv(key string) string {
	return os.Getenv("MUSICLIB_" + key)
}

func mustGetEnv(key string) string {
	envVal := getEnv(key)
	if envVal == "" {
		log.Fatal("expected environment variable")
	}
	return envVal
}
