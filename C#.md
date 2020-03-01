# C\#

C# Is good.

## Keywords

* `new` = Redefines a method in a child class. See <https://msdn.microsoft.com/en-us/library/ms173153.aspx>
* `override` = Overrides a method in a child class. You cannot override non-virtual methods.
* `virtual` = Marks a method in a parent class to be overriden in a child class. Methods are non-virtual by default. See <https://msdn.microsoft.com/en-us/library/9fkccyh4.aspx>
* `constant` = Can only be initialized at declaration (=> static compile time)
* `readonly` = Can only be initialized at declaration AND in constructors (=> at runtime)
* `static readonly` = Runtime constant (Can only be set at declaration or in static constructors)
* `static constructor` = Initializes static data or do something only once. Run once before the first instance is constructed. See <https://msdn.microsoft.com/en-us/library/k9x6w0hc.aspx>
* `sealed` = Disable further inheritance of a class or overriding of a method
* `unsafe` = Required on sections that use pointers in C#. Also must set compiler to run in unsafe mode.
* `ref/out` = Method parameter passing by reference. ref needs the parameter to be initialized beforehand. # Also useful for reference types (see <http://stackoverflow.com/questions/961717/what-is-the-use-of-ref-for-reference-type-variables-in-c>)
* `abstract` = Interface like, but the class can contain methods that are implemented (non-abstract). The class must be abstract if it contains one abstract member. Abstract members must be overriden in children. See <https://msdn.microsoft.com/en-us/library/sf985hc5.aspx>, <http://stackoverflow.com/questions/747517/interfaces-vs-abstract-classes>, <http://forums.asp.net/t/1411490.aspx?Can+the+C+Abstract+Methods+have+Implementation+>
* `checked` = Check overflow that the compiler misses (i.e. addition with variable arguments)
* `internal` = Accessible only within same assembly
* `private` = Default access modifier. See <http://stackoverflow.com/questions/2521459/what-are-the-default-access-modifiers-in-c>
* `throw` = Re-throw an exception, as if it was the line where the original error occured. If done in a _catch_, execution will still go to the _finally_ after (see <https://stackoverflow.com/a/1555632>).
* `interface` = Interface members must be implemented publicly ("public").
* `async` = Defines an asynchronous method, that returns a Task\<T> (hopefully) immediately and whose actual result will be available later.
    await   # Suspends current context, to retrieve the actual result of an asynchronous operation (i.e. of a Task).
            # In the meantime, yields control back to caller.
* `operator` = Operators overload
* `implicit` = Implicit casting operator (use a Type in place of another, with automatic casting). The operator implementation defines how the source type is transformed into the (local class) destination Type, typically by calling one of its constructor
* `delegate` = Defines a method signature, which is instrumental in events (handler format definition) and passing methods as parameter (wherein other languages, we'd use function pointers).
  * `delegate void Handler(object sender, Args e);`
  * The type can also be used purely as a method reference (pointer): `Handler handler = new Handler(this.MethodWithHandlerParameters); handler(this, args);`
* `event` = Defines an event, based on a delegate type.
  * `event Handler StuffHappens;`                     // Uses delegate defined above as handler => a method reacting to the event needs to implement the handler signature.
  * `event Action<string> StuffBeingDoneSomething;`   // Action is a delegate predefined by the framework for a method without return type. Function is a method with input/output.
  * Handler registration: `this.control.StuffHappens += new Handler(this.MethodWithHandlerParameters);`. The += operator is _multicast_ delegate => we can register as many handlers as we want.
  * The handler method is declared preferably as **protected virtual**, and accepts the firing object (emitter) as first parameter.
  * Firing the event: `if(this.StuffHappens != null) this.StuffHappens(this, args);`

### Operators

* `??`  # Null coalescing operator
* `.?`  # Safe navigation operator

## Types

* Environment
  * Static Methods & Properties (`Environment.GetFolderPath()`, `Environment.SpecialFolder.LocalApplicationData`)
* [DateTime Format](https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings)
  * `DateTime.ToString("T")` => 12:34:56 (only if T is the only character in the string format parameter, otherwise it is considered a literal character 'T')
* Enum
  * `enum MyEnum : byte {A, B, C};` = Specify the underlying type (byte, sbyte, short, ushort, int, uint, long, ulong)
* System.String
  * Methods (`CompareTo()`, `MeasureString()` returns the size of a string in pixels, `ToString("0000")` displays a number on 4 positions with 0 filling)
* Arrays
  * `string[] s = new string[3];`
  * `string[] s = {"bleu", "rouge", "vert"};`
  * `string [][] s = new string[2,3]`
  * `string [,] s = new string[2,2];`
  * Array static method (`Clear()`, `Reverse()`, `Sort()`)
* [Collections](http://geekswithblogs.net/BlackRabbitCoder/archive/2011/06/16/c.net-fundamentals-choosing-the-right-collection-class.aspx)
  * Associative
    * `Dictionary<TKey,TValue>`         # Hash. O(1)
    * `SortedDictionary<TKey,TValue>`   # Binary tree (O(log(n)) and sorted Items)
    * `SortedList<TKey,TValue>`         # Sorted array (O(n) and sorted Items but little than SD if more faster lookups for little insert/delete)
  * Non-Associative
    * `List<T>`         # Contiguous array
    * `LinkedList<T>`   # Doubly-linked list
    * `HashSet<T>`      # Unordered collection. Unique items => see Dictionary<TValue,TValue> (Hash)
    * `SortedSet<T>`    # Orderered collection. Unique items => see SortedDictionary<TValue,TValue> (Binary tree)
    * `Stack<T>`        # LIFO
    * `Queue<T>`        # FIFO
  * Original
    * `ArrayList`   # Use List\<T>
    * `HashTable`   # Use Dictionary<TKey,TValue>
    * `SortedList`  # Use SortedList\<T>
    * `Stack`       # Use Stack\<T>
      * Methods (Push(), Pop(), Peek(), Clear(), CopyTo(), ToArray(), Contains(), GetEnumerator())
      * The initial capacity is the starting capacity of the new stack. Once current capacity is reached, the capacity is doubled. The default initial capacity is 10. Stack is not thread-safe.
    * `Queue`       # Use Queue\<T>
  * Binding & Events
    * `ObservableCollection<Type>`
  * Concurrent (Thread-safe collections)
    * `ConcurrentDictionary`    # Dictionary
    * `ConcurrentQueue`         # FIFO
    * `ConcurrentStack`         # LIFO
    * `ConcurrentBag`           # Unordered collection
    * `BlockingCollection`      # Producer-Consumer

## Enumerable & LINQ

Enumerable.Any() is better than Enumerable.Count() > 0, because the latter has to count the full collection, whilst the former returns true ASAP.

## WCF

When adding a service reference in a Visual Studio solution, we can override the service configuration created by Visual Studio.
by providing the name of the endpoint that contains an alternate configuration when the service client is constructed in the code.
    var service = new RemoteWebServiceClient("MyEndpoint"); // Will use the configuration defined in web.config and not the service reference parameters.

Useful tool to test web service APIs: <C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\WcfTestClient.exe>.

### Troubleshooting

* AppSettings> must be 1st section in App/Web.config.
* Sometimes, must RE-build dependant projects of projects whose resources have been modified.
* Missing Method setter => Old DLL to re-deploy <http://stackoverflow.com/questions/12745985/c-method-not-found-exception-setter-missing>.

## Misc

Private Setter properties => acts as a private variable (can only be set within), but publicily read-only.

    public ILimits<SimpleOverrideValue> Limits { get; private set; }
