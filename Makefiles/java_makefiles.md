# Java Makefile Standards

## Targets

### Mandatory targets

The following targets must be included in all repo Makefiles:

<!-- markdownlint-disable MD013 MD033 -->
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

### Optional targets

The following targets should be included where appropriate:

Target             |Purpose
-------------------|-------
`test-integration` |Run integration tests
`publish`          |Publish a library artefact to an artefact store (e.g. Artifactory)
<!-- markdownlint-enable MD013 MD033 -->

### Additional targets

Makefiles can contain any additional targets you require, so long as your target
name does not collide with those listed above or with any of the
[GNU make standard targets](https://www.gnu.org/software/make/manual/make.html#Standard-Targets).

## Example

Replace [repo name] with the name of the repo.

```makefile
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
