actions
findMany
	"Query the database with the information given in the request
	and return the objects found"
	
	| conditions |
	
	self request contents ifNil:[ ^ Array new ].
	
	conditions := Json readFrom: (self class sanitizePayload: self request contents) readStream.
	^ self apiObjectClass find: conditions
	
	