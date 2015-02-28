accessing
documentForFile: aFilename type: aMIMEType

	^ aFilename
		readStreamDo: [:stream | aMIMEType isBinary
				ifTrue: [stream contents]
				ifFalse: [stream contents asString]]