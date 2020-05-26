//go:generate qtc -dir=.

package views

import "github.com/gofrs/uuid"

type SelectInputData struct {
	Name     string
	Selected string
	Options  []string
}

type StrInputData struct {
	Name  string
	Value string
}

type IntInputData struct {
	Name  string
	Value *int64
}

type CheckboxInputData struct {
	Name  string
	Value string
}

func takeIntPtr(val int64) *int64 {
	return &val
}

func makeInputID(id string) string {
	if id != "" {
		return id
	}
	return uuid.Must(uuid.NewV4()).String()
}
