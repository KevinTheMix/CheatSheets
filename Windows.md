# Windows

## Hacks

* Create a file called con.txt: <https://www.reddit.com/r/todayilearned/comments/a0zht/til_that_you_cant_create_a_file_in_windows_called/c0fcr5n/>
* Bypass company firewall (2014.04)
  * Remote desktop to home computer
  * SSH Tunnel + Proxy Socks via Putty (Laurent D'Havé & Frédéric Branger)
    * <https://securitymusings.com/article/462/how-to-set-up-a-socks-proxy-using-putty-ssh>

## Windows 7+

* `Ctrl + Arrow` = Move in cursor in folder while keep current files selection
  * `Space` = Add file to selection
* `Ctrl + Alt + Arrow` = Rotate Screen
* `Drag&Drop + Shift/Ctrl/Alt` = Copy/Move/Shortcut
* `Multi-select Files > Rename` = Group renaming
* `Windows + R > mstsc` = Remote Desktop
* `Middle-click taskbar` = Open new application Window

## Windows 10

* `Windows + Ctrl + Left/Right` = Switch Virtual Desktop
* `Win + Shift + S` = Screenshot
* `Win + i` = Settings
* `Win + Space` = Change language
* `2 fingers` = Scroll
* `3 fingers up` = Win + Tab
* `3 fingers L/R` = Alt + Tab
* `3/4 fingers down` = Minimize everything
* `4 fingers left/right` = Cycle virtual desktop

## DOS

* Display
  * `echo koko`
  * `date`
  * `time`
  * `pause`
  * `cls`
* IO
  * `where {exe}` = Displays .exe filepath
  * `format c:`
  * Drag & Drop file = Pastes file path
* Network
  * `ipconfig /{release|renew|flushdns}` = IP tools
  * `nslookup` = Lookup Domain IP Address

### [netsh](https://en.wikipedia.org/wiki/Netsh)

* [How to turn a PC into a Wi-fi hotspot](http://www.reddit.com/r/YouShouldKnow/comments/2bqfvi/ysk_how_to_turn_your_pc_into_a_wifi_hotspot/)
* Certificate Registration
  * `netsh http show urlacl`
  * `netsh http show sslcert`
  * `netsh http add urlacl url=https://+:8081/ user=Everyone`
  * `netsh http add urlacl url=https://+:8081/ user="Tout le monde"`
  * `netsh http add urlacl url=https://+:8081/ user=rtlnet\kdebruyn`
  * `netsh http add sslcert ipport=0.0.0.0:8081 certhash={hash} appid={GUID} certstorename=MY`
  * `netsh http delete urlacl url=https://+:8081/`
  * `netsh http delete sslcert ipport=0.0.0.0:8081`

### Printer Cancel (2010.06)

1. start -> run -> cmd
2. `net stop spooler`
3. _cd \windows\system32\spool\printers_
4. `del *.*`
5. `net start spooler`
6. go to printer and faxes window and hit F5 to refresh
7. bam all stuck jobs are gone

## PowerShell

Ping long-running avec TimeStamp

```PowerShell
ping.exe -t rtlbruadrep01|Foreach{"{0} - {1}" -f (Get-Date),$_} | Select-String -pattern "temps(<1ms|=1 ms)" -notMatch > "D:\ADREP01.log"
ping.exe -t 192.168.35.42|Foreach{"{0} - {1}" -f (Get-Date),$_} | Select-String -pattern "temps(<1ms|=[1-3] ms)" -notMatch
```

See <https://stackoverflow.com/questions/24906268/ping-with-timestamp>
See <https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-6>
See <https://stackoverflow.com/questions/18183939/powershell-select-string-pattern-notmatch>
See <https://stackoverflow.com/questions/37297041/powershell-or-operator-in-select-string>
