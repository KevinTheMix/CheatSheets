# SQL Server

## Quick Tips

* [Download SQL Server](https://www.microsoft.com/fr-fr/sql-server/sql-server-downloads)
* [SQL Server installation guide](https://learn.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server?view=sql-server-ver15)

## Glossary

* **ApexSQL** = SSMS plugin for deep/meta (field & tables names) search (eg can be used to [generate random sample data](https://www.apexsql.com/sql-tools-generate) for new tables/tests)
* **Microsoft SQL Server** = Microsoft RDBMS
* **Microsoft SQL Server Express** = free version
* **SQL Server Analysis Services** (SSAS)
* **SQL Server Data Tools (SSDT)** = SQL Server for Visual Studio (SQL Diff & SSIS)
* **SQL Server Integration Services** (SSIS) = broad range of data migration tasks, and ETL tools
  * Use an XSLT to reorganize an XML root element <https://stackoverflow.com/a/50266026>
  * Package parameters (strings) can be defined in the Parameters tab (after Control Flow & Data Flow), and can then be used as Expression (eg as a parameterized ConnectionString)
* **SQL Server Management Studio** (SSMS) = IDE to administer DB engine
  * [Use the latest SSMS with all SQL Server](https://expressdb.io/which-sql-server-management-studio-version.html#the-latest-and-greatest) (*21.x* as of 2025.12)

### Editions

* SQL Server 2012 (*11.x, Windows 7+*)
* SQL Server 2014 (*12.x, Windows 7+*)
* SQL Server 2016 (*13.x, Windows 8+*)
* SQL Server 2017 (*14.x, Windows 8+*)
* SQL Server 2019 (*15.x, Windows 10+*)
  * [Download SQL Server 2019 Express](https://www.microsoft.com/fr-FR/download/details.aspx?id=101064)
  * [SQL Server 2019 features](https://learn.microsoft.com/en-us/sql/sql-server/editions-and-components-of-sql-server-2019?view=sql-server-ver15)
