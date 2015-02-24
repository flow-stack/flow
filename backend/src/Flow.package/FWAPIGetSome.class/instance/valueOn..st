actions
valueOn: aHandler 
	"Executes this command for aHandler and the request ."
		
	^ self databaseDo: [ | answer |
		answer := self findMany.
		
		(ConfigurationFiles at: #API at: #isUnreferencing) ifTrue: [ 
			 answer do: [ :each | each unreferenced ] ].
		
		ZnResponse ok: (ZnStringEntity text: answer asJSONString) ]
	 