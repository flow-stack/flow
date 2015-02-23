actions
stop

	self stopHttpd.

	self stopTimer.
	
	self stopVNC.
	5 timesRepeat:[Smalltalk garbageCollect].