package main

import (
	"fmt"
	"github.com/gorilla/websocket"
	"net/http"
)

type WebSocketConnection struct {
	*websocket.Conn
}

type WsPayload struct {
	Action      string              `json:"action"`
	Message     string              `json:"message"`
	UserName    string              `json:"user_name"`
	MessageType string              `json:"message_type"`
	UserID      int                 `json:"user_id"`
	Conn        WebSocketConnection `json:"-"`
}

type WsJsonResponse struct {
	Action  string `json:"action"`
	Message string `json:"message"`
	UserID  int    `json:"user_id"`
}

var upgradeConnection = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

var clients = make(map[WebSocketConnection]string)

var wsChan = make(chan WsPayload)

func (app *application) WsEndPoint(w http.ResponseWriter, r *http.Request) {
	// upgrade the connection
	ws, err := upgradeConnection.Upgrade(w, r, nil)
	if err != nil {
		app.errorLog.Println(err)
		return
	}

	app.infoLog.Println(fmt.Sprintf("client connected from %s", r.RemoteAddr))
	var response WsJsonResponse
	response.Message = "Connected to server"

	// send message to connected client
	err = ws.WriteJSON(response)
	if err != nil {
		app.errorLog.Println(err)
		return
	}

	conn := WebSocketConnection{ws}

	// register client
	clients[conn] = ""

	// spin up a go routine to listen for this particular client
	go app.ListenForWS(&conn)
}

func (app *application) ListenForWS(conn *WebSocketConnection) {
	defer func() {
		if r := recover(); r != nil {
			app.errorLog.Println("Error:", fmt.Sprintf("%v", r))
		}
	}()

	var payload WsPayload

	for {
		// listening for any message coming from the client
		err := conn.ReadJSON(&payload)
		if err != nil {
			// do nothing
		} else {
			// send the message coming from the client to websocket channel
			payload.Conn = *conn
			wsChan <- payload
		}
	}
}

func (app *application) ListenToWsChan() {
	var response WsJsonResponse
	for {
		// listening for any messages coming from the websocket channel
		e := <-wsChan
		switch e.Action {
		case "deleteUser":
			response.Action = "logout"
			response.Message = "Your account has been deleted"
			response.UserID = e.UserID // user that we are going to log out
			app.broadcastToAll(response)
		default:
		}
	}
}

func (app *application) broadcastToAll(response WsJsonResponse) {
	for client := range clients {
		// broadcast to every connected client
		err := client.WriteJSON(response)
		if err != nil {
			app.errorLog.Printf("websocket err on %s: %s", response.Action, err)
			_ = client.Close()
			delete(clients, client)
		}
	}
}
