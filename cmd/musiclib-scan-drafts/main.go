package main

import (
	"context"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/usecases"
)

func main() {
	usecases.Rescan(deps.New(), context.TODO())
}
