package global.spring.app_config

import data.global.spring.app_config.meta

# ------------------------------ #
#              hardcoded_password
# ------------------------------ #
test_deny_spring_datasource_password_when_hardcoded() {
  deny[msg] with input as { "spring": { "datasource": {"password": "hardcoded_password"} } }
  msg.code == meta.hardcoded_password
}

test_allow_spring_datasource_password_when_from_env() {
  count(deny) == 0 with input as { "spring": { "datasource": {"password": "${PASSWORD}"} } }
}

# ------------------------------ #
#              logging_to_file
# ------------------------------ #
test_deny_logging_file_section() {
  deny[msg] with input as { "logging": { "file": {} }}
  msg.code == meta.logging_to_file
}

# ------------------------------ #
#              logging_level_not_info
# ------------------------------ #
test_deny_logging_lelvel_root_when_not_info() {
  deny[msg] with input as { "logging": { "level": { "root": "DEBUG" } }}
  msg.code = meta.logging_level_not_info
}

test_allow_logging_lelvel_root_when_info() {
  count(deny) == 0 with input as { "logging": { "level": { "root": "INFO" } }}
}
