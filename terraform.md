# Terraform

Terraform is the default tool used for provisioning cloud infrastructure

## Versions
The currently supported version of Terraform is `0.12`

## Tab Spacing

All code should be tab spaced using `2` characters

## Alignment

All code should be correctly and consistently aligned. This aids legibility

## Naming

All elements should be named using underscores. E.g. `my_resource` not `my-resource`. While the latter will still function Terraform will output warnings

## Modules

If your scripts are sufficiently large to warrant the use of modules then each module should reside in a directory named `module-<FUNCTION>`. For example `module-security-groups`

## Variables

### Naming

Variable names should be meaningful and contextual. For instance when defining a security group for a web server a variable name of `web_cidrs` would make more sense than `my_subnet_cidrs`. Also consider whether the name should be plural. If you're passing in a list of values the name should reflect that

### Security

Thought should be given to any variable values that are committed. While it's still unlikely things like network infrastructure or passwords could be taken advantage of it's still best practice not to commit them anyway. Particularly with more and more repositories being made public

## READMEs

All scripts should be supplied with a populated README outlining the function of the script and also any variables used along with a description. If modules are used then an accompanying README should be present within each module. This keeps the root README manageable while still allowing sufficient depth to explain each module in detail. The root README should link to the module READMEs
