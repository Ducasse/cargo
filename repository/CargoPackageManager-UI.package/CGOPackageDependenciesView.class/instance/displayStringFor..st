private - displaying
displayStringFor: aDependency
	^ String streamContents: [ :stream |
		stream nextPutAll:	aDependency targetedPackage asString.
		aDependency constraints ifNotEmpty: [ :constraints |
			stream nextPutAll: ' ('.
			constraints 
				do: [ :constraint |
					stream nextPutAll: constraint asString ]
				separatedBy: [ stream nextPut: $, ].
			stream nextPut: $) ] ]