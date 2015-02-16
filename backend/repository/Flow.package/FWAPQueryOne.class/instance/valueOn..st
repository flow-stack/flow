as yet unclassified
valueOn: aHandler
  "ToDo: Should use query protocol to lookup based on conditions, not just assume an id"

  | conditions |
  conditions := Json readFrom: (ReadStream on: self request contents).
  ^ self
    databaseDo: [ 
      | foundOrNil |
      foundOrNil := self apiObjectClass findId: (conditions at: 'id').
      foundOrNil
        ifNil: [ 
          self halt.
          self newNotFoundFor: (conditions at: 'id') on: aHandler ]
        ifNotNil: [ ZnResponse ok: (ZnStringEntity text: foundOrNil asJSONString) ] ]