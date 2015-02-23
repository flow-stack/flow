other
createRelationships
	"Create some relationships between things."
	
	FWRESTAPIv10Command databaseDo:[ | all |
		all := Thing findAll.
		(1 to: (all size * 0.6) truncated) do:[ :i | | thing otherThing |
			"We're guessing/assuming that having ~60% of the stock related one to each other is okay"
			thing := all at: i.
			otherThing := all at: (1 to: all size) atRandom.
			thing ~= otherThing ifTrue:[
				thing beRelatedTo: otherThing ].
			thing save.
			otherThing save ] ]
