#!/usr/bin/env bash
# Extra Bases ROM build — zmac v1.3; no Python.
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

fail() { echo "ERROR: $*" >&2; exit 1; }
for cmd in dd sha1sum zip stat; do command -v "$cmd" >/dev/null 2>&1 || fail "Missing command: $cmd"; done
if [[ -n "${ZMAC:-}" ]]; then
    zmac_bin="$ZMAC"
elif [[ -x tools/zmac ]]; then
    zmac_bin=tools/zmac
else
    zmac_bin=zmac
fi
command -v "$zmac_bin" >/dev/null 2>&1 || fail 'zmac v1.3 not found (set ZMAC or install tools/zmac)'
[[ -f src/eb_disassembly.asm ]] || fail 'Missing src/eb_disassembly.asm'

rom_names=(m761a m761b m761c m761d)
rom_sha1=(
    6483ca1359b675b0dd739605db2a1dbd4b7fb8cb
    52e571e671fa61b0f9ab397a5947094c24f6c388
    e41fb9db919039c8a48b4caebf80821a066d7ccf
    e60c3f4b075f8b811ff6a8637c4aa0b089847a82
)

echo 'Extra Bases ROM build'
echo '[1/4] Prepare output'
mkdir -p src/zout roms
rm -f src/zout/eb_disassembly.cim src/zout/eb_disassembly.lst roms/ebases.zip
for name in "${rom_names[@]}"; do rm -f "roms/$name"; done

echo '[2/4] Assemble Z80 source (zmac v1.3)'
"$zmac_bin" -o src/zout/eb_disassembly.cim -x src/zout/eb_disassembly.lst src/eb_disassembly.asm || fail 'Assembly failed'
[[ -s src/zout/eb_disassembly.cim ]] || fail 'Assembler did not produce a binary image'
size=$(stat -c %s src/zout/eb_disassembly.cim)
(( size >= 16384 )) || fail "Binary image is $size bytes; 16384 required"

echo '[3/4] Split and verify 4 KB ROMs'
for i in 0 1 2 3; do
    name=${rom_names[i]}
    dd if=src/zout/eb_disassembly.cim of="roms/$name" bs=4096 skip="$i" count=1 status=none
    size=$(stat -c %s "roms/$name")
    (( size == 4096 )) || fail "$name is $size bytes; expected 4096"
    actual=$(sha1sum "roms/$name"); actual=${actual%% *}
    [[ "$actual" == "${rom_sha1[i]}" ]] || fail "$name SHA1 mismatch: expected ${rom_sha1[i]}, got $actual"
    echo "  $name  OK  $actual"
done

echo '[4/4] Package roms/ebases.zip'
(cd roms && zip -q -X ebases.zip "${rom_names[@]}") || fail 'ZIP packaging failed'
[[ -s roms/ebases.zip ]] || fail 'ROM ZIP was not created'
echo 'Build complete: roms/ebases.zip'
