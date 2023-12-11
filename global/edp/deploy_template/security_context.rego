package global.edp.deploy_template.security_context

import data.global.edp.deploy_template.security_context.meta

deny[msg] {
  some o,c; input.objects[o].spec.template.spec.initContainers[c].securityContext.runAsUser == 0
  obj := input.objects[o]
  cont := obj.spec.template.spec.initContainers[c]
  msg := {
    "code": meta._rule_code_1,
    "message": sprintf("%v '%v', initContainer '%v' runs as root", [obj.kind, obj.metadata.name, cont.name])
  }
}

deny[msg] {
  some o,c; input.objects[o].spec.template.spec.containers[c].securityContext.runAsUser == 0
  obj := input.objects[o]
  cont := obj.spec.template.spec.containers[c]
  msg := {
    "code": meta._rule_code_2,
    "message": sprintf("%v '%v', container '%v' runs as root", [obj.kind, obj.metadata.name, cont.name])
  }
}
