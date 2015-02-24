actions
fileNameFrom: aRequest
		
	| requestedPath absolute |

	absolute := self path asFileReference absolutePath.

	aRequest uri isDirectoryPath ifTrue:[
		^ absolute asFileReference / self defaultFilename].
	
	requestedPath := aRequest url segments.

	absolute asFileReference path segments
		do: [:part | (requestedPath includes: part)
				ifTrue: [requestedPath remove: part]].

	requestedPath
		do: [:part | absolute := absolute / part].

	^ absolute asFileReference