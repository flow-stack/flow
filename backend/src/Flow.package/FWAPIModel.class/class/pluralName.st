accessing
pluralName
	"Answers the string expected in a nicely designed API.
	Any subclass can override its own custom name.
	The default plural name is the singular name 
	in lower case plus an 's' so beware of irregular nouns."
	
	^ self singularName, 's'
