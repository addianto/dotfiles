#!/usr/bin/env bash
# Provisions libraries and software packages using Homebrew.
# Inspired by: https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

if ! [ -x "$(command -v brew)" ]; then
    echo 'Error: `brew` is not installed.' >&2;
    exit 1;
fi

# Upgrade any already-installed packages
brew upgrade

# Save Homebrew's installed location
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated)
echo 'Be sure to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.'
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`
brew install moreutils
brew install findutils
echo 'Add `$(brew --prefix findutils)/libexec/gnubin` to `$PATH` if you would prefer these be the defaults'

# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed
echo 'Be sure to add `$(brew --prefix gnu-sed)/libexec/gnubin` to `$PATH`.'

# Install Bash 5
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
    echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
    chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install wget
brew install wget

# Install GnuPG to enable PGP-signing commits
brew install gnupg

# Install more recent versions of some macOS tools
brew install vim
brew install grep
brew install openssh
brew install screen

# Install other useful binaries
brew install ack
brew install git
brew install git-lfs
brew install lynx
brew install ssh-copy-id
brew install tree
brew install xz

# Install preferred, personal utilities
brew install nvim
brew install nvm

# Remove outdated versions from the cellar
brew cleanup
