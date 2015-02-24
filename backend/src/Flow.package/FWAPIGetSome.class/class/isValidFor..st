testing
isValidFor: aRequest
	"Answers true if aRequest should be processed by an instance of this class of command."

	^ (super isValidFor: aRequest) and:[
	aRequest uri segments size >= 4 and:[
	aRequest uri segments fourth = 'query'] ]