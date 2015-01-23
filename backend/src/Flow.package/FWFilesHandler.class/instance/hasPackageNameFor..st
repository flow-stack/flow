testing
hasPackageNameFor: aRequest

	^ self class packageName isEmpty
		ifTrue:[false]
		ifFalse:[(self class packageName,'*') match: aRequest uri segments last]