# Large Language Model

## Quick Tips

* Don't create skills yourself
* Provide concrete examples rather than abstract principles (show, don't tell)
* Submit whole screenshots instead of painfully describing UI for troubleshooting
* *Let ChatGPT write it*, *Shit in, shit out*, *How hard can it be?* -- William Verhaeghe
* [OpenAI: Proximal Policy Optimization](https://openai.com/blog/openai-baselines-ppo) = reinforcement learning
* Product-specific notes: [Claude](Claude.md), [GitHub Copilot](GitHub%20Copilot.md)
* Architecture: IDE extension <-> harness (MCP host, with one MCP client per MCP server) <-> LLM
  * LLM only requests tool calls via (structured JSON) text, the harness executes them (built-in tools or MCP)

## Glossary

* **Agent** = LLM-powered system that pursues a goal through a loop of planning, tool use, observation and adjustment, often with access to memory
* [AGENTS.md](https://agents.md) = file included in (any folder of) a project to guide coding agents, provide setup commands, coding style guidelines, etc
  * They're sent along with request as needed (root one is sent with each request, nested one when specific folder has to be inspected)
  * Eg Tech Stack, Architecture Overview, Development Commands, Project Structure, Coding Standards, Git Workflow Rules (eg don't push to main), Testing Standards, Project Rules
* **AI Coding Agent** = agentic development tool such as Claude Code, GitHub Copilot, Cursor or Google Antigravity
* **Context Rot** = when answer quality decreases as context window enlarges
* **Context Window** = total information exchanges from start of discussion with LLM, which is re-sent in full for each new request (gets compacted when reaching limit)
  * **System Prompt** = general behavior guidelines/instructions, tool definitions (eg bash, web_search, etc), available skills
  * **Conversation History** = back & forth chat between user/LLM
  * **Attachments** = any attached files/images
* **Embeddings** (or **Vectors**) = multi-dimensional numerical representations of text/images/data (notably created by neural networks during learning) to compare/search them semantically
* **Fine-Tuning** = embeds knowledge & behavioral patterns directly into model's weights through additional training on domain-specific data, changing model persistently (expensive, less flexible)
* **Frontmatter** = optional metadata block at the beginning of a Markdown file, commonly written as YAML between `---` delimiters; not part of standard Markdown
* **Function Calling** (aka Tool Calling) = an LLM is given a list of available external operations (often via JSON schema), and can request one then receive its output
  * Eg read/write/grep/search files, DB, code/string manipulation, commands/shell script, code analysis, Git(Hub), web browser, Slack, calendars
* **GPT** (Generative Pre-trained Transformer) = deep learning generative large language model created by OpenAI that can process complex questions & generate text/code
* **Harness** = software layer that runs an agent session & communicates with an LLM (usually via an HTTP API carrying structured JSON): builds context, executes tool calls & loops until done, handles approvals & session state
* **Hook** = command executed at a configured point in an agent lifecycle (eg before/after a tool call)
* **Model Context Protocol** (MCP, originally created by Anthropic) = client-server protocol standardizing how AI applications connect to external capabilities
  * **MCP Client** = component inside the host holding a 1:1 connection to one server (JSON-RPC over stdio/HTTP): lists its capabilities (`tools/list`) & forwards the model's tool calls (`tools/call`)
    * Client configuration is stored in JSON files (*%USERPROFILE%\.copilot\mcp-config.json* for VS Code, *%APPDATA%\Local\github-copilot\intellij\mcp.json* for PyCharm)
  * **MCP Host** = AI application (here the harness, or the IDE app wrapping it) that embeds MCP clients, runs the model loop & decides which tools to expose/approve
  * **MCP Server** = separate process (local) or remote service exposing tools (actions), resources (read-only contextual data) & prompts (reusable instruction templates)
    * Server self-describes (no skill needed), it sends tool names/descriptions/input schemas & optional usage instructions on connection, injected by host into model's context
* **Product Requirement Document** (PRD) = requirements document
* **Retrieval-Augmented Generation** (RAG) = enables "dumb" retrieval/incorporation of information from external data sources as documents chunked as embeddings indexed in a vector DB, then passed as context to a LLM
  * A common example: a company might build a RAG system over their internal documentation, so employees can ask questions and get answers based on actual company policies and procedures rather than generic LLM knowledge
  * Preprocessing depends on data type (text as tokens, image as pixel tensors, audio as spectograms/waveforms) and passed forward through a pretrained neural network model
  * Comparison is then achieved via cosine similarity (most common, compares vector direction more so than size), dot product or Euclidean distance
* **Skill** = reusable on-demand instructions/resources, packaged as a discoverable folder/zip containing a *SKILL.md* & optional files/templates
  * Invoke explicitly with `/<skill-name>`, or let the agent load it automatically when its description matches the task
  * Standard frontmatter = `name` (must match folder name) & `description` (both required), `license`, `compatibility`, `metadata`, `allowed-tools` (experimental)
  * Client-specific frontmatter (eg Claude Code, VS Code Copilot; not in the standard)
    * `argument-hint` = hint shown in the chat input
    * `disable-model-invocation: <true|false>` = if `true`, only the user can invoke the skill (via slash command)
  * Eg Claude: *Reading the docx skill to understand best practices for creating a Word document*
  * See [Agent Skills](https://agentskills.io) open standard, by Anthropic
* **Tool** = built-in/MCP/IDE extension-provided discrete granular capabilities (eg browse web)
* **Zero/One/Few-shot Learning** = providing zero, one or a few examples in the model context before asking it to perform a task

### Tools

* **AutoGPT** = open-source agent orchestration agent that attempts to achieve a goal specified by a user in natural language (eg ChaosGPT to destroy humanity)
* **Amazon Q Developer** = generative AI-powered assistant
* **Amazon Bedrock** = fully managed service from AWS to build AI-Powered applications (eg AI assistants, chatbots, content generators, etc) quickly/easily without managing servers or training AI models yourself
* **Amazon SageMaker** = cloud-based machine learning platform to create/train/deploy ML models on cloud (eg on embedded systems, edge devices)
* **Amp** (by *Sourcegraph*) = CLI or IDE-integrated coding agent using various models (eg Gemini 3 Pro), with a strong focus on autonomous sub-agents & multi-step task execution
* **Codex** = originally a simple coding-oriented OpenAI LLM (that powered GitHub Copilot), now a local IDE agentic coding assistant consuming OpenAI API (also via CLI or GitHub-connected [cloud-based](https://chatgpt.com/codex))
* [Context7](https://context7.com/dashboard) = MCP server that pulls up-to-date API versioned documentation & code samples (eg Flutter), prompt context, API access (free API key provides monthly requests allowance)
* [FastMCP](https://gofastmcp.com) = standard framework for building MCP servers/clients/interactive applications
* [Gitingest](https://gitingest.com) = turn any Git(Hub) repository into a simple long text digest of its codebase, to feed into any LLM
* [Hugging Face](https://huggingface.co) = machine learning models collaborative/sharing platform
* **Kiro** = AWS's native agentic AI development environment & IDE, from prototype to production
* **mgrep** (*Mixedbread AI*) = cloud-based semantic multilingual multimodal (ie code/images/audio/video/PDFs) pre-filter grep system packaged as a developer tool, improving requests (ie use fewer tokens, halving costs & duration)
  * Watches local codebase for changes and send an index to their remote cloud service stored into a Mixedbread Store (vector DB in cloud)
  * [Me And Claude Are in Love With MGREP for 250% Better Results](https://medium.com/coding-nexus/6357351eaac0)
* [Ollama](https://ollama.com) = run llama2 (uncensored) & other models (Mistral)
* **OpenCode** = FOSS agent that provides planning capabilities, tools, UI, context, and ability to use any LLM (via API Key), originally designed for terminals
* **Perplexity** = AI-powered web search/answer angine (added as an option in Firefox search bar)
* *Playwright MCP* = MCP server providing automated web designing capabilities (eg open a browser, click buttons, fix CSS visually) via any MCP client
* [PrivateGPT](https://github.com/imartinez/privateGPT) = interact with your documents using the power of GPT, 100% privately
  * [Installing PrivateGPT on WSL with GPU support](https://medium.com/@docteur_rs/installing-privategpt-on-wsl-with-gpu-support-5798d763aa31) (@Emilien Lancelot)
* [Ralph](https://www.youtube.com/watch?v=RpvQH0r0ecM) = Amp & Claude Opus 4.5 based AI agent loop running Amp & pushing to git repeatedly until all PRD items are complete
  * Each iteration is a fresh instance with clean context & memory, but context/memory can be preserved between successive loops via:
    * *git history* = previous commits
    * *AGENTS.md* = long-term memory
    * *prd.json* = initial requirements broken down as stories (completed stories are marked as *passed*)
    * *progress.txt* = short-term memory, append-only (ie forward log) of what was done/changed/learned (gotchas, useful context)
  * [PRD Generator](https://github.com/snarktank/ralph/blob/main/skills/prd/SKILL.md) Skill
* *Whisper Flow* = AI-powered voice dictation
