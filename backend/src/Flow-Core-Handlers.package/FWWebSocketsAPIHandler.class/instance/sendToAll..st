actions
sendToAll: aCommand 
	"Broadcast aCommand to all clients."

	self clients do:[:each|
		FlowPlatform current isProduction 
			ifTrue: [ [each sendMessage: aCommand asJSONString] on: Error do:[:x| ]]
			ifFalse:[each sendMessage: aCommand asJSONString]]