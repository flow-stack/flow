other
inFlowAppTestGetAll

	| anId registeredOnes apiResponse answeredOnes |
	
	anId := UUID new asString.
	
	self do:[
		registeredOnes := Thing findAll].

	apiResponse := ZnEasy get: self apiUrl,'/things'.

	answeredOnes := MaplessGemstone fromJSONString: apiResponse contents.

	answeredOnes do:[ :answeredOne |
		self assert: (registeredOnes anySatisfy:[ :registeredOne | answeredOne = registeredOne ])]
