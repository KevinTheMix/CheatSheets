#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "2023.05.03 - Abcde" --> "2023.05.03. Abcde"

^j::
Send, {Home}
Send, ^{Right}{Backspace}{Delete}.{Tab}
Sleep, 50
return