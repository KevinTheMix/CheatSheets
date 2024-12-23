# Visual Studio Code

## Quick Tips

* Code comparison updates in real-time
* Breadcrumb path fragments are browsable seamlessly between containing file system & document inner sections
* [Fireship: 25 VS Code Productivity Tips](https://www.youtube.com/watch?v=ifTF3ags0XI)
* [Visual Studio Code (online)](https://vscode.dev)

## Glossary

* **Emmet** (formerly **Zen Coding**) = (built-in) advanced snippet generator for HTML, CSS, etc (cycle-browse through markup elements)

### Settings

* [Scopes](https://developer.hyvor.com/vscode-editing-settings-json)
  * By user (Global)
    * %APPDATA%\Code\User\settings.json
  * By workspace
  * By folder
* [Setting by Filetype](https://code.visualstudio.com/docs/getstarted/settings#_language-specific-editor-settings)
* [Tabs vs Spaces](https://stackoverflow.com/a/29972553)
  * `"[plaintext]": { "editor.insertSpaces": false }`   # Note that .txt files are referenced as "plaintext" filetype.
* [Editor sticky scroll](https://code.visualstudio.com/updates/v1_70#_editor-sticky-scroll)
* [Set lower/uppercase keyboard shortcut](https://stackoverflow.com/a/41688564/3559724)
  * File-> Preferences -> _Keyboard Shortcuts_ (or `Ctrl + K, Ctrl + S`)
  * _Transform to Uppercase/Lowercase_

## Commands

See <https://code.visualstudio.com/docs/getstarted/keybindings>

### Menus & Mouse

* _File > Auto Save_ = Autosave
* _Right-click folder > Open in Terminal_ = Open folder in terminal
* _Drag & Drop Tab_ = Move opened file view
* `Drag & Drop middle button` = multi-line text block selection

### [Keyboards shortcuts](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)

* `Alt + {n}` = go to Tab {n}
* `Alt + Left/Right` = go back/forward
* `Alt + Click` or `Alt + Double-Click` or `Alt + Drag` = add cursors at clicked/selected locations
* `Alt + Shift + F` = Format/tidy (e.g. HTML)
* `Alt + Shift + Left/Right` = shrink/expand selection
* `Alt + Shift + Up/Down` = copy line up/down
* `Alt + Mouse scroll` = scroll faster
* `Ctrl + :` (aka `Ctrl + /`) = toggle comments
* `Ctrl + ,` = Settings (also via gear icon at the bottom-left or via _File > Preferences > Settings_)
* `Ctrl + ù` = toggle Terminal
* `Ctrl + µ` = duplicate tab
* `Ctrl + B` = toggle side-bar
* `Ctrl + D`\* = select word at current cursor position (\* then add next matching selection to multi-selection)
* `Ctrl + J` = toggle Panel area (Terminal & co)
* `Ctrl + K, Ctrl + O` = open Folder
* `Ctrl + K, Ctrl + R` = open URL to Keyboard Shortcuts PDF
* `Ctrl + K, Ctrl + S` = keyboard shortcuts
* `Ctrl + K, Ctrl + T` = select Theme
* `Ctrl + K, R` = reveal in File Explorer
* `Ctrl + K, V` = preview Markdown Side-by-side
* `Ctrl + K, Z` = zen Mode
* `Ctrl + L` = select current paragraph & move next
* `Ctrl + M` = Toggle _Tab Moves Focus_
* `Ctrl + P` = search (opened) files by name (`:` line number, `@` symbol ie header)
  * Type `:` to go to line
  * Type `>` to access Command Palette from here
  * Type `#` to search global symbols
  * Type `@` to search local blocks
* `Ctrl + R` = open Recent
* `Ctrl + T` = search global symbols (eg classes, properties, methods), works with camelCase initials search
* `Ctrl + Shift + .` = local blocks
* `Ctrl + Shift + Enter` = Insert line above
* `Ctrl + Shift + F` = Search
* `Ctrl + Shift + L` = multi-select all identical selections
* `Ctrl + Shift + T` = Tasklist
* `Ctrl + Shift + V` = Preview Markdown
* `Ctrl + Shift + ù` = New Terminal
* `Ctrl + Shift + P` or `F1` or _View > Command Palette_ = Command Palette
  * `create new term`
  * `Format Document`
  * `View: Toggle Minimap`
* `Ctrl + Shift + Space` = preview method full definition
* `Ctrl + Space` = auto-complete suggestions
* `View > Show Minimap` or _Command Palette_ > `View: Toggle Minimap` = Toggle Minimap
* `View > Toggle Word Wrap` or `Alt + Z` = Toggle Word Wrap

#### Terminal

* `Ctrl + Left/Right` = works!

## Snippets

* In a HTML file
  * `!` = scaffold a basic HTML page
  * `scr` = script element
* `camelCase initials + Tab` => intellisense fills the rest ( both for class type names & instance naming)

## Extensions

* **Add jsdoc comments**
* **Auto Rename Tag**
* **Awesome Flutter Snippets**
* **Better Comments** = colorize comments (eg `!` is red, `TODO` is orange, `// //` is greyed out)
* **carbon-now-sh** = copies code snippets for public/sharing
* **Dart** (installed with Flutter)
* **Dev Containers** = open a folder inside a Docker container
* **Flutter**
* **GitLens — Git supercharged** = improve VS Code git functionalities
* [markdownlint](https://github.com/DavidAnson/vscode-markdownlint#configure)
  * `Ctrl + ,` > _markdownlint config_ > `"markdownlint.config": { "no-duplicate-heading":false }` (note that `markdownlint.ignore` section is for (wildcard) ignoring files instead)
* **Material Icon Theme** = file icons
* **PowerShell**
* **Prettify JSON** (F1 > Prettify)
* **Quokka** = JavaScript and TypeScript playground in your editor
* **Remote Repositories** = contribute to Github repositories from within VS Code without typing git commands
* **Remote - SSH** = open any folder on a remote machine via SSH
* **Paste JSON as Code** = generate models based on JSON for a series of languages
* [Winter is Coming](https://github.com/johnpapa/vscode-winteriscoming) = theme
* Vue & JS
  * **TSLint**
  * **TSLint Vue**
  * [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur) = Vue tooling for VS Code
  * [Vue VSCode Snippets](https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets)
    * `vdata` = Vue data snippet
    * `vmethod` = Vue methods snippet
* [Webview API](https://code.visualstudio.com/api/extension-guides/webview) = à la iframe for custom VS Code extension
