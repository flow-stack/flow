actions
removeThing: aThing
  "Removes aThing from the things that belong to this thing"

  self things ifNil: [ self things: OrderedCollection new ].
  ^ self things remove: aThing ifAbsent: [ nil ]