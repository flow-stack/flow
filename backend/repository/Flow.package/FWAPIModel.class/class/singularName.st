accessing
singularName
	"Answers the string expected in a nicely designed API.
	Any subclass can override its own custom name.
	The default name is the class name in lowercase."
	
	^ self name asLowercase 
