# Visual Studio Code

A good text editor.

## Settings

* [Scopes](https://developer.hyvor.com/vscode-editing-settings-json)
  * By user (Global)
    * %APPDATA%\Code\User\settings.json
  * By workspace
  * By folder
* [Setting by Filetype](https://code.visualstudio.com/docs/getstarted/settings#_language-specific-editor-settings)
* [Tabs vs Spaces](https://stackoverflow.com/a/29972553)

`"[plaintext]": { "editor.insertSpaces": false }`   # Note that .txt files are referenced as "plaintext" filetype.

## Commands

See <https://code.visualstudio.com/docs/getstarted/keybindings>

### Menu

* Autosave = `File > Auto Save`
* Open folder in terminal = `Right-click folder > Open in Terminal`

### Mouse

* Move opened file view = `Drag & Drop Tab`

### Keyboards

* Go to Tab {n} = `Alt + {n}`
* Seach = `Ctrl + Shift + F`
* Toggle side-bar = `Ctrl + B`
* Multi-line
  * Select All Occurrences of Find Match = `Select some text > Ctrl + Shift + L`
  * Add Selection To Next Find Match = `Select some text > Ctrl + D (x n)`
* New Terminal = `Ctrl + Shift + ù`
* Toggle Terminal = `Ctrl + ù` or `Ctrl + J`
* Clones selected tab or Split Terminal = `Ctrl + µ`
* Zen Mode = `Ctrl + K, Z`
* Select Theme = `Ctrl + K, Ctrl + T`
* Selected nested = `Alt + Shift + Left/Right`
* Duplicates line = `Alt + Shift + Up/Down`
* Command Palette = `Ctrl + Shift + P` or `F1` or `View > Command Palette`
  * `create new term`
  * `Format Document`
  * `View: Toggle Minimap`
* Format/Tidy = `Alt + Shift + F`
* Tasklist = `Ctrl + Shift + T`
* Preview Markdown = `Ctrl + Shift + V`
* Preview Markdown Side-by-side = `Ctrl+K, V`
* Toggle Minimap = `View > Show Minimap` or Command Palette `View: Toggle Minimap`
* Toggle Word Wrap = `View > Toggle Word Wrap` or `Alt + Z`

## Extensions

* [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
* [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur)
* [Vue VSCode Snippets](https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets)
  * `vdata` = Vue data snippet
  * `vmethod` = Vue methods snippet
