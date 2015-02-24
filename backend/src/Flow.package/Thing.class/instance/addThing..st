actions
addThing: aThing
	"Adds aThing to the things of this thing"
	
	self things ifNil:[ self things: OrderedCollection new ].
	
	^ self things add: aThing