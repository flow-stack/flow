actions
continuation
	"Return a block that defines what happens after a 
	successful connection upgrade from a normal http request to a WebSocket.
	We will receive a ready-to-use instanciated WebSocket in the parameter of this block."

	^ [ :webSocket |
		self onClient: webSocket ]