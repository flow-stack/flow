actions
basicSendOn: anAccount 

	| queue firstEmail |
	
	queue := self queues at: anAccount.
	
	firstEmail := queue first.

	self client 
		mailFrom: firstEmail from
		to:  firstEmail recipients 
		text: firstEmail plainMessage.

	queue removeFirst
	
