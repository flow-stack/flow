accessing
files 

	^ files ifNil:[self initializeFiles]