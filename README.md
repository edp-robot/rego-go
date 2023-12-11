# OPA Policies

A starter repository for OPA Policies. Proposed repository structure contains:
* *global* - Root package for polocies.
  * *policies.rego* and *policies_tests.rego* - a set of matching rules, which returns specific policies for a given filename.
  * Policy definitions. Policy might have several files:
    * *my_policy.rego* - policy definition;
    * *my_policy.meta.rego* - additional policy metadata which contains violation description, severity, type etc.;
    * *my_policy_tests.rego* - unit tests for policy;
* *.manifest* - metadata file having the following sections:
  * *root* - standard OPA element which allows loading mutiple bundles;

## Testing

To run tests locally use:
```
opa test --bundle ./ --verbose --format pretty
```
