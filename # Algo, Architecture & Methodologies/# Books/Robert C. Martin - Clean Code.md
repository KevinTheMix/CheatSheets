# Clean Code

## Chapter 2: Meaningful Names

When constructors are overloaded, use static factory methods with names that describe the arguments.
For example,

    Complex fulcrumPoint = Complex.FromRealNumber(23.0);
  
is generally better than

    Complex fulcrumPoint = new Complex(23.0);

## Chapter 3: Functions

If your function must change the state of something, have it change the state of its owning object.

    report.appendFooter();

(...) it is better to extract the bodies of the try and catch blocks out into functions of their own.
    
	try { SingleMethod(); } catch { HandleError(); }

Error Handling is one thing!

    Method() { try{} catch {} }	# Only try-catching (nothing before/after).
  
Open-Closed Principle (OCP) = use inheritance to extend/create new, but don't add/modify existing b/c that impacts running code.
Visitor pattern = one way to follow OCP

## Chapter 5: Formatting

"communication is the professional developer's first order of business"
"Your style and discipline survives, even though your code does not"

"(...) the caller [function] should be above the callee" (unlike C/C++ where declaration/definition has to come first)
=> nice flow down the source code module from high level to low level

"The length of the list of declarations in FitNesseExpediter below suggests that this class should be split up"
=> Length = indication of mess

## Chapter 6: Object & Data Structures

Data Structure = Contract Member (+ separate Domain class for business logic)
Object = OO, polymorphic, Hides data, Contains its behavior (business logic)

Use Wrappers around 3rd party to reduce dependencies, funnel exceptions into one, create the API we want to use

## Chapter 7: Error Handling

Special case pattern = use child class to handle abnormal case (such as missing/unknown) instead of null => polymorphic method encapsulates special return value

Return empty collections over null (see IEnumerable<>.Empty())
Never pass null to a function

Immutability in C# = readonly

## Chapter 8: Boundaries

Resume at p.146
