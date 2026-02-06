# Database

## Quick Tips

* [Saga](https://microservices.io/patterns/data/saga.html) = pattern to handle operations spanning multiple microservices (one DB per service) via choregraphed events/orchestrated messages
* [Coding Horror - A Visual Explanation of SQL Joins](https://blog.codinghorror.com/a-visual-explanation-of-sql-joins)

## Glossary

* **ACID** (Atomicity, Consistency, Isolation, Durability) = DB transactions properties intended to guarantee data validity despite errors & failures
* [Aggregate functions](https://learn.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql) = (eg `COUNT`, `MIN`/`MAX`, `AVG`, `SUM`)
* **BLOB** (Binary Large OBject) = data storage as unstructured objects/files (eg images, videos, executable, texts)
* **Candidate Key** (aka Natural key, or Domain key or Business key) = a key that _could_ be used as PK instead of the PK (ie it is also unique for each rows/values in the set)
* **Clause** = built-in functions/operators (such as `SELECT`, `WHERE`, `AND`, `OR`, `LIKE`, `TOP`)
* **Column-Oriented** = pivot a row of data into horizontal columns (efficient homogenous column-based compression, slower writes, much faster aggregated reads for analytics)
* **CTE** (Common Table Expression) = intermediary virtual tables whose data are piped/reusable to the following DML statement/CTE, also enables recursion
* **Cursor** = a type of variable that can keep browse a query result set (eg `DECLARE CURSOR {name} FOR SELECT …`)
  * Avoid cursors by thinking less in terms of loops and more in terms of sets (as SQL was intended)
* **Data Lake** = large storage space of hybrid mess (no DB engine, just files storage)
* **Data Warehouse** = almost always column-oriented structured queryable DB
* **Data Lakehouse** = consistency/structural layer on top of a Data Lake to make it queryable like a Data Warehouse
* **Eager Read Derivation** = preparing report (DBs) on writes rather than reads (à la Facebook homepage)
  * See <https://martinfowler.com/bliki/EagerReadDerivation.html>
* **Eventual Consistency** = distributed DB model to achieve high availability at the cost (and guarantee) of eventual consistency
* [Fragmentation](https://www.mssqltips.com/sqlservertip/4331/sql-server-index-fragmentation-overview) = internal (too much free space) or external (table storage pages are out of order)
* **Graph DB** = stores explicit connections between items (as edges), unlike a vector DB storing implicit similarity between items
* **Index** = a lookup table applied to PK, FK and UNIQUE-constrained fields that enables dichotomical (_log(n)_) searches, as opposed to slow sequential _O(n)_ table-scanning (reads get faster, but inserts get slower)
  * Indexes should apply to shortest & stablest fields so browsing them is efficient
  * **Clustered Index** = one per table, data gets inserted in actual order of chosen column (doesn't require additional storage as the table itself _is_ the Index), Inserts are slower since new rows must be placed corectly
  * **Non-clustered Index** (_default_) = many per table, Index exists on the side (just like a book index is at the end), requires additional storage for the index(es), inserts also a little bit longer to update the Index
    * A tiny bit slower than a **Clustered Iindex**, because the Index must first be browsed, only then the relevant rows of data (whole with all its columns) can be read
  * **Composite Index** = composed of multiple columns
* **Joins** = composes columns originating from multiple tables (`INNER`, `LEFT`/`RIGHT`/`FULL OUTER`, `CROSS` aka Cartesian product)
  * Joins can be performed between tables in different DBs (but on the same server)
* **N+1 Select Problem** = using separate independant queries for a main entity then each of its children (solution is loading all collections & perform lookups there in memory, or better a single JOIN)
* **Normalization** = structure relational DB data to reduce redundancy & improve integrity
  1. no repetitive attributes, Primary Key
  2. 1NF + non-key attributes cannot depend on part of a key
  3. 2NF + no functional dependency between non-key attributes
* **NoSQL** (Not Only SQL or Non-relational) = schema-less, non tabular relations more flexible DB, via different data structure (eg key–value pair, wide column, graph, or document), making some operations faster
* **ORM (Object-Relational Mapping)** = technique for converting data between a relational DB and the heap of an OO programming language
* **Replication** = copying of data from a primary to replica DBs in order to achieve distributedness and/or reliability (either triggered in real-time, or scheduled by batch)
* **Reporting Database** = (one or more) read-only DBs dedicated to getting queryed (ie not updated from direct user interactions) efficiently
  * See <https://martinfowler.com/bliki/ReportingDatabase.html>
* **Saga** = pattern for managing transactions that span multiple services (ie where traditional monolithic transactions cannot be used), either through choregraphy (decentralized events) or central orchestration
* **Schema** = namespace-like containing other DB entities, to which granular permissions can apply (eg `CREATE SCHEMA {name} AUTHORIZATION {user}`)
  * Tables created without a schema specified will get a default schema applied (_dbo_)
  * Two tables with the same name can coexist in the same DB if they have different schemas
* **Transaction** = segment of code where lack of integrity is locally/temporarily permitted (constraints will be tested at next commit, no longer for every action), and that can be applied or cancelled (on demand/error)
* **Transaction log** = records transactions & the modifications made by each of them
* **Two-Phase Commit Protocol** = type of atomic commitment protocol, a distributed algorithm coordinating distributed atomic transactions and whether to commit or abort them
* **Union** = concatenates result sets from two queries with identical columns number/order and compatible data types compatible (`UNION` removes duplicates, `UNION ALL` allows duplicates)
* **Vector DB** = nearest neighbor/similarity & semantic searches rather than exact matching (à la ElasticSearch for complex entities)
* **Wildcards** = matches one (`_`), or several (`%`), or ranges of characters (`[a-z0-9.,;]` or opposite `[^…]`) as part of a `LIKE` clause
* **Write-ahead Logging** = techniques for atomicity & durability (two of ACID properties), and an implementation of Event Sourcing architecture
* **Write-ahead Log** = append-only structure for crash & transaction recovery where changes are initially written before being actually applied

## Tools

* **Apache TinkerPop** = graph computing framework for graph DB (OLTP) & graph analytic systems (OLAP), using Gremlin Query Language (GQL) for graph traversal
* **Cassandra** (by **Apache**) = FOSS distributed wide-column store NoSQL DB designed to handle large amounts of data across servers (high availability with no SPoF)
* Data Bricks
* [dbdiagram.io](https://dbdiagram.io) = online DB diagrams
* **DB Browser for SQLite** = SQLite DB IDE
* **GraphQL** = DB-agnostic data query/manipulation language for APIs, letting a client specify data to fetch (possibly from separate sources as one unified result)
* **Gremlin** = graph DB
* **PowerBuilder** = .NET compatible IDE (by SAP) using _DataWindow_ objects to CRUD query a DB
* **Redis** (Remote Dictionary Server) = open source in-memory storage for caching & extremely fast access to frequently used transient (short-lived) data, as a distributed key-value DB & message broker
* **SQL Manager for MySQL** = MySQL DB IDE (also for PostgreSQL, Oracle, DB2)
* **SQL Manager for SQL Server** = SQL Server IDE (SMSS-like)
* **SQuirreL SQL Client** = Java-based multi-DB administration tool
* **Unity Catalog** = data governance layer for _Databricks_ Lakehouse
