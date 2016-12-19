README standards
================

There are a number of things that people immediately want/need to know when they look at a repo:
* What does it do?
* How do I build it?
* How do I run it?

This information should be available in the REAMDE, following the standard GFM (github flavoured markdown) template below.
Its worth noting that this is the basic information that needs to be available, but there will quite likely be more useful information that is required per repo so make sure you add that too.

General GFM style pointers
--------------------------

* Use code blocks where necessary
* If a section goes off the page, then link to it from the top of the page (see #mongo-requirement in the template below - by default section headings automatically become anchors with the lowercased wording of the title and spaces changed to dashes - so "Mongo Requirement" becomes #mongo-requirement)
* Use sub README's where required i.e. if the repo has a "scripts" directory then it should have an accompanying README to describe what the scripts do, how to use them, etc.
* Always link to sub README's from the main/top level README

Template
--------

```
Repo Title
==========

what is this "thing"?, what does it do?

Requirements
------------
what is required to be able to build/run this application
i.e.
- [Java](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Maven](https://maven.apache.org/download.cgi)
- [Git](https://git-scm.com/downloads)

Are there things that are required to be able to run the application correctly i.e. data in mongo db, environment variables, add links to the relevant section of the page:
  - [mongo example requirement 1](#mongo-requirement)

Getting started
---------------
how do you build and run this application, if there are multiple steps then use a numbered list to describe them

Mongo requirement
-----------------

Details of the example mongo requirement i.e. a certain collection needs to exist
```

Example
-------

> Penguin Producer
> ================
>
> A service to produce penguins to populate antarctica.
>
> Requirements
> ------------
>
> In order to build this service you need:
> * [Snow](https://en.wikipedia.org/wiki/Snow)
> * [Git](https://www.git-scm.com/downloads)
>
> In order to run this service you need:
> * [Instance of Antarctica](https://github.com/companieshouse/antarctica)
> * [Mongo DB](#setting-up-mongo-db)
>
> Getting started
> ---------------
>
> 1. [Configure your service](#configuration) if you wish to override any of the defaults
> 2. Run `make`
> 3. Run `./start.sh`
>
> Setting up Mongo DB
> -------------------
>
> 1. [Install Mongo DB](https://docs.mongodb.com/manual/administration/install-community/)
> 2. Run `./setupMongo.sh` to setup the collections
>
> Configuration
> -------------
>
> The default configuration can be overridden by either exporting the following enviornment variables
> at command line or within `~/.penguin`:
>
> Variable            | Default                 |Description
> --------------------|-------------------------|--------------
> ANTARCTICA_LOCATION |`http://south-pole:2222` |The location at which to find your instance of antarctica
> PENGUIN_TYPE        |`"Emperor"`              |The type of penguin to produce (e.g. `"Adélie"`, `"Emperor"`, `"Gentoo"`)
>
