# Clean Architecture

## Quick Tips

* [GitHub: Ardalis Clean Architecture](https://github.com/ardalis/CleanArchitecture)
* [Steve Smith: Clean Architecture With ASP.NET Core](https://www.youtube.com/watch?v=qOwB8PxOqC0)

## Glossary

* **Clean Architecture** = Onion Architecture with further separation of inner layers (+ DDD + CQRS)
* **CQRS** (Command Query Responsibility Segregation) = archi pattern to use different code paths for reading & updating, and possibly even separate models/datastores (no more basic CRUD)
  * **Query** = returns a result but do not change state (read-only, no side-effects)
  * **Command** (aka modifiers or mutators) = request to perform an action that changes system state (writes, doesn't return a value)
    * [Commands vs Events](https://stackoverflow.com/q/4962755/3559724) = commands can be rejected, events have happened
  * Goal = addressing different scaling needs (eg _100:1_ ratio between reads/writes), optimizing/simplifying models, performance optimization (eg specialized DBs on read side), but overkill for simple CRUD
* **Dependency Rule** = core principle that source code dependencies must only point inward
  * Proper pattern is letting entities accumulate events (in commands) & dispatch them on saving (DbContext override eg `SaveChangesAsync` or via MediatR), and are then handled by MediatR `INotificationHandler` notification handlers
* **Single Project Clean Architecture** = enforce dependency & other architectural rules via unit tests instead of using separate projects (still gain dependency management benefits, eg _ArchUnit.Test_)
* **Vertical Slice Architecture** (VSA) = uniproject feature folders (domain models/DbContext/exception/logging are still shared), more simplicity at cost of less (or no) compile-time dependencies guardrails (via project references)

### Layers

* **Application** or **Use Cases** (aka Uncle Bob Interactors) = orchestration & use cases, CQRS (via Mediator, also with pipeline behavior for cross-cutting concerns) commands (with input format validators) & queries (with DTOs)
  * **Application Service** = orchestrate use cases, often depending on external layers (infrastructure, UI)
  * **Use Case** = orchestrates domain-level operations to fulfill a single user action/business rule, receive presentation-level notifier requests and hit one or more repositories
* **Core** = domain + application logic (Steve Smith aka Ardalis)
* **Domain** = enterprise business rules (POCO entities/enums/value objects), repository abstractions, services (may be part of a usecase rather), core **invariant** domain/business rules
  * **Domain Service** = BL without external dependencies for a single anemic (POCO) entities or for multiple entities (when it does not belong to a single entity/value object)
* **Infrastructure** = edge/outermost/lowest-level containing all concrete OS/external technology choices (repository, ORM, K-V stores, DB migrations, external API clients, message queues, SMTP, file system access, auth plumbing)
  * **Datasources** = useful if several repositories share the same DB/HTTP logic, central entry point for data access, useful when there is both local & remote sources, or for centralizing/reusing some treatments
    * Handles multi-DAOs transactions (single-DAO can still be handled in DAO), multi-sources aggregation, yet for simpler CRUD-like DAOs (eg no caching), Datasources are pretty redundant and can be merged with DAOs
  * **Repository** = return domain entities, handle caching
* **Shared Kernel** (DDD) = share things between solutions (base classes, auth, logging), package it as a versioned nuget
* **Presentation** = GUI/WebAPI, startup with DI pipeline (links implementation to interfaces)

* _Why usecases use classes_ (rather than functions)
  * Dependency injection (DI) = since it’s a class, you can inject dependencies (eg NoteRepository) via constructor
  * Named abstraction = the use-case has a name (AddNotes) which shows up clearly in stack traces, logs, test output, etc
  * Testability = easy to instantiate and test in isolation: AddNotes(FakeNoteRepo()).call(...)
  * Extensibility = you can later add fields (eg injected Logger, flags, strategy objects) without changing the call site
  * Interchangeability = you can pass it around, mock it, or swap implementations (eg for background vs. interactive) — it’s a polymorphic unit
  * Consistency = every use-case follows the same pattern: MyUseCase.call(...). No free-floating, inconsistently-named functions

## Snippet

```C#
public abstract class Aggregate
{
    private readonly List<object> _pendingEvents = new();
    public IReadOnlyList<object> PendingEvents => _pendingEvents;
    protected void RaiseEvent(object evt) // common convention in the DDD/event sourcing community
    {
        _pendingEvents.Add(evt);
        Apply(evt);  // update internal state immediately
    }
    protected abstract void Apply(object evt);
}

public class Order : Aggregate
{
    public void Cancel(string reason)
    {
        if (_status == OrderStatus.Shipped) throw new InvalidOperationException("Cannot cancel shipped order");
        // If event sourced:
        RaiseEvent(new OrderCancelled(Id, reason, DateTime.UtcNow));
    }
    private void Apply(OrderCancelled e) => _status = OrderStatus.Cancelled;
}
```
