package usecases

import (
	"database/sql"
	"fmt"
	"log"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/pkg/fs/pubsub"
	"github.com/rapthead/musiclib/utils"
)

var (
	queries       *persistance.Queries
	sqlDB         *sql.DB
	refreshPubSub pubsub.Refresh
	musiclibRoot  string
	// redisClient *redis.Client
)

func init() {
	musiclibRoot = utils.MustGetEnv("MUSICLIB_ROOT")
	if sqldb, err := sql.Open(
		"postgres",
		fmt.Sprintf(
			"host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
			utils.MustGetEnv("PGHOST"),
			utils.MustGetEnv("PGPORT"),
			utils.MustGetEnv("PGUSER"),
			utils.MustGetEnv("PGPASSWORD"),
			utils.MustGetEnv("PGDATABASE"),
		),
	); err != nil {
		log.Fatal(err)
	} else {
		sqlDB = sqldb
	}

	redisOptions, err := redis.ParseURL(utils.MustGetEnv("REDIS_URL"))
	if err != nil {
		log.Fatal("can't parse REDIS_URL env")
	}
	redisClient := redis.NewClient(redisOptions)

	queries = persistance.New(sqlDB)
	refreshPubSub = pubsub.NewRefresh(redisClient)
}
