# PostgreSQL

## Quick Tips

## Glossary

* **JSONB** (Binary JSON) = binary representation of JSON data in PostgreSQL, for fast querying & data manipulation
* **Multi-Version Concurrency Control** (MVCC) = mechanism that allows concurrent reads & writes by keeping multiple versions of rows instead of locking them
* **VACUUM** = maintenance process that cleans up obsolete row versions created by MVCC & makes their space reusable
* _Marten_ = .NET library for a transactional document DB & event store on PostgreSQL (ie event sourcing built on top of PostgreSQL, ie simple for developers to add to an existing PostgreSQL DB)

## API

* `CREATE DOMAIN` = creating a subtype based on an existing type (adding constraints to it, à la C# inherited class ([CREATE DOMAIN vs CREATE TYPE](https://stackoverflow.com/a/53142713)))
* `INSERT INTO <table> (colA, colB) VALUES (...) ON CONFLICT (<colA>) DO UPDATE SET colB = EXCLUDED.colB` = upsert (à la T-SQL `MERGE`), on unique/PK violation of the conflict target, update the existing row instead
  * **EXCLUDED** = special pseudo-table holding the row proposed for insertion (ie the rejected values), whereas `<table>.colB` refers to the existing row (eg `SET colB = <table>.colB + EXCLUDED.colB`)
  * `ON CONFLICT ON CONSTRAINT <constraint>` = conflict target given by constraint name instead of columns
  * `DO UPDATE SET ... WHERE <condition>` = only update when condition is met (eg `WHERE <table>.updated_at < EXCLUDED.updated_at`), otherwise the row is skipped
  * `DO NOTHING` = silently skip conflicting rows (conflict target optional)
* `SELECT DISTINCT ON(<colA>) colA, colB, FROM <table> ORDER BY colA, colB` = group by colA and keep only first/top row of each group returned (à la CTE + partition in T-SQL)
