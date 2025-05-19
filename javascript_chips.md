# JavaScript (Chips) Coding Standards

## Formatting and Indentation

- **Indentation**: Use **four spaces** per indentation level instead of two. This ensures that code remains readable across different environments and prevents inconsistencies due to tab characters.
- **Switch Statements**: Indentation within a `switch` statement follows the four-space rule, meaning that each `case` label is indented accordingly, making it easier to scan through switch statements.
- **Line Wrapping**: When breaking long lines, continuation lines should be **indented by eight spaces** instead of four. This applies to function arguments, chained method calls and object properties that span multiple lines.
- **Curly Braces**: Use mandatory curly braces `{}` for `if`, `for` and `while` statements, even if the block contains a single statement. This improves clarity and prevents issues arising from implicit scoping.
- **Semicolons**: Terminate every statement with a semicolon (`;`), even though JavaScript allows omitting them. This helps avoid potential pitfalls related to automatic semicolon insertion (ASI) that can cause unintended errors.
- **Whitespace**: Use spaces around operators, after commas and before curly braces to enhance readability.

## Naming Conventions

Consistent naming conventions improve code clarity and make it easier to understand the purpose of variables, functions and classes.

- **File Names**: JavaScript files should start with a lowercase letter and indicate the functionality they provide. For example:
  - `table.js` - contains the classes `Table` and `Row`
  - `query-handling.js` - contains functionality specific to query handling.
- **Variables and Methods**: Use `lowerCamelCase`. This applies to function names, object properties and local variables (e.g., `calculateTotal`, `userInfo`).
- **Classes**: Use `UpperCamelCase`. Class names should be nouns or noun phrases (e.g., `UserAccount`, `PaymentProcessor`).
- **Constants**: Use `UPPER_SNAKE_CASE` for immutable values (e.g., `const MAX_SIZE = 100;`).
- **Booleans**: Use prefixes like `is`, `has`, or `should` for boolean variables (e.g., `isActive`, `hasPermission`).

## Object and Prototype Methods

- **Simulate Instance Methods**: Assign methods to the object's prototype:

```js
Table.prototype.moveToRow = function(offset) { ... };
```

- **Simulate Static Methods and Variables**: Assign them to the constructor function:

```js
Table.findRelativeRow = function(row) { ... };
Calendar.MONTH_MODE = 1;   
Calendar.YEAR_MODE = 2;
```

- **Always Specify the Containing Object for Static Methods**:

```js
if (Calendar.MONTH_MODE == 1) { ... }
```

## Documentation

Writing clear and concise documentation ensures that other developers can quickly understand the intent and usage of your code.

- Follow Javadoc-style comments for documentation to maintain consistency.
- Use `/** ... */` for multi-line documentation comments.
- Use `//` for inline or short comments.
- Every function should include proper documentation explaining its purpose and parameters.

Example:

```js
/**
 * Calculates the area of a rectangle.
 * @param {number} width - The width of the rectangle.
 * @param {number} height - The height of the rectangle.
 * @returns {number} The calculated area.
 */
function calculateArea(width, height) {
    return width * height;
}
```

## Code Structure

- **One Statement per Line**: Each statement must be on its own line.
- **Column Limit**: Keep lines within **100 characters**.
- **Blank Lines**:
  - Separate logical sections with a blank line.
  - Place blank lines between class members.
- **File Structure**: Organise files into meaningful directories and use clear file names.
- **Imports**: Order imports logically.

## Global Scope and Variables

- **Minimise Global Methods and Objects**: To avoid name clashes, minimise global variables and instead create classes or object literals:

```js
function StringUtil() { ... }
StringUtil.CHIPS_DATA_FORMAT = "dd/mm/yy";
StringUtil.formatDate = function(date) { ... };
```

Alternatively:

```js
const StringUtil = {
    CHIPS_DATE_FORMAT: "dd/mm/yy",
    formatDate: function(date) { ... }
};
```

or

```js
const QueryHandling = {
    REJECTED_IMAGE: "images/qha/rejected.png",
    ACCEPTED_IMAGE: "images/qha/accepted.png", 
    ERROR_FLAG_IMAGE: "images/qha/error_flag.png",
    parseFieldId: function(id) { ... }
};
```

- **Avoid Creating Global Variables Inside Methods**:

```js
for (var i = 0; i < len; i++) { ... }
```

Using `var` ensures `i` remains local to the loop.

## Linking Event Handlers

- **Preserve Previous Event Handlers When Overriding Events**:

```js
const myPage = {
    oldHandleBodyLoad: page.handleBodyLoad,
    handleBodyLoad: function(event) {
        if (oldHandleBodyLoad) {
            oldHandleBodyLoad(event);
        }
        // Page-specific logic
    }
};
page.handleBodyLoad = myPage.handleBodyLoad;
```

## Other Best Practices

- **No Implicit Type Conversions**: Avoid `==`, use `===` and `!==`.
- **Use `const` and `let` Instead of `var`**.
- **Use Template Literals**: Prefer backticks (````) over string concatenation.
- **Avoid Deep Nesting**: Keep functions and conditionals shallow.
- **Use Meaningful Variable Names**.
- **Handle Errors Properly**: Use `try...catch` where necessary.
- **Optimise Performance**: Minimise unnecessary computations.
- **Consistent Code Reviews**.
