versions fetching
bleedingEdgeOf: aPackageName for: platformAttributes
	[ ^ znClient
		url: baseUrl;
		addPathSegment: 'packages';
		addPathSegment: aPackageName;
		addPathSegment: 'latest';
		queryAt: #platform put: ($, join: platformAttributes);
		get ]
	on: ZnHttpUnsuccessful 
	do: [ :error |
		znClient isNotFound 
			ifTrue: [ CGOPackageNotFoundError signal: 'Cannot find ' , aPackageName ]
			ifFalse: [ error signal ] ]