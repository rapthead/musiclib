package persistance2

import (
	"context"
	"database/sql"
)

type DBTX interface {
	SelectContext(context.Context, interface{}, string, ...interface{}) error
	GetContext(context.Context, interface{}, string, ...interface{}) error
	NamedExecContext(context.Context, string, interface{}) (sql.Result, error)
}

type Queries struct {
	db DBTX
}

func New(db DBTX) *Queries {
	return &Queries{db}
}

func (q *Queries) WithTx(tx DBTX) *Queries {
	return &Queries{
		db: tx,
	}
}
