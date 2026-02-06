# Entity Framework

## Quick Tips

* Inject DbContext it as _Scoped_ ie existing during entire single web request, or as _Pooled_ via **AddDbContextPool**
* EF Core supports various underlying DBs (OOB or via packages, eg SQL Server/PostgreSQL (via Npgsql)/MySQL/SQLite/Cosmos DB/etc) so we can write C# DbContext/LINQ code once and use any supported DB

## Glossary

* **DbContext** = main class to interact with DB in EF Core, acts as a Unit Of Work pattern, represents a session with DB (tables definition via DbSet, LINQ querying, tracking/saving changes, configuration eg connection strings)
* **ObjectContext** = represents a connection between the CLR & the DB (for CRUD operations)
* **DbFunctions** = CLR (DateTime/Numbers/String manipulation) methods to be executed on (`IQueryable`) `DbContext` or `ObjectContext` entities (Linq to Entities queries)
  * They are executed as **CLR code at the DB-level, not in memory**
* **DbSet** = code-side entity, acts as a Repository pattern
  * `DbSet<T>` = a `DbContext` property that inherits from `IQueryable<T>`
* **Navigation Properties** = preferred way to handle tables relationship

## Database Context

It is a class inheriting from DbContext where EF's [Fluent API](https://docs.microsoft.com/en-us/ef/ef6/modeling/code-first/fluent/types-and-properties) is used to describe the DB data structure (in conjonction with data annotations attributes placed on the domain model classes & properties) and ultimately map the tables (fields) to entities (attributes).
The Database Context holds the collections corresponding to the DB tables in the form of Properties of type `DbSet<T>`.

## Data Mapping

Associated entities must have cross-properties.
Example:

    ProfessorId + Professor instance (in Classroom)
    ICollection<Course> (in Professor)

Then, the mapping in the Database Context defines the link through which they'll get handled.

* 1 to N: HasMany(p => p.Courses).WithRequired(c => c.Professor).HasForeignKey(c => c.ProfessorId)
* N to 1: HasRequired(c => c.Professor).WithMany(p => p.Courses).HasForeignKey(c => c.ProfessorId)
* N to N: HasMany(s => s.Course).WithMany(c => c.Student).Map(sc => Left & Right)
  * See <https://www.entityframeworktutorial.net/code-first/configure-many-to-many-relationship-in-code-first.aspx>
  * Alternatively using an association table going 1 to N both ways allows more control over the association (additional technical columns, etc.).

Cyclical references should be avoided by design (by making references unidirectional), as entities inheriting from PersistEntity cannot use the [DataContract(IsReference=true)] technique, that required the base class to use it as well (which is obviously not feasible).

### Model Builder

Holds global mapping configuration.

* Handling weirdly (i.e. wrongly) typed/formatted DB fields with a smart mapping scheme: <https://stackoverflow.com/a/19377226>
  * Create a private field
  * Create a public field that translates inbound values into the private field. In this example, it has the same name as the DB field, so it kinda "replaces" the private property.
  * The private field gets mapped to the DB field via the EF model builder, by name (à la reflection, so it works even though it's private).

## API

* `DbFunctions.TruncateTime(DateTime)` = return the date part of a DateTime
* `await dbContext.Database.MigrateAsync();` = applies pending migrations (same as running `dotnet ef database update` programmatically, ideal for container initialization)

### Joins

```C#
// Preferred = navigation properties (EF handles JOINs automatically):
public class Order
{
    public int Id { get; set; }
    public int CustomerId { get; set; }
    public Customer Customer { get; set; }  // navigation property
    public List<OrderItem> Items { get; set; }
}
var orders = context.Orders
    .Include(o => o.Customer)
    .Include(o => o.Items)
    .Where(o => o.Customer.Country == "USA")
    .ToList();

// More control = LINQ explicit joins (query/expression syntax):
var result = from o in context.Orders
             join c in context.Customers on o.CustomerId equals c.Id
             join e in context.Employees on o.EmployeeId equals e.Id
             where c.Country == "USA"
             select new { o.Id, CustomerName = c.Name, EmployeeName = e.Name };
// More control = LINQ explicit joins (method syntax):
var result = context.Orders
    .Join(context.Customers, o => o.CustomerId, c => c.Id, (o, c) => new { o, c })
    .Join(context.Employees, oc => oc.o.EmployeeId, e => e.Id, (oc, e) => new { oc.o, oc.c, e })
    .Select(x => new { x.o.Id, CustomerName = x.c.Name, EmployeeName = x.e.Name });

// Very complex queries = raw SQL:
context.Users.FromSqlRaw("SELECT * FROM Users WHERE Id IN (SELECT UserId FROM Orders GROUP BY UserId HAVING COUNT(*) > 5)").ToList();
```
