# LINQ

Stands for Language Integrated Query.

LINQ defines extension methods on two types of objects: IEnumerable&lt;T&gt; or on IQueryable&lt;T&gt; objects.
Note that whilst both use deferred execution, IEnumerable Query Operators take in delegate Function&lt;&gt; whereas IQueryable Query Operators take in Expressions as parameters.
The beauty of it is that they both work using similar code because lambda expressions are converted either into delegates or expression trees depending on the context.
See <https://stackoverflow.com/a/671425> for LINQ internals
See <https://stackoverflow.com/a/28513685> for LINQ IEnumerable/IQueryable symmetry

For IEnumerable objects, chained LINQ query operators construct a specialized IEnumerable instance (called Select/Where/etc. -Iterator) via polymorhpism containing a nested hierarchy of functions. Each successive call adds a level on top holding a reference to the level below.
For IQueryable obejcts, chained LINQ query operators construct an IQueryable instance. Each successive call adds an Expression on top, keeping the same Provider.
See <https://stackoverflow.com/a/2433386> for different IEnumerable or IQueryable parameters

IQueryable inherits from IEnumerable.
Both Query Providers and Expressions are properties specific to IQueryable.
See <https://stackoverflow.com/a/252857> for IQueryable specific properties (Expression & Provider)
The **AsQueryable()** method casts an Enumerable to a Queryable
See <https://stackoverflow.com/a/252789> for all possible conversions from/to IEnumerable

IEnumerable executes in memory, wheres IQueryable executes (& filters) on the DB server.
See <https://stackoverflow.com/a/2876655> for LINQ to SQL performance thanks to DB execution thanks to Expression SQL translation
Same <https://www.quora.com/What-is-the-main-difference-between-IEnumerable-and-IQueryable-in-c>

[How LINQ works internally](https://stackoverflow.com/a/671425)
[Jon Skeet Edulinq](https://codeblog.jonskeet.uk/category/edulinq/)
[Difference between a Function and a Lambda](https://softwareengineering.stackexchange.com/a/130731)
[Difference between Lambdas and Delegates](https://stackoverflow.com/questions/73227/)
[Lambda Expressions vs Anonymous Methods](https://docs.microsoft.com/fr-be/archive/blogs/ericlippert/lambda-expressions-vs-anonymous-methods-part-one)

## Components

### Expression (Tree)

Expressions are a way to represent an operation in the form of data (a tree) instead of IL code (like a method).
This gives flexibility because the tree can be traversed in various ways, by different implementations of the Visitor Pattern.
It is the Provider that performs the visit of the Expression tree, when its Execute() method is launched.
In the case of EntityFramework, the Provider visits the tree to produces a SQL query, that is passed to the SQL Server where it gets executed.

[Projection](https://benjii.me/2018/01/expression-projection-magic-entity-framework-core/)
[Expression Trees](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/expression-trees/)

### Query Operators

[Standard Query Operators Overview](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/standard-query-operators-overview)

Query Operators such as Where(), etc. call the Provider.CreateQuery() to return an IQueryable containing the Expression now augmented with the treatment of the current operator, while maintaining a reference to that Provider, whose Execute() will be called in the end.

### [Provider](https://stackoverflow.com/a/1568054)

[Part 1](https://blogs.msdn.microsoft.com/mattwar/2007/07/30/linq-building-an-iqueryable-provider-part-i/)
[Part 2](https://blogs.msdn.microsoft.com/mattwar/2007/07/31/linq-building-an-iqueryable-provider-part-ii/)

The Provider is a factory of IQueryable based on a given Expression.
It is also the visitor that can execute a given Expression.
The fact that the Provider is a separate object from the IQueryable means that we can use polymorphism and different visitors with varying execution results.

```C#
public interface IQueryProvider
{
    IQueryable CreateQuery(Expression expression);
    IQueryable<TElement> CreateQuery<TElement>(Expression expression);
    object Execute(Expression expression);
    TResult Execute<TResult>(Expression expression);
}
```


### IQueryable

DbContext's DbSet&lt;T&gt;'s inherit from IQueryable.

An IQueryable is a class that contains:

* the resulting Expression tree
* the type of elements (T in IQueryable&lt;T&gt;)
* the Provider that produces the successive IQueryable and will run the final Expression

```C#
public interface IQueryable : IEnumerable
{
    Expression Expression { get; }
    Type ElementType { get; }
    IQueryProvider Provider { get; }
}
```

## Links
