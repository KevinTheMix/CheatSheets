#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm

; "BE12345678912345_20220713_00021" --> "2022.07.13. #21"

^j::
Send, {Right}{Left}{Left}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{Space}{#}{Left}{Left}
Send, .{Left}{Left}{Left}
Send, .{Left}{Left}{Left}
Send, .{Left}{Left}{Left}{Left}{Left}+{Home}{Delete}{Tab}
return