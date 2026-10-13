# tmux Configuration

On Mac OS and Linux-based system, use `tmux` available on package manager.
On Windows, use `psmux` instead. The config mostly the same and compatible with `tmux`.

## Setup

> Mac OS / Linux-based system

```shell
mkdir -p $HOME/.config
cd $HOME/.config
ln -s <dotfiles>/config/tmux
```

> Windows (PowerShell)

```pwsh
mkdir -p $HOME/.config/psmux
cd $HOME/.config/psmux
New-Item -Type SymbolicLink -Target <dotfiles>/config/tmux/tmux.conf -Path psmux.conf
```

## References

- [tmux - ArchWiki](https://wiki.archlinux.org/title/Tmux)
