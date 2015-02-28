testing
isFileHandlerFor: aRequest 
	"Answers true if the filename in aRequest is present among the files
	handled by this handler.
	Applicability: useful for writting a file you also serve with this handler.
	Flow uses this every time you commit code from the Amber's Browser."

	^ (self files anySatisfy:[:e| 
		e basename = aRequest uri segments last]) or:[
	((self isCodeFor: aRequest) and:[
	self hasPackageNameFor: aRequest])]