# Dart

OO programming language developed by Google and designed for (mobile/web) client development.

Features:

* Multi-platform (compiles to native or JS)
* Tailored for UI creation
  * Async-await
  * Isolate-based concurrency
  * Null/Type Safety (e.g. cannot assign _null_ to an Object unless explicitely defined as _nullable_ i.e `Koko?`)
  * Spread operator
* Hot reload
* Fast for all platforms

## Environment

* [DartPad](https://dartpad.dev)
* [DartPad](https://dartpad.github.io/)
* [DartPad](https://dartpad.dartlang.org)

* [Libraries and visibility](https://dart.dev/guides/language/language-tour#libraries-and-visibility)
  * Every Dart file is a library (meaning it can get _import_-ed in another file), even if it doesn’t use any library directive explicitely
  * Identifiers that start with an underscore (_) are visible only inside the file/library

## Syntax

* [Future](https://dart-tutorial.com/asynchronous-programming/future-in-dart/)
  * [Future tutorial](https://medium.com/flutter-community/a-guide-to-using-futures-in-flutter-for-beginners-ebeddfbfb967)
* Stream = async data/events/feed `Stream<int> count() async* { int i=1; while(true) yield i++; }`

### Keywords, Types & [Operators](https://dart.dev/guides/language/language-tour#operators)

* `static` = can be applied to class methods (i.e. to be called like `Class.method()`)
* `const` = value fixed once and for all at declaration time and from the compiler standpoint
  * Inside a class, const fields must also be market `static`
    * (note that even in C#, [const always implies static](https://stackoverflow.com/a/2628435/3559724))
* `final` (à la C# _readonly_) = assigned once, either at declaration, or in constructor's initiliazation list (**not its body**)
* `late` = declare a non-nullable variable w/o initialization & fix static warnings that it can be _null_ (when you know it won't be)
* `var` = type is (statically) infered from right-side value (it is **not** dynamic). This is the prefered way of initializing variables.
* [dynamic](https://www.w3schools.io/languages/dart-dynamic-type/)
  * Default type when none is specified
  * Type can be ignored in most situations (method return value, method parameters, etc.)

* `external` = [separates function declaration and body](https://stackoverflow.com/a/24929907/3559724)

* `collection is Map` = check
* `object as Map` = cast

* [Punctuation operators](https://medium.com/@habib23me/the-dots-and-question-marks-of-darts-bccfc759d129)
  * `a!` = casts _a_ to its underlying non-nullable type
  * `a?.b` = returns _null_ if a is null (equivalent to `a == null ? null : a.b`)
  * `a ?? b` = returns _a_ if not null; _b_ otherwise
  * `a ??= b` = assigns _b_ only if _a_ was null
  * `..` and `?..` = [cascade notation](https://dart.dev/guides/language/language-tour#cascade-notation)
    * Create an object and immediately chain methods/properties then returning it à la Visual Basic .NET's `With...End With`
    * E.g. `return List<int>.from(items)..add(Item());`
  * `...` = spread operator (see collections section below)

### Numbers

* `ìnt` & `double` inherit from `num`
* `~/` = forces division integer result

### Strings

* `'$koko'` or `'${array[i]}'` = string interpolation
* `'abc'.substring(start, [end])`
* `'abc'.characters` (property) = string as characters list
* Unicode support using _characters.dart_ package (Runes and grapheme cllusters)
* `#symbol` (not a String, but I'll just leave this here for now)

### Collections

* _collection_ library has lots of built-in helper methods for array manipulation
  * [IterableExtension\<T>](https://api.flutter.dev/flutter/package-collection_collection/IterableExtension.html)
* `collection.length`
* `...` (spread operator) or `...?` (null-aware spread operator)
* `const {collection_literal}` = define a compile-time constant collection

#### [Lists](https://dart.dev/guides/language/language-tour#lists)

Ordered sequences of objects, with lots of built-in methods.
In Dart, arrays are List objects, so most people just call them _lists_.
[Arrays in other languages are called Lists in Dart](https://stackoverflow.com/a/64273912/3559724).

* `[1, 2, 3]` = Dart infers the type
* `<int>[1, 2, 3]` = with explicit generic type
* `<int>[]` = with explicit generic type now mandatory since there are no items yet to infer from
  * For casting however, we need to use `List<Type>` instead
* `[1, 2.34, 'text', ['nested', 5]]` = mixed types list are also valid
* `List.generate(count, (index) => … );` = uses generator function to generate _count_ items
* `List<T>.from(iterable)` = constructs a List of T from an Iterable
* **Collection if** = add item conditionally (e.g. `[if (condition) Item(...), b, c]`)
* **Collection for** = add items using a loop (e.g. `[for (var i in integers) '$i'`] = turns a list of int into Strings)
* `list.add(item)`
* `list.remove(item)` (remove by value)
* `list.elementAt(i)` == `list[i]`
* `list.first` & `list.last` (properties)
* `list.forEach((i) => print(i));` or simply `list.forEach(print);`
* `for(var item in list) …`
* `list.map((item) => …)` = C# Linq `Select()`; can be used to create one Widget for each list item
  * Returns an `Iterable<T>`, so append `toList()` to evaluate it immediately and turn into a non-lazy List
* `list.reduce((accu, next) => accu + next)` = à la C# Aggregate()
* `list.fold<int>(start, (accu, next) => accu + next)` = [same as reduce but can return any type](https://stackoverflow.com/a/20491946/3559724)
* `list.any((item) => …)`
* Add/removing from the list will not work if it was set as a _const_ literal, as in, the value was _const_, not the variable
  * Note that you cannot add to a _const_ list either e.g. `const list = []`
  * E.g. cannot add to list after `var list = const []` (which is basically useless), however _list_ can be reassigned since it's not _const_

#### [Sets](https://dart.dev/guides/libraries/library-tour#sets)

Unordered collection of (preferrably) **unique** items.
Shares most of the same collection-related methods as Lists.

* `var set = {'a', 'b', 'c'}` = type is inferred
* `Set<String> set = {}` = provide type explicitely if it cannot be inferred
* `Set.from([1, 2, 3])` = construct from List
* `set.add(item)` and `set.remove(item)`
* `set.addAll(otherSet)`
* `set.contains(item)`
* `set.single` = not a method! it's a property (getter)
* `a.intersection(b)` = new Set with matching items
* `a.difference(b)` = new Set with disjointed items

#### [Maps](https://dart.dev/guides/language/language-tour#maps)

Key-value object. Both Key & Value can be any type. Keys are unique (not values).
(Can be used as a kind of ad-hoc "anonymous" class, with the keys acting as properties).

* `var map = {};` = map of type `Map<dynamic, dynamic>`
* `var map = { 'a' => 1, 'b' => 2 }` = create a new Map using type inference
* `var map = Map<String, int>()` = create a new Map with explicit types
* `map['c'] = 3` = add a value
* `map['c']` = access a value
* `map['d']` == _null_ (access a value that does not exist)
* `map.entries` = a collection of KVPs => this is one way to use `map()` with **Map** (<https://www.codevscolor.com/dart-iterate-map>)
* `map.values.elementAt(index)` = access a value by index (or using an [extension method](https://stackoverflow.com/a/60521753/3559724))
* `map.forEach((key, value) {…})` (or using _for-in_: `for (var key in map.keys) { … map[key] … }`)
* `map.map((key, value) {…})` = returns new key-value **Map** (not a List)

### Functions

* Functions overload does not exist in Dart => use different names for different functions
* [Brackets](https://stackoverflow.com/a/61948369/3559724)
  * `function(a, b)`  = required positional parameters
  * `function(a, [b])` = optional positional parameters
  * `function(a, {b, c})` = optional [named parameters](https://dart.dev/guides/language/language-tour#named-parameters)
    * _required_ ([replaces _@required_ annotation](https://stackoverflow.com/a/63048076/3559724)) = force otherwise optional named parameter
    * As implicit default is _null_, the type of optional (named) parameters must be nullable, or they must be provided a (non-null) default value

* Dart has [first-class functions](https://livebook.manning.com/book/dart-in-action/chapter-4), i.e. functions (pointers) as parameters
  * That means we can pass a function name directly as argument, or define a function on the spot using lambda/anonymous notation
  * E.g. `f(() {...});` = named function taking in an anonymous function as argument
  * Like C#'s `Action<T>` & `Funct<T>`, we have `VoidCallback` and `Function`
  * Like C#'s `delegate`, we have [typedef](https://www.tutorialspoint.com/dart_programming/dart_programming_typedef.htm)
* Anonymous Functions
  * `(a) { return a; }` or
  * `(a) { return a; } ()` executes it immediately e.g. `var koko = (ko) { return ko+ko; } ('ko');`
  * `(a) => a` using arrow notation ([=> is syntaxic sugar for single return statement](https://stackoverflow.com/a/15804303/3559724))
    * Note: unlike in C#, `(a) => { return a; }` (using both arrow AND curly braces) is invalid!
  * `((a) => a) ()` similarly executes it immediately e.g. `var koko = ((ko) => ko+ko) ('ko');`

### Classes

* Inheritance = `class Koko extends KokoParent`
* `_` prefixed properties are private
* Constructors
  * `ClassName(p1, p2) { this.p1 = p1; this.p2 = p2; }` = with body
  * `ClassName(p1) : this.p1 = p1;` = with initializer (properties marked _final_ **must** be initialized here, not in the constructor's body)
  * `ClassName(this.p1, this.p2);` = without body, matching properties (specifying _this_ prefix, and name/type must match)
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
