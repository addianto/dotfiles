# Ollama

My personalised Ollama configuration and models.

## Configuration

I use the default configuration, with the following exception:

- `OLLAMA_FLASH_ATTENTION` is set to 1 on a machine with an Nvidia GPU.

See [`config.go`](https://github.com/ollama/ollama/blob/v0.5.7/envconfig/config.go) for the list of available variables.

## Models

Currently, I use the following models:

- [Gemma 3 4B QAT](https://ollama.com/library/gemma3:4b-it-qat) as a general-purpose model and Japanese <-> English translator.
- [Cogito v1 Preview 3B](https://ollama.com/library/cogito:3b) as a general-purpose and reasoning model.
- [Qwen 2.5 Coder Abliterated 1.5B](./models/qwen2.5-coder-abliterated-1.5b-personal.Modelfile) as a code completion model.
- [Sailor2 3B](https://huggingface.co/sail/Sailor2-3B) for Bahasa Indonesia <-> English translator.
  - On a beefier machine, I use [Sahabat-AI 9B](https://huggingface.co/GoToCompany/gemma2-9b-cpt-sahabatai-v1-instruct).
- [SmolLM2 1.7B](https://huggingface.co/HuggingFaceTB/SmolLM2-1.7B-Instruct) on my Raspberry Pi 5 as a general-purpose model.
- [Qwen 3 Embedding 0.6B](https://ollama.com/dengcao/Qwen3-Embedding-0.6B) for embedding.
- [Qwen 3 Reranker 0.6B](https://ollama.com/dengcao/Qwen3-Reranker-0.6B) for reranking.

Use `ollama create` to build custom models from `Modelfile` files.
For example, to build the personalised Llama 3.2 Abliterated model and quantize it to Q8_0 level:

```shell
ollama create addianto/llama3.2-abliterated:3b --file models/llama3.2-abliterated-3b-personal.Modelfile --quantize q8_0
```
