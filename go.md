# Go Coding Standards

This document outlines key practices for writing clean and efficient Go code. 

It is based on the [effective go guide](https://go.dev/doc/effective_go), with some notable exceptions.

## Formatting & Code Style

### Use `gofmt`
- Always format code using `gofmt` (or `go fmt` for package-level formatting).
- `gofmt` standardises indentation, alignment and spacing.
- Indentation uses **tabs**, not spaces.
- All Go code in the standard library is formatted using `gofmt`, so following this ensures consistency with the broader ecosystem.
- If integrating with CI/CD pipelines, configure automatic `gofmt` checks to enforce consistent formatting.

### Line Length & Parentheses
- No strict line length limit, but wrap long lines for readability.
- Avoid unnecessary parentheses in control structures (`if`, `for`, `switch`).
- Maintain logical breaks for readability and organization.
- Use vertical spacing (blank lines) to separate logical sections within functions.
- Keep function signatures compact and clear, using multiple lines if necessary for readability.

### Naming Conventions
- **Package names**: Use short, lowercase names (e.g., `encoding/json`).
- **Exported identifiers**: Use MixedCaps (e.g., `ServeHTTP`, `ReadFile`).
- **Interfaces**: Use `-er` suffix for single-method interfaces (e.g., `Reader`, `Writer`).
- **Method names**: Use `VerbNoun` format (e.g., `ServeHttp`).
- **Struct fields**: Use JSON-style tags and align them properly.
- Avoid abbreviations unless they are widely understood (e.g., `HTTP`, `ID`).
- Function names should be descriptive and avoid generic terms like `Handle` unless necessary.
- Constants should be in MixedCaps or UPPER_SNAKE_CASE if they are meant to be widely used.

```go
DateOfBirth       types.JSONDate      `bson:"date_of_birth,omitempty" json:"date_of_birth,omitempty"`
Disqualifications []Disqualification `bson:"disqualifications" json:"disqualifications"`
```

### Comments
- Use `//` for line comments; `/* */` only for package-level documentation.
- Avoid repeating type or name in comments.
- Document all exported functions, methods and structs.
- Use comments to explain why a piece of code exists, not just what it does.
- Keep comments concise but informative.
- Use `godoc`-friendly comments to generate documentation from your code.


## Development Environments

- Go forces your directory structure under your GOPATH. Do not modify this structure, but you can place your GOPATH wherever is convenient.
- Recommended tools:
  - **Atom** with `go-plus` for `gofmt`, `go imports`, `go vet` and `golint` (<https://atom.io/packages/go-plus>).
  - **JetBrains Go IDE** (part of IntelliJ, includes remote debugging) (<https://www.jetbrains.com/go/>).
  - **vim-go** plugin for Vim users.
- If not using Atom, ensure `golint`, `go vet` and similar tools run regularly.
- `golangci-lint` is useful for local linting (<https://github.com/golangci/golangci-lint>).
- Follow `gofmt` best practices (<https://blog.golang.org/go-fmt-your-code>).

## Structs & Methods

### Use Pointer Receivers When Needed
- Use pointers when modifying a struct or to avoid unnecessary copying.
- Use value receivers when the method does not modify the struct.
- Avoid using pointer receivers for small structs unless modification is needed.
- Use constructor functions for complex struct initialisation.

```go
type User struct {
    Name string
    Age  int
}

func NewUser(name string, age int) *User {
    return &User{Name: name, Age: age}
}
```

### Getters & Setters
- Do not prefix getters with `Get`.
- Avoid unnecessary setters unless mutation requires validation.
- Use consistent naming conventions for getters and setters.

```go
func (u User) Name() string {
    return u.name
}
```

## Control Structures

### `if` Statements
- Always use braces `{}`.
- Avoid unnecessary `else` if the `if` block returns.
- Keep `if` statements short and readable.
- Combine initialisation with `if` when appropriate.

```go
if err := doSomething(); err != nil {
    return err
}
```

### `for` Loops
- Use `for` instead of `while` (Go does not have `while`).
- Use `range` for iterating over arrays, slices, maps, or channels.
- Precompute values if they are used multiple times inside a loop.
- Avoid modifying slice/map contents while iterating over them.

```go
for key, value := range myMap {
    fmt.Println(key, value)
}
```

## Error Handling

### Never Ignore Errors
- Always handle errors; never use `_` to discard them.
- Return detailed errors with context.
- Logging errors should be meaningful and not just `fmt.Println(err)`.
- Errors should be wrapped with additional context when necessary.
- Prefer returning errors over logging inside functions unless debugging.

```go
if err := process(); err != nil {
    log.Fatalf("process failed: %v", err)
}
```

### Inline Error Handling
- Function calls that only return an error should use inline error checking. If for any reason the function call itself reads better as multiple lines (e.g. struct being passed in as an argument), the inline error checking style shouldn't apply.

```go
if err := thingReturnsAnError(); err != nil {
    panic(err)
}

if _, err := callDifferentThing(); err != nil {
    panic(err)
}
```

### Avoid Debugging Tools in Commits
- `go-spew` is useful for debugging but should never be committed.
- Use `chs.go` for error logging.


## Testing

### General Guidelines
- Use `go convey` for testing: `import (. "github.com/smartystreets/goconvey/convey")`.
- `go convey` provides a clean syntax for writing expressive tests and integrates with `go test`.
- Unit test function names should follow the format `TestUnit*`.
- Integration test function names should follow the format `TestIntegration*`.
- Tests should be structured with clear assertions and avoid excessive logic inside test functions.
- Use `convey` blocks to structure tests clearly.

```go
func TestUnitExample(t *testing.T) {
    convey.Convey("Given a simple addition function", t, func() {
        result := Add(2, 3)
        convey.So(result, convey.ShouldEqual, 5)
    })
}
```

### Running Tests with Makefile
- The Makefile should have separate targets for running unit and integration tests.
- These targets should use `go test` with appropriate filters.
- The `-coverprofile` flag should be used to track test coverage.

```makefile
test-unit:
    go test $(TESTS) -run 'Unit' -coverprofile=coverage.out

test-integration:
    go test $(TESTS) -run 'Integration'
```

## Concurrency

### Use Goroutines & Channels Safely
- Do not share memory by default; communicate via channels.
- Use `select` to handle multiple channels.
- Avoid race conditions by structuring concurrent code carefully.
- Use buffered channels when appropriate to avoid blocking.

```go
ch := make(chan int, 1)
go func() {
    ch <- 42
}()
value := <-ch
```

### Recover from Panics in Goroutines
- Use `recover` inside `defer` to prevent crashes.
- Log panic recoveries for debugging purposes.
- Ensure that panics do not silently fail without logging.

```go
defer func() {
    if r := recover(); r != nil {
        log.Println("Recovered from panic:", r)
    }
}()
```

### Synchronisation
- Use `sync.Mutex` or `sync.RWMutex` when protecting shared resources.
- Use `sync.WaitGroup` to coordinate goroutines.
- Consider `sync.Once` for initialisation code that should only run once.

```go
var mu sync.Mutex
var count int

func Increment() {
    mu.Lock()
    defer mu.Unlock()
    count++
}
```
