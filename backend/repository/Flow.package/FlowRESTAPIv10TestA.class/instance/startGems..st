private
startGems: gemServer
  "FlowRESTAPIv10TestA staticRemoteServer: true.
   FlowRESTAPIv10TestA interactiveRemoteServer: true.

   FlowRESTAPIv10TestA staticRemoteServer: false.
   FlowRESTAPIv10TestA interactiveRemoteServer: false."

  "mount @/sys/stone/dirs/Flow/tode /home flow"

  "abort; /home/flow/debugGemServer --start=FlowAppServer_Test --interactive=true"

  self staticRemoteServer
    ifTrue: [ 
      System commitTransaction.
      self
        notify:
          'Proceed when static server is available. Evaluate: abort; /home/flow/debugGemServer --start=FlowAppServer_Test --interactive=true' ]
    ifFalse: [ gemServer startGems ]