other
valueOn: aHandler 
	"Executes this command for aHandler and the request .
	Returns all the mapless found.
	This one is meant for development.
	Cool kids use GetSome doing the relevant queries"
		
	^ self databaseDo: [ | foundOrEmpty |
		"count the collection before querying all, if bigger than 200 elments then respod partial"
		foundOrEmpty := self apiObjectClass findAll.
		ZnResponse ok: (ZnStringEntity text: foundOrEmpty asJSONString) ]
