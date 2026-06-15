# Antigravity CLI Setup

On Windows, install Antigravity CLI using WinGet:

```pwsh
winget install --id "Google.AntigravityCLI"
```

On Mac OS, install Antigravity CLI using Homebrew:

```shell
# TODO: Update this part from my Mac setup
```

After installing Antigravity CLI, initialise the configuration directory by creating symbolic link to the version-tracked configuration directory:

```shell
mkdir -p $HOME/.gemini
cd $HOME/.gemini
ln -s $HOME/.local/src/dotfiles/config/gemini/antigravity-cli
```

> Note: Antigravity CLI's configuration directory is stored in Gemini CLI's configuration directory by default.
