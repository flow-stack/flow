reactions
purgeClients

	self clients copy do:[:e|
		e isConnected ifFalse:[
			self unregister: e]]