*flow
conflict: entity

	^ self new
		statusLine: ZnStatusLine conflict;
		headers: ZnHeaders defaultResponseHeaders;
		entity: entity;
		yourself