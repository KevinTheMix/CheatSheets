# DB

## Architecture

Use different schemas for two tables with same name in same DB (when you want fewer DBs).

## SQL

* DDL = Data Definition Language
  * CREATE
  * ALTER
  * TRUNCATE = Remove all records & unallocate space
    * Note this is DDL! Unlike DELETE
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

* Renaming a table
    EXEC sp_rename 'Setting.DE400ImportFormat', 'Setting.ExportColumnFormat'
    GO
* Renaming a constraint
    EXEC sp_rename 'Setting.[PK_Setting.DE400ImportFormat]', 'PK_Setting.ExportColumnFormat'
  * "_When renaming a constraint, the schema to which the constraint belongs must be specified._" (see <https://stackoverflow.com/a/8712921>).

### DML

#### SELECT

* Check if exists
    IF EXISTS (SELECT TOP 1 1 FROM [Table])
* Use Variable in a LIKE
    SELECT * FROM Table WHERE a LIKE @a
* Use Variables in a IN
    SELECT * FROM Table WHERE a IN (@a, @b)

Subqueries can follow these keywords:

* SELECT
    SELECT a, (SELECT b FROM B WHERE B.fkey = A.Id)
    FROM A
* FROM
    SELECT tag
    FROM (SELECT {expression} AS tag FROM A) AS AA GROUP BY tag
* WHERE
    SELECT a
    FROM A
    WHERE A.count > (SELECT COUNT(*) FROM A)

See [Derived Tables](https://logicalread.com/when-to-apply-sql-server-derived-tables-mc03/#.XNFNnnduKUk)
Also see [CTE](https://stackoverflow.com/a/13383844), which allows a single pre-prepared computation to be used in multiple places of the subsequent query.

#### Insert

Multiple Inserted rows in one query

    INTO [Table] ([Column A], [Column B], ...) VALUES ([Value A], [Value B],...),([Value C], [Value D],...)

#### UPDATE

Cannot be used to update several tables at once.
See <https://stackoverflow.com/a/36153756>.