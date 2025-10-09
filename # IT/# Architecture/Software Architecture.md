# Software Architecture

* _You might not think that programmers are artists, but programming is an extremely creative profession. It's logic-based creativity._ — John Romero

## Glossary

* **Barrel Files** = a file that does nothing but re-export things from other files
  * [TkDodo - Please Stop Using Barrel Files](https://tkdodo.eu/blog/please-stop-using-barrel-files)
* **Bottlenecks** = system part that degrades the entire system's performance when congested
* **Clean Architecture** = Onion Architecture with further separation of inner layers (+ DDD + CQRS)
  * Layers
    * **Domain** = entities only (POCOs, no logic, no dependencies)
    * **Application** (references Domain) = BL (services) interfaces (no implementation), Commands & Queries, DTOs
    * **Presentation** (references Application layer) = GUI/WebAPI, BL (services) implementation, Startup with DI pipeline (links implementation to interfaces)
    * **Infrastructure** (references Application layer) = DL implementation (DB/EF, I/O, WS client, SMTP, etc.)
  * **CQRS** (Command Query Responsibility Segregation) = use different models for reading & updating (unlike basic CRUD)
    * **Query** = return a resulit but do not change state (ie free of side-effects)
    * **Command** (aka modifiers or mutators) = change state but don't return a value
      * [Commands vs Events](https://stackoverflow.com/q/4962755/3559724) = commands can be rejected, events have happened
* **Dependency Injection** (DI) = providing dependencies at runtime using reflection, rather than passing them top-down all over the place, reduces tight coupling
* **Domain-specific language** (DSL) = computer language (ie programming, markup, data, etc) specialized to a particular application domain (eg HTML)
* **Encapsulation** = cacher le mécanisme interne d'un objet en vue de forcer une certaine utilisation et garantir son intégrité
* **Entreprise Service Bus** (ESB) = communication system between distributed SOA applications, a special case of client-server in which any application can behave as either
* **Event Sourcing** = derives application state from a succession of events (ie an add-only evergrowing audit/event log) capturing sequence of changes, allowing to rebuild state or travel it back/forward
* **Façade** = layer holding controllers
* **Framework** = architectural style, boilerplate alleviating, toolschain complementing an existing language
* **Function/Lexical closure** = function (eg anonymous or lambda) + its captured context (ie values/references of inbound parameters at closure creation)
* **GDPR** (General Data Protection Regulation)
  * All people _living_ in Europe, and **all** digital marketing data (eg cookies but also dynamic IP)
  * Doesn't require consent to collect and process data required to run the site, but only for a well-defined, transparent purpose
  * A deletion request might lead to possibly only the anonymization of data, and some data **must** be kept for some time (eg financial records)
* **Hexagonal Architecture** = Domain no longer depends on Data (as in n-layered architecture) but holds ports (ie repository interfaces) that are implemented in Data
* **Marshalling** = transforming one live object's memory representation into a format suitable for storage/transmission between different runtimes (broader than only serialization)
* **Mixin** = in OO, a feature-able class that can be _included_ without being inherited from (eg C# `IEquatable`, Ruby include, JS extend/assign), promoting reusability & multiple inheritance
* **Module** = une fonction ou une classe ou un fichier, selon les langages
  * L'intérêt est de pouvoir décomposer une partie de traitement dans un module réutilisable ayant le moins de dépendances/liens/informtion possibles
* **OO** = Héritage + Polymorphisme + Encapsulation
* **Polymorphism** = various techniques for using one symbol to represent multiple different types
  * **Ad Hoc** = functions overload
  * **Parametric** = generic functions
  * **Subtyping** = using base class in place of a variety of children (à la ESI)
* Programming Styles
  * **Declarative Programming** = focuses on _what_ is to be done by abstracting _how_ things must be done whenever a treatment gets executed
    * Works by convention & pre-configuring/declaring once rather than every time an operation takes place
    * Low-level logic is still performed imperatively under the hood
  * **Functional Programming** = pure functions as 1st class without side-effects, immutability, declarative code
  * **Reactive Programming** = data streams & propagation of changes (ie when something changes, other elements depending on it get updated)
* **Requirement** = design mandate, must be testable
* **SDK** = set of APIs, compilers, debuggers, documentation, libraries, profilers and tools created by language developers to serve as basis for development
* **Security** = Confidentiality + Integrity + Availability (CIA)
* **Single Point of Failure** = system part that halts the entire system if it fails
* [SOLID](https://en.wikipedia.org/wiki/SOLID) = SRP + OCP + LSP + ISP + DIP (most of those are trivial by today's standards & modern frameworks)
  * **Single-Responsibility Principle** = every class must only do one thing (_Robert C. Martin_)
  * **Open/Closed Principle** = software entities should be open for extension, but closed for modification
    * Use stable Interfaces (defining common behaviors) that children can extend (ie implement/inherit from) at will, not whole classes with implementation that could be modified (which could impact its children)
  * **Liskov Substitution Principle** = class instance can be replaced by subclass instance with no side-effects (inheritance, co/contra-variance)
  * **Interface Segregation Principle** = split large Interfaces into more "role-granular" ones, so subclasses don't need to implement unnecessary methods
  * **Dependency Inversion Principle** = use Interfaces between parent & child classes (the parent owns, the child inherits/implements)
    * The Interface is packaged with the parent (actually more recently, a separate _Child.Contract_ project) instead of the child, thus _inverting_ the direction of their (compile-time) relationship
* **Law of Demeter** = don't access a property's sub-properties (eg `a.b.c`)

### Non-Functional Properties

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
  * **Mediator** = centralizes/decouples communication between classes via request and (DI-discoverable generic-typed) handler classes, reducing coupling between them
  * **Visitor** = one way follow the Open-Close Principle
* **Builder** = used in .Net Core configuration
* **Composite** = composite class implements interface and manages a collection of instances (or a factory), then dispatchs calls to one of those instances.
* **Decorator** = add a behavior, at runtime without modifying the existing by accumulating subclasses taking previous instance as ctor parameter, separation of concerns
* **Inversion of control** (IoC) = custom code receives control of flow (or its dependencies in case of **DI**) from a generic framework (eg via providing callbacks) that handles boilerplate treatment (eg GUI)
* **Repository** = abstracts data access considerations (eg DB) with reusable generic CRUD (concrete implementations are abstracted in a way that BL is agnostic)
* **Singleton** = a Single instance; hard to test
* **Unit of Work** = keeps track of changes affecting a DB during a 'work' session, then persists that as a single transaction (or rollback everything)

### DDD (Domain-Driven Design)

* **Aggregate** = cluster of entities, with a root entity (aka the **Aggregate Root** (Entity))
* **Anti-Corruption Layer** (ACL) = translates/shields internal models from inbound lingo from an external 3rd party service
* **Bounded Context** = essentially, a strategic business-driven namespace
