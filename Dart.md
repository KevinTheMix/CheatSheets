# Dart

OO programming language developed by Google and designed for (mobile/web) client development.

Features:

* Multi-platform (compiles to native or JS)
* Tailored for UI creation
  * Async-await
  * Isolate-based concurrency
  * Null/Type Safety
  * Spread operator
* Hot reload
* Fast for all platforms

## Syntax

* [Brackets](https://stackoverflow.com/a/61948369/3559724)
  * `function(a, b)`  = required positional parameters
  * `function(a, [b])` = optional positional parameters
  * `function(a, {b, c})` = optional [named parameters](https://dart.dev/guides/language/language-tour#named-parameters)
    * _required_ = forces optional named parameter
* [Operators](https://dart.dev/guides/language/language-tour#operators)
  * `~/` = forces division integer result
* [Cascade (.., ?..) notation](https://dart.dev/guides/language/language-tour#cascade-notation)
  * Similar to Visual Basic .NET's `With...End With`
* [Libraries and visibility](https://dart.dev/guides/language/language-tour#libraries-and-visibility)
  * Every Dart app is a library, even if it doesn’t use a library directive
  * Identifiers that start with an underscore (_) are visible only inside the library
* [Constructors](https://www.freecodecamp.org/news/constructors-in-dart/)
  * Constructor overload does not exist, but differently named constructors do, e.g. `KokoClass.second(...)`
* [Future](https://dart-tutorial.com/asynchronous-programming/future-in-dart/)
  * [Future tutorial](https://medium.com/flutter-community/a-guide-to-using-futures-in-flutter-for-beginners-ebeddfbfb967)

* `final` = assigned once, in the instance constructor
* `const` = fixed value, can be static (i.e. accessed without instance)

* [dynamic variables](https://www.w3schools.io/languages/dart-dynamic-type/)

### Guidelines

* [Effective Dart style](https://dart.dev/guides/language/effective-dart/style)

## Resources

[DartPad](https://www.dartpad.dev/)
