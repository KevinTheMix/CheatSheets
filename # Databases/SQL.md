# SQL (Structured Query Language)

Transact-SQL (**T-SQL**) is Microsoft's and Sybase's proprietary SQL extension.

## Quick Tips

* Add a `RETURN -- Safety first` first statement to scripts in progress to guard against unintended executions
* [Always use a transaction](https://x.com/SkaveRat/status/1455525986850721800) while testing queries (check everything went smoothly then commit)
* [Column Description](https://stackoverflow.com/a/9018619) = comment on a column
* `ORDER BY i` = ordering by ith column
* `ORDER BY NEWID()` = (incombination with `TOP 1`) obtain a random row

## Glossary

* **DDL** (Data Definition Language) = CRUD meta-objects (tables, indices, users), doesn't use transaction log (unlike DML) so some statements won't work if an (even empty) table references it
  * `CREATE` (`TABLE`, `TYPE` à la C# class), `ALTER`, `DROP`, `TRUNCATE`, `RENAME` (specify schema when renaming constraints like PKeys), `COMMENT ON`
  * `TRUNCATE` basically DROPs & re-CREATEs a TABLE (resets auto-incremented IDs)
* **DQL** (Data Query Language) = `SELECT` (also `SHOW`, `EXPLAIN`, `HELP`)
  * **FROM VALUES** = select from inline values (eg `SELECT col1 FROM (VALUES (a1, a2), (b1, b2), (c1, c2) A (col1, col2)`)
  * **WITH TIES** = includes tied values in a _TOP_-limited query (eg `SELECT TOP n WITH TIES * FROM Table` may return more than _n_ values)
  * **IF/WHERE** + **ANY|SOME** or **ALL** or **IN** (à la Linq) + nested select = checks for some/all values in a set (nested select eg `IF 18 > ALL (SELECT Age FROM A)`)
  * **IF/WHERE** + nested select with _aggregate_ function = compare against one value (eg `SELECT * FROM People WHERE money > (SELECT AVG(money) FROM People)`)
  * **IF/WHERE** + **(NOT) EXISTS (SELECT TOP 1 1 FROM T …)** = check if SELECT returned anything (SELECT itself always returns a table (a _values set_) not a scalar)
  * **SELECT, SELECT** = (eg `SELECT A.*, (SELECT * FROM B WHERE B.Fk = A.Id) FROM A`, here used like an inner join)
  * **FROM A,B,…** (multiple tables) = another way to join (eg `SELECT A.*, B.* FROM A,B WHERE A.Id = B.Id`)
  * **FROM SELECT** = nested from, can be used to precompute an expression to use in both the SELECT & GROUP BY clauses (eg `SELECT {new} FROM (SELECT {expression} AS {new} FROM {A}) AS {New} GROUP BY {new}`)
    * See [Derived Table](https://logicalread.com/when-to-apply-sql-server-derived-tables-mc03)
* **DML** (Data Manipulation Language) = CRUD data (`INSERT`, `UPDATE`, `DELETE`)
  * `INSERT` = create (eg multiple rows in one query `INSERT INTO Koko (col1, col2) VALUES (a1, a1, …),(b3, b2, …)` or from multiple selects `INSERT C ({all_columns}) SELECT A.*, B.* FROM A,B WHERE A.Id = B.Id`)
  * `UPDATE` can contain a `JOIN`, but [only one table can be modified at once](https://stackoverflow.com/a/36153756)
  * `DELETE` similarly cannot do multiple table at once (but we can [DELETE from multiple tables](https://stackoverflow.com/a/809892) using a table variable where successive deleted indices get saved, and commit at the end)
* **DCL** (Data Control Language) = managing permissions (granularly eg read not write (_readonly_), write not read (_mailbox_), `GRANT`, `REVOKE`, `WITH GRANT OPTION` = propagate granting permission)
* **TCL** (Transaction Control Language) = manipulates transactions (`COMMIT`, `ROLLBACK`, `SAVEPOINT`, `SET TRANSACTION`)
  * `COMMIT`s/`ROLLBACK`s only apply to **DML** => when a **DDL** instruction is found in the source, the DML that precedes gets committed

* [Aggregate functions](https://learn.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql) = (eg `COUNT`, `MIN`/`MAX`, `AVG`, `SUM`)
* **Candidate Key** (aka Natural key, or Domain key or Business key) = a key that _could_ be used as PK instead of the PK (ie it is also unique for each rows/values in the set)
* **Clause** = built-in functions/operators (such as `SELECT`, `WHERE`, `AND`, `OR`, `LIKE`, `TOP`)
* **CTE** (Common Table Expression) = intermediary virtual tables whose data are piped/reusable to the following DML statement/CTE, also enables recursion
* **Cursor** = a type of variable that can keep browse a query result set (eg `DECLARE CURSOR {name} FOR SELECT …`)
  * Avoid cursors by thinking less in terms of loops and more in terms of sets (as SQL was intended)
* **Database Normalization** = structure relational DB data to reduce redundancy & improve integrity
  1. no repetitive attributes, Primary Key
  2. 1NF + non-key attributes cannot depend on part of a key
  3. 2NF + no functional dependency between non-key attributes
* [Error handing](https://www.sqlshack.com/how-to-implement-error-handling-in-sql-server)
* [Fragmentation](https://www.mssqltips.com/sqlservertip/4331/sql-server-index-fragmentation-overview) = internal (too much free space) or external (table storage pages are out of order)
* [Geometry](https://learn.microsoft.com/en-us/sql/t-sql/spatial-geometry/spatial-types-geometry-transact-sql) = geometry type for space boundaries checking (& drawing)
* [Graph tables](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-sql-graph) = create (graph) `NODE` or `EDGE` tables (requires SQL Server 2017+)
  * [Graph search](https://learn.microsoft.com/en-us/sql/t-sql/queries/match-sql-graph) = match search along edges & nodes tables
* **ID** (Identity)
  * `NEWID()` = get a new `uniqueidentifier` (an UUID)
  * `SET INSERT_IDENTITY ON|OFF` = indicates whether an ID field can be manually set on insert
  * Last generated (auto-incremental) Id = `@@IDENTITY` (by connection), `SCOPE_IDENTITY()` (by connection & scope), `IDENT_CURRENT('table')` (by table, regardless of connection/sessions)
* **Index** = a lookup table applied to PK, FK and UNIQUE-constrained fields that enables dichotomical (_log(n)_) searches, as opposed to slow sequential _O(n)_ table-scanning (reads get faster, but inserts get slower)
  * Indexes should apply to shortest & stablest fields so browsing them is efficient
  * `sp_helpindex` (built-in stored procedure) returns all the indexes on a particular table: `EXECUTE sp_helpindex {table_name}`
  * **Clustered Index** = one per table, data gets inserted in actual order of chosen column (doesn't require additional storage as the table itself _is_ the Index), Inserts are slower since new rows must be placed corectly
  * **Non-clustered Index** (_default_) = many per table, Index exists on the side (just like a book index is at the end), requires additional storage for the index(es), inserts also a little bit longer to update the Index
    * A tiny bit slower than a **Clustered Iindex**, because the Index must first be browsed, only then the relevant rows of data (whole with all its columns) can be read
  * **Composite Index** = composed of multiple columns
* **Joins** = composes columns originating from multiple tables (`INNER`, `LEFT`/`RIGHT`/`FULL OUTER`, `CROSS` aka Cartesian product)
  * Joins can be performed between tables in different DBs (but on the same server
* [N + 1 problem](https://stackoverflow.com/q/97197/861716) = performing a separate query for getting each child item vs loading both collection and performing lookups there in memory
* **Output parameters** = input **and** output parameter (bi-directional, so be careful with any code in the SP that checks whether its value was changed - it may not be _NULL_ coming in)
  1. Declare eg `CREATE PROCEDURE Schema.SP @Output type (= default_value) OUTPUT` where [default value is applied only if that parameter was not passed (at all)](https://stackoverflow.com/a/13376799) (not an initialization)
  2. Set eg `SELECT @Output = column FROM TABLE {…}` or `SET @Output = value`
  3. Call eg `EXEC Schema.SP @Output = value OUTPUT`
* [Partitions](https://www.sqlshack.com/sql-partition-by-clause-overview) = subgrouping with row ranking/numbering (`RANK|ROW_NUMBER() OVER (PARTITION BY …)`), sorting & min/max/average/sum aggregation capabilities
  * Use to detect duplicates: partition on some possibly duplicate field(s) ordering on others (eg a timestamp), then delete rows with number higher than one (ie keeping only first created)
  * Eg `SELECT ROW_NUMBER() OVER (PARTITION BY HServerId, Date ORDER BY CreatedOn DESC) AS Row, Id, HServerId, Date, CreatedOn FROM app.HAvailability` (within a CTE or [nested FROM](https://stackoverflow.com/a/3491378))
  * [Alternative homogeneity detection](https://stackoverflow.com/questions/39922045) (eg `HAVING COUNT(DISTINCT column) <> 1` for all, or `HAVING COUNT(CASE WHEN column = 'value' THEN 1 END) = COUNT(*)` for a given _value_)
* **Schema** = namespace-like containing other DB entities, to which granular permissions can apply (eg `CREATE SCHEMA {name} AUTHORIZATION {user}`)
  * Tables created without a schema specified will get a default schema applied (_dbo_)
  * Two tables with the same name can coexist in the same DB if they have different schemas
* [Temporary tables](https://www.red-gate.com/simple-talk/sql/t-sql-programming/temporary-tables-in-sql-server)
  * **Table variable** = variable of type `TABLE` (eg `DECLARE @table TABLE ({inline_columns_definition})`, [local and automatically dropped](https://stackoverflow.com/a/5653535))
  * **Temporary table** = temporary (but actually _physically stored_ inside _TempDB_) table visible to current session or all sessions (`#Temp` or `##Temp` eg `SELECT * INTO #Koko` then `DROP TABLE #Koko`)
  * **Table-valued parameters** = table variable that extends its use (saved in _TempDB_ then passed by reference)
  * **Table-valued function** = user-defined function that returns a `TABLE`-type data
* **Transaction** = segment of code where lack of integrity is locally/temporarily permitted (constraints will be tested at next commit, no longer for every action), and that can be applied or cancelled (on demand/error)
* **Transaction log** = records transactions & the modifications made by each of them
* **Union** = concatenates result sets from two queries with identical columns number/order and compatible data types compatible (`UNION` removes duplicates, `UNION ALL` allows duplicates)
* **Wildcards** = matches one (`_`), or several (`%`), or ranges of characters (`[a-z0-9.,;]` or opposite `[^…]`) as part of a `LIKE` clause

## API

* `[]` used to provide column names with special characters (eg spaces, _#_, à la quotes `""`)
* `;` = separate statements (à la other languages, usually optional in SQL)
  * Mandatory in situations where the parser cannot figure out where to break statements (eg [;WITH CTE](https://stackoverflow.com/questions/2853403/sql-server-update-group-by#comment82532249_6984780) by contention)
* `GO` = separates statments, immediately runs whatever precedes it, and consider the subsequent lines as part of a new scope
  * Mandatory in situations where statements have to be fully isolated (eg SPs have to be the only statement in a file/scope)
* `IIF(condition, then, else)` = ternary operator
* `CASE WHEN .. THEN .. ELSE .. END` = ternary operator
* `NOT` = inverts a condition (eg `SELECT * FROM Customers WHERE NOT Country='Germany'`)
* `CAST(number AS type)`
* `CONVERT(type, value)` (eg `CONVERT(DATETIME2(0), '2020-03-29 02:00:01.0000000 +01:00')`)

### Built-ins procedures

* `EXEC sp_helpindex table` = information about indexes of a table/view

### [Numbers](https://stackoverflow.com/a/7158770)

In summary, exact values like money should use _decimal_, and approximate values like scientific measurements should use _float_.
When multiplying a non integer and dividing by that same number, _decimals_ lose precision while _floats_ do not.

* `int`, `bigint`, `smallint`, `tinyint`
* `money` (8 bytes), `smallmoney` (4 bytes) = map to .NET decimal with 4 decimal points
* `decimal` = exact value but limited precision (5 to 17 bytes, ±38 digits, maps to .NET `decimal`)
* `float` = approximate value but extremely close precision (4-8 bytes, ±308 digits)
  * Actually a user-defined trade-off between precision and height (ie `float([n])` with optional _n_ is number of mantissa bits between 1 and 53 defaulting at 53)
  * Warning: exact comparisons are hazardous (but [workarounds exist](https://stackoverflow.com/a/16150114), blurrier inequalities/ranges may be ok)
* `numeric` = equivalent to `decimal`
* `real` = equivalent to `float(24)` (4 bytes, ±38 digits)
* `FLOOR(number)` = gets largest int <= _number_
* `ROUND(number, precision, mustTruncate)` (_round_ by default)

### Strings

* `CHARINDEX(character, text)` = returns the index of a `character` within a string
* `FORMAT(value, format[, culture])` = formats object as string (_value_ can be a number or date)
* `LEFT(text, i)` = returns a string's `i` first characters (aka all the characters left of a given index `i`)
* `LEN(text)` = length of a string, [excluding trailing whitespaces](https://stackoverflow.com/a/2025587)
* `REVERSE(text)` = reverse a string
* `SPACE(n)` = returns a n-long string of repeated spaces

### Dates

* Types
  * `date` = just the date part
  * `time` = just the time part
  * `datetime` (_legacy_) = date & time (1753 through 9999 with max precision of 3 1/3 milliseconds)
  * `datetime2(fractional_seconds_precision)` = more precise date & time (0001 through 9999, and can be precise down to 100ns)
  * `datetimeoffset` = more precise date & time with time zone support
* Methods
  * `GETDATE()` = returns current DB system timestamp (`datetime` without time zone offset)
  * `DATEFROMPARTS(year, month, day)` = returns a `date`
  * `DATEPART(datepart, date)` = returns a given part (_year|quarter|month|dayofyear|day|week|weekday|hour|minute|second|millisecond|microsecond|nanosecond_ or _tzoffset_ in minutes) of a date
  * `DATEADD(datepart, number, date)` = adds `number` `datepart`s (_year|quarter|month|dayofyear|day|week|weekday|hour|minute|second|millisecond|microsecond|nanosecond_) to a date
  * `DATEDIFF(datepart, start, end)` = returns number of `datepart`s (_year|quarter|month|dayofyear|day|week|weekday|hour|minute|second|millisecond|microsecond|nanosecond_) between two dates
  * `YEAR(date)` = year as an int
  * `MONTH(date)` = month as an int
  * `DAY(date)` = day as an int
  * `EOMONTH(date[, month_to_add])` = last day of the month (aka the number of days in that month)
* `inputdate AT TIME ZONE timezone` = converts _inputdate_ to a `datetimeoffset` in that timezone (eg `'Central European Standard Time'`, based on Windows Registry)

## Extensions

* [https://www.apexsql.com] = search field & tables names, [generate random sample data](https://www.apexsql.com/sql-tools-generate) for new tables/tests
