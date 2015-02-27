actions
valueOn: aHandler
  "Executes this command for aHandler and the request ."

  | result |
  ^ self
    databaseDo: [ 
      | conditions foundOrNil |
      conditions := Json
        readFrom: (self class sanitizePayload: self request contents) readStream.
      foundOrNil := self apiObjectClass findOne: conditions.
      foundOrNil
        ifNil: [ self newNotFoundFor: conditions asString on: aHandler ]
        ifNotNil: [ ZnResponse ok: (ZnStringEntity text: foundOrNil asJSONString) ] ]