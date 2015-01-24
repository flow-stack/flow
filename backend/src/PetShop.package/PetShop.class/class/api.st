accessing
api

	^ (ZnServer managedServers 
		detect:[:srv| srv port = (ConfigurationFiles at: 'API' at: 'port')]
		ifNone:[nil]) ifNotNilDo:[:srv|
			srv delegate handlers 
				detect:[:e| e class = FWRESTAPIv10Handler ]
				ifNone:[nil]]
