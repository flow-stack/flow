accessing
clients

	^ clients ifNil:[ self initializeClients ]