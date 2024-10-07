# Periodic Checklist

This checklist contains all the checks which should be done repeatedly to
ensure the repository still meets the repository standards.

This checklist is broken down into groupings based upon areas to be checking
i.e. repository settings, language specific configuration etc.. Some sections
may not be relevant to all repositories, in which case these have a `NA` tick
box which can be checked to identify these sections as not relevant.

## 1. GitHub sections

[Best practices are described here](../git)

- [ ] 1.1 - CODEOWNERS file is correct - i.e. team referenced currently is
  responsible for repo
- [ ] 1.2 - There are an appropriate number of Pull Requests open

  - [ ] 1.2.1 - All are authored by people currently working within a Delivery Team

- [ ] 1.3 - There are an appropriate number of branches open

  - [ ] 1.3.1 - None older than a month

## 2. README.md

[ReadMe standards are here](../READMEs.md)

- [ ] 2.1 - Contains up to date test instructions - do they work?
- [ ] 2.2 - Contains up to date build, deploy and run instructions - do they work?
- [ ] 2.3 - Documents the major version of the language
- [ ] 2.4 - Details required configuration and is up to date

  - [ ] 2.4.1 - Environment variables are clear and described
  - [ ] 2.4.2 - Feature Flags are highlighted and described
  - [ ] 2.4.3 - External configuration is detailed and described

- [ ] 2.5 - Details up to date instructions on how to install
- [ ] 2.6 - Does not reference technologies not currently used (i.e. tilt and vagrant)
- [ ] 2.7 - References to technologies adopted in the project are up to date
- [ ] 2.8 - Test plan present and up to date
- [ ] 2.9 - Contains links to support docs and release notes/docs
- [ ] 2.10 - Links to service documentation present and correct
- [ ] 2.11 - Details how to build container and is up to date
- [ ] 2.12 - Troubleshooting information included and up to date

## 3. Other documentation

- [ ] 3.1 - Useful information pertinent to Kafka is held within `kafka.md` and
  is up to date
- [ ] 3.2 - Useful information pertinent to Databases (i.e.
  Mongo/Elasticsearch/Oracle) is held within `DB.md` and is up to date
- [ ] 3.3 - Includes useful information about how to test service immediately
  (either with curl snippets or postman directory with snippets)

## 4. CI

These standards relate to the repository itself (including GitHub settings and
repository but also to the Concourse pipeline which is held elsewhere)
(Confluence links to follow for instructions for adding Dependency Track,
Sonarqube, Dependency Check)

[Concourse pipeline standards are here](../concourse_pipeline.md)

- [ ] 4.1 - No old jobs in pipeline
- [ ] 4.2 - Jobs are all passing
- [ ] 4.3 - Version file present and contains major/minor version
- [ ] 4.4 - Dockerfile present and can be built
- [ ] 4.5 - Passing regression pack
- [ ] 4.6 - Dependencies have no vulnerabilities and addressed suppressions
- [ ] 4.7 - Sonar issues are resolved

## 5. Configuration Files

- [ ] 5.1 - Does not contain IDE specific configuration files

## 6. Makefiles

[Makefiles standards are here](../makefiles.md)

- [ ] 6.1 - Adheres to styleguide
- [ ] 6.2 - Contains targets: `all`, `clean`, `build`, `test`, `test-unit`,
  `package` and `dist`

## 7. Java

- [ ] N/A

- [ ] 7.1 - Suppress.xml present and all suppressions are within 6 months
- [ ] 7.2 - Javadoc present for all classes and public methods/constructors
- [ ] 7.3 - Javadoc does not contain `@author` tags
- [ ] 7.4 - Code appropriately comments

  - [ ] 7.4.1 - No old out of date comments
  - [ ] 7.4.2 - No unnecessary comments

## 8. Node/Typescript

- [ ] N/A

- [ ] 8.1 - the nunjucks files have `.html` extension and are within `views` directory
- [ ] 8.2 - Code appropriately comments

  - [ ] 8.2.1 - No old out of date comments
  - [ ] 8.2.2 - No unnecessary comments

## 9. Golang

- [ ] N/A

- [ ] 9.1 Dockerfile constructed in modern way
- [ ] 9.2 - Code appropriately comments

  - [ ] 9.2.1 - No old out of date comments
  - [ ] 9.2.2 - No unnecessary comments

## 10. Non-standard repos (i.e. iac/scripting etc.)

- [ ] NA

- [ ] 10.1 - Linting passes, ideally configured with CI

  - `terraform fmt -check` - Terraform
  - `YAMLLint` for yaml files
  - `markdownlint-cli2` for markdown
  - `Shellcheck` for shell files)
- [ ] 10.2 - Code appropriately comments

  - [ ] 10.2.1 - No old out of date comments
  - [ ] 10.2.2 - No unnecessary comments
