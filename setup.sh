#!/usr/bin/env bash
set -e

function has_neovim {
    local vim_version=$(vim --version | tac | tail --lines=1)
    [[ $vim_version =~ ^NVIM ]] && return || false
}


[[ ! -d "$HOME/.config/nvim" ]] && mkdir -p "$HOME/.config/nvim"
[[ ! -h "$HOME/.config/nvim/init.vim" ]] && ln --symbolic \
    "$(pwd)/nvim/init.vim" "$HOME/.config/nvim/init.vim"

if [[ ! has_neovim ]]; then
    ln --symbolic "$HOME/.config/nvim/init.vim" "$HOME/.vimrc"
fi

[[ ! -d "$HOME/.config/git" ]] && mkdir -p "$HOME/.config/git"
[[ ! -h "$HOME/.config/git/config" ]] && ln --symbolic \
    "$(pwd)/git/config" "$HOME/.config/git/config"
