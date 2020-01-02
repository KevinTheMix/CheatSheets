# Visual Studio Code

A good text editor.

## Commands

* Move opened file view = Drag & Drop
* Autosave = `File > Auto Save`
* Open folder in terminal = `Right-click folder > Open in Terminal`
* Toggle side-bar = `Ctrl + B`
* Multi-line
  * Select All Occurrences of Find Match = `Select some text > Ctrl + Shift + L`
  * Add Selection To Next Find Match = `Select some text > Ctrl + D (x n)`
* Opens the Console = `Ctrl + J` or `Ctrl + ù`
* Clones selected tab = `Ctrl + µ`
* Zen Mode = `Ctrl + K, Z`
* Select Theme = `Ctrl + K, Ctrl + T`
* Selected nested = `Alt + Shift + Left/Right`
* Duplicates line = `Alt + Shift + Up/Down`
* Command = `Ctrl + Shift + P` or `F1`
  * `create new term`
  * `Format Document`
* Tidy = `Alt + Shift + F`
* Tasklist = `Ctrl + Shift + T`
* Preview Markdown = `Ctrl + Shift + V`
* Preview Markdown Side-by-side = `Ctrl+K, V`

See <https://code.visualstudio.com/docs/getstarted/keybindings>

## Settings

* Definition (see <https://developer.hyvor.com/vscode-editing-settings-json>)
  * User (Global)
    * %APPDATA%\Code\User\settings.json
  * Workspace
  * Folder
* [Tabs vs Spaces](https://stackoverflow.com/a/29972553)
* [Setting by Filetype](https://code.visualstudio.com/docs/getstarted/settings#_language-specific-editor-settings)

`"[plaintext]": { "editor.insertSpaces": false }`   # Note that .txt files are referenced as "plaintext" filetype.

## Extensions

* [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
* [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur)
* [Vue VSCode Snippets](https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets)
  * `vdata` = Vue data snippet
  * `vmethod` = Vue methods snippet
