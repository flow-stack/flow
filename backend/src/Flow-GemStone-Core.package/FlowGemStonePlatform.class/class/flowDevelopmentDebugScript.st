actions
flowDevelopmentDebugScript
  | mInstance |
  "Note: This starts the service only on the first port in the apiPortList"
  ZnTransactionSafeManagingMultiThreadedServer initialize.
  ConfigurationFiles reset.
  (GemServerRegistry gemServerNamed: self flowServerName)
    ifNotNil: [ 
      (GemServerRegistry gemServerNamed: self flowServerName)
        stop;
        unregister.
      self setupServer ].
  mInstance := GemServerRegistry gemServerNamed: self flowServerName.
  System commitTransaction.
  mInstance startServiceOn: self apiPortList first