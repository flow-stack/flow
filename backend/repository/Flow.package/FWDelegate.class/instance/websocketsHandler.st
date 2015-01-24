actions
websocketsHandler
	
	^ self handlers 
		detect: [ :e| e handlesWebSockets ]
		ifNone: [ self error: 'There is no websocket handler in this server?' ]