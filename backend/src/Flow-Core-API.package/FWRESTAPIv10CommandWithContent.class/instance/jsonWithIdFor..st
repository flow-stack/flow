accessing
jsonWithIdFor: aMapless

	^ JsonObject new 
		at: 'id' put: aMapless id;
		yourself