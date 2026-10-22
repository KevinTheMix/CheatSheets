# Playstation

## Quick Tips

* [Cleaning/Restoring a PS2](https://www.youtube.com/watch?v=5GoJWS_1hmw)
* [How to reset a PS3](https://www.wikihow.com/Reset-a-PS3)
* [PS3 Recovery Menu](https://www.psdevwiki.com/ps3/Recovery_Menu)
* [PS3 Tropy Collection](https://manuals.playstation.net/document/en/ps3/current/trophy/trophy.html)

## Games

### Dark Souls II

* Play vanilla (without Scholar of the First Sin) for original easier experience

### Final Fantasy

* [Final Fantasy World](http://web.archive.org/web/20160411060844/http://www.ffworld.com)
* [Shiro](http://anshiro.free.fr)

### God of War

* [Guide to "Give me God of War" hardest difficulty](https://www.reddit.com/r/GodofWar/comments/8fyb7b/tips_for_new_players_and_people_attempting_gmgow/)

### Ghost Recon

* [Bolivia, Ghost Recon: Wildlands Map](https://guides4gamers.com/ghost-recon-wildlands/map/bolivia)

#### Strategy

When approaching enemy bases in "Ghost Recon" as a team of four beginner players, it's important to have a plan and work together. Here are some general tips:

1. Scout the area: Use drones or binoculars to gather intel on the base and its defenses. Identify enemy positions and plan your approach accordingly.
2. Assign roles: Decide who will take on each role, such as a sniper, assault, support, and scout. Make sure everyone knows their responsibilities and how they will contribute to the mission.
3. Communicate: Use in-game voice chat or other communication tools to stay in contact and coordinate your actions. Make sure to call out enemy positions and movements so your teammates can react appropriately.
4. Use stealth: Whenever possible, try to take out enemies silently to avoid alerting others. Use silenced weapons, melee takedowns, and distractions to achieve this.
5. Work together: Coordinate your actions and support each other. Cover each other's backs and work as a team to take down enemies and complete objectives.
6. Plan for contingencies: Have a backup plan in case something goes wrong. Be prepared to adapt to changing situations and work together to overcome any obstacles.

Remember, practice makes perfect. Don't be discouraged if you fail a few times, keep trying and learning from your mistakes.

### Ratchet & Clank Future: Tools of Destruction

* Problem: Known install bug in Ratchet & Clank: Tools of Destruction (2007). The game’s own free-space calculation breaks at certain values and wrongly shows “419 MB required / insufficient space.” Solution: Add or remove ~500 MB on the PS3 hard drive (e.g. copy a video file), then relaunch the game.
  * Why the game handles its own installation, and why the fault lies with Insomniac’s code
    * On the PS3, there was no mandatory, system-wide install process, unlike on the PS4 and PS5. Games ran straight from the Blu-ray disc. Because the drive was slow (roughly 9 MB/s), many studios chose to copy part of their data to the hard drive to speed up loading. That copy was optional and entirely up to each developer: some games installed nothing, others several gigabytes. The game’s own code handled it, which meant checking free space, copying the files and drawing the progress screen in the game’s own style. The PS3 operating system only supplied the storage; it did not manage the process.
    * That is why the error screen was the clue. It had the game’s own look (background, fonts) rather than the grey system dialog of the XMB menu. That meant the check was done by Insomniac’s code, not by the console. The console itself reported your 376 GB of free space correctly, and the game misread that number. This also explains why Quest for Booty, built by the same studio a year later with corrected code, installed without trouble on the same console, and why no other PS3 game was affected by this particular bug.
  * One caveat: Insomniac never published the technical details, so the exact mechanism (such as integer overflow) is my reconstruction. What is confirmed by the studio and by user reports is that certain free-space values triggered the error, and that adding or removing about 500 MB always fixed it.
* Déguisement seret = `> > < v ^ ^ X`

### Sekiro

* Sekiro sound cues (via _Late To The Party_ comment on Youtube)
  * Slash = you didn't block
  * Low pitch clang = you blocked too early
  * Mid pitch clang = you block a little early
  * High pitch clang = you deflected at the right moment

### Wipeout

* [WipeoutZone Downloads](https://www.wipeoutzone.com/downloads.php) = wallpapers
  * [WipeoutZone Downloads Index](https://www.wipeoutzone.com/downloads)
* [Wipeout 2097 piloting tips](https://www.wipeoutzone.com/forum/showthread.php?1274-Piloting-Tips-2097-XL)
* [WipeOut Phantom Edition](https://github.com/wipeout-phantom-edition) = (closed-source) PC WipEout 1 port (using 2022 leaked source code)
* [wipEout Rewrite](https://github.com/phoboslab/wipeout-rewrite) = (open-source) cross-platform WipEout 1 re-implementaiton
