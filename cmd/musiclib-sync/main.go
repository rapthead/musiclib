package main

import (
	"context"

	"github.com/rapthead/musiclib/usecases"
)

func main() {
	usecases.Rescan(context.TODO())
}
