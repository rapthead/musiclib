package main

import (
	"context"
	"fmt"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/usecases"
)

func main() {
	logChan := usecases.Rescan(deps.New(), context.TODO())
	for logEvent := range logChan {
		info, err := logEvent.Info(), logEvent.Err()
		if err != nil {
			fmt.Println("error: ", err.Error())
		} else {
			fmt.Println("info: ", info)
		}
	}
}
