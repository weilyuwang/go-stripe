package main

import "net/http"

func (app *application) VirtualTerminal(w http.ResponseWriter, r *http.Request) {
	if err := app.renderTemplate(w, r, "terminal", nil); err != nil {
		app.errorLog.Println(err)
	}
}
