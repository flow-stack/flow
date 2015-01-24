other
inFlowAppTestGetOne
	
	| anId registeredOne apiResponse answeredOne |
	
	anId := UUID new asString.
	registeredOne := Thing new id: anId; location: 'north!'; yourself.

	self do:[
		self assert: (Thing findId: registeredOne id) isNil].
	
	self do:[
		registeredOne save.
		self assert: (Thing findId: anId) notNil.
		self assert: (Thing findId: anId) id = anId.
		self assert: (Thing findId: anId) location = 'north!'.
		].

	System commitTransaction.
	
	apiResponse := ZnEasy get: self apiUrl,'/things/',anId.

	answeredOne := MaplessGemstone fromJSONString: apiResponse contents.

	self assert: answeredOne notNil.
	self assert: answeredOne class = Thing.
	self assert: answeredOne id = anId.
	self assert: answeredOne location = 'north!'.

	apiResponse := ZnEasy get: self apiUrl,'/things/', UUID new asString.

	self assert: apiResponse code = 404.
