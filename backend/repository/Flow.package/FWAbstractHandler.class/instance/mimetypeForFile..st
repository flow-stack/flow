accessing
mimetypeForFile: aFilename

	^ self class mimeTypes at: (aFilename basename copyAfterLast: $.)