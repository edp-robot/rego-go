package global.policies

test_get_file_policies_should_return_policies_for_pom {
  get_file_policies[result] with data.context as { 
    "project_type": "maven",
    "files": {
      "./other-module/pom.xml" : {},
      "pom.xml" : {}, 
      "some-module\\pom.xml" : {}
    }
  }
  result["./other-module/pom.xml"][0] = "global.maven.pom"
  result["pom.xml"][0] = "global.maven.pom"
  result["some-module\\pom.xml"][0] = "global.maven.pom"
}

test_get_file_policies_should_return_policies_for_application_config {
  get_file_policies[result] with data.context as { 
    "project_type": "gradle",
    "files": {
      "src/some-module/resources/app.yml" : {},
      "src/some-module/resources/application.yaml" : {}
    }
  }
  result["src/some-module/resources/app.yml"][0] = "global.spring.app_config"
  result["src/some-module/resources/application.yaml"][0] = "global.spring.app_config"
}

test_get_file_policies_should_return_policies_for_deploy_config {
  get_file_policies[result] with data.context as { 
    "project_type": "maven",
    "files": {
      "deploy-templates/my-service.yml" : {}
    }
  }
  result["deploy-templates/my-service.yml"][0] = "global.edp.deploy_template.security_context"
}
