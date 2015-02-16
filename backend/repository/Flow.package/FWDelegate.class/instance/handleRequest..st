actions
handleRequest: request
	"Server delegate entry point"

	| response |

	(prefix isNil or: [ prefix = request uri pathSegments ])
		ifFalse: [ response := ZnResponse notFound: request uri ].
	(self isValidWebSocketRequest: request)
		ifTrue: [ response := self webSocketResponseForRequest: request ]
		ifFalse: [ response := self restfulRequest: request ].
	

^ response