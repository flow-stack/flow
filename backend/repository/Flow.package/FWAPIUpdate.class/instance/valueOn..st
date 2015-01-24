other
valueOn: aHandler 
	"Executes this command for aHandler and the request .
	This update is actually working as an upsert."
		
	^ self databaseDo: [ | objectSent foundOrNil |
		"needs to be optimized"
		objectSent := self apiObjectClass fromJSONString: self request contents.
		(foundOrNil := objectSent class findId: objectSent id) 	
			ifNil:[ objectSent insert ]
			ifNotNil:[ #('_id' 'id' 'createdOn') do:[: each| objectSent data removeKey: each].
						foundOrNil updateWith: objectSent data ].
		"compare versions and do conflict resolution if they don't match.
		That might happen when a user writes in a model and another user tries too but in a, now  old, version.
		http://martinfowler.com/eaaCatalog/optimisticOfflineLock.html"

		ZnResponse ok: (ZnStringEntity text: true asJSONString) ]
