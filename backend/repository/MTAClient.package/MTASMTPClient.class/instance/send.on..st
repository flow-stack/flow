actions
send: anEmail on: anAccountName
	"Sends anEmail using the configurations found at anAccountName."
	
	(self queues 
		at: anAccountName 
		ifAbsentPut:[OrderedCollection new]) addLast: anEmail 