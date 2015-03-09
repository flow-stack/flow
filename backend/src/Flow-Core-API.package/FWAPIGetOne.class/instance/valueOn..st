actions
valueOn: aHandler 
	"Executes this command for aHandler and the request ."

	| conditions foundOrNil |

	^ self databaseDo: [ 
		self request contents ifNil: [ ^ self newNotFoundFor: nil ].
		conditions := Json readFrom: (self class sanitizePayload: self request contents) readStream.
		foundOrNil := self apiObjectClass findOne: conditions.

		foundOrNil 
			ifNil: [ self newNotFoundFor: self request contents  ]
			ifNotNil: [ 
				(ConfigurationFiles at: #API at: #isUnreferencing) ifTrue: [ 
					 foundOrNil unreferenced ].
				ZnResponse ok: (ZnStringEntity text: foundOrNil asJSONString) ] ]