other
inFlowAppTestGetSome

	| anId registeredOnes apiResponse answeredOnes |
	
	anId := UUID new asString.
	
	self do:[
		registeredOnes := Thing findAll].

	apiResponse := ZnEasy 
					post: self apiUrl,'/things/query'
					data: (ZnStringEntity text: '{"production": "quite a lot"}').

	answeredOnes := MaplessGemstone fromJSONString: apiResponse contents.

	answeredOnes do:[ :answeredOne |
		self assert: (registeredOnes anySatisfy:[ :registeredOne | answeredOne = registeredOne ])]
