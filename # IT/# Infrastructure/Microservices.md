# Microservices

## Quick Tips

* _Smart endpoints and dumb pipes_ means complexity should reside within microservices themselves, not communication technology between them
* Drawbacks = operational complexity, distributed challenges (network latency, partial failure, debugging), data management (Saga pattern), testing difficulty, organizational overhead, resource consumption, latency
  * Failure to properly clarify service ownership, well-defined API contracts, versioning, boundaries, lead to tightly coupled services that are worse than a monolith (a _distributed monolith_)

## Glossary

* **API Gateway** = single entry point for clients into a group of microservices, instead calling each microservice directly (à la reverse proxy/OO Façade pattern, or BFF if one dedicated gateway tailored per client app type)
  * Provides routing, caching, authentication/authorization, SSL termination, rate limiting/throttling, load balancing, response aggregation, protocol translation, logging/monitoring
  * Drawbacks = introduces coupling with internal microservices, potential bottleneck/SPOF (so must be scaled), latency (still better than direct communications from client to services), development OCP/SRP violation liability
* **Application Delivery Controller** (ADC) = datacenter device often placed in DMZ part of an Application Delivery Network (ADN) that helps perform common tasks (à la web accelerator & load balancer, eg Azure Application Gateway)
* **Backend For Frontend** (BFF) = dedicated backend service for each type of client interface (eg mobile/web/smartwatch/etc) to combat one-size-fits-all inefficiency or manage app secrets
* **CAP Theorem** aka **Brewer Theorem** (Consistency, Availability, Partition tolerance) = any distributed data store can provide at most two of three properties
* **Domain Event** = emit events when entities get created/updated (eg for CQRS or choregraphy-based sagas), which can get consumed by other services
* **Event-Driven Communication** = 1 to zero/many eventually consistent publish/subscribe mechanism where each service publishes an event whenever it updates its data, to which other service can subscribe (promotes OCP in sender)
* **Gateway Aggregation** pattern = combines multiple individual requests into a single request, so client does not have to make multiple calls to different backend systems to perform an operation
* **Gateway Offloading** pattern = offloads cross-cuttong concerns/shared/specialized service functionality from parts of an application to a gateway proxy (eg authentication, protocol translation, SSL termination, throttling)
* **Integration Event** = handle business tasks that span multiple microservices
* **Load Balancer** = hardware/software that distributes a set of tasks over a set of resources to make overall processing more efficient (can provide authentication/caching/filtering/security features)
  * Traditional load balancers operate at Layer 4 (TCP/UDP) as they route traffic based on IP addresses/ports without inspecting packets (eg Azure Load Balancer)
  * Modern load balancers operate at Layer 7 (HTTP(S)) and a more accurately called Application Delivery Controller (ADC) or reverse proxies with load balancing capabilities
* **Materialized View** pattern = generate prepopulated denormalized views over data from one or more stores in order to optimize query/extraction performance (à la Facebook feed although simpler)
* **Web Accelerator** = hardware/software proxy server that reduces website access time (via caching, preemptive hostname resolve, compression, ad filtering, maintain TCP connections)

### Database

* **Eventual Consistency** = distributed DB model to achieve high availability at the cost (and guarantee) of eventual consistency
* [Saga](https://microservices.io/patterns/data/saga.html) = pattern to handle operations/transactions spanning multiple microservices (one DB per service) via choregraphy (decentralized events) or central orchestration
  * A saga is a sequence of local transactions, which each updates their local DB and publishes a message/event to trigger next local transaction in the saga
  * If a local transaction fails because it violates a business rule then that saga executes a series of compensating transactions that undo changes that were made by preceding local transactions
