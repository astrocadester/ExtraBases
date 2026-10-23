#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
zmac_bin="${ZMAC:-zmac}"
if [[ -z "${ZMAC:-}" && -x tools/zmac ]]; then zmac_bin=tools/zmac; fi
if ! command -v "$zmac_bin" >/dev/null 2>&1; then
    echo 'zmac 1.3 is required. Set ZMAC to its executable path.' >&2
    exit 1
fi
mkdir -p src/zout
"$zmac_bin" -o src/zout/eb_disassembly.bin -x src/zout/eb_disassembly.lst src/eb_disassembly.asm
python3 tools/verify_roms.py src/zout/eb_disassembly.bin
python3 tools/verify_graphics.py
