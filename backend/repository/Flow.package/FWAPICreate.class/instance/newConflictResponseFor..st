actions
newConflictResponseFor: objectSent 
	"Answers a response saying that objectSent could not be created"

	| json |

	json := JsonObject new
				message: 'Id already in use';
				id: objectSent id;
				modelClass: objectSent class name;
				yourself.
						
	^ ZnResponse conflict: (ZnStringEntity text: json asJSONString)