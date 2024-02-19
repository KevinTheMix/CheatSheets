# Testing

## Glossary

* **Acceptance/Release Test** = Black-Box, Functional, Acceptance, Validation, Requirements Testing
* **Defect Rate/Density** = defect / KLOC (1000 lines of code)
* **Unit Test** = path, **structural**, whitebox, interface consistent, coverage analysis
* **Integration Test** = (interface), Integration tests, **regression**
* **Mock** = hi-jacks existing BL/DL methods and replaces their implementation to let them return arbitrary values instead (eg not make a real DB call)
  * [Mock out dependencies, not the actual classes under test](https://stackoverflow.com/a/2277068)
* **Software Inspection** =
* **Static Analysis** =
* **Stub** = static test case that always returns the same arbitrary values (eg implementing an object with methods containing a single `return` statement)
* **System Test** = Stress-testing, Black-Box, failure, behaviour, Functional, Non-functional
* **Validation** = ensures the system conforms to the customer's expectations (ie green light)
* **Verification** = checking the software conforms to specification & meets functional & non-functional requirements
