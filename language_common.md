# Standards common to coding in any language

## Using named constants for for fixed values

### Avoid using 'magic' numbers

Having numbers in code without an indication of what they mean can be unhelpful
when reading the code when a change is needed. The preferred solution is to
create constants with descriptive names for the numbers.

[Magic numbers in programming](https://en.wikipedia.org/wiki/Magic_number_(programming))

### Generally

The guidance on using constants with descriptive names applies more generally
to fixed values of other data types. It makes the code easier to read. It is
also helpful if the value represented by the constant changes. Searching for a
value to replace can lead to false matches and risks changing values that
should not change.

If there is only a limited set of allowed values, you should consider using an
enum instead if your language supports it.
