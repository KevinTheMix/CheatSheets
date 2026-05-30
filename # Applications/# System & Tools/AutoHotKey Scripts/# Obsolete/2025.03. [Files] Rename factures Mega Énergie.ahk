#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "2023.06.15. (2023.07 à 2023.09) ABC (471,98€).pdf" --> "2023.06.15. [2023.07-2023.09] ABC (471,98€).pdf"

^j::
Send, {Home}
Send, ^{Right}
Send, {Delete}[
Send, ^{Right}
Send, {Backspace}{Delete}{Delete}-
Send, ^{Right}
Send, {Left}{Backspace}]
Send, {Tab}

Sleep, 50
return