# Software Testing

## Quick Tips

* In multiple unit tests, instead of recreating an object and having to set all their properties, have a general centralized setup method to create a valid object (eg `ValidCustomer()`), then override specific properties we want to test as needed
  * Actually, most testing frameworks (ie xUnit) instantiate classes each time for each test, so just initialize a local variable (eg `_customer`) in constructor

## Glossary

* **Behavior-driven development** (BDD) = naming tests using domain language (DSL) & natural-language constructs (ie English) to describe code behavior
* **Defect Rate/Density** = defect / KLOC (1000 lines of code)
* **Fixture** = fixed state of a system/set of objects used as baseline for running tests in a consistent environment, data & conditions (eg DB, test files & folders with known data)
* **Setup**/**Teardown** = work to accomplish before/after a test runs
* **Software Inspection** = peer review/defect hunt using a well defined process
  * Advantages:
    1. Errors can mask other Errors => a simple inspection discovers many possibly nested errors
    2. Incomplete versions of a system can be inspected w/o additional costs (code does not even have to run)
    3. Consider broader quality attributes (compliance with standards, portability, maintainability, inefficiencies), inappropriate algorithms, poor programming style
* **Static Analysis** = testing/debugging by examining the source code without having to execute the program
* **Verification & Validation** (V&V, aka **Testing**)
  * Demonstrates to developer & customer Software meets its requirements (at least 1 test / 1 requirement)
  * Attempts to discover faults or defects int the software (incorrect, indesirable, not conform to spec)
  * **Validation** = ensures a system conforms to the customer's expectations (ie green light), including emergent properties (ie are we building the right product?)
  * **Verification** = checking the software conforms to specification & meets functional & non-functional requirements (ie are we building the product right?)

## Types

* [Types of Software Testing](https://www.javatpoint.com/types-of-software-testing)
  * **Unit** = does a unit of code work as intended (path, **structural**, whitebox, interface consistent, coverage analysis)
  * **Acceptance/Release** = does a codebase conform to its specification (blackbox, Functional, Acceptance, Validation, Requirements Testing)
  * **Integration** = are multiple parts of a system working well together (interface, Integration tests, **regression**)
  * **System** (end-to-end) = does complete system work (Stress-testing, Black-Box, failure, behaviour, Functional, Non-functional)
* Types of errors
  * **Defect** (aka **Bug**) = deviation from expected behavior due to flaws in code or design (related to Validation)
  * **Error** (aka **Mistake**) = coder mistake, ie code logic does not follow specification due to misunderstanding or oversight
  * **Failure** = accumulation of defects leading to information loss
  * **Fault** = unintended behavior by a program, ie a usecase that wasn't forethought, potentially leading to a failure
* Types of fakes
  * **Dummy** = placeholder to pass as required parameter (eg null or DummyUser())
  * **Fake** = working lightweight interface implementation (eg performs memory operations instead of real DB)
  * **Mock** = hi-jacks/injects a fake/test double object in place of a real dependency (eg a method), so code does not call real API/DB/service
    * [Mock out dependencies, not the actual classes under test](https://stackoverflow.com/a/2277068)
  * **Stub** = object/method with hardcoded responses (returns the same arbitrary values, eg a single `return` statement)

## Tools

* _Robot framework_ = Python-written generic keyword-driven test automation framework for acceptance testing/test-driven development, using a tabular test data syntax
  * [RIDE](https://github.com/robotframework/RIDE) = Robot Framework IDE (edit _.robot_ files)
* _xUnit_ = automated testing software framework/label/architecture composed of defined components: test cases & suites (ie groups), assertions, fixtures (environment), runner to report results
  * Notably used by Microsoft (in place of their self-developed _mstest_)
