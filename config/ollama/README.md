# Ollama

My customised Ollama configuration and models.

## Configuration

I use the default configuration, with the following exception:

- `OLLAMA_FLASH_ATTENTION` is set to 1 on a machine with an Nvidia GPU.

See [`config.go`](https://github.com/ollama/ollama/blob/v0.5.7/envconfig/config.go) for the list of available variables.

## Models

Currently, I use the following models:

- [Ministral 3 3B Instruct](https://huggingface.co/mistralai/Ministral-3-3B-Instruct-2512) & [Ministral 3 3B Reasoning](https://huggingface.co/mistralai/Ministral-3-3B-Reasoning-2512) for daily, general purpose use in English.
- [Qwen 2.5 Coder Abliterated 1.5B](./models/qwen2.5-coder-abliterated-1.5b-personal.Modelfile) for code completion and programming assistance.
- [SEA-LION v4 4B VL](https://huggingface.co/aisingapore/Qwen-SEA-LION-v4-4B-VL) for occasional, general purpose use in Indonesian.
- [SmolLM2 1.7B](https://huggingface.co/HuggingFaceTB/SmolLM2-1.7B-Instruct) on my Raspberry Pi 5 as a general-purpose model.
- [Qwen 3 Embedding 0.6B](https://huggingface.co/Qwen/Qwen3-Embedding-0.6B-GGUF) for embedding.

Use `ollama create` to build custom models from `Modelfile` files.
For example, to build the personalised Llama 3.2 Abliterated model and quantize it to Q8_0 level:

```shell
ollama create addianto/llama3.2-abliterated:3b --file models/llama3.2-abliterated-3b-personal.Modelfile --quantize q8_0
```
