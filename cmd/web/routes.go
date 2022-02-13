package main

import (
	"github.com/go-chi/chi/v5"
	"net/http"
)

func (app *application) routes() http.Handler {
	mux := chi.NewRouter()

	mux.Get("/virtual-terminal", app.VirtualTerminal)
	mux.Post("/payment-succeeded", app.PaymentSucceeded)

	return mux
}
