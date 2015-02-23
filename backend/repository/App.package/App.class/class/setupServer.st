actions
setupServer

	"Setting up a dispatcher for Zinc so we can use our handlers"
	(ZnServer managedServers detect:[:e|
		e port = (ConfigurationFiles at: 'API' at: 'port')]) 
			delegate: (FWDelegate new
						addHandler: FWRESTAPIv10Handler new;
						addHandler: FWWebSocketsAPIHandler new;
						addHandler: (FWFilesHandler for: (FileLocator imageDirectory / 'service') resolve fullName base: 'service');
						yourself).
		
	