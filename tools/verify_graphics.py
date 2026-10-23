#!/usr/bin/env python3
"""Check every inline 1-bit bitmap preview against its emitted DB bytes."""
from pathlib import Path
import re


def verify(source: Path) -> tuple[int, int]:
    rows = pixels = 0
    for number, line in enumerate(source.read_text().splitlines(), 1):
        code, separator, comment = line.partition(';')
        preview = comment.strip()
        if not separator or not re.fullmatch(r'[.# ]+', preview):
            continue
        match = re.fullmatch(r'\s*DB\s+(\$[0-9A-Fa-f]{2}(?:\s*,\s*\$[0-9A-Fa-f]{2})*)\s*', code, re.I)
        if not match:
            raise ValueError(f'{source}:{number}: bitmap preview requires literal DB bytes')
        data = bytes(int(value, 16) for value in re.findall(r'\$([0-9A-Fa-f]{2})', match[1]))
        expected = ''.join(f'{value:08b}' for value in data).translate(str.maketrans('01', '.#'))
        if preview.replace(' ', '') != expected:
            raise ValueError(f'{source}:{number}: bitmap preview does not match DB bytes')
        rows += 1
        pixels += len(expected)
    if not rows:
        raise ValueError(f'{source}: no bitmap previews found')
    return rows, pixels


if __name__ == '__main__':
    root = Path(__file__).resolve().parent.parent
    count, bits = verify(root / 'src/eb_disassembly.asm')
    print(f'Graphics verified: {count} inline rows, {bits} ROM bits (MSB first).')
