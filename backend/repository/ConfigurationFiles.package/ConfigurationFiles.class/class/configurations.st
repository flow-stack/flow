accessing
configurations

	^ configurations ifNil:[self initializeConfigurations]