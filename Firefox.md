# Firefox

* Right-click > screenshot page
* Tools > Options > Privacy & Security > Logins & Passwords >
** "Use Master passwords" pour crypter passwords enregistrés par FF
** "Saved Logins" pour consulter et effacer les passwords enregistrés

## Configuration

* general.smoothScroll
* browser.ctrlTab.recentlyUsedOrder

## Extensions

### Q & A

* Is IIFE necessary for content scripts to work?
** No! It's just for context-scoping.
** But there's a "return" instruction that of course only works within a function!
* "click" event listener inner functions can't be put outside?
** Yes then can!
** Except those that use listener parameter 'e'!
* Can popup JS be logged since it's a special side popup, not a regular web page?
** Yes! But in the master Browser console (Ctrl+Shift+J)

## Chrome

* Simuler network speeds (e.g. slow 3g)
* Augury (debug Angular)