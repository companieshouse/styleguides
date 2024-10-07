# One Off Checklist

This Checklist contains all checks which once completed should remain complete
in perpetuity - i.e. permanently complete. Ideally should be completed shortly
after a repository is created.

This checklist is broken down into groupings based upon areas to be checking
i.e. repository settings, language specific configuration etc.. Some sections
may not be relevant to all repositories, in which case these have a `NA` tick
box which can be checked to identify these sections as not relevant.

## 1. GitHub sections

[Best practices are described here](../git)

- [ ] 1.1 - Main branch protected with protection rules

  - [ ] 1.1.1 - Requires minimum of 1 review
  - [ ] 1.1.2 - Require latest commit reviewed / dismiss stale reviews

- [ ]  1.2 - GitHub Repository settings are correct

  - [ ] 1.2.1 - Auto Delete Head branches enabled
  - [ ] 1.2.2 - Auto Merging enabled
  - [ ] 1.2.3 - `Issues`, `Wiki` are disabled

- [ ] 1.3 - GitHub repository has description
- [ ] 1.4 - CODEOWNERS file present and
- [ ] 1.5 - Pull Request template defined

  - [ ] 1.5.1 - Enforces to the
    [Pull request style guide](../git/pull-requests.md)

- [ ] 1.6 - MIT License
- [ ] 1.7 - Service name adheres to service naming guide

## 2. README.md file

[ReadMe standards are here](../READMEs.md)

- [ ] 2.1 - Present and adheres to standards
- [ ] 2.2 - Contains a description and context for the repository
- [ ] 2.3 - Documents which stack/cluster the repository forms part of
- [ ] 2.4 - Internationalisation applied (if has a UI)

## 3. Other documentation

There are no checks to be done under this section.

## 4. CI

These standards relate to the repository itself (including GitHub settings and
repository but also to the Concourse pipeline which is held elsewhere)
(Confluence links to follow for instructions for adding Dependency Track,
Sonarqube, Dependency Check)

[Concourse pipeline standards are here](../concourse_pipeline.md)

- [ ] 4.1 - Configured with GitHub Branch Protection rule
- [ ] 4.2 - Concourse pipeline has unique Webhook tokens
- [ ] 4.3 - Configured with SonarQube
- [ ] 4.4 - Configured with Dependency Check
- [ ] 4.5 - Concourse pipeline includes SBOM generation task and sends to
  Dependency Track
- [ ] 4.6 - Configured with the correct requirements for code coverage (85%)
- [ ] 4.7 - Conforms to the standards laid out

## 5. Configuration Files

- [ ] 5.1 - `.gitignore` setup with suitable suppressions
- [ ] 5.2 - `.gitattributes` setup for non-text files for known binary formats

## 6. Makefiles

[Makefiles standards are here](../makefiles.md)

- [ ] 6.1 - Present in Repository

## 7. Java

- [ ] N/A

- [ ] 7.1 - Setup as a Maven project

  - [ ] 7.1.1 - Maven wrapper present
  - [ ] 7.1.2 - Correct groupId of `uk.gov.companieshouses`

- [ ] 7.2 - Parent POM set as CH parent POM
- [ ] 7.3 - Contains Dockerfile for deployment
- [ ] 7.4 - Deployed using terraform
- [ ] 7.6 - Base package for the component is `uk.gov.companieshouse`
- [ ] 7.7 - Healthcheck configured as per current best practices
- [ ] 7.8 - POM Contains plugins: `jacoco`, `sonar` and `checkstyle`
- [ ] 7.9 - Uses standard libraries for Web Server

## 8. Node/Typescript

- [ ] N/A

- [ ] 8.1 - Created from CH template or matches its structure
- [ ] 8.2 - package.json contains:

  - name
  - repository
  - engine requirements

- [ ] 8.3 - tsconfig.json file present and configured appropriately
- [ ] 8.4 - .nvmrc file present
- [ ] 8.5 - Makefile present with targets:

  - `all`
  - `clean`
  - `build`
  - `lint`
  - `sonar`
  - `test-unit`
  - `test`
  - `security-check`
  - `dist`

- [ ] 8.6 - .eslintrc present and configured appropriately
- [ ] 8.7 - sonar.properties file present and configured
- [ ] 8.8 - pre-commit and pre-push hooks configured (using Husky)

## 9. Golang

There are no checks to be done under this section.

## 10. Non-standard repos (i.e. iac/scripting etc.)

- [ ] NA

- [ ] 10.1 - Readme contains details of pre-requisites and software versions required
- [ ] 10.2 - Contains Makefile with minimum of targets:

  - `all`
  - `lint`

- [ ] 10.3 - Contains version file
