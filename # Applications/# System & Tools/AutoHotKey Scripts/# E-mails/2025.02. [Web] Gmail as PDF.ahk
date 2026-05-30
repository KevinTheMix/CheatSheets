#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; Source https://www.autohotkey.com/docs/v1/lib/MouseClick.htm

; Script downloading Gmail emails as (printed) PDFs

^j::
Loop, 1 ; safety first
{
    ; Copy date
    MouseClick, left, A_ScreenWidth-285,280
    Send, {Esc}
    Sleep, 200
    Click, down
    MouseMove, A_ScreenWidth-185,280
    ;Send, {Shift Down}
    Click, up
    ;Send, {Shift Up}
    Sleep, 50
    Send, ^c
    Sleep, 500

    ; Fix copied date format ("ven. 23 févr. 2024 15:15" => "2010.09.19. (18m10)") (thx ChatGPT)
    original := Clipboard
    RegExMatch(original, "^[a-z]*\.?\s?(\d{1,2})\s([a-û]+)\.?\s(\d{4})\s(\d{1,2}):(\d{1,2})", m)
    if (!m) {
        MsgBox, 48, "Error", "Could not parse date/time from:`n" %original%
        Return
    }
    day      := m1
    monthText:= m2
    year     := m3
    hour     := m4
    minute   := m5
    months := { "janv":1, "févr":2, "mars":3,  "avr":4, "mai":5, "juin":6, "juil":7,  "août":8, "sept":9, "oct":10, "nov":11, "déc":12 }
    if (months.HasKey(monthText))
        monthNum := months[monthText]
    else {
        MsgBox, 48, "Error", "Unknown month name: " monthText
        Return
    }
    ; Builds a AHKDate instance.
    AHKDate := year . Format("{:02}", monthNum) . Format("{:02}", day) . Format("{:02}", hour) . Format("{:02}", minute) . "00"
    FormatTime, date, %AHKDate%, yyyy.MM.dd.
    FormatTime, hh, %AHKDate%, HH
    FormatTime, mm, %AHKDate%, mm
    result := date . " (" . hh . "m" . mm . ") "
    Clipboard := result

    ; E-mail options "…"
    MouseClick, left, A_ScreenWidth-40,300
    Sleep, 500

    ; Print (menu)
    MouseClick, left, A_ScreenWidth-260,415
    Sleep, 1000

    ; Print (print preview)
    Send, {Enter}
    Sleep, 1000

    ; Save (to PDF)
    Send, {Home}^v
    Send, {Enter}
    Sleep, 500

    ; Close preview tab
    Send, ^w
    Sleep, 500
}

Return
