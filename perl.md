# Perl Coding Standards

## Introduction

This document establishes the Perl coding standards for Companies House,
based on *Perl Best Practices* (ISBN: 978-0-596-00173-5) by Damian Conway.
Following these guidelines ensures consistency, maintainability and
readability across all Perl projects. This guide will also cover best
practices for documentation, debugging and performance optimisation to
create high-quality, maintainable Perl applications.

---

## General Guidelines

- Always include `use strict;` and `use warnings;`
- Prefer readability and maintainability over cleverness.
- Use meaningful variable and function names that convey intent.
- Keep functions short and focused on a single task.
- Document code using POD and inline comments where necessary.
- Write modular, reusable code to reduce duplication.
- Adhere to a **single responsibility principle** (SRP) for each function or
  module.
- Avoid using global variables unless absolutely necessary.
- Use version control effectively; commit meaningful changes with
  descriptive messages.

---

## Code Layout & Formatting

### Indentation & Spacing

- Use **4 spaces per indentation level** (no tabs).
- Keep line length **under 80 characters** for better readability.
- Use **one space** after commas and semicolons.
- Place `{` on the same line as the control structure.
- Always use **blank lines** to separate logical blocks of code.
- Align assignment operators for better visual clarity.
- Avoid trailing whitespace.

```perl
sub process_data {
    my ($input) = @_;
    if ($input) {
        return $input * 2;
    }
    return;
}
```

---

## Naming Conventions

### Variables

- Use **snake_case** for variable names.
- Use `$CamelCase` only for global variables.
- Use `ALL_CAPS` for constants.
- Prefix boolean variables with `is_`, `has_`, or `can_` (e.g., `is_ready`,
  `has_value`).
- Avoid single-letter variable names except in loop counters.

### Methods & Functions

- Use `snake_case` for function names.
- Function names should be **verbs or verb phrases** (e.g.,
  `calculate_total`).
- Avoid long function names; keep them under **30 characters**.
- Prefer descriptive function names over abbreviations.

### Classes & Packages

- Use `PascalCase` for module names (e.g., `DataProcessor`).
- The package name should match the filename.
- Namespace modules logically (e.g., `MyCompany::Utilities::Logger`).

---

## Control Structures

- Avoid `unless` in most cases for readability.
- Use `unless` only when it improves clarity over `if`.
- Do **not** use `unless` when evaluating multiple conditions (e.g.,
  `unless $x || !$y`).

```perl
unless ($something_is_true) {
    # preferred over if (!something_is_true)
}
```

---

## Code Structure

### Use Lexical Variables

- Always use `my` instead of `our` unless necessary.
- Use `state` variables only where persistent state is needed.
- Declare variables in the smallest possible scope.
- Initialise variables at the time of declaration whenever possible.

```perl
sub counter {
    state $count = 0;
    return ++$count;
}
```

### Methods

- Open curly braces `{` on the **same line** as the method declaration.
- Close braces `}` should be aligned vertically with the function
  definition.

```perl
sub my_method {
    #... some code in here
}
```

### Separators

- Use dashed lines (`# ------------------------------------------------------------------------------`)
  to separate functions.

```perl
# ------------------------------------------------------------------------------
```

---

## Documentation

- Documentation should be written in [perlpod](http://perldoc.perl.org/perlpod.html).
- Follow the internal [POD documentation guidelines](https://github.com/companieshouse/styleguides/blob/249a913f1a917f6968a6d431239edb73b784c484/perlpod.md).

---

## Error Handling

- Use `die` or `croak` for fatal errors.
- Use `warn` for recoverable issues.
- Always check the return values of system calls.
- Prefer `eval {}` for exception handling over `eval ""`.
- Log error messages using `Log::Log4perl` or similar frameworks.

```perl
use Carp;
open my $fh, '<', 'file.txt' or croak "Cannot open file: $!";
```

---

## Regular Expressions

- Use `/x` flag for readability.
- Comment complex regex patterns.
- Use non-capturing groups when capturing is unnecessary.
- Avoid unnecessary backtracking by using efficient regex patterns.

```perl
my $pattern = qr/   # Start of regex
    ^               # Beginning of line
    \d{4}           # Four digits
    -               # Hyphen
    \d{2}           # Two digits
    $               # End of line
/x;
```

---

## Object-Oriented Perl

- Use `Moose` or `Moo` for object-oriented development.
- Use accessor methods instead of direct hash access.
- Prefer roles over inheritance where possible.
- Always define a destructor if resource cleanup is necessary.
- Use method chaining where appropriate.

```perl
use Moose;

has 'name' => (is => 'rw', isa => 'Str');
```

---

## Testing

- Use `Test::More` for writing tests.
- Every module should have a corresponding test file.
- Ensure test coverage for all public methods.
- Use `prove` to run test suites efficiently.
- Automate testing in CI/CD pipelines.

```perl
use Test::More;
ok(1, 'Basic test');
done_testing();
```

---

## Security

- Never use `system()` with unchecked input.
- Sanitise all external input using `taint` mode (`-T`).
- Avoid symbolic references.
- Use three-argument `open()` calls.
- Avoid using string `eval` when executing user input.
- Restrict file permissions appropriately.
- Regularly update Perl modules to prevent vulnerabilities.

---

## Debugging & Logging

- Use `use diagnostics;` for detailed error messages.
- Employ `Data::Dumper` for inspecting complex data structures.
- Use logging frameworks like `Log::Log4perl` instead of printing to STDOUT.
- Leverage `perl -d` debugger for step-by-step execution analysis.

---

## Performance Optimisation

- Use `Benchmark` module to measure execution time of code blocks.
- Avoid excessive nested loops; refactor using efficient algorithms.
- Use hashes instead of arrays for frequent lookups.
- Precompile regex patterns when used repeatedly.
- Reduce memory footprint by undefining large variables when no longer
  needed.

---

## Staying Consistent

Following this style guide will result in cleaner, more maintainable Perl
code. Consistency is key and deviations should be justified with good
reasons.
