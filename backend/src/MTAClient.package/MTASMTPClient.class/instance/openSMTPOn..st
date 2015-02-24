actions
openSMTPOn: anAccount 
	
	| conf anyone |

	conf := (ConfigurationFiles at: 'MTA' at: 'applications') at: anAccount.

	self client 
		host: (NetNameResolver addressForName: (conf at: #hostname) timeout: 20);
		user: (conf at: #username);
		password: (conf at: #password);
		port: (conf at: #port);
		close;
		reopen