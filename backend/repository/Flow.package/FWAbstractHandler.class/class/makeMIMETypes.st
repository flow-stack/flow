actions
makeMIMETypes 

	^ Dictionary new 
		at: 'txt' put: ZnMimeType textPlain;
		at: 'text' put: ZnMimeType textPlain;
		at: 'js' put: ZnMimeType textJavascript;
		at: 'html' put: ZnMimeType textHtml;
		at: 'css' put: ZnMimeType textCss;
		at: 'png' put: ZnMimeType imagePng;
		at: 'gif' put: ZnMimeType imageGif;
		at: 'jpg' put: ZnMimeType imageJpeg;
		at: 'jpeg' put: ZnMimeType imageJpeg;
		yourself