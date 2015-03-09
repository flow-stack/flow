other
inFlowAppTestGetSome
  | anId registeredOnes apiResponse answeredOnes |
  anId := UUID new asString.
  self do: [ registeredOnes := Thing findAll ].
  System commitTransaction.
  apiResponse := ZnEasy
    post: self apiUrl , '/things/query'
    data: (ZnStringEntity text: '{"production": "quite a lot"}').
  self assert: apiResponse code = 200.
  answeredOnes := MaplessGemstone fromJSONString: apiResponse contents.
  answeredOnes
    do: [ :answeredOne | 
      self
        assert:
          (registeredOnes anySatisfy: [ :registeredOne | answeredOne = registeredOne ]) ]