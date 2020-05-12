package deps

import (
	"database/sql"
	"fmt"
	"log"

	"github.com/rapthead/musiclib/config"
)

func makeSqlClient() *sql.DB {
	conf := config.Config
	sqldb, err := sql.Open(
		"postgres",
		fmt.Sprintf(
			"host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
			conf.PgHost,
			conf.PgPort,
			conf.PgUser,
			conf.PgPassword,
			conf.PgDatabase,
		),
	)
	if err != nil {
		log.Fatal(err)
	}
	return sqldb
}
