other
inFlowAppTestDelete
  | anId aThing apiResponse |
  anId := UUID new asString.
  aThing := Thing new
    id: anId;
    prospect: 'guy';
    offer: 355.25;
    yourself.
  self
    do: [ 
      self assert: (Thing findId: aThing id) isNil.
      aThing save.
      self assert: (Thing findId: aThing id) notNil.
      self assert: (Thing findId: aThing id) offer = 355.25 ].
  System commitTransaction.
  apiResponse := ZnEasy delete: self apiUrl , '/things/' , aThing id.
  self assert: apiResponse code = 200.
  System abortTransaction.
  self
    do: [ 
      self deny: (Thing findId: anId) notNil.
      self assert: (Thing findId: anId) isNil ]