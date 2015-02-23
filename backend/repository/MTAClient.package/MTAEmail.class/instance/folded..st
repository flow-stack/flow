accessing
folded: anEncodedString
	"Answers the subject in multiline in no more than 80 characters long lines.
	preceeded by =? and followed by ?="
		
	^ (String streamContents:[:stream|
		anEncodedString lines do:[:part|
			stream 
				nextPutAll: self encodingHeader;
				nextPutAll: part; 
				nextPutAll: '?=';
				cr;lf;space]])
		

	"Peixe Urbano sample: 
	Depila√ß√£o a Cera (R$ 9,90) | Modelagem de Sobrancelha | Bombinhas: 7 Di√°rias p/2
	
	^ String streamContents:[:stream|
		stream 
			nextPutAll: '=?utf-8?B?RGVwaWxhw6fDo28gYSBDZXJhIChSJCA5LDkwKSB8IE1vZGVs?=
 =?utf-8?B?YWdlbSBkZSBTb2JyYW5jZWxoYSB8IEJvbWJpbmhhczogNyBEacOhcmlh?=
 =?utf-8?B?cyBwLzI=?=';
			cr;lf]"
