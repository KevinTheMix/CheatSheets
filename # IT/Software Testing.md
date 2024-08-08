# Software Testing

## Glossary

* **Behavior-driven development** (BDD) = naming tests using domain language (DSL) & natural-language constructs (ie English) to describe code behavior
* **Defect Rate/Density** = defect / KLOC (1000 lines of code)
* **Mock** = hi-jacks existing BL/DL methods and replaces their implementation to let them return arbitrary values instead (eg not make a real DB call)
  * [Mock out dependencies, not the actual classes under test](https://stackoverflow.com/a/2277068)
* **Software Inspection** = peer review/defect hunt using a well defined process
  * Advantages:
    1. Errors can mask other Errors => a simple inspection discovers many possibly nested errors
    2. Incomplete versions of a system can be inspected w/o additional costs (code does not even have to run)
    3. Consider broader quality attributes (compliance with standards, portability, maintainability, inefficiencies), inappropriate algorithms, poor programming style
* **Static Analysis** = testing/debugging by examining the source code without having to execute the program
* **Stub** = static test case that always returns the same arbitrary values (eg implementing an object with methods containing a single `return` statement)
* **Verification & Validation** (V&V, aka **Testing**)
  * Demonstrates to developer & customer Software meets its requirements (at least 1 test / 1 requirement)
  * Attempts to discover faults or defects int the software (incorrect, indesirable, not conform to spec)
  * **Validation** = ensures the system conforms to the customer's expectations including emergent properties (ie green light), ie are we building the right product?
  * **Verification** = checking the software conforms to specification & meets functional & non-functional requirements, ie are we building the product right?
* Types of tests
  * **Unit** = does a unit of code work as intended (path, **structural**, whitebox, interface consistent, coverage analysis)
  * **Acceptance/Release** = does a codebase conform to its specification (blackbox, Functional, Acceptance, Validation, Requirements Testing)
  * **Integration** = are multiple parts of a system working well together (interface, Integration tests, **regression**)
  * **System** (end-to-end) = does complete system work (Stress-testing, Black-Box, failure, behaviour, Functional, Non-functional)
* Types of errors
  * **Defect** (aka **Bug**) = deviation from expected behavior due to flaws in code or design (related to Validation)
  * **Error** (aka **Mistake**) = coder mistake, ie code logic does not follow specification due to misunderstanding or oversight
  * **Failure** = accumulation of defects leading to information loss
  * **Fault** = unintended behavior by a program, ie a usecase that wasn't forethought, potentially leading to a failure

## Tools

* **Robot framework** = Python-based generic test automation framework for acceptance testing & test-driven development, a keyword-driven testing framework using tabular test data syntax
  * [RIDE](https://github.com/robotframework/RIDE) = Robot Framework IDE (edit _.robot_ files)
