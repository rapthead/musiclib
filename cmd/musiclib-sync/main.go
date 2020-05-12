package main

import (
	"context"

	"github.com/rapthead/musiclib/usecases"
)

func main() {
	usecases.Refresh(context.TODO())
}
