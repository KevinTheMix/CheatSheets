# macOS

## Quick Tips

## Glossary

* **APM** (Apple Partition Map) = older (1980) partition scheme before Apple switched to Intel, stores partition info at beginning fof disk
* **Apple M1** = first Apple Silicon series of ARM-based CPU & GPU SoC for desktops, notebooks & iPads
* **Apple Silicon** (2020) = series of SoCs processors using ARM64 architecture, used in nearly all Apple devices
* **EFI** (Extensible Firmware Interface) = firmware interface specification for managing boot
* **EFI System Partition** (ESP) = small unencrypted partition containing minimal bootloader code (including pre-boot login screen ie FileVault password invite)
  * On Apple Silicon, it no longer uses UEFI but an Apple custom secure boot chain built into the SoC (still referred to as ESP)
* **FileVault** = full logical volume encryption, a key derived from password is used to access drive's XTS-AES-128 256-bit decryption key (allowing changing password without re-encrypting entire disk)
* **Finder** = file manager (à la Windows File Explorer)
  * **Sidebar** = vertical panel on left side of windows
* **Menu Bar** = top contextual menu bar
* **PowerPC** (1991-2006) = Apple-Motorola-IBM processor architecture used until Apple switched to Intel processors
* **SoC** (System on a Chip) = integrated circuit combining most/all components of a computer on a single microchip

* _Asahi OS_ = alternative more open Mac OS based on M1

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

* `Command + Space` = Spotlight Search
* `Control + Up/Down` = Mission Control

### Finder

* `Command + <` = cycle through windows
* `Command + N` = open new window
* `Command + W` = close window
* `Option + Command + S` = toggle sidebar
* `Option + Command + T` = toggle toolbar (à la Windows Alt)
