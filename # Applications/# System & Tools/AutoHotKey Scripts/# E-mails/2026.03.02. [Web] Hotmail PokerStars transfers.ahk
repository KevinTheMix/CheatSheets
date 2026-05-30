#Include AltTab & AltTabMenu.ahk

; Place on left-half side of the screen (so A_ScreenWidth works)
; Open the console so it's already loaded (speeds up Ctrl+Shift+K)

; Press Ctrl+Shift+D to extract the email date
^+d::
;WinActivate, ahk_exe firefox.exe
;Sleep 200

js =
(
(async () => {
  const el = document.querySelector('[data-testid="SentReceivedSavedTime"]');
  if (!el) return;

  let txt = el.textContent.trim();

  // Remove weekday prefix
  txt = txt.replace(/^[^ ]+\s/, '');

  await navigator.clipboard.writeText(txt);
})();
)

Loop, 1	; safety first
{
    Clipboard := js
    Sleep 100

    ; Open console
    Send ^+k
    Sleep 100

    ; Date
    Send ^v
    Sleep 100
    Send {Enter} ; this executes the JS & copies result trimmed date to clipboard
    Sleep 100
    ; MsgBox Date copied to clipboard.
    AltTab()
    Sleep 150
    Send ^+v
    Sleep 50
    Send {Tab}
    Send, In
    ;Send, Out
    Sleep 50
    Send {Tab}
    Sleep 50
    AltTab()
    Sleep 150

    ; From
    Click, 680, 410, 2 ; In
    ;Click, 610, 430, 2 ; Out (one additional blank line somehow)
    Sleep 50
    Send ^c
    Sleep 50
    AltTab()
    Sleep 150
    Send ^+v
    Sleep 100
    Send {Tab}
    Sleep 100
    AltTab()
    Sleep 150

    ; To
    Click, 320, 370, 2
    Sleep 50
    Send ^c
    Sleep 50
    AltTab()
    Sleep 150
    Send ^+v
    Sleep 100
    Send {Tab}
    Sleep 100
    AltTab()
    Sleep 150

    ; Amount
    Click, 420, 410, 2 ; In
    ;Click, 420, 430, 2
    Send, ^+{Right}+{Left}
    Sleep 50
    Send ^c
    Sleep 50
    ;StringReplace, A_Clipboard, A_Clipboard, ".", "," ; AHK v1
    A_Clipboard := StrReplace(A_Clipboard, ".", ",") ; AHK v2
    Sleep 50
    AltTab()
    Sleep 150
    Send ^+v
    Sleep 100
    Send {Enter}
    Sleep 100
    AltTab()
    Sleep 150

    ;MouseMove, A_ScreenWidth-1020, 240
    MouseClick, left, A_ScreenWidth-1020, 240
    Sleep 300
}
return
