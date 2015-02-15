actions
setUp
  [ 
  | gemServer |
  super setUp.
  registry := GemServerRegistry singleton.
  GemServerRegistry _singleton: nil.
  gemServer := (ZnNewGemServer
    register: self gemServerName
    on: self gemServerPortList)
    logEverything;
    logToTranscript;
    logToObjectLog;
    delegate:
        (FWDelegate new
            addHandler: FWRESTAPIv10Handler new;
            addHandler:
                (FWFilesHandler
                    for:
                      (GsFile _expandEnvVariable: 'GEMSTONE_STONE_DIR' isClient: false) , '/service'
                    base: 'service');
            addHandler: FWWebSocketsAPIHandler new;
            yourself);
    yourself.
  gemServer stopGems.
  FWRESTAPIv10Command databaseName: self databaseName.
  self
    do: [ 
      "force the database to be created"
       ].
  System commitTransaction ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'setup: ' , ex description;
        show: (GsProcess stackReportToLevel: 100) ]