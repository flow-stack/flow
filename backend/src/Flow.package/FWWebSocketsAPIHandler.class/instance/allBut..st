accessing
allBut: socket
	"Return a collection of all the clients except socket"
	^ self clients copy 
		remove: socket ifAbsent:[nil];
		yourself