accessing
databaseName

	^ DatabaseName ifNil:[ DatabaseName := 'AppTests' ]