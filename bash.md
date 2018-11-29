Shell (Bash) Coding Standards
=============================

The shell scripting language of choice is Bash.  Bash should be used for start scripts and simple wrappers, and can be used for basic command line utilities, but not anything more complicated than this.

For the most part, follow [Googles shell coding standards](https://google.github.io/styleguide/shell.xml) with the **exception of using four spaces** (not two as [specified in the standard](https://google.github.io/styleguide/shell.xml#Indentation)).

# Files

## Naming
The preferred option is to omit file extensions such as `.sh`

**Good**
```sh
my_script
```

**Bad**
```sh
my_script.sh
```

## Hash Bang
All scripts should start with a hash bang declaration and the absolute path to the interpreter. We do this to avoid path issues with the interpreter.

**Good**
```sh
#!/bin/bash

...
```

**Bad**
```sh
#!/usr/bin/env bash

...
```

# Functions

## Naming
The preferred option is to use snake case and omit the function keyword

**Good**
```sh
my_function {
    ...
}
```

**Bad**
```sh
function myFunction {
    ...
}
```

# Variables

## Scoping
In the context of functions always use the local modifier. This avoids accidental name collisions and the associated consequences.

**Good**
```sh
function my_function {
    local my_variable="blah"
}
```

**Bad**
```sh
function my_function {
    my_variable="blah"
}
```

## Initialisation
Due to variables being scoped to a function, no initialisation is required. So for instance statements such as the following are not required:

**Not required**
```sh
get_configuration() {
    # This initialisation is not required
    configuration=""

    for definition in $(find $PIPELINE_DEFINITIONS -type f -name $pipeline); do
        local configuration=$definition
    done

    # This can still be referenced despite being defined within the loop above
    echo $configuration
}
```

# Best Practice

## Invocation
Scripts should always be written in such a way that they can be called from any location. I.e. not just the current directory. For example the script below wouldn't work when invoked in anything other than the containing directory.

```sh
#!/bin/bash

# This assumes common is available within the invocation directory
source common

```

The best way to address this is to define a variable referencing the containing directory:

```sh
SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
```

Any includes or references should then be made relative to this directory:

```sh
#!/bin/bash

# This will now function independent of the invocation directory
source $SCRIPT_DIRECTORY/common
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
The preferred option for outputting new lines with echo is to use the `-e` option combined with the `\n` escape sequence. This is more concise than empty `echo` calls.

**Good**
```sh
echo -e 'Comment\n'
```

**Bad**
```sh
echo 'Comment'
echo
```
