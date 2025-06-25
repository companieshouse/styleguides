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

## Folder Structure Overview

This repository includes a wide range of documentation and standards used across teams. The following guide explains the purpose of each folder to help keep content well organised:

### `.ci/bin/`
Helper scripts or linters used in CI pipelines.  
Example: `markdownlint`

### `Makefiles/`
Makefile-related standards or examples, organised by language.  
Examples: `go_makefiles.md`, `java_makefiles.md`, `makefile_standards.md`

### `checklists/`
Reusable checklists for manual or automated workflows.  
Examples: `one-off-checklist.md`, `periodic-checklist.md`

### `concourse_icons/`
PNG image assets used in Concourse dashboards, docs, or internal tooling.  
Examples: `docker.png`, `tag.png`, `iframe.png`

### `general/`
Shared guidance not tied to any one language, tool, or framework — general best practices.  
Examples: `feature_flag.md`, `logging.md`, `accessibility.md`

### `git/`
Guidance for using Git consistently across teams.  
Examples: `branches.md`, `commits.md`, `pull-requests.md`

### `gitignore/`
Prebuilt `.gitignore` fragments or examples for common technologies.  
Examples: `go/`, `maven/`, `perl/`, `ant/`

### `standards/`
Language-specific development standards, code style guides, and review checklists.  
Examples:  
- `bash.md`, `go.md`, `java.md`, `terraform.md` — core language guidance  
- `chips_development.md`, `javascript_chips.md` — CHIPS-specific adaptations  
- `language_common.md`, `java_review.md` — general or review-related docs

### `templates/`
Markdown templates to be reused across repositories or teams.  
Example: `README.template.md`

### `tools/`
Docs for using key tools in the ecosystem (e.g., pipelines, versioning, build systems).  
Examples: `concourse_pipeline.md`, `git.md`, `maven.md`, `perlpod.md`

### Root files:
- `README.md`: Introductory info for the repo itself.  
- `Makefile`: Used to automate formatting, validation, or doc generation (if applicable).  
- `library_help.md`: Likely helper documentation or support material for teams using shared libraries.

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
