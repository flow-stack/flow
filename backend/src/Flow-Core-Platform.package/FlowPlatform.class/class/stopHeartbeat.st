actions
stopHeartbeat

	heartbeat ifNotNil: [ | hb |
		hb := heartbeat.
		heartbeat := nil.
		hb terminate ]