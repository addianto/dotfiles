# Ollama

My personalised Ollama configuration and models.

## Configuration

I use the default configuration, except:

- `OLLAMA_FLASH_ATTENTION` is set to 1 on a machine with an Nvidia GPU.

See [`config.go`](https://github.com/ollama/ollama/blob/v0.5.7/envconfig/config.go) for the list of variables.

## Models

Currently, I use the following models:

- [Llama 3.2 Abliterated 3B](./models/llama3.2-abliterated-3b-personal.Modelfile)
- [DeepScaleR 1.5B Preview](./models/deepscaler-1.5b-personal.Modelfile)
- [Sailor2 1B/8B](https://huggingface.co/sail/Sailor2-1B)
- [Sarashina 2.2 3B](https://huggingface.co/sbintuitions/sarashina2.2-3b)
- [Qwen 2.5 Coder Abliterated 1.5B](./models/qwen2.5-coder-abliterated-1.5b-personal.Modelfile)
- [SmolLM2 1.7B](https://huggingface.co/HuggingFaceTB/SmolLM2-1.7B-Instruct)
- [Snowflake Arctic Embed 2 568M](https://huggingface.co/Snowflake/snowflake-arctic-embed-l-v2.0)

Use `ollama create` to build custom models from `Modelfile` files.
For example, to build the personalised Llama 3.2 Abliterated model and quantize it to Q8_0 level:

```shell
ollama create addianto/llama3.2-abliterated:3b --file models/llama3.2-abliterated-3b-personal.Modelfile --quantize q8_0
```
