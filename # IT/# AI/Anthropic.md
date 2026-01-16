# Anthropic

## Quick Tips

* [Claude Skills](https://claude.com/skills)
* [Doc](https://platform.claude.com/docs/en/intro)
* [Awesome Claude subagents](https://github.com/VoltAgent/awesome-claude-code-subagents)

## Glossary

* **Agent SDK** = call Claude Code agents as a library (eg Python library _claude\_agent\_sdk_) to use in code/script
* **Agent Skills** = reusable on-demand instructions/metadata/optional resources (scripts, templates) used automatically when relevant (packed as a folder/zip containing a _SKILL.md_ file)
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
* **Tool Use** = Claude decides it needs to call a tool (à la ChatGPT function calling)

* _CLAUDE.md_ = file whose contents are included in every single request (keep it lean)
* _Playwright MCP_ = provides automated web designing capabilities (eg open a browser, click buttons, fix CSS visually)

## API

* `/init` = analyzes project (architecture) & adds a _CLAUDE.md_ file
