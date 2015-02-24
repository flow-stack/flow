actions
stopHttpd

	
	ZnServer managedServers do:[:e| e stop].
	
	ZnServer default ifNotNil:[
		ZnServer default delegate stop].
	
	ZnServer stopDefault.