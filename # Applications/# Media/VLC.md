# VLC

## Quick Tips

* [Convert a DVD VIDEO_TS](https://stackoverflow.com/a/70808591)
  * Media > _Convert / Save…_ (`Ctrl + R`) > Disk > Convert (`Alt + O`)

## Shortcuts

* `A` = aspect ratio
* `B` = audio track selection
* `C` = rognage
* `D` = disinterlace
* `E` = image-by-image
* `F` = full-screen
* `G` = subtitles delay
* `H` = subtitles delay
* `I` = toggle display play controls (when in full screen)
* `J` = audio track delay (-50ms)
* `K` = audio track delay (+50ms)
* `L` = loop (repeat one, repeat all)
* `M` = mute
* `N` = next
* `O` = toggle original size
* `P` = previous
* `R` = random
* `S` = stop
* `T` = display elapsed time / total time
* `V` = subtitles track selection

* `F11` = full screen interface

* `Ctrl + I` = current media (General, Metadata, Codec, Statistics) information
* `Ctrl + L` = toggle Playlist
* `Ctrl + R` = convert & save
* `Ctrl + Wheel` = subtitle size

## Settings

* Resuming play = _Simple_ view > Playlist (section) > _Resume play?_ (or _All_ view > Interface > Main Interfaces > Qt > _Resume play?_)
* Playing MIDI files = _All_ view > Inputs/Codecs > Audio Codecs > FluidSynth > SoundFont File = _GeneralUser GS v1.471.sf2_
  * _Note_: may need to be manuall removed then re-added
  * See [Configure SoundFont in VLC](https://wiki.videolan.org/Midi/#Configure_SoundFont_in_VLC)

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
