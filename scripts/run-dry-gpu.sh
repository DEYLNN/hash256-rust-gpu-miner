#!/usr/bin/env bash
set -euo pipefail
GPU=1 SUBMIT=false cargo run --release
