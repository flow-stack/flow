actions
handle: aRequest with: aResponse gemServer: gemServer
  "Answers a ZnResponse after handling aRequest.
	It presumes that aResponse can be used but you 
	usually return a new ZnResponse loaded with 
	the details relevant to each case."

  ^ gemServer
    gemServer: [ 
      | command |
      "Basic sanity check first..."
      (self isValid: aRequest)
        ifFalse: [ ^ ZnResponse badRequest: aRequest ].	"...ok, looks good. Lets the API tell us what command will take care of it..."
      command := FWRESTAPIv10Command fromRequest: aRequest.	"...and do it..."
      [ command valueOn: self ]
        on: ConnectionTimedOut
        do: [ :x | 
          "200 and no logging?"
          ^ ZnResponse ok: (ZnStringEntity text: 'backend offline') ] ]
    exceptionSet: Error
    beforeUnwind: [ :ex | 
      | errorResponse |
      gemServer doInteractiveModePass: ex.
      errorResponse := Flow isProduction
        ifFalse: [ ZnResponse serverError: ex printString ]
        ifTrue: [ ZnResponse badRequest: aRequest ].
      ex return: errorResponse ]