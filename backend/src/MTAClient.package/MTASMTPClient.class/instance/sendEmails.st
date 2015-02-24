actions
sendEmails

	self isIdle ifTrue:[
		self beBusy.
		[self accounts do:[:account|
			(self notEmptyOn: account) ifTrue:[	
				[self openSMTPOn: account.
				self basicSendOn: account] ensure:[
					self client stream ifNotNil:[
					self client quit; close]]]]] ensure: [
		self beIdle]].