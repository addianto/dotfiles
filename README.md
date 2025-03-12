# Dotfiles

> My personal dotfiles, even though I mainly use Windows.

This project contains my personal dotfiles.
I try to organise them according to the [XDG Base Directory specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).

## Installation

Configure the XDG Base Directory-related environment variables in the user/home directory, such as:

- `XDG_DATA_HOME`
- `XDG_CONFIG_HOME`
- `XDG_STATE_HOME`
- `XDG_CACHE_HOME`

On Windows, configure the environment variables manually via the Control Panel.
Some automation might possible in the future using [`xPSDesiredStateConfiguration`](https://github.com/dsccommunity/xPSDesiredStateConfiguration) module.
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
For example, the following shell command creates a symbolic link to the `nvim` configuration directory and places it into `XDG_CONFIG_HOME`:

```shell
cd config
ln -s nvim "$XDG_CONFIG_HOME/nvim"
```

> Note: On Windows, use the `New-Item -Type SymbolicLink` command to create symbolic link.

## Windows-specific Configuration

Besides dotfiles, this project also contains WinGet Configuration files located in the [`windows/configurations`](./windows/configurations/) directory.

## Acknowledgements

- [The Lazy Neovim Starter](https://github.com/frans-johansson/lazy-nvim-starter) by Frans Johansson, used as a starting point for configuring Neovim.
- Some Neovim configuration options adapted from [`kickstart-nvim`](https://github.com/nvim-lua/kickstart.nvim).

## License

This project is licensed under the [MIT](./LICENSE) license.
