actions
dropDatabase

	(self confirm: 'Wait whaaat? Dropping MongoDB database named: ',FWRESTAPIv10Command databaseName,' has no undo. Are your sure?') ifTrue:[
		OSProcess command: 'mongo ',FWRESTAPIv10Command databaseName,' --eval "db.dropDatabase()"']