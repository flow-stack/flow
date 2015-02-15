other
inFlowAppTestStuff
  | anId stuff apiResponse answeredOne answeredOnes |
  true
    ifTrue: [ ^ self ].
  anId := UUID new asString.
  stuff := Stuff new
    id: anId;
    something: 'this';
    yourself.
  self do: [ self assert: (Stuff findId: stuff id) isNil ].	"Create"
  apiResponse := ZnEasy
    post: self apiUrl , '/stuff'
    data: (ZnStringEntity text: stuff asJSONString).
  self assert: apiResponse code = 201.
  System abortTransaction.
  self do: [ self assert: (Stuff findId: anId) notNil ].	"Retrieve one"
  apiResponse := ZnEasy get: self apiUrl , '/stuff/' , anId.
  self assert: apiResponse code = 200.
  answeredOne := MaplessGemstone fromJSONString: apiResponse contents.
  System abortTransaction.
  self
    do: [ 
      self assert: (Stuff findId: answeredOne id) notNil.
      self assert: (Stuff findId: answeredOne id) = answeredOne ].	"Retrieve all"
  apiResponse := ZnEasy get: self apiUrl , '/stuff'.
  self assert: apiResponse code = 200.
  answeredOnes := MaplessGemstone fromJSONString: apiResponse contents.
  System abortTransaction.
  self
    do: [ 
      answeredOnes
        do: [ :answered | self assert: (Stuff findAll anySatisfy: [ :stored | stored = answered ]) ] ].	"Retrieve some"
  apiResponse := ZnEasy
    post: self apiUrl , '/stuff/query'
    data: (ZnStringEntity text: '{"something": "this"}').
  self assert: apiResponse code = 200.
  answeredOnes := MaplessGemstone fromJSONString: apiResponse contents.
  System abortTransaction.
  self
    do: [ 
      answeredOnes
        do: [ :answered | self assert: (Stuff findAll anySatisfy: [ :registered | answered = registered ]) ] ].	"Update"
  self
    do: [ 
      stuff := Stuff new.
      stuff hasThis: 'once'.
      stuff save.
      self deny: (Stuff findId: stuff id) hasThis = 'here'.
      stuff hasThis: 'here'.
      stuff save.
      self assert: (Stuff findId: stuff id) hasThis = 'here' ].
  stuff hasThis: 'there'.
  System commitTransaction.
  apiResponse := ZnEasy
    put: self apiUrl , '/stuff'
    data: (ZnStringEntity text: stuff asJSONString).
  self assert: apiResponse code = 200.
  System abortTransaction.
  self do: [ self assert: (Stuff findId: stuff id) hasThis = 'there' ].	"Delete"
  self
    do: [ 
      stuff := Stuff new.
      self deny: (Stuff findId: stuff id) notNil.
      stuff save.
      self assert: (Stuff findId: stuff id) notNil ].
  System commitTransaction.
  apiResponse := ZnEasy delete: self apiUrl , '/stuff/' , stuff id.
  self assert: apiResponse code = 200.
  System abortTransaction.
  self do: [ self assert: (Stuff findId: stuff id) isNil ]