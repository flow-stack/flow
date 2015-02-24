actions
stopSIGTERMObserver
	
	sigterm ifNotNil:[ |proc| 
		proc := sigterm.
		sigterm := nil.
		proc terminate ]