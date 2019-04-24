# Vim

<http://www.openvim.com/>

## Modes

    i   # Switch to Insert
    Esc # Switch to Normal
    v   # Switch to Visual

## Insert

Type text.

## Normal

Navigate & Manipulate Text

    h j k l     # Left/Down/Up/Right
    b e         # Beginning/End
    w           # Next word
    f[c]        # Find character [c]
    0           # Beginning of line
    $           # End of line
    \#          # Previous occurence of the word at cursor
    *           # Next occurence of the word at cursor
    gg          # Beginning of file
    G           # End of file
    [n]G        # Go to line [n]
    /[text]Enter    # Search
    N           # Previous search
    n           # Next search
    O           # Insert line before (switches to Insert mode)
    o           # Insert line after (switches to Insert mode)
    x           # Deletes character before cursor (à la backspace/delete)
    X           # Deletes character after cursor (à la backspace/delete)
    r[c]        # Replaces character at cursor with [c]
    d[dir] p    # Cut/paste in direction [dir]
    D[dir] p    # Cut/paste until end of line
    :w          # Save
    :q          # Quit
    :q!         # Quit without saving
    ** :help    # Help

### Macro

    [n][cmd]    # Runs [cmd]*[n]
    [n]i[text]  # Insert [text]*[n] at cursor
    .           # Repeats previous command

## Visual

    [dir]l  # Selects text
    [cmd]   # Do stuff with selected text