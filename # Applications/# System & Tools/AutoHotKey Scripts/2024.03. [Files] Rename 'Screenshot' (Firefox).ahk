#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "Screenshot 2023-03-29 at 11-21-23 ChatGPT.png" --> "2023.03.29. (11h21) ChatGPT.png"
; "2023.03.29. (11-21-23 ChatGPT.png" --> "2023.03.29. (11h21) ChatGPT.png"

^j::
Send, {Home}
Send, {Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}
Send, {Right}{Right}{Right}{Right}{Delete}.{Right}{Right}{Delete}.{Right}{Right}.
Send, {Delete}{Delete}{Delete}{Right}({Right}{Right}{Delete}h{Right}{Right}){Delete}{Delete}{Delete}
Send, {Tab}

Sleep, 50
return