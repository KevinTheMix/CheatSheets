#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; Source https://www.autohotkey.com/docs/v1/lib/MouseClick.htm

; Script scrapping tournament results from Pokerstars emails (in Hotmail)
; Copies all the relevant lines via shift-clicks,
; then alt-tab & pastes them in a text app (notepad, Excel),
; before going to the next email, automatically.
; Email format:

; PokerStars Tournoi #123456789, No Limit Hold'em
; Buy-in : $6.00/$0.60
; 6 joueurs
; Dotation totale : $36.00
; Tournoi commencé - 2008/11/30 - 03:49:34 (ET)

; Chère/Cher Anonymous,

; Vous avez fini le tournoi à la 2e place.
; La somme de $12.60 a été créditée sur votre compte Argent réel.

^j::
Loop, 50 ; (Tanouki) ; 3 (FR) ; 322 (EN)
{
    ; X offset is 315 for left & 315 for middle screen.

    ; Title
    MouseClick, left, 315,410
    Send, {Shift down}
    MouseClick, left, 315,430
    Send, {Shift up}^c
    AltTab()
    Send, ^v{Tab}
    Sleep, 500
    AltTab()

    ; Buy-in
    MouseClick, left, 315,430
    Send, {Shift down}
    MouseClick, left, 315,450
    Send, {Shift up}^c
    Sleep, 50
    AltTab()
    Send, ^v{Tab}
    Sleep, 500
    AltTab()

    ; # of players
    MouseClick, left, 315,450
    Send, {Shift down}
    MouseClick, left, 315,470
    Send, {Shift up}^c
    Sleep, 50
    AltTab()
    Send, ^v{Tab}
    Sleep, 500
    AltTab()

    ; Prize pool
    MouseClick, left, 315,470
    Send, {Shift down}
    MouseClick, left, 315,490
    Send, {Shift up}^c
    Sleep, 50
    AltTab()
    Send, ^v{Tab}
    Sleep, 500
    AltTab()

    ; Date
    MouseClick, left, 315,490
    Send, {Shift down}
    MouseClick, left, 315,510
    Send, {Shift up}^c
    Sleep, 50
    AltTab()
    Send, ^v{Tab}
    Sleep, 500
    AltTab()

    ; Position
    MouseClick, left, 315,570
    Send, {Shift down}
    MouseClick, left, 315,590
    Send, {Shift up}^c
    Sleep, 50
    AltTab()
    Send, ^v{Tab}
    Sleep, 500
    AltTab()

    ; $
    MouseClick, left, 315,590
    Send, {Shift down}
    MouseClick, left, 315,610
    Send, {Shift up}^c
    Sleep, 50
    AltTab()
    Send, ^v{Tab}{Enter}
    Sleep, 500
    AltTab()

    ; MouseClick, left, 1225,220    ; left screen.
    ; MouseClick, left, 900,225   ; KD middle screen.
    MouseClick, left, 530,275   ; Tanouki left screen.
    Sleep, 1000

}

return

; Source: https://stackoverflow.com/a/36008086
AltTab(){
    list := ""
    WinGet, id, list
    Loop, %id%
    {
        this_ID := id%A_Index%
        IfWinActive, ahk_id %this_ID%
            continue    
        WinGetTitle, title, ahk_id %this_ID%
        If (title = "")
            continue
        If (!IsWindow(WinExist("ahk_id" . this_ID))) 
            continue
        WinActivate, ahk_id %this_ID%
        WinWaitActive, ahk_id %this_ID%,,2 
            break
    }
}
IsWindow(hWnd){
    WinGet, dwStyle, Style, ahk_id %hWnd%
    if ((dwStyle&0x08000000) || !(dwStyle&0x50000000)) {
        return false
    }
    WinGet, dwExStyle, ExStyle, ahk_id %hWnd%
    if (dwExStyle & 0x00000080) {
        return false
    }
    WinGetClass, szClass, ahk_id %hWnd%
    if (szClass = "TApplication") {
        return false
    }
    return true
}