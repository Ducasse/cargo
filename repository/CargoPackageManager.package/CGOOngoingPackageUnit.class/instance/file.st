accessing
file
	self flag: 'TODO: handle git'.
		
	^ self workingCopy 
		ifNil: [ self rawFile ]
		ifNotNil: [ :workingCopy |
			workingCopy needsSaving 
				ifTrue: [ CGODirtyPackageWarning signal: self packageName , ' has unsaved changes' ].
			self workingCopy ancestors first name ]