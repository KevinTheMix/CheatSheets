# Windows

* [Microsoft Windows Download](https://www.microsoft.com/software-download)

## Quick Tips

* **con.txt File** = [forbidden file name](https://www.reddit.com/r/todayilearned/comments/a0zht/til_that_you_cant_create_a_file_in_windows_called/c0fcr5n)
* **File Size Search** = `size: >1000MB AND < 3GB` (or `size:` and select listed proposition)
* **Invisible/Hidden Folder** = name a folder `" "` (ie a no-Break Space, CharMap _U+00A0_, _Alt+255_ or _Alt+0160_), then change folder icon to a blank one
* Cancel Printer Job = run `net stop spooler`, then `cd \windows\system32\spool\printers`, then  `del *.*`, then `net start spooler`, then go to Printers window & hit `F5` to refresh (2010.06)
* View current **CD Key**
  * CMD = `wmic path softwareLicensingService get OA3xOriginalProductKey`
  * PowerShell = `(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey`
  * Registry = `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform` > _BackupProductKeyDefault_

## Glossary

* **Chocolatey** = machine-level CLI package manager using NuGet package infrastructure and PowerShell to download/install (2011)
* **hosts** (file) = local DNS rules file (edit in `C:\Windows\System32\drivers\etc` with admin privileges, then run `ipconfig /flushdns`)
* **Hypervisor** = soft/firm/hard-ware creates & runs a VM (eg _Oracle VirtualBox_, _VMWare Workstation (Pro)_, _Hyper-V_ by _Microsoft_)
* `winget` (**Windows Package Manager**) = FOSS package manager CLI for Windows 10+ to install applications (2020)
* **Windows Terminal** = a tabbed GUI-based terminal emulator (click the `v` to access various consoles/shells)
* **WSL** (_Windows Subsystem for Linux_) = manually installable (via admin PowerShell `wsl --install`) component to run a GNU/Linux environment in Windows 10+ (without VM/dualboot)

## Shortcuts

* `Alt + Left/Right` = go back/forward
* `Alt + Up`  = go folder up one level
* `Ctrl + Alt + Arrow` = rotate Screen
* `Ctrl + Arrows` = move cursor in folder while keep current files selection
  * `Space` = add file to selection
* `Ctrl + Esc` == `Windows`
* `Ctrl + Shift + V` = paste without formatting
* `Ctrl + Wheel` (in a folder window) = cycle through window views
* `Shift + F10` = right-click (at cursor location)
* `Windows + R` = Run
  * `certmgr.msc` = Certificates manager
  * `control.exe srchadmin.dll` = Indexing Options (delete & rebuild index)
  * `diskpart` = disk/partition/volume management CLI (`list disk`, `select disk #`, `list partition`, `select partition #`, `delete partition override`)
  * `dxdiag` = DirectX Diagnostics Tool
  * `msinfo32` = view System Information (BIOS, OS, hardware, environment variables, services)
  * `mstsc(.exe)` = Remote Desktop Connection
  * `optionalfeatures` = Turn Windows features on or off
  * `pnputil` = drivers/Plug&Play utility (can force-delete drivers, run as admin)
  * `services(.exe)` = component services, Event viewer, Windows Services
  * `services.msc` = Services
  * `shell:appsfolder` = opens Apps folder (Windows 10+ only)
  * `shell:startup` = opens Startup folder (Windows launch applications)
  * `winver` = About Windows (version, build, etc)
* `Windows + Left/Right/Up` = move Window around desktop
* `Windows + Shift + Left/Right` = send Window to other screen
* `Windows + Space` = peek at desktop (make all windows transparent)
* `Middle-click Windows bar` = open new application Window
* `Multi-select Files > Rename` = group renaming
* `Drag (file) + Ctrl/Shift/Alt` = copy/move/shortcut
* `Drag (file) to {program}.exe` = open file with program
* `Drag (file) to (opened/pinned) program in Windows Bar` = pin the file to that program's Windows bar tab's (right-click) context menu
* `Drag (file) to command prompt` = pastes file path

### Windows 10+

* `Ctrl + Esc` = ? (switch between windows in the order that they were opened (1 2 3 1 2 3))
* `Shift + F10` (during install) = open command prompt
* `Shift + Restart` = access Advanced Startup Options (ASO Boot Menu)
* `Windows + Ctrl + Left/Right` = Switch Virtual Desktop
* `Windows + Shift + S` = Screenshot
* `Windows + I` = Settings
* `Windows + S` = Search
* `Windows + Space` = Change language

* `2 fingers` = Scroll
* `3 fingers up` == `Windows + Tab`
* `3 fingers Left/Right` == `Alt + Tab`
* `3/4 fingers down` = Minimize everything
* `4 fingers left/right` = Cycle virtual desktop

### Windows 11

* `Windows + G` = Game capturing
* `Windows + X` = Windows options shortcuts
* `taskmgr -d` = _classic_ Task Manager

## [Cmd.exe](https://en.wikipedia.org/wiki/Cmd.exe#Windows_NT_family)

* `%USERPROFILE%`
* `@echo [on|off]` = turns prompt on/off
* `@type {file}` = gives information about file (ie file header metadata)
* `cls` = clear screen
* `date`
* `certlm.msc` = Certificates
* `copy /b {image} + {hidden} {output}` = hide file in an image file (output image must be same extension/type as input)
* `echo koko`
* `envir` = System Properties > Advanced
* `explorer .` = open explorer window at current path
* `for %i in ({pattern}) do {statement}` (pattern can be files/strings of fixed words eg `(Debug Release)` or matching expression eg `(*.json)`)
* `format {disk:}`
* `goto {label}` goes to `:{label}`
* `if {condition} {statement}` (condition can be eg `exist {path}`)
* `mklink {source} "{target path}"` = creates a symbolic link
  * `/D` = directory
  * `/J` = directory junction (ie a symbolic link for directories)
  * `/H` = hard link (not symbolic)
* `netstat - ano` = affiche les connexions réseaux actives
* `pause`
* `powercfg` = power system settings (eg `/A` lists available sleep states)
* `resmon` = Resource Monitor (CPU, Disk, Memory, Network)
* `set {VAR}` = assignment
* `setlocal`
* `time`
* `where {exe1} ({exe2} {exe3} …)` = display files path (searching by pattern)
* `whoami`

### Network

* `CertUtil -hashfile {file} [MD5|SHA256]` = generates checksum for given file using provided algorithm
* `ipconfig /{release|renew|flushdns}` = IP tools
* `nslookup` = Lookup Domain IP Address
* [netsh](https://en.wikipedia.org/wiki/Netsh)
  * [How to turn a PC into a Wi-fi hotspot](http://www.reddit.com/r/YouShouldKnow/comments/2bqfvi/ysk_how_to_turn_your_pc_into_a_wifi_hotspot)
  * Certificate Registration
    * `netsh http show urlacl`
    * `netsh http show sslcert`
    * `netsh http add urlacl url=https://+:8081/ user=Everyone`
    * `netsh http add urlacl url=https://+:8081/ user="Tout le monde"`
    * `netsh http add urlacl url=https://+:8081/ user=rtlnet\kdebruyn`
    * `netsh http add sslcert ipport=0.0.0.0:8081 certhash={hash} appid={GUID} certstorename=MY`
    * `netsh http delete urlacl url=https://+:8081/`
    * `netsh http delete sslcert ipport=0.0.0.0:8081`
