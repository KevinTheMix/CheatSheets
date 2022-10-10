# Dart

OO programming language developed by Google and designed for (mobile/web) client development.
Dart draws its inspiration from major and familiar languages (C#, Java, JavaScript).

Features:

* Multi-platform (compiles to native or JS)
* Tailored for UI creation
  * Async-await
  * Isolate-based concurrency
  * Null/Type Safety (e.g. cannot assign _null_ to an Object unless explicitely defined as _nullable_ i.e `Koko?`)
  * Spread operator
* Hot reload
* Fast for all platforms
* Supports both AOT & JIT compiling
  * JIT allows developers to very efficiently make changes and quickly see immediate results
  * AOT (pre-compiling) allows released code to still be highly efficient
  * See [Why Flutter uses Dart](https://hackernoon.com/why-flutter-uses-dart-dd635a054ebf)

Don't forget:

* Prefix private members with undescore `_`
* Immutable variables as _final_

## Environment

* [DartPad](https://dartpad.dev)
* [DartPad](https://dartpad.github.io/)
* [DartPad](https://dartpad.dartlang.org)

* [Libraries and visibility](https://dart.dev/guides/language/language-tour#libraries-and-visibility)
  * Every Dart file is a library (meaning it can get `import`-ed in another file), even if it doesn’t use any library directive explicitely
  * Identifiers that start with an underscore (_) are visible only inside the file/library
  * [_as_ vs _show_](https://stackoverflow.com/a/19723473/3559724)
    * `as` = specifying an (arbitrary) local scope name to the whole library
    * `show` (& `hide`) = picking/accessing a specific (existing) object within that library

* [dart:ffi](https://dart.dev/guides/libraries/c-interop) = call to native C APIs
  * [Foreign function interface](https://en.wikipedia.org/wiki/Foreign_function_interface)

## Syntax

### Keywords, Types & [Operators](https://dart.dev/guides/language/language-tour#operators)

* `static` = can be applied to class methods (i.e. to be called like `Class.method()`)
* `const` = value fixed once and for all at declaration compile time
  * Inside a class, const fields must also be market `static`
    * (side-note that even in C#, [const always implies static](https://stackoverflow.com/a/2628435/3559724))
* `final` (à la C# `readonly`) = assigned once, either at declaration, or in constructor's initiliazation list (**not its body**)
* `late` = declare a non-nullable variable w/o initialization & fix static warnings that it can be _null_ (when you know it won't be)
* `var` = type is (statically) infered from right-side value (it is **not** dynamic). This is the prefered way of initializing variables.
* `dynamic` = [dynamic](https://www.w3schools.io/languages/dart-dynamic-type/)
  * _default_ type when none is specified
  * [dynamic vs Object](https://stackoverflow.com/a/31295855/3559724)

* `covariant` = explicit polymorphism (see <https://stackoverflow.com/a/71237734/3559724>)
  * [Why _covariant_ with no _@override_](https://stackoverflow.com/a/65961499/3559724)
* `external` = [separates function declaration and body](https://stackoverflow.com/a/24929907/3559724)

* `_` prefixed fields are internal (_to the library (ie the entire file), not the particular class_)

* `collection is Map` = check
* `object as Map` = cast

* [Punctuation operators](https://medium.com/@habib23me/the-dots-and-question-marks-of-darts-bccfc759d129)
  * `a!` = casts _a_ to its underlying non-nullable type
  * `a?.b` = returns `null` if a is null (equivalent to `a == null ? null : a.b`)
  * `a ?? b` = returns _a_ if not null; _b_ otherwise
  * `a ??= b` = assigns _b_ only if _a_ was null (shorter than `if (a != null) a = b`)
  * `..` and `?..` = [cascade notation](https://dart.dev/guides/language/language-tour#cascade-notation)
    * Applies a mutating function on an object, and return that object
    * E.g. `return List<int>.from(items)..add(Item());`
  * `...` = spread operator (see collections section below)

* `switch(…) { case value: …; }` = does not require a _default_ case

* `#koko` = [Symbol](https://dart.dev/guides/language/language-tour#symbols)

* `try {…} catch(e) {…}`
* `try {…} on KokoException on catch(e) {…} catch(e) {…}` = catch specific exception type (then last generic catch all)

### Futures & Streams

* [async vs async*](https://stackoverflow.com/a/60036568/3559724)
  * `async` (with `await`) = Future; keyword comes between function head & body eg `function(…) async { … }`
  * `async*` (with `await for` & `yield`) = Stream; asynchronous generator function
  * `sync*` (with `yield`)  is related to synchronous genertors, ie `Iterable<T>` functions
  * `yield` statement is for immediately available, produced one-by-one values _on-demand_
  * `yield*` allows to yield an entire Iterable (ie its values one a time); see [Generator Functions](https://www.youtube.com/watch?v=TF-TBsgIErY)

#### [Future](https://dart-tutorial.com/asynchronous-programming/future-in-dart/)

`async-await` [is the recommended choice as it improves readability](https://dart.dev/guides/language/effective-dart/usage#prefer-asyncawait-over-using-raw-futures), but cannot be used in some scenarii (cannot make some methods async such as initState or [constructors](https://www.reddit.com/r/dartlang/comments/a4da0q/when_to_use_await_vs_then/ebevh52/), we cast multiple requests at the same time and want them to run together instead of blocking on each one, although we can use [Future.wait](https://stackoverflow.com/a/42176121/3559724) for that scenario).

* [Future for beginners](https://medium.com/flutter-community/a-guide-to-using-futures-in-flutter-for-beginners-ebeddfbfb967)
* `async-await Future` vs `Future.then()` [are different](https://stackoverflow.com/a/54515559/3559724) (former is blocking; latter is a callback)
* `then(…)` also returns a Future (=> chainable eg `Future.then(…).then(…)`)
* `then(…)`'s callback always takes in an argument (even when the Future returns nothing eg `then((_) => …)`)
* `then(…)`'s callback can be a named function eg `then(print)`
* `then(…)` can be appended _after_ `catchError(…)`, in which case it acts as a _finally_ block
  * Some explicit generic typing on a previous `then<T>()` may be required in that scenario (see <https://github.com/dart-lang/sdk/issues/42363>)
* `catchError((error) => …, test: {condition})` = applies error handling function (if the optional condition is met)
* `onError<E>((error, stackTrace) => …, test: {condition})` = error of type _E_ ([more precisely typed](https://stackoverflow.com/a/69467957))
* To handle errors with `await`, wrap the code in a _try-catch_ block (see <https://stackoverflow.com/a/61701836>)
  * Side-node on _try-catch_: use `rethrow` to .. rethrow the original error (probably preserving its callstack more efficiently)
* `Future.delayed(duration).then(…)` = runs `then()` callback after _duration_ time (which can be zero but will still make the code async)
  * Similar to C#'s `Task.Delay(ms)`

```dart
void main() {
  var future = Future(() => 'Future');  // Future<String>
  var value2 = Future.value(123);       // Future<int>, creates a future already completed with value
  var value1 = Future.value();          // Future<dynamic>, same
  var nothin = Future(() {});           // Future<Null>
     
  print('First');
  
  // This print comes last, since that Future's declaration was last.
  nothin.then((_) => print('Future returns nothing, but then() always has a parameter - even if void'));
  
  future
    .then<String>((s) { print(s); throw 'error'; }) // We need to indicate (generic) type here, so following on|catchError knows what to return!
    .onError<String>((error, stackTrace) { print(error); return 'handled'; })
    .catchError((error) { print(error); return 'caught'; })
    .then((s) { print(s); }
  );
  
  print('Second');  
}
```

#### Stream

Streams is async data/events/feed.
Streams are (async) like Futures but for Iterables, where values are produced to be consumed but not all are available from the start.

* `Stream<int> count() async* { int i=1; while(true) yield i++; }`
* `assert(condition)` = development-only checks (not executed in production)
* `async*` + `yield await` = produces one value (awaited from a Future) to be returned by the Stream
* `listen((_) => …)` = consumes a value and runs a provided callback on each
* `where(…)`
* `map(…)`
* `foreach(…)`

### Numbers

* **num**
  * _int_ & _double_ inherit from _num_
  * `toDouble()`
* **double**
  * `floor()`, `ceil()` & `round()` = useful to turn a **double** into the closest **int**
  * `floorToDouble()`, `ceilToDouble()` & `roundToDouble()` similarly
  * `double.tryParse(num) != null` = [Check if number](https://stackoverflow.com/a/24085491/3559724)
* **int**
  * `i.isOdd`, `i.isEven`
* [Operators](https://dart.dev/guides/language/language-tour#operators)
  * `~/` = forces division integer result

### Strings

[Single vs Double quotes](https://stackoverflow.com/a/54014914/3559724)
They're identical with the added benefit that nesting them can make it easier to work with inner quotes (eg `"This is a 'great' example"`).

* `r'C:\System'` = raw string (escapes automatically `\` and prevents interpolation, à la C# `@"C:\System"`)
  * `'C:\\System` alternatively with manual escaping
* `'$koko'` or `'${longer.expression[i]}'` = interpolation
* `String s = 'a' 'b'    'c'` = concatenation (result: `'abc'`)
* `s.startsWith()`
* `s.substring(start, [end])`
* `s.characters` (property) = string as characters list
* Unicode support using _characters.dart_ package (Runes and grapheme clusters)
* [IsNullOrEmpty](https://stackoverflow.com/a/52948927/3559724) = `s?.isEmpty ?? true` or simply `s == null || s.isEmpty`
* Formatting
  * `NumberFormat('###.00').format(num)` = _"123.00"_
  * `num.toStringAsFixed(2)` = _"123.00"_
  * `DateFormat.yMMMd().add_Hm().format(dateText)` = _"Aug 12, 2022 16:20_
  * `DateFormat('y.MM.dd').add_Hm().format(dateText)` = _"2022.08.12 16:20"_
* `padLeft(int width)` = <https://api.dart.dev/stable/1.21.0/dart-core/String/padLeft.html>
* **StringBuffer** `write()`, `writeln()`, `writeAll()`, `clear()`, _isEmpty_, _length_

### Dates & Durations

* `date.difference(date)` = **Duration**
* `inSeconds`

### [Collections](https://api.flutter.dev/flutter/dart-collection/dart-collection-library.html)

* `collection.isEmpty|isNotEmpty`
* `collection.length`
* `...` (spread operator) or `...?` (null-aware spread operator)
* `const {collection_literal}` = define a compile-time constant collection
* `first()` & `single()`
* `firstWhere()` & `singleWhere()`
* `any(condition)`
* `contains(item)` = find item by reference (address)

* `Iterable<T>` is an interface whose inheriting classes must expose an `Iterator<T> iterator` property
  * Lists & Maps are examples of such classes (they do have an _iterator_ property)
  * Those classes instances can then be used in `for (… in …)` constructs

```dart
abstract class Iterator<E> {
  bool moveNext();
  E get current;
}

class … extends Iterable<…> {
  …
  Iterator<…> get iterator => …;
}
```

#### [Lists](https://dart.dev/guides/language/language-tour#lists)

Ordered sequences of objects, with lots of built-in methods.
In Dart, arrays are List objects, so most people just call them _lists_.
[Arrays in other languages are called Lists in Dart](https://stackoverflow.com/a/64273912/3559724).

* `[1, 2, 3]` = Dart infers the type
* `[...list]` = shallow-clone an array
  * Can be used to add items eg `[...list, item]`
  * Can be used to concatenate lists eg `[...a, ...b]`
  * [Spread operator actually shallow or deep?](https://stackoverflow.com/q/61421873/3559724>)
* `<int>[1, 2, 3]` = with explicit generic type
* `<int>[]` = with explicit generic type now mandatory since there are no items yet to infer from
  * For casting however, we need to use `List<Type>` instead
* `[1, 2.34, 'text', ['nested', 5]]` = mixed types list are also valid
* `List.generate(count, (index) => … );` = uses generator function to generate _count_ items
  * `reversed` = reverse list (can be used to reverse Strings in one statement ie `s.split('').reversed.join()`)
* `List<T>.from(iterable)` = constructs a List of T from an Iterable
* **Collection if** = add item conditionally (e.g. `[if (condition) Item(…), b, c]`), **Note: don't use curly braces in this syntax**
* **Collection for** = add items using a loop (e.g. `[for (var i in integers) '$i'`] = turns a list of int into Strings)
* `list.add(item)`
* `list.insert(index, item)` eg `list.insert(0, item)` to add at the beginning (unlike `add()`)
* `list.remove(item)` = remove by reference
* `list.removeAt(index)` = remove by index
* `list.removeWhere(bool Function)` = conditionally remove from instance (ie in place!)
* `list.elementAt(i)` == `list[i]`
* `list.indexOf(item)` = index by reference
* `list.indexWhere(condition)` = index by condition
* `list.first` & `list.last` (properties)
* `list.forEach((i) => print(i));` or simply `list.forEach(print);`
* `for(var item in list) …`
* `list.map((item) => …)` = C# Linq `Select()`; can be used to create one Widget for each list item
  * Returns an `Iterable<T>`, so append `toList()` to evaluate it immediately and turn into a non-lazy List
  * [Map with index](https://channaly.medium.com/map-with-index-in-dart-flutter-6e6665850ea8)
* `list.reduce((accu, next) => accu + next)` = reduces a collection to a single value (à la C# `Aggregate()`)
  * `list.reduce(math.min/max)`
* `list.fold<int>(start, (accu, next) => accu + next)` = [same as reduce but can return any type](https://stackoverflow.com/a/20491946/3559724)
* `list.any((item) => …)`
* Add/removing from the list will not work if it was set as a _const_ literal (as in, the value was _const_, not the variable)
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
* `var map = { 'a' : 1, 'b' : 2 }` = create a new Map using type inference
* `var map = Map<String, int>()` = create a new Map with explicit types
* `map['c'] = 3` = add a value
* `map['c']` = access a value
* `map['d']` == _null_ (access a value that does not exist)
* `map.entries` = a collection of KVPs => this is one way to use `map()` with **Map** (<https://www.codevscolor.com/dart-iterate-map>)
* `map.values.elementAt(index)` = access a value by index (or using an [extension method](https://stackoverflow.com/a/60521753/3559724))
* `map.forEach((key, value) {…})` (or using _for-in_: `for (var key in map.keys) { … map[key] … }`)
* `map.map((key, value) {…})` = returns new key-value **Map** (not a List)
* `map.containsKey(key)`
* `map.remove(key)`
* `map.putIfAbsent(key, () => value)`
* `map.update(key, (oldValue) => newValue)`

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
  * E.g. `f(() {…});` = named function taking in an anonymous function as argument
  * Like C#'s `Action<T>` & `Funct<T>`, we have `VoidCallback` and `Function`
  * Like C#'s `delegate`, we have [typedef](https://www.tutorialspoint.com/dart_programming/dart_programming_typedef.htm)
* Anonymous Functions
  * `(a) { return a; }` or
  * `(a) { return a; } ()` executes it immediately e.g. `var koko = (ko) { return ko+ko; } ('ko');`
  * `(a) => a` using arrow notation ([=> is syntaxic sugar for single return statement](https://stackoverflow.com/a/15804303/3559724))
    * Note: unlike in C#, `(a) => { return a; }` (using both arrow AND curly braces) is invalid!
  * `((a) => a) ()` similarly executes it immediately e.g. `var koko = ((ko) => ko+ko) ('ko');`

### Classes

* Constructors
  * `ClassName(p1, p2) { this.p1 = p1; this.p2 = p2; }` = with body
  * `ClassName(p1) : this.p1 = p1;` = with initializer (properties marked _final_ **must** be initialized here, not in the constructor's body)
  * `ClassName(this.p1, this.p2);` = without body, matching properties (specifying _this_ prefix, and name/type must match)
  * `new` is optional (in Dart 2)
  * Constructors overload does not exist (same as for functions) => use differently named constructors e.g. `KokoClass.second(…)`
    * `Animal._();` makes the constructor private => can only instantiate via (an)other named constructor(s)
    * [Factory](https://dart.dev/guides/language/language-tour#factory-constructors) = static constructor
      * can be used for caching (singleton returning single static instance) or polymorphism (via switch-case-return subclasses)
      * eg `factory Animal() { return single/different Animal(s) here }`
  * [Constructors](https://www.freecodecamp.org/news/constructors-in-dart/)
  * [Exploring Dart Constructors](https://medium.flutterdevs.com/exploring-dart-constructors-345398a0e4c5)
* Getters & Setters
  * `get height { return this._height}`
  * `get height => _height`
  * `set height(value) => _height = value`

#### Inheritance & Mixins

An [implicit interface](https://dart.dev/guides/language/language-tour#implicit-interfaces) is defined along with each class.
A child class can either _extend_ a parent class or _implement_ a parent's implicit interface (thus inheriting **no** concrete implementation).
There is no syntax for declaring explicit interfaces, but _implement_-ing an [abstract class](https://stackoverflow.com/a/20791334/3559724) is close.
Multiple inheritance is not permitted: every class (except for `Object`) has exactly **one** superclass.

* `extends` = class inheritance eg `class Koko extends KokoParent` (use `super` to access base fields/methods)
* `implements` = interface inheritance eg `class Koko implements KokoParent` (**must** `@override` all the parent fields/methods)
* `with` = mixin eg `mixin KokoMixin {…}`, then `class Koko with KokoMixin {…}`
  * Mixins are basically (multiple) behavioral inheritance, or utility/toolboxes, constrasting with logical inheritance relationship
  * any class without a constructor can be a mixin eg `class ConstructorlessClass {void fun() {…}}` (make it _abstract_ to prevent instanciation)
  * mixed-in methods can be overriden eg `mixin KokoMixin {void fun() {…}}`, then `class Koko with KokoMixin {@override fun() {…}}`
  * it is possible to combine extension with mixins eg `class AB extends Parent with A, B {}`
* [extends vs with vs implements](https://www.geeksforgeeks.org/dart-extends-vs-with-vs-implements/)

## Libraries & [Packages](https://pub.dev/)

* _dart:math_ * `Random().nextInt(n)`
* _dart:convert_ = JSON encode/decode

## Guidelines

* [Effective Dart style](https://dart.dev/guides/language/effective-dart/style)

## Code Samples

Mixins (adapted from [Romain Rastel: What are mixins?](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3)):

```dart
class A       { String getMessage() => 'A'; }
class B       { String getMessage() => 'B'; }
class Parent  { String getMessage() => 'P'; }

// Exploded form of `class AB extends P with A, B {}`
class PA = P arent with A;
class PAB = PA with B;
class AB extends PAB {}

// Exploded form of `class BA extends P with B, A {}`
class PB = Parent with B;
class PBA = PB with A;
class BA extends PBA {}

void main() {
  print(AB().getMessage()); // "B"
  print(BA().getMessage()); // "A"
}
```
