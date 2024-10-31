# C\#

## Quick Tips

* `Console.ReadKey()` = pause
* `System.Diagnostics.Debugger.Break();` is a programmatic breakpoint (F9)
* `System.Environment.GetFolderPath(Environment.SpecialFolder.Desktop);`
* Environment I/O = `Environment.GetFolderPath()`, `Environment.SpecialFolder.LocalApplicationData`
* Logging
  * `System.Diagnostics` (**EventLog**, **Debug** & **Trace** classes)
  * `FileStream logFileStream = File.OpenWrite(LogFilePath); StreamWriter log = new StreamWriter(logFileStream); log.WriteLine(e.Message);  log.Flush(); log.Close();`
* [XML Comments](https://docs.microsoft.com/en-us/dotnet/csharp/codedoc)
  * `<see cref="Koko">` = Class reference
  * `<see href="http://www.koko.com">` = external link (URL)
  * `<para/>` or `<para>...</para>` = paragraph (with line break)
* The **IFormattable** interface can be inherited from to format the value of an object into a string representation, i.e. a richer ToString() method
  * `public string ToString(string format, IFormatProvider provider) { if (provider == null) provider = CultureInfo.CurrentCulture; switch(format) { .. } }` with _format_ equal to eg "full" or "short", or even a pattern
* Don't instantiate `HttpClient` multiple times; inject it from startup in classes that use it
* Don't forget to apply a `ToArray()`/`ToList()` on cached variables (so they're calculated/queryed only once)
* Naming
  * Use Singular for Enum name: `enum Color { Blue, Green, Red }` except for bit flags: `[Flags] enum Things { A = 0, B = 1, C = 2 }`
  * Append the used design-pattern name to class names where appropriate (eg `Observer`, `Factory`, etc.)
* **MSTest**
  * Check that invalid scenarios return expected error messages = `try {…} catch { Assert.IsTrue(ex.Message == String.Format("{format}", param)) }`
* [Explicit interface implementation hiding](https://stackoverflow.com/a/5284799)
* Reflection
  * `typeof(Type).IsAssignableFrom(t)` = is _t_ assignable to variable of type _Type_

## Glossary

* **Casting** = changing compile type of a variable for types with no implicit conversion (but [explicit ones](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/numeric-conversions#explicit-numeric-conversions))
* [Boxing/Unboxing](https://stackoverflow.com/a/2111905) = converts value to/from reference type (to be avoided)
  * Can be used to shoehorn polymorphism in antiquated structures (eg. ArrayList that requires `object`s, not `int`s)
* [Code Contracts](https://docs.microsoft.com/en-us/dotnet/framework/debug-trace-profile/code-contracts) = pre/post-conditions & invariants (eg `Contract.Requires(`{boolean_expression}`)
* **Expression-bodied members** = member (ie method/property) statement as a single expression (eg `member => expression;`)
* **Finalizer** (or **Destructor**) = for cleaning unmanaged resources before a class instance gets collected by the garbage collector `~Koko() { }`
  * Called when calling `Dispose()` on that instance
  * `WeakReference` = a reference that still allows the referenced (typically a memory intensive but easily recreatable) object to be collected by the GC
* **Property**
  * **Automatically implemented property** = syntactic sugar, compiler actually creates private variable (but not usable in code; not called "lowercaseProperty")
    * Eg. `public string Name {get; set;}`
  * Private Setter acts as a private variable, yet publicily (read-only) visible
    * Eg. `public string Name {get; private set; }` or `public ILimits<SimpleOverrideValue> Limits { get; private set; }`
* **Variance** (covariant & contravariant) = essentially polymorphism for generic types

### Versions

Credit: _Tech World With Milan Milanović_

* 2002.01. **C# 1.0** = initial version released with VS 2002
* 2005.11. **C# 2.0** = generics, anonymous methods, nullable types
* 2007.11. **C# 3.0** = lambda expression, extension methods, anonymous types, var
* 2010.04. **C# 4.0** = dynamic, delegate, variance, named args
* 2012.08. **C# 5.0** = async
* 2015.07. **C# 6.0** = string interpolation, null condition operator
* 2017.03. **C# 7.0** = tuples, ref locals, pattern matching
  * **C# 7.1** to **C# 7.3** = async main, `Span<T>`
* 2019.09. **C# 8.0** = nullable ref-types, async streams, using declarations
* 2020.11. **C# 9.0** = init-only props, records, with-expressions
* 2021.11. **C# 10.0** = record structs, global usings
* 2022.11. **C# 11.0** = file-scoped types, required members, auto-default structs

### Keywords

* `abstract` = interface-like, but the class can contain methods that are implemented (non-abstract). The class must be abstract if it contains one abstract member. Abstract members must be overriden in children. See <https://msdn.microsoft.com/en-us/library/sf985hc5.aspx>, <http://stackoverflow.com/questions/747517/interfaces-vs-abstract-classes>, <http://forums.asp.net/t/1411490.aspx?Can+the+C+Abstract+Methods+have+Implementation+>
* `checked` = check overflow that the compiler misses (i.e. addition with variable arguments)
* `constant` = can only be initialized at declaration (=> static compile time)
* `default`
  * Either a [default value](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/default-values) for a given type (either as an operator `default(int?)` or a literal `int? i = default`)
  * Or a means to distinguish which one of two methods with same name to override (derived method with `where T : default` means overriding the method without `where` constraints in the base class)
* `dynamic` = disable compile-time type checking
  * Usually a code smell but can be used for objects with common members instead of a full-fledged polymorphic solution (for quick prototyping or handling legacy code)
* `implicit` = implicit casting operator (use a Type in place of another, with automatic casting). The operator implementation defines how the source type is transformed into the (local class) destination Type, typically by calling one of its constructor
* `in` = readonly reference parameter entering a method
* `interface` = interface members must be implemented `public`ly (prefer interfaces over abstract classes)
* `internal` = accessible only within same assembly
* `lock` = only lock on a private (static or not) object, and avoid locking on the current object instance (ie don't use _this_)
* `new` = redefines a method in a child class. See <https://msdn.microsoft.com/en-us/library/ms173153.aspx>
* `operator` = operators overload
* `out` = reference parameter exiting a method
* `override` = overrides a method in a child class. You cannot override non-virtual methods.
* `private` = default access modifier. See <http://stackoverflow.com/questions/2521459/what-are-the-default-access-modifiers-in-c>
* `readonly` = can only be initialized at declaration AND in constructors (=> at runtime)
* `ref` = reference parameter entering & exiting a method (needs the parameter to be initialized beforehand)
  * Useful even for reference types (see <http://stackoverflow.com/questions/961717/what-is-the-use-of-ref-for-reference-type-variables-in-c>)
* `sealed` = disable further inheritance of a class or overriding of a method (eg for Singleton classes)
* `static constructor` = initializes static data or do something only once. Run once before the first instance is constructed. See <https://msdn.microsoft.com/en-us/library/k9x6w0hc.aspx>
* `static readonly` = runtime constant (Can only be set at declaration or in static constructors)
* `T` = generic type parameter. Actually a **prefix** (eg `TKey`, `TValue`, `TKoko`) which is `T` (for **T**ype) by convention (but can be anything)
* `unsafe` = required on sections that use pointers in C#. Also must set compiler to run in unsafe mode.
* `using` = wrap `IDisposable` objects with a _using_ statement to ensure their proper automatic `Dispose()`-al
* `var` = type inference => lets the compiler figure out the type (note: still **strongly typed** ie at compile-time)
  * Value cannot be null and cannot be used at class-level (class variable) or method return type)
  * Eg. `var i = 5;` compiles/built into `int i = 5;` (checkable with ILSpy)
* `virtual` = marks a method in a parent class to be overriden in a child class. Methods are non-virtual by default. See <https://msdn.microsoft.com/en-us/library/9fkccyh4.aspx>
  * In C++, `virtual` avoids the multiple inheritance [dreaded diamond](https://www.cs.technion.ac.il/users/yechiel/c++-faq/mi-diamond.html)
* `where T:` = generic conditions
  * Values = `struct`, `class`, `IKoko<T>`, `KokoClass`, `new()` (meaning it must have a default constructor, let alone it also has to be a _reference_ type)
  * Multiple conditions = `where T : FirstCondition, SecondCondition`
  * Multiple generic type parameters `where TA : ConditionA where TB : ConditionB`
* `yield` = in an iterator, obtains the next value (`yield return koko` or `yield return await KokoAsync()`), or signals the iteration's end (`yield break`)
  * An iterator is an object that traverses a container (ie lists), ie a method returning `IEnumerable<T>`/`IAsyncEnumerable<T>`, or the method `IEnumerator<T> GetEnumerator` for classes implementing `IEnumerable<T>`
  * Successive yields are requested at each iteration within a `foreach` loop, or by calling `IEnumerator.MoveNext()`
  * Can be used eg as an "infinite production" method (on demand, à la Flutter builders/generators), since they're not necessarily iterated from start to finish; it's up to the consumer to know where to stop

### Operators

* `~` = bitwise complement
* `^` = bitwise xor
* `??` = null coalescing operator
* `.?` = safe navigation operator
* `&` and ``&&` can actually [both be used to join boolean expressions in condition](https://stackoverflow.com/a/4163509/3559724)
  * `&` can be used both for integer type operands for bitwise-AND, and for boolean operands logical-and, which is the same (eg `011` & `101` = `001`)
  * `&&` only operates on boolean operands, with the added property of short-circuiting upon the first _false_ statement

## Types

* Everything is an `Object` in .Net
* `enum MyEnum : byte {A, B, C};` = underlying type can be specified (byte, sbyte, short, ushort, int, uint, long, ulong)
* `Enum(GetValues(type))` = returns all the enum values as an Array
* `typeof(T)` vs `obj.GetType()` = compile time vs runtime type
* `Convert.ToByte(string? value, int fromBase)` = convert a string to an equivalent 8-bit unsigned integer in the given base (2, 8, 10, 16)
* Anonymous type eg. `var a = new {Name = "A", Score = 1};` => name will be generated e.g. ``f__AnonymousType0`2[System.String, System.Double]``

### Numbers

* `0b_1111_1000`
* `int` is a struct
* `byte` aka `System.Byte` = 8 bits unsigned (0 to 255), basically the shortest integer longer than a boolean bit
* `short` aka `System.Int16` = 16 bits integer (-32,768 to 32,767)

### System.String

* `CompareTo()` retrns an integer
* `Graphics.MeasureString(String, Font)` returns the size of a string in pixels in a given Font
* `ToString("0000")` displays a number on 4 positions with 0 filling)
* If two strings are equal, `GetHashCode()` returns the same value, however different string can return the same hash code (=> don't use it if unicity must be garanteed)
* Avoid hidden string allocations (e.g. `.ToLower()`) within a loop. Use `String.Compare()` for case-sensitive
* String is an Enumerable of chars (it inherits from `IEnumerable, IEnumerable<char>`) => `foreach(var c in text)`

### Dates

* `new DateTimeOffset(date, offset)`
* `DateTime.SpecifyKind()` = sets _DateTimeKind_ (Local, Unspecified, Utc) of a DateTime
* `DateTime|DateTimeOffset.ToLocalTime()`
* `DateTime|DateTimeOffset.ToUniversal()`
* `DateTime|DateTimeOffset.ToUTC()`
* `TimeZoneInfo.IsAmbiguous(DateTime date)`
* `TimeZoneInfo.IsDaylightSavingTime(DateTime date)`
* `TimeZoneInfo.Local.IsAmbiguousTime`
* `TimeZoneInfo.Local.IsAmbiguousTime(Convert.ToDateTime("2021-10-31T01:00Z"));` = true, string is UTC (thx to `Z`) but `ToDateTime()` loses tz/offset info (_Unspecified_ kind), and it's right on DST transition hour
* [Standard date/time format strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings)
* [Custom date/time format strings](https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings)
  * `DateTime.ToString("T")` => _12:34:56_ (note: only works if _T_ is the only character in the string format, otherwise it is considered a literal character 'T')
* `Z` in a date-time string stands for "Zulu time," which is a military/aviation term for Coordinated Universal Time (UTC), with no offset

### [Collections](http://geekswithblogs.net/BlackRabbitCoder/archive/2011/06/16/c.net-fundamentals-choosing-the-right-collection-class.aspx)

* `List<string> l = new List {"a", "b", "c"};` = add items syntactic sugar (notice not even `()`); works for any custom `Enumerable` collection with a public `Add()` method
* [`IEnumerable<T>`](https://learn.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1?view=net-8.0)
  * `GetNumerator()` = single mandatory method to implement (we can add more eg `Add()`, …)
  * `IEnumerable<T>` implements `IEnumerable` to remain compatible with methodes that iterate non-generic collections
  * [IEnumerable\<T> Extensions methods](https://learn.microsoft.com/en-us/dotnet/api/system.collections.generic.ienumerable-1?view=net-8.0#extension-methods)
* `ICollection<T>` = base class for generic collections (members eg `Count`, `IsReadOnly`, `Add(T)`, `Clear()`, `Contains(T)`, `CopyTo(T[], Int32)`, `GetEnumerator()`, `Remove(T)`)
* `ReadOnlyCollection<T>` = base class for a read-only collection

#### Arrays

* `string[] s = new string[3];`
* `string[] s = {"bleu", "rouge", "vert"};`
* `string [][] s = new string[2,3]`
* `string [,] s = new string[2,2];`
* Static method (`Clear()`, `Reverse()`, `Sort()`)

#### Generics

Modern collections are all generic (in the `System.Collection.Generics` namespace) ie strongly-typed and type-safe (no boxing/unboxing from/to `object`s), also easier/shorter to read.
In reality, it is syntactic sugar for a generated class with typed methods e.g. `List<Person>` compiles to a kind of `PersonList` class (of course with a more complex cmmpiler generated name) containing strongly-typed methods `Add(Person person)`, `AddRange(…)`, etc

* Associative (aka Key/Value)
  * `Dictionary<TKey,TValue>` = hash (_O(1)_)
  * `SortedDictionary<TKey,TValue>` = binary tree (_O(log(n)_) and items are sorted)
  * `SortedList<TKey,TValue>` = sorted array (_O(n)_ and items are sorted but little faster than `SortedDictionary` if more lookups and fewer inserts/deletes)
* Non-Associative
  * `List<T>` = contiguous array
  * `LinkedList<T>` = doubly-linked list
  * `HashSet<T>` = unordered collection of unique items => see `Dictionary<TValue,TValue>` (Hash)
  * `SortedSet<T>` = orderered collection of unique items => see `SortedDictionary<TValue,TValue>` (Binary tree)
  * `Stack<T>` = LIFO
  * `Queue<T>` = FIFO
* Binding & Events
  * `ObservableCollection<Type>`
* Concurrent (thread-safe collections)
  * `ConcurrentDictionary<TKey, TValue>` = dictionary
  * `ConcurrentQueue<T>` = FIFO (could be used to _consume_ asynchronsously; see <https://stackoverflow.com/a/12104071> - may be a code smell)
  * `ConcurrentStack<T>` = LIFO
  * `ConcurrentBag<T>` = unordered collection
  * `BlockingCollection<T>` = Producer-Consumer pattern with _blocking_ (hence the name) operations (`Add()`, `Take()`, `CompleteAdding()`)

#### Legacy

These are not generic (they're in the `System.Collection` namespace instead of `System.Collection.Generic` for all newer collections) and not type-safe because their items are `System.Object` => objects with inconsistent types can be inserted, for which a common ('polymorphic') treatment won't necessarily work. There is also the `System.Collections.Specialized` namespace for **Specialized Collections** (eg linked list dictionary), that also predates generic types.
Even if we define our custom type e.g. that has an `ArrayList` of `Person` that has method `Add(Person person)` => Type safe but, still, the conversion cost in time and memory is high between reference and value types (=> boxing of `int` & co is _slow_).

* [CollectionBase](https://learn.microsoft.com/fr-fr/dotnet/api/system.collections.collectionbase?view=net-7.0) = `abstract` base class for a strongly typed non-generic collection
* `ArrayList` (use `List<T>` instead) = list of objects; this is the type of the `InnerList` property for custom collections inheriting from `CollectionBase`
* `HashTable` (use `Dictionary<TKey,TValue>` instead) = dictionary of objects
* `SortedList` (use `SortedList<T>` instead)
* `Stack` (use `Stack<T>` instead)
  * Methods (`Push()`, `Pop()`, `Peek()`, `Clear()`, `CopyTo()`, `ToArray()`, `Contains()`, `GetEnumerator()`)
  * The initial capacity is the starting capacity of the new stack. Once current capacity is reached, the capacity is doubled. The default initial capacity is 10. Stack is not thread-safe.
* `Queue` (use `Queue<T>` instead)

### Delegates

Method reference (à la function pointer but with type safety), which can be used to pass methods as parameters.

* First define the delegate as a kind of method signature: `delegate string KokoDelegate(string s)`
* Then instantiate it by passing another method matching that signature: `Koko koko = new KokoDelegate(m);`, and finally call it `koko("abc");`
* Delegates are instrumental in events (handler format definition): `delegate void Handler(object sender, Args e);`
* They can also be one-lined with an anonymous method eg `delegate { Debug.WriteLine("Test"); }` (see [Anonymous method vs Lambda expression](https://stackoverflow.com/a/17709299))
* **Action** & **Function** (and more niche **Predicate**) are a set of delegates already defined by the framework for convenience (up to 16 parameters)
* [Multicast Delegates](https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/delegates/how-to-combine-delegates-multicast-delegates)
  * Multiple objects can be assigned to one delegate instance (via the `+`/`-` operators & the `Delegate.Combine()` invocation lists concatenation method)

### Events

An event is a special type of delegate that can hold references to multiple methods (event handlers) and invoke them in a multicast fashion when the event is triggered.
(GPT:) An event itself is an abstraction built on top of delegates to provide a safer and more controlled way to handle the publishing and subscribing of events in object-oriented programming

[Using events](https://learn.microsoft.com/fr-fr/dotnet/standard/events/how-to-raise-and-consume-events)

* The `EventHandler` (w/o args) or `EventHandler<TEventArgs>` _stock_ delegates cover the majority of usecases (but a custom delegate can be defined)
  * Eg `public event EventHandler Fired;` or in full: `private event EventHandler fired; public event EventHandler Fired { add {fired += value;} remove {fired -= value;} }`
  * Eg `public event EventHandler<KokoArgs> Fired;` with `KokoArgs` a custom POCO class inheriting from `EventArgs`
* Although non-conventional, we could even used other well-known stock delegates **Action** & **Function**
  * Eg `event Action<string> StuffBeingDoneSomething;`
* 'On' Firing method
  * `protected virtual void OnFired(KokoArgs e) { if (Fired != null) Fired(this, e); }` without thread-safety
  * `protected virtual void OnFired(KokoArgs e) { EventHandler<KokoArgs> handler = Fired; if (handler != null) handler(this, e); }` with thread-safety
    * In this case, a (reference) copy is made for thread-safety in case `Fired = null;` happens somewhere else in the code
    * also note that removing the last subscriber of an event (multicast delegate) does not make it null, so this only handles an original reference null assign
  * `protected virtual void OnFired(KokoArgs e) { Fired?.Invoke(this, e); }` short version
  * `protected virtual void OnFired() { Fired?. Invoke(this, EventArgs.Empty); }` without arguments
  * That method is marked as `protected virtual void` according to the Event Design Pattern, signaling derived classes can override it as wished
* Handling method matching the event signature (accepts the emitter/sender aka firing object as first parameter)
  * Definition `static void HandleFired(object sender, KokoEventArgs e) { … }` (first parameter is an _object_ so that the same handler can be called from different sources eg different GUI buttons)
  * Registration (multicast delegate) `Fired += HandleFired;` (or with a delegate `Fired += new Handler(HandleFired);` or lambda `Fired += (sender, e) => …`)
  * Naming convention eg in this case _HandleFired_ or _FiredHandle_ or _FiredHandler_
* [Avoid static events](https://stackoverflow.com/a/2789642)
* Sometimes, handlers must be unsubscribed manually (window owning treatment handler has closed) to avoid memory leaks (either via `koko.Fired -= HandleFired` or `koko.Fired = null;` nuclear option)

### Exceptions

* `catch` is not mandatory (eg `try {…} finally { /* logging: exit */ }`)
* `finally` = only for freeing up resources (or logging)
* `throw` = re-throw an exception, as if it was the line where the original error occured
  * Use `throw` instead of `throw e` (which loses the original stacktrace) when re-throwing
  * Exceptions thrown within a _catch_ still enters the associated _finally_ (see <https://stackoverflow.com/a/1555632>)
* **Custom exceptions**
  * override `ToString()` & `implicit` operator to provide serialization
  * implement 3 x constructors (parameter-less, message, message & innerException)
  * pass the innerException  when throwing it in order to maintain the exception tree & inner call stack
