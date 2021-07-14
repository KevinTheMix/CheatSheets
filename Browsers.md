# Browsers

## Firefox

* Right-click > screenshot page
* Tools > Options > Privacy & Security > Logins & Passwords >
  * "Use Master passwords" pour crypter passwords enregistrés par FF
  * "Saved Logins" pour consulter et effacer les passwords enregistrés
* `Alt + Left` = `Backspace` (_note: this must be manually re-enabled after it was changed in Firefox 86 to prevent loss of input data_) = Go backward
* `Alt + Right` = `Shift + Backspace` = Go forward
* `F6` = `Alt + D` = `Ctrl + L` = Go to address bar
* `F7` = Toggle Caret Browsing (displays text cursor that is usually hidden)

### Configuration

* general.smoothScroll
* browser.ctrlTab.recentlyUsedOrder

### Extensions

* Is IIFE necessary for content scripts to work?
  * No! It's just for context-scoping.
  * But there's a "return" instruction that of course only works within a function!
* "click" event listener inner functions can't be put outside?
  * Yes then can!
  * Except those that use listener parameter 'e'!
* Can popup JS be logged since it's a special side popup, not a regular web page?
  * Yes! But in the master Browser console (Ctrl+Shift+J)

## Chrome

* Simuler network speeds (e.g. slow 3g)
* Augury (debug Angular)

## Edge (Chromium)

* Error _Correlation failed_ = edge://flags/ > Cookies without SameSite must be secure > Disabled
