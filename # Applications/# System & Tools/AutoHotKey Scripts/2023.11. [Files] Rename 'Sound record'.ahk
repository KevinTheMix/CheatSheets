#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "Sound record (2023-11-06-19-29-45)" --> "2023.11.06. (14h29m52)"

^j::
Send, {Home}
Loop, 14
{
    Send, {Delete}
}
Send, {Right}{Right}{Right}{Right}{Delete}.
Send, {Right}{Right}{Delete}.
Send, {Right}{Right}{Delete}.{Space}(
Send, {Right}{Right}{Delete}h
Send, {Right}{Right}{Delete}m
Send, {Tab}
Sleep, 50
return