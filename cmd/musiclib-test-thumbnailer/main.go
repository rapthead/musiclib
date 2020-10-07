package main

import (
	"flag"
	"log"
	"os"

	"github.com/rapthead/musiclib/thumbnailer"
)

func main() {
	flag.Parse()
	if len(flag.Args()) != 1 {
		log.Fatal("only one argument expected")
	}
	imageFilePath := flag.Args()[0]

	imageFile, err := os.Open(imageFilePath)
	tn := thumbnailer.Thumbnailer{}
	err = tn.Thumbnail(os.Stdout, imageFile, 300, 300)
	if err != nil {
		log.Fatalf("thumbnailing error: %s", err.Error())
	}
}
