# Repo Title

<Description: what is this "thing"? what does it do?>

## Requirements

<what is required to build/run this application
i.e.

- [Java](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Maven](https://maven.apache.org/download.cgi)
- [Git](https://git-scm.com/downloads)

>

<Are there things that are required to run the application correctly i.e. data
in mongo db, environment variables>

## Getting started

### How to Build

<How do you build this application? If there are multiple steps then use a
numbered list to describe them.>

### How to Run

<How do you run this application? If there are multiple steps then use a
numbered list to describe them.>

## Other useful Information

<include links to Confluence for more information, for example Architecture,
HLD>
<include any other useful information, for example Troubleshooting>

## For Service Repos

<!-- markdownlint-disable MD013  -->
| File name|Expected Content|
|---------|-------|
| DB.md    | <DB related info, for example: Oracle Table (read/write), Mongo Collection (read/write)>|
| KAFKA.md | <Kafka relevant info, for example: Kafka topics (read/write),Consumer Group>|
| CURL.md | <examples of `curl` commands to use to test all the endpoints a service is publishing and listening on, for example: `curl -H "Authorization: $KEY" "${BASE_URL}/alphabetical-search/companies/q=lloyds`>|
<!-- markdownlint-enable MD013  -->

**Note:** A separate CURL.md should be provided even if there is no URL
available. This is to assist support to locate the checks quickly. In this case
the file should contain "This service doesn't have HTTP endpoints to interact
with, so this file is empty"
