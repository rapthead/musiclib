package deps

import (
	"context"
	"log"

	"github.com/go-redis/redis/v8"
	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/config"
	"github.com/rapthead/musiclib/coverstorage"
	"github.com/rapthead/musiclib/persistance"
	"github.com/rapthead/musiclib/thumbnailer"
)

type Deps struct {
	musiclibRoot string

	coverStorage     coverstorage.FSCoverStorage
	thumbnailStorage coverstorage.ThumbnailStorage
	thumbnailer      thumbnailer.Thumbnailer

	sqlxClient  *sqlx.DB
	redisClient *redis.Client
	queries     *persistance.Queries
}

func New() Deps {
	sqlxClient := makeSqlxClient()

	fsCoverStorage := coverstorage.FSCoverStorage{StoragePath: config.Config.CoversPath}
	tnailer := thumbnailer.Thumbnailer{}

	redisClient := makeRedis()
	thumbnailConn := redisClient.Conn(context.TODO())
	if err := thumbnailConn.Select(context.TODO(), config.ThumbnailsDBIndex).Err(); err != nil {
		log.Fatalf("can't select thumbnail redis db")
	}
	return Deps{
		config.Config.MusiclibRoot,

		fsCoverStorage,
		coverstorage.NewThumbnailStorage(
			fsCoverStorage,
			tnailer,
			thumbnailConn,
		),
		tnailer,

		sqlxClient,
		redisClient,
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

func (d Deps) ThumbnailStorage() coverstorage.ThumbnailStorage {
	return d.thumbnailStorage
}

func (d Deps) Thumbnailer() thumbnailer.Thumbnailer {
	return d.thumbnailer
}
