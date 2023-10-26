# Shell (Bash) Coding Standards

The shell scripting language of choice is Bash.  Bash should be used for start
scripts and simple wrappers, and can be used for basic command line utilities,
but not anything more complicated than this.

For the most part, follow
[Googles shell coding standards](https://google.github.io/styleguide/shell.xml)
with the **exception of using four spaces** (not two as
[specified in the standard](https://google.github.io/styleguide/shell.xml#Indentation)).

## Files

### Naming

The preferred option is to omit file extensions such as `.sh`

A **good** example:

```sh
my_script
```

A **bad** example:

```sh
my_script.sh
```

### Hash Bang

All scripts should start with a hash bang declaration and the absolute path to
the interpreter. We do this to avoid path issues with the interpreter.

A **good** example:

```sh
#!/bin/bash

...
```

A **bad** example:

```sh
#!/usr/bin/env bash

...
```

## Functions

### Function names

The preferred option is to use snake case and omit the function keyword

A **good** function declaration:

```sh
my_function () {
    ...
}
```

A **bad** function declaration:

```sh
function myFunction {
    ...
}
```

## Variables

### Scoping

In the context of functions always use the local modifier. This avoids
accidental name collisions and the associated consequences.

A **good** example of scoping:

```sh
my_function () {
    local my_variable="blah"
}
```

A **bad** example of scoping:

```sh
my_function () {
    my_variable="blah"
}
```

### Initialisation

Due to variables being scoped to a function, no initialisation is required. So
for instance statements such as the following are **not required**:

<!-- markdownlint-disable MD013 -->
```sh
get_configuration () {
    # This initialisation is not required
    configuration=""

    for definition in $(find ${PIPELINE_DEFINITIONS} -type f -name ${pipeline}); do
        local configuration=${definition}
    done

    # This can still be referenced despite being defined within the loop above
    echo ${configuration}
}
```
<!-- markdownlint-enable MD013 -->

## Best Practice

### Invocation

Scripts should always be written in such a way that they can be called from any
location. I.e. not just the current directory. For example the script below
wouldn't work when invoked in anything other than the containing directory.

```sh
#!/bin/bash

# This assumes common is available within the invocation directory
source common

```

The best way to address this is to define a variable referencing the containing
directory:

```sh
SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
```

Any includes or references should then be made relative to this directory:

```sh
#!/bin/bash

# This will now function independent of the invocation directory
source ${SCRIPT_DIRECTORY}/common
```

## Builtins

The preferred option is to use `set -e` to ensure script exit upon error

```sh
#!/bin/bash

set -e

# The script will exit at this point without us having to check any status code
cat /non-existing-file

...
```

## New Lines

The preferred option for outputting new lines with echo is to use the `-e`
option combined with the `\n` escape sequence. This is more concise than empty
`echo` calls.

A **good** example of using echo

```sh
echo -e 'Comment\n'
```

A **bad** example of using echo

```sh
echo 'Comment'
echo
```
