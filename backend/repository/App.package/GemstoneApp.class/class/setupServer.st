other
setupServer
  "
	GemstoneApp setupServer 

	"

  (GemServerRegistry gemServerNamed: GemStoneApp flowApplicationServerName)
    ifNil: [ 
      ZnNewGemServer
        register: GemStoneApp flowApplicationServerName
        on: self apiPortList ].
  (GemServerRegistry gemServerNamed: GemStoneApp flowApplicationServerName)
    logFilter: nil;
    logToObjectLog;
    debugMode: true;
    delegate:
        (FWDelegate new
            addHandler: FWRESTAPIv10Handler new;
            addHandler:
                (FWFilesHandler
                    for:
                      (GsFile _expandEnvVariable: 'GEMSTONE_STONE_DIR' isClient: false) , '/service'
                    base: 'service');
            addHandler: FWWebSocketsAPIHandler new;
            yourself)