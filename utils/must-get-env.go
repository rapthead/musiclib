package utils

import (
	"log"
	"os"
)

func MustGetEnv(key string) string {
	envVal := os.Getenv(key)
	if envVal == "" {
		log.Fatal("expected environment variable")
	}
	return envVal
}
