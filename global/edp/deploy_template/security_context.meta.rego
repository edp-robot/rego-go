package global.edp.deploy_template.security_context.meta

_rule_code_1 := "init_container_run_as_root"
_meta[_rule_code_1] = {
  "type": "VULNERABILITY",
  "severity": "CRITICAL",
  "description": "Init containers should not be ran as a root user"
}

_rule_code_2 := "container_run_as_root"
_meta[_rule_code_2] = {
  "type": "VULNERABILITY",
  "severity": "CRITICAL",
  "description": "Containers should not be ran as a root user"
}
