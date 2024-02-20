#!/usr/bin/env bash

# Configure pyenv (https://github.com/pyenv/pyenv)
if [ -d "$XDG_DATA_HOME/pyenv" ]; then
    export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
    echo "$PATH" | grep "$PYENV_ROOT" > /dev/null || PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

export PYTHON_CONFIGURE_OPTS="--enable-optimizations --with-lto"
export PYTHON_CFLAGS="-march=native -mtune=native"
