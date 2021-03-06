initialization
initializeFrom: aDictionary
	super initialize.
	package := self packageFrom: aDictionary.
	version := self versionFrom: aDictionary.
	description := aDictionary at: #description ifAbsent: ''.
	timestamp := DateAndTime now.
	authors := aDictionary at: #authors ifAbsent: #().
	contributors := aDictionary at: #contributors ifAbsent: #().