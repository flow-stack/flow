"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.

(Smalltalk at: #GsUpgrader) upgradeGrease. 

GsDeployer deploy: [
  "Load Flow... "
  Metacello new
    baseline: 'Flow';
    repository: 'filetree://', gitPath, '/flow/repository';
    load: #('CI')
].

false ifTrue: [
  "Run all tests in image"
  TravisCISuiteHarness
    value: TestCase suite
    value: 'TravisCISuccess.txt'
    value: 'TravisCIFailure.txt'.
] ifFalse: [
  "Run the  Mapless tests"
  TravisCIHarness
    value: #( 'BaselineOfFlow' )
    value: 'TravisCISuccess.txt' 
    value: 'TravisCIFailure.txt'.
].
