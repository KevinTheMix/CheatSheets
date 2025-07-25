# Markdown

## Quick Tips

* Include two spaces at the end of a line to make next line a different paragraph
* Escape backtick = `` here you go: ` `` (spaces on both sides make it render properly)
* Achieve a trailing space with <code>Hello </code> (using a Alt+160 non-breaking space workaround)
* Number of spaces added by Tab depends on the initial scan of the file (first indentation decides whether it's two or four)
* [GitHub](https://guides.github.com/features/mastering-markdown)
* [Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
* [Microsoft Azure DevOps](https://learn.microsoft.com/en-us/azure/devops/project/wiki/markdown-guidance?view=azure-devops)

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
* [Reference to same file header](#eof)
* [Reference to same flie complex header](#eof-&amp;-2) =  HTML encoded lower-kebap-case
* [Reference to another file](<../Design Thinking.md>)
* [URL containing spaces](<https://www.facebook.com/search/top/?q=game beurs>) =  use inner `<>` to handle spaces
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

## EOF & 2
