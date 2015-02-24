other
stopTimer

	timer ifNotNil:[ |t|
		t := timer.
		timer := nil.
		t terminate]