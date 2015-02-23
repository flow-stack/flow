tests
testUpdate
	
	| anId registeredThing apiResponse  |
	
	self do:[
	anId := UUID new asString36.
	registeredThing := Thing new id: anId; production: 'a bunch'; memes: 'very good ones'; yourself.


		self assert: (Thing findId: registeredThing id) isNil.
		registeredThing insert.
		self assert: (Thing findId: registeredThing id) notNil.
		self assert: (Thing findId: registeredThing id) production = 'a bunch'.

	registeredThing production: 'quite a lot'.
	
	apiResponse := ZnEasy 
						put: self apiUrl,'/things' 
						data: (ZnStringEntity text: registeredThing asJSONString).
	
		self assert: (Thing findId: registeredThing id) notNil.
		self assert: (Thing findId: registeredThing id) production = 'quite a lot'].


