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
* `e`/`E` = end of current or next (`E` blank-delimited) word (ignoring/jumping over newlines)
* `b`/`B` = move to beginning of previous (`B` blank-delimited) word
* `w`/`W` = move to beginning of next (`W` blank-delimited) word
* `H`/`M`/`L` = move to top/middle/bottom of content
* `0`/`^^`/`$` = line beginning/end
* `#`/`*` = previous/next occurrence of word at cursor
* `(`/`)` = previous/next sentence
* `{`/`}` = previous/next paragraph
* `gg`/`G` = beginning/end of file
* `{n}gg`/`{n}G`/`:{n}` = line _n_
* `f{char}`/`F{char}` = jump to next/previous given character on current line
* `?`/`/` = find text back/forward (add `\c` for one-time ignore case)
  * `n`/`N` previous/next occurence
  * `Ctrl + I` or `Ctrl + O` = previous/next search location (_not a motion_)
* `%` = jump to matching (start/end) character in a parenthesis or bracket pair (ie _()_, _[]_, _{}_)

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
  * `r`/`R` = replace one or more characters at cursor (`R` enters **Replace** mode, à la Windows Insert)
  * `J` = join lines (removes newlines, adding trailing space if next line is not empty)
* Undo/redo
  * `.` = redo last manipulation
  * `u`/`Ctrl + r` = undo/redo (go back/forward one step in history)
  * `U` = toggle undo all changes to same line

### Execution Mode

 Autocomplete works here.

* `Ctrl + D` = offer autocomplete suggestions
* `{text}{Tab}` = autocomplete (cycle through shortlist if several, works for commands & files)
* `:!{cmd}` = hides Vim & runs (shell) command in shell (see `:r` below to insert its content)
* `:e {file}` = replace currently edited file (see `:r` below to insert its content)
* `:n` = go to next file (in a multi-files editing session, ie via `vim {file1} {file2}`)
* `:q` = quit current window (eg Help page), or Vim itself
* `:w {file}` = save/write buffer (to file)
* `:wq` = save & quit
* `:x` = save & quit
* `:[qwx]!` = force-quit immediately without saving & skipping other files to edit
* `:help ({subject})` or `F1` = help (eg `c_CTRL-D`, `insert-index`, full `user-manual`)
* `:shell` = start an embedded shell (default one from _.passwd_ or overriden via set option _shell=/bin/bash_)
* `:terminal` = built-in terminal emulator
* `:set {options}` = set one or more terminal options (prepend `no` to toggle option off)
  * _ai_ (_autoindent_) = autoindent (copy indent from current line on new line)
  * _bk_ (_backup_) = make a stickying around backup before overwriting an existing file (see _writebackup_ for temp while-writing backup)
  * _cp_ (_compatible_) = makes Vim Vi-compatible
  * _et_ (_expandtab_) = use real tab character instead of spaces (default on)
  * _hls_ (_hlsearch_) = highlight all matches
  * _ic_ (_ignorecase_) = ignore case in searches
  * _is_ (_incsearch_) = incremental search (show partial matches, set by default)
  * _nu_ (_number_) = lines numbering
  * _sw_ (_shiftwidth_) = number of spaces for each step of auto-indent (_>>_, _<<_, _==_, _o_)
  * _ts_ (_tabstop_) = width of tab character (eg `set ts=4`)
  * _ws_ (_wrapscan_) = search cycling (wrap back around end of file)

#### Editing

* Locations (current cursor position if unspecified)
  * `{n}` = n-th line
  * `.` = current line
  * `±{n}` = n-th line (`.` is implied)
* Range = `{location},{location}`
* Edition (spaces in commands are optional)
* `:m±{n}` = move line up/down
* `:{range} d` = delete current line
* `:{range} co {location}` = copy
* `:{range} mo {location}` = move
* `:{location}r {file}` = insert file content (below cursor line)
* `:{location}r !{command}` = insert output of command
* Substitution = `:({range})s/{old}/{new}(/{flags})`, with optional flags:
  * Where _old_ is a pattern (accepting char classes `[]`), _new_ is a literal, and _flags_ are:
  * `c` = with confirmation
  * `g` = replace all occurences on current line (`:%s/…/…/g` for in whole file)
  * `i` = ignore case
* `&` = repeat last `:s` command

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

## Extensions

* **nvim-lspconfig** = LSP (Language Server Protocol, ie turns editor into IDE with completion, syntax highlighting, etc)
* **Telescope** = fuzzy finder
