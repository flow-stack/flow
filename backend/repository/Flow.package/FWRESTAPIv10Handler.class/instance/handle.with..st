actions
handle: aRequest with: aResponse
	"Answers a ZnResponse after handling aRequest.
	It presumes that aResponse can be used but you 
	usually return a new ZnResponse loaded with 
	the details relevant to each case."
	
	| command |

	"Basic sanity check first..."
	(self isValid: aRequest) ifFalse:[
		^ ZnResponse badRequest: aRequest  ].
	
	"...ok, looks good. Lets the API tell us what command will take care of it..."
	command := FWRESTAPIv10Command fromRequest: aRequest.
	
	"...and do it..."
	^ [ [ command valueOn: self ]
		on: ConnectionTimedOut
		do:[:x| ^ ZnResponse ok: (ZnStringEntity text: 'backend offline') ] ]
			on: Error
			do:[ :x| 
				Flow isProduction 
					ifFalse: [ ZnResponse serverError: x printString ]
					ifTrue: [ ZnResponse badRequest: aRequest  ] ]