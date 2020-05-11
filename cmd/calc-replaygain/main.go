package main

import (
	"flag"
	"fmt"
	"log"

	"github.com/rapthead/musiclib/usecases"
)

func main() {
	flag.Parse()
	flacFiles := flag.Args()
	if len(flacFiles) == 0 {
		log.Fatal("files list must not be empty")
	}
	calcResult, err := usecases.CalcReplaygain(flacFiles)
	if err != nil {
		fmt.Println(err)
	} else {
		fmt.Printf("albumGain: %f, albumPeak: %f\n", calcResult.AlbumGain, calcResult.AlbumPeak)
		for _, trackCalcResult := range calcResult.Tracks {
			fmt.Printf(
				"%s	gain: %f, peak:	%f\n",
				trackCalcResult.Path,
				trackCalcResult.Gain,
				trackCalcResult.Peak,
			)
		}
	}
}
