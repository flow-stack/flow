tests
testCreate
  Transcript
    cr;
    show: 'testCreate: [0]'.
  [ self startFlowAppDo: [ self inFlowAppTestCreate ] ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testCreate: [1] ' , ex description;
        show: (GsProcess stackReportToLevel: 100) ]