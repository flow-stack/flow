other
startTimer

	timer := [
		[(Delay forDuration: self pause) wait.
		self timerTick] repeat] 
			forkAt: Processor userBackgroundPriority
			named: 'application timmer'