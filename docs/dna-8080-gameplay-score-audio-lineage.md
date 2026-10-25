# Earlier DNA 8080 score/audio lineage versus Extra Bases Z80

This is an evidence-controlled follow-on to [the 1978 historical source crosswalk](dna-8080-historical-source-crosswalk.md).

## Earlier 8080 machines — ROM-confirmed

| Native property | Double Play (1977) | Extra Inning (1978) |
|---|---|---|
| Token $16 score/display handler | $173A | $18C0 |
| Score/status record increment | **4 bytes** at $1771 | **5 bytes** at $18F7 |
| Sound countdown routine | $1861 | $19F6 |
| Music data stream pointer | RAM $2029 | RAM $202C |
| Music output ports | $05 / $06 | $05 / $06 |
| Identical sound-table prefix | ROM $18DE | ROM $1A73 |

The surviving original Extra Inning source fragment calls ports $05 and $06 `MUP1` and `MUP2`. The game code independently confirms those outputs. The two games also share at least the initial 16 bytes of music control table data. Their sound counters, RAM pointers and ROM handlers are relocated.

## What to compare in 1980 Z80/TERSE without assuming identical encoding

Extra Bases is not a bytewise continuation of the Intel 8080 source. Its own [ROM map](extra_bases_rom_map.md) and [playaction documentation](extra_bases_playactions.md) establish distinct systems:

- Target TERSE uses 172 token-address entries and executes with Z80 BC as instruction pointer.
- Music processor reads stream pointer RAM **$7C1C** (defined as `RAM_MUSPC` in `src/extra_bases.inc`); named score streams include `BALLSCORE`, `COINSCORE`, `FOULSCORE`, `CRACKSCORE`, `FENCESCORE`, `TAKE_ME`, `SAFESCORE`, and `OUTSCORE`.
- Its 13 object vectors are **31 bytes**, not the 46-byte 8080 family ABI.
- The 1980 native sentry controls gameplay event servicing, while TERSE words manage higher-level scoring and game decisions.

**Hypothesis to test next:** whether timer and music-stream *semantics* for strike, out, collision, ball motion and audience response were retained after the processor migration. We should trace stream-command writers and callback conditions within the 1980 disassembly, not transplant the 1978 timer constants or port assignments blindly.

No executable source, ROM assets or interpreter definitions are changed in this research stage.
