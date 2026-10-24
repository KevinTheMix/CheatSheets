# Cheat Sheets conventions

## File structure

* One topic per file, named in Title Case after the topic (eg `Helm.md`, `Kubernetes.md`), placed in the matching `# Category/` folder
* `# Title` header, then a short subject-less intro (eg "Package manager & template engine for Kubernetes…")
* Standard sections, in this order, only those relevant:
  * `## Quick Tips` = short practical tips, optionally followed by `### Resources` (links)
  * `## Glossary` = definitions of concepts/components/tools
  * Then either `## Environment`, `## CLI` or `## API` (or app-specific ones, eg `## Menus`, `## Shortcuts`)
* When a sub-topic grows large enough (eg Helm inside Kubernetes), move it to its own file and leave a one-line entry linking to it (`see [Helm](Helm.md)`)

## List items

* Content is mostly bullet lists using `*`, nested with 2-space indentation
* Format: `* **Element** (acronym) = definition`
  * Element in bold, acronym in parentheses right after it, then ` = `
  * File names and UI items/product examples in italics (eg `*_helpers.tpl*` or `*Traefik*`, but old runs of italics using underscores may exist eg `_old_`; not to be emulated)
  * CLI commands/options in backticks, with options nested under their command (eg `--debug` under `helm upgrade`)
  * Command placeholders use chevrons (eg `kubectl logs <pod>`), even if the file already uses curly braces elsewhere
* Keep alphabetical order when possible
  * Glossary entries (third-party tools may form a separate trailing block)
  * CLI/API commands & their nested options (eg `-Force` before `-Recurse`)
* Terse style: no trailing periods, `&` instead of "and", `eg`/`ie` without dots, `/` for alternatives (eg "create/manage")
* Avoid article "the" whenever possible, even if not strictly grammatical: drop it, or replace with "a"/"that" (eg "trust OS store" / "use a PEM file")
* Keep one-liner bullets ideally ≤ 180 chars; move extra detail into nested sub-bullets

## Markdown

* Every header line is followed by one blank line before content
