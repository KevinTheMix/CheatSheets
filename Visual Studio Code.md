# Visual Studio Code

A good text editor.

## Tips

* Each Breadcrumbs fragment is fully browsable, seamlessly between file system hierarchy & document (Markdown, Json, etc.) section
* Code comparison updates in real-time
* New files must first be saved for certain shortcuts to become available based on their extension (e.g. Markdown tidying)

## Environment

### Settings

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

### Menus & Mouse

* _File > Auto Save_ = Autosave
* _Right-click folder > Open in Terminal_ = Open folder in terminal
* _Drag & Drop Tab_ = Move opened file view

### Keyboards

* `Alt + {n}` = Go to Tab {n}
* `Alt + Shift + F` = Format/Tidy (e.g. HTML)
* `Alt + Shift + Left/Right` = Shrink/Expand selection
* `Alt + Shift + Up/Down` = Duplicates line
* Multi-line
  * Select some text > `Ctrl + Shift + L` = Select All Occurrences of Find Match
  * Select some text > `Ctrl + D (x n)` = Add Selection To Next Find Match
* `Ctrl + B` = Toggle side-bar
* `Ctrl + ù` or `Ctrl + J` = Toggle Terminal
* `Ctrl + µ` = Clones selected tab or Split Terminal
* `Ctrl + K, V` = Preview Markdown Side-by-side
* `Ctrl + K, Z` = Zen Mode
* `Ctrl + K, Ctrl + T` = Select Theme
* `Ctrl + Shift + F` = Search
* `Ctrl + Shift + T` = Tasklist
* `Ctrl + Shift + V` = Preview Markdown
* `Ctrl + Shift + ù` = New Terminal
* `Ctrl + Shift + P` or `F1` or _View > Command Palette_ = Command Palette
  * `create new term`
  * `Format Document`
  * `View: Toggle Minimap`
* `View > Show Minimap` or _Command Palette_ > `View: Toggle Minimap` = Toggle Minimap
* `View > Toggle Word Wrap` or `Alt + Z` = Toggle Word Wrap
* `Ctrl + L` = Select current paragraph & move next

## Snippets

* In a HTML file
  * `!` = scaffold a basic HTML page
  * `scr` = script element

## Extensions

* carbon-now-sh = copies code snippets for public/sharing
* Prettify JSON (F1 > Prettify)
* [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
* Flutter (also installs Dart extension)
* Vue & JS
  * TSLint
  * TSLint Vue
  * [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur) = Vue tooling for VS Code
  * [Vue VSCode Snippets](https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets)
    * `vdata` = Vue data snippet
    * `vmethod` = Vue methods snippet
* Themes
  * [Winter is Coming](https://github.com/johnpapa/vscode-winteriscoming)
  * Material Icon Theme = file icons
