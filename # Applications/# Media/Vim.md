# [Vim](http://www.openvim.com)

## Quick Tips

* **gVim** = Vim for Windows
* Use `vimtutor` Unix command (supposedly) 30 minutes tutorial
* Create a _~/.vimrc_ configuration file to enable more features (see `:help vimrc-intro`)
* Cursor position looks very weird in Normal mode, because [it is intended to modify text, not append more of it](https://stackoverflow.com/a/3676464/3559724)

## Glossary

* Modes
  * **Normal** or **Command** = move around & edit (starting mode)
  * **Execution** or **Command-line** = run commands & range editing
  * **Insert** = basic text typing
  * **Replace** = overwrites existing characters as you type
  * **Select** = selected text is replaced as you type
  * **Visual** = select text to operate on
* **Register x** = where cut content is stored (internally) to be pasted in Vim

## Commands

* `{Escape}` = switch to **Normal** mode
* `:` = switch to **Execution** mode
* `R` = switch to **Replace** mode (à la Windows Insert)
* `gh`/`gH` = select next char/whole line & switch to **Select** mode (use arrows to expand selection)
* `v` = switch to **Visual** mode
* `q:` or `q/` or `q?`  = command-line window
* Counts (multipliers)
  * `{n}{motion}` = repeats motion _n_ times (can be used in place a single motion)
  * `{n}{cmd}` = plays command _n_ times
  * `{n}{a/A/i/I/o/O}{text}{escape}` = insert/append n times _text_ at cursor

### Motions

Can be used in Normal mode to jump at a position, or as an argument in a command.

* `(Mouse) Wheel` = move cursor up/down
* `h`/`j`/`k`/`l` = left/down/up/right
* `e`/`E` = end of current or next word through newlines (`E` non-alphabetic characters don't separate)
* `b`/`w` = word backward/forward (ie place cursor at beginning of next/previous word)
* `0`/`^^/`$` = line beginning/end
* `#`/`*` = previous/next occurrence of word at cursor
* `{`/`}` = previous/next paragraph
* `gg`/`G` = beginning/end of file
* `{n}gg`/`{n}G` = line _n_
* `F{char}`/`f{char}` = find previous/next character on current line
* `?` or `/` = find text back/forward (add `\c` for one-time ignore case)
  * `n`/`N` previous/next occurence
  * `Ctrl + i` or `Ctrl + o` = previous/next search location (_not a motion_)
* `%` = matching (start/end) character in a parenthesis or bracket pair (ie _()_, _[]_, _{}_)

### Normal Mode

* In this mode, cursor appears between characters, but is always _on_ a character
* Manipulation
  * `a`/`A` = append after cursor/line
  * `i`/`I` = insert at cursor/line start
  * `o`/`O` = open new line below/above
  * `s`/`S` = cut character/whole line & switch to **Insert**
  * `y{motion}` = copy (yank)
  * `c{motion}` = cut & switch to **Insert**
  * `d{motion}` = cut
  * `yy` = copy whole line
  * `cc` = cut whole line & switch to **Insert**
  * `dd` = cut whole line
  * `D` = cut until end of line (same as `d$`)
  * `yap`/`dap` = copy/cut whole paragrah (no matter cursor position within)
  * `x`/`X` = cut character at/before cursor (à la backspace/delete)
  * `p`/`P` = paste (put) after/at cursor
  * `r{char}` = replace character at cursor with _char_
  * `J` = join lines (removes newlines, adding trailing space if next line is not empty)
* Undo/redo
  * `.` = redo last manipulation
  * `u`/`Ctrl + r` = undo/redo (go back/forward one step in history)
  * `U` = toggle undo all changes to same line

### Execution Mode

* `Ctrl + d` = offer autocomplete suggestions
* `{text}{Tab}` = autocomplete (cycle through shortlist if several, works for commands & files)
* `:!{cmd}` = run (shell) command (note: autocomplete works too)
* `:e {file}` = edit file (replaces current file, for content insertion see `:r` below)
* `:w` = write buffer (ie save file)
* `:q` = quit current window (eg Help page), or Vim itself
* `:wq` = save & quit
* `:q!` = quit without saving
* `:help ({subject})` or `F1` = help (eg `c_CTRL-D`, `insert-index`, full `user-manual`)
* `:shell` = start an embedded shell (default one from _.passwd_ or overriden via set option _shell=/bin/bash_)
* `:terminal` = built-in terminal emulator
* `:set {options}` = set one or more terminal options (prepend `no` to toggle option off)
  * _ai_ (_autoindent_) = autoindent (copy indent from current line on new line)
  * _bk_ (_backup_) = make a stickying around backup before overwriting an existing file (see _writebackup_ for temp while-writing backup)
  * _cp_ (_compatible_) = makes Vim Vi-compatible
  * _hls_ (_hlsearch_) = highlight all matches
  * _ic_ (_ignorecase_) = ignore case in searches
  * _is_ (_incsearch_) = incremental search (show partial matches, set by default)
  * _number_ = lines numbering
  * _wrapscan_ option = search cycling (wrap back around end of file)
  * _et_ (_expandtab_) = use real tab character instead of spaces (default on)
  * _sw_ (_shiftwidth_) = number of spaces for each step of auto-indent (_>>_, _<<_, _==_, _o_)
  * _ts_ (_tabstop_) = width of tab character (eg `set ts=4`)

#### Edition

Spaces are optional.

* Locations
  * `{n}` = n-th line
  * `.` = current line
  * `±{n}` = n-th line (`.` is implied)
* `{location},{location}` = range
* `:{range} co {location}` = copy
* `:{range} mo {location}` = move
* `:{range}s/{from}/{to}/g` = substitution
* `:m±{n}` = move line up/down
* `:{location}r {file}` = insert file content (below cursor line)
  * `:{location}r !{command}` = insert output of command
* Substitution
  * `:s/{old}/{new}` = substitute once
  * `:s/{old}/{new}/c` = substitute with confirmation
  * `:s/{old}/{new}/g` = substitute whole line
  * `:%s/{old}/{new}/g` = substitute in whole file
  * `:{range}s/{old}/{new}` = substitute between range

### Visual Mode

This this mode, preceding text selection is used in place of a succeeding motion.

* `{motion}` = selects text
* `{cmd}` = do Normal mode stuff with selected text (eg cut it `d`)
* `:{cmd}` = same with Execution mode (typing `:` prepends `'<,'>` to command immediately, eg save it as a new file `:w {file}`)

### Windows Management

* Bottom right indicate viewport position in file (Top/Bot/All/%)

* `Ctrl + v` or `Right-Click` = paste external data (not from internal registry like `p`, works in all modes)
* `Page Up`/`Page Down`= scroll a whole screen up/down
* `Ctrl + u/d` = scroll half a screen up/down
* `Ctrl + g` = indicate file name, status (if _Modified_), total # of lines, % cursor position (not refreshed in real-time)
* `zz` = center screen
* `Ctrl + w, =` = equalise all splits
* `Ctrl + w, _` = maximise current window's height (underscore stretches it to full height)
* `Ctrl + w, +` = increase  height by 1 line
* `Ctrl + w, -` = decrease height by 1 line
* `Ctrl + w, Ctrl + w` = jump from one window to another
* `Ctrl + Shift + F` = modern text search

## Extensions

* **nvim-lspconfig** = LSP (Language Server Protocol, ie turns editor into IDE with completion, syntax highlighting, etc)
* **Telescope** = fuzzy finder
