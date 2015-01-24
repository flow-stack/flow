actions
sendTo: aReceiverAddress from: aSenderAddress subject: aSubjectString body: aMessageString on: anAccountName

	^ self 
		send: (self 
				makeEmailTo: aReceiverAddress 
				from: aSenderAddress 
				subject: aSubjectString 
				body: aMessageString) 
		on: anAccountName 

		