actions
handle: aRequest with: aResponse

	^ ZnResponse ok: (ZnEntity html: '<h1>flow API</h1>')