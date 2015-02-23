tests
testGetAll

	| anId registeredOnes apiResponse answeredOnes |
	
	self do:[
	anId := UUID new asString36.
	

		registeredOnes := Thing findAll.

	apiResponse := ZnEasy get: self apiUrl,'/things'.

	answeredOnes := Mapless fromJSONString: apiResponse contents.

	answeredOnes do:[ :answeredOne |
		self assert: (registeredOnes anySatisfy:[ :registeredOne | answeredOne = registeredOne ])]
	]
