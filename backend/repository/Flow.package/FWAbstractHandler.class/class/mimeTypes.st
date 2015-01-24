accessing
mimeTypes

	^ MIMETypes ifNil:[self initializeMimeTypes]