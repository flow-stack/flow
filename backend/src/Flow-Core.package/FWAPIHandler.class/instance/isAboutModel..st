testing
isAboutModel: aRequest
	"Answers true if aRequest it's about any of the models."

	^ (self modelClassFrom: aRequest) notNil