other
inFlowAppTestQueryOne
  | anId conditions registeredThing apiResponse |
  anId := UUID new asString.
  conditions := Dictionary new
    at: 'id' put: anId;
    yourself.
  registeredThing := Thing new
    id: anId;
    production: 'a bunch';
    memes: 'very good ones';
    yourself.
  self
    do: [ 
      self assert: (Thing findId: registeredThing id) isNil.
      registeredThing save.
      self assert: (Thing findId: registeredThing id) notNil.
      self assert: (Thing findId: registeredThing id) production = 'a bunch' ].
  apiResponse := ZnEasy
    post: self apiUrl , '/things/queryOne'
    data: (ZnStringEntity text: conditions asJSONString).
  self assert: apiResponse code = 200.
  System abortTransaction.	"ToDo: This should be testing the response is the right object"
  self
    do: [ 
      self assert: (Thing findId: registeredThing id) notNil.
      self assert: (Thing findId: registeredThing id) production = 'quite a lot' ]