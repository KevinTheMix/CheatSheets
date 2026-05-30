#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; Source https://www.autohotkey.com/docs/AutoHotkey.htm

; "2019.07.08. RichText (Flutter Widget of the Week)" --> "2019.07.08. RichText"

^j::
Send, {Right}^+{Left}^+{Left}^+{Left}^+{Left}+{Left}{Delete}
Send, {Tab}
Sleep, 25
return