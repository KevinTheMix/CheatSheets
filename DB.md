# DB

## Architecture

Use different schemas for two tables with same name in same DB (when you want fewer DBs).

## SQL

* DDL = Data Definition Language
  * CREATE
  * ALTER
  * TRUNCATE = Remove all records & unallocate space
  * RENAME
  * COMMENT
  * DROP
* DML = Data Manipulation Language
  * INSERT
  * SELECT
  * UPDATE
  * DELETE
* DCL = Data Control Language
  * GRANT
  * REVOKE
* TCL = Transaction Control Language
  * COMMIT
  * ROLLBACK
  * SAVEPOINT
  * SET TRANSACTION
* See <https://www.geeksforgeeks.org/sql-ddl-dml-dcl-tcl-commands/>

Multiple Inserted rows in one query

    INTO [Table] ([Column A], [Column B], ...) VALUES ([Value A], [Value B],...),([Value C], [Value D],...)

Check if exists

    IF EXISTS (SELECT TOP 1 1 FROM [Table])

## Indexes

table-scanning = Browsing entire table (O(n)), when there's no index
To see all the indexes on a particular table execute “sp_helpindex” stored procedure
    EXECUTE sp_helpindex {table_name}

* Clustered Index = impacte l'ordre dont les données d'une table sont stockées physiquement, selon la/les colonnes choisies
  * il ne peut y en avoir qu'un par table
  * doesn't use additional storage (table itself becomes sorted)
  * insertion plus longue car triée
* Non-clustered Index = standalone index (cfr index d'un livre)
  * default if unspecified
  * on peut en avoir autant qu'on veut
  * Utilise de l'espace de stockage additionnel (pas la table elle-même)
  * insertion plus longue car l'index doit rester trié (même si pas la table elle-même)
  * un peu plus lent qu'un index clustered car lors d'une recherche portant sur une colonne indexée, l'index est d'abord utilisé pour trouver l'adresse de la ligne, qu'il faut ensuite aller lire dans son intégralité pour avoir la valeur des autres colonnes
* Composite Index = multiple columns

SQL Fragmentation = <https://www.mssqltips.com/sqlservertip/4331/sql-server-index-fragmentation-overview/>
