other
flowDevelopmentDebugScript

	| mInstance |

	ZnTransactionSafeManagingMultiThreadedServer initialize.
	ConfigurationFiles reset. 

	(GemServerRegistry gemServerNamed: GemstoneApp flowApplicationServerName) 
		ifNotNil:[
			(GemServerRegistry gemServerNamed: GemstoneApp flowApplicationServerName)  stop; unregister.
			GemstoneApp setupServer.
	].

	
	mInstance := (GemServerRegistry gemServerNamed: GemstoneApp flowApplicationServerName) .

	System commitTransaction. 

	 mInstance startServiceOn: GemstoneApp defaultApiPort
