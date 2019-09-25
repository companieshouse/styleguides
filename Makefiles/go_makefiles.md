Go Makefile Standards
==================

Targets
-------

**Mandatory targets**

The following targets must be included in all Go Makefiles:

Target            |Purpose
------------------|-------
`all`<sup>1</sup> |Calls methods required to build a locally runnable version, typically the build target
`deps`            |Pull the required dependencies
`fmt`             |Format the code
`test`            |Run all `test-*` targets (convenience method for developers)
`test-deps`       |Pull the required dependencies for tests
`test-unit`       |Run unit tests

The following targets are also mandatory for Go services:

Target            |Purpose
------------------|-------
`clean`           |Reset repo to pre-build state (i.e. a clean checkout state)
`build`           |Pull down any dependencies and compile code into an executable if required
`package`         |Create a single versioned deployable package (i.e. jar, zip, tar, etc.). May be dependent on the `build` target being run before `package`
`dist`            |Invoke the `clean`, `build` and `package` targets

<sup>1</sup> Should be the first/default target

**Optional targets**

The following targets should be included where appropriate:

Target             |Purpose
-------------------|-------
`test-integration` |Run integration tests
`xunit-tests`      |Run unit tests and format output for parsing as xunit (for golang repo jenkins integration)
`lint`             |Run lint checks

**Additional targets**

Makefiles can contain any additional targets you require, so long as your target
name does not collide with those listed above or with any of the
[GNU make standard targets](https://www.gnu.org/software/make/manual/make.html#Standard-Targets).

Examples
-------

**Go library**

```
tests := ./...

.PHONY: all
all: fmt test

.PHONY: fmt
fmt:
	  go fmt ./...

.PHONY: deps
deps:
	  go get ./...

.PHONY: test-deps
test-deps: deps
	  go get -t ./...

.PHONY: test
test: test-unit

.PHONY: test-unit
test-unit: test-deps
	  @set -a; go test $(tests) -run 'Unit'
```

**Go service**
Replace [repo name] with the name of the repo.

```
CHS_ENV_HOME ?= $(HOME)/.chs_env
TESTS        ?= ./...

bin          := [repo name]
chs_envs     := $(CHS_ENV_HOME)/global_env $(CHS_ENV_HOME)/[repo name]/env
source_env   := for chs_env in $(chs_envs); do test -f $$chs_env && . $$chs_env; done
xunit_output := test.xml
lint_output  := lint.txt

commit       := $(shell git rev-parse --short HEAD)
tag          := $(shell git tag -l 'v*-rc*' --points-at HEAD)
version      := $(shell if [[ -n "$(tag)" ]]; then echo $(tag) | sed 's/^v//'; else echo $(commit); fi)

.PHONY: all
all: build

.PHONY: fmt
fmt:
	go fmt ./...

.PHONY: deps
deps:
	go get ./...

.PHONY: build
build: deps fmt $(bin)

$(bin):
	go build -o ./$(bin)

.PHONY: test-deps
test-deps: deps
	go get -t ./...

.PHONY: test
test: test-unit test-integration

.PHONY: test-unit
test-unit: test-deps
	set -a; go test $(TESTS) -run 'Unit'

.PHONY: test-util
test-util:
	set -a; go test $(TESTS) -run 'Util'

.PHONY: test-integration
test-integration: test-deps
	$(source_env); go test $(TESTS) -run 'Integration'

.PHONY: clean
clean:
	rm -f ./$(bin) ./$(bin)-*.zip $(test_path) build.log

.PHONY: package
package:
	$(eval tmpdir := $(shell mktemp -d build-XXXXXXXXXX))
	cp ./$(bin) $(tmpdir)
	cp ./start.sh $(tmpdir)
	cd $(tmpdir) && zip -r ../$(bin)-$(version).zip $(bin) start.sh
	rm -rf $(tmpdir)

.PHONY: dist
dist: clean build package

.PHONY: unit-tests
xunit-tests: test-deps
	go get github.com/tebeka/go2xunit
	@set -a; $(test_unit_env); go test -v $(TESTS) -run 'Unit' | go2xunit -output $(xunit_output)

.PHONY: lint
lint:
	go get -u github.com/alecthomas/gometalinter
	gometalinter --install
	gometalinter ./... > $(lint_output); true
```
