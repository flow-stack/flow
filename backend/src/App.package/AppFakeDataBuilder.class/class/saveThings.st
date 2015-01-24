other
saveThings
	
	FWRESTAPIv10Command databaseDo:[
		(1 to: 100) do:[ :i |
			Thing new 
				number: i;
				fakedOn: DateAndTime now;
				save ] ].
