testing
hasValidDetailsFor: aRequest 
	"Answers true if the lasts segments of the URI of aRequest 
	are looking good"
	
	^ aRequest uri segments size = 3 or:[

	(aRequest uri segments size = 4 and:[
	aRequest uri segments last = #/ ] ) ]