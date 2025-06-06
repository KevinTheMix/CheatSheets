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
* **AOT** (Ahead-of-Time) = used in Release Mode, Dart codebase is compiled beforehand (eg via `dart compile exe {file}`) to efficient native machine code (ie a _libapp.so_ shared object file that gets packed within an APK file for ARM/x86, or a Windows _.exe_ file), JavaScript or WebAssembly, thereby producing a native artifact that does not require Dart VM
  * Flutter Engine (in C++) itself gets compiled to native code (eg _libflutter.so_ packed in APK's _/lib/_ folder as well)
* **APK** = an actual zip archive file containing an entire app, ie its source native code as well as assets (fonts, images, etc)
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
* **JIT** (Just-in-Time) = used in Debug Mode, compiles/executes code on-the-fly inside a **Dart VM** (running until program exits), enabling QoL features such as _Stateful Hot Reload/Restart_
  * Eg `dart run ({file})`
* **FFI** (Foreign Function Interface) = interoperability with the C programming language (see [C interop using dart:ffi](https://dart.dev/guides/libraries/c-interop))
* **Pattern** = matching (in refutable context, ie _if case_, _switch_ statement or expression) and/or destructuring data, can be of different (nested) types (const, list, map, Object, wildcard, record)
* **Record** = immutable structure of hybrid values (eg for returning more than one value in a function)
* **Sound Null-Safety** = means non-nullable variables can never be attributed a null value at runtime, guarded at compile-time (it won't even compile)
  * Exceptions exists eg unsafe casting (eg `int? i; int j = i as int`) that's only checked at runtime, or misusing `!` operator
* **Tear-off** = passing a method via name (à la delegate/pointer, ie not a lambda/anonymous function)

## CLI

* `dart --version`
* `dart analyze` = code static analyzer that identifies issues (good idea to plug into CI/CD pipeline)
* `dart compile exe {source}.dart`
* `dart fix` = automatically applies fixes for issues such as:
  * those revealed by the static analyzer that have an associated automated solution
  * depreciated APIs that can be auto-migrated to their newest counterpart
  * `dart fix --apply` = auto-applies suggested fixes in bulk
  * `dart fix --dry-run` = preview all suggested auto-fixes
* `dart format` = code auto-tidy
* `dart run` = run current app
  * `{file_relative_path}.dart` = run specific file

## API

* `a.hashCode` = pseudo-random hash code (warning: differs between program execution or even same class instances with identical values so don't use as map key or set item, unless value equality is explicitly implemented)
* `a.runtimeType` = à la **runtime** `typeof` (types can be used as variables via **Type** class eg `Type kokoType = int`, à la reflection)
* `print()` = built-in function to output text to console (for debugging/logging), we can pass it object instances (not just strings)

## Declaration

* `#koko` = [Symbol](https://dart.dev/language/built-in-types#symbols)
* `_` (identifier prefix) = internal member only visible inside (entire) file/library (not a particular class)
* `as` = cast
* `const` = compile-time static value (at declaration), inside a class const fields must also be marked `static`
  * (side-note that even in C#, [const always implies static](https://stackoverflow.com/a/2628435/3559724))
* `dynamic` = _default_ type when none is specified (see [dynamic vs Object](https://stackoverflow.com/a/31295855/3559724))
  * Dynamic variables can be reassigned a new (runtime) type (eg `dynamic koko = 123; koko = 'abc';`)
* `final` (à la C# `readonly`) = assignable once at runtime immutable variable (at declaration or ctor init list - not ctor body)
* `is`/`is!` = check type is/isn't (enables **type promotion**, ie using checked type within `if` body, as if cast locally)
* `late` = declare a non-nullable variable w/o initialization, also fix static warnings (when you know it won't be)
* `typedef` = type alias, or function signature definition (eg to indicate callback/handler type more precisely)
* `var` = type is (statically) infered from right-side value (_prefered way of initializing variables_)
  * Declaring a variable with `var` without right-side value makes it implicitly `dynamic` in that case (_use reluctantly/sparingly_)

### Flow & [Operators](https://dart.dev/language/operators)

* `assert(condition)` = development-only checks (not executed in production)
* `identical(a, b)` = checks whether two object references are to the same object (ie they have same address in memory), used in `@override bool operator ==()`
* `switch(…) { case pattern: …; }` = does not require a _default_ case
  * Switch expression = returns a value (eg `final value = switch(data) { pattern1 => … pattern2 => … _ => … }`, notice default case is `_`)
* `try {…} catch(e) {…} finally {…}`
* `try {…} on KokoException [catch(e)] {…} catch(e) {…}` = catch specific exception type (last generic catch takes it all)
* `when` = guard (additional condition) while pattern matching, usually applying to value being matched
  * Eg if = `if (x case int value when value > 10)`
  * Eg switch = `switch (x) { case int value when value > 10: …; break; case int value: …; break; }`

* `!` (Null Assertion Operator) = casts nullable to its underlying non-nullable type, or raises an error if it was null
  * This operator is a potential code smell and should be avoided (see _Null safety in Dart_ video)
  * This operator is unnecessary following an `if` not null check, as Dart is smart enough to figure out it's not null
* `?.` (Null-Aware Access Operator) = returns `null` if operand is null
* `?[]` (Null-Aware Index Operator)
* `??` ((If-)Null Operator, Null-Coalescing Operator) = returns left value if not null, right value otherwise
* `??=` (Null-Aware Assignment Operator) = assigns value only if operand was null
* `..` (Cascade Operator) = notation to perform a sequence of operations (ie setting members or calling methods) on same object
* `?..` (Null-Aware Cascade Operator)
* `...` (Spread Operator) = (see collections section below)
* `...?` (Null-Aware Spread Operator)
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
  * `clamp(lower, upper)` = returns a num set between a range
  * `pow(base, exponent)` = exponent (requires _dart:math_ package)
  * `0.12e³` (ie `0.12 x 10³`) = scientific notation, actual _runtimeType_ depends on expression result (_int_ or _double_ whether has floating part)
* **int**
  * `i.isOdd`, `i.isEven`
  * `i.toRadixString(base)` = convert to a string in that int radix (typically a multiple of two)
  * `int.[try]parse("123")`
* **double**
  * `floor()`, `ceil()` & `round()` = useful to turn a **double** into the closest **int**
  * `floorToDouble()`, `ceilToDouble()` & `roundToDouble()` = returns a double (but may be optimized as **int** by Dart runtime)
  * `double.parse("123")`
  * `double.tryParse(num) != null` = [Check if number](https://stackoverflow.com/a/24085491/3559724)
* `~/` = truncated division (forces integer result)
* `NumberFormat(pattern).format(num)` = (eg with pattern `###.00`: _123.00_)
* `num.toStringAsFixed(2)` = specify number of decimals (eg _123.00_)
* **Float32List** = fixed-length list of (IEEE 754) single-precision binary floating-point numbers
  * Considerably more space & time efficient compared to default List implementation

### Dates & Durations

* `DateTime(year)` = implicit constructor (_year_ is the only required positional argument, yielding a date as 1st of January)
* `DateTime.now()` = name constructor
* `Duration(days: …)`

* _inSeconds_
* `difference(date)` = **Duration**
* `subtract(duration)`
* `isAfter(date)` = true/false
* `isSameDayAs(date)` = true/false
* `DateFormat` (class) = (**intl** package)
  * `DateFormat.E().format(date)` = _Mon_, _Tue_, _Wed_, etc
  * `DateFormat.yMd('fr_BE').format(date)` = locale/ization
  * `DateFormat.yMMMd().add_Hm().format(dateText)` = _Aug 12, 2022 16:20_
  * `DateFormat('y.MM.dd').add_Hm().format(dateText)` = _2022.08.12 16:20_

### Strings

Following examples work identically with either [Single vs Double quotes](https://stackoverflow.com/a/54014914/3559724), both useful to work with nested quotes (eg `"This is a 'great' example"`).

* String signature = `abstract final class String implements Comparable<String>, Pattern`
* `object.toString()` = string representation (automatically called when using an object in a string context eg an interpolation)
* Unicode support using _characters/characters.dart_ package (Runes and grapheme clusters)
* Construction
  * Raw string = `r'C:\System'` (automatically escapes `\`, preventing interpolation, à la C# `@"C:\System"`)
  * Multiline = `''' a [CRLF] b [CRLF] c '''`
  * Interpolation = `'$koko'` or `'${longer.expression[i]}'`
  * Concatenation = `'a' + 'b' + 'c'` or `'a' 'b'    'c'` (result: `'abc'`)
  * Multiplication = `'ko' * 4` = `'kokokoko'`
  * `padLeft(int width)` = <https://api.dart.dev/stable/1.21.0/dart-core/String/padLeft.html>
* Flow
  * `isEmpty` = empty String (check null or empty eg `s?.isEmpty ?? true` or simply `s == null || s.isEmpty`)
  * `startsWith(pattern)`
  * `contains(pattern)`
* Access & Manipulation
  * `s.characters` (property) = string as characters list (requires _characters_ package)
  * `s.replaceFirst|All(Pattern regex, String replace)`
  * `s.replaceAll|FirstMapped(pattern, String Function(Match) replace)`
  * `s.replaceRange(start, end, replacement)`
  * `s.substring(start, [end])`
  * Custom `capitalize()` extension method = `String capitalize() { return "${this[0].toUpperCase()}${substring(1).toLowerCase()}"; }`
* **StringBuffer** `write()`, `writeln()`, `writeAll()`, `clear()`, _isEmpty_, _length_

### [Collections](https://api.flutter.dev/flutter/dart-collection/dart-collection-library.html)

**Set**, **List**, **Map**, **Queue** (first/last manipulation), **LinkedList** (_dart:collection_ specialized data structure).

* `const {collection_literal}` = define a compile-time constant collection
* _isEmpty|isNotEmpty_
* _length_
* `collection.max` = max value (in _package:collection/collection.dart_)
* `elementAt(i)` = identical to `list[i]` (**O(1)**) for lists, works with other iterables as well (**O(n)**)
* `first` & `last` (properties) = error if empty
* `firstWhere(condition)` = error if no match
* `firstWhere(condition, orElse: () => fallback)` = fallback value if no match
* `single` (property) = error if zero or more than one match
* `singleWhere(condition)` = error if zero or more than one match
* `singleWhere(condition, orElse: () => fallback)` = fallback if zero or error if more than one match
* `any(condition)`
* `where(condition)`
* `contains(item)` = find item by reference (address)
* `join("…")` = converts all elements to Strings and concatenates them
* `skip(count)` = creates an Iterable that skips {count} first elements

* `...` (spread operator) or `...?` (null-aware spread operator)
* `expand()` = flatten-concatenates subcollections (à la C# `SelectMany(…)`, alternatively `[for(entry in collection) ...entry.items]`)
* `toSet()` = creates a **Set** with same elements, removing any duplicates, original order not guaranteed

* **Iterable** (à la C# _Enumerable_) = collection of values/elements that can be accessed sequentially via its _iterator_ getter property (base class for Lists, etc)
  * Eg `class … extends Iterable<E> { … Iterator<E> get iterator => … ; }`
* **Iterator** = interface for getting items, one at a time
  * Implementing classes instances can be used in `for (… in …)` constructs
  * Eg `abstract class Iterator<E> { bool moveNext(); E get current; }`
* Also see [IterableExtension](https://api.flutter.dev/flutter/package-collection_collection/IterableExtension.html) = additional collection methods

#### [Lists](https://dart.dev/language/collections#lists)

Ordered/sortable sequences of indexed/positioned objects, duplicates permitted.
In Dart, arrays are List objects, so most people just call them _lists_.
[Arrays in other languages are called Lists in Dart](https://stackoverflow.com/a/64273912/3559724).

* Construction
  * `[1, 2, 3]` = Dart infers the type
  * `[1, 2.3, 'a', ['in', 4]]` = hybrid list (in `for (final item in list)` _item_ is actually a different type each iteration as it gets destroyed & recreated)
  * `<int>[1, 2, 3]` = with explicit generic type
  * `<int>[]` = with explicit generic type now mandatory since there are no items yet to infer from
  * `List<Type> list` = declare but don't instantiate a list variable (eg for casting or as method parameter)
  * `[...list]` = shallow-clone an array
    * Eg `[...list, item]` = add item (without spread operator, list would become a nested list)
    * Eg `[...a, ...b]` = concatenate (note: easier to do `a+b` here)
  * `List.generate(count, (index) => … );` = uses generator function to generate _count_ items
  * `List<T>.from(Iterable)` = constructs a T List from an Iterable, useful to cast each item, or convert another Iterable type (eg a Set) to a List
  * `[if (condition) Item(…), b, c]` = add item conditionally (note: **don't use curly braces** to delimite blocks in this syntax)
  * `[for (var i in integers) '$i']` = add items using a loop (eg turns a list of int into a list of Strings)
  * `List.filled(length, value/instance, {growable})` = creates a length-long list filled with the current value at each position
  * `List.unmodifiable(list)` = creates an unmodifiable list containing all elements in given list (cannot change its length or items)
    * Also see **UnmodifiableListView** (eg unmodifiable getter: `List<Note> get notes => UnmodifiableListView(_notes)`)
* Manipulation
  * `l1 + l2 + …` = concatenates multiple lists
  * `add(item)`
  * `addAll(other)`
  * `insert(index, item)` eg `list.insert(0, item)` to add at the beginning (unlike `add()`)
  * `remove(item)` = remove first occurence by reference, returns true if found
  * `removeAt(index)` = remove item by index & returns it
  * `removeLast()` = remove last item & returns it
  * `removeWhere(condition)` = remove by condition
  * _reversed_ = `Iterable<E>` basically the reverse of _iterator_
    * can be used to reverse Strings in a single statement ie `s.split('').reversed.join()` (or `s.characters.reversed.join()` with _characters/characters.dart_ package added)
  * `sublist(start, end)` = à la String `substring()`
  * Cannot add/remove from constant list (eg `const list = []`), or constant literal rvalue (eg `var list = const []`, in that case however `list` can be reassigned since it's not `const` - unless it is `final` too)
    * Safest options = `final list = const []` or `const list = []` that both fixate both left/right terms (_tested & confirmed_)
* Access
  * `[a, b, c][index]` = useful to pick an item among many according to some selection index (eg menu selecting a screen, see NavigationBar Material 3 widget)
  * `indexOf(item)` = index by reference
  * `indexWhere(condition)` = index by condition
  * `for(var item in list) …` = loops (note that _item_ is a copy of a reference, so if we set it to a new instance, _list_ is **not** updated)
  * `list.forEach((i) => print(i));` or simply `list.forEach(print);`
  * `asMap()` = turns into a **Map** where keys are (0-based) indices
  * `map((item) => …)` = C# Linq `Select()`, can be used to create one Widget for each list item
    * Returns an `Iterable<T>`, so append `toList()` to evaluate it immediately and turn into a non-lazy List
    * [Map with index](https://channaly.medium.com/map-with-index-in-dart-flutter-6e6665850ea8)
  * `list.fold<int>(start, (accu, next) => accu + next)` = [same as reduce but can return any type](https://stackoverflow.com/a/20491946/3559724)
    * Can `map()` & `reduce()` in one go (eg `_days.fold(0.0, (max, next) => math.max(max, next.amount))`)
  * `list.reduce((previous_return, next) => previous_return + next)` = reduces a collection to a single value (à la C# `Aggregate()`)
    * `list.reduce(math.min/max)`

#### Sets

Unordered collection of unique items, with fast (O(1)) lookups.

* `var set = {'a', 'b', 'c'}` = type is inferred
* `Set<String> set = {}` = provide type explicitely if it cannot be inferred
* `Set.from([1, 2, 3])` = construct from List
* `set.add(item)` and `set.remove(item)`
* `set.addAll(other)` = add other _collection_ (ie list or set)
* `set.contains(item)`
* `set.single` = not a method! it's a property (getter)
* `a.union(b)` = new Set with combined items
* `a.intersection(b)` = new Set with matching items
* `a.difference(b)` = new Set with disjointed items

#### Maps

Key-value object (aka a hash map). Both Key & Value can be any type. Keys are unique (not values).
(Can be used as a kind of ad-hoc "anonymous" class, with the keys acting as properties).

* Construction
  * `var map = {};` = map of type `Map<dynamic, dynamic>`
  * `var map = { 'koko' : 123, 'kontan' : 777 }` = create a new Map using type inference
  * `var map = Map<String, int>()` = create a new Map with explicit types
  * `map.map((key, value) {…})` = returns new key-value **Map** (not a List)
* Access
  * `map.entries` = a collection of KVPs => this is one way to use `map()` with **Map** (<https://www.codevscolor.com/dart-iterate-map>)
  * `map.keys`
  * `map.values`
    * `map.values.elementAt(index)` = access a value by index (or `map.elementAt(index)` via an [extension method](https://stackoverflow.com/a/60521753/3559724))
  * `map['koko']` = access a value
  * `map['koko'] = 123` = add or modify
  * `map['nokoko']` = _null_ (no error if key does not exist)
  * `map.forEach((key, value) {…})` (or using `for (var key in map.keys) { … map[key] … }`)
  * `map.containsKey(key)`
* Manipulation
  * `map.addAll(other)`
  * `map.putIfAbsent(key, () => value)` = add (only)
  * `map.remove(key)` = removes value and returns it
  * `map.update(key, (oldValue) => newValue)`

### Futures & Streams

* **StreamController** (in _dart:async_)
* **StreamSink** (in _dart:async_)
* [async vs async*](https://stackoverflow.com/a/60036568/3559724)
  * `async` (with `await`) = **Future**, wait without blocking
    * Keyword comes between function head & body (eg `function(…) async { … }`) or getter name & body (eg `Future<T> get koko async {…}`)
    * If operation is too costly, use an isolate instead
  * `async*` (with `await for` & `yield`) = **Stream** (asynchronous generator function)
  * `sync*` (with `yield`)  is related to synchronous generators, ie `Iterable<T>` functions
  * `yield` statement is for immediately available, produced one-by-one values _on-demand_
  * `yield*` allows to yield an entire Iterable (ie its values one a time)

#### [Future](https://dart-tutorial.com/asynchronous-programming/future-in-dart)

* `FutureOr<T>` (in _dart:async_) = type representing values that are either `Future<T>` or `T`
* `async-await Future` vs `Future.then()` [are different](https://stackoverflow.com/a/54515559/3559724) (former is blocking; latter is a callback)
* `async-await` [is the recommended choice as it improves readability](https://dart.dev/guides/language/effective-dart/usage#prefer-asyncawait-over-using-raw-futures).
  * Yet, it cannot be used in some scenarii (ie some methods cannot be async eg initState or [constructors](https://www.reddit.com/r/dartlang/comments/a4da0q/when_to_use_await_vs_then/ebevh52))
* `async` methods must always return a **Future** (hence optional `await` keyword in `return` statements has actually no effect)
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

* `Future.delayed(duration).then(…)` = runs `then()` callback after _duration_ time (note: zero duration still makes code async, unlike `Task.Delay(ms)` in C#)
* `Future.error('…')` = returns an error future (note that raising an exception instead eg `throw Exception('…')` will get caught at same catchError)
* `Future.timeout(Duration(seconds: 5), onTimeout: () {…} )` = set max time waiting for completion
* `Future.value(123)` = a future already completed with a value
* `Future.wait(futures)` = wait for multiple futures to complete

#### Stream

Streams is async feed of data & events.
Streams are (async) like Futures but for Iterables, with values produced to be consumed, where not all are available from the start.

* `Stream<int> count() async* { int i=1; while(true) yield i++; }`
* `async*` + `yield await` = produces one value (awaited from a Future) to be returned by the Stream
* `listen((_) => …)` = consumes a value and runs a provided callback on each
* `where(…)`
* `map(…)`
* `foreach(…)`
* `Stream.fromIterable([2, 6, 6, 8, 12, 8, 8, 2]).distinct()` = outputs _2, 6, 8, 12, 8, 2_

### Functions

Camel case.

* `koko(a, b)` = required positional/ordinal parameters
* `koko(a, [b])` = optional positional parameters (come last)
* `koko(a, {b, c})` = optional [named parameters](https://dart.dev/guides/language/language-tour#named-parameters)
  * `required` = forces otherwise optional named parameter ([with no natural default value](https://stackoverflow.com/a/63048076/3559724))
  * `@required` = deprecated analyzer annotation, replaced with stricter `required` null-safety keyword as of Dart 2.12 (see <https://stackoverflow.com/a/67642421/3559724>)
* Optional parameters must either be nullable, or be provided a default value (eg `Koko({this.a = ''})`)
* Functions overload does not exist in Dart => use different names for different functions
* Dart has [first-class functions](https://livebook.manning.com/book/dart-in-action/chapter-4), ie functions (pointers) as parameters
  * That means we can pass a function name directly as argument, or define a function on the spot using lambda/anonymous notation
  * Eg `koko(() {…});` = named function taking in an anonymous function as argument
  * `Function` = any function (eg specifying return & parameter types `TypeR Function(TypeP1 p1, TypeP2 p2)`)
  * `VoidCallback` = a Function without parameters nor return
* Anonymous Functions
  * `_`, `__`, etc = ignore incoming callback parameter
  * `(a) { return a; }`
  * `(a) { return a; } ()` or `((a) => a) ()` = executes it immediately (eg `var koko = (s) { return s + s; } ('ko');`)
  * `(a) => a` using arrow notation ([=> is syntaxic sugar for single return statement](https://stackoverflow.com/a/15804303/3559724))
    * Note: unlike in C#, `(a) => { return a; }` (using both arrow AND curly braces) is invalid!
* `external` = separates function declaration & body (as a way to include abstract functions to non-abstract classes)
* `call()` = implicit method that Function-type objects have (see <https://stackoverflow.com/a/58833763/3559724>)

### Classes

Pascal case.

* [Constructors](https://www.freecodecamp.org/news/constructors-in-dart)
  * `Koko(a, b) { this.a = a; this.b = b; }` = with body
  * `Koko(a) : this.a = a;` = with initializer (properties marked _final_ **must** be initialized here, not in constructor's body)
  * `Koko(this.a, this.b);` (positional, required) = without body, matching properties via _this_ prefix & matching name/type
  * `Koko({this.a, this.b});` (named, optional) = without body, matching properties via _this_ prefix & matching name/type
  * `Koko({this.a}) : assert(a >= 0);` = testing condition during debugging/development (only for constructors)
  * **Named Constructor** = explicitly named (eg `Koko.name(…) : prop1 = value 1, prop2 = value2`)
  * **Unnamed Constructor** = constructor with same name as class (eg `Koko(…)`)
  * `Koko._(…) …` = makes unnamed constructor private, hence class can only instantiate via other **named** constructors (eg for singleton pattern)
  * `Koko(…) : this.other(…)` = calling a named constructor
  * `Koko.other(…) : this(…)` = calling unnamed constructor (or `this._()` if it is private)
  * Constructors overload does not exist (same as for functions), so there can be only one unnamed ctor (but multiple named ctors)
  * `factory` = **static** constructor that don't always return a new instance, used for either:
    * Caching (existing) instances = singleton (single static instance) or collection (especially with `putIfAbsent()`)
    * Polymorphism = new subtype instance (via switch-case-return subclasses)
    * Complex initialization = non-trivial instance construction (ie checking arguments, mapping from/to eg `fromJson()`)
    * Eg `factory Koko() { return single/multiple item(s) here }`
  * `new` keyword is optional (in Dart 2.0)
  * `Koko.new` = pass a reference to constructor (ie a constructor tear-off, not an instantiation)
* `sealed` = a (implicitly abstract) class that can only be extended/implemented inside its own library, making closed set of local subclasses all statically declared/known to compiler
  * Enables explicit & exhaustive polymorphism with guard rails (eg a `switch` over those subtypes is ensured to be exhaustive as all cases must appear)
* `static` = can be applied to class methods, to be called via `Class.method()`
* Getters & Setters
  * `get height { return this._height}`
  * `get height => _height`
  * `set height(value) => _height = value`
* `extension … on …` = defines methods/get/set/static members/operators applying to some type
  * Can be named (eg `extension KokoExtension on Koko { … }`) to manage package scope, not named (`extension on String { … }`) or even private (`_`) to current file
  * `this.` prefix can be omitted within `{ … }` body (see <https://stackoverflow.com/a/59600729/3559724>)
  * Type defined in `on` is irrelevant to `static` extension methods
* Operator
  * Equality = reference-based by default; need to implement explicit value comparison (eg standard pattern `@override bool operator ==(Object other) => identical(this, other) || other is A && runtimeType == other.runtimeType && value == other.value`)
    * Override default _hashCode_ getter (eg via individual properties values `int get hashCode => Object.hash(p1.hashCode, p2.hashCode, p3.hashCode)`) => end of equality operator becomes `hashCode == other.hashCode` (instead of comparing each values)
  * Via **equatable** package `class Koko extends Equatable {properties} @override List<Object> props => [{properties}]`
* **Record** = anonymous immutable aggregate fixed-size type, bundling multiple heterogeneous typed objects into a single one
  * Immutable means its fields cannot be reassigned post-creation (but record instance itself can, unless otherwise marked _final_)
  * Eg `var record = ('first', a: 2, b: true, 'last');` = anonymously typed record instance
  * Eg `typedef Koko = ({A a, B b});` = defines a new type with named fields (close to a lightweight class definition)
* **Union Types** = a pattern built on sealed classes with multiple factory constructors (eg `state.when(initial: …, loading: …, success: …, failure: …`)
* `call(…)` = special class method that allows instances of that class to be called as methods (eg `koko(…)`)
* `@immutable` (annotation) = forces class and all subtypes to be immutable as well

#### Inheritance & Mixins

An [implicit interface](https://dart.dev/language/classes#implicit-interfaces) is defined along with each class.
A child class can either _extend_ a parent class or _implement_ a parent's implicit interface (thus inheriting **no** concrete implementation).
There is no syntax for declaring explicit interfaces, but _implement_-ing an [abstract class](https://stackoverflow.com/a/20791334/3559724) is close.
Multiple inheritance is not permitted: every class (except for root-level `Object`) has exactly **one** superclass.

* `@override` = member override, actually optional (lets Dart analyzer issue a warning if forgotten or unexpected)
* `abstract` = cannot be instantiated directly (via constructor, but still possible via factories, or literals in **String**'s case), has missing implementations
* `covariant` = explicit polymorphism (see <https://stackoverflow.com/a/71237734/3559724>), required for child narrowing polymorphism (though in Dart, superclass widening polymorphism works out of box)
  * [Why _covariant_ with no _@override_](https://stackoverflow.com/a/65961499/3559724) = superclass covariant 'delegation' (ie declare once for all subclasses)
* `extends` = class inheritance eg `class Koko extends KokoParent`
  * Can also constraint generic types (eg `class Koko<T extends StatefulWidget>`)
* `final` = cannot be subclassed (enforces immutability, eg **String**)
* `implements` = (abstract) class/interface inheritance eg `class Koko implements KokoParent` (**must** `@override` all parent fields/methods)
* `mixin` = define a mixin (eg `mixin KokoMixin {…}`, or `mixin class KokoMixinClass` which can be used as either a class or a mixin)
* `on` = constraint on which classes that mixing can be applied (eg `mixin KokoMixin on State<T>`)
* `super` = access base fields/methods, or feed parameters to base constructor (eg `constructor(super.property)` or `constructor({super.property})`)
  * Used in **InheritedWidget**'s abstract const constructor's _child_ property (ie `const InheritedWidget({ super.key, required super.child });`) & classes than extends it
* `with` = use one or more mixins (eg `class Koko with KokoMixin, KontanMixin {…}`)
  * Mixins are basically (multiple) behavioral inheritance, or utility/toolboxes, constrasting with logical inheritance relationship
  * Any class without a constructor can be a mixin eg `class ConstructorlessClass {void fun() {…}}` (make it _abstract_ to prevent instanciation)
  * Mixed-in methods can be overriden eg `mixin KokoMixin {void fun() {…}}`, then `class Koko with KokoMixin {@override fun() {…}}`
  * It is possible to combine extending with mixins eg `class AB extends Parent with A, B {}`
* A [vanilla property can override a getter](https://flutterfromdotnet.hashnode.dev/flutter-first-impressions) (_damage_)
* See [extends vs with vs implements](https://www.geeksforgeeks.org/dart-extends-vs-with-vs-implements)

##### Mixin Code Sample

```dart
mixin A       { String getMessage() => 'A'; }
mixin B       { String getMessage() => 'B'; }
class Parent  { String getMessage() => 'P'; }

// Exploded form of `class AB extends Parent with A, B {}`
class PA = Parent with A;
class PAB = PA with B;
class AB extends PAB {}

// Exploded form of `class BA extends Parent with B, A {}`
class PB = Parent with B;
class PBA = PB with A;
class BA extends PBA {}

void main() {
  print(PAB().getMessage()); // "B"
  print(PBA().getMessage()); // "A"
  print(AB().getMessage()); // "B"
  print(BA().getMessage()); // "A"
  // Interpretation: last class mixed-in has priority.
}
```

Adapted from [Romain Rastel: What are mixins?](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3).
Related: [Multiple inheritance diamond problem](https://en.wikipedia.org/wiki/Multiple_inheritance#The_diamond_problem).

### [Enums](https://dart.dev/language/enums)

* `enum_value.index` = zero-based index of enum value within its declaration
* `enum_value.name` = enum value as string
* `Enum.values` = list of all values

```dart
// Enhanced enums have properties, values built via a const unnamed constructor, other methods, and can implement interfaces
enum Color {
  red(255, 0, 0), green(0, 255, 0), blue(0, 0, 255);  // Values (comma-separated, must come first at the very top).
  const Color(this.r, this.g, this.b);  // Constructor
  final int r, g, b;  // Properties.

  String get hex => '#${r.toRadixString(16).padLeft(2, '0')}' + '${g.toRadixString(16).padLeft(2, '0')}' + '${b.toRadixString(16).padLeft(2, '0')}';
}
```

## Extensions

* _dart:characters_ = characters manipulation
* _dart:convert_ = JSON encode/decode
* _dart:math_ = `Random().nextInt(n)`
* _dart:mirrors_ = reflection
* [Packages](https://pub.dev/publishers/tools.dart.dev/packages)
  * **Markdown**
* [Invertase Melos](https://melos.invertase.dev) = manage projects split into mutliple packages
