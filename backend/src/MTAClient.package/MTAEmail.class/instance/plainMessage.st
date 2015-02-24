accessing
plainMessage

	^String streamContents: [ :stream |
		stream
			nextPutAll: 'From: ';
			nextPutAll: self from;
			cr. 
			
		self to do: [ :each |
			stream 
				nextPutAll: 'To:  ';
				nextPutAll: each; cr].
						
		self cc do: [ :each |
			stream 
				nextPutAll: 'Cc: ';
				nextPutAll: each; cr].
			
		self bcc do: [ :each |
			stream 
				nextPutAll: 'Bcc: ';
				nextPutAll: each; cr].

		stream
			nextPutAll: 'Subject:';
			space;
			nextPutAll:  self encodedSubject;
			lf.

		(self headers includesKey: 'Content-Type') ifFalse:[
			self headers at: 'Content-Type' put: 'text/plain; charset=utf-8'].

		self headers keysAndValuesDo: [ :key :value |
			stream 
				nextPutAll: key greaseString; nextPut: $:; nextPut: Character space;
				nextPutAll: value greaseString; nextPut: Character cr].
			
		self body isNil ifFalse: [|content|
			content := self body greaseString toUtf8.
			"self isHtml ifFalse:[
				content := Character cr asString, Character cr asString, content]."
			stream nextPutAll: content ] ]