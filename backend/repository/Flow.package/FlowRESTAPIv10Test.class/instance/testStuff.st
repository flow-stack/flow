tests
testStuff

	| anId stuff apiResponse answeredOne answeredOnes |
	
	self do:[
	anId := UUID new asString36.
	stuff := Stuff new id: anId; something: 'this'; yourself.

	 self assert: (Stuff findId: stuff id) isNil .
	
	"Create"
	apiResponse := ZnEasy 
						post: self apiUrl,'/stuff' 
						data: (ZnStringEntity text: stuff asJSONString).

	self assert: (Stuff findId: anId) notNil .

	"Retrieve one"
	apiResponse := ZnEasy get: self apiUrl,'/stuff/', anId.
	answeredOne := Mapless fromJSONString: apiResponse contents.

		self assert: (Stuff findId: answeredOne id) notNil.
		self assert: ((Stuff findId: answeredOne id) = answeredOne) .

	"Retrieve all"
	apiResponse := ZnEasy get: self apiUrl,'/stuff'.
	answeredOnes := Mapless fromJSONString: apiResponse contents.

		answeredOnes do:[ :answered |
			self assert: (Stuff findAll anySatisfy:[ :stored | stored = answered ] ) ] .

	"Retrieve some"
	apiResponse := ZnEasy 
					post: self apiUrl,'/stuff/query'
					data: (ZnStringEntity text: '{"something": "this"}').
	answeredOnes := Mapless fromJSONString: apiResponse contents.

		answeredOnes do:[ :answered |
			self assert: (Stuff findAll anySatisfy:[ :registered | answered = registered ] ) ] .

	"Update"			
		stuff := Stuff new.
		stuff hasThis: 'once'.
		stuff save.
		self deny: (Stuff findId: stuff id) hasThis = 'here'.
		stuff hasThis: 'here'.
		stuff save.
		self assert: (Stuff findId: stuff id) hasThis = 'here'.
	
	stuff hasThis: 'there'.

	apiResponse := ZnEasy 
						put: self apiUrl,'/stuff/'
						data: (ZnStringEntity text: stuff asJSONString).

	self assert: ((Stuff findId: stuff id) hasThis = 'there') .




	"Delete"			
		stuff := Stuff new.
		self deny: (Stuff findId: stuff id) notNil.
		stuff save.
		self assert: (Stuff findId: stuff id) notNil .
	
	apiResponse := ZnEasy delete: self apiUrl,'/stuff/', stuff id.

	self assert: (Stuff findId: stuff id) isNil  ].
