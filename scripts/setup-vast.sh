#!/usr/bin/env bash
set -euo pipefail
echo "== HASH256 Rust GPU Miner setup =="
if command -v nvidia-smi >/dev/null 2>&1; then nvidia-smi || true; fi
if ! command -v cargo >/dev/null 2>&1; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  source "$HOME/.cargo/env"
fi
sudo apt-get update || apt-get update || true
sudo apt-get install -y ocl-icd-opencl-dev clinfo curl pkg-config build-essential || apt-get install -y ocl-icd-opencl-dev clinfo curl pkg-config build-essential || true
clinfo | head -80 || true
cargo build --release
[ -f .env ] || { cp .env.example .env; chmod 600 .env; echo "Created .env — edit it before live mining."; }
echo "Done. Test dry-run: GPU=1 SUBMIT=false cargo run --release"
