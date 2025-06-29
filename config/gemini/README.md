# Gemini CLI Setup

On Mac OS, install Gemini CLI by using Homebrew:

```shell
brew install gemini-cli
```

On Windows, use `pnpm` to install Gemini CLI globally:

```shell
pnpm add -g @google/gemini-cli
```

After installing Gemini CLI, install the following extensions:

- [Code Review](https://github.com/gemini-cli-extensions/code-review)
- [Security](https://github.com/gemini-cli-extensions/security)
- [Nano Banana](https://github.com/gemini-cli-extensions/nanobanana)
- [Jules](https://github.com/gemini-cli-extensions/jules)
- [Flutter](https://github.com/gemini-cli-extensions/flutter)

Finally, create symbolic links to [`AGENTS.md`](./AGENTS.md), [`.env`](./.env),
and [Continue's `rules` directory](../continue/rules/) in user's Gemini configuration directory:

```shell
cd "$HOME/.gemini"
ln -s "$HOME/.local/src/dotfiles/gemini/AGENTS.md"
ln -s "$HOME/.local/src/dotfiles/gemini/.env"
ln -s "$HOME/.continue/rules"
# On Windows, use `New-Item -Type SymbolicLink` command to create symbolic links.
```
