actions
startFlowAppDo: aBlock
  | gemServer |
  gemServer := self createGemServer.
  [ 
  self startGems: gemServer.
  aBlock value ]
    ensure: [ self stopGems: gemServer ]