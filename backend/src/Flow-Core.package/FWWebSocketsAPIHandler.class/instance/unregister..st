actions
unregister: clientWebSocket
	self protection critical: [
		self clients remove: clientWebSocket ifAbsent: [ ] ]