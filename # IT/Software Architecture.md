# Software Architecture

* [Jakob Nielsen - Response Times: The 3 important Limits](https://www.nngroup.com/articles/response-times-3-important-limits) (Usability) = 0.1, 1 and 10

## Glossary

* **Availability** = the percentage of time that the system is operational
  * **Availability %** = (total elapsed time - sum of downtime)/total elapsed time
  * Systems in series = `A x A` (eg `0.9 x 0.9 = 0.81` so global availability decreases)
  * Systems in parallel = `1 - (1-A)²` (eg `1-(1-0.9)²` = `1-(0.1)²` = `1-0.01` = `0.99` so global availability increases)
* **Bottlenecks** = system part that degrades the entire system's performance when congested
* **Function/Lexical closure** = function (eg anonymous or lambda) + its captured context (ie values/references of inbound parameters at closure creation)
* **Dependability** = Availability, Reliability, Integrity, (Security), Safety, Maintainability, Confidentiality
* **Dependency Injection** (DI) = programming technique where object or function _receives_ others objects/functions as opposed to instantiating them internally
* **Domain-specific language** (DSL) = computer language (ie programming, markup, data, etc) specialized to a particular application domain (eg HTML)
* **Encapsulation** = cacher le mécanisme interne d'un objet en vue de forcer une certaine utilisation et garantir son intégrité
* **Entreprise Service Bus** (ESB) = communication system between distributed SOA applications, a special case of client-server in which any application can behave as either
* **Façade** = layer holding controllers
* **Mixin** = in OO, a feature-able class that can be _included_ without being inherited from (eg C# `IEquatable`, Ruby include, JS extend/assign), promoting reusability & multiple inheritance
* **Module** = une fonction ou une classe ou un fichier, selon les langages
  * L'intérêt est de pouvoir décomposer une partie de traitement dans un module réutilisable ayant le moins de dépendances/liens/informtion possibles
* **MV\* framework** = a model-view-style framework (eg MVC, MvvM & co)
* **OO** = Héritage + Polymorphisme + Encapsulation
* **Reliability** = the probability that the system will perform accordingly for a specific time
  * Mean Time Between Failures (MTBF) = (total elapsed time - sum of downtime) / number of failures
  * Mean Time To Repair (MTTR)
* **Requirement** = design mandate, must be testable
* **Security** = Confidentiality + Integrity + Availability (CIA)
* **Single Point of Failure** = system part that halts the entire system if it fails
* [SOLID](https://en.wikipedia.org/wiki/SOLID) = SRP + OCP + LSP + ISP + DIP (most of those are trivial by today's standards & modern frameworks)
  * **Single-Responsibility Principle** = every class must only do one thing (_Robert C. Martin_)
  * **Open/Closed Principle** = software entities should be open for extension, but closed for modification
    * Use stable Interfaces (defining common behaviors) that children can extend (ie implement) at will, not whole classes with implementation that could be modified (which could impact its children)
  * **Liskov Substitution Principle** = class instance can be replaced by subclass instance with no side-effects (inheritance, co/contra-variance)
  * **Interface Segregation Principle** = split large Interfaces into more "role-granular" ones, so subclasses don't need to implement unnecessary methods
  * **Dependency Inversion Principle** = use Interfaces between parent & child classes (the parent owns, the child inherits/implements)
    * The Interface is packaged with the parent (actually more recently, a separate _Child.Contract_ project) instead of the child, thus _inverting_ the direction of their (compile-time) relationship
* **Law of Demeter** = don't access a property's sub-properties (eg `a.b.c`)

### Design Patterns

* [Refactoring Guru - Design Patterns](https://refactoring.guru/design-patterns/catalog)

* **Adapter** = adapts interface A into interface B
* [Behavioral patterns](https://en.wikipedia.org/wiki/Behavioral_pattern) = design patterns that identify common comunication patterns among objects (eg Memento, Observer)
  * **Iterator** = well-spred nowadays (à la .Net `GetEnumerator()`)
  * **Mediator** = handles how a set of objects interacts/communicates (ie centralizes/orchestrates operations), reducing coupling between them - eg: a chat room
  * **Visitor** = one way follow the Open-Close Principle

* **Builder** = used in .Net Core configuration
* **Composite** = composite class implements interface and manages a collection of instances (or a factory), then dispatchs calls to one of those instances.
* **Decorator**
  * Add a behavior, at runtime, without modifying the existing, separation of concerns.
  * Implements the Interface of a decorated object, and receives an instance in its constructor, then call the methods of that instance, adding extra features
* **Inversion of control** (IoC) = custom code receives control of flow (or its dependencies in case of **DI**) from a generic framework (eg via providing callbacks) that handles boilerplate treatment (eg GUI)
* **Repository pattern** = DL container hiding CRUD data access logic details from BL (ie BL can access DL data without knowledge of underlying data access architecture)
* **Singleton** = a Single instance; hard to test
* **Unit of Work pattern** = keeps track of changes affecting a DB during a 'work' session, then persists that as a single transaction (or rollback everything)

### Properties

Tous ces critères n'ont pas le même poids à la conception ; un programme non valide n'a aucune valeur.

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

### Clean Architecture

Clean Architecture = DDD + CQRS

* Layers
  * **Domain** = entities only (POCOs, no logic, no dependencies)
  * **Application** (references Domain) = BL (services) interfaces (no implementation), Commands & Queries, DTOs
  * **Presentation** (references Application layer) = GUI/WebAPI, BL (services) implementation, Startup with DI pipeline (links implementation to interfaces)
  * **Infrastructure** (references Application layer) = DL implementation (DB/EF, I/O, WS client, SMTP, etc.)

#### CQRS (Command Query Responsibility Segregation)

* [Commands vs Events](https://stackoverflow.com/q/4962755/3559724) (commands can be rejected, events have happened)
