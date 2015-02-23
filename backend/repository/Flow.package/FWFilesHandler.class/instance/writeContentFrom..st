actions
writeContentFrom: aRequest 

	| file content |

	file := (self files
			detect:[:each| each basename = aRequest uri segments last]
			ifNone:[self fileFrom: aRequest]) asFileReference. 

	file parent ensureCreateDirectory. 
	
	aRequest contents isString
		ifTrue: [content := aRequest contents withInternetLineEndings]
		ifFalse: [content := aRequest contents].
		
	"For some reason if we don't delete it first, it gets write corrupted sometimes :/"
	file delete.
	file writeStreamDo:[:stream|
		stream << content].
	
	^ ZnResponse ok: (ZnEntity text: 'OK')