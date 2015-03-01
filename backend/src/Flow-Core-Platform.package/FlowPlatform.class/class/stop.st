actions
stop

	self stopHttpd.

	self stopHeartbeat.

	5 timesRepeat: [ Smalltalk garbageCollect ].