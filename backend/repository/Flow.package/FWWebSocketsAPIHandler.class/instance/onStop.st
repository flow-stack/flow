reactions
onStop

	self clients do:[:socket|
		[socket close] on: Error do:[:x| ].	
		self unregister: socket]