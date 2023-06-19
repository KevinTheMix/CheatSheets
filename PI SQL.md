# PI SQL

* [PI AF SDK](https://docs.aveva.com/bundle/af-sdk/page/html/overview.htm)

## Extended Properties

Enter these additional parameters when launching connection to a DB (PIAF, PIAF2, etc.)

* `command Timeout = 60000`
* `Log Level = 0; Log File = C:\PRJ\pisql.log`
* `Log Level = 3; Log File = C:\PRJ\pisql.log`
* `Ignore Errors = True;`
* `Cancel On Low Resources = False;`
* Steven's parameters
  * `Init Catalog = AccTranProd; Data Source = PIAF2; Connection Timeout = 15; Command Timeout = 6000000; Log Level = 0; Log File = C:\Prj\pisql.log; Shorten Primary Keys = False; Always Return Rowset = True; Defer Execution = False; Disable Server Selection = True; Time as Double = False; Optimization Log Limit = 100; Integrated Security = SSPI; Keep Default Ordering = True; Cancel On Low Resources = False; Evaluation Errors As Warnings = False; Embed Errors = True; ; Ignore Errors = True; ; Allow Expensive = true; Time Zone = Local; Show Hidden Metadata = False; Integrated Security = SSPI`
