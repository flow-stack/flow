accessing
confFiles

	^ (FileLocator imageDirectory / 'conf') resolve allFiles select:[:e|
		e extension = 'conf']
	