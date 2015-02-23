actions
sendToAll: aCommand but: aClient
	"Broadcast aCommand to all clients except aClient.
	Useful when one wants to tell something to everybody else."

	(self allBut: aClient) do:[:each|
		Flow isProduction 
			ifTrue: [ [each sendMessage: aCommand asJSONString] on: Error do:[:x| ]]
			ifFalse:[each sendMessage: aCommand asJSONString]]