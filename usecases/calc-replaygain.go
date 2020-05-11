package usecases

import (
	"fmt"
	"log"
	"os/exec"
	"regexp"
	"strconv"
	"strings"
)

type TrackCalcResult struct {
	Path string

	Gain float64
	Peak float64
}

type CalcResult struct {
	AlbumGain float64
	AlbumPeak float64

	Tracks []TrackCalcResult
}

func CalcReplaygain(flacPaths []string) (CalcResult, error) {
	if len(flacPaths) == 0 {
		panic("Assertion error, flacPaths is empty")
	}

	cmd := exec.Command("metaflac", append([]string{"--scan-replay-gain", "--with-filename"}, flacPaths...)...)
	stdoutStderrBytes, err := cmd.CombinedOutput()
	if err != nil {
		return CalcResult{}, fmt.Errorf("metaflac command failed: %s %w", string(stdoutStderrBytes), err)
	}

	stdoutStderr := string(stdoutStderrBytes)
	rgRegex := regexp.MustCompile(
		"(.+): ([-.0-9]+) ([-.0-9]+) ([-.0-9]+) ([-.0-9]+)",
	)

	calcResult := CalcResult{}
	for i, line := range strings.Split(strings.TrimSuffix(stdoutStderr, "\n"), "\n") {
		parsingError := func(valueTitle string, err error) {
			log.Fatal("metaflac", valueTitle, "parsing failed:", err, line)
		}

		submatches := rgRegex.FindStringSubmatch(line)
		if i == 0 {
			albumGain, err := strconv.ParseFloat(submatches[2], 32)
			if err != nil {
				parsingError("album gain", err)
			}

			albumPeak, err := strconv.ParseFloat(submatches[3], 32)
			if err != nil {
				parsingError("album peak", err)
			}

			calcResult.AlbumGain = albumGain
			calcResult.AlbumPeak = albumPeak
		}

		trackGain, err := strconv.ParseFloat(submatches[4], 32)
		if err != nil {
			parsingError("track gain", err)
		}

		trackPeak, err := strconv.ParseFloat(submatches[5], 32)
		if err != nil {
			parsingError("track peak", err)
		}

		trackCalcResult := TrackCalcResult{
			submatches[1], trackGain, trackPeak,
		}
		calcResult.Tracks = append(calcResult.Tracks, trackCalcResult)
	}
	return calcResult, nil
}
