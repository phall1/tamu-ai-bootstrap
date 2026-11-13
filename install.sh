#!/usr/bin/env bash
# One line to a ready AI project on your laptop (macOS, Linux, or WSL on Windows):
#   curl -fsSL https://raw.githubusercontent.com/phall1/tamu-ai-bootstrap/main/install.sh | bash
# Puts it in ~/ai-project (or the folder you name: ... | bash -s -- my-folder),
# then runs bin/setup, which installs everything and opens Claude.
set -euo pipefail
dir="${1:-$HOME/ai-project}"
if ! command -v git >/dev/null; then
  if [ "$(uname -s)" = Darwin ]; then
    xcode-select --install 2>/dev/null || true
    echo "Click Install in the popup, then run this same command again."
  else
    echo "Run this first, then this same command again:"
    echo "  sudo apt-get update && sudo apt-get install -y git curl unzip build-essential"
  fi
  exit 1
fi
if [ -e "$dir" ]; then
  echo "$dir already exists. Open it with: cd $dir && claude"
  exit 0
fi
git clone --quiet https://github.com/phall1/tamu-ai-bootstrap.git "$dir"
cd "$dir"
# Piped from curl, setup still needs the keyboard for logins.
if (exec </dev/tty) 2>/dev/null; then exec bin/setup </dev/tty; fi
exec bin/setup
