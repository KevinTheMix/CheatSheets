# Emulation

## Emulation

* [blueMSX](http://bluemsx.msxblue.com) = MSX emulator
* [DOSBox](https://www.dosbox.com) = MS-DOS emulator
* [GamesNostalgia](https://gamesnostalgia.com) = Amiga, Atari, C64, MS-DOS, PC, Sega games
* Lutris = FOSS Linux games launcher/manager, supports popular emulators (DOSBox, Snes9x, Dolphin, PCSX2), and Wine for Windows games
* [Mini vMac](https://www.gryphel.com/c/minivmac) = Early Macintosh emulator
* [openMSX](https://openmsx.org) = MSX emulator
* [PlayStation emulators](https://emulation.gametechwiki.com/index.php/PlayStation_emulators)
* [RetroArch](https://www.retroarch.com) = cross-platform frontend for game emulators

* [ROM Naming Guide ((U), (J) and [!])](https://www.emuparadise.me/help/romnames.php)

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
