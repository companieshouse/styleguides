# Java Coding Standards

In the main java code should follow
[Google's Java coding standards](https://google.github.io/styleguide/javaguide.html)
with the **exceptions outlined below**.

## Indentation

Code blocks should be indented by **four spaces** rather than
[two as Google specifies](https://google.github.io/styleguide/javaguide.html#s4.2-block-indentation).
Note that four spaces also apply for
[indentation within a switch statement](https://google.github.io/styleguide/javaguide.html#s4.8.4.1-switch-indentation).

## Line length

The line length for wrapping should be 130 characters rather than 
[100 as Google specifies](https://google.github.io/styleguide/javaguide.html#s4.4-column-limit).

When line wrapping, the continuation lines should be indented by eight spaces rather than
[four as Google specifies](https://google.github.io/styleguide/javaguide.html#s4.5.2-line-wrapping-indent).

## Javadoc

In addition to the
[Google standards on javadoc](https://google.github.io/styleguide/javaguide.html#s7-javadoc)
**do not** use the `@author` tag as this is unwanted noise that provides no
advantage over version control history.

## Checkstyle

[Checkstyle README](https://github.com/companieshouse/java-checkstyle-config)

## CHIPS specific guidance

[CHIPS development](chips_development.md).
