# Design Patterns

* Decorator
  * Add a behavior, at runtime, without modifying the existing, separation of concerns.
  * Implements the Interface of a decorated object, and receives an instance in its constructor. Then, call the methods of that instance, adding extra features.
* Adapter
  * Adapts interface A into interface B
* Composite
  * Composite class implements interface and manages a collection of instances (or a factory), then dispatchs calls to one of those instances.
* Singleton
  * A Single instance.
  * Hard to test
* Builder
  * Used in .Net Core configuration
* Iterator
  * Cfr .Net GetEnumerator() (well-spred nowadays)
* Visitor
  * Allows to follow Open-Close Principle
