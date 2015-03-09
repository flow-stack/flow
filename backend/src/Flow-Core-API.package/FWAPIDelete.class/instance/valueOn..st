actions
valueOn: aHandler 
	"Executes this command for aHandler and the request ."
		
	^ self databaseDo: [ | foundOrNil |
		foundOrNil := self apiObjectClass findId: self request uri segments fourth.
		foundOrNil
			ifNil:[ ZnResponse ok: (ZnStringEntity text: false asJSONString) ]
			ifNotNil:[
				foundOrNil destroy.
				ZnResponse ok: (ZnStringEntity text: true asJSONString) ] ]
	