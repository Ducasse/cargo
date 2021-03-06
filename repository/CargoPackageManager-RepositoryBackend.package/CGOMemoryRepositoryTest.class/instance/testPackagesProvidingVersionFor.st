tests - virtual packages
testPackagesProvidingVersionFor
	| result |
	
	result := repository 
				packagesProviding: 'Seaside-Canvas-Platform'
				version: '3.1' asSemanticVersion
				for: (OrderedCollection with: #'pharo2.x').
	self 
		assert: result size
		equals: 1.
	self assert: result anyOne
		equals: 'Seaside-Canvas-Pharo20@3.1.0'