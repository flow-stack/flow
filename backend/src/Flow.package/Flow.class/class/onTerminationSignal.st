reactions
onTerminationSignal
	"This image's OS process has received a SIGTERM signal.
	For example with a `kill -15 $pid` 
	React by answering it and doing a clean image quit (without preserving state)."
	
	OSProcess accessor restoreSigTerm.
	SmalltalkImage current snapshot: false andQuit: true.
	