accessing
initializeCurrentPlatform
	"Answers the appropriate subclass for the current platform (Smalltalk flavour)"
	^ self subclasses detect: [ :platformClass | platformClass isValidForCurrentPlatform ]