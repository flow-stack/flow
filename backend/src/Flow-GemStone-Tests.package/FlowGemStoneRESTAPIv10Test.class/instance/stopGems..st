private
stopGems: gemServer
  self staticRemoteServer
    ifFalse: [ 
      gemServer stopGems.
      (Delay forSeconds: 3) wait ]