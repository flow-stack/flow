actions
getFiles 

	^ self path asFileReference exists 
		ifFalse:[#()]
		ifTrue:[self path asFileReference allChildren]