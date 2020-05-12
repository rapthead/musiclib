package deps

import (
	"database/sql"

	"github.com/go-redis/redis/v7"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/persistance"
)

type Deps struct {
	musiclibRoot string

	sqlClient   *sql.DB
	redisClient *redis.Client
	queries     *persistance.Queries
}

func New() Deps {
	sqlClient := makeSqlClient()
	return Deps{
		config.Config.MusiclibRoot,

		sqlClient,
		makeRedis(),
		persistance.New(sqlClient),
	}
}

func (d Deps) MusiclibRoot() string {
	return d.musiclibRoot
}

func (d Deps) SQLClient() *sql.DB {
	return d.sqlClient
}

func (d Deps) RedisClient() *redis.Client {
	return d.redisClient
}

func (d Deps) Queries() *persistance.Queries {
	return d.queries
}
