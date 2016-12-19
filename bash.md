Shell (Bash) Coding Standards
=============================

The shell scripting language of choice is Bash.  Bash should be used for start scripts and simple wrappers, and can be used for basic command line utilities, but not anything more complicated than this.

For the most part, follow [Googles shell coding standards](https://google.github.io/styleguide/shell.xml) with the **exception of using four spaces** (not two as [specified in the standard](https://google.github.io/styleguide/shell.xml#Indentation)).

Determining the containing directory
------------------------------------

To get the containing directory of the script as done in all service start scripts use:
```
export APP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
```
NB: Using ${BASH_SOURCE[0]} instead of $0 is important as explained [here](http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/).
