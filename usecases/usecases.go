package usecases

import (
	"database/sql"
	"fmt"
	"log"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/persistance"
)

var (
	queries      *persistance.Queries
	sqlDB        *sql.DB
	rdb          *redis.Client
	musiclibRoot string
	// redisClient *redis.Client
)

func init() {
	conf := config.Config
	musiclibRoot = conf.MusiclibRoot
	if sqldb, err := sql.Open(
		"postgres",
		fmt.Sprintf(
			"host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
			conf.PgHost,
			conf.PgPort,
			conf.PgUser,
			conf.PgPassword,
			conf.PgDatabase,
		),
	); err != nil {
		log.Fatal(err)
	} else {
		sqlDB = sqldb
	}

	rdb = redis.NewClient(conf.RedisOpts)
	queries = persistance.New(sqlDB)
}
