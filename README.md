# Dotfiles

> My personal dotfiles, even though I mainly use Windows.

This project contains my personal dotfiles.
I try to organise them according to [XDG Base Directory specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).

## Installation

Configure the XDG Base Directory-related environment variables in the user/home directory.
There are four variables to configure:

- `XDG_DATA_HOME`
- `XDG_CONFIG_HOME`
- `XDG_STATE_HOME`
- `XDG_CACHE_HOME`

On Windows, this is done manually via the Control Panel.
Some automation might be possible in the future using [`xPSDesiredStateConfiguration`](https://github.com/dsccommunity/xPSDesiredStateConfiguration) module.
On Linux, run [`xdg.sh`](./config/bash/common.d/xdg.sh) script at least once.

After setting up environment variables, create the XDG directories:

```shell
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_STATE_HOME"
mkdir -p "$XDG_CACHE_HOME"
```

Next, go into the [`config`](./config/) directory.
Inside, create symbolic links for each directory and put them into `XDG_CONFIG_HOME`.
For example, the following shell command creates a symbolic link to the `nvim` configuration directory and put it into `XDG_CONFIG_HOME`:

```shell
cd config
ln -s nvim "$XDG_CONFIG_HOME/nvim"
```

> Note: On Windows, use `New-Item -Type SymbolicLink` command to create symbolic link.

## Acknowledgements

- [The Lazy Neovim Starter](https://github.com/frans-johansson/lazy-nvim-starter) by Frans Johansson as starting point for configuring Neovim.

## License

This project is licensed under the [MIT](./LICENSE) license.
