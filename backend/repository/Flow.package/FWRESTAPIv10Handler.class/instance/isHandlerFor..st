testing
isHandlerFor: aRequest
	"Answers true if this handler should 
	take care of aRequest or completely ignore it."

	^ aRequest uri segments notNil and:[
	aRequest uri segments size >= 2 and:[
	aRequest uri segments first = 'api' and:[
	aRequest uri segments second = '1.0']]]