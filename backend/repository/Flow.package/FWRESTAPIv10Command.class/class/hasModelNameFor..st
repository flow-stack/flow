testing
hasModelNameFor: aSingularOrPluralModelName
	"Answers true if thre is a model that has aSingularOrPluralModelName"
	
	^ FWAPIModel allSubclasses anySatisfy: [ :e | 
		e pluralName = aSingularOrPluralModelName or:[
		e singularName = aSingularOrPluralModelName ] ]