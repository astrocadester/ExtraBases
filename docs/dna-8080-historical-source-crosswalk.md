# Historical 1978 source symbols: cross-game archaeology

The **Extra Inning** `ei.b` ROM preserves assembler source at **$52AD–$57FF**. Its original `EQU` expressions supply genuine field-coordinate and hardware names. The source remains available verbatim in [Extra Inning's historical fragment](https://github.com/lizard43/extra-inning/blob/main/src/historical/original-equates-fragment.asm), with [all 64 evaluated definitions](https://github.com/lizard43/extra-inning/blob/codex/historical-baseball-symbol-crosswalk/docs/historical-equate-catalog.md).

## Cross-game historical coordinate evidence

The original source defines `XOFF=4` and `YOFF=3`. For each player position `XP*`, `YP*`, it calculates ball-aligned coordinates `XBP*=XP*-XOFF`, `YBP*=YP*+YOFF`. The eight formula-derived pairs are embedded as executable sprite bytecode in the **1977** and **1978** ROMs.

| Historic pair | X,Y | Mode | Double Play bytecode | Extra Inning bytecode |
|---|---|---|---|---|
| `XBP1/YBP1` | `$C4,$53` | `$E0` | `$1E0B` | `$51B5` |
| `XBPR/YBPR` | `$DC,$23` | `$E0` | `$1E13` | `$51BD` |
| `XBP2/YBP2` | `$9C,$31` | `$E0` | `$1E29` | `$51D3` |
| `XBPC/YBPC` | `$7C,$04` | `$E0` | `$1E31` | `$51DB` |
| `XBP3/YBP3` | `$54,$31` | `$E0` | `$1E39` | `$51E3` |
| `XBPL/YBPL` | `$1C,$23` | `$C0` | `$1E41` | `$51EB` |
| `XBP4/YBP4` | `$2C,$53` | `$C0` | `$1E49` | `$51F3` |
| `XBP5/YBP5` | `$7D,$7D` | `$C0` | `$1E51` | `$51FB` |

Example: `XP1=$C8`, `YP1=$50`, so `XBP1=$C8-4=$C4`, `YBP1=$50+3=$53`. Both games execute the sprite-update instruction `13 96 22 20 C4 53 E0` at the corresponding table locations.

The source also defines `XP4=(-XP1-8) AND $FF=$30` and `XPR=(-XPL) AND $FF=$E0`, proving 8-bit coordinate mirroring in the 1978 historical formulas. `XBB2/YBB2` computes **$7D/$3F**, used in two sprite packets in each of the 1977/1978 original ROMs.

## Original hardware names: historical reference

| Historical name | Value | Original source comment |
|---|---:|---|
| `SAP` | `$01` | SHIFT AMT |
| `SOP` | `$02` | SHIFT DATA |
| `SIP` | `$03` | SHIFT IN |
| `SNDP` | `$03` | SOUNDS |
| `WDOG` | `$04` | watch-dog name (EQU mnemonic) |
| `MUP1` / `MUP2` | `$05` / `$06` | MUSIC PORT |
| `P2IP` / `P1IP` | `$00` / `$01` | PLAYER 2 / PLAYER 1 |
| `SETP` | `$02` | OPERATOR SETTINGS |
| `BALLD` | `$50` | BALL DIST FOR PITCH |
| `BPOS` | `$2C` | BAT ADDER |
| `SEC` | decimal 60 | timer tick-scale constant |
| `TBALL` / `THIT` | 7 / 1 | BALL SOUND TIME / HIT SOUND TIME |
| `TSTRK` / `TCRDC` | 30 / 240 | STRIKE / CROWD SOUND TIME |

Note the original assembler spelling `SIP` and `SNDP` both refer to I/O number 3 with separate read/write semantics. The numbered ports are hardware-facing. Reuse of a number across games is address evidence; identifying the corresponding action requires checking the game's native routines.

## Distinguishing 8080 inheritance from Z80 redesign

**Tornado Baseball (1976)** has a 26-token native interpreter, 46-byte objects, ROM bytecode and 8080 input/output routines. **Double Play (1977)** and **Extra Inning (1978)** share an evolved 28-token interpreter and identical source-derived baseball coordinates.

**Extra Bases (1980)** uses a different Z80/TERSE runtime with 172 token entries and thirteen **31-byte** vector records. Its actual source has separately labeled `VEC_PT`, `VEC_FIRST`, `VEC_SECOND`, `VEC_SS`, `VEC_THIRD`, `VEC_LF`, `VEC_CF` and `VEC_RF`, as well as `BALLPAT`, `BASEPAT`, `BASE2PAT`, and `HOMEPLATE`. These are game-domain correspondences for subsequent state-machine and graphics comparisons; they are not assumed equal-address 8080 game structures.

The historical symbol table helps link baseball *roles* (pitcher, infielders, outfielders, ball placement, base positions) across CPU generations while respecting each board's coordinate system and object ABI.

## Extra Bases: Z80 and TERSE crosswalk

The [native Z80 disassembly](../src/eb_disassembly.asm) and [hardware equates](../src/extra_bases.inc) document a 1980 game with a completely different runtime implementation. Its byte-token TERSE interpreter uses `_NEXT` at $002B and a 172-cell dictionary at $3EA7. Its 13 game vectors are **31 bytes** each, with the pitcher at `VEC_PT=$7D56`, first baseman `VEC_FIRST=$7D75`, second baseman `VEC_SECOND=$7D94`, shortstop `VEC_SS=$7DB3`, third baseman `VEC_THIRD=$7DD2`, and outfielders `VEC_LF=$7DF1`, `VEC_CF=$7E10`, `VEC_RF=$7E2F`. The ball is `VEC_BL=$7E4E`.

The preserved older source provides historical field *roles* and formulas: `XP1–XP5`, `XPL/XPC/XPR` and derived ball-centered `XBP1–XBP5`, `XBPL/XBPC/XBPR`, plus base positions `XB1/YB1` and `XB2/YB2`. The 1980 Z80 implementation names `BALLPAT`, `BASEPAT`, `BASE2PAT` and `HOMEPLATE` in its graphics tables.

**Next RE comparison:** recover TERSE definitions that allocate and position each fielder, calculate ball/collision offsets, and schedule pitch/throw/hit sounds. Compare those functions and symmetry formulas to the eight proven 1977/78 coordinate pairs, including unit scale, hotspot offsets and score-control roles. Keep Z80 hardware port names and vector addresses distinct from the earlier Midway 8080 hardware.
