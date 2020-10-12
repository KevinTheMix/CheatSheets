# SQL

## Tips

* Use different schemas for two tables with same name in same DB (when you want fewer DBs).
* Queries can be performed between tables in different DBs (but on the same server) e.g. JOIN.
* [DDL, DML, DCL, TCL](https://www.geeksforgeeks.org/sql-ddl-dml-dcl-tcl-commands/)

## DDL

Data Definition Language

* **CREATE**
* **ALTER**
* **TRUNCATE**
  * Remove all records, unallocate space and resets auto-incremented IDs (basically DROP & re-CREATE a TABLE).
  * DDL operation (unlike DML DELETE) => doesn't use transaction log => won't work if any other (even empty) table references it
* **COMMENT**
* **DROP**
* **RENAME**
  * Rename Table = `EXEC sp_rename 'Setting.DE400ImportFormat', 'Setting.ExportColumnFormat' GO`
  * Rename Constraint = `EXEC sp_rename 'Setting.[PK_Setting.DE400ImportFormat]', 'PK_Setting.ExportColumnFormat'`
    * "_When renaming a constraint, the schema to which the constraint belongs must be specified._" (see <https://stackoverflow.com/a/8712921>).

## DML

Data Manipulation Language

* **INSERT**
  * Inserts multiple rows in one query = `INSERT INTO {Table} ({Col1}, {Col2}, ...) VALUES ({Val1}, {Val2},...),({Val3}, {Val4},...)`
* **SELECT**
  * `IF EXISTS (SELECT TOP 1 1 FROM {A})` = Check if exists
  * `SELECT * FROM {A} WHERE {a} LIKE @var` = Use Variable in a LIKE
  * `SELECT * FROM {A} WHERE {a} IN (@var1, @var2)` = Use Variables in a IN
  * `SELECT {a}, (SELECT {b} FROM {B} WHERE {B}.fkey = {A}.Id) FROM {A}` = Nested SELECT
  * `SELECT {a} FROM {A} WHERE {A}.count > (SELECT COUNT(*) FROM {A})` = Nested WHERE
  * `SELECT {new} FROM (SELECT {expression} AS {new} FROM {A}) AS {New} GROUP BY {new}` = Nested FROM
    * Uses a [Derived Table](https://logicalread.com/when-to-apply-sql-server-derived-tables-mc03/#.XNFNnnduKUk) to precompute a column to use both in the SELECT and GROUP BY clauses.
* **UPDATE**
  * Cannot update several tables at once. See <https://stackoverflow.com/a/36153756>.
* **DELETE**
  * [Delete from multiple tables](https://stackoverflow.com/a/809892)
* [CTE](https://stackoverflow.com/a/13383844)
  * Allows a single pre-prepared computation to be used in multiple places of the subsequent query (any DML clause).
  * Enables recursion.

## DCL

Data Control Language

* **GRANT**
* **REVOKE**

## TCL

Transaction Control Language

* **COMMIT**
* **ROLLBACK**
* **SAVEPOINT**
* **SET TRANSACTION**

## Indexes

To see all the indexes on a particular table execute “sp_helpindex” stored procedure: `EXECUTE sp_helpindex {table_name}`.
Without Indexes, we must resort to Table-scanning, which is browsing the entire table sequentially (O(n)).
SQL Fragmentation = <https://www.mssqltips.com/sqlservertip/4331/sql-server-index-fragmentation-overview/>

### Clustered Index

* Impacte l'ordre dont les données d'une table sont stockées physiquement, selon la/les colonnes choisies
* il ne peut y en avoir qu'un par table
* doesn't use additional storage (table itself becomes sorted)
* insertion plus longue car triée

### Non-clustered Index
  
* standalone index (cfr index d'un livre)
* default if unspecified
* on peut en avoir autant qu'on veut
* Utilise de l'espace de stockage additionnel (pas la table elle-même)
* insertion plus longue car l'index doit rester trié (même si pas la table elle-même)
* un peu plus lent qu'un index clustered car lors d'une recherche portant sur une colonne indexée, l'index est d'abord utilisé pour trouver l'adresse de la ligne, qu'il faut ensuite aller lire dans son intégralité pour avoir la valeur des autres colonnes

### Composite Index

Multiple columns.
