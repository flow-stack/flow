other
putSomeThingsLikeThis
	"Sets part of the thigns to be like this."
	
	FWRESTAPIv10Command databaseDo:[ | all |
		all := Thing findAll.
		(1 to: (all size * 0.1) truncated) do:[ :i | | thing |
			thing := all at: i.
			thing 
				beLikeThis; 
				price: (1500 to: 1900) atRandom;
				save] ]
