Go Coding Standards
===================

Go coding at Companies House follows:
* [effective go](https://golang.org/doc/effective_go.html)
* [GoCodeReviewComments](https://github.com/golang/go/wiki/CodeReviewComments)

Dev environments
----------------

* Go forces your directory structure under your GOPATH, don’t break that, but put your GOPATH wherever is convenient!
* We tend to use Atom, with go-plus: brings in gofmt, go imports, go vet, golint https://atom.io/packages/go-plus
* There is now a `Go` IDE by JetBrains that is an extension from IntelliJ, although it's in the early stages of development it is still a solid IDE for what we need. It also supports remote debugging. https://www.jetbrains.com/go/
* If you’re not using Atom, you should be running all of go-plus’ checks regularly.
* If using vim, the vim-go plugin is recommended.
* It’s a tricky one to have a policy for. It’s not realistic to say never commit code that golint or vet are complaining about, because sometimes they have false positives. But the majority of issues it flags up are important for maintaining code quality. Things like you MUST comment anything that is exported are very important to us.
* Some source on the joys of go-fmt https://blog.golang.org/go-fmt-your-code
* [golangci-lint](https://github.com/golangci/golangci-lint) is a useful tool for local linting.

Method names
------------

Use `VerbNoun` methods names (e.g. `ServeHttp`)

Struct field tags
-----------------

If you are applying multiple tags to a struct field, pad them out:
```
DateOfBirth       types.JSONDate      'bson:"date_of_birth,omitempty" json:"date_of_birth,omitempty"
Disqualifications []Disqualifications 'bson:"disqualifications"       json:"disqualifications"
```

Meaningful comments
-------------------

Try and avoid repeating the name OR the type of element in a comment:
```
Disqualification is a struct which contains a disqualifications = BAD
Disqualification provides metadata and details for a Disqualification document. = GOOD
```

Error handling
--------------

* Cardinal rule: never _ an error. The language lets you get away with it but it is not acceptable for production code.
* Use chs.go for error logging.
* Go-spew is useful (it's like Data::Dumper in perl) for debugging, but should never be committed.
* As a general rule of thumb function calls should be inlined with error checking in cases where only an error is captured. If for any reason the function call itself reads better as multiple lines e.g. struct being passed in as an argument, the inline error checking style shouldn't apply.

```
goodStuff, err := callAThing()
if err != nil {
	panic(err)
}
```
```
if err := thingReturnsAnError(); err != nil {
	panic(err)
}
```
```
if _, err := callDifferentThing(); err != nil {
	panic(err)
}
```

Testing
-------
* Use go convey 'import (. "github.com/smartystreets/goconvey/convey")'
* Unit test function names should be of the form: `TestUnit*` and integration test functions should be `TestIntegration*`
* Makefile should have a unit and integration test target

```
test-unit:
    go test $(TESTS) -run 'Unit' -coverprofile=coverage.out

test-integration:
    go test $(TESTS) -run 'Integration'
```
