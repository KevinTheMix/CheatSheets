#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "Recording 190323-081719" --> "190323_081719"

^j::
Send, {Home}
Loop, 10
{
    Send, {Delete}
}
Send, 20
Send, {Right}{Right}{Right}{Right}{Right}{Right}{Delete}_
Send, {Tab}
Sleep, 50
return