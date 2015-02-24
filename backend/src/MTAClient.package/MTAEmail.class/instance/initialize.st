accessing
initialize 

	super initialize.

	self 
		headerAt: 'Date' put: (GRPrinter rfc822 print: DateAndTime now);
		headerAt: 'MIME-Version' put: '1.0';
		yourself