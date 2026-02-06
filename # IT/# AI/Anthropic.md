# Anthropic

## Quick Tips

* [Claude Skills](https://claude.com/skills)
* [Docs](https://platform.claude.com/docs/en/intro)
* [Security](https://code.claude.com/docs/en/security)
* [Anthropic Academy](https://anthropic.skilljar.com) = courses
* [Mastering Claude Code in 30 minutes](https://www.youtube.com/watch?v=6eBSHbLKuN0) (Boris Cherny, member of technical staff)
* [Awesome Claude subagents](https://github.com/VoltAgent/awesome-claude-code-subagents)
  * Claude Code was designed as a CLI to be future-proof & agnostic of any particular currently popular IDE solution

## Glossary

* _CLAUDE.md_ = file whose contents are included in every single request (**keep it lean!**)
* **Agent SDK** = call Claude Code agents as a library (eg Python library _claude\_agent\_sdk_) to use in code/script
* **Claude Code** = coding CLI for agentic workflows
* **Claude.ai** = web-based chat (à la ChatGPT, also exists as desktop app with access to MCP servers, Chrome extension, Excel plugin)
* **Cowork** = (Claude Desktop) personal assistant for filesystem tasks or web-based tasks via Chrome Claude extension
* **Hook** = add lifecycle pre/post operations (ie commands) during Claude execution & use of tools (eg detect use of read/grep tool on a sensitive file so write to stderr to prevent it)
* **Messages API** = main HTTP API for interacting with Claude programmatically
* **MCP Connector** = connection of remote Claude to a MCP server
  * Locally = via a Claude Desktop extension (as MCP client), better for data privacy as you control what is effectively sent to Claude
  * Remotely = via a HTTP publicly reachable MCP server (referenced in Messages API) that Claude backend (ie acting as MCP client) calls directly
* Models
  * **Haiku** = fastest
  * **Opus** = most intelligent
  * **Sonnet** balanced
* **Plan Mode** = review development plan before coding (instead of coding immediately)

## Claude CLI

* `claude` = start interactive session
  * `\theme` = select a theme
* `claude --help` = help
* `claude -p {prompt}`
  * `--allowedTools {tool}` = eg `Bash(git log:*)`
  * `--output-format {format}` = receives response in given format (eg `json`)

## Inputs & Shortcuts

* `/compact` = discard existing context window and replace it with a shorter summary (to avoid context rot)
* `/init` = analyzes project (architecture) & adds a _CLAUDE.md_ file
* `#` = create a memory
* `!` = enter bash mode (addd command to context sent with next request)
* `@` = add a file/folder to context
* `Esc` = cancel current action (stops immediately)
* `Esc, Esc` = rewind/jump back in history (`--continue` or `--resume` to resume)
* `Ctrl + R` = verbose output (same thing Claude sees in its context window)
* `Shift + Tab` = auto-accept edits, or twice to enter Plan Mode
