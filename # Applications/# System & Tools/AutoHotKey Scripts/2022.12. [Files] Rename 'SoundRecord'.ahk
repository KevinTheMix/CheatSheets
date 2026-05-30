#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "SoundRecord-2021-07-13-14-29-52" --> "20210713_142952"

^j::
Send, {Home}
Loop, 12
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