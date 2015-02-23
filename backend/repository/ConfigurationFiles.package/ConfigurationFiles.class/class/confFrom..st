actions
confFrom: aFilename

	^ aFilename asFileReference readStreamDo:[:stream| |source|
		source := stream contents.
		[Compiler evaluate: source] on: Error do:[:x| 'configuration error']]