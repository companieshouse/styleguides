# Coding standards and guidelines

A collection of standards for development at Companies House.
See [Confluence](https://companieshouse.atlassian.net/wiki/spaces/DEV/pages/4042162210/Which+software+version+should+I+use)
for which version of software to use (internal CH link).

You can use the [checklists](./checklists/) to support ensuring a repository is
up to scratch and meeting the latest repository standards.

## General

- [Service Naming](general/service_naming.md)
- [.gitignore](general/gitignore.md)
- [accessibility](general/accessibility.md)
- [Health checks](general/health_check.md)
- [Feature flags](general/feature_flag.md)
- [READMEs](general/READMEs.md)
- [Environment variables](general/environment_variables.md)
- [Logging](general/logging.md)

## Languages

- [Bash](standards/bash.md)
- [CHIPS](standards/chips_development.md)
- [Go](standards/go.md)
- [Java](standards/java.md)
- [Java Review](standards/java_review.md)
- [JavaScript (Node)](standards/javascript_node.md)
- [JavaScript (Chips)](standards/javascript_chips.md)
- [Java Server Pages (JSP)](standards/jsp.md)
- [Perl](standards/perl.md)
- [Terraform](standards/terraform.md)
- [Common standards](standards/language_common.md)

## Tools

- [Concourse Pipelines](tools/concourse_pipeline.md)
- [Git](tools/git.md)
- [Makefiles](tools/makefiles.md)
- [Maven](tools/maven.md)
- [Perl POD](tools/perlpod.md)

## Linting

This repository is linted using
[Markdownlint](https://github.com/markdownlint/markdownlint). If you have
docker installed and logged into the shared services ECR repository you can run
these checks locally:

```sh
make markdownlint
```

OR

```sh
make markdownlint_file MARKDOWN_FILE=<...>.md
```

(Where <...> is the name of the file to be linted.)

Running the following will attempt to fix any of the markdownlint failures
for you. (You may still have some like long lines to fix manually.)

```sh
FIX_MARKDOWN=true make markdownlint
```
