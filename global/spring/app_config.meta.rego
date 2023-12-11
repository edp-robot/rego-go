package global.spring.app_config.meta

hardcoded_password := "hardcoded_password"
_meta[hardcoded_password] = {
  "type": "VULNERABILITY",
  "severity": "BLOCKER",
  "description": "Passwords must not be hardcoded, use environment variables instead",
}

logging_to_file := "logging_to_file"
_meta[logging_to_file] = {
  "type": "CODE_SMELL",
  "severity": "CRITICAL",
  "description": "Logging to a file is not used on Kubernetes-like environments"
}

logging_level_not_info := "logging_level_not_info"
_meta[logging_level_not_info] = {
  "type": "CODE_SMELL",
  "severity": "CRITICAL",
  "description": "Logging level INFO is recommended for production"
}
