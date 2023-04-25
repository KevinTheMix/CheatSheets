# Testing

* Verification = checking the software conforms to specification & meets functional & non-functional requirements
* Validation = ensures the system conforms to the customer's expectations (ie green light)
* Level of confidence depends on
  1. Software function (purpose) : safety-critical / Proto.
  2. User expectations
  3. Marketing environment
* System checking & analysis
  * Software Inspections or Peer reviews (Verification != emergent prop.)
  * Software Testing (Validation & Defect)
* Inspection checklist
  1. Errors ~~mask~~ Errors -> simple inspection discovers many errors
  2. Incomplete versions of a system can be inspected w/o additional costs
  3. Consider broader quality attributes (compliance with standards, portability, maintainability, inefficiencies), inappropriate algorithms, poor programming style
* Automated static analysis
  1. Control Flow
  2. Data Use
  3. Interface
  4. Information Flow
  5. Path
* Software Testing
  * Demonstrate to developer & customer Software meets its requirements at least 1 test / 1 requirement
  * Discover Faults or defects int the software (incorrect, indesirable, not conform to spec)
  * test cases -> data -> output -> results
* Types
  * Unit Testing = path, **structural**, whitebox, interface consistent, coverage analysis
  * Integration = (interface), Integration tests, **regression**
  * System = Stress-testing, Black-Box, failure, behaviour, Functional, Non-functional
  * Acceptance/Release = Black-Box, Functional, Acceptance, Validation, Requirements Testing

## Unit Testing

## Stubbing

Writing a static concrete test case that always returns the same values.
E.g.: we create an implementation of an object containing methods that consist of a single **return** statement with arbitrary values.

## Mocking

Hijacking certain methods in the business logic and replace their implementation so that we control their behavior.
E.g.: we mock a method that makes calls to the DB so it returns arbitrary values instead.

Mock dependencies, not the actual classes under test (see <https://stackoverflow.com/a/2277068>).
