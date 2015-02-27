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
                repository: 'github://GsDevKit/zinc:v2.4.3.?/repository' ];
        yourself.
      spec
        baseline: 'Mapless'
          with: [ spec repository: 'filetree:///opt/git/ta/Mapless/src' ];
        yourself.
      spec
        package: 'Flow'
          with: [ 
              spec
                requires:
                  #('ZincHTTPComponents' 'Mapless' 'ConfigurationFiles' 'MTAClient' 'App') ];
        package: 'ConfigurationFiles';
        package: 'MTAClient';
        package: 'PetShop' with: [ spec requires: #('Flow') ];
        package: 'App';
        yourself.
      spec
        group: 'default' with: #('Flow' 'PetShop');
        group: 'petshop' with: #('PetShop');
        group: 'CI' with: #('Flow');
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