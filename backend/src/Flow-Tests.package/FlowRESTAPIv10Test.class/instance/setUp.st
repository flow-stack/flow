actions
setUp
	super setUp.
	
	FWRESTAPIv10Command repository: (MaplessMongoRepository onDatabaseName: self databaseName)