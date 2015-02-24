actions
startSIGTERMObserver
	
	sigterm ifNil:[ sigterm := self makeSIGTERMObserver ]
