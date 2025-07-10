# SQL Injection (SLQi)

## Quick Tips

[Types of SQL Injection](https://www.acunetix.com/websitesecurity/sql-injection2)

## Glossary

### In-Band (Classic)

The attacker uses the same channel of communication to launch attacks & gather results

* **Error-based** = the attacker uses displayed (types of) error messages to deduce information about DB structure
  * Abuses a SQL query in the form `SELECT * FROM table WHERE user = '{user}' AND password = '{pass}'`
  * **Comment Payload** = set user to `admin'--` (and that's it!)
  * **OR Payload** = relies on inserting an `OR` statement to short-circuit the otherwise tight `AND` boolean logic
    * Set user to `admin' OR '1'='1` (note: no end quote) as user name (constraint: the user _admin_ must exist in the system)
    * The query becomes `SELECT * FROM table WHERE user = 'admin' OR '1'='1' AND password = whatever`
    * In boolean topology: _TRUE OR TRUE AND FALSE_ == _TRUE OR (TRUE AND FALSE)_ == _TRUE OR FALSE_ == _TRUE_
    * If we don't know any valid username, use this instead: `' OR user IS NOT NULL OR '1'='1` that adds an additional `OR` statement (so even the left condition can be _FALSE_)
* **Union-based** = abuses a SQL query in the form `SELECT * FROM products WHERE column(Id) LIKE '%{category}%'` whose result set gets displayed back on the page
  * Set parameter to `'--` => `SELECT * FROM products WHERE column(Id) LIKE '%'` = returns all
  * Set parameter to `' UNION ALL SELECT 1,2,3 --` = returns all & adds a few values (number of columns must match)
    * If that works, we can query columns from another table instead of constant values
    * A popular choice are system meta-tables containing info about other tables & columns

### Inferential (Blind)

The attacker reconstructs DB structure in the dark by sending one payload after another, observing application responses & DB server behavior.
Takes longer to exloit but just as dangerous.

* **Boolean-based** = sends DB queries that force the application to return a different results depending on whether the query returns _TRUE/FALSE_
* **Time-based** = sends SQL query that forces the DB to wait for a certain time (in seconds), indicating whether the query result is _TRUE/FALSE_
  * Eg `AND/OR SLEEP(1)` (for MySQL)

### Out-of-Band (OOB)

The attacker is unable to use the same channel to launch the attack and gather results, uncommon, requires features being enabled on the DB server.
The attacker tries to send data outside the DB, eg by having the DB make direct DNS/HTTP requests containing data to the attacker (eg MSSQL `xp_dirtree`).
These offer an alternative to inferential time-based techniques when the server responses are not very stable (making time-based attacks unreliable).

## Tools

* _SQLmap_ = open source automated SQL injection flaws penetration testing, DB fingerprinting, multi-platform (MySQL, MSSQL, etc), password hash dic attack, DB dump
