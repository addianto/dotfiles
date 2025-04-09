# Ollama

My personalised Ollama configuration and models.

## Configuration

I use the default configuration, except:

- `OLLAMA_FLASH_ATTENTION` is set to 1 on a machine with an Nvidia GPU.

See [`config.go`](https://github.com/ollama/ollama/blob/v0.5.7/envconfig/config.go) for the list of variables.

## Models

Currently, I use the following models:

- [Gemma 3 4B with tools support](https://ollama.com/PetrosStav/gemma3-tools:4b) as main general purpose model.
- [Llama 3.2 Abliterated 3B](./models/llama3.2-abliterated-3b-personal.Modelfile) as secondary general purpose model.
- [Cogito v1 Preview 3B](https://ollama.com/library/cogito:3b) as reasoning model.
- [Qwen 2.5 Coder Abliterated 1.5B](./models/qwen2.5-coder-abliterated-1.5b-personal.Modelfile) as code completion model.
- [Sailor2 3B](https://huggingface.co/sail/Sailor2-3B) for Bahasa Indonesia <-> English translation model.
- [Sarashina 2.2 3B](https://huggingface.co/sbintuitions/sarashina2.2-3b) for Japanese <-> English translation model.
- [SmolLM2 1.7B](https://huggingface.co/HuggingFaceTB/SmolLM2-1.7B-Instruct) on my Raspberry Pi 5 as a general purpose model.
- [Snowflake Arctic Embed 2 568M](https://huggingface.co/Snowflake/snowflake-arctic-embed-l-v2.0) for embedding.

Use `ollama create` to build custom models from `Modelfile` files.
For example, to build the personalised Llama 3.2 Abliterated model and quantize it to Q8_0 level:

```shell
ollama create addianto/llama3.2-abliterated:3b --file models/llama3.2-abliterated-3b-personal.Modelfile --quantize q8_0
```
