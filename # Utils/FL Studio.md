# FL Studio

## Quick Tips

* Double right-click on ghost notes to swap between channels
* How to change default/template channels (kick, clap, hat, snare) & stuff?
* Individual FPC drumpads can be sent to different mixer channels (Output == offset)
* Copy automation envelopes from one clip to the next (Articulator > Copy/Paste state)
* Look for _Arrow + File_ icons that indicate it's possible to clone settings via drag & drop
* [FL Studio Reference Manual](https://www.image-line.com/support/flstudio_online_manual/html/title.htm)
* Find missing files/samples by including (recursive) folders via _Options > File settings > Browser extra search folders_

## Glossary

* **Channel** = source of sound (synth, kick, keyboard, guitar) produced by audio sampling or VST generator
* **Pattern** = group of Channels playing notes that can then be added to the Playlist
* **Piano Roll** = one Channel's melody sequence (vertical = 'piano' notes, horizontal = time)
* **Playlist** = full song sequence
* **Track** = either an horizontal line of pattern(s) in the Playlist, or a Mixer slot
* **VST** (Virtual Sound Technology) = Virtual Instrument / Plugin

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

* Buttons & Sliders
  * `Ctrl + Move knob/slider` = Fine-tune
  * `Right-click > Create automation clip`
  * `Right-click > Link to controller` = Linking knobs
    * `(Top menu) Multilink to controllers > Click any plugin's button` = when linking is not available on some plugins (eg Serum)
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
  * `Alt + T` = Name selected timeline section (eg "Chorus", "Verse")
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

## VST Plugins

Download VST <https://www.youtube.com/watch?v=ZUxML8BhLfk&t=213s>

* [Cracks](https://www.vstcrack.com)
  * [Diva](https://www.vstcrack.com/u-he-diva-1-4-win)
* [Serum](https://splice.com/accounts/sign-up)
* [Splice](https://splice.com)
  * [Free Plugins](https://splice.com/plugins/free_plugins)
  * [Portal](https://splice.com/plugins/38587013-portal-vst-au-by-output)
* [Torrent](https://audionews.org)
* [VST 4 Free](http://vst4free.com)
