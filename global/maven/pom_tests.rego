package global.maven.pom

import data.global.maven.pom.meta

# ------------------------------ #
#              dependency_version
# ------------------------------ #
test_deny_dependency_when_version_specified {
  deny[msg] with input.dependencies as [ { "artifactId": "my-dependency", "version": "0.0.1" } ]
  msg.code == meta.dependency_version
}

# ------------------------------ #
#              test_without_test_scope
# ------------------------------ #
test_deny_dependency_when_contains_test_and_without_test_scope {
  deny[msg] with input.dependencies as [ { "artifactId": "my-test-dependency" } ]
  msg.code == meta.a_test_without_test_scope
}

test_allow_dependency_when_contains_test_and_with_test_scope {
  count(deny) == 0 with input.dependencies as [ { "artifactId": "my-test-dependency", "scope": "test" } ]
}

# ------------------------------ #
#              mock_without_test_scope
# ------------------------------ #
test_deny_dependency_when_contains_mock_and_without_test_scope {
  deny[msg] with input.dependencies as [ { "artifactId": "my-mock-dependency" } ]
  msg.code == meta.mock_without_test_scope
}

test_allow_dependency_when_contains_mock_and_with_test_scope {
  count(deny) == 0 with input.dependencies as [ { "artifactId": "my-mock-dependency", "scope": "test" } ]
}
