# Dart

OO programming language by Google designed for fast multi-platform app development, that draws its inspiration from major familiar languages (C#, Java, JavaScript).
The same Dart code can run on multiple platforms (eg mobile/desktop via Flutter, server via `dart:io`, web via _dart2js_) without modification.

## Quick Tips

* [DartPad](https://dartpad.dev)
* [DartPad](https://dartpad.github.io)
* [Dart cheatsheet](https://dart.dev/resources/dart-cheatsheet)
* [Effective Dart: Style](https://dart.dev/effective-dart/style)
* Every Dart file is a library (meaning it can get `import`-ed in another file), even if it doesn't use any library directive explicitely

## Glossary

* _dart2js_ = Dart to JS compiler that performs AOT-like heavy optimizations for web apps
* _dart:ui_ (library) = bridge between Dart bits & native bits (eg C++ or browser APIs eg Canvas, JS, DOM)
* **AOT** (Ahead-of-Time) = compiles full codebase beforehand (ie for production), Dart code can be compiled to efficient native machine code, JavaScript or WebAssembly
  * AOT compiled-to-native code no longer requires Dart VM to execute afterwards, since a native artefact is produced (eg a Windows _.exe_ file)
  * Eg `dart compile exe {file}`
* **AST** (Abstract Syntax Tree) = data structure representing code flow/structure as static data (ie a tree, à la Linq expression tree)
* **Common Front End** (CFE) = Lexer/Parser (into AST), Compiler (type inference/cheking, optimizations), Analyzer (code navigation/refactoring/linting), Analysis Server (exposes Analyzer features to client IDEs)
  * Output of CFE is Kernel blobs/files that are fed to JIT Compiler
* **Dart Core** = core libraries (eg where **int**, **String** are _implemented_) written in native code (often in C++, or platform-specific)
* **Dart Runtime** = optimized environment in which compiled Dart code executes (whether AOT or JIT), manages memory (GC) & concurrency (isolates), enforces (dynamic-time) typing
  * It is part of Dart VM and automatically included in AOT-compiled self-contained executables (eg _.exe_ files) on native platforms
* **Dart SDK** = toolkit to write/compile/run Dart applications (ie Dart core/additional libraries (eg io, html), Dart VM, _dart2js_, _dart2native_, `dart compile`, _pub_, DevTools)
* **Dart VM** = Common Front End + JIT (incremental) Compiler + Debug Service & Runtime
  * Provided by `dart run` CLI command, which launches a dedicated process (eg _dart.exe_ on Windows)
* **Isolate** = independant unit of execution that does not share memory, making it safer for concurrency compared to thread-based models
  * Isolates run in parallel in separate processes (ie on separate CPUs), unaware of each other, and communicate via messages (inspired by Erlang)
* **JIT** (Just-in-Time) = compiles on-the-fly, allows program to keep running (**in Dart VM**, until it exits) while being edited, enables QoL features such as _Stateful Hot Reload/Restart_
  * Eg `dart run ({file})`
* **FFI** (Foreign Function Interface) = interoperability with the C programming language (see [C interop using dart:ffi](https://dart.dev/guides/libraries/c-interop))
* **Pattern** = matching (in refutable context, ie _if case_, _switch_ statement or expression) and/or destructuring data, can be of different (nested) types (const, list, map, Object, wildcard, record)
* **Record** = immutable structure of hybrid values (eg for returning more than one value in a function)

## CLI

* `dart --version`
* `dart analyze` = code static analyzer that identifies issues (good idea to plug into CI/CD pipeline)
* `dart fix` = automatically applies fixes for issues such as:
  * those revealed by the static analyzer that have an associated automated solution
  * depreciated APIs that can be auto-migrated to their newest counterpart
  * `dart fix --apply` = auto-applies suggested fixes in bulk
  * `dart fix --dry-run` = preview all suggested auto-fixes
* `dart format` = code auto-tidy
* `dart compile exe {source}.dart`
* `dart run` = run current app
* `dart run {file_relative_path}.dart`

## API

* `async` = wait without blocking, okay as long as no costly operations take place (in that case use an isolate)
* `a.hashCode` = pseudo-random hash code (warning: differs between program execution or even same class instances with identical values so don't use as map key or set item, unless value equality is explicitly implemented)
* `a.runtimeType` = à la **runtime** `typeof` (types can be used as variables via **Type** class eg `Type kokoType = int`, à la reflection)
* `print()` = built-in function to output text to console (for debugging/logging), we can pass it object instances (not just strings)
* [`call()`](https://stackoverflow.com/a/58833763/3559724)

## Declaration

* `#koko` = [Symbol](https://dart.dev/language/built-in-types#symbols)
* `_` (identifier prefix) = internal member only visible inside (entire) file/library (not a particular class)
* `as` = cast
* `const` = compile-time static value (at declaration), inside a class const fields must also be marked `static`
  * (side-note that even in C#, [const always implies static](https://stackoverflow.com/a/2628435/3559724))
* `dynamic` = _default_ type when none is specified (see [dynamic vs Object](https://stackoverflow.com/a/31295855/3559724))
* `final` (à la C# `readonly`) = assignable once at runtime immutable variable (at declaration or ctor init list - not ctor body)
* `is`/`is!` = check type is/isn't (enables **type promotion**, ie using checked type within `if` body, as if cast locally)
* `late` = declare a non-nullable variable w/o initialization, also fix static warnings (when you know it won't be)
* `typedef` = type alias, or function signature definition (eg to indicate callback/handler type more precisely)
* `var` = type is (statically) infered from right-side value (_prefered way of initializing variables_)
  * Declaring a variable with `var` without right-side value makes it implicitly `dynamic` in that case (_use reluctantly/sparingly_)

### Flow & [Operators](https://dart.dev/language/operators)

* `assert(condition)` = development-only checks (not executed in production)
* `identical(a, b)` = checks whether two objects have same address in memory (ie they're the same)
* `if (koko case pattern when …)`
* `switch(…) { case pattern: …; }` = does not require a _default_ case
  * Switch expression = returns a value (eg `final value = switch(data) { pattern1 => … pattern2 => … _ => … }`)
* `try {…} catch(e) {…}`
* `try {…} on KokoException catch(e) {…} catch(e) {…}` = catch specific exception type (then last generic catch all)
* `when` = guard in a pattern matching scenario

* `!` = casts nullable to its underlying non-nullable type, or raises an error if it was null
  * This operator is a potential code smell and should be avoided (see _Null safety in Dart_ video)
  * This operator is unnecessary following an `if` not null check, as Dart is smart enough to figure out it's not null
* `?.` = returns `null` if operand is null
* `??` = returns left value if not null, right value otherwise
* `??=` = assigns value only if operand was null
* `..` and `?..` = cascade notation, applies a mutating function on an object, and return that object (eg `return List<int>.from(items)..add(Item());`)
* `...` = spread operator (see collections section below)
* See [The dots and question marks of Dart](https://medium.com/@habib23me/the-dots-and-question-marks-of-darts-bccfc759d129)
* [Parentheses, Square brackets, Curly braces, Angle brackets](https://stackoverflow.com/a/61948369/3559724)

### Numbers

* **Binary**
  * `^` = XOR
  * `>>>` = unsigned shift right
  * `~bits` = unary bitwise complement (0 <-> 1)
* **num**
  * _int_ & _double_ inherit from _num_
  * `toDouble()`
* **int**
  * `i.isOdd`, `i.isEven`
* **double**
  * `floor()`, `ceil()` & `round()` = useful to turn a **double** into the closest **int**
  * `floorToDouble()`, `ceilToDouble()` & `roundToDouble()` similarly
  * `double.tryParse(num) != null` = [Check if number](https://stackoverflow.com/a/24085491/3559724)
* `~/` = forces division integer result

### Dates & Durations

* `date.difference(date)` = **Duration**
* `inSeconds`

### Strings

[Single vs Double quotes](https://stackoverflow.com/a/54014914/3559724) = identical, useful to mix them up to make it easier to work with inner quotes (eg `"This is a 'great' example"`). Use triple (single or double) quotes for multi-lines.

* String signature = `abstract final class String implements Comparable<String>, Pattern`
* `r'C:\System'` or `r"C:\System"` = raw string (escapes automatically `\` and prevents interpolation, à la C# `@"C:\System"`)
  * `'C:\\System` alternatively with manual escaping
* Interpolation = `'$koko'` or `'${longer.expression[i]}'`
* Concatenation = `'a' + 'b' + 'c'` or `'a' 'b'    'c'` (result: `'abc'`)
* Multiplication = `'ko' * 4` = `'kokokoko'`
* `s.startsWith()`
* `s.substring(start, [end])`
* `s.characters` (property) = string as characters list (requires _characters_ package)
* Unicode support using _characters.dart_ package (Runes and grapheme clusters)
* [IsNullOrEmpty](https://stackoverflow.com/a/52948927/3559724) = `s?.isEmpty ?? true` or simply `s == null || s.isEmpty`
* Formatting
  * `object.toString()` = string representation (automatically called when using an object in a string context eg an interpolation)
  * `NumberFormat('###.00').format(num)` = _123.00_
  * `num.toStringAsFixed(2)` = _123.00_
  * `DateFormat.yMMMd().add_Hm().format(dateText)` = _Aug 12, 2022 16:20_
  * `DateFormat('y.MM.dd').add_Hm().format(dateText)` = _2022.08.12 16:20_
* `padLeft(int width)` = <https://api.dart.dev/stable/1.21.0/dart-core/String/padLeft.html>
* **StringBuffer** `write()`, `writeln()`, `writeAll()`, `clear()`, _isEmpty_, _length_

### [Collections](https://api.flutter.dev/flutter/dart-collection/dart-collection-library.html)

Map, Set, Queue, List, LinkedList.

* `const {collection_literal}` = define a compile-time constant collection
* `collection.isEmpty|isNotEmpty`
* `collection.length`
* `collection.max` = max value (in _package:collection/collection.dart_)
* `...` (spread operator) or `...?` (null-aware spread operator)
* `first` & `last` (properties) = error if empty
* `firstWhere(condition)` = error if no match
* `firstWhere(condition, orElse: () => fallback)` = fallback value if no match
* `single` (property) = error if zero or more than one match
* `singleWhere(condition)` = error if zero or more than one match
* `singleWhere(condition, orElse: () => fallback)` = fallback if zero or error if more than one match
* `any(condition)`
* `contains(item)` = find item by reference (address)
* `join("…")` = converts all elements to Strings and concatenates them
* [Iterable&lt;E&gt;](https://api.dart.dev/stable/3.5.4/dart-core/Iterable-class.html) (à la C# Enumerable)
  * collection of values/elements that can be accessed sequentially, via its [iterator](https://api.dart.dev/stable/3.5.4/dart-core/Iterable/iterator.html) getter property
  * base class for Lists & co
* [Iterator&lt;E&gt;](https://api.dart.dev/stable/3.5.4/dart-core/Iterator-class.html) is an interface exposing an `Iterator<E> iterator` property for getting items, one at a time, from an object
  * Implementing classes instances can be used in `for (… in …)` constructs

```dart
// Iterable<E>
class … extends Iterable<…> {
  …
  Iterator<…> get iterator => …;
}

// Iterator<E>
abstract class Iterator<E> {
  bool moveNext();
  E get current;
}
```

#### [Lists](https://dart.dev/language/collections#lists)

Ordered sequences of objects, with lots of built-in methods.
In Dart, arrays are List objects, so most people just call them _lists_.
[Arrays in other languages are called Lists in Dart](https://stackoverflow.com/a/64273912/3559724).

* `[1, 2, 3]` = Dart infers the type
* `[a, b, c][index]` = pick an item among many according to some selection index (eg menu selecting a screen, see NavigationBar Material 3 widget)
* `[...list]` = shallow-clone an array
  * Can be used to add items eg `[...list, item]`
  * Can be used to concatenate lists eg `[...a, ...b]`
* `<int>[1, 2, 3]` = with explicit generic type
* `<int>[]` = with explicit generic type now mandatory since there are no items yet to infer from
  * For casting however, we need to use `List<Type>` instead
* `[1, 2.34, 'text', ['nested', 5]]` = mixed types list are also valid
* `list.reversed` = an `Iterable<E>` property, basically the reverse of _iterator_
  * can be used to reverse Strings in a single statement ie `s.split('').reversed.join()` (or `s.characters.reversed.join()` with _characters/characters.dart_ package added)
* `List.generate(count, (index) => … );` = uses generator function to generate _count_ items
* `List<T>.from(Iterable)` = constructs a T List from an Iterable, useful to cast each item, or convert another Iterable type (eg a Set) to a List
* **Collection if** = add item conditionally (eg `[if (condition) Item(…), b, c]`), Note: **don't use curly braces** (to delimite blocks) in this syntax
* **Collection for** = add items using a loop (eg `[for (var i in integers) '$i']` = turns a list of int into a list of Strings)
* `list.add(item)`
* `list.addAll(other)`
* `list.insert(index, item)` eg `list.insert(0, item)` to add at the beginning (unlike `add()`)
* `list.remove(item)` = remove by reference
* `list.removeAt(index)` = remove by index
* `list.removeWhere(condition)` = remove by condition
* `list.elementAt(i)` == `list[i]`
* `list.indexOf(item)` = index by reference
* `list.indexWhere(condition)` = index by condition
* `list.forEach((i) => print(i));` or simply `list.forEach(print);`
* `for(var item in list) …`
* `list.map((item) => …)` = C# Linq `Select()`, can be used to create one Widget for each list item
  * Returns an `Iterable<T>`, so append `toList()` to evaluate it immediately and turn into a non-lazy List
  * [Map with index](https://channaly.medium.com/map-with-index-in-dart-flutter-6e6665850ea8)
* `list.fold<int>(start, (accu, next) => accu + next)` = [same as reduce but can return any type](https://stackoverflow.com/a/20491946/3559724)
  * Can `map()` & `reduce()` in one go (eg `_days.fold(0.0, (max, next) => math.max(max, next.amount))`)
* `list.reduce((previous_return, next) => previous_return + next)` = reduces a collection to a single value (à la C# `Aggregate()`)
  * `list.reduce(math.min/max)`
* Note: add/remove will not work if list is constant (eg `const list = []`), or its rvalue is a constant literal (eg `var list = const []`, in that case however `list` can be reassigned since it's not `const` - unless it is `final` too)
  * Safest options = `final list = const []` or `const list = []` that both fixate both left/right terms (_tested & confirmed_)

#### Sets

Unordered collection of (preferrably) **unique** items.
Shares most of the same collection-related methods as Lists.

* `var set = {'a', 'b', 'c'}` = type is inferred
* `Set<String> set = {}` = provide type explicitely if it cannot be inferred
* `Set.from([1, 2, 3])` = construct from List
* `set.add(item)` and `set.remove(item)`
* `set.addAll(other)`
* `set.contains(item)`
* `set.single` = not a method! it's a property (getter)
* `a.intersection(b)` = new Set with matching items
* `a.difference(b)` = new Set with disjointed items

#### Maps

Key-value object (aka a hash map). Both Key & Value can be any type. Keys are unique (not values).
(Can be used as a kind of ad-hoc "anonymous" class, with the keys acting as properties).

* `var map = {};` = map of type `Map<dynamic, dynamic>`
* `var map = { 'koko' : 123, 'kontan' : 777 }` = create a new Map using type inference
* `var map = Map<String, int>()` = create a new Map with explicit types
* `map['koko'] = 123` = add a value
* `map['koko']` = access a value
* `map['nokoko']` = _null_ (no error if key does not exist)
* `map.entries` = a collection of KVPs => this is one way to use `map()` with **Map** (<https://www.codevscolor.com/dart-iterate-map>)
* `map.values.elementAt(index)` = access a value by index (or using an [extension method](https://stackoverflow.com/a/60521753/3559724))
* `map.addAll(other)`
* `map.containsKey(key)`
* `map.forEach((key, value) {…})` (or using _for … in_: `for (var key in map.keys) { … map[key] … }`)
* `map.map((key, value) {…})` = returns new key-value **Map** (not a List)
* `map.remove(key)`
* `map.putIfAbsent(key, () => value)`
* `map.update(key, (oldValue) => newValue)`

### Futures & Streams

* [async vs async*](https://stackoverflow.com/a/60036568/3559724)
  * `async` (with `await`) = Future (keyword comes between function head & body eg `function(…) async { … }`)
  * `async*` (with `await for` & `yield`) = Stream (asynchronous generator function)
  * `sync*` (with `yield`)  is related to synchronous generators, ie `Iterable<T>` functions
  * `yield` statement is for immediately available, produced one-by-one values _on-demand_
  * `yield*` allows to yield an entire Iterable (ie its values one a time)

#### [Future](https://dart-tutorial.com/asynchronous-programming/future-in-dart)

`async-await` [is the recommended choice as it improves readability](https://dart.dev/guides/language/effective-dart/usage#prefer-asyncawait-over-using-raw-futures), but cannot be used in some scenarii (cannot make some methods async such as initState or [constructors](https://www.reddit.com/r/dartlang/comments/a4da0q/when_to_use_await_vs_then/ebevh52), we cast multiple requests at the same time and want them to run together instead of blocking on each one, although we can use [Future.wait](https://stackoverflow.com/a/42176121/3559724) for that scenario).

* `async-await Future` vs `Future.then()` [are different](https://stackoverflow.com/a/54515559/3559724) (former is blocking; latter is a callback)
* `then(…)` also returns a Future (=> chainable eg `Future.then(…).then(…)`)
* `then(…)`'s callback always takes in an argument (even when the Future returns nothing eg `then((_) => …)`)
* `then(…)`'s callback can be a named function eg `then(print)`
* `then(…, onError: (error) {…} )` accepts a second callback to treat an error
* `then(…)` can be appended _after_ `catchError(…)`, in which case it acts as a _finally_ block
  * Some explicit generic typing on a previous `then<T>()` may be required in that scenario (see <https://github.com/dart-lang/sdk/issues/42363>)
* `catchError((error) {…}, test: {condition})` = applies error handling function (if the optional condition is met)
* `onError<E>((error, stackTrace) {…}, test: {condition})` (outside of _then_ block) = catches typed errors ([more precisely than catchError](https://stackoverflow.com/a/69467957))
* `whenComplete(…)` = handles completion both if value or error (à la _finally_)
* To handle errors with `await`, wrap the code in a _try-catch_ block (see <https://stackoverflow.com/a/61701836>)
  * Side-node on _try-catch_: use `rethrow` to rethrow the original error (probably preserving its callstack more efficiently)

* `Future.delayed(duration).then(…)` = runs `then()` callback after _duration_ time (which can be zero but will still make the code async)
  * Similar to C#'s `Task.Delay(ms)`
* `Future.error('…')` = returns an error future (note that raising an exception instead eg `throw Exception('…')` will get caught at same catchError)
* `Future.timeout(Duration(seconds: 5), onTimeout: () {…} )` = set max time waiting for completion
* `Future.value(123)` = a future already completed with a value
* `Future.wait(futures)` = wait for multiple futures to complete

```dart
void main() {
  var future = Future(() => 'Future');  // Future<String>
  var value2 = Future.value(123);       // Future<int>
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

Streams is async feed of data & events.
Streams are (async) like Futures but for Iterables, where values are produced to be consumed but not all are available from the start.

* `Stream<int> count() async* { int i=1; while(true) yield i++; }`
* `async*` + `yield await` = produces one value (awaited from a Future) to be returned by the Stream
* `listen((_) => …)` = consumes a value and runs a provided callback on each
* `where(…)`
* `map(…)`
* `foreach(…)`
* `Stream.fromIterable([2, 6, 6, 8, 12, 8, 8, 2]).distinct()` = outputs _2, 6, 8, 12, 8, 2_

### Functions

* `koko(a, b)` = required positional/ordinal parameters
* `koko(a, [b])` = optional positional parameters
* `koko(a, {b, c})` = optional [named parameters](https://dart.dev/guides/language/language-tour#named-parameters)
  * `required` = forces otherwise optional named parameter ([with no natural default value](https://stackoverflow.com/a/63048076/3559724))
  * `@required` = deprecated analyzer annotation, replaced with stricter `required` null-safety keyword as of Dart 2.12 (see <https://stackoverflow.com/a/67642421/3559724>)
* Optional parameters must either be nullable, or be provided a default value (eg `Koko({this.a = ''})`)
* Functions overload does not exist in Dart => use different names for different functions
* Dart has [first-class functions](https://livebook.manning.com/book/dart-in-action/chapter-4), ie functions (pointers) as parameters
  * That means we can pass a function name directly as argument, or define a function on the spot using lambda/anonymous notation
  * Eg `koko(() {…});` = named function taking in an anonymous function as argument
  * `Function` = any function
  * `VoidCallback` = a Function without parameters nor return
* Anonymous Functions
  * `_`, `__`, etc = ignore incoming callback parameter
  * `(a) { return a; }` or
  * `(a) { return a; } ()` executes it immediately (eg `var koko = (s) { return s + s; } ('ko');`)
  * `(a) => a` using arrow notation ([=> is syntaxic sugar for single return statement](https://stackoverflow.com/a/15804303/3559724))
    * Note: unlike in C#, `(a) => { return a; }` (using both arrow AND curly braces) is invalid!
  * `((a) => a) ()` similarly executes it immediately (eg `var koko = ((s) => s + s) ('ko');`)
* `external` = separates function declaration & body (as a way to include abstract functions to non-abstract classes)

### Classes

* [Constructors](https://www.freecodecamp.org/news/constructors-in-dart)
  * `Koko(a, b) { this.a = a; this.b = b; }` = with body
  * `Koko(a) : this.a = a;` = with initializer (properties marked _final_ **must** be initialized here, not in constructor's body)
  * `Koko(this.a, this.b);` (positional, required) = without body, matching properties via _this_ prefix & matching name/type
  * `Koko({this.a, this.b});` (named, optional) = without body, matching properties via _this_ prefix & matching name/type
  * `Koko({this.a}) : assert(a >= 0);` = testing condition during debugging/development
  * **Named Constructor** = explicitly named (eg `Koko.other(…)`, `Koko.withSpecificities(…)`)
  * **Unnamed Constructor** = constructor with same name as class (eg `Koko(…)`)
  * `Koko._(…) …` = makes unnamed constructor private, hence class can only instantiate via other **named** constructors (eg for singleton pattern)
  * `Koko(…): this.other(…)` = calling a named constructor
  * `Koko.other(…): this(…)` = calling unnamed constructor (or `this._()` if it is private)
  * Constructors overload does not exist (same as for functions), so there can be only one unnamed ctor (but multiple named ctors)
  * `factory` = [Factory](https://dart.dev/language/constructors#factory-constructors) **static** constructor
    * Can be used for caching (singleton returning single static instance (or collection, especially with `putIfAbsent()`)) or polymorphism (via switch-case-return subclasses)
    * Eg `factory Koko() { return single/multiple item(s) here }`
  * `new` keyword is optional (in Dart 2.0)
* `static` = can be applied to class methods, to be called via `Class.method()`
* Getters & Setters
  * `get height { return this._height}`
  * `get height => _height`
  * `set height(value) => _height = value`
* Extension = defines methods/get/set/static members/operators applying to some type (eg `extension on Class { … }`)
  * Can be named (eg `extension Extension on Class { … }`) to manage package scope, or even private (`_`) to current file
  * `this.` prefix can be omitted within `{ … }` body
* Operator
  * Equality = reference-based by default; need to implement explicit value comparison eg standard pattern `@override bool operator ==(Object other) => identical(this, other) || other is A && runtimeType == other.runtimeType && value == other.value`
    * Override default hashCode getter (eg via individual properties values `int get hashCode => Object.hash(p1.hashCode, p2.hashCode, p3.hashCode)`) => end of equality operator becomes `hashCode == other.hashCode` (instead of comparing each values)
  * Via _equatable_ package `class Koko extends Equatable {properties} @override List<Object> props => [{properties}]`
* **Record** = anonymous immutable aggregate fixed-size type, bundling multiple heterogeneous typed objects into a single one
  * Immutable means its fields cannot be reassigned post-creation (but record instance itself can, unless otherwise marked _final_)
  * Eg `var record = ('first', a: 2, b: true, 'last');` = anonymously typed record instance
  * Eg `typedef Koko = ({A a, B b});` = defines a new type with named fields (close to a lightweight class definition)
* `call(…)` = special class method that allows instances of that class to be called as methods (eg `koko(…)`)

#### Inheritance & Mixins

An [implicit interface](https://dart.dev/language/classes#implicit-interfaces) is defined along with each class.
A child class can either _extend_ a parent class or _implement_ a parent's implicit interface (thus inheriting **no** concrete implementation).
There is no syntax for declaring explicit interfaces, but _implement_-ing an [abstract class](https://stackoverflow.com/a/20791334/3559724) is close.
Multiple inheritance is not permitted: every class (except for root-level `Object`) has exactly **one** superclass.

* `@override` = member override, actually optional (lets Dart analyzer issue a warning if forgotten or unexpected)
* `abstract` = cannot be instantiated directly (via constructor, but still possible via factories, or literals in **String**'s case)
* `covariant` = explicit polymorphism (see <https://stackoverflow.com/a/71237734/3559724>), required for child narrowing polymorphism (though in Dart, superclass widening polymorphism works out of box)
  * [Why _covariant_ with no _@override_](https://stackoverflow.com/a/65961499/3559724) = superclass covariant 'delegation' (ie declare once for all subclasses)
* `extends` = class inheritance eg `class Koko extends KokoParent` (use `super` to access base fields/methods)
  * Can also constraint generic types (eg `class Koko<T extends StatefulWidget>`)
* `final` = cannot be subclassed (enforces immutability, eg **String**)
* `implements` = interface inheritance eg `class Koko implements KokoParent` (**must** `@override` all parent fields/methods)
* `mixin` = define a mixin (eg `mixin KokoMixin {…}`)
* `on` = constraint on which classes that mixing can be applied (eg `mixin KokoMixin on State<T>`)
* `with` = use a mixin (eg `class Koko with KokoMixin {…}`)
  * Mixins are basically (multiple) behavioral inheritance, or utility/toolboxes, constrasting with logical inheritance relationship
  * Any class without a constructor can be a mixin eg `class ConstructorlessClass {void fun() {…}}` (make it _abstract_ to prevent instanciation)
  * Mixed-in methods can be overriden eg `mixin KokoMixin {void fun() {…}}`, then `class Koko with KokoMixin {@override fun() {…}}`
  * It is possible to combine extension with mixins eg `class AB extends Parent with A, B {}`
* A [vanilla property can override a getter](https://flutterfromdotnet.hashnode.dev/flutter-first-impressions) (_damage_)
* `constructor({super.property})` or `constructor({required super.property})` = shorthand to pass on a named parameter to  _super_ constructor
  * Eg used in **InheritedWidget**'s abstract const constructor's _child_ property (ie `const InheritedWidget({ super.key, required super.child });`) & classes than extends it
* See [extends vs with vs implements](https://www.geeksforgeeks.org/dart-extends-vs-with-vs-implements)

## Extensions

* _dart:math_ = `Random().nextInt(n)`
* _dart:convert_ = JSON encode/decode

### [Packages](https://pub.dev/publishers/tools.dart.dev/packages)

* **Markdown**

## Code Samples

### Type inference

```dart
var v;
v = 123;
v = 'ok';
print(v); // ok
print(v.runtimeType); // String
v = 123;
print(v); // 123
print(v.runtimeType); // int
```

### Mixins

```dart
class A       { String getMessage() => 'A'; }
class B       { String getMessage() => 'B'; }
class Parent  { String getMessage() => 'P'; }

// Exploded form of `class AB extends P with A, B {}`
class PA = Parent with A;
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

Adapted from [Romain Rastel: What are mixins?](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3).
Related: [Multiple inheritance diamond problem](https://en.wikipedia.org/wiki/Multiple_inheritance#The_diamond_problem).