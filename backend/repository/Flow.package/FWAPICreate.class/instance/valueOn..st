actions
valueOn: aHandler 
	"Executes this command for aHandler and the request ."
		
	^ self databaseDo: [ | objectSent foundOrNil  |
		objectSent := self apiObjectClass fromJSONString: self request contents.
		(objectSent hasId and: [ 
		foundOrNil := objectSent class findId: objectSent id.
		foundOrNil  notNil ])
			ifFalse:[ 
				objectSent insert.
				(ZnResponse created: aHandler basePath, objectSent id)
					entity: (ZnStringEntity text: (self jsonWithIdFor: objectSent) asJSONString);
					yourself ]
			ifTrue:[ self newConflictResponseFor: objectSent ] ]