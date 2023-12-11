package global.maven.pom.meta

dependency_version := "dependency_version"
_meta[dependency_version] = {
  "type": "CODE_SMELL",
  "severity": "MAJOR",
  "description": "Dependency version should be specified at 'dependencyManagement' section"
}

a_test_without_test_scope := "test_without_test_scope"
_meta[a_test_without_test_scope] = {
  "type": "CODE_SMELL",
  "severity": "MAJOR",
  "description": "Dependencies with a 'test' text in an artifactId should have a 'test' scope"
}

mock_without_test_scope := "mock_without_test_scope"
_meta[mock_without_test_scope] = {
  "type": "CODE_SMELL",
  "severity": "MAJOR",
  "description": "Dependencies with a 'mock' text in an artifactId should have a 'test' scope"
}