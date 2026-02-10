# DDD (Domain-Driven Design)

Software development approach prioritizing modeling software around core business domain rather than around technical concerns.

## Quick Tips

### Features

* Shared understanding = ubiquitous language shared by all stakeholders (developers, domain experts)
* Managing complexity = through patterns like bounded context/aggregates/domain events, helping organize large systems into comprehensible pieces
* Business logic isolation = domain layer is separated from infrastructure, so gets easier to manage/modify/test/understand
* Flexibility for change = business requirements translate more naturally into code changes, regardless of technical details

## Glossary

* **Aggregate** = cluster of entities (and value objects) treated as a single unit for consistency purposes, with one designated as **aggregate root** (ie entry point through which all modification happen)
* **Anti-Corruption Layer** (ACL) = boundary to isolate/shield/translate domain model from external systems (3rd party service or other bounded contexts) so that their concepts/lingo does not leak in
* **Bounded Context** = explicit boundaries where a particular model applies, essentially a strategic business-driven namespace
* **Context Mapping** pattern = explicitly define/manage relationships between different bounded contexts (eg do we use another BC's lingo or shield via an ACL, do we share models?)
* **Domain Event** = something meaningful that (already) happened in domain (enables decoupling domain actions from eventual handlers, ie event aggregation eg via PRISM or MediatR `INotification`)
* **Ubiquitous Language** = shared common lexicon that helps communication between software developers & domain experts
