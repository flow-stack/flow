other
inFlowAppTestUpdate
  | anId registeredThing apiResponse |
  true
    ifTrue: [ ^ self ].
  anId := UUID new asString.
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
  registeredThing production: 'quite a lot'.
  apiResponse := ZnEasy
    put: self apiUrl , '/things'
    data: (ZnStringEntity text: registeredThing asJSONString).
  self assert: apiResponse code = 201.
  System abortTransaction.
  self
    do: [ 
      self assert: (Thing findId: registeredThing id) notNil.
      self assert: (Thing findId: registeredThing id) production = 'quite a lot' ]