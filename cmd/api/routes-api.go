package main

import (
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/cors"
	"net/http"
)

func (app *application) routes() http.Handler {
	mux := chi.NewRouter()

	// CORS Middleware
	mux.Use(cors.Handler(cors.Options{
		AllowedOrigins:   []string{"https://*", "http://*"},
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowedHeaders:   []string{"Accept", "Authorization", "Content-Type", "X-CSRF-Token"},
		AllowCredentials: false,
		MaxAge:           300,
	}))

	if app.config.env == "development" {
		mux.Use(middleware.Logger)
	}

	mux.Post("/api/payment-intent", app.GetPaymentIntent)
	mux.Get("/api/widgets/{id}", app.GetWidgetByID)
	mux.Post("/api/create-customer-and-subscribe-to-plan", app.CreateCustomerAndSubscribeToPlan)
	mux.Post("/api/authenticate", app.CreateAuthToken)
	mux.Post("/api/is-authenticated", app.CheckAuthentication)
	mux.Post("/api/forgot-password", app.SendPasswordResetEmail)
	mux.Post("/api/reset-password", app.ResetPassword)

	// protected routes
	mux.Route("/api/admin", func(mux chi.Router) {
		mux.Use(app.Auth)
		mux.Post("/virtual-terminal-succeeded", app.VirtualTerminalPaymentSucceeded)
		mux.Get("/sales", app.GetAllSales)
		mux.Get("/subscriptions", app.GetAllSubscriptions)
		mux.Get("/sales/{id}", app.GetSaleByID)
		mux.Post("/refund", app.RefundCharge)
		mux.Post("/cancel-subscription", app.CancelSubscription)
	})

	return mux
}
