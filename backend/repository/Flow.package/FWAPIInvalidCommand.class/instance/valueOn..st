actions
valueOn: aHandler
	"Executes this command for aHandler and the request."
	
	self halt.
	^ ZnResponse badRequest: self request