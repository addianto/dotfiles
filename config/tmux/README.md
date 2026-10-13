# tmux/psmux Configuration

## Setup

On a Mac OS or Linux-based system, create the configuration directory and enable the configuration via symbolic link:

```shell
mkdir -p $HOME/.config
ln -s <dotfiles>/config/tmux $HOME/.config/tmux
```

Similarly, on Windows (PowerShell):

```pwsh
mkdir -p $HOME/.config
New-Item -Type SymbolicLink -Target <dotfiles>/config/tmux -Path $HOME/.config/psmux
```

## References

- [tmux - ArchWiki](https://wiki.archlinux.org/title/Tmux)
