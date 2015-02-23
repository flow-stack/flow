actions
restfulRequest: aRequest

	| theHandler |

	theHandler := self handlerFor: aRequest.

	theHandler ifNil:[^ZnResponse notFound: aRequest uri].	

	^ theHandler 
		value: aRequest 
		value: (ZnResponse new
				statusLine: (ZnStatusLine ok);
				headers: ZnHeaders defaultResponseHeaders;
				yourself)