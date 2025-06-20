# Java Coding Standards

This document outlines key practices for writing clean and efficient Java code.
It is based on the comprehensive [Google Java Style
guide](https://google.github.io/styleguide/javaguide.html), with some notable
exceptions.

## Source File Basics

- **File Name**: Matches the top-level class name (case-sensitive, with `.java`
extension).
- **Encoding**: UTF-8.
- **Special Characters**:
  - No tab characters for indentation.
  - Only ASCII space (0x20) for whitespace outside string literals.
  - Use escape sequences for special characters (`\n`, `\t`, etc.).
  - Unicode characters should be used where they enhance readability but not
for code logic.

## Source File Structure

1. License or copyright (if present)
2. Package statement (must be the first non-comment statement)
3. Import statements (no wildcards, sorted ASCII-betically, grouped by standard
library, third-party and project imports)
4. Exactly one top-level class per file
5. Blank lines separate logical sections

Example:

```java
package com.example.myproject;

import java.util.List;
import java.util.Set;

public class MyClass {
    // Fields, constructors, methods...
}
```

## Formatting

### Braces

- Always used for `if`, `else`, `for`, `do` and `while` statements, even for
single statements.
- Follow **Kernighan & Ritchie** style:
  - No line break before opening `{`
  - Line break after opening `{` and before closing `}`
  - No line break after `}` if followed by `else`
  - Empty blocks must use `{}` with no content inside, except for multi-block
statements

Example:

```java
if (condition) {
    doSomething();
} else {
    doSomethingElse();
}
```

### Indentation

- Code blocks should be indented by **+4 spaces per indentation level**.
- No tab characters; use spaces only.
- When line wrapping, the continuation lines should be indented by **+8**
**spaces**.
- **+4 spaces** also apply for indentation within a **switch statement.**

Example:

```java
switch (value) {
    case 1:
        doSomething();
        break;
    case 2:
        doSomethingElse();
        break;
    default:
        doSomeDefaultThing();
}
```

### Line Wrapping  

#### **Prime Directive**  

- **Prefer breaking at a higher syntactic level** for readability.  

#### **Breaking at Operators**  

- **Break before** non-assignment operators:  
  - Dot separator (`.`), method reference (`::`), ampersand in type bounds
(`<T extends Foo & Bar>`) and pipes in multi-catch (`catch (FooException |
BarException e)`).  

#### **Breaking at Assignment Operators**  

- **Break after** an assignment operator (`=`), though either way is
acceptable.  
  - Also applies to the **colon (`:`) in an enhanced for-loop** (`foreach`
statement).  

#### **Other Rules**  

- **Method and constructor names stay attached** to the opening `(`.  
- **Commas (` , `) stay attached** to the preceding token.  
- **Never break directly before or after `->` in a lambda**, except when the
body is a **single unbraced expression**.  

Examples:

```java
// Breaking before operator symbols
MyLambda<String, Long, Object> lambda =
        (String label, Long value, Object obj) -> {
            ...
        };

// Keeping method reference colons (::) together
someList.stream()
        .map(SomeClass::someMethod)
        .collect(Collectors.toList());

// Lambda with an unbraced body
Predicate<String> predicate = str ->
        longExpressionInvolving(str);
```

### Whitespace

- **One blank line**:
  - Between class members (fields, constructors, methods, etc.)
  - Between logical sections of code
- **Horizontal whitespace**:
  - Space before `{`
  - Space after commas, semicolons and type declarations
  - Space around binary and ternary operators
  - No trailing whitespace at the end of lines

## Naming Conventions

### General Rules

- **No Hungarian notation, prefixes, or suffixes** (`mName`, `s_name` are not
used).
- Names should be meaningful and clearly indicate purpose.

### Specific Identifiers

- **Packages**: lowercase, no underscores (`com.example.myproject`).
- **Classes/Interfaces**: `UpperCamelCase` (`MyClass`).
- **Methods/Variables**: `lowerCamelCase` (`calculateTotal`).
- **Constants** (`static final`): `UPPER_SNAKE_CASE` (`MAX_SIZE`).
- **Type Parameters**: Single capital letter or `ClassT` (`T`, `RequestT`).
- **Boolean variables** should be named to indicate a `true/false` value (e.g.,
`isReady`, `hasFinished`).

## Programming Practices

### Annotations

- **Always use** `@Override` when overriding methods.
- Class-level annotations go on separate lines.
- Method-level annotations can be inline if single.
- Multiple annotations should be stacked, one per line.

### Exception Handling

- **Do not ignore exceptions**.
- Use `// fall through` comment when intentional in `switch` cases.
- Include a `default` case in `switch`, except for exhaustive `enum` cases.
- Avoid catching generic `Exception` unless absolutely necessary.
- Prefer using specific exception types for clarity.

### Static Members

- **Access static members using class name**, not instance
(`ClassName.method()` instead of `instance.method()`).
- **Do not use `finalize()`**; it is deprecated.
- Static imports should be used sparingly to avoid reducing code clarity.

### Collections and Generics

- Prefer `ImmutableList`, `ImmutableSet` and `ImmutableMap` where applicable.
- Use generics to enforce type safety (`List<String>` instead of `List`).

## Javadoc

- Required for **public** classes and **public/protected** members.
- **Use concise summary fragments** (e.g., `/** Returns the customer ID. */`).
- **Block tags (`@param`, `@return`, `@throws`) follow a fixed order**.
- Methods should be documented unless they are self-explanatory (e.g.,
`getId()` on an entity class).
- Javadoc should not be used for private methods unless clarification is
needed.
- **Do not use the `@author` tag**; it is unnecessary and provides no advantage
over version control.

## Checkstyle

[Checkstyle README](https://github.com/companieshouse/java-checkstyle-config)

## CHIPS Specific Guidance

[CHIPS development](chips_development.md)
