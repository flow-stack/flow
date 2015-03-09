actions
makeEmailTo: aReceiverAddress from: aSenderAddress subject: aSubjectString body: aMessageString

	^ MTAEmail new 
		addTo: aReceiverAddress;
		from: aSenderAddress;
		subject: aSubjectString;
		body: aMessageString;
		yourself