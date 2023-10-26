# Go Makefile Standards

## Targets

### Mandatory targets

The following targets must be included in all Go Makefiles:

<!-- markdownlint-disable MD013 MD033 -->
Target            |Purpose
------------------|-------
`all`<sup>1</sup> |Calls methods required to build a locally runnable version, typically the build target
`fmt`             |Format the code
`test`            |Run all `test-*` targets (convenience method for developers)
`test-unit`       |Run unit tests

The following targets are also mandatory for Go services:

Target            |Purpose
------------------|-------
`clean`           |Clean up unused dependencies from module and Resets repo to pre-build state (i.e. a clean checkout state)
`build`           |Pull down any dependencies and compile code into an executable if required
`package`         |Create a single versioned deployable package (i.e. jar, zip, tar, etc.). May be dependent on the `build` target being run before `package`
`dist`            |Invoke the `clean`, `build` and `package` targets

<sup>1</sup> Should be the first/default target

### Optional targets

The following targets should be included where appropriate:

Target             |Purpose
-------------------|-------
`test-integration` |Run integration tests
`xunit-tests`      |Run unit tests and format output for parsing as xunit (for golang repo jenkins integration)
<!-- markdownlint-enable MD013 MD033 -->

### Additional targets

Makefiles can contain any additional targets you require, so long as your target
name does not collide with those listed above or with any of the
[GNU make standard targets](https://www.gnu.org/software/make/manual/make.html#Standard-Targets).

## Examples

### Go library

<!-- markdownlint-disable MD013 -->
```makefile
TESTS ?= ./...

.EXPORT_ALL_VARIABLES:
GO111MODULE = on

.PHONY: all
all: fmt test

.PHONY: fmt
fmt:
	  go fmt ./...

.PHONY: test
test: test-unit

.PHONY: test-unit
test-unit:
	  go test $(TESTS) -run 'Unit' -coverprofile=coverage.out

.PHONY: test-verify
test-verify: SHELL:=/bin/bash
test-verify:
	@invalid_tests=( $$(go test ./... -list=. | grep ^Test | grep -v "Unit" | grep -v "Integration") ); \
    if [[ -n "$$invalid_tests" ]]; then \
        echo "Fail: Tests must include 'Unit' or 'Integration' in the name:"; \
        for test_name in $${invalid_tests[@]}; do \
            echo " $${test_name}"; \
        done; \
        false; \
    else \
        echo "All tests are valid"; \
    fi
```

### Go service

Replace [repo name] with the name of the repo.

```makefile
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

.EXPORT_ALL_VARIABLES:
GO111MODULE = on

.PHONY: all
all: build

.PHONY: fmt
fmt:
	go fmt ./...

.PHONY: build
build: fmt $(bin)

$(bin):
	go build

.PHONY: test
test: test-unit test-integration

.PHONY: test-unit
test-unit:
	go test $(TESTS) -run 'Unit' -coverprofile=coverage.out

.PHONY: test-integration
test-integration:
	$(source_env); go test $(TESTS) -run 'Integration'

.PHONY: test-verify
test-verify: SHELL:=/bin/bash
test-verify:
	@invalid_tests=( $$(go test ./... -list=. | grep ^Test | grep -v "Unit" | grep -v "Integration") ); \
    if [[ -n "$$invalid_tests" ]]; then \
        echo "Fail: Tests must include 'Unit' or 'Integration' in the name:"; \
        for test_name in $${invalid_tests[@]}; do \
            echo " $${test_name}"; \
        done; \
        false; \
    else \
        echo "All tests are valid"; \
    fi

.PHONY: clean
clean:
	go mod tidy
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

.PHONY: xunit-tests
xunit-tests:
	go get github.com/tebeka/go2xunit
	@set -a; $(test_unit_env); go test -v $(TESTS) -run 'Unit' | go2xunit -output $(xunit_output)
```
<!-- markdownlint-enable MD013 -->
