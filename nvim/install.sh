#!/usr/bin/env bash
set -euo pipefail

NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$(dirname "$NVIM_CONFIG_DIR")"

if [ -e "$NVIM_CONFIG_DIR" ] && [ ! -L "$NVIM_CONFIG_DIR" ]; then
  echo "Error: $NVIM_CONFIG_DIR already exists and is not a symlink."
  echo "Move it aside or remove it before installing."
  exit 1
fi

if [ -L "$NVIM_CONFIG_DIR" ]; then
  rm "$NVIM_CONFIG_DIR"
fi

ln -s "$SOURCE_DIR" "$NVIM_CONFIG_DIR"

echo "Neovim config installed at $NVIM_CONFIG_DIR"

echo "Next steps:"
cat <<'STEPS'
1) Launch Neovim.
2) Plugins will install automatically via lazy.nvim.
3) Run :Mason to install:
   - jdtls
   - java-debug-adapter
   - java-test
   - lua-language-server
STEPS
