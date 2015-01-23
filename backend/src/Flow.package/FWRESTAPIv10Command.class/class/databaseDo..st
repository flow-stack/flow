actions
databaseDo: aBlock
	"Evaluates aBlock in the context of a database"

	^ MaplessGemstoneContainer current
		databaseAt: self databaseName
		do: [ ^ aBlock value ]
