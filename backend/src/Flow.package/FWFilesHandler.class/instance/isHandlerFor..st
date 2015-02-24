testing
isHandlerFor: aRequest
	"Answers true if this handler should take care of aRequest.
	Note: subclasses should specialize"

	^ aRequest uri = self baseUri or:[
	(aRequest uri segments notNil and:[
	aRequest uri segments first = self base asZnUrl segments first])]