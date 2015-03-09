actions
setupServer
  (GemServerRegistry gemServerNamed: self flowServerName)
    ifNil: [ ZnNewGemServer register: self flowServerName on: self apiPortList ].
  (GemServerRegistry gemServerNamed: self flowServerName)
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