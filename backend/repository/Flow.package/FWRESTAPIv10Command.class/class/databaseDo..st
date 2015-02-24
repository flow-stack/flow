actions
databaseDo: aBlock
	"Evaluates aBlock in the context of a database"

	^self repositoryDo: aBlock