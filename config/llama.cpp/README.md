# llama.cpp Configuration Files (Presets)

## Notes

- The `.mmproj` files are downloaded into `%LOCALAPPDATA%\llama.cpp` on Windows.
  Do not forget to clear up old files.
- Name the models in the preset files using the names available on [Models.dev](https://models.dev).
  If not available, check their HuggingFace page.
- Finetuned models follow their own name, not the ones from the base models.
- Got the following warning messages when loading Gemma 4 models with image max token set to 1120:

  ```shell
  [65162] 0.18.685.198 W srv    load_model: cap image_max_tokens (original=1120) to 512 (n_ubatch = 512) because model needs non-causal attention on image
  [65162] 0.18.685.205 W srv    load_model: increase n_ubatch (-ub) to increase vision token budget
  ```
