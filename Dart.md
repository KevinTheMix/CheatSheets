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

## Environment

* [DartPad](https://dartpad.dev) or [DartPad](https://dartpad.dartlang.org)

## Syntax

* `var` = type is (statically) infered from right-side value (it is **not** dynamic). This is the prefered way of initializing variables.
* `ìnt` & `double` inherit from `num`
* `'$koko'` or `'${array[i]}'` = string interpolation
* `final` = assigned once, in the instance constructor
* `const` = fixed value, can be static (i.e. accessed without instance)
* `late` = declare a non-nullable variable w/o initialization & fix static warnings that it can be _null_ (when you know it won't be)
* [dynamic](https://www.w3schools.io/languages/dart-dynamic-type/)
  * Default type when none is specified
  * Type can be ignored in most situations (method return value, method parameters, etc.)

* [Operators](https://dart.dev/guides/language/language-tour#operators)
  * `~/` = forces division integer result
* [Cascade (.., ?..) notation](https://dart.dev/guides/language/language-tour#cascade-notation)
  * Similar to Visual Basic .NET's `With...End With`

* [Libraries and visibility](https://dart.dev/guides/language/language-tour#libraries-and-visibility)
  * Every Dart app is a library, even if it doesn’t use a library directive
  * Identifiers that start with an underscore (_) are visible only inside the library

* [Future](https://dart-tutorial.com/asynchronous-programming/future-in-dart/)
  * [Future tutorial](https://medium.com/flutter-community/a-guide-to-using-futures-in-flutter-for-beginners-ebeddfbfb967)
* Stream = async data/events/feed `Stream<int> count() async* { int i=1; while(true) yield i++; }`

### Arrays

* `[if (condition) Item(...), b, c]` = add item conditionally
* _collection_ library has lots of built-in helper methods for array manipulation
  * [IterableExtension\<T>](https://api.flutter.dev/flutter/package-collection_collection/IterableExtension.html)

### Functions

* Functions overload does not exist in Dart => use different names for different functions
* [Brackets](https://stackoverflow.com/a/61948369/3559724)
  * `function(a, b)`  = required positional parameters
  * `function(a, [b])` = optional positional parameters
  * `function(a, {b, c})` = optional [named parameters](https://dart.dev/guides/language/language-tour#named-parameters)
    * In Flutter: _@required_ = forces optional named parameter (so it's not positional, but still required)

* `koko(() {...});` = named function taking in an anonymous function as argument (à la .NET _Action_)
* Unlike C#, Dart has [first-class functions](https://livebook.manning.com/book/dart-in-action/chapter-4)
  * `void update(EmailUser user) {...}; list.forEach(update);`

### Classes

* Inheritance = `class Koko extends KokoParent`
* `_` prefixed properties are private
* Constructors
  * `ClassName(p1, p2) { this.p1 = p1; this.p2 = p2; }` = with body
  * `ClassName(p1, p2);` = without body (fields name & type must be identical)
  * `ClassName(p1) : this.p1 = p1;` = with initializer
  * `new` is optional (in Dart 2)
  * Constructors overload does not exist (same as for functions) => use differently named constructors e.g. `KokoClass.second(...)`
    * `Animal._();` makes the constructor private => can only insantiate via (an)other named constructor(s)
    * Factory = `factory Animal() { return another Animal() constructor here }`, used for caching (singleton) or polymorphism (return subclasses)
  * [Constructors](https://www.freecodecamp.org/news/constructors-in-dart/)
  * [Exploring Dart Constructors](https://medium.flutterdevs.com/exploring-dart-constructors-345398a0e4c5)
* Getters & Setters
  * `get height { return this._height}`
  * `get height => _height`
  * `set height(value) => _height = value`
* [mixins](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3) = multiple (behavioral) inheritance
  * Definition = like any regular class (make it _abstract_ to prevent instanciation) or `mixin KokoMixin`
  * Usage = `class Koko with KokoMixin`

## Guidelines

* [Effective Dart style](https://dart.dev/guides/language/effective-dart/style)

## Resources
