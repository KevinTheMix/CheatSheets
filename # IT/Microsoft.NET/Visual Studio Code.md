# Visual Studio Code

## Quick Tips

* [Visual Studio Code (online)](https://vscode.dev)
* [Fireship: 25 VS Code Productivity Tips](https://www.youtube.com/watch?v=ifTF3ags0XI)
* Breadcrumb path fragments are browsable seamlessly between containing file system & document inner sections

## Glossary

* **Emmet** (formerly **Zen Coding**) = (built-in) advanced snippet generator for HTML, CSS, etc (cycle-browse through markup elements)

## Commands

See <https://code.visualstudio.com/docs/getstarted/keybindings>

### Menus & Mouse

* _File > Auto Save_ = Autosave
* _File > Preferences_
  * _Keyboard Shortcuts_ (`Ctrl + K, Ctrl + S`)
    * _Transform to Uppercase/Lowercase_ = [set lower/uppercase keys](https://stackoverflow.com/a/41688564/3559724)
  * _Settings_ (`Ctrl + ,`)
    * _Text Editor_
      * _Insert Spaces_ = insert spaces on `Tab` (see [indentation settings](https://stackoverflow.com/a/29972553))
      * _Bracket Pairs_ = set parentheses matching coloured line guides (formerly an extension, now built-in)
      * _Sticky Scroll: Enabled_ = keep current scope (eg class, namespace) breadcrumb at top
    * _Security_
      * _Allowed UNC Hosts_ = add _wsl.localhost_ (allows opening WSL Ubuntu files from Windows)
    * _Workbench_
      * _List: Open Mode_ = display file by single/double clicking Explorer files
      * _Editor: Enable Preview_ = tab preview in italics

#### Settings Files

* _%APPDATA%\Code\User\settings.json_ = user/global-level/scoped settings
* _.vscode_ = workspace-level/scoped settings
  * _launch.json_ = automatically spawn a browser when running a web app
  * _settings.json_ = workspace-scoped settings
* [Setting by Filetype](https://code.visualstudio.com/docs/getstarted/settings#_language-specific-editor-settings)
  * Eg `"[dart]": { "editor.codeActionsOnSave": { "source.fixAll": "explicit" }, }`= automatically format code on save (eg adds missing `const`)
  * Eg `"[plaintext]": { "editor.insertSpaces": false }` = _.txt_ files are referenced as _plaintext_ filetype
* `"explorer.fileNesting.enabled": true` = enables file nesting (collapses files under a parent file)
* `"explorer.fileNesting.expand": false` = controls whether nested files are expanded/collapsed by default under their parent file
* `"explorer.fileNesting.patterns": { "parent.file": ".child.a, .child.b, .child.c" },`
* `"workbench.tree.indent": 8` = set horizontal indent of Explorer (and other trees)

### [Keyboards shortcuts](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)

* `Alt + {n}` = go to Tab {n}
* `Alt + Left/Right` = go back/forward
* `Alt + Click` or `Alt + Double-Click` or `Alt + Drag` = add cursors at clicked/selected locations
* `Alt + Page Up/Down` = scroll up/down to previous/next screen (without moving cursor)
* `Alt + Shift + F` = format/tidy (eg HTML)
* `Alt + Shift + Left/Right` = shrink/expand selection
* `Alt + Shift + Up/Down` = copy line up/down
* `Alt + Mouse scroll` = scroll faster
* `Ctrl + Alt` = display (eg _const_/_final_/_var_) variable explicit types
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
* `Ctrl + M` = toggle _Tab Moves Focus_
* `Ctrl + O` = Open File
* `Ctrl + P` = search files by name
  * Type `:` to go to line in current file
  * Type `>` to access Command Palette from here
  * Type `#` to search global symbols
  * Type `@` to search local blocks/headers/sections/symbols
* `Ctrl + R` = open Recent
* `Ctrl + T` = search global symbols (eg classes, properties, methods, and also Markdown headers), works with camelCase initials search
* `Ctrl + Alt + Left/Right` = send tab to other view
* `Ctrl + Alt + Up/Down` = start multi-select
* `Ctrl + Page Up/Down` = go to previous/next tab
* `Ctrl + Shift + .` = local blocks
* `Ctrl + Shift + Enter` = Insert line above
* `Ctrl + Shift + F` = Search
* `Ctrl + Shift + L` = multi-select all identical selections
* `Ctrl + Shift + T` = tasklist
* `Ctrl + Shift + V` = toggle Markdown preview
* `Ctrl + Shift + ù` = new Terminal
* `Ctrl + Shift + P` or `F1` or _View > Command Palette_ = Command Palette
  * `Format Document`
  * `Developer: Reload Window` = refresh UI (eg when git panel gets stale)
  * `View: Toggle Minimap`
  * `Terminal: Create New Terminal`
* `Ctrl + Shift + Space` = preview method full definition
* `Ctrl + Space` = auto-complete suggestions
* `View > Show Minimap` or _Command Palette_ > `View: Toggle Minimap` = Toggle Minimap
* `View > Toggle Word Wrap` or `Alt + Z` = Toggle Word Wrap

#### Terminal

* `Esc` = clears currently typed command
* `Ctrl + Left/Right` = jump to previous/next word
* `clear` = à la clscr

### Mouse

* `Right-click Explorer folder` > _Open in Integrated Terminal_ = open terminal at given folder path
* `Drag & Drop File or Tab` > `Shift` = paste source (relative) file path
* `Drag & Drop middle button` = multi-line text block selection

## Snippets

* In a HTML file
  * `!` = scaffold a basic HTML page
  * `scr` = script element
* `camelCase initials + Tab` => intellisense fills the rest ( both for class type names & instance naming)

## Extensions

* **Add jsdoc comments**
* **Auto Rename Tag**
* **Better Comments** = colorize comments (eg `!` is red, `TODO` is orange, `// //` is greyed out)
* **carbon-now-sh** = copies code snippets for public/sharing
* **Dev Containers** = open a folder inside a Docker container
* **Error Lens** = display errors messages inline right next to faulty statement
* **ESLint** (_Microsoft_) = find/fix issues in JS (and TS with `@typescript-eslint` in _.eslintrc.*_) code
* **GitLens — Git supercharged** = improve VS Code git functionalities
* **Image preview** = shows (tiny) image preview in gutter (aka code breakpoints area)
* [markdownlint](https://github.com/DavidAnson/vscode-markdownlint#configure)
  * `Ctrl + ,` > _markdownlint config_ > `"markdownlint.config": { "no-duplicate-heading":false }` (note that `markdownlint.ignore` section is for (wildcard) ignoring files instead)
* **Material Icon Theme** = file icons
* **PowerShell**
* **Prettify JSON** (F1 > Prettify)
* **Quokka** = JavaScript and TypeScript playground in your editor
* **Rainbow CSV** = highlights columns with various colors in a .csv/tsv file for more convenient visual parsing
* **Remote Repositories** = contribute to Github repositories from within VS Code without typing git commands
* **Remote - SSH** = open any folder on a remote machine via SSH
* **Paste JSON as Code** = generate models based on JSON for a series of languages
* **Todo Tree** = show TODO, FIXME comments as a tree view in a separate Visual Studio Code side bar menu
* [Webview API](https://code.visualstudio.com/api/extension-guides/webview) = à la iframe for custom Visual Studio Code extension
* [Winter is Coming](https://github.com/johnpapa/vscode-winteriscoming) = theme

### Coding Assistants

* **ChatGPT - Genie AI** = unofficial ChatGPT non-agentic coding assistant
* **Claude Code for VS Code** = official Claude Code **agentic** coding assistant
* **Codex – OpenAI’s coding agent** = official ChatGPT **agentic** coding assistent
* **Gemini Code Assist** = official Gemini **agentic** (via _Agent Mode_) coding assistant
* **GitHub Copilot** = official GitHub Copilot **agentic** coding assistant (via 3rd-party LLMs)

## Forks

* **Cursor** = AI-first code editor with paid subscription for LLMs access
* **Google Antigravity** = combines an editor + an agent orchestration system + a Chrome-based browser (built upon Windsurf)
  * [Learn the basic of Google Antigravity](https://www.youtube.com/watch?v=nTOVIGsqCuY)
* **Windsurf** = (first agentic) AI-powered IDE (created in 2021, mostly acquired by Google)
