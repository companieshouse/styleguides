# ReadMe Standards
For every repo, the ReadMe should include:
* name of service it relates to (if applicable)
* what does it do
* how do I build it
* how do I run it
* links to further information like Confluence pages for architecture or HLD
* other useful information, for example Troubleshooting
  
Use [github flavored markdown (GFM)](https://github.github.com/gfm/).  
  
Use ReadMes in sub-directories where required. Always link any sub-ReadMes from the top-level ReadMe. <br>
**Example:**  if the repo has a "scripts" directory then it should have an accompanying ReadMe to describe what the scripts do, how to use them, and there should be a link to the scripts directory ReadMe from the top level ReadMe.
 
To help with support in service repos there should be subordinate READMEs where appropriate linked to the main README as follows:

|File name|Expected Content|
|---------|-------|
|DB.md    |DB related info, for example: <ul><li>Oracle Table (read/write)</li><li>Mongo Collection (read/write)</li></ul> |
|KAFKA.md |Kafka relevant info, for example: <ul><li>Kafka topics (read/write)</li><li>Consumer Group</li></ul>|
|CURL.md | examples of `curl` commands to use (i.e. which required Keys/tokens, or other special Headers) to test all the endpoints a service is publishing and listening on, for example: <ul><li>`curl -H "Authorization: $KEY" "${BASE_URL}/alphabetical-search/companies/q=lloyds`</li></ul>|

**Note:** A separate CURL.md should be provided even if there is no URL available. This is to assist support to locate the checks quickly. In this case the file should contain "This service doesn't have HTTP endpoints to interact with, so this file is empty"
  
## GFM styleguide
* use code blocks where appropriate
* if the ReadMe is more than one screen long, split into sections and use headers, so that readers can use the Outline/table of contents.


## Template
You can copy the markdown below to create your ReadMe. Remove any text that does not apply.

```
# Repo Title

<Description: what is this "thing"? what does it do?>

<Name of Service it relates to (if applicable)>

## Requirements

<what is required to build/run this application
i.e.
- [Java](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Maven](https://maven.apache.org/download.cgi)
- [Git](https://git-scm.com/downloads)>

<Are there things that are required to run the application correctly i.e. data in mongo db, environment variables>


## Getting started

### How to Build
<How do you build this application? If there are multiple steps then use a numbered list to describe them.>

### How to Run
<How do you run this application? If there are multiple steps then use a numbered list to describe them.>

## Other useful Information
<include links to Confluence for more information, for example Architecture, HLD>
<include any other useful information, for example Troubleshooting>

<To help with support in service repos there should be subordinate READMEs where appropriate linked to the main README as follows:>
|File name|Expected Content|
|---------|-------|
|DB.md    |<DB related info, for example: Oracle Table (read/write), Mongo Collection (read/write)>|
|KAFKA.md |<Kafka relevant info, for example: Kafka topics (read/write),Consumer Group>|
|CURL.md | <examples of `curl` commands to use to test all the endpoints a service is publishing and listening on, for example: `curl -H "Authorization: $KEY" "${BASE_URL}/alphabetical-search/companies/q=lloyds`>|

**Note:** A separate CURL.md should be provided even if there is no URL available. This is to assist support to locate the checks quickly. In this case the file should contain "This service doesn't have HTTP endpoints to interact with, so this file is empty"
```
