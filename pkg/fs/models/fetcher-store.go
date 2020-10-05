package models

import (
	"context"
)

type StoreFetcher interface {
	GetDir(context.Context, string) ([]DirItem, error)
	GetFile(context.Context, string) (File, error)
	GetItem(context.Context, string) (FSItem, error)
}
