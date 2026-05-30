#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; "Screenshot_20230902-173452_A_B_C" --> "2023.09.02. (17h34)"

^j::
Send, {Home}
Send, {Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}{Delete}
Send, {Right}{Right}{Right}{Right}.{Right}{Right}.{Right}{Right}.{Delete}{Space}
;Send, ({Right}{Right}h{Right}{Right}) ; (hm)
Send, ({Right}{Right}h{Right}{Right}m{Right}{Right}) ; (hms)
Send, +{End}+{Left}+{Left}+{Left}+{Left}{Delete}
Send, {Tab}

Sleep, 50
return