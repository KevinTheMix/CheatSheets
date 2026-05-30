#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; Source https://www.autohotkey.com/docs/AutoHotkey.htm

; Prepends "yyyy.mm.dd." to current file name

; FileGetTime: https://www.autohotkey.com/docs/v1/lib/FileGetTime.htm
; FormatTime: https://www.autohotkey.com/docs/v1/lib/FormatTime.htm
; Date formats: https://www.autohotkey.com/docs/v1/lib/FileSetTime.htm#YYYYMMDD

; Using Scroll Lock comme raccourci (cfr https://superuser.com/a/1378390)
SetScrollLockState, AlwaysOff
ScrollLock::
Loop, 1	; safety first
{
   file = % Explorer_GetSelection()
   FileGetTime, time , %file%, M
   ;FormatTime, modified , %time%, yyyy.MM.dd ; no trailing dot	
   ;FormatTime, modified , %time%, yyyy.MM.dd.
   FormatTime, modified , %time%, yyyy.MM.dd. (HH'h'mm'm'ss)
   ;MsgBox %modified%

   ;Send, {Home}%modified% {Tab}
   Send, {Delete}{Home}%modified%{Tab}   ; Also deletes current file name
   ;Send, {Home}^+{Right}%modified% {Tab}  ; Also replaces current timestamp
   Sleep, 200
}
return

^j::
file = % Explorer_GetSelection()
FileGetTime, modification_time , %file%, M
;FormatTime, modified , %modification_time%, yyyy.MM.dd. (HH'h'mm')
FormatTime, modified , %modification_time%, yyyy.MM.dd. (HH'h'mm'm'ss)
;MsgBox %modified%
Send, {Home}%modified% {Tab}
Sleep, 50
return

^h::
file := % Explorer_GetSelection()
dateTaken := GetExifDateTaken(file)
if (!dateTaken) {
    FileGetTime, modification_time, %file%, M
    dateTaken := modification_time ; already in YYYYMMDDHH24MISS
} else {
    dateTaken := RegExReplace(dateTaken, "[: ]", "")  ; Convert "YYYY:MM:DD HH:MM:SS" -> "YYYYMMDDHHMMSS" for FormatTime
}
;FormatTime, outText, %dateTaken%, yyyy.MM.dd. (HH'h'mm'm'ss)
FormatTime, outText, %dateTaken%, yyyy.MM.dd. (HH'h'mm)
;MsgBox %outText%
Send, {Home}%outText% {Tab}
Sleep, 50
return

; --- FUNCTIONS ---

; Get path of selected file/folder or of current folder
; https://www.autohotkey.com/boards/viewtopic.php?t=60403
Explorer_GetSelection() {
   WinGetClass, winClass, % "ahk_id" . hWnd := WinExist("A")
   if !(winClass ~= "^(Progman|WorkerW|(Cabinet|Explore)WClass)$")
      Return
   
   shellWindows := ComObjCreate("Shell.Application").Windows
   if (winClass ~= "Progman|WorkerW")  ; IShellWindows::Item:    https://goo.gl/ihW9Gm
                                       ; IShellFolderViewDual:   https://goo.gl/gnntq3
      shellFolderView := shellWindows.Item( ComObject(VT_UI4 := 0x13, SWC_DESKTOP := 0x8) ).Document
   else {
      for window in shellWindows       ; ShellFolderView object: https://tinyurl.com/yh92uvpa
         if (hWnd = window.HWND) && (shellFolderView := window.Document)
            break
   }
   for item in shellFolderView.SelectedItems
      result .= (result = "" ? "" : "`n") . item.Path
   ;~ if !result
      ;~ result := shellFolderView.Folder.Self.Path
   Return result
}

; ChatGPT
GetExifDateTaken(path) {
    ; Returns "" if not available.
    try {
        img := ComObjCreate("WIA.ImageFile")
        img.LoadFile(path)
        for p in img.Properties
        {
            ; 36867 = DateTimeOriginal (EXIF "Date Taken")
            if (p.PropertyID = 36867) {
                val := p.Value  ; usually "YYYY:MM:DD HH:MM:SS"
                ; Basic sanity check: must look like a datetime
                if RegExMatch(val, "^\d{4}:\d{2}:\d{2} \d{2}:\d{2}(:\d{2})?$")
                {
                    ; If seconds are missing, append ":00" to keep 14 digits after stripping
                    if !InStr(val, ":", false, 12)  ; crude check for seconds part
                        val .= ":00"
                    return val
                }
            }
        }
    } catch e {
        ; Non-image file or WIA couldn’t read it.
    }
    return ""
}
