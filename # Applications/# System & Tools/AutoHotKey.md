# AutoHotKey

Windows inputs (keyboard & mouse) macros/scripting.

## Quick Tips

* [aText](https://trankynam.com/atext) = another simpler keyword substitution tool
* [UIA-v2](https://github.com/Descolada/UIA-v2) = UIAutomation library for AHK v2 (based on thqby's UIA library) for complex windows & browsers (via UIA_Browser.ahk) automation schemes

## API

* Include another file inline `#Include file.ahk`
* Key selector = `ScrollLock::` (no curly braces) or `^j::`
* Commands (`,` is optional but recommended for clarity)
  * `Click, (x, y)(, n)` = click n times (one by default) at x/y coordinates (current position by default)
  * `FileGetTime, time , %file%, M`
  * `FormatTime, modified , %time%, yyyy.MM.dd. (HH'h'mm'm'ss)`
  * `Loop, 1 { … } ; safety first`
  * `MouseMove, x, y`
  * `MouseClick, left|right, x, y` = single left/right click
  * `MsgBox, text`
  * `Send, text`
  * `Sleep, milliseconds`
  * `StringReplace, str, str, ?, ¿, All` (v1)
  * `StrReplace(text, "old", "new", , occurrences)`
* Modifiers = apply to the following key/input
  * `!` = Alt
  * `^` = Ctrl
  * `+` = Shift
  * `#` = Windows
  * `^+` = Ctrl + Shift
* Special characters
  * `{#}`
  * `{Left}`/`{Right}`/`{Up}`/`{Down}`
  * `{BackSpace}`
  * `{Delete}`
  * `{ScrollLock}`
  * `{Space}`
  * `{Tab}`
* Special Variables
  * `A_Clipboard` = client of the clipboard (can be set via `:=`)
  * `A_ScreenWidth`
