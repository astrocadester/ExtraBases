#!/usr/bin/env python3
"""Verify and package the four original Extra Bases ROM devices."""
import argparse
import hashlib
from pathlib import Path
import zipfile
import zlib

ROMS = (
    ('m761a', '34422147', '6483ca1359b675b0dd739605db2a1dbd4b7fb8cb'),
    ('m761b', '4f28dfd6', '52e571e671fa61b0f9ab397a5947094c24f6c388'),
    ('m761c', 'bff6c97e', 'e41fb9db919039c8a48b4caebf80821a066d7ccf'),
    ('m761d', '5173781a', 'e60c3f4b075f8b811ff6a8637c4aa0b089847a82'),
)

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('image', type=Path)
    parser.add_argument('--output', type=Path, default=Path('roms'))
    parser.add_argument('--reference', type=Path, default=Path('roms/original/ebases.zip'))
    args = parser.parse_args()
    image = args.image.read_bytes()
    if len(image) != 0x4000:
        raise SystemExit(f'Image length: {len(image)}; required: 16384')
    parts = []
    with zipfile.ZipFile(args.reference) as reference:
        for index, (name, crc, sha1) in enumerate(ROMS):
            data = image[index * 0x1000:(index + 1) * 0x1000]
            if f'{zlib.crc32(data):08x}' != crc or hashlib.sha1(data).hexdigest() != sha1:
                raise SystemExit(f'{name}: ROM checksum mismatch')
            if data != reference.read(name):
                raise SystemExit(f'{name}: reference archive mismatch')
            parts.append((name, data))
    args.output.mkdir(parents=True, exist_ok=True)
    for name, data in parts:
        (args.output / name).write_bytes(data)
        print(f'{name}: 4096 bytes, CRC32 {zlib.crc32(data):08x}, SHA1 {hashlib.sha1(data).hexdigest()}')
    with zipfile.ZipFile(args.output / 'ebases.zip', 'w', zipfile.ZIP_DEFLATED) as archive:
        for name, data in parts:
            entry = zipfile.ZipInfo(name, (1980, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(entry, data)
    print(f'16 KB image SHA1: {hashlib.sha1(image).hexdigest()}')
    print('All four ROMs match roms/original/ebases.zip byte for byte.')

if __name__ == '__main__':
    main()
