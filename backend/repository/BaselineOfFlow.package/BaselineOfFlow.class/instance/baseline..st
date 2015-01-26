baselines
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'ZincHTTPComponents'
          with: [ 
              spec
                loads: #('WebSocket' 'CI');
                repository: 'github://GsDevKit/zinc:gs_master/repository' ];
        yourself.
      spec
        baseline: 'Mapless'
          with: [ 
              spec
                loads: #('GemStone' 'CI');
                repository: 'github://GsDevKit/Mapless:gs_master/repository' ];
        yourself.
      spec
        package: 'Flow'
          with: [ 
              spec
                requires:
                  #('ZincHTTPComponents' 'Mapless' 'ConfigurationFiles' 'MTAClient') ];
        package: 'ConfigurationFiles';
        package: 'MTAClient';
        package: 'PetShop' with: [ spec requires: #('Flow') ];
        package: 'App' with: [ spec requires: #('Flow') ];
        yourself.
      spec
        group: 'default' with: #('Flow' 'PetShop');
        group: 'petshop' with: #('PetShop');
        yourself ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        baseline: 'GLASS1'
          with: [ 
              spec
                loads: #('GsSqueakCommon');
                repository: 'github://glassdb/glass:master/repository' ];
        yourself ]