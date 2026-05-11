# HASH256 Rust GPU Miner — Safe Vast.ai Build

Safe-by-default Rust/OpenCL GPU miner for HASH256.

## Safety defaults

- `SUBMIT=false` by default. Found nonces are logged/reported but not submitted.
- `GPU=1` optional; if GPU init/self-test fails, miner falls back to CPU.
- GPU nonce is CPU-verified before tx submission.
- Private key is read from `.env`/env or hidden prompt; never commit `.env`.
- Gas defaults are conservative: `PRIORITY_GWEI=1`, `MAX_FEE_GWEI=30`.

## Vast.ai setup

Use an Ubuntu/CUDA image with NVIDIA drivers/OpenCL.

```bash
git clone https://github.com/DEYLNN/hash256-rust-gpu-miner
cd hash256-rust-gpu-miner
./scripts/setup-vast.sh
nano .env
```

Dry-run GPU test:

```bash
GPU=1 SUBMIT=false cargo run --release
```

Live only after dry-run works and wallet has ETH:

```bash
# edit .env first: SUBMIT=true
./scripts/run-live-gpu.sh
```

## Env

```env
RPC_URL=https://eth-mainnet.g.alchemy.com/v2/YOUR_KEY
PRIVATE_KEY=0xYOUR_PRIVATE_KEY
SUBMIT=false
GPU=1
GPU_BATCH=4194304
GPU_MAX_ROUND_SECS=20
MINER_THREADS=8
REPORT_TITLE=Vast Rust GPU Miner
REPORT_INTERVAL_MS=60000
TELEGRAM_BOT_TOKEN=YOUR_TELEGRAM_BOT_TOKEN
TELEGRAM_CHAT_ID=1370196228
PRIORITY_GWEI=1
MAX_FEE_GWEI=30
GAS_LIMIT_OVERRIDE=
```

## Notes

Use a dedicated wallet per machine/provider. Do not reuse the same private key with `SUBMIT=true` on VPS/HF/Colab/Vast simultaneously.
