actions
saveProducts1
	
	FWRESTAPIv10Command databaseDo:[
		(1 to: 10) do:[ :i |
			Product new 
				number: i;
				fakedOn: DateAndTime now;
				save ] ]
	