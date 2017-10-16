Perl Coding Standards
=====================

In the main, we are striving to follow the conventions laid down in Perl Best Practices (ISBN: 978-0-596-00173-5) unless otherwise noted.

On this page we note those exceptions and highlight any areas where the Perl Best Practices rules differ from what you might be used to in Companies House code.

Documentation
-------------

Documentation is written in [perlpod](http://perldoc.perl.org/perlpod.html) with some convention tweaks.

Please refer to these [guidelines on writing documentation (pod)](perlpod.md) in your code.

Naming Conventions
------------------

Thing                |Convention                                    |Examples
---------------------|----------------------------------------------|----------
Methods / functions  |snake_case                                    |`buy_cats()`, `to_string()`
Variables            |snake_case                                    |`$her_name`, `%shopping_list`, `@team_sheet`
Booleans             |snake_case with prefix (e.g. is_, can_, has_) |`$is_ready`, `$can_file`, `$has_multiple_entries`
Classes and packages |Pascal Case                                   |`Animal::Mammal::ScaryLion`

Control Structures
------------------

Avoid 'unless".

In most cases, avoid unless except where it would aid the readability of the code.
```
unless $something_is_true;
#is more readable than
if !something_is_true
```
Don't use when evaluating more than one piece of logic (e.g. `unless $something || !$something_else`)

Structure
---------

### Spaces over Tabs

Don't use tabs. Use 4 spaces for indentation. You can set your IDE to insert 4 spaces when hitting tab if this makes it simpler. 

### Methods

Open on the curly braces on the same line as the method declaration and close vertically in line the sub.
```
sub my_method {
	#... some code in here
}
```

### Separators

Subs should be separated by dashed lines (hash, space, 78xdash)
```
# ------------------------------------------------------------------------------
```
Use `=` instead of `-` between main sections.

Here's a vi key sequence for this → `(i)#(space)(esc)78(a)-(esc)` (easier than it looks :P)
