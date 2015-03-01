baselines
baselineCommon: spec
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Mapless'
          with: [ 
              spec
                repository: 'github://flow-stack/Mapless/src';
                loads: #('all') ];
        yourself.
      spec
        package: 'Flow-Core-Platform' with: [ spec requires: #('Mapless' 'MTAClient') ];
        package: 'Flow-Core-API' with: [ spec requires: #('Flow-Core-Platform') ];
        package: 'Flow-Core-App'
          with: [ spec requires: #('Flow-Core-Platform' 'Flow-Core-Handlers') ];
        package: 'Flow-Core-Handlers'
          with: [ spec requires: #('ZincHTTPComponents' 'Flow-Core-Platform' 'Flow-Core-API') ];
        package: 'Flow-Tests'
          with: [ spec requires: #('Flow-Examples' 'Flow-Core-API') ];
        package: 'Flow-Examples'
          with: [ spec requires: #('Flow-Core-Platform' 'Flow-Core-API') ];
        package: 'MTAClient';
        yourself.
      spec
        group: 'default' with: #('all');
        group: 'Core'
          with:
            #('Flow-Core-Platform' 'Flow-Core-App' 'Flow-Core-API' 'Flow-Core-Handlers');
        group: 'Examples' with: #('Core' 'Flow-Examples');
        group: 'Tests' with: #('Core' 'Flow-Tests');
        group: 'all' with: #('Tests');
        yourself ]