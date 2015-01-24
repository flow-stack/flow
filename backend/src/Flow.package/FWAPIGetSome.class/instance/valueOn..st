actions
valueOn: aHandler 
	"Executes this command for aHandler and the request ."
		
	^ self databaseDo: [ 
		ZnResponse ok: (ZnStringEntity text: self findMany asJSONString) ]
	