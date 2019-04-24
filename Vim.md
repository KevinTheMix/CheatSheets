# Vim

<http://www.openvim.com/>

## Modes

Switch to Insert

    i

Switch to Normal

    Esc

Switch to Visual

    v

## Insert

Type text

## Normal

Navigate & Manipulate Text

Left/Down/Up/Right

    h j k l

Beginning/End
    b e

Next word

    w

Find character [c]

    f[c]

Beginning of line

    0

End of line

    $

Previous/Next occurence of the word at cursor
  
    \#
    *

Beginning/End of file

    gg
    G

Go to line [n]

    [n]G

Search

    /[text]Enter

Previous/Next search

    N
    n

Insert line before/after (switches to Insert mode)

    O
    o

Deletes character before/after cursor (à la backspace/delete)

    x
    X

Replaces character at cursor with [c]

    r[c]

Cut/paste in direction [dir]

    d[dir] p

Cut/paste until end of line

    D[dir] p

Save

    :w

Quit/Quit without saving

    :q
    :q!

Help

    ** :help

### Macro

Runs [cmd]*[n]

    [n][cmd]

Insert [text]*[n] at cursor

    [n]i[text]

Repeats previous command

    .

## Visual

Selects text

    [dir]l

Do stuff with selected text

    [cmd]