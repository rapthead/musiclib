package main

import (
	"log"
	"net/http"

	"github.com/rapthead/musiclib/deps"
	"github.com/rapthead/musiclib/server"
)

func main() {
	deps := deps.New()

	routes := server.MakeRoutes(deps)
	srv := &http.Server{
		Addr:    ":8000",
		Handler: routes,
	}

	log.Println("listen on", srv.Addr)
	err := srv.ListenAndServe()
	if err != nil {
		log.Fatalln("server start error:", err)
	}
}
