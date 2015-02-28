actions
sanitizePayload: aQueryJSONString
	"Answers a copy of aString without content that can be potentially dangerous"
	
	"from:
	http://docs.mongodb.org/manual/faq/developers/#how-does-mongodb-address-sql-or-query-injection
	"
	
	^ aQueryJSONString copyWithoutAll: '$'