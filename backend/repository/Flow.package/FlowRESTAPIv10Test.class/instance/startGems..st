private
startGems: gemServer
  "FlowRESTAPIv10Test staticRemoteServer: true.
   FlowRESTAPIv10Test interactiveRemoteServer: true.

   FlowRESTAPIv10Test staticRemoteServer: false.
   FlowRESTAPIv10Test interactiveRemoteServer: false."

  "mount @/sys/stone/dirs/Flow/tode /home flow"

  "abort; /home/flow/debugGemServer --start=FlowAppServer_Test --interactive=true"

  self staticRemoteServer
    ifTrue: [ 
      System commitTransaction.
      self
        notify:
          'Proceed when static server is available. Evaluate: abort; /home/flow/debugGemServer --start=FlowAppServer_Test --interactive=true' ]
    ifFalse: [ gemServer startGems ]