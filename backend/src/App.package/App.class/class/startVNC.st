actions
startVNC
	| pwd |
	
	pwd := ConfigurationFiles at: 'VNC' at: 'password'.

	pwd ifNotNil:[ RFBServer current setFullPassword: pwd].
			
	RFBServer current 
		port: (ConfigurationFiles at: 'VNC' at: 'port');
		allowRemoteConnections: (ConfigurationFiles at: 'VNC' at: 'localOnly') not;
		start.	