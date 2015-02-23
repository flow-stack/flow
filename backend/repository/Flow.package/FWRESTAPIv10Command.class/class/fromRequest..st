actions
fromRequest: aRequest
	"Answers an instance of the command valid for aRequest (or invalid command if nothing fits)"

	^ ( (self allSubclasses reject:[:e| e isAbstract])
		detect: [ :commandClass | commandClass isValidFor: aRequest ] 
		ifNone: [ FWAPIInvalidCommand ] ) 
			for: aRequest