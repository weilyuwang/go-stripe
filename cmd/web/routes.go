package main

import (
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"net/http"
)

func (app *application) routes() http.Handler {
	mux := chi.NewRouter()
	if app.config.env == "development" {
		mux.Use(middleware.Logger)
	}

	mux.Use(SessionLoad)

	mux.Get("/", app.Home)
	mux.Get("/virtual-terminal", app.VirtualTerminal)
	mux.Get("/widget/{id}", app.ChargeOnce)
	mux.Post("/payment-succeeded", app.PaymentSucceeded)

	fileServer := http.FileServer(http.Dir("./static"))
	mux.Handle("/static/*", http.StripPrefix("/static", fileServer))

	return mux
}
