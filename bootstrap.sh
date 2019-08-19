#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;

function init() {
    rsync --exclude ".git/" \
	  --exclude ".DS_STORE" \
	  --exclude ".osx" \
	  --exclude "bootstrap.sh" \
	  --exclude "README.md" \
	  --exclude "LICENSE" \
	  --exclude "setup.cmd" \
	  -avh --no-perms . ~;
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    init;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        init;
    fi;
fi;

unset init;
exit 0;
