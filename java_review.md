Java code review guide
=======================
Developer actions prior to code commit/review started
------------------------------------------------------

* My code base has been synchronized prior to running tests
* My code compiles
* My code has been developer-tested and includes unit tests
* My code includes javadoc where appropriate
* My code is tidy (indentation, line length, no commented-out code, no spelling mistakes, etc)
* I have considered proper use of exceptions
* I have made appropriate use of logging
* I have eliminated unused imports
* I have eliminated warnings from my IDE
* I have considered possible NPEs
* I have formatted any new code before committing (if you are committing a new class the entire class should be formatted)
* The code follows the Coding Standards
* Are there any leftover stubs or test routines in the code?
* Are there any hardcoded, development only things still in the code?
* Are there any TODO comments left in the code?
* Was performance considered?
* Was security considered?
* Does the code release resources? (HTTP connections, DB connection, files, etc)
* Corner cases well documented or any workaround for a known limitation of the frameworks
* Can any code be replaced by calls to external reusable components or library functions?
* Thread safety and possible deadlocks
* Commit to source control with standard message
 
Code Review Severity
1. Naming Conventions and Coding style = Low
2. Control Structures and Logical issues = Medium or High
3. Redundant Code = High
4. Performance Issues =High
5. Security Issues = High
6. Scalability Issues= High
7. Functional Issues =High
8. Error Handling = High
9. Reusability = Medium
 
Code Review Checklist
----------------------
__General__

* All methods are commented in clear language. If it is unclear to the reader, it is unclear to the user. Comments are neither too numerous nor verbose
* Method names are simple and self explanatory
* All class, variable, and method modifiers should be examined for correctness.
* Class and method sizes are acceptable 
* Describe behavior for known input corner-cases.
* Complex algorithms should be explained with references. For example, document the reference that identifies the equation, formula, or pattern. In all cases, examine the algorithm and determine if it can be simplified.
* Confirm that the code does not depend on a bug in an external framework which may be fixed later, and result in an error condition.
* Units of measurement are documented for numeric values.
* Error and debug logging is consistent with framework in use or if new application consistent with established applications.
* JSPs do not contain business logic
* Repetitive code has been factored out – best effort at clean up of modified code but as a minimum ensure it’s not introduced
* The functionality fits the current design/architecture
* Frameworks have been used appropriately – methods have all been defined appropriately
* The code complies with coding standards
* Avoid changing the contents of Objects that are not passed back through the method call, unless there is a good reason for doing so.

__Testing__

* Unit tests are added for each code path, and behavior. 
* Unit tests must cover error conditions and invalid parameter cases.
* Unit tests for standard algorithms should be examined against the standard for expected results.
* Check for possible null pointers are always checked before use.
* Array indices are always checked to avoid ArrayIndexOfBounds exceptions.
* Do not write a new algorithm for code that is already implemented in an existing public framework API, and tested.
* Ensure that the code fixes the issue, or implements the requirement, and that the unit test confirms it. If the unit test confirms a fix for issue, add the issue number to the documentation.
* Error Handling
* Invalid parameter values are handled properly early in methods (Fast Fail).
* NullPointerException conditions from method invocations are checked.
* Consider using a general error handler to handle known error conditions.
* An Error handler must clean up state and resources no matter where an error occurs.
* Avoid using RuntimeException, or sub-classes to avoid making code changes to implement correct error handling.
* Define and create custom Exception sub-classes to match your specific exception conditions. Document the exception in detail with example conditions so the developer understands the conditions for the exception.
(JDK 7+) Use try-with-resources. (JDK < 7) check to make sure resources are closed.
* Don't pass the buck! Don't create classes which throw Exception rather than dealing with exception condition.
* Don't swallow exceptions! For example catch (Exception ignored) {}. It should at least log the exception.
* Don’t return null

__Thread Safety__

* Global (static) variables are protected by locks, or locking sub-routines.
* Objects accessed by multiple threads are accessed only through a lock, or synchronized methods.
* Locks must be acquired and released in the right order to prevent deadlocks, even in error handling code.

__Performance__
* Objects are duplicated only when necessary. If you must duplicate objects, consider implementing Clone and decide if deep cloning is necessary.
* No busy-wait loops instead of proper thread synchronization methods. For example, avoid while(true){ ... sleep(10);...}
* Avoid large objects in memory, or using String to hold large documents which should be handled with better tools. For example, don't read a large XML document into a String, or DOM.
* Do not leave debugging code in production code.
* Avoid System.out.println(); statements in code
* "Optimization that makes code harder to read should only be implemented if a profiler or other tool has indicated that the routine stands to gain from optimization. These kinds of optimizations should be well documented and code that performs the same task should be preserved." - UNKNOWN.