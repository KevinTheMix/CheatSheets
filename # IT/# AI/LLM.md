# Large Language Model

## Quick Tips

* Provide concrete examples rather than abstract principles (show, don't tell)
* Submit whole screenshots instead of painfully describing UI for troubleshooting
* _Let ChatGPT write it_, _Shit in, shit out_, _How hard can it be?_ -- William Verhaeghe
* [OpenAI: Proximal Policy Optimization](https://openai.com/blog/openai-baselines-ppo) = reinforcement learning

## Glossary

* **Agent** = can refer to two different things:
  * an LLM-powered system able to elaborate multi-step plans to reach a goal (plan tasks, take actions, observe results, adjust, repeat) autonomously, with access to tools, memory retention
  * just the local orchestration process (ie a MCP client) that handles bi-directional communication with (remote) LLM & execute tools locally (ie MCP server & local embedding DB) as needed
  * Hybrid AI coding agents like Claude Code or Cursor combine both parts to form an "agentic system"
* [AGENTS.md](https://agents.md) = file included in (any folder of) a project to guide coding agents, provide setup commands, coding style guidelines, etc
  * They're sent along with request as needed (root one is sent with each request, nested one when specific folder has to be inspected)
  * Eg Tech Stack, Architecture Overview, Development Commands, Project Structure, Coding Standards, Git Workflow Rules (eg don't push to main), Testing Standards, Project Rules
* **AI Coding Agent** = Claude Code, GitHub Copilot, or IDEs like Cursor & Google Antigravity
* **Context Rot** = when answer quality decreases as context window enlarges
* **Context Window** = total information exchanges from start of discussion with LLM, which is re-sent in full for each new request (gets compacted when reaching limit)
  * **System Prompt** = general behavior guidelines/instructions, tool definitions (eg bash, web_search, etc), available skills
  * **Conversation History** = back & forth chat between user/LLM
  * **Attachments** = any attached files/images
* **Embeddings** (or **Vectors**) = multi-dimensional numerical representations of text/images/data (notably created by neural networks during learning) to compare/search them semantically
* **Fine-Tuning** = embeds knowledge & behavioral patterns directly into model's weights through additional training on domain-specific data, changing model persistently (expensive, less flexible)
* **Function Calling** (aka Tool Calling) = LLMs is provided a list of available external treatments (via JSON schema) with each request, and can decide to run one then receive its output
  * Eg read/write/grep/search files, DB, code/string manipulation, commands/shell script, code analysis, Git(Hub), web browser, Slack, calendars
* **GPT** (Generative Pre-trained Transformer) = deep learning generative large language model created by OpenAI that can process complex questions & generate text/code
* **Model Context Protol** (MCP) = protocol created by Anthropic to standardize exposition of specific capabilities (ie 'eyes & hands') to AI applications
  * **MCP Client** = local process that handles requests from remote LLM and queries MCP server (eg direct subprocess communication over stdio), or Anthropic's backend in the case of public remote MCP servers
  * **MCP Server** = local API that exposes a list of (listable) functionalities to access/read some data or perform a treatment
  * **Prompt** = pre-built instruction template telling model to work with specific tools/resources
  * **Resource** = passive read-only client data source
  * **Tool** = (JSON) schema-defined function/treatment callable by LLM (e)
* **Product Requirement Document** (PRD) = requirements document
* **Retrieval-Augmented Generation** (RAG) = enables "dumb" retrieval/incorporation of information from external data sources as documents chunked as embeddings indexed in a vector DB, then passed as context to a LLM
  * A common example: a company might build a RAG system over their internal documentation, so employees can ask questions and get answers based on actual company policies and procedures rather than generic LLM knowledge
  * Preprocessing depends on data type (text as tokens, image as pixel tensors, audio as spectograms/waveforms) and passed forward through a pretrained neural network model
  * Comparison is then achieved via cosine similarity (most common, compares vector direction more so than size), dot product or Euclidean distance
* [Skills](https://agentskills.io) = standard (by Anthropic) for reusable on-demand instructions/metadata/resources used automatically when deemed relevant by agent (packed as a discoverable folder/zip containing a _SKILL.md_ file)
  * Eg Claude: _Reading the docx skill to understand best practices for creating a Word document_

### Tools

* **AutoGPT** = open-source agent orchestration agent that attempts to achieve a goal specified by a user in natural language (eg ChaosGPT to destroy humanity)
* **Amazon Q Developer** = generative AI-powered assistant
* **Amp** (by _Sourcegraph_) = CLI or IDE-integrated coding agent using various models (eg Gemini 3 Pro), with a strong focus on autonomous sub-agents & multi-step task execution
* **Codex** = originally a simple coding-oriented OpenAI LLM (that powered GitHub Copilot), now a local IDE agentic coding assistant consuming OpenAI API (also via CLI or GitHub-connected [cloud-based](https://chatgpt.com/codex))
* [Hugging Face](https://huggingface.co) = machine learning models collaborative/sharing platform
* **Kiro** = AWS's native agentic AI development environment & IDE, from prototype to production
* **mgrep** (_Mixedbread AI_) = cloud-based semantic multilingual multimodal (ie code/images/audio/video/PDFs) pre-filter grep system packaged as a developer tool, improving requests (ie use fewer tokens, halving costs & duration)
  * Watches local codebase for changes and send an index to their remote cloud service stored into a Mixedbread Store (vector DB in cloud)
  * [Me And Claude Are in Love With MGREP for 250% Better Results](https://medium.com/coding-nexus/6357351eaac0)
* [Ollama](https://ollama.com) = run llama2 (uncensored) & other models (Mistral)
* **OpenCode** = FOSS agent that provides planning capabilities, tools, UI, context, and ability to use any LLM (via API Key), originally designed for terminals
* **Perplexity** = AI-powered web search/answer angine (added as an option in Firefox search bar)
* _Playwright MCP_ = MCP server providing automated web designing capabilities (eg open a browser, click buttons, fix CSS visually) via any MCP client
* [PrivateGPT](https://github.com/imartinez/privateGPT) = interact with your documents using the power of GPT, 100% privately
  * [Installing PrivateGPT on WSL with GPU support](https://medium.com/@docteur_rs/installing-privategpt-on-wsl-with-gpu-support-5798d763aa31) (@Emilien Lancelot)
* [Ralph](https://www.youtube.com/watch?v=RpvQH0r0ecM) = Amp & Claude Opus 4.5 based AI agent loop running Amp & pushing to git repeatedly until all PRD items are complete
  * Each iteration is a fresh instance with clean context & memory, but context/memory can be preserved between successive loops via:
    * _git history_ = previous commits
    * _AGENTS.md_ = long-term memory
    * _prd.json_ = initial requirements broken down as stories (completed stories are marked as _passed_)
    * _progress.txt_ = short-term memory, append-only (ie forward log) of what was done/changed/learned (gotchas, useful context)
  * [PRD Generator](https://github.com/snarktank/ralph/blob/main/skills/prd/SKILL.md) Skill
* _Whisper Flow_ = AI-powered voice dictation
