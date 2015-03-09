actions
newConflictResponseFor: objectSent 
	"Answers a response saying that objectSent could not be created"

	| json |

	json := JsonObject new
				message: 'cid already in use';
				cid: objectSent cid;
				modelClass: objectSent class name;
				yourself.
						
	^ ZnResponse conflict: (ZnStringEntity text: json asJSONString)	