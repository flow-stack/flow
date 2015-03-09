testing
isHandlerFor: aRequest
	"Answers true if this handler should take care of aRequest.
	Note: subclasses should specialize"

	^ aRequest uri isSlash or:[
	aRequest uri = '/favicon.ico' asZnUrl]