testing
isBasePathValidFor: aRequest
	"Answers true if aRequest has a path that matches the base path of this version of the API"
	
	| apiSegments requestSegments |

	apiSegments := FWRESTAPIv10Handler basePath subStrings: '/'.
	requestSegments := aRequest uri segments.
	
	^ requestSegments size >= 2 and:[
	requestSegments first = apiSegments first and:[
	requestSegments second = apiSegments second ] ]