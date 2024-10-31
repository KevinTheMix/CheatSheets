# Entity Framework

## Glossary

* **DbContext** = acts as a Unit Of Work pattern
* **ObjectContext** = represents a connection between the CLR & the DB (for CRUD operations)
* **DbFunctions** = CLR (DateTime/Numbers/String manipulation) methods to be executed on (`IQueryable`) `DbContext` or `ObjectContext` entities (Linq to Entities queries)
  * They are executed as **CLR code at the DB-level, not in memory**
* **DbSet** = acts as a Repository pattern
* `DbSet<T>` = a `DbContext` property that inherits from `IQueryable<T>`

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
