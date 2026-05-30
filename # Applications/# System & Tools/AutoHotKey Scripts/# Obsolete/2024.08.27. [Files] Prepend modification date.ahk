#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Source https://www.autohotkey.com/docs/AutoHotkey.htm
; {Right}
; {Left}
; {Tab}

; Prepends "yyyy.mm.dd." to current file name

^j::
file = % Explorer_GetSelection()
;MsgBox %file%

; FileGetTime: https://www.autohotkey.com/docs/v1/lib/FileGetTime.htm
FileGetTime, time , %file%, M
;MsgBox %time%

; Date formats: https://www.autohotkey.com/docs/v1/lib/FileSetTime.htm#YYYYMMDD
FormatTime, modified , %time%, yyyy.MM.dd.
;MsgBox %modified%

Send, {Home}%modified% {Tab}
Sleep, 50
return


^h::
file = % Explorer_GetSelection()
;MsgBox %file%

; FileGetTime: https://www.autohotkey.com/docs/v1/lib/FileGetTime.htm
FileGetTime, modification_time , %file%, M   ; M for Modification time
;MsgBox %modification_time%

; Date formats: https://www.autohotkey.com/docs/v1/lib/FormatTime.htm
FormatTime, modified , %modification_time%, yyyy.MM.dd. (HH'h'mm)
;MsgBox %modified%

Send, {Home}%modified% {Tab}
Sleep, 50
return


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
