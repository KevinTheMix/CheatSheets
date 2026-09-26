# PyCharm

## Quick Tips

* Click on method writer's name (right from number of usages) to show last editor for each line (à la Git blame)

## Glossary

* **Qodana** = static code analysis tool, integrating into CI/CD pipelines (eg GitHub Actions, Azure DevOps, GitLab, Jenkins) for code QA, security, maintainance (à la SonarQube)

## Menus

### (File >) Settings

* **Editor** > Font > Consolas 14 (default is JetBrains Mono 13)
* **Plugins** > 'VSCode keymap' > _Install_, then select it in dropdown = use Visual Studio Code KB shortcuts
* **Build, Execution, Deployment** > Debugger > uncheck _Focus application on breakpoint_ to prevent window from stealing focus while typing elsewhere

### Left Navigation Bar

* **Project** > (vertical …) > Behavior > _Always Select Opened File_ = scroll to & highlight currently opened file
* **Commit**
* **Pull Requests**
* **Structure** = (nested) map of current file's entities (classes, variables & methods)
* **More tool windows** = Bookmarks, Find, Coverage, Endpoints, GitHub Copilot Multiple Code Suggestions, Hierarchy, Learn, Python Process Output, Run, TODO

## Keyboard Shortcuts

* `F7` = step into
* `F8` = step over (+ `Shift` to step out)
* `F9` = resume program
* `Alt + F7` = find usages
* `Alt + F12` = terminal
* `Alt + J` = select next occurrence
* `Alt + Up/Down` = go to previous/next function
* `Alt + Left/Right` = go to left/right tab
* `Alt + Shift + Up/Down` = move line up/down
* `Ctrl + Click` = go to defintion (same as `F12`)
* `Ctrl + F4` = close current tab
* `Ctrl + F8` = toggle line breakpoint
* `Ctrl + B` = go to declaration
* `Ctrl + Shift + Z` = redo
* `Ctrl + Alt + Shift + Insert` = new scratch file
* `Shift + F6` = rename
* (Code >) Folding
  * `Ctrl + Shift + ]` = Expand
  * `Ctrl + K, Ctrl + ]` = Expand
  * `Ctrl + K, Ctrl + J` = Expand All
  * `Ctrl + Shift + [` = Collapse
  * `Ctrl + K, Ctrl + [` = Collapse Recursively
  * `Ctrl + K, Ctrl + 0` = Collapse All
