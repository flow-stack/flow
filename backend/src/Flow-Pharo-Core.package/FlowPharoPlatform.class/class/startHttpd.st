actions
startHttpd

	(ZnServer startDefaultOn: (ConfigurationFiles at: 'API' at: 'port'))
		delegate: self makeDispatcher;
		register;
		yourself