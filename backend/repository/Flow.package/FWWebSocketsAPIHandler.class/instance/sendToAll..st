actions
sendToAll: aCommand 
	"Broadcast aCommand to all clients."

	self clients do:[:each|
		Flow isProduction 
			ifTrue: [ [each sendMessage: aCommand asJSONString] on: Error do:[:x| ]]
			ifFalse:[each sendMessage: aCommand asJSONString]]