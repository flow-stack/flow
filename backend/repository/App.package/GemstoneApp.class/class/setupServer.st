other
setupServer
  "
	GemstoneApp setupServer 

	"

  (GemServerRegistry gemServerNamed: self flowApplicationServerName)
    ifNil: [ ZnNewGemServer register: self flowApplicationServerName on: self apiPortList ].
  (GemServerRegistry gemServerNamed: self flowApplicationServerName)
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