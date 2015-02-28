tests
testCreate
	
	| anId aThing apiResponse json |
	
	anId := UUID new asString36.
	self do:[
	aThing := Thing new id: anId; something: 'this'; has: 355.25; yourself.

	
	self assert: (Thing findId: aThing id) isNil.
	
	apiResponse := ZnEasy 
						post: self apiUrl,'/things' 
						data: (ZnStringEntity text: aThing asJSONString).

	self assert: apiResponse isCreated.
	
		self assert: (Thing findId: anId) notNil.
		self assert: (Thing findId: anId) id = anId.
		self assert: (Thing findId: anId) something = 'this'.
		self assert: (Thing findId: anId) has = 355.25.

	apiResponse := ZnEasy 
						post: self apiUrl,'/things' 
						data: (ZnStringEntity text: aThing asJSONString).

	self assert: apiResponse code = 409.
	json := Json readFrom: apiResponse contents readStream.
	self assert: json message = 'Id already in use'.
	self assert: json id = aThing id.
	self assert: json modelClass = 'Thing'.
	]