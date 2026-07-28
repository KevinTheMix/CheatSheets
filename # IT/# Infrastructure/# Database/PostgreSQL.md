# PostgreSQL

## Quick Tips

## Glossary

* **JSONB** (Binary JSON) = binary representation of JSON data in PostgreSQL, for fast querying & data manipulation

* _Marten_ = .NET library for a transactional document DB & event store on PostgreSQL (ie event sourcing built on top of PostgreSQL, ie simple for developers to add to an existing PostgreSQL DB)

## API

* `CREATE DOMAIN` = creating a subtype based on an existing type (adding constraints to it, à la C# inherited class ([CREATE DOMAIN vs CREATE TYPE](https://stackoverflow.com/a/53142713)))
* `SELECT DISTINCT ON(<colA>) colA, colB, FROM <table> ORDER BY colA, colB` = group by colA and keep only first/top row of each group returned (à la CTE + partition in T-SQL)
