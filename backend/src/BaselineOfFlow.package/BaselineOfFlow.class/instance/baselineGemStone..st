baselines
baselineGemStone: spec
	spec
		for: #gemstone
		do: [ 
			spec
				baseline: 'GLASS1'
					with: [ 
							spec
								loads: #('GsSqueakCommon');
								repository: 'github://glassdb/glass:master/repository' ];
				yourself.
			spec
				baseline: 'Mapless' with: [ spec repository: 'github://GsDevKit/Mapless:master/src' ];
				yourself.
			spec
				baseline: 'ZincHTTPComponents'
					with: [ 
							spec
								loads: #('WebSocket' 'CI');
								repository: 'github://GsDevKit/zinc:v2.4.3.?/repository' ];
				yourself.
			spec package: 'Flow-GemStone-Core' with: [ spec requires: #('Flow-Core') ].
			spec package: 'Flow-GemStone-Tests' with: [ spec requires: #('Flow-GemStone-Core') ].
			spec
				group: 'default' with: #('Core' 'Flow-GemStone-Core');
				group: 'Tests' with: #('Core' 'Flow-GemStone-Tests');
				group: 'CI' with: #('Tests');
				yourself ]