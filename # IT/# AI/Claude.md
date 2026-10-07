# Claude

## Quick Tips

* [Claude Skills](https://claude.com/skills)
* [Docs](https://platform.claude.com/docs/en/intro)
* [Security](https://code.claude.com/docs/en/security)
* [Anthropic Academy](https://anthropic.skilljar.com) = courses
* [Claude in Excel Add-in](https://marketplace.microsoft.com/en-us/product/saas/wa200009404)
* [Claude: Choosing the right Claude model](https://claude.com/resources/tutorials/choosing-the-right-claude-model)
* [Mastering Claude Code in 30 minutes](https://www.youtube.com/watch?v=6eBSHbLKuN0) (Boris Cherny, member of technical staff)
* [Awesome Claude subagents](https://github.com/VoltAgent/awesome-claude-code-subagents)
  * Claude Code was designed as a CLI to be future-proof & agnostic of any particular currently popular IDE solution

## Glossary

* _CLAUDE.md_ = file whose contents are included in every single request (**keep it lean!**)
* **Agent SDK** = call Claude Code agents as a library (eg Python library _claude\_agent\_sdk_) to use in code/script
* **Claude Code** = coding CLI for agentic workflows
* **Claude.ai** = web-based chat (à la ChatGPT, also exists as desktop app with access to MCP servers, Chrome extension, Excel plugin)
* **Cowork** = (Claude Desktop) personal assistant for filesystem tasks or web-based tasks via Chrome Claude extension
* **Hook** = Claude lifecycle command (eg block reading a sensitive file by writing to stderr before a read/grep tool call)
* **MCP Connector** = connection from Claude to an MCP server
  * Locally = via a Claude Desktop extension (as MCP client), better for data privacy as you control what is effectively sent to Claude
  * Remotely = via a publicly reachable HTTP MCP server referenced in the Messages API, which the Claude backend calls directly
* **Messages API** = main HTTP API for interacting with Claude programmatically
* **Plan Mode** = review development plan before coding (instead of coding immediately)
* **Skill** = Claude's implementation of the Agent Skills standard, discovered from folders containing _SKILL.md_

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
* `!` = enter bash mode (add command to context sent with next request)
* `@` = add a file/folder to context
* `Esc` = cancel current action (stops immediately)
* `Esc, Esc` = rewind/jump back in history (`--continue` or `--resume` to resume)
* `Ctrl + R` = verbose output (same thing Claude sees in its context window)
* `Shift + Tab` = auto-accept edits, or twice to enter Plan Mode
