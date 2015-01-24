other
stop

	self stopHttpd.

	self stopTimer.
	
	5 timesRepeat:[Smalltalk garbageCollect].
