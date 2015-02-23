actions
handle: aRequest with: aResponse

	| file fileStream mime entity response |

	(self isValid: aRequest) ifFalse:[
		^ ZnResponse badRequest: aRequest].

	file := self fileNameFrom: aRequest.

	file isDirectory ifTrue:[
		^ self 
			redirectFor: aRequest 
			with: (ZnResponse redirect: (self baseUri addPathSegment: #/)) ].

	file exists ifFalse: [
		^ self notFound: aRequest].
	
	mime := self mimetypeForFile: file.

	entity := ZnStreamingEntity type: mime length: file entry size.

	fileStream := file readStream binary.
	entity stream: fileStream.
	
	response := ZnResponse ok: entity.
	self onAboutToServe: file for: aRequest on: response.
	response headers at: 'Modification-Date' put: (ZnUtils httpDate:  file entry modification).
	

	^ response