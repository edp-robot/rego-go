package global.policies

#--- Add matchers for your policies here ---#

# To add a policy for a specific file
# you need to create a new 'match' rule
# which gets { "file": "a_file_path", "project_type": "a_type_of_project" }
# and returns a name of applicable policy for a given input

# POM policies
pom_project_types = {"maven"}
match["global.maven.pom"] {
  pom_project_types[input.project_type]
  any([
    input.file == "pom.xml",
    glob.match("**/pom.xml", ["/"], input.file)
  ])
}

# App config policies
app_config_project_types = {"maven", "gradle"}
match["global.spring.app_config"] {
  app_config_project_types[input.project_type]
  any([
    glob.match("**/app.y*ml", ["/"], input.file),
    glob.match("**/application.y*ml", ["/"], input.file)
  ])
}

# Deploy template policies
match["global.edp.deploy_template.security_context"] {
  glob.match("deploy-templates/*.y*ml", ["/"], input.file)
}

#--- Entrypoint ---#
get_file_policies[file_policies] {
  file_policies := { file : policies |
    some file; data.context.files[file]
    policies := [r | match[r] with input as {
      "file": replace(file,"\\","/"), # handle paths from Windows 
      "project_type": data.context.project_type
    }]
  }
}
