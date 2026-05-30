#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "2003-08-31-14-05-33" --> "2003.08.31. (14h05m33)"

NumPad1::
Send {Home}
Loop, 11
{
    Send, {Right}
}
Send 0
Sleep 25
return

NumPad2::
Send {Home}
Loop, 14
{
    Send, {Right}
}
Send 0
Sleep 25
return

NumPad3::
Send {Home}
Loop, 17
{
    Send, {Right}
}
Send 0
Sleep 25
return

;ScrollLock::
;Loop, 13
;{
;    Send, {Home}{Right}{Right}{Right}{Right}{Delete}.
;    Send, {Right}{Right}{Delete}.
;    Send, {Right}{Right}{Delete}.
;    Send, {Space}(
;    Send, {Right}{Right}{Delete}h
;    Send, {Right}{Right}{Delete}m
;    Send, {Right}{Right})
;    Send, {Tab}
;    Sleep, 25
;}
;return