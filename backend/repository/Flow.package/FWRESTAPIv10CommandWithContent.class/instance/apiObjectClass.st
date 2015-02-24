accessing
apiObjectClass
	"Answers the concrete class of the object that we assume we can find in the request"

	^ Smalltalk
		at: ((Json readFrom: self request contents readStream)
				at: 'modelClass' 
				ifAbsent:[ 'UndefinedObject' ]) asSymbol 
		ifAbsent: [ nil ]