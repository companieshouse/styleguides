# Coding standards and guidelines

A collection of standards for development at Companies House.

## General

-   [Service Naming](service_naming.md)
-   [.gitignore](gitignore.md)
-   [accessibility](accessibility.md)
-   [Health checks](health_check.md)
-   [Feature flags](feature_flag.md)
-   [READMEs](READMEs.md)
-   [Environment variables](environment_variables.md)
-   [Logging](logging.md)

## Languages

-   [Bash](bash.md)
-   [Go](go.md)
-   [Java](java.md)
-   [Java Review](java_review.md)
-   [JavaScript (Node)](javascript_node.md)
-   [JavaScript (Chips)](javascript_chips.md)
-   [Java Server Pages (JSP)](jsp.md)
-   [Perl](perl.md)
-   [Terraform](terraform.md)
-   [Common standards](language_common.md)

## Tools

-   [Concourse Pipelines](concourse_pipeline.md)
-   [Git](git.md)
-   [Makefiles](makefiles.md)
-   [Maven](maven.md)
-   [Perl POD](perlpod.md)

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
