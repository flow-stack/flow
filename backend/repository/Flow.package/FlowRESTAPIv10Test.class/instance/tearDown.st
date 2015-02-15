actions
tearDown
  [ 
  super tearDown.
  MaplessGemstoneContainer current
    removeDatabase: self databaseName
    ifAbsent: [  ].
  FWRESTAPIv10Command reset.
  GemServerRegistry _singleton: registry.
  System commitTransaction ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'teardown: ' , ex description;
        show: (GsProcess stackReportToLevel: 100) ]