# Testing

## Verification & Validation

## Unit Testing

## Stubbing

Writing a static concrete test case that always returns the same values.
E.g.: we create an implementation of an object containing methods that consist of a single **return** statement with arbitrary values.

## Mocking

Hijacking certain methods in the business logic and replace their implementation so that we control their behavior.
E.g.: we mock a method that makes calls to the DB so it returns arbitrary values instead.