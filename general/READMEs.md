# README Standards

A README should contain enough information for someone to pick up a repo and be able to run it cold. Keep it as clear and concise as possible, and make sure you follow [the technical documentation style guide](https://companieshouse.atlassian.net/wiki/x/sIAXQgE) for formatting and writing guidance. You should also read the [markdown style guide](https://github.com/style-guides/Markdown).

A README should help someone understand:

* What it is
* How to build it
* How to run it
* How to test it
* Other useful information if appropriate, such as troubleshooting
  
Anything outside of this scope should be captured and stored on Confluence, and linked to from the README. Unless your repo is very complex, the above will be enough information.

## Overview Requirements 

Within the first sentence, you must mention the service's full name as well as a high level summary of its purpose and any abbreviations in full. For example: 

```markdown
The Verification API is a micro service, accessed via endpoints to manipulate and verify the data stored when a user is verified.
```

## Developer Requirements

List any tools devs will need to build and test your repo. If it runs on specific versions of languages and software, mention this. For example, Java 21.

This section should also list how to build the service. Your instructions don't need to be long or detailed. They should just be enough to get the repo up and running. Anything else can be explained in other documentation.

Include some testing information here, such as how to initiate unit tests. For integration and end-to-end testing, write a separate markdown file.

## Data Requirements

The README should contain necessary data requirements, such as environment variables and database access. Environment variables should, at minimum, be listed as a distinct section. However, best practice is to list them in a table, containing:

* Variable name
* What it controls
* A brief description of the variable

Refer to the example below:

| Name | Description | Mandatory | Default | Example |
|------|-------------|-----------|---------|---------|
| API_SERVICE_URL | URL of the API service | Y | N/A | N/A |
| HTTP_TIMEOUT | How long the API is allowed to take | Y | 2 seconds | N/A |

## In Service Repos

To help with support in service repos there should be subordinate READMEs
where appropriate linked to the main README as follows:

<!-- markdownlint-disable MD013 MD033 -->
|File name|Expected Content|
|---------|-------|
|DB.md    |DB related info, for example: <ul><li>Oracle Table (read/write)</li><li>Mongo Collection (read/write)</li></ul> |
|KAFKA.md |Kafka relevant info, for example: <ul><li>Kafka topics (read/write)</li><li>Consumer Group</li></ul>|
|CURL.md | examples of `curl` commands to use (i.e. which required Keys/tokens, or other special Headers) to test all the endpoints a service is publishing and listening on, for example: <ul><li>`curl -H "Authorization: $KEY" "${BASE_URL}/alphabetical-search/companies/q=lloyds`</li></ul>|
<!-- markdownlint-enable MD013 MD033 -->

**Note:** A separate CURL.md should be provided even if there is no URL
available. This is to assist support to locate the checks quickly. In this
case the file should contain "This service doesn't have HTTP endpoints to
interact with, so this file is empty"

## Extra Information

Additional information is useful for helping users 
understand the service better. If you plan to 
include extra information, make sure every section 
is labelled with a clear, short heading. Use H2-H4 
to arrange subheadings, and format a table of 
contents at the top of the README.

Depending on the complexity of the repo, some useful information may include:

* Troubleshooting
* Development workflow
* Technical notes
* Endpoints
* Error handling

However, this information is better kept in separate markdown 
files elsewhere in the repo. Link to them from the README instead.

**Example:** If the repo has a "scripts" directory then it should have an
accompanying README to describe what the scripts do, how to use them, 
and there should be a link to the scripts directory README 
from the top level README.

## Template

You can copy the [markdown template](../templates/README.template.md) to create
your README. Remove any text that does not apply.
