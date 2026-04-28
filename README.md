# Coding standards and guidelines

A collection of standards for development at Companies House.
See [Confluence](https://companieshouse.atlassian.net/wiki/spaces/DEV/pages/4042162210/Which+software+version+should+I+use)
for which version of software to use (internal CH link).

You can use the [checklists](./checklists/) to ensure a repository is
up to scratch and meeting the latest repository standards.

## General

- [.gitignore](general/gitignore.md)
- [Accessibility Standards](general/accessibility.md)
- [Environment Variables Guidelines](general/environment_variables.md)
- [Healthcheck Endpoint Guidelines](general/health_check.md)
- [Feature Flag Guidelines](general/feature_flag.md)
- [Libraries](general/library_help.md)
- [Logging Standards](general/logging.md)
- [README Standards](general/READMEs.md)
- [Service Naming](general/service_naming.md)
- [Versioning](general/versioning.md)

## Common Standards

- [Common Standards](standards/language_common.md)

## Languages

- [Bash](standards/bash.md)
- [Go](standards/go.md)
- [Java](standards/java.md)
- [Java Review](standards/java_review.md)
- [JavaScript (Node)](standards/javascript_node.md) (for CHIPS development see below)
- [Java Server Pages (JSP)](standards/jsp.md)
- [Perl](standards/perl.md)
- [Terraform](standards/terraform.md)
- [TypeScript (Node)](standards/typescript.md)

## Tools

- [Concourse Pipelines](tools/concourse_pipeline.md)
- [Git](tools/git.md)
- [Makefiles](tools/makefiles.md)
- [Maven](tools/maven.md)
- [Perl POD](tools/perlpod.md)

## CHIPS Development

- [CHIPS Development Guidelines](standards/chips_development.md)
- [JavaScript (CHIPS)](standards/javascript_chips.md)

## Test Tooling

- [Playwright](https://companieshouse.atlassian.net/wiki/spaces/TT/pages/4373184514/Best+Practises) (internal CH link)

## Folder Structure Overview

The following guide explains the purpose of each folder to help keep content
well organised:

- `.ci/bin/` - Helper scripts or linters used in CI pipelines
- `checklists/` - Reusable checklists for manual or automated workflows
- `concourse_icons/` - PNG image assets used in Concourse dashboards, docs or internal tooling
- `general/` - Shared guidance not tied to any one language, tool, or framework - general
best practices
- `git/` - Guidance for using Git consistently across teams
- `gitignore/` - Prebuilt `.gitignore` fragments or examples for common technologies
- `Makefiles/` - Makefile-related standards or examples, organised by language
- `standards/` - Language-specific development standards, code style guides and review checklists
- `templates/` - Markdown templates to be reused across repositories or teams
- `tools/` - Docs for using key tools in the ecosystem (e.g., pipelines, versioning, build
systems)

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
