other
inFlowAppTestGetAll
  | registeredOnes apiResponse answeredOnes |
  self do: [ registeredOnes := Thing findAll ].
  System commitTransaction.
  apiResponse := ZnEasy get: self apiUrl , '/things'.
  self assert: apiResponse code = 200.
  answeredOnes := MaplessGemstone fromJSONString: apiResponse contents.
  answeredOnes
    do: [ :answeredOne | 
      self
        assert:
          (registeredOnes anySatisfy: [ :registeredOne | answeredOne = registeredOne ]) ]