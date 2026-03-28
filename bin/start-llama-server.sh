#!/usr/bin/env sh
set -eu

PRESET_PATH="$HOME/.config/llama.cpp/rinze.ini"
PORT=11434

exec llama-server \
    --models-preset "$PRESET_PATH" \
    --port "$PORT" \
    --metrics \
    --models-max 2
