# FL Studio

* Channel = One source of sound (synth, kick, keyboard, guitar) produced by sampling or VST.
* Pattern = A group of Channels playing notes that can be added to the Playlist
* Playlist = the song
* Track = an horizontal line in the Playlist, or a Mixer slot

## Settings

* Toggle input source = `OPTIONS > Audio settings > (Input/output) Device` set to **FL Studio ASIO** or **ASIO4ALL V2**

## Shortcuts

Tip: lookup unknown shortcuts and use them immediately, instead of clicking your way through the application (thx Day9).

* Ctrl + Button/Slide = Fine-tune
* Menus
  * F1 = Help pages
  * F4 = Create New Pattern
  * F5 = Playlist
  * F6 = Channel rack
  * F7 = Piano roll
  * F8 = Plugin picker
  * F9 = Mixer
  * Ctrl + F8 = Pattern/Channel picker
  * Alt + F8 = Object browser
* Playlist
  * Alt + T = Name selected timeline section (e.g. "Chorus", "Verse")
  * Alt + Drag = Fine moving patterns
  * Alt + Roll = Zoom vertically
  * Ctrl + Drag = Select patterns
  * Ctrl + B = Clone timeline selected patterns after
  * Ctrl + Roll = Zoom horizontally
  * Shift + Drag = Clone
  * Shift + Roll = Shift notes within last hovered pattern
  * Left-Click on pattern, then on the grid = select & add that pattern
  * Left-Click on pattern's upper-left corner > Make Unique
  * Right-Click + A = Auto-name
  * Right-Click + I = Insert
  * Right-Click + U = Move up
  * Right-Click + D = Move down
* Channel rack
  * Alt + Up/Down = Move a channel Up/Down
  * Ctrl + Click = Play one note of Channel
  * Shift + Click = Rename/color/icon channel
  * Channels can be filtered by group!
    * A new group is created automatically for (Edison) Audio recordings added to Playlist
* Mixer
  * Ctrl + L = Add selected Channel track to Mixer track
  * Alt + Left/Right = Move mixer track
  * Right-Click Effects = Effect picker
* Object browser
  * Current project > Patterns > Ctrl + Shift + Up/Down = Move Pattern
* Edison Recorder (Record > _Audio, into the Edison recorder_)
  * Alt + Left = Reverse
  * Ctrl + R = Reverb

## How-To Tutorials

### Akai MPK mini setup

* [Reference Manual](https://www.image-line.com/support/flstudio_online_manual/html/title.htm)
* [Guide](https://www.youtube.com/watch?v=cah50PUb7AI)

### [Professoar AKAI MPK Setup](https://www.youtube.com/watch?v=gWF-K3nOnlA)

* Initialize Akai MPK mini with the setting file in the video's description (_MPK MINI SETUP YOUTUBe_).
* FPC Beat Plugin
  * Reassigning Pads = down arrow under _FPC_ logo (not to be confused with top-left right-arrow) > _Map notes for entire bank_
  * Reloading existing presets = down arrow > (Notes subsection >) Layouts > AKAI MPK mini
  * Layout files stored in <C:\Program Files (x86)\Image-Line\FL Studio 12\Plugins\Fruity\Generators\FPC\Data>
  * Drag & drop a Windows file or a lib item onto each pad
  * Press FULL LEVEL so all pads will be hit with full velocity
* Arpeggiator control (the 2 buttons below the red knob)
  * Click ON/OFF, then hold multiple keys (the song must be playing in FL Studio for it to work)
  * Change speed by holding ON/OFF and selecting a Tempo (left keys on keyboard e.g. 1/4, 1/8T, etc.)
* Notes Repeat = Hold NOTE REPEAT & press FPC pad
* Record keys
  * Select Notes & Automation
  * Metronome
  * Blend Recording = add latest inputs to existing (overwrite otherwise)
  * Loop Recording = allow multiple/overlapping takes
* Play both FPC & Synth
  * Assign both Pads & Keyboard by selecting channels at once (Dragging or Ctrl/Shift + Click)
* Split by Channels
  * Right-click a Pattern > Split by Channels, and that one Pattern gets replaced with multiple single-Channel ones.
* Linking knobs
  * Right-Click any button/slider > Link to controller
  * If not available on some plugins (e.g. Serum), go to top menu button Multilink to controllers then click on button

### [In The Mix Loop to Song](https://www.youtube.com/watch?v=NwTPqJKoFW8)

* Rename & Color
  * Playlist timeline sections
  * Channels (with icons)
  * Patterns
  * Mixer tracks (Ctrl + L)
* Edison Recorder (Record > _Audio, into the Edison recorder_)
  * Alt + Left = Reverse
  * Ctrl + R = Reverb
* Right-click any button/slider > Create automation clip
  * Right-Click on pattern in Playlist = add waypoints
* Right-click > **G**roup with above track
  * Right-click either Playlist Track > Auto-color group = applies clicked Playlist track color to the other tracks in the group.

### [In The Mix 12 Essential Tips](https://www.youtube.com/watch?v=RBw-pdqus3k)

1. Copy last played MIDI = `TOOLS > (Score logger) Dump score log to selected pattern`
2. Channel volume gets applied **before** and Mixer volume **after** any effects.
3. Audio sample chopping (on transients) = Left-click Playlist pattern's upper-left corner > (Region) Chop
4. Automation clip copy = Double-click Playlist Automation clip pattern's header > Articulator tools (wrench) > Copy/Paste state
5. Deleting initialization events = Object browser
6. Saving destination = `OPTIONS > General settings > (Project tab) > (Data folder) _folder icon_ >` (select a folder)
6. Backing up a project = FILE > Export > Zipped loop package with **everything**
7. Making Playlist pattern unique = Left-click Playlist pattern's upper-left corner > Make unique
8. Sample Search = `Object browser > Right-click on Pack folder > _Smart find in this folder_`, then F2/F3 for Previous/Next result
9. Keeping plugins on top (Floating windows) = `OPTIONS > General settings > (Miscellaneous) Detach all plugins`
10. Overlapping 808 notes (and other samples) = Right-click Channel (rack channel) > Cut itself
11. Hint bar (more advanced hint) = VIEW > (Windows) Toolbars > (Optional) Hint bar
12. Using the Mixer EQ = use the built-in EQ (by track) in the Mixer itself

### Misc

[In the Mix #1](https://www.youtube.com/watch?v=LLmTDBV2riQ)

It's possible to save the state of a plugin (to save the sound of a sound).

* [Remove events](https://www.youtube.com/watch?v=HPX70pj7wyE)
* [VST plugins](https://www.youtube.com/watch?v=XgTvQRcj3oI)
* Export
  * Select song > Export (only selected will get exported)
  * Wav > Stems => Will explode the track into stems for mixing.
    * See <https://www.youtube.com/watch?v=xoo6E6MiZMk>
* [Professoar Learn FL STUDIO](https://www.youtube.com/playlist?list=PLOAyyCeKwsR42q150SE5cY35XMjJiD0HP)
  * [Hi-Hat Repeat Trick](https://www.youtube.com/watch?v=8iwB38ZTz_c)
* [In The Mix Make Your own Kick Drums](https://www.youtube.com/watch?v=JhZU6JGvoHw)

## Add-ons

* [Serum](https://splice.com/accounts/sign-up)

## Questions

* How to change default channels (kick, clap, hat, snare)?
* How to disable keyboard inputs
  * Alt + shortcut key
