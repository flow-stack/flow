actions
start

	self reset.
	
	self startHttpd.
	
	self startHeartbeat.
	
	self setupServer.
