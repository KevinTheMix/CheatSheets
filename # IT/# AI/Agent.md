# Agentic IDE

## Quick Tips

* Run agents in parallel to develop non-coupled layers faster
* [AGENTS.md](https://agents.md) = file included in (any folder of) a project to guide coding agents, provide setup commands, coding style guidelines, etc
  * They're sent along with request as needed (root one is sent with each request, nested one when specific folder has to be inspected)
  * Eg Tech Stack, Architecture Overview, Development Commands, Project Structure, Coding Standards, Git Workflow Rules (eg don't push to main), Testing Standards, Project Rules
* Whole codebase is never sent when sending requests, but current file usually is, as well as any explicit manual mentions
  * Upon initializing a project, an index/embedding DB is constructed to act as a map for remote LLM to

## Glossary

* **Agent** = can refer to two different things:
  * an LLM-powered system able to elaborate multi-step plans to reach a goal (plan tasks, take actions, observe results, adjust, repeat) autonomously, with access to tools, memory retention
  * just the local orchestration process (ie a MCP client) that handles bi-directional communication with (remote) LLM & execute tools locally (ie MCP server & local embedding DB) as needed
  * Hybrid AI coding agents like Claude Code or Cursor combine both parts to form an "agentic system"
* **AI Coding Agent** = Claude Code, GitHub Copilot, or IDEs like Cursor & Google Antigravity
* **Context Window** = maximum amount of text an LLM can see and work with at one time (all query & response text messages, files, system instructions)
* **Embeddings** (or **Vectors**) = multi-dimensional numerical representations of text/images/data (notably created by neural networks during learning) to compare/search them semantically
* **Mention** = refer to a file (eg `@filename` mention file as context)
* **Model Context Protol** (MCP) = protocol created by Anthropic to standardize exposition of specific capabilities (ie 'eyes & hands') to AI applications
  * **MCP Client** = local process that handles requests from remote LLM and queries MCP server (eg direct subprocess communication over stdio), or Anthropic's backend in the case of public remote MCP servers
  * **MCP Server** = local API that exposes a list of (listable) functionalities to access/read some data or perform a treatment
  * **Prompt** = pre-built instruction template telling model to work with specific tools/resources
  * **Resource** = passive read-only data source
  * **Tool** = (JSON) schema-defined function/treatment callable by LLM (eg read/write/grep/search files, DB, code/string manipulation, commands/shell script, code analysis, Git(Hub), web browser, Slack, calendars)
* **Product Requirement Document** (PRD) = requirements document
* **Retrieval-Augmented Generation** (RAG) = enables "dumb" retrieval/incorporation of information from external data sources as documents chunked as embeddings indexed in a vector DB
  * Preprocessing depends on data type (text as tokens, image as pixel tensors, audio as spectograms/waveforms) and passed forward through a pretrained neural network model
  * Comparison is then achieved via cosine similarity (most common, compares vector direction more so than size), dot product or Euclidean distance
* [Skills](https://agentskills.io) = standard (by Anthropic) for reusable on-demand instructions/metadata/resources used automatically when deemed relevant by agent (packed as a discoverable folder/zip containing a _SKILL.md_ file)

## Tools

* **Amazon Q Developer** = generative AI-powered assistant
* **Amp** (by _Sourcegraph_) = CLI or IDE-integrated coding agent using various models (eg Gemini 3 Pro), with a strong focus on autonomous sub-agents & multi-step task execution
* **Codex** = originally a simple coding-oriented OpenAI LLM (that powered GitHub Copilot), now a local IDE agentic coding assistant consuming OpenAI API (also via CLI or GitHub-connected [cloud-based](https://chatgpt.com/codex))
* **Kiro** = AWS's native agentic AI development environment & IDE, from prototype to production
* **mgrep** (_Mixedbread AI_) = cloud-based semantic multilingual multimodal (ie code/images/audio/video/PDFs) pre-filter grep system packaged as a developer tool, improving requests (ie use fewer tokens, halving costs & duration)
  * Watches local codebase for changes and send an index to their remote cloud service stored into a Mixedbread Store (vector DB in cloud)
  * [Me And Claude Are in Love With MGREP for 250% Better Results](https://medium.com/coding-nexus/6357351eaac0)
* **OpenCode** = FOSS agent that provides planning capabilities, tools, UI, context, and ability to use any LLM (via API Key), originally designed for terminals
* _Playwright MCP_ = MCP server providing automated web designing capabilities (eg open a browser, click buttons, fix CSS visually) via any MCP client
* [Ralph](https://www.youtube.com/watch?v=RpvQH0r0ecM) = Amp & Claude Opus 4.5 based AI agent loop running Amp & pushing to git repeatedly until all PRD items are complete
  * Each iteration is a fresh instance with clean context & memory, but context/memory can be preserved between successive loops via:
    * _git history_ = previous commits
    * _AGENTS.md_ = long-term memory
    * _prd.json_ = initial requirements broken down as stories (completed stories are marked as _passed_)
    * _progress.txt_ = short-term memory, append-only (ie forward log) of what was done/changed/learned (gotchas, useful context)
  * [PRD Generator](https://github.com/snarktank/ralph/blob/main/skills/prd/SKILL.md) Skill
