# GitHub Copilot

GitHub's AI development platform and agent runtimes, connecting IDE/CLI experiences to supported language models and tools.

## Quick Tips

* Use _Generate Commit Message_ in VS Code
* Context/customizations are normally scoped to the current folder/workspace (discovery can be enabled for monorepos)
* **Try asking agents to work as experts** (which they are), as that apparently activates deep neurons and surfaces their expertise
* GPT is supposedly better for functional specs, Claude for architecture/technical specs (but model strengths and availability evolve)
* Workspace customizations are commonly stored under _.github/_ and committed for the team; personal Agent Host customizations use harness-specific folders such as _~/.copilot/_, while Local prompts/instructions can live in the VS Code profile
* [Awesome Copilot](https://github.com/github/awesome-copilot) = community-driven collection of agents, instructions and skills

## Glossary

* **Agent Mode**
  * _Agent_ = default agent
  * _Ask_ = no access to certain tools (eg agent, edit)
  * _Plan_
* **Custom agent** = reusable Copilot role/persona (eg _architect/product owner_) combining instructions, tools, sub-agent access and optionally a model, usually stored as an _.agent.md_ file
  * Optional YAML frontmatter can configure name, description, agents (which subagents may be spawned), **tools** (omitted => all default tools), **model** and harness-specific options such as reasoning effort
  * A parent agent can delegate to sub-agents; communication between related agents depends on the harness, available tools and configuration
  * A subagent inherits the parent's agent/model/tools unless you point it at a custom agent
* **Hook** = Copilot lifecycle command configured to run before/after events such as a tool call
* **Instruction** = Copilot _.md_ file applied globally, by file pattern, by task relevance or when attached manually (eg _.github/copilot-instructions.md_ or _*.instructions.md_)
* **Plugin** = installable Copilot bundle of customizations such as skills, agents, hooks and MCP integrations
* **Prompt file** = reusable Copilot _.prompt.md_ prompt invoked manually; supported by the Local harness (deprecated in favor of skills for Agent Host sessions)
* **Skill** = Copilot's implementation of the Agent Skills standard; a folder containing _SKILL.md_ and optional files/templates
  * Invoke explicitly with `/<skill-name>`, or let the agent load it automatically when its description matches the task
* **Slash command** = Copilot command entered with `/`; it may invoke a built-in action, prompt or skill (eg `/create-agent` and `/yolo` are commands, not skills)
* [Tool](https://code.visualstudio.com/docs/agents/reference/tools-reference) = toggable agent capability, of 3 types:
  * _Built-in_ = provided by VS Code/Copilot (eg access devtools, browse web, `edit` files/folders, execute code, manage todo, read, search, `agent` toolset to delegate tasks to subagents)
  * _MCP_ = provided by a Model Context Protocol server (eg Pylance MCP Server, GitHub, Playwright, databases, external APIs)
  * _Extension_ = contributed by a VS Code extension (eg Container Tools, Python)

## Visual Studio Code

* `Ctrl + I` = Inline Chat
* `Ctrl + Alt + I` = Chat
* `Ctrl + Alt + Shift + L` = Quick Chat
* `Ctrl + Shift + A` = Agents Window (all cross-repository manual chat agent sessions)
* `Ctrl + Shift + I` = switch to Agent mode
* Use the Command Palette or configure a keybinding for the Agents Window and switching agent roles; bindings can vary by version/profile

### Chat

* `Alt` = toggle **Send to New Chat**
* `Ctrl + :` = **Add Context…** to attach extra information (eg file/folder, instruction, screenshot, source control, lint problems, chat session, PR, tools)
* `Ctrl + ;` = **Set Agent** to select mode (Agent/Ask/Plan)
* `Ctrl + I` = **Dictate** to speech-to-text
* `Ctrl + N` = New Chat
* `Ctrl + Alt + ;` = **Models** (use _Auto_ to get a 10% discount)
* `Ctrl + Shift + Enter` = **Send to New Chat**
* **Configure Model** = configure effort (Balance/Efficiency/Intelligence)
* **Configure Tools…** = enable/disable tools (built-in, MCP, extension) grouped by source; applies globally to all chat sessions using the default agent
  * Custom agents and skills can further restrict their own tools
* **Set Session Target** or **Delegate Session** = choose which agent harness runs the session and where its tools operate
  * _Local_ = runs in the VS Code extension host, on the current workspace; needed for VS Code built-in/extension tools or a model configured in VS Code
  * _Copilot_ = runs in the Agent Host (local machine, remote host, or Dev Container); default for general coding tasks, background sessions, Copilot-specific capabilities
  * _Claude_ = runs Anthropic's Claude Code harness, for Claude-specific capabilities, slash commands & permission modes; execution location depends on the selected host/environment
  * _Codex_ = runs OpenAI's Codex harness, for Codex-specific capabilities; execution location depends on the selected host/environment
  * _Cloud_ = delegates to a provider's remote infrastructure against a GitHub repo, returning a Pull Request; for well-scoped independent tasks
* **Set Permissions**
  * _Default_ = ask
  * _Allow All_ = auto-approve all tool calls and retry on errors
  * _Autopilot_ (Preview) = auto-approve all tool calls and continue until task is done
* **Session Info** (credit cost), **Context Window** (% before compaction), **System** (instructions/tools), **User Context** (messages/files/tools), **Compact Conversation**

## Copilot CLI

* `copilot --yolo` = enable all Copilot permissions; OS permissions, policies, explicit deny rules and sandboxing can still restrict it
* `/fleet` = enable parallel sub-agents
* `/remote <on|off>` = access sessions remotely (eg from phone)

## Customization Prompts

* Generate multiple sub-agents for architecture, development, functional (product owner), an orchestrator (via prompts or `/create-agent` command in Local agent session)
* Generate project-wide instructions in _.github/copilot-instructions.md_ and other relevant documentation files (personal always-on Copilot instructions use _~/.copilot/copilot-instructions.md_):

    Help me setup the global copilot instruction file for my project
    My documentation will be located in a dedicated folder
    After every prompts, you MUST make sure that:
      The documentation is up to date
      The backlog is up to date
      Write an evolution log of all we have done
      Have full and detailed implementation notes
      Our copilot global instruction are up to date

For something you'd repeat, encode the orchestration in a .github/agents/*.agent.md coordinator instead of re-typing the prompt:

    ---
    name: Todo Orchestrator
    description: Fans a todo list out to parallel subagents
    tools: ['agent', 'edit', 'search', 'read', 'runCommands']
    agents: ['Implementer', 'Reviewer']
    ---
    Given a list of independent todo items, run each item as its own parallel subagent
    so contexts stay isolated. Do not do the work yourself. Give each subagent a
    self-contained task description and the expected output shape. When all return,
    synthesize a single summary and flag conflicting file edits.
