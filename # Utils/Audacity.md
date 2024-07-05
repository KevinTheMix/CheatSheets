# Audacity

## Quick Tips

* [Auto-cut clips](https://forum.audacityteam.org/t/detach-at-silences-silence-level/49998)
  * Combine **Noise Gate** (_Gate threshold_ ~= -60dB, _Level reduction_ = -100dB) with **Detach at Silences**
* Use max peak visual cue (eg to gauge value for Amplify effect's _New Peak Amplitude_ setting)
* Record podcasts as mono to save space

## Glossary

* **Clip** = portion of a track (a yet unedited track is basically one big clip)
* **Compression** = uniformization of high dynamic ranged audio (evens volume by amplifying quiet & softening loud sounds)
* **Track** = one or two (ie Mono or Stereo L/R) horizontal wave

## Menus

* File > Export Audio… > _Split files based on > Labels_ = export all labeled clips
* Edit > Audio Clips > _Detach at Silences_ = auto-cut clips (use Noise Gate beforehand)
* Edit > Preferences > (keyboard) _Shortcuts_
* View > Toolbars > _Reset Toolbars_
* Tracks > Mix
  * **Mix Stereo Down to Mono** = (lossy) merge L/R channels into single mono
  * **Mix and Render** = merge all tracks into first track
  * **Mix and Render to New Track** = merge all tracks into new track
* Generate = use this menu to insert new stuff (eg silences) on a track
* Effects
  * Volume and Compression > _Auto Duck_ = sidechain compression (adjusts volume based on control track ie the one right below)
  * Noise Removal and Repair > _Noise Gate…_ = silence noise
  * Special > _Truncate Silence…_
* Tools > [Apply Macro](https://manual.audacityteam.org/man/apply_macro.html)
* Track Name Dropdown > _Make Stereo Track_ (when multiple tracks are selected) = merges two Mono tracks into one Stereo tracks

## Shortcuts

* `F1` = selection tool
* `F2` = envelope tool, can be used for gradual (time-based) volume adjustments
* `F3` = draw tool
* `F4` = multi-tool
* `P` = Pauses _play head_
* `X` = Play, or move _play head_ at selection
* `Space` = play from current selection (& loops inside a looping region), or reset _play head_
* `Delete` = removes portion of audio & shifts left the part after
* `Shift + Space` = play from user selection (& plays just once inside a looping region)
* `Shift + Click` = set beginning/end of selection
* `Alt + ,` = previous Clip
* `Alt + .` = next Clip
* `Alt + Drag clip` = time-stretch
* `(Shift +) Tab` = cycle through clips
* `Ctrl + 1` = zoom in
* `Ctrl + 3` = zoom out
* `Ctrl + A` = select All Tracks
* `Ctrl + B` = add Label at selection
* `Ctrl + D` = Duplicate selection as new track
* `Ctrl + E` = fit selection to width
* `Ctrl + F` = Fit project to width
* `Ctrl + J` = Join clips (after selecting multiple)
* `Ctrl + L` = silences (but doesn't delete) audio selection
* `Ctrl + P` = Preferences
* `Ctrl + T` = Trim audio outside selection
* `Ctrl + Shift + E` = Export Audio
* `Ctrl + Shift + F` = Fit tracks to height
* `Drag track header` = move track up/down
* `Drag looping region` = move looping region
* `Drag looping region boundaries` = set beginning/end
* `Drag selection boundaries` = set beginning/end

### Custom

* `S` = Split

## [Audacity Plugins](https://plugins.audacityteam.org)

* [OpenVINO](https://github.com/intel/openvino-plugins-ai-audacity) = AI plugin tools (transcription, separation, generation, noise suppression)
  * [Releases](https://github.com/intel/openvino-plugins-ai-audacity/releases) & install guide
