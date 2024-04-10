# Windows Install

## Quick Tips

* [Removing "This Copy of Windows Is Not Genuine"](https://appuals.com/removing-this-copy-of-windows-is-not-genuine) (rearm operation)
* Rufus offers a _Image option_ to [bypass the 8GB RAM/TPM/Secure Boot check](https://www.tomshardware.com/how-to/bypass-windows-11-tpm-requirement) when a Windows 11 ISO is selected (note: [only shown in Windows 8+](https://github.com/pbatard/rufus/wiki/FAQ#help-i-no-longer-see-the-option-to-bypass-tpmsecure-boot-with-windows-11))
* [Skip_TPM_Check_on_Dynamic_Update.cmd](https://github.com/AveYo/MediaCreationTool.bat/blob/main/bypass11/Skip_TPM_Check_on_Dynamic_Update.cmd) = disables requirements to install Windows 11 via regular Windows Updates

## Glossary

* View current **CD Key**
  * CMD = `wmic path softwareLicensingService get OA3xOriginalProductKey`
  * PowerShell = `(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey`
  * Registry = `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform` > _BackupProductKeyDefault_
* **HWID** (Hardware ID) = method to permanently activate Windows, based on its unique hardware footprint (so, survives a software format)
  * Only first install on new hardware (CPU/motherboard combination) requires a valid Windows license key)
  * See [Windows 10+ Digital License explained](https://www.elevenforum.com/t/windows-10-and-windows-11-digital-licencing-explained.14051)
* **KMS** (Key Management Services) = method to activate Windows/Server/Office
* **Unattended** = refers to installing an OS without particular supervision or inputs from the user

## [Underscore_ - La trouvaille scandaleuse d'un chercheur sur Windows 11](https://www.youtube.com/watch?v=SlIZxdeoWDY)

* Hypothèse = Windows 11 est un spyware (analyse de la chaîne The PC Security Channel via WireShark) et un bloatware
* [Should I remove it?](https://www.shouldiremoveit.com) = online apps/bloatware/trialware uninstall advice/guides
* [Bulk Crap Uninstaller](https://www.bcuninstaller.com) = FOSS Windows Vista+ uninstall helper (à la reverse Ninite)
* [Bloatbox](https://github.com/builtbybel/bloatbox) = open-source Windows 10+ CLI uninstall helper
* [Daniel Aleksandersen - 2-clicks to install Windows 11/10 without the third-party bloatware](https://www.ctrl.blog/entry/windows-ooberegion-bloatware.html) = prevent OOBE-dependent localized apps on install by setting region (_time and currency format_) to `English (World)` or `English (Europe)` then ignore the OOBE region error message (then maybe set Language & region in Windows afterwards to avoid further region-induced errors)
* Using a local (login-free) account (instead of a Microsoft one) by shutting off network during install
  * Either disconnect cable physically
  * Or `Shift + F10` to launch command prompt, then run `ipconfig /release`
  * Or `Shift + F10` to launch command prompt then run `OOBE\BYPASSNRO` to force install process without a connection
  * Or provide on the following fake email addresses:  _1@1.com_, _a@a.com_, _fake@fake.com_, _test@test.com_, _no@thankyou.com_ with any password
* [O&O ShutUp10++](https://www.oo-software.com/en/shutup10) = free Windows 10+ antispy tool (single GUI to disable all sharing/telemetry options)
* [Ultimate Windows Tweaker](https://www.thewindowsclub.com/ultimate-windows-tweaker-5-for-windows-11) = open-source performance, security & appearance tweaks CLI tool
* Change DNS mapping (in in _hosts_ file) for fraudulous domains
* Custom OS = alternative/unapproved modified & lighter Windows versions (XP, 7, 10, 11) without telemetry
  * [tiny10&tiny11](https://tiny10.com) = half footprint Windows 10/11 (made via _NTLite_), with local account, without Secure Boot & TPM
  * [NTLite](https://www.ntlite.com) = edit a Windows image by selecting desired options
  * [AtlasOS](https://atlasos.net) = FOSS modified/optimized (bloatware-free) Windows intended for gamers with a vibrant community
    * First install a clean Windows with a legit activation key, then install AtlasOS that cleans on top

## [Linus Tech Tips - DON’T buy a new PC for Windows 11! - How to install](https://www.youtube.com/watch?v=NivpAiuh-s0)

* Requirements = CPU (2017+), RAM, Secure Boot (UEFI), Trusted Platform Module (TPM 2.0) used to store cryptograhpic data (60% fewer malware)
* 1st trick (requires TPM 2.0) to bypass hardware requirements
  * Enroll into the Insider program (only _Release Preview Channel_ should be available)
  * Open `regedit`, go to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection`
    * _UIBranch = Dev_
    * _UIContentType = Mainline_
    * _UIRing = External_
  * Open `regedit`, go to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability`
    * _BranchName = Dev_
    * _ContentType = Mainline_
    * _Ring = External_
  * Reboot, open Insider program page again, more options should be available (ie _Dev Channel_)
  * However this doesn't give access to latest release when it drops (note: this video predates the official release of Windows 11)
* 2nd trick use a Windows 11 fresh ISO copy
  * Use an official ISO, or make on yourself via [UUP dump](https://uupdump.net/known.php?q=Windows+11) (choose a `.esd` image not a `.wim` image)
  * Burn the ISO to a disk or extract its content to a USB flash drive, then boot from it
  * During Windows install, press `Shift + F10` to launch command prompt, then run `regedit`
  * Got to `HKEY_LOCAL_MACHINE\SYSTEM\Setup` and create a new key _LabConfig_
  * Create two DWORD values _BypassTPMCheck_ & _BypassSecureBootCheck_ with value `1` (also _BypassRAMCheck_ if necessary)
* 3rd trick copy the _/sources/appraiserres.dll_ file containing compatibility checks from Windows 10 ISO into Windows 11 ISO
* 4th trick copy the _/sources/install.esd_ file containing actual Windows 11 image from Windows 11 ISO to Windows 10 ISO
* Windows 11 Home Edition may always require an internet connection & Microsoft account during setup (can be unlinked afterwards)
* [Update on Windows 11 minimum system requirements](https://blogs.windows.com/windows-insider/2021/06/28/update-on-windows-11-minimum-system-requirements)
* [Update on Windows 11 minimum system requirements and the PC Health Check app](https://blogs.windows.com/windows-insider/2021/08/27/update-on-windows-11-minimum-system-requirements-and-the-pc-health-check-app/)

## Reddit

* [Getting Windows 11](https://old.reddit.com/r/Piracy/comments/1883s08/getting_windows_11)
  * Download [Windows 11](https://www.microsoft.com/en-us/software-download/windows11) from Microsoft
  * Then use [Microsoft Activation Scripts (MAS)](https://massgrave.dev) with HWID to get a permanent legit license that can be linked to your MS account
