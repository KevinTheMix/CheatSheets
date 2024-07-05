# Markdown

## Quick Tips

* Include two spaces at the end of a line to make next line a different paragraph
* Number of spaces added by Tab depends on the initial scan of the file (first indentation decides whether it's two or four)
* [GitHub](https://guides.github.com/features/mastering-markdown)
* [Microsoft Azure DevOps](https://learn.microsoft.com/en-us/azure/devops/project/wiki/markdown-guidance?view=azure-devops)
* [Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
* Escape backtick = `` here you go: ` `` (spaces on both sides make it render properly)

## API

* `*italic*` (or `_italic`)
* `**bold**` (or `__italic__`)
* `***both***` (or ```both```)
* `~~barred~~`
* `> quote`
* List
  * node
  1. 1
  2. 2
  3. 3
  4. 4
  * node
* [Reference to same file](#eof)
* [Reference to another file](<../Design Thinking.md>) (use inner `<>` to handle spaces)
* [Variants](https://en.wikipedia.org/wiki/Markdown#Variants) = GitHub Flavored & co
  * `log<sub>10</sub>` (non-standard)
  * `var<sup>10</sup>` (non-standard)
  * Footnotes (non-standard)
    * note [^1]
    * note [^a]
    * note [^note]
  * Fenced code blocks (eg ```javascript multi-line```)
* Code:

Is it code?
    No (too close from previous line)

    Yes (2 tabs == 4 spaces)
    Yes! (4 spaces)

## EOF

[^1]: footnote
[^a]: footnote
[^note]: footnote
