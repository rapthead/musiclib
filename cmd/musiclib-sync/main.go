package main

import (
	"context"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/usecases"
)

func main() {
	// deps := deps.New()
	usecases.Refresh(deps.New(), context.TODO())
}
