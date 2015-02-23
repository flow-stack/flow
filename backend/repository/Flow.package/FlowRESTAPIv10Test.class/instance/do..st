actions
do: aBlock 
	"Evaluates aBlock in the context of the Cowlinq-Test mongo database 
	so things saved/changed are only affecting that db"

	^ FWRESTAPIv10Command databaseDo: aBlock