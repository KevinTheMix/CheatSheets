# Software Architecture

* OO = Héritage + Polymorphisme + Encapsulation
  * Encapsulation = cacher le mécanisme interne d'un objet en vue de forcer une certaine utilisation et garantir son intégrité
* Module = une fonction ou une classe ou un fichier, selon les langages
  * L'intérêt est de pouvoir décomposer une partie de traitement dans un module réutilisable ayant le moins de dépendances/liens/informtion possibles

## Sweden-era

* Performance Bottlenecks & Central Point of Failure
* Requirement must be testable
* defect rate/density = def / KLOC (lines of code)
* Reliability = the probability that the system will perform accordingly for a specific time
  * Mean Time Between Failures (MTBF) = (total elapsed time - sum of downtime) / number of failures
  * Mean Time To Repair (MTTR)
* Availability = the percentage of time that the system is operational
  * Availability % = (total elapsed time - sum of downtime)/total elapsed time
  * Systems in series = A x A (eg 0.9 x 0.9 = 0.81 so global availability decreases)
  * Systems in Parallel = 1 - (1-A)² (eg 1-(1-0.9)² = 1-(0.1)² = 1-0.01 = 0.99 so global availability increases)
* Dependability = Availability, Reliability, Integrity, (Security), Safety, Maintainability, Confidentiality
* Security = Confidentiality + Integrity + Availability (CIA)

## Propriétés

Tous ces critères n'ont pas le même poids à la conception ; un programme non valide n'a aucune valeur.

* validité = résoud le problème qu'on voulait
* robustesse = résiste aux évènements inattendus (eg plante pas si HDD down)
* extensibilité = faculté d'adaptation à une petite modification du problème
* réusabilité = réutiliser des éléments d'un programme dans un autre (sans modification)
* compatibilité = compatibilité avec d'autres programmes, faculté d'intégration
* efficacité (en terme de vitesse)
* portabilité = tourne dans d'autres environnements
* vérifiabilité = le système peut-il être vérifié simplement
* intégrité = aspect sécuritaire
* convivialité = interface graphique, agréabilité d'utilisation

## Design Patterns

* Decorator
  * Add a behavior, at runtime, without modifying the existing, separation of concerns.
  * Implements the Interface of a decorated object, and receives an instance in its constructor, then call the methods of that instance, adding extra features
* Adapter = adapts interface A into interface B
* Composite = composite class implements interface and manages a collection of instances (or a factory), then dispatchs calls to one of those instances.
* Singleton = a Single instance; hard to test
* Builder = used in .Net Core configuration
* Iterator = cfr .Net GetEnumerator() (well-spred nowadays)
* Visitor = allows to follow Open-Close Principle

## CQRS

Fluent Validation

Repository pattern
Unit of Work pattern

Time series

Application Layer = Service
Application Façade = Controllers
Integration Layer?
Infrastructure Layer (technique, stateful) = DL

Application Insights

VS Online

ServiceBus
ESB

Mediator fait l'orchestration
MediatR

CancellationToken

DB Read/Write separation avec synchro

Clean Architecture = DDD + CQRS

* [Commands vs Events](https://stackoverflow.com/questions/4962755/why-are-commands-and-events-separately-represented)
* [SQL Server Active/Passive](https://dba.stackexchange.com/questions/135964/sql-server-clustering-active-active-or-active-passive)
* [Linq Fluent & Query](https://stackoverflow.com/questions/214500/fluent-and-query-expression-is-there-any-benefits-of-one-over-other)
* [Repo Pattern](https://www.google.com/search?client=firefox-b-d&q=repository+pattern)
* [Unit of Work & Repo](https://jasonwatmore.com/post/2015/01/28/unit-of-work-repository-pattern-in-mvc5-and-web-api-2-with-fluent-nhibernate-and-ninject)
* [Fluent Validation](https://www.google.com/search?client=firefox-b-d&q=fluent+validation)
* [Design Patterns](https://refactoring.guru/design-patterns/catalog)
