actions
handle: aRequest with: aResponse

	| entity |

	aRequest uri = '/favicon.ico' asZnUrl ifTrue:[
		entity := ZnEntity with: ZnConstants faviconBytes type: 'image/vnd.microsoft.icon'. 
		^ ZnResponse ok: entity].
	
	^ ZnResponse ok: (ZnEntity html: '<h1>flow</h1>')