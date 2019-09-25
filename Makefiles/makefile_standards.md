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
