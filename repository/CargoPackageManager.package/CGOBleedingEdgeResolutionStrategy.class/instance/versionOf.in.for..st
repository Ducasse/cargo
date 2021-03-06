solving
versionOf: aPackageName in: aRepositoryList for: platformAttributes
	| candidates |

	candidates := aRepositoryList 
		flatCollect: [ :repository | 
			repository bleedingEdgeOf: aPackageName for: platformAttributes ]
		as: Set.
	(candidates size > 1)
		ifTrue: [ CGOUnresolvedDependency package: aPackageName candidates: candidates ].
	^ candidates detectMax: [ :v | v ]