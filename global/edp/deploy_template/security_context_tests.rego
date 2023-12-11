package global.edp.deploy_template.security_context

test_deny_initContainers_when_runAsUser_set_to_root {
  some msg; deny[msg] with input as {
    "objects": [
      { 
        "kind": "DeploymentConfig",
        "metadata": {
          "name": "my-deployment"
        },
        "spec": {
          "template" : {
            "spec": {
              "initContainers": [
                {
                  "name": "container-as-root",
                  "securityContext": {
                    "runAsUser": 0
                  }
                }
              ]
            }
          }
        }
      }
    ]
  }
  msg.code == "init_container_run_as_root"
}

test_deny_containers_when_runAsUser_set_to_root {
  some msg; deny[msg] with input as {
    "objects": [
      { 
        "kind": "DeploymentConfig",
        "metadata": {
          "name": "my-deployment"
        },
        "spec": {
          "template" : {
            "spec": {
              "containers": [
                {
                  "name": "container-as-root",
                  "securityContext": {
                    "runAsUser": 0
                  }
                }
              ]
            }
          }
        }
      }
    ]
  }
  msg.code == "container_run_as_root"
}
