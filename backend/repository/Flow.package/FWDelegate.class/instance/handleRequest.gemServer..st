actions
handleRequest: request gemServer: gemServer
  "compatability with ZnGemServerManagingMultiThreadedServer"

  "To add a GemStone transaction, subclass and use something like the following:

    gemServer 
      gemServerTransaction: [ ^ self handleRequest: request ]
      exceptionSet: ExceptionSet new

   Using `ExceptionSet new` means that exceptions handled up the stack.
"

  gemServer
    gemServerTransaction: [ 
      | response |
      (prefix isNil or: [ prefix = request uri pathSegments ])
        ifFalse: [ response := ZnResponse notFound: request uri ].
      (self isValidWebSocketRequest: request)
        ifTrue: [ response := self webSocketResponseForRequest: request gemServer: gemServer ]
        ifFalse: [ response := self restfulRequest: request gemServer: gemServer ].
      ^ response ]
    exceptionSet: ExceptionSet new	"let error handlers up the stack handle the error"