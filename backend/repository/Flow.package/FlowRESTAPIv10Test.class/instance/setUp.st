actions
setUp
	super setUp.
	
    registry := GemServerRegistry singleton.
    GemServerRegistry _singleton: nil.
	
    FWRESTAPIv10Command databaseName: self databaseName.


	System commitTransaction.
