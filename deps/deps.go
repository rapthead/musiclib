package deps

import (
	"database/sql"

	"github.com/go-redis/redis/v7"
	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/persistance2"
)

type Deps struct {
	musiclibRoot string

	sqlClient   *sql.DB
	sqlxClient  *sqlx.DB
	redisClient *redis.Client
	queries     *persistance.Queries
	queries2    *persistance2.Queries
}

func New() Deps {
	sqlClient := makeSqlClient()
	sqlxClient := makeSqlxClient()
	return Deps{
		config.Config.MusiclibRoot,

		sqlClient,
		sqlxClient,
		makeRedis(),
		persistance.New(sqlClient),
		persistance2.New(sqlxClient),
	}
}

func (d Deps) MusiclibRoot() string {
	return d.musiclibRoot
}

func (d Deps) SQLClient() *sql.DB {
	return d.sqlClient
}

func (d Deps) SQLXClient() *sqlx.DB {
	return d.sqlxClient
}

func (d Deps) RedisClient() *redis.Client {
	return d.redisClient
}

func (d Deps) Queries() *persistance.Queries {
	return d.queries
}

func (d Deps) Queries2() *persistance2.Queries {
	return d.queries2
}
