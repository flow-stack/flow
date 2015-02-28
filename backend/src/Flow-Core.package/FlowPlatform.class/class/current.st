accessing
current
	"Answers the appropriate subclass for the current platform (Smalltalk flavour)"
	^ Current ifNil: [ Current := self initializeCurrentPlatform ]