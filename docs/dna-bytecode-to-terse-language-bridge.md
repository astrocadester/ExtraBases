# Recovering DNA's pre-TERSE language and testing its relationship to TERSE

The earlier **Tornado Baseball (1976)** 8080 game used a script VM with **26 native commands**, indexed by a one-byte opcode. **Double Play (1977)** and **Extra Inning (1978)** expanded it to **28 commands**. In those games the script instruction pointer lives in RAM $2000; each opcode less than $1C is translated by a fixed table of 28 native-handler pointers. Values $1C and greater hand execution to native frame scheduling.

This model is observable in the actual 8080 ROMs and is recoverable using the executable original-ROM language reconstruction tools:
- [Double Play: full 28-word table and reversible source listing](https://github.com/lizard43/double-play/blob/codex/baseball-gameplay-native-lineage/docs/pre-terse-bytecode-language.md)
- [Extra Inning: full 28-word table and reversible source listing](https://github.com/lizard43/extra-inning/blob/codex/baseball-gameplay-native-lineage/docs/pre-terse-bytecode-language.md)
- [1976–80 evolution audit](https://github.com/lizard43/tornado-baseball/blob/codex/baseball-gameplay-native-lineage/docs/pre-terse-language-evolution.md)

## Exact runtime boundary

| Mechanism | 1977/78 Intel 8080 game VM | 1978 Sea Wolf II Z80/TERSE | 1980 Extra Bases TERSE |
|---|---|---|---|
| Next instruction | Fetch one-byte command through RAM $2000 | `LD A,(BC); INC BC; LD L,A; LD A,(BC); INC BC; LD H,A; JP (HL)` | Native threaded NEXT and compiled TERSE words |
| Dictionary | Fixed 28 × 16-bit handler-pointer array | Addresses embedded directly in threaded execution stream | Target runtime dictionary/compiled words |
| Code-level call | Inline native transfer opcode $1A | Native/colon threaded definitions | `CODE` and compiled definitions |
| Callback | One-word inline callback setup $1B | IX holds threaded control returns | Higher-level TERSE sentry and native service control |
| Game graphics | Specialized native create/update/OR/text commands | Native game words accessed from threads | TERSE vector words, bitmaps and VGS calls |
| Music | Predefined native event-stream table, outputs $05/$06 | Board-specific native sound | `BTABLE` sound programs + `MUSCPU` processor |

The *source language* used to author the 1976–78 bytecode programs has **not been recovered verbatim**. The reconstructed command names are functional translations of the binary opcodes, not confirmed DNA words. The original 1978 `EQU` source fragment preserves exact player coordinates, offset formulas and hardware equates, which the games used as bytecode operands.

## Actual 1980 original TERSE evidence

From [original source blocks](../src/terse/extra-bases.terse):

- **Block 114**, `CODE CHKSCRTIME`, accesses `PLAYON`, `VLENGTH` and `SCRTIME`, and dispatches game scoring/process-control based on hitting state. A dedicated score-processing native definition exists in the *new* compiler model.
- **Block 134** creates named sound programs `BTABLE STRIKESCORE` and `BTABLE BALLSCORE`, with `MASTER`, `ABVOLS`, `VIBS` and typed note-command emission.
- **Block 140** creates `BTABLE SAFESCORE` and `BTABLE OUTSCORE`.
- **Block 141** defines music processor command byte emitters and `MUSPC` as a variable.
- **Block 143** defines `CODE MUSCPU`, including `NOTETIMER`, `FETCH`, `INCPC` and native processing branches.

The new `tools/trace_gameplay_terse.py` indexes and validates those numbered source blocks and emits a machine-readable recovered source graph for comparison.

## Supported versus unsupported historical claims

**Supported:** In both generations DNA authored higher-level game behavior using a compact executable representation, implemented native functions for graphics/sound/score scheduling, and encoded reusable program-like actions. The older command set changed from 26 to 28 words between 1976 and 1977; Extra Inning's native code and source-value formulas provide direct evidence of continuity across 1977–1978.

**Not supported:** That the 8080 bytecode VM had a Forth data stack, the exact mnemonic names of original DNA's 8080 game source syntax, that a particular 8080 opcode was directly transplanted into TERSE, or that TERSE was assembled from the old interpreter's actual source. Those need archival assembler/macro source or a stronger binary lineage trace.

The strongest connection presently demonstrated is the **programming architecture**—using a small game-specific interpreted language over reusable native services—rather than reuse of native interpreter implementation.
