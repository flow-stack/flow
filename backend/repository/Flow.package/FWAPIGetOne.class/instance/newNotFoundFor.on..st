actions
newNotFoundFor: anId on: aHandler
  ^ ZnResponse notFound: aHandler basePath asString , anId