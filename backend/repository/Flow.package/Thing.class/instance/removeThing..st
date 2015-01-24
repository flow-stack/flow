actions
removeThing: aThing
	"Removes aThing from the things that belong to this thing"
	
	self thigns ifNil:[ self things: OrderedCollection new ].
	
	^ self thigns 
		remove: aThing 
		ifAbsent:[ nil ]