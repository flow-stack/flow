other
webSocketAPI

	^ (ZnServer managedServers 
		detect:[:srv| srv port = self apiPort]
		ifNone:[nil])
			ifNotNilDo:[:srv| srv delegate websocketsHandler]