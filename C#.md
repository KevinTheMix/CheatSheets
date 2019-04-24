# C\#

C# Is good.

## Keywords

    New/Override/Virtual (methods are non-virtual by default. You cannot override non-virtual method)
    <https://msdn.microsoft.com/en-us/library/ms173153.aspx>
    <https://msdn.microsoft.com/en-us/library/9fkccyh4.aspx>
    constant    # Can only be initialized at declaration (=> static compile time)
    readonly    # Can only be initialized at declaration AND in constructors (=> at runtime)
    static readonly     # aka Runtime constant (Can only be set at declaration or in static constructors)
    static constructor  # Initializes static data or do something only once
                        # Run once before the first instance is constructed
                        # https://msdn.microsoft.com/en-us/library/k9x6w0hc.aspx
    sealed              # Disable further inheritance of a class or overriding of a method
    unsafe             # Required on sections that use pointers in C#. Also must set compiler to run in unsafe mode.
    ref/out     # Method parameter passing by reference. ref needs the parameter to be initialized beforehand.
                # Also useful for reference types (http://stackoverflow.com/questions/961717/what-is-the-use-of-ref-for-reference-type-variables-in-c)
    abstract    # Interface like, but the class can contain methods that are implemented (non-abstract).
                # The class must be abstract if it contains one abstract member. Abstract members must be overriden in children.
                # See https://msdn.microsoft.com/en-us/library/sf985hc5.aspx
                # See http://stackoverflow.com/questions/747517/interfaces-vs-abstract-classes
                # See http://forums.asp.net/t/1411490.aspx?Can+the+C+Abstract+Methods+have+Implementation+
    checked     # Check overflow that the compiler misses (i.e. addition with variable arguments)
    internal    # Accessible only within same assembly
    private     # Default access modifier
                # See http://stackoverflow.com/questions/2521459/what-are-the-default-access-modifiers-in-c

### Operators

    ??  # Null coalescing operator
    .?  # Safe navigation operator

## Bool

    bool?   # Nullable

## String

Regular "Hello" and @"Verbatim"

## Enum

    enum Name {A, B, C};
    enum Name {A=1, B, C};      # Starts at 0 by default
    enum Name : byte {A, B, C}; # Underlying type (byte, sbyte, short, ushort, int, uint, long, ulong)

## Collections

<http://geekswithblogs.net/BlackRabbitCoder/archive/2011/06/16/c.net-fundamentals-choosing-the-right-collection-class.aspx>

### Associative

    Dictionary<TKey,TValue>         # Hash. O(1)
    SortedDictionary<TKey,TValue>   # Binary tree (O(log(n)) and sorted Items)
    SortedList<TKey,TValue>         # Sorted array (O(n) and sorted Items but little than SD if more faster lookups for little insert/delete)

### Non-Associative

    List<T>         # Contiguous array
    LinkedList<T>   # Doubly-linked list
    HashSet<T>      # Unordered collection. Unique items => see Dictionary<TValue,TValue> (Hash)
    SortedSet<T>    # Orderered collection. Unique items => see SortedDictionary<TValue,TValue> (Binary tree)
    Stack<T>        # LIFO
    Queue<T>        # FIFO

### Original

    ArrayList   # Use List<T>
    HashTable   # Use Dictionary<TKey,TValue>
    SortedList  # Use SortedList<T>
    Stack       # Use Stack<T>
    Queue       # Use Queue<T>

### Binding & Events

    ObservableCollection<Type>

### Concurrent

Thread-safe

    ConcurrentDictionary    # Dictionary
    ConcurrentQueue         # FIFO
    ConcurrentStack         # LIFO
    ConcurrentBag           # Unordered collection
    BlockingCollection      # Producer-Consumer

### Enumerable & LINQ

Enumerable.Any() is better than Enumerable.Count() > 0, because the latter has to count the full collection, whilst the former returns true ASAP.

## OO

### Namespaces

    namespace Namespace {}

### Classes

    [accessibility] Class {}

### Members

    # Constructor + Property set
    User user = new User() { Name = "Koko", LastName = "Kontan" };

    # One-line get/set
    public string Name { get; set; }

## Events

Delegate defines the signature required by all methods able to deal with the event, i.e. a function pointer definition.

    delegate void Handler(object sender, Args e);

Event definition based on a delegate type.

    event Handler StuffHappens;                     // Delegate handler
    event Action<string> StuffBeingDoneSomething;   // Action is a delegate for a method without return type.

A method whose signature matches the Handler's.

    private void MethodWithHandlerParameters(object sender, Args e) {[treatment]}

Constructing a handler from the method and calling it (invokes the method), i.e. a function pointer instance

    Handler handler = new Handler(this.MethodWithHandlerParameters);
    handler(this, args);

Effectively registering our method to react to the Event.
Note that even though we use the += operator, we can only register one handler.
Use that handler to call additional methods if need be.

    this.control.StuffHappens += new Handler(this.MethodWithHandlerParameters);

Launching the event

    if(this.StuffHappens != null) this.StuffHappens(this, args);

# IT ------------------------------------------------------------------------------------------------------------
## C#
Correct cheatsheet: event += is multicast delegate and not a single handler!
Interface members must be implemented publicly ("public")

## Types
DateTime.ToString("T") => 12:34:56 (only if T is the only character in the string format parameter, otherwise considered a literal character 'T')

## WS
Useful tool to test web service APIs
	C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\WcfTestClient.exe

When adding a service reference in a Visual Studio solution, we can override the service configuration created by Visual Studio
by providing the name of the endpoint that contains an alternate configuration when the service client is constructed in the code.
	var service = new RemoteWebServiceClient("MyEndpoint"); // Will use the configuration defined in web.config and not the service reference parameters.

## Threading

	async	# Defines an asynchronous method, that always returns a Task<T> (that is returned immediately on async method call)
	await	# Suspends current context, to retrieve the actual result of an asynchronous operation (i.e. of a Task).
			# In the meantime, yields control back to caller.	

## WPF
### Markup Extension
x:Key		# E.g. define and then refers to a resource in the XAML (Dictionary Key)
x:Name 		# Defines a name for a control that can be accessed from Code-behind or binded in XAML via ElementName
x:Static 	# Referes to static data (e.g. SystemColors Enum value)
x:Type		# Equivalent to C# typeof. Used in ControlTemplate.TargetType
			# 	<ControlTemplate x:Key="[TemplateName]" TargetType="{x:Type [Type]}">
			#	=> All controls of type [Type] are displayed using the new template
			
			# Unless the template is referred to explicitly by x:Key (see https://msdn.microsoft.com/en-us/library/system.windows.controls.controltemplate.targettype%28v=vs.110%29.aspx)
			# 	<ControlTemplate x:Key="[TemplateName]" TargetType="[Type]">
			#	=> Applying the template to a specific control e.g. <Element Template="{StaticResource [TemplateName]}" />)

### Converters
Convert (case insensitive) strings into values of expected types

	MyConverter : TypeConverter

### Binding
Path			# Must point to a public property, not a public variable
RelativeSource	# Refers to an element relative to the one in which the binding is called. Can even bind to Self e.g. to display its current Width as Text.
				# Default attribute is "Mode" (e.g. "Self", "FindAncestor", "PreviousData", "TemplatedParent")

### Troubleshooting
	Converter must be a StaticResource, not a string
	DataContext in a (Data) Template must go up one level
		- using specific Element: ElementName=[Element], Path=DataContext.[Property]
		- going back to root DataContext: <Element [Property]="{Binding RelativeSource={RelativeSource AncestorType=UserControl, Mode=FindAncestor}, Path=DataContext.[Property]}">
	XML xmlns Namespace => Don't specify Assembly if the namespace is located in the local assembly
	<AppSettings> must be 1st section in App/Web.config
	Sometimes, must RE-build dependant projects of projects whose resources have been modified
	Missing Method setter => Old DLL to re-deploy http://stackoverflow.com/questions/12745985/c-method-not-found-exception-setter-missing