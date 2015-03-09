tests
testGetSome

	| anId registeredOnes apiResponse answeredOnes |
	
	self do:[
	anId := UUID new asString36.

		registeredOnes := Thing findAll].

	apiResponse := ZnEasy 
					post: self apiUrl,'/things/query'
					data: (ZnStringEntity text: '{"production": "quite a lot"}').

	answeredOnes := Mapless fromJSONString: apiResponse contents.

	answeredOnes do:[ :answeredOne |
		self assert: (registeredOnes anySatisfy:[ :registeredOne | answeredOne = registeredOne ])]

