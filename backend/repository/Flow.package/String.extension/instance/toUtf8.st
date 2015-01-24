*flow
toUtf8
	"Answers the string which is the result of decoding the receiver in utf8"
	
	^ (GRCodec forEncoding: 'utf-8') encode: self