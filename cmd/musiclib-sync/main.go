package main

import (
	"context"
	"fmt"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/usecases"
)

func main() {
	logChan := usecases.Refresh(deps.New(), context.TODO())
	for logLine := range logChan {
		fmt.Println(logLine)
	}
}
