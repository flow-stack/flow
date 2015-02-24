reactions
onClient: aWebSocket	
	"Handle a new incoming web socket connection."
	
	self purgeClients.
	
	[ self register: aWebSocket.
	aWebSocket runWith: [:message|
		self process: message on: aWebSocket ] ]
			on: ConnectionClosed 
			do: [ self unregister: aWebSocket ].