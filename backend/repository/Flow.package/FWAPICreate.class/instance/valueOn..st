actions
valueOn: aHandler 
	"Executes this command for aHandler and the request ."
		
	^ self databaseDo: [ | objectSent foundOrNil  |
		objectSent := self apiObjectClass fromJSONString: self request contents.
		foundOrNil := objectSent class findId: objectSent id.
		foundOrNil 
			ifNil: [ 
				objectSent insert.
				ZnResponse created: aHandler basePath, objectSent id]
			ifNotNil:[ self newConflictResponseFor: objectSent ] ]
