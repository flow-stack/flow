accessing
protection

	^ protection ifNil:[ self initializeProtection ]