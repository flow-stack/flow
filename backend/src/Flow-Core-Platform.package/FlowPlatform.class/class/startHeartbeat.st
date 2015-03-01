actions
startHeartbeat

	heartbeat := [
		[(Delay forDuration: self pulseRate) wait.
		self heartbeat] repeat] 
			forkAt: Processor userBackgroundPriority
			named: 'flow heartbeat'