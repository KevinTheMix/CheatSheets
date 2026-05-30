#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "Enregistrement audio 2019-09-07 09-56-03" --> "20190907_095603"

^j::
Send, {Home}
Loop, 21
{
    Send, {Delete}
}
Send, {Right}{Right}{Right}{Right}{Delete}
Send, {Right}{Right}{Delete}
Send, {Right}{Right}{Delete}_
Send, {Right}{Right}{Delete}
Send, {Right}{Right}{Delete}
Send, {Tab}
Sleep, 50
return