Makefile Standards
==================

Every releasable repo—including libraries, services and tools—**must** have a
makefile for building, testing, versioning and packaging the repo.  Since we
have a range of technologies and build tools, our CI tools need a standard
interface to build and test our code.  The makefile was selected to be a common
abstraction over the underlying build tools.

All makefiles in the repo should be named `Makefile` and be in the root of the
repo.

Structure
---------

The makefile should be structured in three sections separated by an empty line:

1. [Environment variables](#environment-variables)
2. [Internal variables](#internal-variables)
3. [Targets](#targets)

Environment variables
---------------------

Environment variables are options that can be overridden from the command line.
These should be in UPPER_SNAKE_CASE and should be declared at the top of the file
using the conditional assignment (`?=`) to specify the default value to use if the
variable is not set.

For example:
```
OVERRIDABLE_VARIABLE ?= default
```

If an environment variable is required the makefile should output an error message:
```
ifndef ORACLE_HOME
$(error ORACLE_HOME environment variable is not defined)
endif
```
NB: Note that the error line is **not** tab indented.

Internal variables
------------------

Internal variables are any variables that are used internally and can not be
overridden from the command line.  These should be in lower_snake_case and should
be declared at the top of the file below the [environment variables](#environment-variables)
using the immediate assignment (`:=`).

For example:
```
internal_variable  := foo
internal_evaluated := $(shell if [[ -n $(foo) ]]; then echo bar; else har; fi)
```

Targets
-------

In keeping with makefile functionality targets that generate a particular file
should be named after the file, otherwise they should be lower_snake_case.

**Mandatory targets**

The following targets must be included in all repo Makefiles:

Target            |Purpose
------------------|-------
`all`<sup>1</sup> |Calls methods required to build a locally runnable version, typically the build target
`clean`           |Reset repo to pre-build state (i.e. a clean checkout state)
`build`           |Pull down any dependencies and compile code into an executable if required
`test`            |Run all `test-*` targets (convenience method for developers)
`test-unit`       |Run unit tests
`package`         |Create a single versioned deployable package (i.e. jar, zip, tar, etc.). May be dependent on the `build` target being run before `package`
`dist`            |Invoke the `clean`, `build` and `package` targets

<sup>1</sup> Should be the first/default target

**Optional targets**

The following targets should be included where appropriate:

Target             |Purpose
-------------------|-------
`test-integration` |Run integration tests
`publish`          |Publish a library artefact to an artefact store (e.g. Artifactory)
`xunit-tests`      |Run unit tests and format output for parsing as xunit (for golang repo jenkins integration)
`lint`             |Run lint checks

**Additional targets**

Makefiles can contain any additional targets you require, so long as your target
name does not collide with those listed above or with any of the
[GNU make standard targets](https://www.gnu.org/software/make/manual/make.html#Standard-Targets).

**PHONY targets**

Targets that do not create a file of the same name as the target are known as
phony targets.  These targets should be specified as `.PHONY` in order save make
having to check if the file exists, and also to ensure that if a file or
directory of that name is ever created the target will still run.

Phony targets should be marked as `.PHONY` on the line above the target declaration:
```
.PHONY: dist
dist: clean build package
```

Example
-------
Replace [repo name] with the name of the repo.

```
artifact_name := [repo name]

.PHONY: all
all: build

.PHONY: clean
clean:
	mvn clean
	rm -f ./$(artifact_name).jar
	rm -f ./$(artifact_name)-*.zip
	rm -rf ./build-*
	rm -f ./build.log

.PHONY: build
build:
	mvn compile

.PHONY: test
test: clean
	mvn verify

.PHONY: test-unit
test-unit: clean
	mvn test


.PHONY: dev
dev: clean
	mvn package -DskipTests=true
	cp target/$(artifact_name)-unversioned.jar $(artifact_name).jar

.PHONY: package
package:
ifndef version
	$(error No version given. Aborting)
endif
	$(info Packaging version: $(version))
	mvn versions:set -DnewVersion=$(version) -DgenerateBackupPoms=false
	mvn package -DskipTests=true
	$(eval tmpdir:=$(shell mktemp -d build-XXXXXXXXXX))
	cp ./start.sh $(tmpdir)
	cp ./routes.yaml $(tmpdir)
	cp ./target/$(artifact_name)-$(version).jar $(tmpdir)/$(artifact_name).jar
	cd $(tmpdir); zip -r ../$(artifact_name)-$(version).zip *
	rm -rf $(tmpdir)

.PHONY: dist
dist: clean build package


.PHONY: sonar
sonar:
	mvn sonar:sonar

.PHONY: sonar-pr-analysis
sonar-pr-analysis:
	mvn sonar:sonar	-P sonar-pr-analysis
```
