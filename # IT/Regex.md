# Regular Expressions

## Quick Tips

* `(?<![\w\\])_(?!\s)([^_\r\n]*?\S)(?<!\\)_(?![\w])` = find Markdown underscores italics (then replace with asterisks by `*$1*`)
  * Search (without regex) for `\_` afterwards to detect expressions not replaced (eg `_path\_to_`)
  * Underscores within code blocks are also replaced, which may not be desirable

## Glossary

## API

* `^`/`$` = start/end anchors
* `\$` (or `$$` eg in VS Code replace) = literal _$_
* Capture
  * `$0` (or `$&`, or `\0`) = entire match
  * `$n` = n-th capture group
* Wildcards
  * `.` = any character (except newline)
  * Quantifiers
    * `*` = 0 to any (greedy)
    * `+` = 1 to any (greedy)
    * `*?` = 0 to any (lazy)
    * `+?`  = 1 to any (lazy)
    * `{n}` = exactly n
    * `{n,}` = n or more
    * `{n,m}` = between n & m
