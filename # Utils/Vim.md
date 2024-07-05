# [Vim](http://www.openvim.com)

* **gVim** = Vim for Windows

## Symbols

* `w` = word
* `0` = line beginning
* `$` = line end

## Modes

* Commande (start)
  * `a` or `i` = switch to Insert
  * `:` = switch to Execution
  * `v` = switch to Visual
* Insert
  * `Esc` = Switch to Command
* Execution
  * `Esc` or `cr` = Switch to Command

### Insert

Type text.

### Command

Navigation

* `h j k l` = Left/Down/Up/Right
* `b e` = Beginning/End
* `w` = Next word
* `f[c]` = Find character [c]
* `0` = Beginning of line
* `$` = End of line
* `` =` = Previous occurence of the word at cursor
* `*` = Next occurence of the word at cursor
* `gg` = Beginning of file
* `G` = End of file
* `[n]G` = Go to line [n]
* `/[text]Enter` = Search
* `N` = Previous search
* `n` = Next search

Manipulation

* `a` = append
* `c` = change
* `d` = delete
  * `d[dir] p` = Cut/paste in direction [dir]
  * `D[dir] p` = Cut/paste until end of line
* `i` = insert
* `o` = insert a line
  * `O` = Insert line before (switches to Insert mode)
  * `o` = Insert line after (switches to Insert mode)
* `p` = paste
* `r[c]` = Replaces character at cursor with [c]
* `x` = delete 1 char
  * `x` = Deletes character before cursor (à la backspace/delete)
  * `X` = Deletes character after cursor (à la backspace/delete)
* `y` = copy

## Execution

* `:1,3 co 4` = copy lines 1 through 3 after line 4
* `:.,.+5 mo $` = move current and 5 next lines to the end (_$_ == end)
* `:1,7s/a/A/g` = remplace all _a_ with _A_ within lines 1 through 7

* `:autoindent` = indenting
* `i,jcok`
* `i,jmok`
* `:r` = read
  * `:r koko.txt` = insert _koko.txt_ content in currently edited file
  * `:r !{command}` = insert output of _command_
* `:q` = quit with message
* `:q!` = quit without saving
* `:set number` = numbering
  * `:set number autoindent` = both numbering & indenting
* `:w` = write (save)
* `:wq` = write (save) & quit
* `** :help` = help

## Macro

* `[n][cmd]` = Runs [cmd]*[n]
* `[n]i[text]` = Insert [text]*[n] at cursor
* `.` = Repeats previous command

### Visual

* `[dir]l` = Selects text
* `[cmd]` = Do stuff with selected text
