actions
tearDown
  super tearDown.
  MaplessGemstoneContainer current
    removeDatabase: self databaseName
    ifAbsent: [  ].
  FWRESTAPIv10Command reset.
  GemServerRegistry _singleton: registry.
  System commitTransaction