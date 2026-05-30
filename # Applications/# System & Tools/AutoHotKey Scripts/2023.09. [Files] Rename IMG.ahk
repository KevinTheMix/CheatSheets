#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "20220717_112200. Anonymous Call" --> "2022.07.17. (11h22) Anonymous Call"
; "IMG_20220717_112200" --> "2022.07.17. (11h22)"

^j::
Send, {Home}{Delete}{Delete}{Delete}{Delete}
Send, {Right}{Right}{Right}{Right}.{Right}{Right}.{Right}{Right}.{Delete}{Space}
Send, ({Right}{Right}h{Right}{Right}){Delete}{Delete}
Send, {Tab}
Sleep, 50
return