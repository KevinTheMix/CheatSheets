# PowerShell

## Glossary

* **cmdlet** = PowerShell lightweight command, typically returning a .NET object to next command in pipeline
* **Visual Studio Developer PowerShell** = adjust environment variables to current solution or folder location
* **Windows PowerShell** = CLI
* **Windows PowerShell ISE** (Integrated Scripting Environment) = GUI IDE

## API

* `Get-Date` = get current date & time
* `Invoke-Expression` (aka `iex`) = runs commands/expressions on local computer
* `Select-String -pattern {regex}` = use regular expression to search for text patterns in input strings/files (à la Unix `grep` or Windows `findstr.exe`)
  `-notMatch` = not matching pattern
* `Start-Process {command}` = executes/opens command or file (in new window)
  * `-FilePath {file}` = local file
  * `-verb {action}` = what to do with file (`Edit`, `Open`, `Play`, `Print`, `PrintTo`, `RunAs` as admin, `RunAsUser`)
  * `-WorkingDirectory {path}` = path to file

## Streams

* `> {file}` = redirect to file

## Snippets

* `ping.exe -t localhost | Foreach{"{0} - {1}" -f (Get-Date),$_} | Select-String -pattern "time(<1ms|=[1-3]ms)" -notMatch` = long-running higher-latencies ping with timestamp
