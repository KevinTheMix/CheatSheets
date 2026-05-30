#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; Source https://www.autohotkey.com/docs/v1/lib/MouseClick.htm

; Script downloading Gmail emails as (printed) PDFs
; "Save to PDF" is better than "Microsoft Print to PDF" (which displays non-clickable links and is blurrier)

;Line Text: Clipboard
;Error: Built-in variables must not be declared.
;The script was not reloaded; the old version will remain in effect.

; Safer send mode for UI-driven apps
SendMode, Event
SetKeyDelay, 30, 30

^j::
Critical
; Prevent auto-repeat if you keep the key held
KeyWait, j

Loop, 1 ; safety first
    PrintMailToPDF()
return

PrintMailToPDF() {
    Send, {Home}
    Sleep, 500

    ; Title
    MouseClick, left, 310, 230
    Send, +{End}
    title := SanitizeFileName(CopySelectedText(1.5))
    if (!title)
        title := "Unknown"

    ; Author
    MouseClick, left, 310, 300
    Send, +{End}
    author := FormatAuthor(CopySelectedText(1.5))
    if (!author)
        author := "Unknown"

    ; Date
    Send, {F12}
    Sleep, 900
    MouseClick, left, 20, 640 ; Inspector arrow
    Sleep, 1000
    MouseClick, left, A_ScreenWidth-50, 320 ; Click on date area
    Sleep, 1600
    MouseClick, left, 810, 840  ; Double-click on date to select it
    MouseClick, left
    Sleep, 200
    datePrefix := FormatDatePrefix(CopySelectedText(1.5))
    if (!datePrefix)
        datePrefix := "NoDate"

    ; Build final text and set clipboard
    Clipboard := datePrefix " " author " - " title
    Send, {F12}
    Sleep, 1000
    MouseClick, left, 600, 300
    Send, ^p
    Sleep, 200
    Send, ^p
    Sleep, 500
    Send, {Enter}
    Sleep, 1500
    Send, ^v
    Sleep, 200
    Send, {Enter}
    Sleep, 200
    Send, {Enter}

    ; Optional: confirm
    ; ToolTip % Clipboard, 10, 10
    ; SetTimer, RemoveTip, -1000
}

CopySelectedText(timeout:=1.5) {
    Clipboard := ""              ; clear so ClipWait sees a change
    Send, ^c
    ClipWait, %timeout%
    if (ErrorLevel) {
        ; retry once
        Send, ^c
        ClipWait, %timeout%
        if (ErrorLevel)
            return ""            ; give caller a blank on failure
    }
    return Clipboard
}

SanitizeFileName(str) {
    ; Replace specific characters first
    ;StringReplace, str, str, :, `,, All ; comma must be escaped as `,
    StringReplace, str, str, :, `;, All ; semi-colon must be escaped as `;
    StringReplace, str, str, ?, ¿, All

    ; Replace other illegal characters with underscore
    illegalChars := "<>|*\/"""
    Loop, Parse, illegalChars
    {
        StringReplace, str, str, %A_LoopField%, _, All
    }
      ; Trim trailing dots/spaces (invalid at end of Windows filenames)
    StringRight, last, str, 1
    while (last = "." || last = " ")
    {
        StringTrimRight, str, str, 1
        StringRight, last, str, 1
    }
    return str
}

FormatAuthor(hotmailAuthor) {
    ; Find position of <
    posStart := InStr(hotmailAuthor, "<")
    ; Find position of >
    posEnd := InStr(hotmailAuthor, ">")

    if (posStart && posEnd && posEnd > posStart) {
        name := Trim(SubStr(hotmailAuthor, 1, posStart - 1))
        email := SubStr(hotmailAuthor, posStart + 1, posEnd - posStart - 1)
        return name " (" email ")"
    } else {
        ; return unchanged if format is unexpected
        return hotmailAuthor
    }
}

FormatDatePrefix(hotmailDate) {
    StringSplit, parts, hotmailDate, %A_Space%
    StringSplit, d, parts2, /
    StringSplit, t, parts3, :
    return d3 "." d2 "." d1 ". (" t1 "h" t2 ")"
}
