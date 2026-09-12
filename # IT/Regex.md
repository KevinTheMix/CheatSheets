# Regular Expressions

## Quick Tips

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
