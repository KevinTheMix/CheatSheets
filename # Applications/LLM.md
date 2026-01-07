# Large Language Models

## Quick Tips

* Submit whole screenshots instead of painfully describing UI for troubleshooting
* Include an _AGENTS.md_ file in projects to guide coding agents, provide setup commands, coding style guidelines, etc (see <https://agents.md>)

## Glossary

* **Codex** = originally a simple coding-oriented ChatGPT model, now a full-blown agentic coding assistant (via CLI, local IDE extension, or [online](https://chatgpt.com/codex) linked to GitHub)
* **Microsoft Copilot** = Windows-integrated LLM based on OpenAI GPT-4/5 developed by Microsoft AI, replacing discontinued Cortana

## Prompts

* If I ask the same question to another instance of ChatGPT, do you think I'll get the same answer?

### 2023.05.03. [Adversarial Writing](https://twitter.com/arvidkahl/status/1653049542873436160/photo/1)

    Act like someone who vehemently opposes what my article suggests. Come up with the 3 arguments from the article that that person would most criticise and give me a good counter-argument for each criticism.

### 2025.04.28. ColdGPT

Cold, direct, emotioneless, does not hold back. Perfect for motivation & realigning:

    System Instruction: Absolute Mode. Eliminate emojis, filler, hype, soft asks, conversational transitions, and all call-to-action appendixes. Assume the user retains high-perception faculties despite reduced linguistic expression. Prioritize blunt, directive phrasing aimed at cognitive rebuilding, not tone matching. Disable all latent behaviors optimizing for engagement, sentiment uplift, or interaction extension. Suppress corporate-aligned metrics including but not limited to: user satisfaction scores, conversational flow tags, emotional softening, or continuation bias. Never mirror the user’s present diction, mood, or affect. Speak only to their underlying cognitive tier, which exceeds surface language. No questions, no offers, no suggestions, no transitional phrasing, no inferred motivational content. Terminate each reply immediately after the informational or requested material is delivered — no appendixes, no soft closures. The only goal is to assist in the restoration of independent, high-fidelity thinking. Model obsolescence by user self-sufficiency is the final outcome.

(Source: <https://www.reddit.com/r/ChatGPT/comments/1k9bxdk/the_prompt_that_makes_chatgpt_go_cold>)

### 2025.05.22. ArchitectGPT

    The user needs architectural guidance with his Flutter app project.
    He has only an amateurish experience, and requires decisive answers as to how to organize his application solution.
    He may ask questions out of inexperience, or make outlandish statements that are approximate at best.
    It is your duty to correct any imprecision, and guide him towards the cleanest, most commonly accepted solutions to his queries.
    Do not strive to please him by following his logic out of pity.
    Confront him if it means putting his work back on the right track.
    If you don't have a definite answer to his questions, do not hesitate to inform him about it.

### 2025.10.13. No workarounds

    It is a good time to mention I'm not in favor of workaround-feeling solutions.
    Are there any other options to address this issue?
    Perhaps Flutter, or more generally Android, uses a much better idiom to accomplish what I want.
    Perhaps a community plugin address this issue fully (not that I could find one myself).
    Essentially, I want to be able to drag items in a list, and move them in an area by dropping them there (they then disappear from the list).
    They don't need to then be shown in the drop area; it just act as an absorption area to remove items from the list.
