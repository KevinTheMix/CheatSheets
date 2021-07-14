# PowerShell

Ping long-running avec TimeStamp

```PowerShell
ping.exe -t rtlbruadrep01|Foreach{"{0} - {1}" -f (Get-Date),$_} | Select-String -pattern "temps(<1ms|=1 ms)" -notMatch > "D:\ADREP01.log"
ping.exe -t 192.168.35.42|Foreach{"{0} - {1}" -f (Get-Date),$_} | Select-String -pattern "temps(<1ms|=[1-3] ms)" -notMatch
```

See <https://stackoverflow.com/questions/24906268/ping-with-timestamp>
See <https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-6>
See <https://stackoverflow.com/questions/18183939/powershell-select-string-pattern-notmatch>
See <https://stackoverflow.com/questions/37297041/powershell-or-operator-in-select-string>
