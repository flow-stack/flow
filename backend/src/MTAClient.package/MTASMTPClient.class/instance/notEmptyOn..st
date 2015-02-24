testing
notEmptyOn: anAccount 

	^ (self queues 
		at: anAccount 
		ifAbsent:[#()]) notEmpty