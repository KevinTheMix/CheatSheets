#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm

; "Document (2019.12)" --> "2019.12. Document"

ScrollLock::
Send, {Left}{Delete}^+{Left}
Sleep, 50
Send, +{Right}^x{BackSpace}{BackSpace}
Send, {Home}^v. {Tab}
return