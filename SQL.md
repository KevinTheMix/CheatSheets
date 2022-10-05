# SQL

* [Database normalization](https://phoenixnap.com/kb/database-normalization)

## Tips

* Write dangerous queries inside a transaction, and commit it only after everything went smooothly
  * <https://twitter.com/SkaveRat/status/1455525986850721800?s=20>
* Use different schemas for two tables with same name in same DB (when you want fewer DBs).
* Queries can be performed between tables in different DBs (but on the same server) e.g. JOIN.
* Check if other values in a group by are homogen/different: <https://stackoverflow.com/questions/39922045>
  * `COUNT(DISTINCT {field})`
  * `COUNT(CASE WHEN {condition} THEN {expression} END)`
  * Use [Partitions](#partitions)
* `LEN(Koko)` does not account for trailing whitespaces (see <https://stackoverflow.com/a/2025587>)
* Use [ApaxSQL Generate](https://www.apexsql.com/sql-tools-generate/) to generate random sample data for new tables
* `UNION` = removes duplicates
* `UNION ALL` = allows duplicates
* [Graphs, edges, nodes, matches](https://learn.microsoft.com/en-us/sql/t-sql/queries/match-sql-graph) (requires SQL Server 2017+)

## [DDL, DML, DCL, TCL](https://www.geeksforgeeks.org/sql-ddl-dml-dcl-tcl-commands/)

### DDL (Data Definition Language)

* `CREATE`, `ALTER`, `COMMENT`, `DROP`
* `TRUNCATE`
  * Remove all records, unallocate space and resets auto-incremented IDs (basically DROP & re-CREATE a TABLE).
  * DDL operation (unlike DML DELETE) => doesn't use transaction log => won't work if any other (even empty) table references it
* `RENAME`
  * Rename Table = `EXEC sp_rename 'Setting.DE400ImportFormat', 'Setting.ExportColumnFormat' GO`
  * Rename Constraint = `EXEC sp_rename 'Setting.[PK_Setting.DE400ImportFormat]', 'PK_Setting.ExportColumnFormat'`
    * "_When renaming a constraint, the schema to which the constraint belongs must be specified._" (see <https://stackoverflow.com/a/8712921>).

### DML (Data Manipulation Language)

* `INSERT`
  * Inserts multiple rows in one query = `INSERT INTO {Table} ({Col1}, {Col2}, ...) VALUES ({Val1}, {Val2},...),({Val3}, {Val4},...)`
* `SELECT`
  * `IF EXISTS (SELECT TOP 1 1 FROM {A})` = Check if exists
  * `SELECT * FROM {A} WHERE {a} LIKE @var` = Use Variable in a LIKE
  * `SELECT * FROM {A} WHERE {a} IN (@var1, @var2)` = Use Variables in a IN
  * `SELECT {a}, (SELECT {b} FROM {B} WHERE {B}.fkey = {A}.Id) FROM {A}` = Nested SELECT
  * `SELECT {a} FROM {A} WHERE {A}.count > (SELECT COUNT(*) FROM {A})` = Nested WHERE
  * `SELECT {new} FROM (SELECT {expression} AS {new} FROM {A}) AS {New} GROUP BY {new}` = Nested FROM
    * Uses a [Derived Table](https://logicalread.com/when-to-apply-sql-server-derived-tables-mc03/#.XNFNnnduKUk) to precompute a column to use both in the SELECT and GROUP BY clauses.
  * `SELECT MAX(c1) AS Min FROM (VALUES ('a', 1), ('b', 2), ('ab', 3)) t1 (c1, c2) -- 'b'` = Select from inline values
  * **WITH TIES** = returns extra tied values in a _TOP_-limited query eg `SELECT TOP 5  WITH TIES * FROM Table` may return more than 5 values
* `UPDATE`
  * Cannot update several tables at once. See <https://stackoverflow.com/a/36153756>.
* `DELETE`
  * [Delete from multiple tables](https://stackoverflow.com/a/809892)
* [CTE](https://stackoverflow.com/a/13383844)
  * Allows a single pre-prepared computation to be used in multiple places of the subsequent query (any DML clause).
  * Enables recursion.
* `NOT` keyword can be used to invert a condition eg ` SELECT * FROM Customers WHERE NOT Country='Germany'; `

### DCL (Data Control Language)

* `GRANT`, `REVOKE`

### TCL (Transaction Control Language)

* `COMMIT`, `ROLLBACK`, `SAVEPOINT`, `SET TRANSACTION`

## Entities

* [Temporary tables](https://www.red-gate.com/simple-talk/sql/t-sql-programming/temporary-tables-in-sql-server/)
  * [Temporary Table](https://docs.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver15#temporary-tables)
    * `#Temp` = local (session) temporary table
    * `##Temp` = global temporary table
    * Called 'Temp' but really stored physically within _TempDB_
  * `@table` = [Table Variable](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/declare-local-variable-transact-sql?view=sql-server-ver15#c-declaring-a-variable-of-type-table)
    * E.g. `DECLARE @table AS TABLE (Id INT NOT NULL PRIMARY KEY)`
    * These variables are dropped automatically (see <https://stackoverflow.com/a/5653535>)
  * See <https://stackoverflow.com/a/12190754>
* Functions
  * Table-valued Function = user-defined function that returns a table-type data
* Stored Procedure
  * Output parameter = parameter that can be populated via a SET or SELECT
    * `CREATE PROCEDURE (@Output bigint = {default_value_if_missing} OUTPUT) AS BEGIN SELECT|SET @Output = ...`
      * [Default value](https://stackoverflow.com/a/13376799) isn't initialization
    * `EXEC @Output = @Var OUTPUT`
    * An output parameter is actually passed bi-directionally => we cannot simply test `IF @Output IS NULL` after a `SELECT @Output = ..` assignation to determine if the assignation worked, because if it failed, the output parameter then still holds the value that it was provided as input.

### Indexes

To see all the indexes on a particular table execute “sp_helpindex” stored procedure: `EXECUTE sp_helpindex {table_name}`.
Without Indexes, we must resort to Table-scanning, which is browsing the entire table sequentially (O(n)).
SQL Fragmentation = <https://www.mssqltips.com/sqlservertip/4331/sql-server-index-fragmentation-overview/>

### Clustered Index

* Only one such index per table (kinda _primary_)
* Determines the actual order under which the rows get stored, along the chosen column(s)
  * => doesn't require additional storage, because the table itself _is_ the Index
  * insert operation are a bit longer, since new rows must be inserted at the correct ordered position

### Non-clustered Index

* Many possible (different) indexes per table (kinda _secundary_)
* Default if unspecified
* The table itself is not in any particular order; the Index exists on the side, just like a book index is at the end
  * Requires additional storage for the index(es) itself
  * insert operation are a little bit longer, since the Index must get updated as well in addition to the table
* A tiny bit slower than a ClusteredIindex, because the Index must first be browsed, only then the relevant rows of data (whole with all its columns) can be read

### Composite Index

Multiple columns.

## API

```SQL
cast(@number AS float)
convert(type, @value) -- e.g. CONVERT(DATETIME2(0), '2020-03-29 02:00:01.0000000 +01:00')
round(@number, precision, mustTruncate) -- round by default
```

* `GO` = separates statments and immediately runs whatever precedes it when hit, and consider the subsequent lines as part of a new scope
  * Mandatory in some situations, e.g. placing the definition of a SP mid-file, whereas it has to be the only statement in a file (scope).
* `;` = separate statements. Mandatory in CTE when they're not the first statement in the scope.
  * See <https://stackoverflow.com/questions/2853403/sql-server-update-group-by#comment82532249_6984780>
* Ternary operator
  * `CASE WHEN .. THEN .. ELSE .. END`
  * `IIF(condition, then, else)`

### Numbers

* _float_ vs _decimal_
  * Float stores an approximate value and decimal stores an exact value. In summary, exact values like money should use decimal, and approximate values like scientific measurements should use float. When multiplying a non integer and dividing by that same number, decimals lose precision while floats do not.
  * Comparing _float_'s leads to unexpected results, because the number displayed in the cell isn't the actual underlying real value (see <https://stackoverflow.com/questions/16149966>)
    * => use decimal instead of float if equivalences must be established (except blurrier inequalities/ranges)

### Dates

```SQL
-- Types
date -- Just the date part.
time -- Just the time part.
datetime -- 1753 through 9999 with max precision of 3 1/3 milliseconds.
datetime2(fractional_seconds_precision) -- 0001 through 9999, and can be precise down to 100ns.

-- Methods
datefromparts(@year, @month, @day)
-- interval = year, quarter, month, dayofyear, day, week, weekday, hour, minute, second, millisecond, tzoffset (in minutes)
dateadd({interval}, {number}, @date)
datepart({interval}, @date)
year(@date)     -- Year
month(@date)    -- Month
day(@date)      -- Day
eomonth(@date)  -- last day of the @date's month == also the number of days in that month.

-- Operators
@date at time zone 'Central European Standard Time' -- https://docs.microsoft.com/en-us/sql/t-sql/queries/at-time-zone-transact-sql?view=sql-server-ver15
```

### Partitions

[Partitions](https://www.sqlshack.com/sql-partition-by-clause-overview/) are partial GROUP BY, with row numbering, sorting & min/max/average/sum aggregation possibilities.

They can be used to detect/delete duplicates - by partitioning on some fields, ordering on others (eg timestamp), and deleting all rows with index higher than one, eg:

```sql
-- 2) Delete Availabilities (& their Datas) with duplicate Server & Date (& possibly CreatedOn) - keep only (one of) the last CreatedOn.
WITH DuplicateHardwareAvailbilities (Row, Id, HardwareServerId, Date, CreatedOn) AS (
  SELECT ROW_NUMBER() OVER (PARTITION BY HardwareServerId, Date ORDER BY CreatedOn DESC) AS Row, Id, HardwareServerId, Date, CreatedOn FROM app.HardwareAvailability
)
SELECT * INTO #AvailabilitiesToDelete FROM DuplicateHardwareAvailbilities WHERE Row > 1
DELETE FROM app.HardwareData WHERE HardwareAvailabilityId IN (SELECT Id FROM #AvailabilitiesToDelete)
DELETE FROM app.HardwareAvailability WHERE Id IN (SELECT Id FROM #AvailabilitiesToDelete)
DROP TABLE #AvailabilitiesToDelete
GO
```
