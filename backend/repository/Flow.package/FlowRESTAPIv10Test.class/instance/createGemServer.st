private
createGemServer
  | gemServer |
  gemServer := GemServer gemServerNamed: self gemServerName.
  self interactiveRemoteServer
    ifTrue: [ gemServer interactiveMode: true ].
  ^ gemServer