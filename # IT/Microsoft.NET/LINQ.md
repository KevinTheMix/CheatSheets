# LINQ (Language Integrated Query)

Linq is a library (`System.Linq`) that provides a series of (mostly) extensions methods (called **query operators**) that apply to sequences.

There are two main classes in the `System.Linq` namespace: `Enumerable` & `Queryable`.
`Enumerable` methods take in a _delegate_ and returns an **iterator** (inheriting from `IEnumerable<T>`) holding a reference to the previous **iterator** in the Linq chain if there is one.
`Enumerable` methods execute in memory.
`Queryable` methods take in an **expression** and returns an object (inheriting from `IQueryable<T>`) holding the updated expression tree, whose runtime type depends on the data source and **provider** used.
`Queryable` methods construct expressions representing instructions as data structure rather than code and can be later be translated into SQL query **to be executed on the DB server**.
Both `Enumerable` & `Queryable` methods are _deferred_, meaning they are never run immediately but only when a result is needed (eg a `ToList()` or a _foreach_ statement).

The beauty of Linq is that the same **lambda expression is converted into either a delegate or an expression tree depending on the context**.
For instance, in this example at <https://benjii.me/2018/01/expression-projection-magic-entity-framework-core/#reusing-projections>, the _Projection_ property is of type `Expression<Func<a,b>>` (an expression) but it would compile just as well with the same exact body (returning a lambda) if its type was changed to simply `Func<a,b>` (a delegate).

## Glossary

* `Enumerable` = defines methods for `System.Collections.Generic.IEnumerable<T>`
  * **ParallelEnumerable** = parallel equivalent of `Enumerable`
  * **Iterator** = an object named _Something_`Iterator` (eg `WhereEnumerableIterator`; and inheriting from `IEnumerable<T>`) returned by a query operator
* [Fluent & Query Syntaxe](https://stackoverflow.com/questions/214500/fluent-and-query-expression-is-there-any-benefits-of-one-over-other)
  * **Fluent Syntax** = chained methods
  * **Query Syntax** = SLQ-like
* `Queryable` = defines methods for `IQueryable<T>` (in the Linq namespace)
  * `IQueryable<T>` (inherits from `IEnumerable<T>`) = holds the (combined) **Expression** (tree) & **Provider** properties, implemented by eg: EF's (`DbContext`'s) `DbSet<T>`
  * `IQueryable` (inherits from `IEnumerable`) = holds the (combined) **Expression** (tree) & **Provider** properties, implemented by **providers** (but not by `Queryable`)
  * [Expression (trees)](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/expression-trees) = represents code in a tree-like data structure (ie instead of IL)
    * Expression provide flexibility because the tree can be traversed in various ways (see Provider)
  * **Provider** = implements `IQueryProvider` & `IQueryable` for a particular data store, and performs the visit of an Expression tree when its `Execute()` method is launched
    * `IQueryProvider` = exposes the `IQueryable<T> CreateQuery<T>(expression)` (called by each successive **query operator** in the chain, and building the expression tree) & ultimate `T Execute<T>(expression)` methods
    * Since the Provider is a separate object from `IQueryable`, different [visitors](https://en.wikipedia.org/wiki/Visitor_pattern#C#_example) can browse the same expression with varying outputs
    * In the case of _Linq to SQL_ and _EF_, the Provider visits the tree to produces a SQL query, that is passed to the SQL Server where it gets executed
* **Query Operator** = a Linq extension method such as `Select()`, `Where()`
  * Similarly named query operators exist in both `Enumerable` & `Queryable` (but they don't overlap 1:1)

## Links

* [Linq - Query Operators](https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/standard-query-operators-overview)
* [Microsoft - Lambda Expressions vs Anonymous Methods](https://docs.microsoft.com/fr-be/archive/blogs/ericlippert/lambda-expressions-vs-anonymous-methods-part-one)
* [Ben Cull - Expression & Projection Magic for EF Core](https://benjii.me/2018/01/expression-projection-magic-entity-framework-core)
* [Jon Skeet - Edulinq](https://codeblog.jonskeet.uk/category/edulinq/)
* [Luke McGregor - LinqExpander](https://github.com/lukemcgregor/LinqExpander)
* [Matt Warren - Buidling an IQueryable Provider (Part 1)](https://blogs.msdn.microsoft.com/mattwar/2007/07/30/linq-building-an-iqueryable-provider-part-i)
* [Matt Warren - Buidling an IQueryable Provider (Part 2)](https://blogs.msdn.microsoft.com/mattwar/2007/07/31/linq-building-an-iqueryable-provider-part-ii)
* [StackOverflow - How LINQ works internally](https://stackoverflow.com/a/671425)
* [StackOverflow - IEnumerable vs IQueryable (anonymous method & expression tree)](https://stackoverflow.com/a/2433386)
* [StackOverflow - IEnumerable vs IQueryable (input parameters)](https://stackoverflow.com/a/28513685)
* [StackOverflow - IEnumerable vs IQueryable (return types)](https://stackoverflow.com/a/16180410)
* [StackOverflow - IEnumerable vs IQueryable (IQueryable-only properties](https://stackoverflow.com/a/252857) = (Expression & Provider)
* [StackOverflow - AsEnumerable() vs AsQueryable()](https://stackoverflow.com/a/17996264)
* [StackOverflow - What is a LINQ provider?](https://stackoverflow.com/a/1568054)
* [StackOverflow - Lambdas vs Delegates](https://stackoverflow.com/questions/73227/)
* [StackOverflow - Function vs Lambda](https://softwareengineering.stackexchange.com/a/130731)
* [StackOverflow - Dialects of LINQ](https://stackoverflow.com/a/2443847)
  * [LINQ to Objects (L2O)](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/linq-to-objects) = vanilla LINQ on `IEnumerable`/`IEnumerable<T>`
  * [LINQ to XML](https://learn.microsoft.com/en-us/dotnet/standard/linq/linq-xml-overview) = in-memory XML programming interface
  * [LINQ to SQL](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/sql/linq) = SQL Server/ADO.NET (in .NET Framework 3.5)
  * [LINQ to Entities](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/ef/language-reference/linq-to-entities) = Entity Framework
  * [LINQ to DataSets](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/queries-in-linq-to-dataset) = manipulating ADO.NET DataTable/DataSet (old fashion)

## Code

### API

* `Any<T>([Func])` = always faster than `Enumerable.Count() > 0`, because the latter has to count the full collection, whilst the former returns true ASAP
* `Enumerable.GroupBy()` = groups the elements of a sequence, with deferred execution
* `Enumerable.ToDictionary()` = maps one key -> one value (1:1)
* `Enumerable.ToLookup()` = maps one key -> n values (1:n), immediately (not deferred), querying a key that does not exist returns an empty sequence (w/o error)
* `Enumerable.Empty<T>()` (not an extension) = returns an empty (but non-null) `IEnumerable<T>` (actually a `System.Linq.EmptyEnumerable<T>`) that yields 0 elements
  * More efficient than instantiating & returning a new `List<T>()`
* `AsEnumerable()` = changes the compile type to `IEnumerable<T>`, usually applied on an `IQueryable` to use the L2O methods `Queryable` does not offer
  * `AsEnumerable()` can be used instead of `ToList()` when deferred execution is to be preserved
  * `AsEnumerable()` can also be applied on an `IGrouping` (eg resulting from some kind of `GroupBy(…).First(…)`)
* `AsQueryable()` = cast or convert the compile type to `IQueryable`
  * [StackOverflow - Uses of AsQueryable](https://stackoverflow.com/a/20379242)
  * If the sequence implements `IQueryable`, it is simply cast, otherwise, a conversion takes place by wrapping it in a `ConstantExpression` referred to in a returned `EnumerableQuery`
  * `EnumerableQuery<T>` = represents an `IEnumerable<T>` as a `IQueryable<T>` (note: Microsoft code, not intended for developers)
  * `ConstantExpression` = an expression (inherits from `System.Linq.Expressions.Expression`) that has a constant value (eg `Expression.Constant(777.0);`)
* `Queryable.Skip(i)` = returns the _n-i_ last elements, enables efficient paging (only those rows are returned from DB)
* `Queryable.Take(i)` = returns the _i_ first elements, enables efficient paging (only those rows are returned from DB)

### Samples

* Remove duplicates = `people.GroupBy(p => p.Name).Select(g => g.First()).ToList()` (same logic as SQL partitions!)
