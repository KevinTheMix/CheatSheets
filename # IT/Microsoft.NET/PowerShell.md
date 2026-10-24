# PowerShell

## Glossary

* **cmdlet** = PowerShell lightweight command, typically returning a .NET object to next command in pipeline
* **Visual Studio Developer PowerShell** = adjust environment variables to current solution or folder location
* **Windows PowerShell** = CLI
* **Windows PowerShell ISE** (Integrated Scripting Environment) = GUI IDE

## API

* `Get-Date` = get current date & time
* `Get-Process <name1>, <name2>` = list running processes by name (wildcards allowed, eg `java*`), or all if no name
  * `-ErrorAction SilentlyContinue` = no error if no process matches
* `Invoke-Expression` (aka `iex`) = runs commands/expressions on local computer
* `Remove-Item <path1>, <path2>` (aka `rm`, `del`) = delete files/folders (wildcards allowed)
  * `-Force` = also delete hidden/read-only items
  * `-Recurse` = include folder content without confirmation prompt
* `Select-Object <prop1>, <prop2>` (aka `select`) = pick properties from piped objects (`*` for all)
  * `-ExpandProperty <prop>` = output property value itself instead of object wrapping it
  * `-First <n>` / `-Last <n>` = keep only first/last n objects
  * `-Unique` = drop duplicates
* `Select-String -pattern <regex>` = use regular expression to search for text patterns in input strings/files (à la Unix `grep` or Windows `findstr.exe`)
  `-notMatch` = not matching pattern
* `Start-Process <command>` = executes/opens command or file (in new window)
  * `-FilePath <file>` = local file
  * `-verb <action>` = what to do with file (`Edit`, `Open`, `Play`, `Print`, `PrintTo`, `RunAs` as admin, `RunAsUser`)
  * `-WorkingDirectory <path>` = path to file
* `Stop-Process -Id <pid>`

### Streams

* `> {file}` = redirect to file

### Snippets

* `ping.exe -t localhost | Foreach{"{0} - {1}" -f (Get-Date),$_} | Select-String -pattern "time(<1ms|=[1-3]ms)" -notMatch` = long-running higher-latencies ping with timestamp
* `[Environment]::SetEnvironmentVariable("<env_var>", <value>, "<scope>")` = set or remove (with `$null`) an environment variable from given scope (ie `User`, or `Machine` with admin required)
