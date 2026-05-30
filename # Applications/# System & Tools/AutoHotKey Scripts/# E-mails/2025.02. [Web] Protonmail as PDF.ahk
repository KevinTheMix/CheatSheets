#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; Source https://www.autohotkey.com/docs/v1/lib/MouseClick.htm

; Script downloading Protonmail emails as (printed) PDFs
; First deactivate "Block email tracking" in "Email privacy" settings (to get rid of inconsistent banner) - and re-activate it afterwards.
; Place all relevant e-mails in a dedicated folder (to avoid search terms appearing highlighted on output PDF).
; Print one e-mail manually to select print Options > with or without background as needed.
; Place browser on half-screen of wide (Aopen) monitor.
; Sometimes hitting 't' (delete key) exits current mail, sometimes it does not.
; Hitting 'Ctrl + p' (print) gives a slightly different output, with a third blank page, which is less ideal than the hardcoded clicks version below.

^j::
Loop, 1 ; safety first
{
    Send, {Home}
    Sleep, 500

    ; E-mail options "…"
    MouseClick, left, 500,370  ; With "mailing list" banner
    ;MouseClick, left, 500,330   ; Without "mailing list" banner
    Sleep, 500

    ; Print (menu)
    MouseClick, left, 500,680  ; With "mailing list" banner
    ;MouseClick, left, 500,640   ; Without "mailing list" banner
    Sleep, 500

    ; Print (print preview)
    MouseClick, left, 840,930
    Sleep, 500 (Aopen)

    ; Save (to PDF)
    Send, {Enter}
    Sleep, 750

    ; Save (Windows Prompt)

    Send, {Enter}
    Sleep, 2500

    ; Escape (print preview)
    Send, {Escape}
    Sleep, 500

    ; Delete
    MouseClick, left, 550,370
    Send, t
    Sleep, 1000

    ; Next mail
    MouseClick, left, 550,370
    ;Send, k
    Sleep, 500
}

return
