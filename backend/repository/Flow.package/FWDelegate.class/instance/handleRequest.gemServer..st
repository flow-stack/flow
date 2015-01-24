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
    gemServerTransaction: [ ^ self handleRequest: request ]
    exceptionSet: ExceptionSet new	"let error handlers up the stack handle the error"
