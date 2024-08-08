# FL Studio

## Quick Tips

* [FL Studio Reference Manual](https://www.image-line.com/support/flstudio_online_manual/html/title.htm)
* Find missing files/samples by including (recursive) folders via _Options > File settings > Browser extra search folders_

## Glossary

* Channel = source of sound (synth, kick, keyboard, guitar) produced by audio sampling or VST generator
* Pattern = group of Channels playing notes that can then be added to the Playlist
* Playlist = full song
* Track = either an horizontal line of pattern(s) in the Playlist, or a Mixer slot
* VST (Virtual Sound Technology) = Virtual Instrument / Plugin

## Settings

* `FILE > Save new version` to branch out
* `FILE > Export > Zipped loop package` Backing up a complete project
* `FILE > Export > MP3 file > (browse) > (Project type) (Mode) Song selection` = only export timeline selection
* `FILE > Export > Wave file > (browse) > (Miscellaneous) > Split mixer tracks` = export individual stems (for mixing)
* `VIEW > (Windows) Toolbars > (Optional) Hint bar` = (advanced) Hint bar
* `OPTIONS > Audio settings > (Input/output) Device` = Toggle between **FL Studio ASIO** and **ASIO4ALL V2**.
* `OPTIONS > General settings > (Miscellaneous) Detach all plugins` = Keep plugins on top (floating windows)
* `OPTIONS > General settings > (Project tab) > (Data folder) _folder icon_ > (find)` = Set save destination
* `TOOLS > (Score logger) Dump score log to selected pattern` = Copy last played MIDI

## Shortcuts & Tips

Lookup unknown shortcuts and use them immediately instead of clicking, à la Day9.
Look for Arrow+File icon that allows to Drag & Drop cloning settings

* Buttons & Sliders
  * `Ctrl + Move` = Fine-tune
  * `Right-click > Create automation clip`
  * `Right-click > Link to controller` = Linking knobs
    * `(Top menu) Multilink to controllers > Click any plugin's button` = when linking is not available on some plugins (e.g. Serum)
* Menus
  * `F1` = Help pages
  * `F4` = Create New Pattern
  * `F5` = Playlist
  * `F6` = Channel rack
  * `F7` = Piano roll
  * `F8` = Plugin picker
  * `F9` = Mixer
  * `F11` = Song info
  * `R`= Record
  * `Alt + F8` = Object browser
  * `Ctrl + F8` = Pattern/Channel picker
  * `Ctrl + L` = Toggle Pattern/Song mode
  * `Ctrl + T` = Toggle typing keyboard to piano
    * also `OPTIONS > (Switches) Typing keyboard to piano`
    * also a direct icon button in the top menu
* Playlist
  * `P` = Draw
  * `B` = Paint
  * `C` = Slice a Pattern (_note: this clones the pattern and shifts start/stop times_)
  * `Alt + T` = Name selected timeline section (e.g. "Chorus", "Verse")
    * Those can be moved be grabbing them from their left side
  * `Alt + Drag` = Fine moving patterns
  * `Alt + Roll` = Zoom vertically
  * `Ctrl + Drag` = Select patterns
  * `Ctrl + B` = Clone-append pattern
  * `Ctrl + Roll` = Zoom horizontally (also Rolling over the timeline)
  * `Shift + Drag` = Clone
  * `Shift + Roll` = Shift notes within last hovered pattern
  * `Left-Click Playlist - Arrangement > Clone` (_FL Studio 20 only_)
  * `Left-Click on pattern, then on the grid` = select & add that pattern
  * `Left-Click on pattern's upper-left corner > (_ clip) Make Unique`
  * `Left-click on pattern's upper-left corner > (Region) Chop` = Audio sample chopping (on transients)
  * `Right-Click + A` = Auto-name
  * `Right-Click + I` = Insert
  * `Right-Click + U` = Move up
  * `Right-Click + D` = Move down
  * `Right-Click Automation clip` = add waypoints
  * `Right-click + G` = Group with above Track
    * `Right-click grouped Track > Auto-color group` = applies clicked Track color to whole group.
  * `Double-click Playlist Automation clip pattern's header > Articulator tools (wrench on the right) > Copy/Paste state` = Copy Automation clip
* Piano Roll
  * `Ctrl + Up/Down` = Move selected note by one octave
  * `Shift + Up/Down` = Move selected note by one half-tone
  * `Ctrl + B` = Clone-append selection
  * `Alt + Q` = Quantize (same as `Arrow > Tools > Quantize`)
  * `Alt + R` = Piano roll - randomizer; allows randomizing the Levels (Pan, Vel, etc.) so it sounds more human
  * `Alt + S` = Piano roll - strumizer; allows controlling strum strength so it sounds more human
  * `Alt + Y` = Piano roll - score flipper (inverser)
  * `Ctrl + Q` = Quick quantize
  * `Shift + Q` = Quick quantize start times
  * `Arrow > H(elpers) > S(cale highlighting)`
* Channel rack
  * `Alt + Up/Down` = Move a channel Up/Down
  * `Ctrl + C/V` = Copy channel notes to another channel (also in different Pattern)
  * `Ctrl + Click` = listen preview (source: comment on In The Mix's Template video)
  * `Shift + Click` = Rename/color/icon channel
  * `Right-click Channel > Panio roll` = Piano Roll
  * `Right-click Channel > Cut itself` = Fix overlapping 808 notes (and other samples)
  * `Open Channel > upper-left arrow > (Channel) Save channel state as…` = Save plugin state
  * Channels can be divided into groups
    * A new _Audio_ group is automatically created when an (Edison) Audio recording gets added to Playlist.
* Mixer
  * `Ctrl + L` = Add selected Rack Channel Track to Mixer Track
  * `Alt + Left/Right` or `Shift + Mouse  wheel` = Move mixer track left/right
  * `Alt + R` = Rendering 1 mixer track
  * `Left-Click Track plug icon` = Disable effects for Mixer Track
  * `Right-Click Effects` = Effect picker
  * Use the built-in EQ (by track) in the Mixer itself
  * Channel volume gets applied **before** and Mixer volume **after** any effects.
* Object browser
  * `All > Right-click on Pack folder > Smart find in this folder… > F2|F3` = Previous/Next search result
  * `Current project > Patterns > Ctrl + Shift + Up/Down` = Rearrange Pattern order
  * `Current project > Patterns > Initialized controls > (delete)`
    * [How to Delete Automation Events](https://www.youtube.com/watch?v=HPX70pj7wyE)
* Edison Recorder (`Record > Audio, into the Edison recorder`)
  * `Alt + Left` = Reverse
  * `Ctrl + R` = Reverb

## Tutorials

* [Akai MPK mini setup Official Installation Guide](https://www.youtube.com/watch?v=cah50PUb7AI)

### Professoar

* [Learn FL Studio playlist](https://www.youtube.com/playlist?list=PLOAyyCeKwsR42q150SE5cY35XMjJiD0HP)
* [Free VSTs Plugins](https://www.youtube.com/watch?v=XgTvQRcj3oI)
* [Hi-Hat Repeat Trick](https://www.youtube.com/watch?v=8iwB38ZTz_c)
* [How To Export Stems](https://www.youtube.com/watch?v=xoo6E6MiZMk)

### In The Mix

* [12 Essential Tips](https://www.youtube.com/watch?v=RBw-pdqus3k)
* [Loop to Song #1](https://www.youtube.com/watch?v=LLmTDBV2riQ)
  * Slice a Pattern, then make it unique
* [Loop to Song #2](https://www.youtube.com/watch?v=NwTPqJKoFW8)
  * Rename, color, icons Playlist Timeline, Playlist Track, Rack Channel, Pattern, Mixer tracks (Ctrl + L)
* [Loop to Song #3](https://www.youtube.com/watch?v=jUq9UE55VNs)
  * Inspiration & change by fresh loop ends, automation fluctuation, playing manually, doubling down melody to bass, staggering chord notes, instruments selection & atmospheric string trial
* [Compression](https://www.youtube.com/watch?v=yi0J9JsRdI4)
* [Make Your own Kick Drums](https://www.youtube.com/watch?v=JhZU6JGvoHw)

#### [Sound Design](https://www.youtube.com/watch?v=NJLIS2MkFe4)

90% of sound design = Wave shape + Filter + ADSR

* Wave shape = Sin or Square or Saw
  * Additive synth = Sin U Square U Saw
  * Reinforce bass kick with sin wave synth
* Filter (Subtractive synth) = remove some of the frequencies
  * Lowpass = only the low frequencies can pass
  * Highpass = only the high frequencies can pass
  * Cutoff = change the frequency at which the filter starts applying
* ADSR = controls Volume over time
  * Attack = how fast sounds reach max volume
  * Decay = how fast to lower down to sustain volume
  * Sustain = volume of pressed key
  * Release = how fast sound dies off when release key?
* LFO
  * Create Automation clip on an EQ Filter's cutoff's LFO speed = Thriftworks

## VST Plugins

Download VST <https://www.youtube.com/watch?v=ZUxML8BhLfk&t=213s>

* [Serum](https://splice.com/accounts/sign-up)
* [VST 4 Free](http://vst4free.com/)
* [Splice](https://splice.com/)
  * [Free Plugins](https://splice.com/plugins/free_plugins)
  * [Portal](https://splice.com/plugins/38587013-portal-vst-au-by-output)
* [Torrent](https://audionews.org/)
* [Cracks](https://www.vstcrack.com)
  * [Diva](https://www.vstcrack.com/u-he-diva-1-4-win/)
* Modal ?
* 808 ?
* Julien Vocoder.exe

## Questions

* How to change default/template channels (kick, clap, hat, snare) & stuff?
