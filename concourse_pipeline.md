Concourse Pipeline Standards
============================

When creating a new Concourse pipeline, it's best practice to start by using an existing [template](https://github.com/companieshouse/ci-pipelines/tree/master/templates).

Pipeline Name
----------------
-  Should be the same name as the GitHub repo containing the source code that it is building
-  Although the pipeline is a YAML file, it should not have a `.yml` file extension

Job and Resource Names
----------------
- All lowercase
- No underscores.... use hyphens
- No ampersands
- Try to keep names short


Pipeline Structure
----------------
- Pipelines should be ordered by
  - Groups
  - Jobs
  - Resources
  - Resource
- Groups must have an `All` that contains all jobs in the pipeline

Tasks
----------------
- No inline comments
- Try to avoid bespoke `config` and `run` commands in your tasks where possible.  The preferred option is to put it in a task [Concourse Resource](https://github.com/companieshouse/ci-concourse-resources) and call it using `file`.  This means it can be reused in other pipelines and makes your pipeline cleaner and easier to read and maintain.

Resource Icons
----------------
- Only use an approved icon for your `Resources`.  Currently, these are:
  - ![bitbucket](concourse_icons/bitbucket.png) **bitbucket** - used for S3 release buckets (the name is misleading but it's the only bucket icon available)
  - ![docker](concourse_icons/docker.png) **docker** - used for Docker images
  - ![folder-zip](concourse_icons/folder-zip.png) **folder-zip** - used for `maven-repository`
  - ![github-circle](concourse_icons/github-circle.png) **github-circle** - used for GitHub repos
  - ![human](concourse_icons/human.png) **human** - used for accessibility testing
  - ![iframe](concourse_icons/iframe.png) **iframe** - used for `taf-source`
  - ![package-variant-closed](concourse_icons/package-variant-closed.png) **package-variant-closed** - used for releases
  - ![slack](concourse_icons/slack.png) **slack** - used for `notify-slack`
  - ![source-merge](concourse_icons/source-merge.png) **source-merge** - used for analysing pull-requests
  - ![tag](concourse_icons/tag.png) **tag** - used for `release-tag`
  - ![timer](concourse_icons/timer.png) **timer** - used for `time` resources
  - ![xml](concourse_icons/xml.png) **xml** - used for XML files such as pom.xml
