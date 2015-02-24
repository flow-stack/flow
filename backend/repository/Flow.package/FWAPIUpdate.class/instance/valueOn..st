actions
valueOn: aHandler 
	"Executes this command for aHandler and the request .
	This update is actually working as an upsert."
		
	^ self databaseDo: [ | objectSent |
		objectSent := self apiObjectClass fromJSONString: self request contents.
		"compare versions and do conflict resolution if they don't match.
		That might happen when a user writes in a model and another user tries too but in a, now  old, version.
		http://martinfowler.com/eaaCatalog/optimisticOfflineLock.html"
		objectSent save.
		ZnResponse ok: (ZnStringEntity text: (self jsonWithIdFor: objectSent) asJSONString) ]