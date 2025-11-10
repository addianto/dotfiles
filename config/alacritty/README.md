# Alacritty Setup

Create a symbolic link to Alacritty configuration folder in the OS' expected location.
On Windows, the folder should be located at `%APPDATA/alacritty`:

```shell
cd $env:APPDATA
New-Item -Type SymbolicLink -Path alacritty -Target <path to Alacritty configuration folder in dotfiles>
```

On Mac OS, the folder should be located at `~/.config/alacritty`:

```shell
cd ~/.config
ln -s <path to Alacritty configuration folder in dotfiles> alacritty
```

Go into the Alacritty configuration folder and create a new file named `alacritty.toml` to import the shared and platform-specific configuration files:

```toml
[general]
import = [
    "common.toml",
    # Uncomment specific platform configuration line:
    # "macos.toml",
    # "windows.toml",
    # Default theme set to Tokyo Night Storm
    "themes/tokyo-night-storm.toml",
]
```
