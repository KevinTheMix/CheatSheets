# GitHub Copilot Training

## Quick Tips

* Use _Generate Commit Message_ in VS Code
* Context/customizations are normally scoped to the current folder/workspace (discovery can be enabled for monorepos)
* Personal heuristic: try GPT for functional specs and Claude for architecture/technical specs; model strengths and availability evolve
* Workspace customizations are commonly stored under _.github/_ and committed for the team; personal Agent Host customizations use harness-specific folders such as _~/.copilot/_, while Local prompts/instructions can live in the VS Code profile

## Glossary

* **Agent** = reusable role/persona (eg _architect/product owner_) combining instructions, tools, sub-agent access and optionally a model, usually stored as an _.agent.md_ file
  * Optional YAML frontmatter can configure name, description, agents, **tools** (omitted => default tools), **model** and harness-specific options such as reasoning effort
  * A parent agent can delegate to sub-agents; communication between related agents depends on the harness, available tools and configuration
* **GitHub Copilot** = GitHub's AI development platform and agent runtimes, connecting IDE/CLI experiences to supported language models and tools
* **Harness** = software layer that runs an agent session: it prepares context, coordinates the model/tool loop and approvals, and maintains session state
* **Hook** = command executed at a configured point in an agent lifecycle (eg before/after a tool call)
* **Instruction** = _.md_ file describing reusable guidelines/rules applied globally, by file pattern, by task relevance or when attached manually (eg _.github/copilot-instructions.md_ or _*.instructions.md_)
* **MCP Server** = local or remote integration exposing tools/resources to agents (typically over stdio, HTTP or SSE)
  * Can connect company knowledge/services; RAG is one possible implementation
* **Plugin** = installable bundle of agent customizations such as skills, agents, hooks and MCP integrations
* **Prompt file** = reusable _.prompt.md_ prompt invoked manually; supported by the Local harness but deprecated in favor of skills for Agent Host sessions
* **Skill** = packageable folder with a _SKILL.md_ file (and optional files/templates eg Word/PowerPoint) containing reusable instructions to perform specialized tasks
  * Invoke explicitly with `/<skill-name>`, or let the agent load it automatically when its description matches the task
* **Slash command** = command entered with `/`; it may invoke a built-in action, prompt or skill (eg `/create-agent` and `/yolo` are commands, not skills)
* **Tools** = toggleable built-in, MCP or extension-provided agent capabilities (eg spawn sub-agents, browse, edit files, execute code, read, search, manage todo)
* **Zero/One/Few-shot Learning** = providing zero, one or a few examples in the model context before asking it to perform a task

* **Cellenza** = Microsoft-certified cloud & software company
* **Context7** = online MCP server exposing current documentation for many frameworks (bridges the gap between model training and current information)
* [Awesome Copilot](https://github.com/github/awesome-copilot) = community-driven turnkey collection of agents/instructions (their web version can be used in prompts as inspiration eg to generate agent skills)

## Visual Studio Code

* `Ctrl + I` = Inline Chat
* `Ctrl + Alt + I` = Chat
* `Ctrl + Alt + Shift + L` = Quick Chat
* `Ctrl + Shift + A` = Agents Window (all cross-repository chat sessions)
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
* **Configure Tools…** = control tool availability; Local can select tools for an individual request, while Copilot manages available client-side tools more broadly, and custom agents/skills can further scope them
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

## Prompts

Generate project-wide instructions in _.github/copilot-instructions.md_ and other relevant documentation files (personal always-on Copilot instructions use _~/.copilot/copilot-instructions.md_):

* Help me setup the global copilot instruction file for my project
* My documentation will be located in a dedicated folder
* After every prompts, you MUST make sure that:
  * The documentation is up to date
  * The backlog is up to date
  * Write an evolution log of all we have done
  * Have full and detailed implementation notes
  * Our copilot global instruction are up to date

Generate multiple sub-agents for architecture, development, functional (product owner), and an orchestrator
You can achieve this via one or more chat queries (using the `/create-agent` built-in slash command in a Local agent session)

* Pros and cons strategy: ask model to propose several options and pick one
* Task decomposition strategy = ask the model to break work into small, reviewable steps (ideal for refactoring); request conclusions and checks rather than private chain-of-thought reasoning
  * Eg _Help me refactor the code in `<file>`. Go one step at a time. Do not move to the next step until I give the keyword "next". Begin._
* Roles strategy = assign a role to clarify the desired perspective, constraints and output
  * Eg _Act as …_
* Context reset strategy = for an unrelated or confused conversation, compact/fork it or start a new chat with a concise verified summary and request a critical analysis
