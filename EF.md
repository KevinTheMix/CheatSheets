# EF

## Database Context

It is a class inheriting from DbContext where the Fluent API is used to describe the DB data structure (in conjonction with data annotations attributes placed on the domain model classes & properties).
The Database Context holds the collections corresponding to the DB tables in the form of Properties of type DbSet&lt;T&gt;.

## Data Mapping

* 1 to N: HasMany(p => p.Courses).WithRequired(c => c.Professor).HasForeignKey(c => c.ProfessorId)
* N to 1: HasRequired(c => c.Professor).WithMany(p => p.Courses).HasForeignKey(c => c.ProfessorId)
* N to N: HasMany(s => s.Course).WithMany(c => c.Student).Map(sc => Left & Right)
 ** See <https://www.entityframeworktutorial.net/code-first/configure-many-to-many-relationship-in-code-first.aspx>
 ** Alternatively using an association table going 1 to N both ways allows more control over the association (additional technical columns, etc.).

## Expression

Expressions are a way to represent an operation in the form of data (a tree) instead of IL code (like a method).
This gives flexibility because the tree can be traversed in various ways, by different implementations of the Visitor Pattern.
It is the Provider that performs the visit of the Expression tree, when its Execute() method is launched.
In the case of EntityFramework, the Provider visits the tree to produces a SQL query, that is passed to the SQL Server where it gets executed.

## LINQ

Linq defines extension methods on two types of objects: IEnumerable&lt;T&gt; or on IQueryable&lt;T&gt; objects.
Note that whilst both use deferred execution, IEnumerable Query Operators take in delegate Function&lt;&gt; whereas IQueryable Query Operators take in Expressions as parameters.
The beauty of it is that they both work using similar code because lambda expressions are converted either into delegates or expression trees depending on the context.
See <https://stackoverflow.com/a/671425> for LINQ internals
See <https://stackoverflow.com/a/28513685> for Linq IEnumerable/IQueryable symmetry

For IEnumerable objects, chained Linq query operators construct a specialized IEnumerable instance (called Select/Where/etc. -Iterator) via polymorhpism containing a nested hierarchy of functions. Each successive call adds a level on top holding a reference to the level below.
For IQueryable obejcts, chained Linq query operators construct an IQueryable instance. Each successive call adds an Expression on top, keeping the same Provider.
See <https://stackoverflow.com/a/2433386> for different IEnumerable or IQueryable parameters

IQueryable inherits from IEnumerable.
Both Query Providers and Expressions are properties specific to IQueryable.
See <https://stackoverflow.com/a/252857> for IQueryable specific properties (Expression & Provider)
The **AsQueryable()** method casts an Enumerable to a Queryable
See <https://stackoverflow.com/a/252789> for all possible conversions from/to IEnumerable

IEnumerable executes in memory, wheres IQueryable executes (& filters) on the DB server.
See <https://stackoverflow.com/a/2876655> for Linq to SQL performance thanks to DB execution thanks to Expression SQL translation
Same <https://www.quora.com/What-is-the-main-difference-between-IEnumerable-and-IQueryable-in-c>

### Query Operators

See <https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/standard-query-operators-overview>

## IQueryable

DbContext's DbSet&lt;T&gt;'s inherit from IQueryable.

An IQueryable is a class that contains:

* the resulting Expression tree
* the type of elements (T in IQueryable&lt;T&gt;)
* the Provider that produces the successive IQueryable and will run the final Expression

    public interface IQueryable : IEnumerable
    {
        Expression Expression { get; }
        Type ElementType { get; }
        IQueryProvider Provider { get; }
    }

See <https://blogs.msdn.microsoft.com/mattwar/2007/07/30/linq-building-an-iqueryable-provider-part-i/>

## IQueryProvider

The Provider is a factory of IQueryable based on a given Expression.
It is also the visitor that can execute a given Expression.
The fact that the Provider is a separate object from the IQueryable means that we can use polymorphism and different visitors with varying execution results.

    public interface IQueryProvider
    {
        IQueryable CreateQuery(Expression expression);
        IQueryable<TElement> CreateQuery<TElement>(Expression expression);
        object Execute(Expression expression);
        TResult Execute<TResult>(Expression expression);
    }

Query Operators such as Where(), etc. call the Provider.CreateQuery() to return an IQueryable containing the Expression now augmented with the treatment of the current operator, while maintaining a reference to that Provider, whose Execute() will be called in the end.

See <https://blogs.msdn.microsoft.com/mattwar/2007/07/31/linq-building-an-iqueryable-provider-part-ii/>

## Projections

See <https://benjii.me/2018/01/expression-projection-magic-entity-framework-core/>