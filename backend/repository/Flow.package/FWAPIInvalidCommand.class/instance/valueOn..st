actions
valueOn: aHandler
	"Executes this command for aHandler and the request."
	
	^ ZnResponse badRequest: self request halt