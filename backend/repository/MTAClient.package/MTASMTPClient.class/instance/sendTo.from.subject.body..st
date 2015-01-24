actions
sendTo: aReceiverAddress from: aSenderAddress subject: aSubjectString body: aMessageString 

	^ self sendTo: aReceiverAddress from: aSenderAddress subject: aSubjectString body: aMessageString on: 'default'
		