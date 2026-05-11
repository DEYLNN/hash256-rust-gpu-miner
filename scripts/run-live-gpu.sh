#!/usr/bin/env bash
set -euo pipefail
if ! grep -q '^SUBMIT=true' .env 2>/dev/null; then
  echo "Refusing live run: set SUBMIT=true in .env explicitly."
  exit 1
fi
GPU=1 cargo run --release
