tests
testCreate
  [ self startFlowAppDo: [ self inFlowAppTestCreate ] ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testCreate: ' , ex description;
        show: (GsProcess stackReportToLevel: 100) ]