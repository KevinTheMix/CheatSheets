# Windows

* [NTFS links](https://en.wikipedia.org/wiki/NTFS_links)
  * Hard links = two _index_ entries point to the same physical file
  * Junction points = hard link for a folder
  * Symbolic link = Windows shortcut = a physical file whose content is the path of another file
* Type `explorer .` in any terminal to open its current path as window
* Edit _hosts_ file in _C:\Windows\System32\drivers\etc_ with admin privilege, then run `ipconfig /flushdns`
* Search by file size = `size: > 2GB AND < 3GB` (or `size:` and select listed proposition)

## Hacks

* Create a file called con.txt: <https://www.reddit.com/r/todayilearned/comments/a0zht/til_that_you_cant_create_a_file_in_windows_called/c0fcr5n/>
* Bypass company firewall (2014.04)
  * Remote desktop to home computer
  * SSH Tunnel + Proxy Socks via Putty (Laurent D'Havé & Frédéric Branger)
    * <https://securitymusings.com/article/462/how-to-set-up-a-socks-proxy-using-putty-ssh>
* [Removing "This Copy of Windows Is Not Genuine"](https://appuals.com/removing-this-copy-of-windows-is-not-genuine/)
* Hide zip in an image file = `copy /b image.png + archive.zip result.png` (result image must be same format as input)

## Windows 7+

* `Ctrl + Esc` = switch between windows in the order that they were opened (1 2 3 1 2 3)
* `Ctrl + Arrow` = Move in cursor in folder while keep current files selection
  * `Space` = Add file to selection
* `Ctrl + Alt + Arrow` = Rotate Screen
* `Drag&Drop + Shift/Ctrl/Alt` = Copy/Move/Shortcut
* `Multi-select Files > Rename` = Group renaming
* `Middle-click taskbar` = Open new application Window
* `Ctrl + Mouse wheel` (in a folder window) = Cycle through window views
* `Windows + R > mstsc` = Remote Desktop
* `Windows + Left/Right` = Move Window around desktop
* `Windows + Shift + Left/Right` = Send Window to other screen
* _Drag file to application tab in Start Menu_ = Pin the file to that Program tab

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
* `wmic path softwareLicensingService get OA3xOriginalProductKey` = Get CD Key
  * Also under _Computer\HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform_

### GUI Tools & Commands (Win + R)

* `mstsc.exe` = Remote Desktop
* `winver.exe` = view Windows version
* `services` = component services, Event viewer, Windows Services
  * `services.msc` = Windows services
* `certmgr.msc` = Certificates manager
* `shell:startup` = applications at Windows start
* `shell:appsfolder` (Windows 10)

## DOS & Utils

* [cmd.exe](https://en.wikipedia.org/wiki/Cmd.exe#Windows_NT_family)
* Display
  * `cls` = clear screen
  * `date`
  * `echo koko`
  * `@echo [on|off]` = turns prompt on/off
  * `pause`
  * `time`
  * `where {pattern}` = display location of file that matches search pattern
  * `whoami`
* Control
  * `goto {label}` goes to `:{label}`
  * `set {VAR}` = assignment
  * `setlocal`
  * `for %%i in ({pattern}) do {statement using %%i}`
    * pattern can be fixed words e.g. `(Debug Release)`
    * pattern can be a matching expression e.g. `(*.json)`
  * `if {condition} {statement}`
    * condition can be `exist {path}`
* IO
  * `where {exe1} {exe2}` = Displays .exes' filepath
  * `format c:`
  * Drag & Drop file = Pastes file path
* Network
  * `ipconfig /{release|renew|flushdns}` = IP tools
  * `nslookup` = Lookup Domain IP Address
* Checksum
  * `CertUtil -hashfile {file} [MD5|SHA256]` = generates checksum for given file using provided algorithm

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
