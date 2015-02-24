accessing
recipients
	^ self to , self cc , self bcc collect: [ :each | each asString ]