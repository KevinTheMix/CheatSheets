# DB

## Architecture

* Use different schemas for two tables with same name in same DB (when you want fewer DBs).

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