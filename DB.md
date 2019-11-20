# DB

## Architecture

Use different schemas for two tables with same name in same DB (when you want fewer DBs).

## SQL

* DDL = Data Definition Language
  * CREATE
  * ALTER
  * TRUNCATE = Remove all records & unallocate space
    * Note this is DDL! Unlike DELETE
      * Doesn't use transaction log => doesn't work if another table (even empty) references it
    * The auto-incremented value of the ID column is also reset
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

### DDL

Renaming a table

    EXEC sp_rename 'Setting.DE400ImportFormat', 'Setting.ExportColumnFormat'
    GO

Renaming a constraint

    EXEC sp_rename 'Setting.[PK_Setting.DE400ImportFormat]', 'PK_Setting.ExportColumnFormat'

"_When renaming a constraint, the schema to which the constraint belongs must be specified._" (see <https://stackoverflow.com/a/8712921>).

### DML

#### SELECT

Check if exists

    IF EXISTS (SELECT TOP 1 1 FROM [Table])

Use Variable in a LIKE

    SELECT * FROM Table WHERE a LIKE @a

Use Variables in a IN

    SELECT * FROM Table WHERE a IN (@a, @b)

Subqueries can follow these keywords:

SELECT

    SELECT a, (SELECT b FROM B WHERE B.fkey = A.Id)
    FROM A

FROM

    SELECT tag
    FROM (SELECT {expression} AS tag FROM A) AS AA GROUP BY tag

WHERE

    SELECT a
    FROM A
    WHERE A.count > (SELECT COUNT(*) FROM A)

See [Derived Tables](https://logicalread.com/when-to-apply-sql-server-derived-tables-mc03/#.XNFNnnduKUk)
Also see [CTE](https://stackoverflow.com/a/13383844), which allows a single pre-prepared computation to be used in multiple places of the subsequent query.

#### Insert

Multiple Inserted rows in one query

    INTO [Table] ([Column A], [Column B], ...) VALUES ([Value A], [Value B],...),([Value C], [Value D],...)

#### UPDATE

Cannot be used to update several tables at once. See <https://stackoverflow.com/a/36153756>.

#### DELETE

* [Delete from multiple tables](https://stackoverflow.com/a/809892)

## Indexes

table-scanning = Browsing entire table (O(n)) sequentially, when there's no index
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
