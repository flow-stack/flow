private
startGems: gemServer
  self staticRemoteServer
    ifTrue: [ 
      System commitTransaction.
      self notify: 'Proceed when static server is available.' ]
    ifFalse: [ gemServer startGems ]