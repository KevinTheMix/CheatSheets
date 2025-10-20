# Windows

* [Microsoft Windows Download](https://www.microsoft.com/software-download)

## Quick Tips

* **con.txt File** = [forbidden file name](https://www.reddit.com/r/todayilearned/comments/a0zht/til_that_you_cant_create_a_file_in_windows_called/c0fcr5n)
* **nul.txt** & **foo** = [forbidden file names](https://old.reddit.com/r/programming/comments/9bzrx/wtf_the_maximum_path_length_in_win32_is_260_chars)
* **File Size Search** = `size: >1000MB AND < 3GB` (or `size:` and select listed proposition)
* **Invisible/Hidden Folder** = name a folder `" "` (ie a no-Break Space, CharMap _U+00A0_, _Alt+255_ or _Alt+0160_), then change folder icon to a blank one
* View current **CD Key**
  * CMD = `wmic path softwareLicensingService get OA3xOriginalProductKey`
  * PowerShell = `(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey`
  * Registry = `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform` > _BackupProductKeyDefault_
* [How to turn a PC into a Wi-fi hotspot](http://www.reddit.com/r/YouShouldKnow/comments/2bqfvi/ysk_how_to_turn_your_pc_into_a_wifi_hotspot)

## Glossary

* **BitLocker** = logical volume & full disk encryption (FDE) using a Volume Master Key (VMK), ie everything is encrypted including OS itself
* **BitLocker To Go** = encrypt removable USB flash drives
* **Chocolatey** = machine-level CLI package manager using NuGet package infrastructure and PowerShell to download/install (2011)
* **Encrypting File System** (EFS) = NTFS 3.0 feature providing FS-level encryption to specific files/folders (using user username/password, while OS is running, in file/folder Properties > (Attributes:) Advanced)
* **Hyper-V** = native hypervisor for Pro & Enterprise editions
* **User Account Control** (UAC) = popup dialog when an action requires elevated privilege (user must be logged as admin or be presented with credentials, exactly à la Unix `sudo`)
* **Windows Features** = turn Windows features on/off (Windows Media Player Legacy, MSMQ, Print to PDF, XPS, PowerShell, WSL)
* **Windows Hello** = sign-in options (facial, fingerprint, PIN, physical security key, password, picture)
* **Windows Recovery Environment** = GUI-based recovery menu loaded before OS is loaded (eg repair startup, restore system, uninstall updates, Command Prompt **warning** with full FS access)
  * Access via _Settings > System > Recovery > Advanced startup > Restart now_ (or hold `Shift` while clicking Restart)
* **Windows Terminal** = a tabbed GUI-based terminal emulator (click the `v` to access various consoles/shells)
  * `Ctrl + Shift + F` = search in terminal content

### Network

* Shares ending with _$_ are hidden (from discovery, but can be still accessed by name)
* **Active Directory** (AD) = LDAP-based directory service for Windows domain networks using a number of standardized protocols to provide a variety of network services (eg DNS-based naming)
* **Active Directory Federation Services** (ADFS) = provides claims-based SSO across organizational boundaries
* **NTFS** = per user/group permissions on local file system (in file/folder Properties > Security)
  * Same file/folder may be accessed from outside as a network share, and therefore have share permission (more restrictive permissions win)
* **NTLM** (New Technology LAN Manager) = obsolete Microsoft security protocols suite providing authentication, security, confidentiality (vulnerable to brute-force attacks)
* **Organizational Unit** (OU) = keep very large DB organized by subdividing related entities into groups (appearing as folders) of users, computers, countries, states, buildings, departments
* **Security Group** = logical grouping of users together to simplify their permission attribution (ie by whole group)
* **SID** (Security IDentifier) = Windows NT OS family unique, immutable identifier of a user account, user group, or other security principal
* **Windows Domain** = business network configuration, with centralized authentication & device access
* **Windows Workgroups** = home network configuration, logical groups of network devices that act as standalone systems, each peers connecting with their own set of ID/password

* _hosts_ (file) = local DNS rules file (edit in `C:\Windows\System32\drivers\etc` with admin privileges, then run `ipconfig /flushdns`)

### Versions

* **Windows 10**
  * End of support = 10/10/2025
* **Windows 11 Home** = core Windows experience, app store, gaming (S mode restricts app installation to app store)
* **Windows 11 Pro** = Bitlocker, Domains/Group Policy management, Hyper-V, Remote Desktop host (**Pro for Workstations** for server-grade hardware support)
* **Windows 11 Enterprise** = all Pro features plus advanced security, mangement, deployment, update controls
* **Windows 11 Education** = similar to Enterprise
* **Windows 11 SE** (deprecated) = low-cost devices in education (support end 2026.10)

## Shortcuts

* `Alt + Left/Right` = go back/forward
* `Alt + Up`  = go folder up one level
* `Alt + Winkey` = window menu (Restore, Minimize, Maximize, Close)
* `Ctrl + Alt + Arrow` = rotate Screen
* `Ctrl + Arrows` = move cursor in folder while keep current files selection
  * `Space` = add file to selection
* `Ctrl + Esc` == `Winkey`
* `Ctrl + Shift + N` = create new folder
* `Ctrl + Shift + V` = paste without formatting
* `Ctrl + Wheel` (in a folder window) = cycle through window views
* `Shift + F10` = right-click (at cursor location)
* `Shift + F10` (during install) = open command prompt
* `Shift + Restart` = access Advanced Startup Options (ASO Boot Menu)
* `F8` (during booting) = VGA mode (works with any monitor)
* `Winkey + +` = Magnifier
* `Winkey + Left/Right/Up` = move Window around desktop
* `Winkey + Shift + Left/Right` = send Window to other screen
* `Winkey + Space` = peek at desktop (make all winkey transparent)
* `Winkey + {n}` = open docked application
* `Winkey + Ctrl + {n}` = hides all instances of docked application
* `Winkey + Shift + {n}` = open docked application in new Window
* `Winkey + Ctrl + Shift + {n}` = opens docked application as admin in new window
* `Winkey + (Shift +) Tab` = window switching & virtual desktops
* `Winkey + Pause/Break` = System Properties
* `Winkey + Space` = Change language (à la `Alt + Shift`)
* `Winkey + ,` = peek at desktop (while Winkey is held)
* `Winkey + ;` = emojis & more
* `Winkey + A` = quick settings (Wi-Fi, Flight mode, Night light, Mobile hotspot, Accessibility, Volume, Project)
* `Winkey + B` = focus on system tray
* `Winkey + C` = Copilot
* `Winkey + D` = show Desktop
* `Winkey + G` = Game capturing
* `Winkey + H` = Microsoft Speech Services (voice typing)
* `Winkey + I` = Settings
* `Winkey + K` = Miracast
* `Winkey + L` = lock workstation
* `Winkey + M` = minimize all windows (except full-screen)
* `Winkey + N` = Notifications
* `Winkey + P` = Project (quick selection)
* `Winkey + R` = Run
* `Winkey + S` = Search
* `Winkey + T` = focus on dock applications
* `Winkey + U` = Accessibility settings
* `Winkey + V` = Clipboard history
* `Winkey + W` = window tiling
* `Winkey + X` = Start Menu shortcuts
* `Winkey + Z` = desktop Widgets
* `Winkey + Ctrl + Left/Right` = Switch Virtual Desktop
* `Winkey + Shift + S` = Screenshot
* `Multi-select Files > Rename` = group renaming
* `Drag (file) + Ctrl/Shift/Alt` = copy/move/shortcut
* `Drag (file) to {program}.exe` = open file with program
* `Drag (file) to (opened/pinned) program in Windows Bar` = pin the file to that program's Windows bar tab's (right-click) context menu
* `Drag (file) to command prompt` = pastes file path

### Mouse

* `2 fingers` = Scroll
* `3 fingers up` == `Windows + Tab`
* `3 fingers Left/Right` == `Alt + Tab`
* `3/4 fingers down` = Minimize everything
* `4 fingers left/right` = Cycle virtual desktop
* `Middle-click docked app` = open docked application in new Window
* `Middle-Click docked app thumbnail` = closes app instance

## Run (Win +R or Start Menu)

* `Ctrl + Shift + Enter` = Run as administrator
* _%userprofile%_ or simply `.` = user folder
* _%windir%_ = Windows folder

* `appwiz.cpl` = Programs & Features (add/uninstall an application)
* `certmgr.msc` = Certificates (Current User)
* `certlm.msc` = Certificates (Local Computer)
* `cleanmgr` = Disk Cleanup
* `compmgmt.msc` = Computer Management (Event Viewer, Shared Folders, Disk Management, Services)
* `control(.exe)` = Control Panel
  * `control srchadmin.dll` = Indexing Options (delete & rebuild index)
  * `control userpasswords2` = User Accounts (& passwords)
  * Set view to small icons
* `devmgmt.msc` = Device Manager
* `dxdiag` = DirectX Diagnostic Tool
* `eventvwr(.msc)` = Event Viewer
* `explorer .` = open explorer window at current path
* `gpedit.msc` = Local Group Policy Editor (ie granular rules/permissions)
* `gpmc.msc` = Group Policy Management Console (ie enterprise-wide policies, integrated with AD)
* `inetcpl.cpl` = Internet Properties
* `lusrmgr.msc` (Local Users and Groups) = manage admin, regular & guest users, and their groups
* `mmc(.exe)` (Microsoft Management Console) = customizable view of system properties (event viewer, certificates, tasks, performances, policies)
* `msconfig` = System Configuration (Boot, Services, Startup)
* `msinfo32` = System Information (Hardware Resources, Components aka devices, Software Environment eg drivers, environment variables, print jobs)
* `mstsc(.exe)` = Remote Desktop Connection
* `optionalfeatures` = Turn Windows features on or off
* `perfmon(.msc)` (Performance Monitor) = customizable long-term OS metrics/statistics with save-able reports & alerts/automated actions
* `pnputil` = drivers/Plug&Play utility (can force-delete drivers, run as admin)
* `regedit` = Registry Editor (export/restore to a _.reg_ file)
  * _HKEY\_CLASSES\_ROOT_
  * _HKEY\_CURRENT\_USER_
  * _HKEY\_LOCAL\_MACHINE_
  * _HKEY\_USERS_
  * _HKEY\_CURRENT\_CONFIG_
* `resmon` = Resource Monitor (CPU, Disk, Memory, Network)
* `services(.exe)` = component services, Event viewer, Windows Services
* `services.msc` = Services
* `shell:appsfolder` = opens Apps folder (Windows 10+ only)
* `shell:startup` = opens Startup folder (Windows launch applications)
* `taskmgr -d` = _classic_ Task Manager
* `taskschd.msc` (Task Scheduler) = run applications at a particular date/time & on a recurring basis
* `tpm.msc` = Trusted Platform Module (TPM) Management
* `winver` = About Windows (version, build, etc)

## [Cmd.exe](https://en.wikipedia.org/wiki/Cmd.exe#Windows_NT_family)

Commands are fully case-insensitive.

* `@` = suppresses command echoing (_obsolete_, eg in old scripts, `@echo off` was used to prevent displaying _echo off_ once before command effect applies)
* `echo [on|off]` = turns prompt on/off
* `cd` or `chdir` = change directory (`\` for root folders, hit tab to cycle)
* `certutil -hashfile {file} [MD5|SHA256]` = generates checksum for given file using provided algorithm
* `chkdsk ({volume})` (_as admin_) = check (current if none specified) disk
  * `/f` = scan & fixes errors (requires volume not in use, or run at next start)
  * `/r` = locate bad sectors, one by one (much longer, implies `/f`)
* `cls` = clear screen
* `copy {file(s)} {destination}` = copy one or more files (destination can be a file or volume)
  * `/b {image} + {hidden} {destination}` = hide file in an image file (destination image must be same extension/type as input)
  * `/v` = verifies files are written correctly (ie files diff source vs destination)
  * `/y` = suppresses overwrite existing file warning (ideal for non-interactive scripts)
* `date`
* `defrag {volume}` = degragmenter
* `del {file(s)}` = delete one or more files
* `dir` = lists files (`/B` show only names)
* `diskpart` (**Microsoft DiskPart**, _as admin_) = disk/partition/volume management CLI utility (`help` to list available commands)
  * `list disk` = displays (physical) disks (with size)
  * `list partition` = displays partitions on selected disk
  * `list volume` = displays volumes (with letter, label, FS, size)
  * `select disk {#}` = shift focus on an object
  * `select partition {#}`
  * `select volume {#|letter}`
  * `delete partition override` (**Warning: Danger**)
* `echo koko`
* `for %i in ({pattern}) do {statement}` (pattern can be files/strings of fixed words eg `(Debug Release)` or matching expression eg `(*.json)`)
* `format {volume}` (_as admin_) = format volume (`/FS:{filesystem}` uses given filesystem ie FAT, FAT32, exFAT, NTFS, UDF, ReFS)
* `goto {label}` goes to `:{label}`
* `gpresult` = displays AD policies information for a target user & computer
  * `/r` = shows Resultant Set of Policy aka RSoP summary
* `gpupdate /target:{computer|user} (/force)` = update multiple Group Policy settings (synchronizes latest group-wide changes)
* `help ({command})` = list available commands or display help on given command (similar to `/?`)
* `hostname` = displays current device name (can be changed in System Settings)
* `if {condition} {statement}` (condition can be eg `exist {path}`)
* `md` or `mkdir` = make directory
* `mklink {source} "{target path}"` = creates a symbolic link
  * `/D` = directory
  * `/J` = directory junction (ie a symbolic link for directories)
  * `/H` = hard link (not symbolic)
* `netstat - ano` = affiche les connexions réseaux actives
* `nslookup` = DNS lookup (eg `nslookup example.com`)
* `pause`
* `powercfg` = power system settings (eg `/A` lists available sleep states)
* `rd` or `rmdir` = remove directory
* `robocopy {source} {destination} (/MIR)` (**Robust File Copy for Windows**, included with Windows 10/11) = copy with many more options (eg retries, `MIR` copies complete directory tree)
* `set {VAR}` = assignment
* `setlocal`
* `sfc (/scannow)` (System File Checker aka **Resource Checker**) = scan integrity of all protected system files & replace incorrect with correct Microsoft versions
* `time`
* `type {file(s)}` = display contents of text (or not) file(s)
* `where {command(s)}` = display command paths (searching via wildcarded patterns)
* `whoami` = displays user name (in NTLM format eg _domain\username_), group, SID, privileges (`/all`)
* `winget` (**Windows Package Manager**) = FOSS package manager CLI for Windows 10+ to install applications (2020)
* `wsl` (Windows Subsystem for Linux) = run a GNU/Linux environment in Windows 10+ (without VM/dualboot)
  * `--install` = initialize (run as admin)
  * `--install (-)-d(istribution) {distro}` = install given distribution
  * `--unregister {distro}` = irreversibly deletes distro & its filesystem (also via Windows Settings > Installed Apps > Uninstall)

### Network

* `ipconfig` = display IP configuration (IP address, default gateway, subnet mask)
  * `/all` = show full detailed configuration information
  * `/flushdns` = purges DNS Resolver cache
  * `/release(6) ({connection})` = release IPv4(/6) addresses for matching (with `*` wildcard) or all adapters
  * `/renew(6) {adapter}` = renew IPv4(/6) addresses for matching (with `*` wildcard) or all adapters
* `net` = Windows network commands
  * `send {message}` = send messages (via NetBIOS) to other users/computers (until Windows XP)
  * `stop spooler` = stops printer jobs queue (then `cd \windows\system32\spool\printers`, then  `del *.*`, then `net start spooler`, then go to Printers window & hit `F5` to refresh)
  * `use {new_volume} \\{share}` = maps/mounts a network share to a drive letter (ie set shared network folder as local volume)
  * `user ({user}) (* /domain)` = view user account information & reset passwords
  * `view \\{server}` or `view /workgroup:{workgroup}` = view network resources
* `netsh` (Network Shell) = CLI to reset config, change IP address, or edit wireless settings (eg SSID)
  * `winsock reset` = reset TCP/IP stack to default known-good parameters to resolve issues
  * Certificate Registration = `netsh http {option}`
    * `show urlacl`
    * `show sslcert`
    * `add urlacl url=https://+:8081/ user=Everyone` (or `"Tout le monde"` with spaces)
    * `add urlacl url=https://+:8081/ user={domain}\{user}`
    * `add sslcert ipport=0.0.0.0:8081 certhash={hash} appid={GUID} certstorename=MY`
    * `delete urlacl url=https://+:8081/`
    * `delete sslcert ipport=0.0.0.0:8081`
* `netstat` (Network Statistics) = display active connections
  * `-a` = all connections & listening ports
  * `-b` (_as admin_) = show executables involved in creating each connection
  * `-n` = does not DNS-resolve foreign addresses & port numbers (ie display in numerical form)
* `nslookup` = name server lookup from DNS servers (CName, IP addresses, cache timers)
* `pathping` = runs traceroute to establish a map, then runs ping at each hop (25s per hop) to measure round-trip time & packet loss
* `ping {host}` = ping host to determine round-trip time (uses ICMP, `-t` indefinitely)
* `tracert` = determines route a packet takes to a destination (uses ICMP)
  * `-h {#}` = specifies TTL (ie number of hops/routers)
  * For each hop/router, (by default) three round-trip measurements are sent (_*_ is a lost packet, as some routers don't reply to ICMP requests - but it still goes through them)
