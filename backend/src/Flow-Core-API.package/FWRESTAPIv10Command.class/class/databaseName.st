accessing
databaseName

	^ DatabaseName ifNil:[ DatabaseName := ConfigurationFiles at: 'App' at: 'database' ]