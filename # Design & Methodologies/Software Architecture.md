# Software Architecture

## Glossary

* **Availability** = the percentage of time that the system is operational
  * **Availability %** = (total elapsed time - sum of downtime)/total elapsed time
  * Systems in series = `A x A` (eg `0.9 x 0.9 = 0.81` so global availability decreases)
  * Systems in parallel = `1 - (1-A)²` (eg `1-(1-0.9)²` = `1-(0.1)²` = `1-0.01` = `0.99` so global availability increases)
* **Bottlenecks** = system part that degrades the entire system's performance when congested
* **Dependability** = Availability, Reliability, Integrity, (Security), Safety, Maintainability, Confidentiality
* **Encapsulation** = cacher le mécanisme interne d'un objet en vue de forcer une certaine utilisation et garantir son intégrité
* **Module** = une fonction ou une classe ou un fichier, selon les langages
  * L'intérêt est de pouvoir décomposer une partie de traitement dans un module réutilisable ayant le moins de dépendances/liens/informtion possibles
* **Reliability** = the probability that the system will perform accordingly for a specific time
  * Mean Time Between Failures (MTBF) = (total elapsed time - sum of downtime) / number of failures
  * Mean Time To Repair (MTTR)
* **Requirement** = design mandate, must be testable
* **OO** = Héritage + Polymorphisme + Encapsulation
* **Security** = Confidentiality + Integrity + Availability (CIA)
* **Single Point of Failure** = system part that halts the entire system if it fails
* [SOLID](https://en.wikipedia.org/wiki/SOLID) = SRP + OCP + LSP + ISP + DIP
  * SRP (**Single-Responsibility Principle**) = every class must only do one thing (Robert C. Martin)
  * OCP (**Open/Closed Principle**) = abstract common behaviors via stable Interfaces that child classes can augment as they please
  * LSP (**Liskov Substitution Principle**) = class instance can be replaced by subclass instance with no side-effects (inheritance, co/contra-variance)
  * ISP (**Interface Segregation Principle**) = split large Interfaces into more "role-granular" ones, so subclasses don't need to implement unnecessary methods
  * DIP (**Dependency Inversion Principle**) = use Interfaces between parent & child classes, who respectively own & inherit those
    * The Interface is packaged with the parent (actually more recently, a separate _Child.Contract_ project) instead of the child, thus _inverting_ the direction of their (compile-time) relationship
  * **Law of Demeter** = don't access a property's subproperties (e.g. `a.b.c`)

### Design Patterns

* **Adapter** = adapts interface A into interface B
* **Builder** = used in .Net Core configuration
* **Composite** = composite class implements interface and manages a collection of instances (or a factory), then dispatchs calls to one of those instances.
* **Decorator**
  * Add a behavior, at runtime, without modifying the existing, separation of concerns.
  * Implements the Interface of a decorated object, and receives an instance in its constructor, then call the methods of that instance, adding extra features
* **Iterator** = cfr .Net GetEnumerator() (well-spred nowadays)
* **Singleton** = a Single instance; hard to test
* **Visitor** = allows to follow Open-Close Principle

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
