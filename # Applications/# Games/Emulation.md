# [Emulation](https://emulation.gametechwiki.com)

## Quick Tips

* [ROM Naming Guide ((U), (J) and [!])](https://www.emuparadise.me/help/romnames.php)
* [PlayStation emulators](https://emulation.gametechwiki.com/index.php/PlayStation_emulators)
* [Download PS1 BIOS](https://archive.org/details/PlayStationBIOSFilesNAEUJP) = SCPH5500, SCPH5501, SCPH5502
* [Download PS2 BIOS](https://www.saferoms.com/pcsx2-bios)

## Glossary

* **BIOS** = original console firmware required by emulators, that initializes hardware, manages boot (including boot screen), authenticates region
* [blueMSX](http://bluemsx.msxblue.com) = MSX emulator
* [DOSBox](https://www.dosbox.com) = MS-DOS emulator
* [Duckstation](https://www.duckstation.org) = PS1 emulator ([Duckstation PlayStation Setup](https://www.youtube.com/watch?v=Nql7acQeo5o))
* [GamesNostalgia](https://gamesnostalgia.com) = archive of Amiga, Atari, C64, MS-DOS, PC, Sega games (game archive file includes Mednafen emulator)
* **Homebrew** = any software by hobbyist on proprietary console systems not intended to be user-programmable
* **Lutris** = FOSS Linux games launcher/manager, supports popular emulators (DOSBox, Snes9x, Dolphin, PCSX2), and Wine for Windows games
* **Mednafen** (My Emulator Doesn't Need A Frickin' Excellent Name, formerly Nintencer) = free OpenGL/SDL wrapper bundling various 3rd-party emulation cores in a single package
* [Mini vMac](https://www.gryphel.com/c/minivmac) = early Macintosh emulator
* [MultiMAN](https://psdevwiki.com/ps3/MultiMan) = PS3 Homebrew (can be used to FTP transfer files eg to FileZilla)
  * [MultiMAN beginner's guide](https://gbatemp.net/threads/multiman-beginners-guide.291170)
* [openMSX](https://openmsx.org) = MSX emulator
* [PCSX2](https://pcsx2.net) = first PS2 emulator, plugins-based and running as a Libretro Core
* PS1 BIOS
  * Sony's BIOS versions were not well synchronized across regions (eg **SCPH1001** is _v2.2_ but **SCPH1002** is _v2.0_)
  * Last digit indicates format/region (_0_ is NTSC-J for Japan, _1_ is NTSC-U/C for NA, _2_ is PAL for Europe)
  * **SCPH-101** = 4.5 PS1
  * **SCPH-1000** = 1.0 (1994.11.15), original BIOS for Jp games, ideal for Japanese exclusives (eg Dragon Quest VII)
  * **SCPH-1001** = 2.2 (1995.12.04), original BIOS for NA games
  * **SCPH-1002** = 2.0 (1995.12.04)
  * **SCPH-5000** = 2.2 (1995.12.04)
  * **SCPH-5500** = 3.0 (1996.09.09)
  * **SCPH-5501** = 3.0 (1996.11.18), refined US version offering stability improvements for later titles, and modern emulators like DuckStation)
  * **SCPH-5502** = 3.0 (1997.01.06)
  * **SCPH-7000** = 4.0 (1997.08.18)
  * **SCPH-7001** = 4.1 (1997.12.16), another variant known for its reliability across diverse game genres
  * **SCPH-7502** = 4.1 (1997.12.16)
* [RetroArch](https://www.retroarch.com) (_Libretro_) = cross-platform frontend for a variety of 3rd party emulators (named _cores_)
  * Emulators can be downloaded within it, and may require additional setup (eg installing proprietary BIOS)
  * Can actually be [installed _on_ a PS2](https://www.youtube.com/watch?v=qwL-H0-K4Wo), by pressing R1 while starting
  * [Reddit @catfight_animations' guide to RetroArch](https://old.reddit.com/r/AskReddit/comments/f937om/comment/fipty1r)
* [RPCS3](https://rpcs3.net) = open-source PS3 emulator

### PS2 (PCSX2)

* [PCSX2 1.6.0 Best Settings and Setup Guide!](https://web.archive.org/web/20210203003819/https://www.youtube.com/watch?v=aeRE6pe4HQ8)
* [Hotkeys](https://wiki.pcsx2.net/Hotkeys)
  * F9 toggles hardware/software renderer, can fix graphics issues but is slower (and possibly locks the resolution to Native)
    * Also an option in the Video plugin settings: choose between (OpenGL/Direct3D) Hardware or Software renderer

* [How to play SingStar on PCSX2](https://www.reddit.com/r/PCSX2/comments/40ryt9/how_to_play_singstar_on_pcsx2)
  * [Use Windows 10 for decreased WASAPI latency](https://stackoverflow.com/a/57116994)
  1. Make ISO of one of your SingStar PS2 discs to PC (I use MagicISO)
  2. Download [USBqemu-wheel](https://github.com/jackun/USBqemu-wheel#singstar)
  3. Put download into Plugins folder
  4. Run PCSX2
  5. Plug in Singstar microphone input into PC
  6. Turn on Singstar microphone and test to see if it works
  7. Click on Plugins in PCSX2, change input plugin to USBqemu-wheel and change device in port 1 to SingStar mics and then select configure it to the Singstar microphone
  8. Select Singstar ISO and play
  9. After game has loaded press F9 to get graphics mode correct
  10. Enjoy SingStar on your PC
* In _Configuration > Emulation parameters_, set the _Preset_ slider to _3 - Balanced_
* In _Configuration > Video (GS) > Plugin parameters > Hardware Renderer Settings_, Set _Internal Resolution_ to _3x Native (~1080p)_ (or even _4x_)
* In _Configuration > Controllers (PAD) > Plugin parameters > Pad 1_, click _Quick Setup_ and start assigning each joypad button one at a time
  * _Tip_: If an (already previously configured) controller is not detected when plugged in, just open this menu once and go back to the game window
* Can play from Disk, but that's not recommended (as [it probably causes framedrop](https://forums.pcsx2.net/Thread-Framerate-Drop)) => burn Disk to ISO first instead
  * Eg AnyBurn, **BlackBox ISO Burner**, DAEMON Tools, ImgBurn, MagicISO
  * Error message _File not found... Path: Iso file system_ (most likely) means the ISO is corrupted/unusable
* Fix 1 pixel wide line at the bottom & right side of the screen by [adjusting the zoom](https://forums.pcsx2.net/Thread-1-pixel-wide-graphical-corruption-along-right-side-and-bottom) to 101, 102, 103, etc.
* Fix [God of War II issues](https://forums.pcsx2.net/Thread-God-of-War-II-FPS-Drops-and-weird-graphic-bug)

## SNES

ROM Image Games are created using a variety of (hardware) [data dumping tools](https://ucon64.sourceforge.io/ucon64/hardware.html), and produce images with possibly various extensions.

For instance, _fig_, _sfc_ & _smc_ files are all ROM game images (see <https://forums.emulator-zone.com/index.php?threads/snes-file-diffs-smc-sfc-fig-sms.3052>)

* _.FIG_ = ROM game image
* _.SFC_ = ROM game image
* _.SMC_ = ROM game image
* _.IPS_ = user-made ROM cheat/graphics/language modding patch
* _.SRM_ = Save file
* _.ZST_ = [ZSNES Save State](https://file.org/extension/zst)

### Patching

* [Internal Patching System](https://file.org/extension/ips)
  * `IPS.exe {game.(fig|sfc|smc)} {patch.ips}` = modifies the original file with the patch
    * `copy game.xxx gamefr.xxx` to make a copy beforehand
  * [How to auto-apply IPS file in ZSNES](http://zsnes-docs.sourceforge.net/html/readme.htm#ips_patching)
