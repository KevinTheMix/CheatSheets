# macOS

## Quick Tips

* [Folfklore](https://www.folklore.org) = origin story of original Macintosh

## Glossary

* **AirDrop** = near Apple devices remote files sharing
* **AirPlay** = remote speakers
* **AirTag** = GPS beacon
* **APM** (Apple Partition Map) = older (1980) partition scheme before Apple switched to Intel, stores partition info at beginning fof disk
* **Apple Business Manager** = company-wide management of employees Apple IDs, integrate with AD, connects with an existing MDM
* **Apple M1** = first Apple Silicon series of ARM-based CPU & GPU SoC for desktops, notebooks & iPads
* **Apple Pippin** = defunct open media technology platform (à la Phillips CD-i)
* **Apple Silicon** (2020) = series of SoCs processors using ARM64 architecture, used in nearly all Apple devices
  * Apple Silicon no longer use UEFI, but an Apple custom secure boot chain built into the SoC (still referred to as ESP)
* **Continuity** = instantly share resources across devices (eg copy-paste, mirror screen/remote control, use iPhone as webcam), synchronized through iCloud
* **FileVault** = full disk/logical volume on-the-fly encryption program
  * Uses a key derived from password to access drive's actual XTS-AES-128 256-bit decryption key (allowing changing password without re-encrypting entire disk)
* **PowerPC** (1991-2006) = Apple-Motorola-IBM processor architecture used until Apple switched to Intel processors
* **Rapid Security Response** (RSR) = mechanism to quickly install important (mostly security) patches
  * Configured in _System Preferences_ > _Automatic Updates_ > _Advanced…_ > _Install system data files and security updates_
  * A macOS that received such an update includes a letter in its version number (eg _macOS 13.3.1 (a)_)
* **SoC** (System on a Chip) = integrated circuit combining most/all components of a computer on a single microchip

* _Asahi OS_ = alternative more open Mac OS based on M1
* _Homebrew_ = macOS (& Linux) package manager

### Stock Apps & UI

* **Disk Utility** = internal/external drives & disk images management (partition, format, volumes, _View_ > _Show All Devices_ to see parent drives)
* **FaceTime** = audio/video conferencing
* **Finder** = files manager (à la Windows File Explorer _explorer.exe_), a main application that always runs (can be restarted but not force quit)
  * **Scrubber Bar** = horizontal quick file actions bar at bottom of folder in Gallery mode
  * **Sidebar** = vertical panel on left side of windows
* **iCloud** = backup, share & synchronize information per-app configurably (calendars, photos, documents, contacts) between devices
* **Keychain** = built-in password (and notes & certificates) manager
* **Messages** = built-in messaging app (back by **iMessage** service)
* **Mission Control** = overview of all open windows & full-screen application (ie side Spaces) thumbnails
* **Preview** = images & PDF manipulation app (view, edit, combine, convert)
* **Shortcuts** = built-in or custom scripted quick actions
* **Spotlight** = search files, apps, images, websites, etc (à la Windows Search)
* **Time Machine** = application included with macOS that performs automatic hourly/daily/weekly backups to a centralized server (deleting oldest as disk gets full)

* **Dock** = bottom bar launch icons
* **Launchpad** = applications tray
* **Menu Bar** = top contextual menu bar
  * **Control Center** = key settings (volume, brightness, Wi-Fi, Bluetooth, AirDrop, Focus to silence notifications)
  * **Notification Center** = notifications, widgets, weather
  * **Space** = (virtual) desktop or full-screen app
* **System Preferences** = OS configuration settings (à la Windows Control Panel)
* **Touch Bar** = physical LED screen bar on on top of keyboard
  * **Control Strip** = right section to adjust common settings (brightness, volume, Siri, and also Launcher & Mission Control)
* **Touch ID** = top-right corner key (for powering on/off, fingerprint sensor, VoiceOver shortcut)

### File System

* `~` = a user's home directory (eg _/Users/{user}_)
* `/Applications` = contains of installed applications (à la Windows _Program Files_)
* `/Library` = support files (scripts, fonts) used by everyone on system
* `/System` = macOS system files (à la Windows _Windows_ directory)
* `/Users` = one for each user, contains each user's documents
  * `~/Library` = one user's preference information folder (à la Windows _AppData_, also hidden/inaccessible by default in Finder)

#### Files

If the product is just one app, it’s often distributed as a _.app_ bundle.
If it requires system-wide changes or multiple components, it’s distributed as a _.pkg_ installer.

* _.app_ = runnable bundle from which an app can be launched (à la standalone Windows _.exe_), as an (uncompressed) archive (inspectable via Finder)
* _.dmg_ (Apple Disk Image) = image file mountable as a drive in Finder (à la _.iso_ file)
* _.pkg_ = software (eg drivers, CLI tools, common shared framework) installer package file (à la Android _.apk_ or Windows _setup.exe_), run once via built-in macOS Installer

### Versions

| Version             | Name          | Darwin | Year |
| ------------------- | ------------- | ------ | ---- |
| Mac OS X Server 1.0 | Hera          | 0.1    | 2000 |
| Mac OS X 10.0       | Cheetah       | 1.3.1  | 2001 |
| Mac OS X 10.1       | Puma          | 5.1    | 2001 |
| Mac OS X 10.2       | Jaguar        | 6.0    | 2002 |
| Mac OS X 10.3       | Panther       | 7.0    | 2003 |
| Mac OS X 10.4       | Tiger         | 8.0    | 2005 |
| Mac OS X 10.5       | Leopard       | 9.0    | 2007 |
| Mac OS X 10.6       | Snow Leopard  | 10.0   | 2009 |
| OS X 10.7           | Lion          | 11.0.0 | 2011 |
| OS X 10.8           | Mountain Lion | 12.0.0 | 2012 |
| OS X 10.9           | Mavericks     | 13.0.0 | 2013 |
| OS X 10.10          | Yosemite      | 14.0.0 | 2014 |
| OS X 10.11          | El Capitan    | 15.0.0 | 2015 |
| macOS 10.12         | Sierra        | 16.0.0 | 2016 |
| macOS 10.13         | High Sierra   | 17.0.0 | 2017 |
| macOS 10.14         | Mojave        | 18.0.0 | 2018 |
| macOS 10.15         | Catalina      | 19.0.0 | 2019 |
| macOS 11            | Big Sur       | 20.0.0 | 2020 |
| macOS 12            | Monterey      | 21.0.0 | 2021 |
| macOS 13            | Ventura       | 22.0.0 | 2022 |
| macOS 14            | Sonoma        | 23.0.0 | 2023 |
| macOS 15            | Sequoia       | 24.0.0 | 2024 |

## Shortcuts

* Modifier Keys
  * Command (⌘) = primary shortcut key, à la Ctrl on Windows (copy, paste, quit)
  * Control (⌃) = context (eg `Ctrl + Click` is a Right-Click), and Ctrl on Unix (`Ctrl + C` stops a process)
  * Option (⌥) = alternate/extra functions, à la Alt
  * Function (Fn) = à la Fn on modern laptops, with more system integration (brightness, volume, F keys)

* `Command + Option + Escape` = Force Quit Applications (displays all currently running applications)
  * Or `Option + Right-Click a App in Dock`
* `Command + Space` = Spotlight Search
* `Command + M` = minimize
* `Command + N` = open new window
* `Command + Q` = Quit app
* `Command + T` = open new tab
* `Command + W` = close current tab/window
* `Command + 3 x Tap Touch ID` = enable VoiceOver
* `Ctrl + Down` = App Exposé/Show All Windows (of current application)
* `Ctrl + Up` = Mission Control
* `Function + E` = show emojis & symbols
* `Function + F` = toggle Full Screen
* `Click + Drag` = start selection
* `Click window red cross` = close that specific window, not entire application (still runs in background)
* `2-Fingers Up/Down Swipe` = scroll vertically
* `2-Fingers Left/Right Swipe` = scroll horizontally
* `2-Fingers Right-Bezel Swipe` or `Click Menu Bar Time` = Notification Center
* `3-Fingers Left/Right Swipe` = switch Spaces
* `3-Fingers Up Swipe` = Mission Control
* `4-Fingers Pinch` = Launchpad
* `4-Fingers Spread` = show desktop

### Finder

* `Command + <` = cycle through windows
* `Command + Backspace` = send file to Bin
* `Option + Command + S` = toggle sidebar
* `Option + Command + T` = toggle toolbar (à la Windows Alt)
* `Force-Click a file` or `Space` = preview without opening (not to be mistaken for Preview app)

### Safari

* `Shift + Command + N` = open new private window
* `Slide Tab Left` = add to bookmark toolbar
* `Click a window red cross` = close all tabs then that window
* `2-Fingers Left/Right Swipe` = navigate back/forwards

### During Startup

* `Command + R` = recovery from local partition
* `Command + Option + R` = internet recovery
* `Command + Option + P + R` = reset NVRAM/PRAM (non-volatile/parameter RAM), which stores display resolution
* `Shift` = safe mode (clears system caches, checks startup disk, loads minimal drivers)
