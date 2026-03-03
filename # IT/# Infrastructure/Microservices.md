# Microservices

## Quick Tips

* [eShop](https://github.com/dotnet/eShop) = reference application using .NET Aspire
* [eShopOnContainers](https://github.com/dotnet-architecture/eShopOnContainers/tree/dev) = reference application (readonly, archived in 2023)
* [Microsoft Learn: Best practices for RESTful web API design](https://learn.microsoft.com/en-us/azure/architecture/best-practices/api-design)
* _Smart endpoints and dumb pipes_ means complexity should reside within microservices themselves, not communication technology between them
* Drawbacks = operational complexity, distributed challenges (network latency, partial failure, debugging), data management (Saga pattern), testing difficulty, organizational overhead, resource consumption, latency
  * Failure to properly clarify service ownership, well-defined API contracts, versioning, boundaries, lead to tightly coupled services that are worse than a monolith (a _distributed monolith_)

## Glossary

* **API Gateway** = single entry point for clients into a group of microservices, instead calling each microservice directly (à la reverse proxy/OO Façade pattern, or BFF if one dedicated gateway tailored per client app type)
  * Provides routing, versioning, caching, authentication/authorization, SSL termination, rate limiting/throttling, load balancing, response aggregation, protocol translation, logging/monitoring
  * Drawbacks = introduces coupling with internal microservices, potential bottleneck/SPOF (so must be scaled), latency (still better than n x direct communications from client to services), development OCP/SRP violation liability
* **Application Delivery Controller** (ADC) = datacenter device often placed in DMZ part of an Application Delivery Network (ADN) that helps perform common tasks (à la web accelerator & load balancer, eg Azure Application Gateway)
* **Backend For Frontend** (BFF) = dedicated backend service for each type of client interface (eg mobile/web/smartwatch/etc) to combat one-size-fits-all inefficiency or manage app secrets
* **CAP Theorem** aka **Brewer Theorem** (Consistency, Availability, Partition tolerance) = any distributed data store can provide at most two of three properties
* **Circuit Breaker** pattern = closed/open/half-open states to protect & help failing services recover (prevents cascading failures, informs failure status to user quickly without timeout, reduces load on a struggling dependency)
* **Domain Event** = emit events when entities get created/updated (eg for CQRS or choregraphy-based sagas), which can get consumed by other services
* **Event-Driven Communication** = 1 to zero/many eventually consistent publish/subscribe mechanism where each service publishes an event whenever it updates its data, to which other service can subscribe (promotes OCP in sender)
* **Exponential Backoff** = retry hitting a failed service strategy where delays are increased each time (potentially with a max & also some randomness to avoid thunder eg `delay = min(base * 2^attempt + random_jitter, max_delay)`)
* **Gateway Aggregation** pattern = combines multiple individual requests into a single request, so client does not have to make multiple calls to different backend systems to perform an operation
* **Gateway Offloading** pattern = offloads cross-cuttong concerns/shared/specialized service functionality from parts of an application to a gateway proxy (eg authentication, protocol translation, SSL termination, throttling)
* **GraphQL** (by _Meta_) = open-source data query/manipulation language for APIs
* **Integration Event** = business tasks that span multiple microservices (eg via **event-based/driven communication**)
* **Load Balancer** = hardware/software that distributes a set of tasks over a set of resources to make overall processing more efficient (can provide authentication/caching/filtering/security features)
  * Traditional load balancers operate at Layer 4 (TCP/UDP) as they route traffic based on IP addresses/ports without inspecting packets (eg Azure Load Balancer)
  * Modern load balancers operate at Layer 7 (HTTP(S)) and a more accurately called Application Delivery Controller (ADC) or reverse proxies with load balancing capabilities
* **Materialized View** pattern = generate prepopulated denormalized views over data from one or more stores in order to optimize query/extraction performance (à la Facebook feed although simpler)
* **REST** (Representational State Transfer) = architecture style for networked/web applications/APIs (stateless, client-server separation, uniform URL/JSON/HTTP methods, cacheable, layered eg transparent intermediate load balancer)
* **Service Registry** pattern = highly available clusterized (eg built-in in AKS) up-to-date DB that maps service names to computer network locations
* **SOAP** (Simple Object Access Protocol) = protocol using XML message format (envelope, encoding rules, call/response convention), communicates over HTTP/TCP/UDP/SMTP application layer
* **Two-Phase Commit** (2PC or tupac) = a distributed algorithm/protocol to coordinate distributed atomic transactions and whether to commit or abort them (one node acts as coordinators and commits if all nodes succeed)
  * Introduces coupling/resources locking/lack of scalability/availability issues as it requires cooperation/synchronization between nodes, which makes it not ideal for a distributed microservices architecture
  * Instead, microservices rather use eventual consistency, saga pattern (local transactions with compensating rollbacks), event sourcing (propagates changes asynchronously), idempotent operations (allows safe retries)
* **Web Accelerator** = hardware/software proxy server that reduces website access time (via caching, preemptive hostname resolve, compression, ad filtering, maintain TCP connections)

* **Swagger** (aka **OpenAPI**) = framework & tools for designing/documenting/consuming RESTful web services
  * **OpenAPI Specification** (OAS) = machine-readable IDL for describing/procuding/consuming/visualizing web services, a language-agnostic (YAML or JSON) format that describes APIs
  * **Swagger Codegen** = generates client libraries, server stubs, API documentation from an OAS
  * **Swagger Editor** = open-source editor to write OAS
  * **Swagger Hub** = commercial platform with a collaborative environment for designing/documenting APIs
  * **Swagger Metadata** = json/yaml file content served dynamically (ie generated at runtime) when hitting its URL (eg _swagger.json_), that enables service discovery (eg for doc/client generation or testing tools eg Postman)
  * **Swagger UI** (aka **swagger-ui**) = web-based UI automatically generated from a OAS, that documents an API and is able to make direct request/response to it

### .NET Nugets

* **API Versioning** (_Asp.Versioning_) = HTTP versioning for web services methods, typically used alongside MediatR
* **AspNetCore.Diagnostics.HealthChecks** = health checks (ie Liveness if it responds, Readiness if its dependencies are ready too)
* **Brighter** (_Paramore_) = open-source command processor & message dispatcher for .NET, built around the Command Pattern and supporting request/response, event-driven, and task queue styles of communication
* **MassTransit** = open-source popular/reliable/scalable/secure messaging framework, infrastructure abstraction layer on top of message brokers (à la EF for DB, à la OpenTelemetry for observability)
* **Microsoft.Diagnostics.EventFlow** = distributed logging tool to collect event streams from multiple sources and publishes them to output systems (eg standard output or cloud systems)
* **NServiceBus** (_Particular Software_) = .NET library that abstracts messaging (transport/storage) between distributed services via transport-agnostic code
  * **Endpoint** = service with a logical name that send/receive/publishes messages
  * **Handler** = class that processes incoming messages, one per message type, auto-invoked when messages arrive
  * **Message** = either a Command (do X, one recipient) or an Event (X has happened, broadcasted to all listeners)
  * **Recoverability** = automatic retries, error queues, dead-letter handling when things fail
  * **Saga** = stateful handler for long-running workflows that span multiple messages
  * **Transport** = underlying message broker technology (eg RabbitMQ, MSMQ, Azure Service Bus, Amazon SQS, SQL Server for message store, etc) performing actual transport
* **NSwag** = open-source library that can generate OpenAPI specification from controllers (à la Swashbuckle), **and** it can generate client code (C#/TypeScript) from any OpenAPI spec
* **Nswag.MSBuild** = integrates NSWag API client/server code generation into MSBuild system (enables automating code generation during build process without running app, useful for CI/CD pipelines)
* **Ocelot** = lightweight .NET Core-based API gateway (ie unified entry point into microservices architecture)
* **OpenTelemetry** = packages for specific instrumentation & exporters (ASP.NET Core, automatic HTTP request tracing, SQL DB calls, send data somewhere)
* **Polly** = handles transient faults & improves app resilience via configurable strategies (retry, circuit breaker, hedging, timeout, rate limiter, fallback) to handle failures/slowdowns in a fluent & thread-safe way
* **Swashbuckle** = generates OpenAPI specification from controllers & models at runtime (now shifted towards built-in _Microsoft.AspNetCore.OpenApi_ package)
  * Also packs an embedded version of swagger-ui that is served up
* **YARP** (Yet Another Reverse Proxy) = reverse proxying & load balancing, routes requests based on paths/headers/custom logic

### Database

* DB updates are propagated via either application-level events, or DB-level outbox/CDC replication pattern
* In a real production environment, for high availability & scalability, DBs should be based on cloud or on-premises servers, but not in containers
  * Alternatively, scale DBs via using a single **primary** DB used for all writes, replicated (at DB engine level) to readonly copies (since 80% of workloads are read queries)

* **Eventual Consistency** = distributed DB model to achieve high availability at the cost (and guarantee) of eventual consistency
* [Saga](https://microservices.io/patterns/data/saga.html) = pattern to handle operations/transactions spanning multiple microservices (one DB per service) via choregraphy (decentralized events) or central orchestration
  * A saga is a sequence of local transactions, which each updates their local DB and publishes a message/event to trigger next local transaction in the saga
  * If a local transaction fails because it violates a business rule then that saga executes a series of compensating transactions that undo changes that were made by preceding local transactions
* **Multi-Master** aka **Distributed** DB = all nodes accept write then use consensus protocols internally so every node agree on state, it scalability at cost of latency (eg CockroachDB, Spanner)
* **Shard** = split data into multiple DBs by some key (eg A-M got to DB1, N-Z go to DB2)

## TODO

* [Create cloud-native apps and services with .NET and ASP.NET Core](https://learn.microsoft.com/en-us/training/paths/create-microservices-with-dotnet)
