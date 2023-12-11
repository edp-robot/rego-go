package global.spring.app_config

import data.global.spring.app_config.meta

appConfig := input

deny[msg] {
  p := appConfig.spring.datasource.password
  not startswith(p, "${")
  msg := { 
    "code": meta.hardcoded_password, 
    "message": "'spring.datasource.password' must be configured with env variable"
    }
}

deny[msg] {
  appConfig.logging.file
  msg := { 
    "code": meta.logging_to_file, 
    "message": "'logging.file' must not be set"
    }
}

deny[msg] {
  appConfig.logging.level.root
  level := appConfig.logging.level.root
  upper(level) != "INFO"
  msg := { 
    "code": meta.logging_level_not_info, 
    "message": "'logging.level.root' must be set to INFO"
    }
}
