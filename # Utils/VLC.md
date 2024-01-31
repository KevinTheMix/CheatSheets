# VLC

## Keyboard

* `a` = aspect ratio
* `e` = image-by-image
* `r` = random
* `t` = time
* `o` = toggle original size
* `p` = previous

* `s` = stop
* `d` = disinterlace
* `f` = full-screen
* `g` = subtitles delay
* `h` = subtitles delay

* `c` = rognage
* `v` = subtitles track selection
* `b` = audio track selection
* `n` = next

## Settings

* **Resume play**
  * _Simple_ view > Playlist (section) > Resume play?
  * _All_ view > Interface > Main Interfaces > Qt > Resume play?
* **Play MIDI files**
  * Inputs/Codecs > Audio Codecs > FluidSynth > SoundFont File = _GeneralUser GS v1.471.sf2_

## [Extensions](https://addons.videolan.org/browse)

VLC extensions are written in Lua.
Main directory is _C:\Program Files\VideoLAN\VLC\lua_

* [Playback Speed Manager](https://github.com/ilgaiaz/playback-speed-manager)
  * `speedupTable = {"1", "1.2", "1.33", "1.50", "2", "2.50", "3", "3.50", "4"}`
  * `rateTable = {"1.2", "1.1", "1", "0.9", "0.85", "0.80", "0.75", "0.70", "0.65", "0.60", "0.55", "0.50"}`
  * _playback\_speed\_manager (@edit).lua_ goes to _C:\Program Files\VideoLAN\VLC\lua\extensions_
  * _psm\_looper\_intf.lua_ goes to _C:\Program Files\VideoLAN\VLC\lua\intf_
* [Speed Controller](https://addons.videolan.org/p/1571978) = quickly switch between custom defined speeds
* [Time Saver](https://addons.videolan.org/p/1154010) = increase video speed when there is no dialog (subtitle)
  * Apparently no more available in VLC 3.0 according to Playback Speed Manager github
* [VLSub](https://addons.videolan.org/p/1154045/) = subtitles search & download (comes with vanilla VLC)
