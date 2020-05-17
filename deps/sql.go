package deps

import (
	"database/sql"
	"log"

	"github.com/jmoiron/sqlx"
	"github.com/rapthead/musiclib/config"
)

func makeSqlClient() *sql.DB {
	conf := config.Config
	sqldb, err := sql.Open("postgres", conf.PostgresConnStr)
	if err != nil {
		log.Fatal(err)
	}
	return sqldb
}

func makeSqlxClient() *sqlx.DB {
	conf := config.Config
	sqldb, err := sqlx.Open("postgres", conf.PostgresConnStr)
	if err != nil {
		log.Fatal(err)
	}
	return sqldb
}
