package main

import "net/http"

func SessionLoad(next http.Handler) http.Handler {
	return sessionManager.LoadAndSave(next)
}
