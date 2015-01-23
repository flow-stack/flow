actions
startFlowAppDo: aBlock
  [ 
  GemstoneApp start.
  aBlock value ]
    ensure: [ 
	  GemstoneApp reset]
