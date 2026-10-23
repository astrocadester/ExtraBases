# Extra Bases Final native reconstruction

`src/terse/extra-bases-final.terse` starts from the preserved `extra-bases-11-20-79.terse`, with reconstruction against this repository's disassembly and released ROMs. No separate 11-29-79 source was found. The original dated file is renamed without changing its bytes.

Build with **Gas Root 1.0 July 82** and **Xc System 1.0 July 82**, using the prepared native FS.XC and Final disk in [Workbench PR #15](https://github.com/lizard43/dnaTERSE-WB/pull/15). The source includes the executable TERSE XC dialect in blocks 34–35 and postfix Z80 target interpreter in blocks 311–345. Game compilation and interpretation remain native TERSE/Z80.

In the Workbench checkout, copy this source to the same `src/terse/extra-bases-final.terse` path, then run:

```sh
node tools/package-extra-bases-final.mjs
node tools/baseball-final-audit.mjs build/extra-bases-final
```

The packer copies source rows onto the native disk. The actual build executes `10 LOAD` and `FLOAD XCBUILD` on the emulated Z80. The Workbench PR contains the source-built BIN/ZIP, blank-output disk and settings, symbols, native transcript and repeatable comparison.

The native object is 16,370 bytes, padded to the 16 KB ROM boundary. It matches 3,570 bytes at the same addresses, up from 1,123. `$0000–$0CE6` matches except for the finalized boot-thread and dispatch-table pointers. All twelve music streams, six fixed HUD bitmaps, 48 patterns, 36 large glyphs and the 497-byte playaction region pass comparison checks. A 1,326-frame board audit exercised Coin and Start with one startup entry and no unmapped accesses.

The complete ROM is not byte-identical: 195 dispatch entries remain against the released 172, and later RAM allocation, vector/helper ordering and source-version differences still require reconstruction. The [Workbench reconstruction record](https://github.com/lizard43/dnaTERSE-WB/blob/codex/extra-bases-final-runtime-re/docs/EXTRA-BASES-FINAL.md) describes the exact changes, native compiler hashes and remaining work.
