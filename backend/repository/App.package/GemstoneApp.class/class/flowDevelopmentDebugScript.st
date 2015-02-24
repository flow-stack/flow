other
flowDevelopmentDebugScript
  | mInstance |
  ZnTransactionSafeManagingMultiThreadedServer initialize.
  ConfigurationFiles reset.
  (GemServerRegistry gemServerNamed: GemStoneApp flowApplicationServerName)
    ifNotNil: [ 
      (GemServerRegistry gemServerNamed: GemStoneApp flowApplicationServerName)
        stop;
        unregister.
      GemStoneApp setupServer ].
  mInstance := GemServerRegistry
    gemServerNamed: GemStoneApp flowApplicationServerName.
  System commitTransaction.
  mInstance startServiceOn: GemStoneApp defaultApiPort