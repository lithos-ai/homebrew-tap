# lithos-metal Homebrew tap

Install [lithos-metal](https://github.com/lithos-ai/lithos-metal), local LLM inference on Apple silicon:

```bash
brew install lithos-ai/tap/lithos-metal
lithos-metal serve --model nvidia/Qwen3.8-27B-NVFP4
```

Requires Apple silicon and macOS 26 or later. Homebrew installs Python 3.12 and the precompiled runtime; no local compiler is needed. Model downloads happen on first use. The matching LithosAI NVFP4 DSpark head is enabled automatically for the supported 27B and 35B-A3B targets, using seven proposals plus an anchor.

From another terminal, connect an installed coding agent:

```bash
lithos-metal opencode
lithos-metal claude
lithos-metal codex
lithos-metal hermes
```

The validated large-model setup is a 40-core M5 Max with 48 GB memory. See the [serving guide](https://github.com/lithos-ai/lithos-metal/blob/main/docs/serving.md) for supported chips, options, and current API/model limitations.

## Updating

```bash
brew update
brew upgrade lithos-ai/tap/lithos-metal
```

The formula pins the exact release archive with SHA-256. Each tap update is tested with `brew install` and `brew test` on macOS ARM64. Model weights and licenses are distributed separately on Hugging Face.
