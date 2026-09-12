#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; 2026.08.22. Koko - Kontan.txt --> 2026.08.22. Kontan.txt
; Set number of words before '-' using a variable:
wordsBeforeDash := 1

^j::
Send, {Home}^{Right}
Loop, %wordsBeforeDash% {
    Send, ^+{Right}
}
Send, ^+{Right} ; Dash '-' itself
Send, {Delete}{Tab}

Sleep, 50
return