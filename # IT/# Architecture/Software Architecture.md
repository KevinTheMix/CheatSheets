# Software Architecture

* _You might not think that programmers are artists, but programming is an extremely creative profession. It's logic-based creativity._ — John Romero

## Glossary

* **4+1** = view model describing architecture of software-intensive systems using mutliple shareholders viewpoints
* **Application Lifecycle Management** (ALM) = end-to-end product lifecycle management (governance, development, maintenance) of computer programs (ie requirements, architecture, programming/testing, maintenance, changes, CI)
* **Backend For Frontend** (BFF) = dedicated backend service for each type of client interface (eg mobile/web/smartwatch/etc) to combat one-size-fits-all inefficiency or manage app secrets
* **Barrel Files** = a file that does nothing but re-export things from other files
  * [TkDodo - Please Stop Using Barrel Files](https://tkdodo.eu/blog/please-stop-using-barrel-files)
* **Bottlenecks** = system part that degrades the entire system's performance when congested
* **Closure** = function (eg anonymous or lambda) + its captured context (ie values/references of inbound parameters at closure creation)
* **Dependency Injection** (DI) = providing dependencies at runtime using reflection, rather than passing them top-down all over the place, reduces tight coupling
* **Progressive Delivery** = gradually release changes to a subset of users, evaluating results then expanding rollout/rolling back (ie an evolution of CD with more control & safety to release process)
  * **Blue-Green Deployment** = all-or-nothing switch between two identical environments (ie prepare inactive one to go live then flip traffic over entirely, à la A/B test)
  * **Canary Deployment** = roll out to a tiny percentage first to monitor for errors then gradually increase if everything goes smoothly
  * **Regional Rollout** = deploy to one datacenter/region first, verify it's healthy then proceed to others
* **Encapsulation** = cacher le mécanisme interne d'un objet en vue de forcer une certaine utilisation et garantir son intégrité
* **Enterprise Resource Planning** (ERP) = suite of integrated applications used by an organization to collect/store/manage/interpret data from many business activities (eg accounting, sales, CRM, HR)
* **Enterprise Service Bus** (ESB) = communication system between distributed SOA applications, a special case of client-server in which any application can behave as either
* **Event Sourcing** = persistence pattern where application state is stored as a(n ever-growing append-only) sequence of replayable events (or via intermediary snapshots for performance), also to travel back/forward in state
* **Façade** = layer holding controllers
* **Framework** = architectural style, boilerplate alleviating, toolschain complementing an existing language
* **GDPR** (General Data Protection Regulation)
  * All people _living_ in Europe, and **all** digital marketing data (eg cookies but also dynamic IP)
  * Doesn't require consent to collect and process data required to run the site, but only for a well-defined, transparent purpose
  * A deletion request might lead to possibly only the anonymization of data, and some data **must** be kept for some time (eg financial records)
* **Hexagonal Architecture** = Domain no longer depends on Data (as in n-layered architecture) but holds ports (ie repository interfaces) that are implemented in Data
* **Law of Demeter** = don't access a property's sub-properties (eg `a.b.c`)
* **Marshalling** = transforming one live object's memory representation into a format suitable for storage/transmission between different runtimes (broader than only serialization)
* **Middleware** = interception layer in a processing pipeline (eg HTTP requests) that applies shared behavior around a core operation without being that operation itself (eg auth, error handling, logging, messaging, transactions)
* **Mixin** = in OO, a feature-able class that can be _included_ without being inherited from (eg C# `IEquatable`, Ruby include, JS extend/assign), promoting reusability & multiple inheritance
* **Model-View-Controller** (MVC) = model is business data & rules (entities, DTOs, validation logic), view (eg HTML), controllers (incoming HTTP requests) return a view
* **Module** = a function or class or file (depending on langages), embodying modularity/reusability through decomposing treatment parts and minimizing hard dependencies
* **Offline First** or **Local First** = designing an app with lack of connection baked in from scratch as part of normal operation, and eventual sync to share data across devices
* **OO** = Héritage + Polymorphisme + Encapsulation
* **Polymorphism** = various techniques for using one symbol to represent multiple different types
  * **Ad Hoc** = functions overload
  * **Parametric** = generic functions
  * **Subtyping** = using base class in place of a variety of children (à la ESI)
* Programming Styles
  * **Declarative Programming** = focuses on _what_ is to be done (end goal configuration) and lets system handle _how_ things must be done (low-level logic is still performed imperatively under the hood)
  * **Functional Programming** = pure functions as 1st class without side-effects, immutability, declarative code
  * **Reactive Programming** = data streams & propagation of changes (ie when something changes, other elements depending on it get updated)
* **Requirement** = design mandate, must be testable
* **SDK** (Software Development Kit) = set of APIs, compilers, debuggers, documentation, libraries, profilers and tools created by language developers to serve as basis for development
* **Security** = Confidentiality + Integrity + Availability (CIA)
* **Single Point of Failure** = system part that halts the entire system if it fails
* [SOLID](https://en.wikipedia.org/wiki/SOLID) (OO design guidelines by _Robert C. Martin_) = make code flexible/maintainable/testable/understandable (implicit by today's modern architectural frameworks/standards)
  * **Single-Responsibility Principle** = a class should have only one & only one reason to change
  * **Open/Closed Principle** (Open for extension, Closed for modification) = new behaviors can be added without modifying existing code (ie decrease coupling via IOs or SRP so entities are modular)
  * **Liskov Substitution Principle** = class instance can be replaced by subclass instance without breaking expectations (eg `Square : Rectangle` may be troublesome for some usecases)
  * **Interface Segregation Principle** = use smaller/more granular interfaces to avoid bloat (ie don't force implementing unnecessary methods)
  * **Dependency Inversion Principle** = high-level modules should depend on low-level modules **abstractions, not concretions** (à la printer that depends on its cartridge slots, not on actual cartridges), makes code testable, respects OCP
  * [DigitalOcean: SOLID Design Principles Explained](https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design)
* **TOGAF** (The Open Group Architecture Framework) = most used framework for enterprise architecture, a high-level approach to design/plan/implement/govern an enterprise IT architecture (business, application, data, technology)
* **Value Object** = immutable type that represent a concept by their value, not identity (ie equality based on all fields, not a unique ID, eg DateRange, EmailAddress)

### Non-Functional Properties

* **Cohesion** = internal coherence of a unit of code (ie do one well-defined thing with clear boundaries => no spaghetti code)
* **Coupling** = external dependencies between modules (undesired)

* **Validité** = résoud le problème qu'on voulait
* **Robustesse** = résiste aux évènements inattendus (eg plante pas si HDD down)
* **Extensibilité** = faculté d'adaptation à une petite modification du problème
* **Réusabilité** = réutiliser des éléments d'un programme dans un autre (sans modification)
* **Compatibilité** = compatibilité avec d'autres programmes, faculté d'intégration
* **Efficacité** (en terme de vitesse)
* **Portabilité** = tourne dans d'autres environnements
* **Vérifiabilité** = le système peut-il être vérifié simplement
* **Intégrité** = aspect sécuritaire
* **Convivialité** = interface graphique, agréabilité d'utilisation

* **Availability** = the percentage of time that the system is operational
  * **Availability %** = (total elapsed time - sum of downtime)/total elapsed time
  * Systems in series = `A x A` (eg `0.9 x 0.9 = 0.81` so global availability decreases)
  * Systems in parallel = `1 - (1-A)²` (eg `1-(1-0.9)²` = `1-(0.1)²` = `1-0.01` = `0.99` so global availability increases)
* **Dependability** = Availability, Reliability, Integrity, (Security), Safety, Maintainability, Confidentiality
* **Reliability** = the probability that the system will perform accordingly for a specific time
  * Mean Time Between Failures (MTBF) = (total elapsed time - sum of downtime) / number of failures
  * Mean Time To Repair (MTTR)

### [Design Patterns](https://refactoring.guru/design-patterns/catalog)

* **Adapter** = adapts interface A into interface B
* [Behavioral patterns](https://en.wikipedia.org/wiki/Behavioral_pattern) = design patterns that identify common comunication patterns among objects (eg Memento, Observer)
  * **Event Aggregation** = centralizes public events (eg "user logged in") between publishers & subscribers
  * **Iterator** = well-spred nowadays (à la .Net `GetEnumerator()`)
  * **Mediator** = centralizes/decouples communication between classes via request and (DI-discoverable genericly-typed) handler classes, reducing coupling between them
  * **Visitor** = one way follow the Open-Close Principle
* **Builder** = used in .Net Core configuration
* **Composite** = composite class implements interface and manages a collection of instances (or a factory), then dispatchs calls to one of those instances.
* **Decorator** = add a behavior, at runtime without modifying the existing by accumulating subclasses taking previous instance as ctor parameter, separation of concerns
* **Inversion of control** (IoC) = custom code receives control of flow (or its dependencies in case of **DI**) from a generic framework (eg via providing callbacks) that handles boilerplate treatment (eg GUI)
* **Repository** = abstracts data access considerations (eg DB) with reusable generic CRUD (concrete implementations are abstracted in a way that BL is agnostic)
* **Singleton** = a Single instance; hard to test
* **Unit of Work** = keeps track of changes affecting a DB during a 'work' session, then persists that as a single transaction (or rollback everything)
