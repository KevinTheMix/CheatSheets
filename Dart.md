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

* `'$koko'` or `'${array[i]}'` = string interpolation
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
  * [Exploring Dart Constructors](https://medium.flutterdevs.com/exploring-dart-constructors-345398a0e4c5)
    * `new` is optional (in Dart 2)
    * Definition with initializer = `Animal(height) : this.height = height;` or simply `Animal(this.height)` (equivalent field name & type)
    * `_` prefixed fields are private
    * `get height { return this._height}` or `get height => _height`, and `set height(value) => _height = value`
    * `Animal._();` makes the constructor private => can only insantiate via (an)other named constructor(s)
    * Factory = `factory Animal() { return another Animal() constructor here }`, used for caching (singleton) or polymorphism (return subclasses)
* [Future](https://dart-tutorial.com/asynchronous-programming/future-in-dart/)
  * [Future tutorial](https://medium.com/flutter-community/a-guide-to-using-futures-in-flutter-for-beginners-ebeddfbfb967)

* `final` = assigned once, in the instance constructor
* `const` = fixed value, can be static (i.e. accessed without instance)
* `late` = declare a non-nullable variable w/o initialization & fix static warnings that it can be _null_ (when you know it won't be)

* `methodName(() {...});` = named function taking in an anonymous function as argument (à la .NET _Action_)

* [dynamic](https://www.w3schools.io/languages/dart-dynamic-type/)
* [mixins](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3) = multiple (behavioral) inheritance
  * Definition = like any regular class (make it _abstract_ to prevent instanciation) or `mixin KokoMixin`
  * Usage = `class Koko with KokoMixin`
* Inheritance = `class Koko extends KokoParent`

* Stream = async data/events/feed `Stream<int> count() async* { int i=1; while(true) yield i++; }`

### Guidelines

* [Effective Dart style](https://dart.dev/guides/language/effective-dart/style)

## Resources

