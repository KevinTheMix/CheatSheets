# Microservices Architecture

## Corrections

32 Most is part of the previous url
32 proces -> process
35 ok -> acceptable
37 provides a great way to provide -> {something else}

## 1. Intro

## 2. Docker

Cloud vs on-premises

## 3. .NET Core vs .NET Framework

* Core
  * Cross-platform (so, not Windows only)
  * Microservices
  * Lighter & Faster (& philosophy compatible with containers)
* .NET
  * Existing .NET Framework application tied to Windows (=> use Windows Containers)
  * Uses Windows API unsupported by Core
  * Uses 3rd party unsupported by Core

Basically, use .NET Core unless there are old Windows or 3rd party dependencies that won't work with it, or to containerize legacy .NET Framework applications (ASP.NET WebForms, MVC web apps, WCF).

Side by side versions = having different versions coexist.
This is not entirely possible with .NET Framework because it doesn't fully separate its versions, especially minor or related major versions (i.e. 3.5 & 3.0 are based on 2.0).
So, you can't target a specified framework minor version and expect things to work when then upgrading it for another solution; the first one will get impacted.
See <https://stackoverflow.com/questions/49164607/multiple-versions-of-net-on-the-same-server>

Using container for old .NET application still valid to facilitate deployment and increase its reliability. But then write new additional services in .NET Core.

Windows Compatibility Pack = Bring Windows-specific features present in .NET Framework onto .NET Standard (& Core): WCF, Web Forms. Installed as a Nuget package.
CoreFX = .NET Core open source project (on Github).

## 4. Architecting Applications

Each MS owns its business models & logic (decentralized sovereign approach).
Maintainable, Modular, Agile, Scalable, Deployable in fine-grained independently Testable units, breaking down complexity, enabling CI/CD, Hybrid (various languages, DBs & Teams).

### Martin Fowler's Microservices

<https://www.martinfowler.com/articles/microservices.html>
Fowler talks about moving away from monolithic applications and towards MS based systems.

Don't just replace method calls with HTTP calls, because that cost resources and would be inefficient.
Use coarser-grained approach.

Break down monolithic applications and redistribute their teams so they aren't just divided by the UI-Domain-Data layers paradigm, but in a multitude of WSs that each contain their own narrower UI-Domain-Data layers.
One service is then built by a team of various specialists, a concept called Product-centered teams.
À la Amazon's "you built it, you run it": developers are also responsible for operation, so they better get things right.

Don't try to create models that would be used across the whole business.
Use DDD instead, and divide up the business models into Bounded Contexts, each with its own internal Models.
Then implement each Bounded Context by one Microservice.
Same thing for databases, split up a single relational database into many application databases, each managed by its own service.

The desirable uncoupling provided by Microservices also leads to additional complexity.
In particular, we should check for any failure of communications between WSs, and real-time monitoring & logging should be applied.
Not only monitoring if one service fails, or latency, or number of DB requests, but also business logging, e.g. sales are decreasing for a particular page.

Add new WSs to an existing mono-application, by focusing on replaceability, and join things that change at the same pace, separating those that don't.

## 5. Development Process

