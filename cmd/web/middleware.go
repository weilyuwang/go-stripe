package main

import "net/http"

func SessionLoad(next http.Handler) http.Handler {
	// SCS implements a session management pattern following the OWASP security guidelines.
	// Session data is stored on the server, and a randomly-generated unique session token (or session ID)
	// is communicated to and from the client in a session cookie.

	// Most applications will use the LoadAndSave() middleware.
	// This middleware takes care of loading and committing session data to the session store,
	// and communicating the session token to/from the client in a cookie as necessary.

	// By default, SCS uses an in-memory store for session data. This is convenient (no setup!) and very fast,
	// but all session data will be lost when your application is stopped or restarted.
	return sessionManager.LoadAndSave(next)
}

func (app *application) Auth(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if !app.Session.Exists(r.Context(), "userID") {
			http.Redirect(w, r, "/login", http.StatusSeeOther)
		}
		next.ServeHTTP(w, r)
	})
}
