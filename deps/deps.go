package deps

import (
	"github.com/go-redis/redis/v8"
	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/thumbnailer"
)

type Deps struct {
	musiclibRoot string

	coverStorage coverstorage.FSCoverStorage
	thumbnailer  thumbnailer.Thumbnailer

	sqlxClient  *sqlx.DB
	redisClient *redis.Client
	queries     *persistance.Queries
}

func New() Deps {
	sqlxClient := makeSqlxClient()
	return Deps{
		config.Config.MusiclibRoot,

		coverstorage.FSCoverStorage{StoragePath: config.Config.CoversPath},
		thumbnailer.Thumbnailer{CachePath: config.Config.CoversPath},

		sqlxClient,
		makeRedis(),
		persistance.New(sqlxClient),
	}
}

func (d Deps) MusiclibRoot() string {
	return d.musiclibRoot
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

func (d Deps) CoversStorage() coverstorage.FSCoverStorage {
	return d.coverStorage
}

func (d Deps) Thumbnailer() thumbnailer.Thumbnailer {
	return d.thumbnailer
}
