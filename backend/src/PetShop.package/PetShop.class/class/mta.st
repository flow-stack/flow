accessing
mta

	^ mta ifNil:[ mta := MTASMTPClient new ]