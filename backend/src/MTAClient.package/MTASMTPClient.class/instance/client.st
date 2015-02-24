accessing
client

	^ client ifNil:[client := SMTPClient new]