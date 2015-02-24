other
start
	
	"
    GemstoneApp stop.
	GemstoneApp reset.
	GemstoneApp start.
	"

	self setupServer.

	self startHttpd.
	
"	self startTimer.
"