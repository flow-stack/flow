actions
makeSIGTERMObserver
	"Answers the process that hooks to the 
	OS signal that makes this worker to shutdown
	when the VM process receives a TERM signal from
	the OS."
	
	^ [|semaphore|
		semaphore := OSProcess accessor forwardSigTerm.
		semaphore ifNotNil: [ semaphore wait ].
		self onTerminationSignal ] 
			forkAt: Processor systemBackgroundPriority 
			named: 'Image SIGTERM'