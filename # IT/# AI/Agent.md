# Agentic IDE

## Quick Tips

* Run agents in parallel to develop non-coupled layers faster
* _AGENTS.md_ = file included in projects to guide coding agents, provide setup commands, coding style guidelines, etc (see <https://agents.md>)
  * Tech Stack, Architecture Overview, Development Commands, Project Structure, Coding Standards, Git Workflow Rules (eg don't push to main), Testing Standards, Project Rules
* Whole codebase is never sent when sending requests, but current file usually is, as well as any explicit manual mentions
  * Upon initializing a project, an index/embedding DB is constructed to act as a map for remote LLM to

## Glossary

* **Agent** = can refer to two different things:
  * an LLM-powered system able to elaborate multi-step plans to reach a goal (plan tasks, take actions, observe results, adjust, repeat) autonomously, with access to tools, memory retention
  * just the local orchestration process (ie a MCP client) that handles bi-directional communication with (remote) LLM & execute tools locally (ie MCP server & local embedding DB) as needed
  * Hybrid AI coding agents like Claude Code or Cursor combine both parts to form an "agentic system"
* **AI Coding Agent** = Claude Code, GitHub Copilot, or IDEs like Cursor & Google Antigravity
* **Embeddings** (or **Vectors**) = multi-dimensional numerical representations of text/images/data (notably created by neural networks during learning) to compare/search them semantically
* **Mention** = refer to a file (eg `@filename` mention file as context)
* **Model Context Protol** (MCP) = protocol created by Anthropic to standardize exposition of specific capabilities (ie 'eyes & hands') to AI applications
  * **MCP Client** = local process that handles requests from remote LLM and queries MCP server (eg direct subprocess communication over stdio), or Anthropic's backend in the case of public remote MCP servers
  * **MCP Server** = local API that exposes a list of (listable) functionalities to access/read some data or perform a treatment
  * **Prompt** = pre-built instruction template telling model to work with specific tools/resources
  * **Resource** = passive read-only data source
  * **Tool** = (JSON) schema-defined function/treatment callable by LLM (eg read/write/grep/search files, DB, code/string manipulation, commands/shell script, code analysis, Git(Hub), web browser, Slack, calendars)
* **Retrieval-Augmented Generation** (RAG) = enables retrieval/incorporation of information from external data sources as documents chunked as embeddings indexed in a vector DB

## Tools

* **Amazon Q Developer** = generative AI-powered assistant
* **Codex** = originally a simple coding-oriented ChatGPT LLM (that powered GitHub Copilot), now a local IDE integrated agentic coding assistant (also via CLI or [online](https://chatgpt.com/codex) linked to GitHub)
* **Kiro** = AWS's native agentic AI development environment & IDE, from prototype to production
* **mgrep** (_Mixedbread AI_) = cloud-based RAG system packaged as a developer tool (a semantic multilingual multimodal grep for code/images/audio/video/PDFs/etc), improving requests (ie use fewer tokens, halving costs & duration)
  * Watches local codebase and send it to their remote service which generates embeddings & indexes them into a Mixedbread Store (vector DB in cloud)
* **OpenCode** = FOSS agent that provides planning capabilities, tools, UI, context, and ability to use any LLM (via API Key), originally designed for terminals
