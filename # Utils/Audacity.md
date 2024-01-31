# Audacity

* Record podcasts as mono to save space
* [Auto-cut clips](https://forum.audacityteam.org/t/detach-at-silences-silence-level/49998)
  * Combine **Noise Gate** (_Gate threshold_ ~= -60dB, _Level reduction_ = -100dB) with **Detach at Silences**

## Menus

* File
  * Export Audio… > _Split files based on > Labels_ = export all labeled clips
* Edit
  * Audio Clips
    * **Detach at Silences** = auto-cut clips (use Noise Gate beforehand)
  * **Preferences**
    * (Keyboard) **Shortcuts**
* Tracks
  * Mix
    * **Mix Stereo Down to Mono** = merge L/R channels into single mono
    * **Mix and Render** = merge all tracks into first track
    * **Mix and Render to New Track** = merge all tracks into new track
* Effects
  * Noise Removal and Repair > **Noise Gate…** = silence noise
  * Special > _Truncate Silence…_

## Shortcuts

* `Alt + ,` = previous Clip
* `Alt + .` = next Clip
* `(Shift +) Tab` = cycle through clips
* `Ctrl + A` = select all Tracks
* `Ctrl + B` = add Label at selection
* `Ctrl + D` = **d**uplicate selection as new track
* `Ctrl + P` = **p**references
* `Ctrl + Shift + E` = **e**xport Audio

### Custom

* _Split_ = `S`
