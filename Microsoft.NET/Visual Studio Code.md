# Visual Studio Code

A good text editor.

## Tips

* Each Breadcrumbs fragment is fully browsable, seamlessly between file system hierarchy & document (Markdown, Json, etc.) section
* Code comparison updates in real-time
* New files must first be saved for certain shortcuts to become available based on their extension (e.g. Markdown tidying)

* [Fireship: 25 VS Code Productivity Tips](https://www.youtube.com/watch?v=ifTF3ags0XI)

## Environment

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
* [Set keyboard shortcut for](https://stackoverflow.com/a/41688564/3559724) for lower/uppercase

## Commands

See <https://code.visualstudio.com/docs/getstarted/keybindings>

### Menus & Mouse

* _File > Auto Save_ = Autosave
* _Right-click folder > Open in Terminal_ = Open folder in terminal
* _Drag & Drop Tab_ = Move opened file view

### [Keyboards shortcuts](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)

* `Alt + {n}` = Go to Tab {n}
* `Alt + Left/Right` = Go back/forward
* `Alt + Click` or `Alt + Double-Click` or `Alt + Drag` = add cursors at clicked/selected locations
* `Alt + Shift + F` = Format/Tidy (e.g. HTML)
* `Alt + Shift + Left/Right` = Shrink/Expand selection
* `Alt + Shift + Up/Down` = Copy line up/down
* `Ctrl + ,` = Settings (also via gear icon at the bottom-left or via File > Preferences > Settings)
* `Ctrl + ù` or `Ctrl + J` = Toggle Terminal
* `Ctrl + µ` = Clones selected tab or Split Terminal
* `Ctrl + /` = toggle comments
* `Ctrl + B` = Toggle side-bar
* `Ctrl + D`\* = select word at current cursor position (\* then add next matching selection to multi-selection)
* `Ctrl + K, Ctrl + O` = Open Folder
* `Ctrl + K, Ctrl + R` = Open URL to Keyboard Shortcuts PDF
* `Ctrl + K, Ctrl + S` = Keyboard shortcuts
* `Ctrl + K, Ctrl + T` = Select Theme
* `Ctrl + K, R` = Reveal in File Explorer
* `Ctrl + K, V` = Preview Markdown Side-by-side
* `Ctrl + K, Z` = Zen Mode
* `Ctrl + L` = Select current paragraph & move next
* `Ctrl + P` = Search files
  * Type `:` to go to line
  * Type `>` to access Command Palette from here
  * Type `#` to search global symbols (classes, properties, methods, etc.), works with camelCase initials search
  * Type `@` to search local blocks
* `Ctrl + R` = Open recent
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
* **Flutter**
* **GitLens — Git supercharged** = improve VS Code git functionalities
* [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
* **Material Icon Theme** = file icons
* **PowerShell**
* **Prettify JSON** (F1 > Prettify)
* **Quokka** = JavaScript and TypeScript playground in your editor
* **Remote - Containers_-** = open a folder inside a Docker container
* **Remote Repositories** = contribute to Github repositories from within VS Code without typing git commands
* **Remote - SSH**
* **Paste JSON as Code** = generate models based on JSON for a series of languages
* [Winter is Coming](https://github.com/johnpapa/vscode-winteriscoming) = theme
* Vue & JS
  * **TSLint**
  * **TSLint Vue**
  * [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur) = Vue tooling for VS Code
  * [Vue VSCode Snippets](https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets)
    * `vdata` = Vue data snippet
    * `vmethod` = Vue methods snippet
