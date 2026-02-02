# Large Language Model

## Quick Tips

* Submit whole screenshots instead of painfully describing UI for troubleshooting
* _Let ChatGPT write it_, _Shit in, shit out_, _How hard can it be?_ -- William Verhaeghe
* [Ollama](https://ollama.com) = run llama2 (uncensored) & other models (Mistral)
* [Hugging Face](https://huggingface.co) = machine learning models collaborative/sharing platform
* [OpenAI - Proximal Policy Optimization](https://openai.com/blog/openai-baselines-ppo) = reinforcement learning
* [PrivateGPT](https://github.com/imartinez/privateGPT) = interact with your documents using the power of GPT, 100% privately
  * [Installing PrivateGPT on WSL with GPU support](https://medium.com/@docteur_rs/installing-privategpt-on-wsl-with-gpu-support-5798d763aa31) (@Emilien Lancelot)

## Glossary

* **Context Rot** = when answer quality decreases as context window enlarges
* **Context Windows** = total information exchanges from start of discussion with LLM (both questions & responses), which is re-sent in full for each new request
* **Fine-Tuning** = embeds knowledge & behavioral patterns directly into model's weights through additional training on domain-specific data, changing model persistently (expensive, less flexible)
* **Function Calling** (aka Tool Calling) = lets LLMs interface with external systems & access data outside their training data, using a JSON schema to define available tools
* **GPT** (Generative Pre-trained Transformer) = deep learning generative large language model created by OpenAI that can process complex questions & generate text/code

### Tools

* **AutoGPT** = open-source agent orchestration agent that attempts to achieve a goal specified by a user in natural language (eg ChaosGPT to destroy humanity)
* **Perplexity** = AI-powered web search/answer angine (added as an option in Firefox search bar)
* _Whisper Flow_ = AI-powered voice dictation
