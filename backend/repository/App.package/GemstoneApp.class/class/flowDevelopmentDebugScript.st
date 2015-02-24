other
flowDevelopmentDebugScript
  | mInstance |
  ZnTransactionSafeManagingMultiThreadedServer initialize.
  ConfigurationFiles reset.
  (GemServerRegistry gemServerNamed: self flowApplicationServerName)
    ifNotNil: [ 
      (GemServerRegistry gemServerNamed: self flowApplicationServerName)
        stop;
        unregister.
      self setupServer ].
  mInstance := GemServerRegistry gemServerNamed: self flowApplicationServerName.
  System commitTransaction.
  mInstance startServiceOn: self defaultApiPort