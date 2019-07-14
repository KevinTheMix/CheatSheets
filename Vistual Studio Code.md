# Visual Studio Code

## Introduction

A good text editor.

## Shortcuts

    Ctrl + ù                    # Opens the Console
    Ctrl + µ                    # Clones selected tab
    Ctrl + K, Ctrl + Z          # Zen Mode
    Ctrl + K, Ctrl + T          # Select Theme
    Alt + Shift + F             # Tidy
    Alt + Shift + Left/Right    # Selected nested
    Alt + Shift + Up/Down       # Duplicates line
    Ctrl + Shift + V            # Preview Markdown
    Ctrl+K V                    # Preview Markdown Side-by-side

## Settings

* User (Global)
  * %APPDATA%\Code\User\settings.json
* Workspace
* Folder

See <https://developer.hyvor.com/vscode-editing-settings-json>

### Tabs

* [Don't change tabs to spaces](https://stackoverflow.com/a/29972553)

### Filetype Setting

[Setting for one filetype](https://code.visualstudio.com/docs/getstarted/settings#_language-specific-editor-settings)

E.g.:

    {
        "[plaintext]": {
            "editor.insertSpaces": false
        }
    }

Note that .txt files are referenced as "plaintext" filetype.
