baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec 
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'DependencyAnalyser' with: [
				spec
					className: #ConfigurationOfDependencyAnalyser;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/Tool-DependencyAnalyser/main/' ];
			project: 'MooseAlgos' with: [
				spec
					className: #ConfigurationOfMooseAlgos;
					versionString: #'bleedingEdge';
					loads: #('Moose-Algos-Graph' );
					repository: 'http://smalltalkhub.com/mc/Moose/MooseAlgos/main/' ];
			project: 'Ston' with: [
				spec
					className: #ConfigurationOfSton;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/STON/main/' ];
			baseline: 'Voyage' with: [
				spec
					repository: 'github://pharo-nosql/voyage:1.4/mc';
					loads: #('memory' 'mongo tests') ];
			project: 'ZincHTTPComponents' with: [
				spec
					className: #ConfigurationOfZincHTTPComponents;
					versionString: #'bleedingEdge';
					loads: #('REST' );
					repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/ZincHTTPComponents/main/' ].
		spec 
			package: #CargoPackageManager with: [
				spec requires: #(#'CargoPackageManager-Minimal' 'ZincHTTPComponents' 'MooseAlgos' ). ];
			package: #'CargoPackageManager-Minimal' with: [
				spec requires: #('Ston' ). ];
			package: #'CargoPackageManager-Repository' with: [
				spec requires: #(#CargoPackageManager #'CargoPackageManager-RepositoryBackend' #'CargoPackageManager-TestRessources' 'ZincHTTPComponents' ). ];
			package: #'CargoPackageManager-RepositoryBackend' with: [
				spec requires: #(#CargoPackageManager #'CargoPackageManager-TestRessources' 'Voyage' ). ];
			package: #'CargoPackageManager-Spec';
			package: #'CargoPackageManager-TestRessources' with: [
				spec requires: #(#CargoPackageManager #'CargoPackageManager-Spec' 'BabyMock2' ). ];
			package: #'CargoPackageManager-Tests' with: [
				spec requires: #(#CargoPackageManager #'CargoPackageManager-RepositoryBackend' #'CargoPackageManager-TestRessources' 'Ston' ). ];
			package: #'CargoPackageManager-Tests-FooResource';
			package: #'CargoPackageManager-UI' with: [
				spec requires: #(#CargoPackageManager ). ];
			package: 'CargoPackageManager-Utils' with: [
				spec requires: #('DependencyAnalyser' ). ];
			package: #'CargoPackageManager-Utils-Tests' with: [
				spec requires: #(#'CargoPackageManager-Tests-FooResource' ). ].
		spec 
			group: 'client' with: #(#CargoPackageManager );
			group: 'server' with: #(#'CargoPackageManager-RepositoryBackend' #'CargoPackageManager-Repository' );
			group: 'tests' with: #('CargoPackageManager-Tests' 'utils' #'CargoPackageManager-Utils-Tests' );
			group: 'utils' with: #('CargoPackageManager-Utils' 'client' ). ]