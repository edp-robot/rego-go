package global.maven.pom

import data.global.maven.pom.meta

pom := input

deny[msg] { 
  some d; pom.dependencies[d]
  dep := pom.dependencies[d]
  dep.version
  # the version might be parsed as a number, so converting it to a string
  not startswith(sprintf("%v", [dep.version]), "${")
  msg := {
    "code": meta.dependency_version,
    "message": sprintf("dependency '%v' must not include version but has '%v'", [dep.artifactId, dep.version])
  }
}

deny[msg] {
    deps := [ d | d := pom.dependencies[i]; 
    contains(pom.dependencies[i].artifactId, "test");
    not pom.dependencies[i].scope = "test"
  ]
  msg := {
    "code": meta.a_test_without_test_scope,
    "message": sprintf("dependencies for testing must have 'test' scope: '%v'", [deps[_].artifactId])
  }
}

deny[msg] {
  deps := [ d | d := pom.dependencies[i]; 
    contains(pom.dependencies[i].artifactId, "mock");
    not pom.dependencies[i].scope = "test"
  ]
  msg := {
    "code": meta.mock_without_test_scope,
    "message": sprintf("%v: dependencies for mocking must have 'test' scope: '%v'", [deps[_].artifactId])
  }
}

