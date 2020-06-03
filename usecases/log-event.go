package usecases

type LogEvent interface {
	Err() error
	Info() string
}

type LogEntry struct {
	info string
	err  error
}

func (e LogEntry) Err() error {
	return e.err
}

func (e LogEntry) Info() string {
	return e.info
}

type Errorer interface {
	Error(error)
}
