#!/usr/bin/env sh
set -eu

CONFIG_DIR="$HOME/.config/llama.cpp"
PORT=11434

# Find available .ini files
presets=$(ls "$CONFIG_DIR"/*.ini 2>/dev/null || true)

if [ -z "$presets" ]; then
    echo "Error: No .ini files found in $CONFIG_DIR" >&2
    exit 1
fi

count=$(echo "$presets" | wc -l)

if [ "$count" -eq 1 ]; then
    PRESET_PATH="$presets"
else
    echo "Multiple presets found in $CONFIG_DIR:"
    i=1
    for p in $presets; do
        echo "$i) $(basename "$p")"
        i=$((i + 1))
    done

    echo "Select a preset:"
    read -r choice

    # Validate choice
    if ! echo "$choice" | grep -q '^[0-9]\+$' || [ "$choice" -lt 1 ] || [ "$choice" -gt "$count" ]; then
        echo "Invalid selection." >&2
        exit 1
    fi

    # Get the selected path
    PRESET_PATH=$(echo "$presets" | sed -n "${choice}p")
fi

echo "Starting llama-server with: $(basename "$PRESET_PATH")"

exec llama-server \
    --models-preset "$PRESET_PATH" \
    --port "$PORT" \
    --metrics \
    --models-max 2
