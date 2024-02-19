# Windows

## Quick Tips

* Bypass company firewall (2014.04)
  * Remote desktop to home computer
  * SSH Tunnel + Proxy Socks via Putty (Laurent D'Havé & Frédéric Branger)
    * <https://securitymusings.com/article/462/how-to-set-up-a-socks-proxy-using-putty-ssh>
* [Removing "This Copy of Windows Is Not Genuine"](https://appuals.com/removing-this-copy-of-windows-is-not-genuine)
  * Windows 11: avoid built-in bloatwares by selecting region _English (World)_ or _English (Europe)_ (disturbing the OOBE service responsible with localized apps), then switching back to real region later

## Glossary

* **CD Key** (Windows 10+) =`wmic path softwareLicensingService get OA3xOriginalProductKey` (also at `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform`)
* **con.txt File** = [forbidden file name](https://www.reddit.com/r/todayilearned/comments/a0zht/til_that_you_cant_create_a_file_in_windows_called/c0fcr5n)
* **File Size Search** = `size: > 2GB AND < 3GB` (or `size:` and select listed proposition)
* **Host File** = local DNS rules file (edit in `C:\Windows\System32\drivers\etc` with admin privileges, then run `ipconfig /flushdns`)
* **Invisible/Hidden Folder** = name a folder `" "` (ie a no-Break Space, CharMap _U+00A0_, _Alt+255_ or _Alt+0160_), then change folder icon to a blank one
* **Local (login-less) Account** (Windows 10+) = during install, turn off internet connection during install (hardware unplug or software `ipconfig /release` or `OOBE\BYPASSNRO`)
  * Or provide on the following fake email addresses:  _1@1.com_, _a@a.com_, _fake@fake.com_, _test@test.com_, _no@thankyou.com_
* [NTFS links](https://en.wikipedia.org/wiki/NTFS_links)
  * **Hard Links** = two _index_ entries point to the same physical file
  * **Junction Points** = hard link for a folder
  * **Symbolic Link** = Windows shortcut = a physical file whose content is the path of another file
* **Cancel Printer Job** = run `net stop spooler`, then `cd \windows\system32\spool\printers`, then  `del *.*`, then `net start spooler`, then go to Printers window & hit `F5` to refresh (2010.06)

## Shortcuts

* `Ctrl + Alt + Arrow` = rotate Screen
* `Ctrl + Arrows` = move cursor in folder while keep current files selection
  * `Space` = add file to selection
* `Ctrl + Wheel` (in a folder window) = cycle through window views
* `Shift + F10` = right-click (at cursor location)
* `Windows + R` = Run
* `Windows + Left/Right/Up` = move Window around desktop
* `Windows + Shift + Left/Right` = send Window to other screen
* `Windows + Space` = peek at desktop (make all windows transparent)
* `Middle-click Windows bar` = open new application Window
* `Multi-select Files > Rename` = group renaming
* `Drag (file) + Ctrl/Shift/Alt` = copy/move/shortcut
* `Drag (file) to {program}.exe` = open file with program
* `Drag (file) to (opened/pinned) program in Windows Bar` = pin the file to that program's Windows bar tab's (right-click) context menu
* `Drag (file) to command prompt` = pastes file path

### Windows 7

* `Ctrl + Esc` == `Windows`

### Windows 10+

* `Ctrl + Esc` = ? (switch between windows in the order that they were opened (1 2 3 1 2 3))
* `Shift + F10` (during install) = open command prompt
* `Shift + Restart` = access Advanced Startup Options (ASO Boot Menu)
* `Windows + Ctrl + Left/Right` = Switch Virtual Desktop
* `Windows + Shift + S` = Screenshot
* `Windows + i` = Settings
* `Windows + Space` = Change language
* `2 fingers` = Scroll
* `3 fingers up` == `Windows + Tab`
* `3 fingers Left/Right` == `Alt + Tab`
* `3/4 fingers down` = Minimize everything
* `4 fingers left/right` = Cycle virtual desktop

## API

* `cls` = clear screen
* `date`
* `copy /b {image} + {hidden} {output}` = hide file in an image file (output image must be same extension/type as input)
* `echo koko`
* `@echo [on|off]` = turns prompt on/off
* `explorer .` = open explorer window at current path
* `for %%i in ({pattern}) do {statement using %%i}` (pattern can be fixed words eg `(Debug Release)` or matching expression eg `(*.json)`)
* `format {disk:}`
* `goto {label}` goes to `:{label}`
* `if {condition} {statement}` (condition can be eg `exist {path}`)
* `pause`
* `set {VAR}` = assignment
* `setlocal`
* `time`
* `where {exe1} ({exe2} {exe3} …)` = display files path (searching by pattern)
* `whoami`
* [cmd.exe](https://en.wikipedia.org/wiki/Cmd.exe#Windows_NT_family)
* `mstsc(.exe)` = Remote Desktop Connection
* `services(.exe)` = component services, Event viewer, Windows Services
* `winver(.exe)` = about Windows (version & co)
* `services.msc` = Services
* `certmgr.msc` = Certificates manager
* `shell:startup` = opens Startup folder (Windows launch applications)
* `shell:appsfolder` = opens Apps folder (Windows 10+ only)

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

## Extensions

* [AtlasOS](https://atlasos.net) = FOSS modified version of Windows for gamers (for general use as well)
* [Bulk Crap Uninstaller](https://www.bcuninstaller.com) = open-source Windows Vista+ uninstall helper
* [Bloatbox](https://github.com/builtbybel/bloatbox) = open-source Windows 10+ CLI uninstall helper
* [NTLite](https://www.ntlite.com) = edit a Windows image by selecting desired options
* _O&O ShutUp10++_ = free Windows 10+ antispy tool (one-stop shop to disable all sharing/telemetry options)
* _Predator_ = USB key logging in/off (for Windows XP)
* [Should I remove it?](https://www.shouldiremoveit.com) = online uninstall advice/guides
* _Tiny10_/_Tiny11_ = tiny distributions of Windows 10/11 (made via _NTLite_)
* _Ultimate Windows Tweaker_ = open-source performance, security & appearance tweaks CLI tool
