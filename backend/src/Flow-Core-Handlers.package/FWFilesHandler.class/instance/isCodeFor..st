testing
isCodeFor: aRequest

	^ ('*.js' match: aRequest uri segments last) or:[
	'*.st' match: aRequest uri segments last]