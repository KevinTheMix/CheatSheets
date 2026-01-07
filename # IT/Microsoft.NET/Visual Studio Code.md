# Visual Studio Code

## Quick Tips

* Code comparison updates in real-time
* Breadcrumb path fragments are browsable seamlessly between containing file system & document inner sections
* [Fireship: 25 VS Code Productivity Tips](https://www.youtube.com/watch?v=ifTF3ags0XI)
* [Visual Studio Code (online)](https://vscode.dev)

## Glossary

* **Emmet** (formerly **Zen Coding**) = (built-in) advanced snippet generator for HTML, CSS, etc (cycle-browse through markup elements)

## Preferences

Via _File > Preferences_.

* **Keyboard Shortcuts** (`Ctrl + K, Ctrl + S`)
  * **Transform to Uppercase/Lowercase** = [set lower/uppercase keys](https://stackoverflow.com/a/41688564/3559724)
* **Settings** (`Ctrl + ,`)
  * **Text Editor**
    * **Insert Spaces** = insert spaces on `Tab` (see [indentation settings](https://stackoverflow.com/a/29972553))
    * **Bracket Pairs** = set parentheses matching coloured line guides (formerly an extension, now built-in)
    * **Sticky Scroll: Enabled** = keep current scope (eg class, namespace) breadcrumb at top
  * **Security**
    * **Allowed UNC Hosts** = add _wsl.localhost_ (allows opening WSL Ubuntu files from Windows)
  * **Workbench**
    * **List: Open Mode** = display file by single/double clicking Explorer files
    * **Editor: Enable Preview** = tab preview in italics

### Setting Files

* [Scopes](https://developer.hyvor.com/vscode-editing-settings-json)
* By user (Global)
  * %APPDATA%\Code\User\settings.json
* By workspace
* By folder
* [Setting by Filetype](https://code.visualstudio.com/docs/getstarted/settings#_language-specific-editor-settings)
* `"[plaintext]": { "editor.insertSpaces": false }`   # Note that .txt files are referenced as "plaintext" filetype.

#### Flutter Settings

Adapted from @Flutter Mapp 35 Flutter Tips video.

```json
{
    // Collapses configuration files under pubspec.yaml.
    "explorer.fileNesting.enabled": true,
    "explorer.fileNesting.expand": false,
    "explorer.fileNesting.patterns": { "pubspec.yaml": ".flutter-plugins, .flutter-plugins-dependencies, .gitignore, .packages, .metadata, pubspec.lock, analysis_options.yaml, todoapp.iml" },
    // Automatically format code on save (eg adds missing 'const').
    "[dart]": { "editor.codeActionsOnSave": { "source.fixAll": "explicit" }, }
}
```

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
* `Ctrl + P` = search files by name
  * Type `:` to go to line in current file
  * Type `>` to access Command Palette from here
  * Type `#` to search global symbols
  * Type `@` to search local blocks/headers/sections/symbols
* `Ctrl + R` = open Recent
* `Ctrl + T` = search global symbols (eg classes, properties, methods, and also Markdown headers), works with camelCase initials search
* `Ctrl + Alt + Left/Right` = send tab to other view
* `Ctrl + Alt + Up/Down` = start multi-select
* `Ctrl + Shift + .` = local blocks
* `Ctrl + Shift + Enter` = Insert line above
* `Ctrl + Shift + F` = Search
* `Ctrl + Shift + L` = multi-select all identical selections
* `Ctrl + Shift + T` = tasklist
* `Ctrl + Shift + V` = preview Markdown
* `Ctrl + Shift + ù` = new Terminal
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
* `clear` = à la clscr

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
* **GitLens — Git supercharged** = improve VS Code git functionalities
* **Image preview** = shows (tiny) image preview in gutter (aka code breakpoints area)
* [markdownlint](https://github.com/DavidAnson/vscode-markdownlint#configure)
  * `Ctrl + ,` > _markdownlint config_ > `"markdownlint.config": { "no-duplicate-heading":false }` (note that `markdownlint.ignore` section is for (wildcard) ignoring files instead)
* **Material Icon Theme** = file icons
* **PowerShell**
* **Prettify JSON** (F1 > Prettify)
* **Quokka** = JavaScript and TypeScript playground in your editor
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
