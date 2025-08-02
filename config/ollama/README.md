# Ollama

My customised Ollama configuration and models.

## Configuration

I use the default configuration, with the following exception:

- `OLLAMA_FLASH_ATTENTION` is set to 1 on a machine with an Nvidia GPU.

See [`config.go`](https://github.com/ollama/ollama/blob/v0.5.7/envconfig/config.go) for the list of available variables.

## Models

Currently, I use the following models:

- [Gemma 3 4B QAT](https://ollama.com/library/gemma3:4b-it-qat) as a general-purpose model and Japanese <-> English translator.
- [Qwen 2.5 Coder Abliterated 1.5B](./models/qwen2.5-coder-abliterated-1.5b-personal.Modelfile)
  and [Qwen 2.5 Coder Abliterated 3B](./models/qwen2.5-coder-abliterated-3b-personal.Modelfile) for code completion and programming assistance.
- [Sailor2 3B](https://huggingface.co/sail/Sailor2-3B) for Bahasa Indonesia <-> English translator.
- [SmolLM2 1.7B](https://huggingface.co/HuggingFaceTB/SmolLM2-1.7B-Instruct) on my Raspberry Pi 5 as a general-purpose model.
- [Qwen 3 Embedding 0.6B](https://ollama.com/dengcao/Qwen3-Embedding-0.6B) for embedding.

On a more powerful machine, I use:

- [Sahabat-AI 9B](https://huggingface.co/GoToCompany/gemma2-9b-cpt-sahabatai-v1-instruct) for Bahasa Indonesia <-> English translator.

Use `ollama create` to build custom models from `Modelfile` files.
For example, to build the personalised Llama 3.2 Abliterated model and quantize it to Q8_0 level:

```shell
ollama create addianto/llama3.2-abliterated:3b --file models/llama3.2-abliterated-3b-personal.Modelfile --quantize q8_0
```
