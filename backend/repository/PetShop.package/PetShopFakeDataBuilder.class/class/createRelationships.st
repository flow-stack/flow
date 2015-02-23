actions
createRelationships
	"Create some relationships between things."
	
	FWRESTAPIv10Command databaseDo:[ | all |
		all := Thing findAll.
		(1 to: (all size * 0.6) truncated) do:[ :i | | thing otherThing |
			thing := all at: i.
			otherThing := all at: (1 to: all size) atRandom.
			thing ~= otherThing ifTrue:[
				thing beRelatedTo: otherThing ].
			thing save.
			otherThing save ] ]