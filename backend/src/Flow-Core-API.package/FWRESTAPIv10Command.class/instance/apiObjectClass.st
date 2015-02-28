accessing
apiObjectClass
	"Answers the concrete class of the object that we assume we can find in the request"

	^ Mapless allSubclasses 
		detect: [ :e | 
			e singularName = self request uri segments third or:[
			e pluralName = self request uri segments third ] ]
		ifNone: [ nil ]