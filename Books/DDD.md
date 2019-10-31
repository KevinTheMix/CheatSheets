# Domain-Driven Design

## 1. What is DDD

Don't sulk when specs change, especially as a result of development insights, because it's part of the process.
Design improves development, but development improves design as well!

First step is interviewing the Domain specialists, because they know the Domain on which we'll build our models.
Also, Domain specialists are not designers nor developers, so you cannot expect them to hand you over a torough description of the problem.
Instead, some **key concepts** will emerge from discussion and can be laid down to form our models.

Once we've built a starting model that seems to satisfy the information gathered from the Domain specialists, we can update it as new information becomes available.
The information flow is not unidirectional; developers & architects communicate back to the client and can adapt from that feedback.
Therefore, Domain knowledge and accuracy of the solution being designed by the development team improves.

Note that the knowledge of the Domain specialists is probably not fit for a useful software system, as they manage their data in a way that corresponds to their operational needs.
It is the technical expertise of the software designers that enable its conversion into business-relevant models and solution.

It is this collaborative effort that leads to the successful design of the domain model, which represents the point where they meet.

All this is time-consuming, but is the right way to work, because code must answer Domain's real-life problems.

## 2. Ubiquitous Language

The Model, as a contract half-way between the Domain and the code, becomes the base language between everybody (the whole team).
Its underlying concepts and lexicon should be applied religiously and appear in all exchanges (oral, written & diagrams) and in the code.
=> Ubiquitous Language.

Language => (Knowledge & Diagrams/Documents &) Model => Code naming (classes & co). Change one => change the others.
Blurry terms shall be clarified.

## 3. Model-Driven Design

Domain => distinct nalysis Model => Code? :(
Domain => viable Model with Developers => Code! :)

Model <-> Code must go hand in hand and evolve jointly, bilaterally.
Each Domain specialist & Developer must get involved in the Model.

Model <-> Code => OOP because it fits what the Model is trying to achieve (relationships and communication between objets) so we can map it.

### Entities

Entities have a unique ID: a natural attribute, composite attributes or a dedicated one.
They must be persisted.

### Value Objects

Object whose values, not its identity, is their relevant characteristic.
In DB, they will have a foreign key to an Entity, but don't intrinsically require an ID themselves.
Two such objects can be used interchangeably. They can be easily created and thrown away (and GC-ed).
If the can be shared, they must be immutable. If a value must change, create a new one instead.

### Services

Behaviors (actions, verbs) that don't fit a particular Object are placed into Services.
Services don't have state and provide/encapsulate related Domain features.

The features they implement typically involve different Objects.
By placeing those functionalities in a separate Service Object, they prevent strong coupling between the objects themselves.

* A Service contain Domain logic that does not belong to an Entity or Value Object.
* A Service operation includes other Domain Objects.
* A Service operation is stateless.

### Modules

Way of organizing and breaking down the complexity and size a Model.
Partition the Domain into high-level concepts to uncouple the code.

A Module's role shall remain stable, even if its content evolves greatly.

### Aggregate (Design Pattern)

Aggregates is a Domain pattern that's all about transactional consistency by encapsulating related objects.
The fact is we shouldn't rely solely on the DB to ensure integrity and handle transactions caused by data update.
When there is a strong consistency rule between multiple entities, we make one of them responsible for enforcing it, it becomes the access point of the ensemble.
An Aggregate is a group of related Objects taken as a whole, with a single designated Aggregate Root.

The Aggregate Root is an Entity object responsible for handling all requests affecting the Aggregate's internal Object, thus ensuring its integrity & invariants.

Aggregates should be loaded or persisted transactionally as a whole, not crossing its boundaries.
See <https://martinfowler.com/bliki/DDD_Aggregate.html>

Temporary copies or references to the internal Objects can be passed around via the root to external objects.
See <https://dzone.com/articles/aggregate-pattern>

### Factory (Design Pattern)

Factories are suited to produce Aggregates, because those complex structures require advanced knowledge of their internals.
Factories can be used to create the Aggregate as a whole. They then contain all the rules and constraints to create a valid Aggregate.
It is important that the Object creation process be atomic, even more so for Aggregates.
Use care since Factories are tightly coupled with the objects they create, and they break encapsulation, so changes to the objects can impact their factories.

Entitities are not created in the same way as value objects: they are not immutable (attributes can initially be left empty) and require an ID.

#### Factory Method

A Factory Method is a method used to create Objects, that can be placed in any class (not just dealing with object creation).
Usually, the Factory Method is included in the Aggregate Root object to produce the internal objects of the Aggregate.
See <https://stackoverflow.com/questions/5739611/differences-between-abstract-factory-pattern-and-factory-method>

#### Abstract Factory

An Abstract Factory is an abstract class defining the methods that shall create related objects of the same family/product line.
E.g.: an OS's theme that defines a Button(), a Scrollbar(), a Window(), etc. (from Gang of Four), where the Factory represents the theme.

### Repository

A repository gives global access to object references, whether they are persisted (more often), cached or factored.
They provide the illusion of an in-memory collection for the type of objects that it manages.
They should also provide CRUD and (ID or attributes) search query capabilities for those objects.
Its search capabilities should be able to work off criteria of multiple attributes, and return collections.
All storage and access to data should be handled by repositories.

Note that the repository interface (its methods) should revolve around Domain concepts and not focus on Data (infra) considerations.
E.g.: GetClient(int id); but not RunGetClientQuery(string query);

A Repository acts like a Factory in the sense that they both "create" (as in, call a constructor/factory) objects, even if they only actually retrieve existing ones.

## 4. Refactoring

Domain -> Model -> Design -> Code
Refactoring is modifying the structure of Code without affecting its behavior, the goal being to improve the code quality.
Take care not to introduce bugs doing so, e.g. using automated testing.

Code Refactoring vs Domain Refactoring, which is an update of the conceptual Model, i.e. **inspect & adapt**.
We can't just take functional specifications, translating names to classes and verbs to methods, and call it a day.
This type of Domain Refactoring occurs as new or more accurate ideas emerge, to increase the quality of the Model, and the underlying Code.
Deep meaningful Models are rarely created in a day, but result of an iterative ever-improving process of refactoring and team collaboration.

### Key Concepts Update

1. Imprecise Model, some underlying Key Concepts are missed.
2. Repeated refinements, better grasping some misunderstood concepts, uncovering some hidden Key Concepts and making them explicit.
3. Breakthrough!

All that is part of a new Domain's learning experience.

Sometimes, concepts are blurry, perhaps because one is missing and should be uncovered.
We have to clarify and reconcile the seemingly contradicting views of Domain specialists.
Books are another source of in-depth Domain information.

Constraints = Place them in their own separate method to clarify and make easily extendable.
Processes = ?
Specification = encapsulates business rules linked to an Entity, chain & test them (See <https://en.wikipedia.org/wiki/Specification_pattern>).

## 5. Model Integrity

Unification = a Model internal consistency.
Buiding a unified Model that would cover the entirety of a company or project is at beast infeasible.

### Bounded Context

One Model for One team.
Context is the space within which the concepts of a given Model have a well-defined meaning.
That area must be identified and preserved to keep our Model unified.
Establish clear boundaries for application, teams and infrastructure (codebase, databases).
Everything inside must remain consistent. Everything outside should be of no concern.

A Bounded Context is not a Module, it is the logical space within which a Model evolves.
Modules are used to organize the elements of a Model, and are contained within the Bounded Context.

Each team has one and only one Model within its designated Bounded Context.
It can work freely on its own Model and should not interfere with others outside its boundaries.

### Continuous Integration

Small team can perform daily integration to catch inconsistencies early.
Merging new implementation often and automating tests are important tools to unveil inconsistencies in the Model.

### Context Map

Document/Diagram describing the multiple Models in their Bounded Context and the link between them.
It should be understood by all members of all teams.

Eventually, all the BCs will have to be integrated into the full application.
Boundaries have to be well-defined for this to work seamlessly.

Each BC should should gather its name from UL, and have that name and its implications understood by everyone.
First identify the BCs, then creation with Modules with name indicating BC provenance.

### Shared Kernel

Subset of the Model shared between two teams in order to avoid duplication while keep BCs separate.
Extra care must be applied: the code must be integrated often and changes by one team should be communicated and tested (automatically) by both.

### Client-Provider

Sequential (& unidirectional) relationship between systems that don't share Models (or technology).
System B needs some of the information produced by system A (and possibly some more).
System A is the Provider of Client system B.

Also both systems access the same database (one writes, the other reads).
Since this creates coupling, it's better if both teams are under the same management.
They should communicate regularly; the Client must expose its needs to the Provider, who can work to satisfy them, according to its resouces.

Their shared interface should be closely monitored by a series of conformity tests.
The Provider can evolve freely as any change that breaks the contract will be caught by that safety.

### Conformist

Using an external Model as-is without modifying it and building functionalities on top.

Alternatively, we could implement our own Model and use an adapter, which would provide more liberty to change.

### Anti-corruption Layer

Translation layer to reuse a legacy system's Model via a Façade.
Uses an Adapter to map behavior and a mapper to map Models.

### Separate Ways

BCs requires compromises in the form of additional complexity in relationships management and frequent fusions.
Two systems can be one entity from a user's perspective (i.e. same GUI) but exist distinctly from a technical standpoint.
Therefore, they can be developed separately, each with its own BC and technology, unaffected by the other.

### Open Host Service

Treat a subsystem as a services provider and open its protocol to avoid creating too many mappers in each client.

### Distillation

A big Domain will give birth to a big Model.

Distillation is the separation of a mix's components, to extract a specific substance (and by-products).
In DDD, it means defining a (relatively small, but most important) Core Domain, and its generic sub-Domains.
When all parts seem important, distillation distinguishes between those who are and those generic/auxiliary, however necessary to the whole system they are.
Core developers will focus on higher priority Core Domain and make them build specialized business knowledge.

E.g.: a generic route concept isn't that specific to aerial traffic control.
Their core business is projecting 4D trajectories in short/medium/long term and ensuring no airplanes' paths cross.
Of course a routing system will regard routes as a core concept.
But it will be classified as a generic sub-Domain for an aerial traffic controller.

The idea is to separate the more essential and specialized parts of a Domain from its other generic components.
Those more generic Models should be placed in their own Module, and perhaps outsourced via one of the following:

* COTS (ready to go, requires learning, creates dependency, might be bugged and/or slow to evolve)
* Third party (internal or external, requires integration and well-specified interface)
* Existing Model (use existing Design Patterns as-is or with little modification)
* In-house (best integration, requires resources including maintenance)

## 6. Author's Interview

DDD, Agile, Domain over technology (early web)
