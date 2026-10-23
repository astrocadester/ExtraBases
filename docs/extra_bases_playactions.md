# Extra Bases — Vector animation and playactions

The vector graphics engine reads animation pointers and playaction data from ROM. The tables below map the released bytes to their drawing and movement roles.

## Erase routine and data boundary

| Range | Contents |
| --- | --- |
| `$0ECC–$0EF8` | `vwrite`: draw a vector and save its screen address |
| `$0EF9–$0F1F` | `verase`: erase the saved vector image; 39 bytes |
| `$0F20–$1110` | Playaction data; 497 bytes |
| `$1111–$1118` | `comphl`: negate HL |

`verase` takes its vector through IX. The saved pattern pointer occupies offsets `$13/$14`; adding two skips the X/Y hotspot. `writep` reads width and height and erases at the saved screen address in offsets `$16/$17`. A zero byte at `$7C0A` returns at `$0F16`. The other path clears magic bit 7, toggles bit 6, stores the result in vector offset `$00`, and returns at `$0F1F`.

## Action format

`OPCODECHK` at `$27A9` compares the next byte with `$28`. Values `$02–$0E` select command handlers through `OPTBL`. An action begins with magic `$28` or `$68` and occupies seven bytes.

| Offset | Size | Field |
| --- | --- | --- |
| `$00` | 1 byte | Function Generator magic |
| `$01` | 1 byte | Animation family index in `PATTERNS` |
| `$02` | 1 byte | Update count |
| `$03` | 2 bytes | Signed fixed-point Y increment, little-endian |
| `$05` | 2 bytes | Signed fixed-point X increment, little-endian |

`LOADANM` at `$27C4` stores magic and the selected animation table. `ANMSEQLOAD` at `$27DA` selects the perspective sequence. `PACTLOAD` at `$27ED` loads timing and velocity into the vector and advances its playaction pointer. The retain-delta flag at `$7CA5` skips a record while preserving those fields. The shared action pointer is `$7C8C`.

`PATFETCH` at `$282C` advances the animation phase and stores the bitmap pointer. `PLAYACT` at `$2861` runs the update pipeline for the vector selected through `$7C93`, preserves BC/IX, and returns at `$2886`.

## Commands

`OPTBL` occupies `$278F–$27A8`. The index is the command byte minus `$02`.

| Command | Handler | Address | Action |
| --- | --- | --- | --- |
| `$02` | `ON1ST` | `$2494` | Record first-base fielder |
| `$03` | `ON2ND` | `$249B` | Record second-base fielder |
| `$04` | `ON3RD` | `$24A2` | Record third-base fielder |
| `$05` | `OFMOTION` | `$2761` | Select outfielder trackball action |
| `$06` | `BLMOTION` | `$2788` | Select ball trackball action |
| `$07` | `FLDDST` | `$2556` | Move fielder to field destination |
| `$08` | `RUNDST` | `$262F` | Move runner to destination |
| `$09` | `OFFFDST` | `$25B5` | Move outfielder to field destination |
| `$0A` | `BLDST` | `$24A9` | Move ball to destination |
| `$0B` | `THWANMSET` | `$2481` | Start throw animation |
| `$0C` | `DEACTIVATE` | `$2470` | Clear active status; retain motion delta |
| `$0D` | `WAITTHRW` | `$2773` | Start throw setup and first-base wait |
| `$0E` | `STOP_ACTION` | `$247A` | Select standing action at NOACTPA |

Command `$0E` selects `NOACTPA` at `$0F36`: a standing action followed by `$0C` deactivation. This shared record provides the stop sequence used throughout the playaction tables.

## Playaction tables

The region contains 64 action records and 49 command bytes. Source-block references identify the corresponding TERSE definitions. The disassembly retains the ROM's update counts and command sequences.

| Table | ROM range | TERSE block |
| --- | --- | --- |
| `RUNBPA` | `$0F20–$0F20` | 226 |
| `OFFFPA` | `$0F21–$0F21` | 226 |
| `TFPA` | `$0F22–$0F22` | 226 |
| `OFTBLPA` | `$0F23–$0F23` | 226 |
| `TFPA1` | `$0F24–$0F2B` | 226 |
| `TFPA2` | `$0F2C–$0F33` | 226 |
| `THWBLPA` | `$0F34–$0F34` | 226 |
| `PITCHBLPA` | `$0F35–$0F35` | 226 |
| `NOACTPA` | `$0F36–$0F3D` | Standing action selected by $0E |
| `HL1ST` | `$0F3E–$0F4D` | 226 |
| `HL2ND` | `$0F4E–$0F5D` | 226 |
| `HRSS` | `$0F5E–$0F6D` | 226 |
| `HR3RD` | `$0F6E–$0F7D` | 226 |
| `HLPT` | `$0F7E–$0F8C` | 226 |
| `HRPT` | `$0F8D–$0F9B` | 226 |
| `PITCHPA` | `$0F9C–$0FAA` | 227 |
| `RTHWPA` | `$0FAB–$0FB2` | 227 |
| `LTHWPA` | `$0FB3–$0FBA` | 227 |
| `FBLR1ST` | `$0FBB–$0FCA` | 227 |
| `FBLL3RD` | `$0FCB–$0FDA` | 227 |
| `HLL3RD` | `$0FDB–$0FF1` | 227 |
| `F3RDR3RD` | `$0FF2–$0FF9` | 227 |
| `F3RDL3RD` | `$0FFA–$1001` | 227 |
| `F3RDLSS` | `$1002–$1009` | 227 |
| `HL3RD` | `$100A–$1020` | 227 |
| `HLSS` | `$1021–$1028` | 228 |
| `FSSRSS` | `$1029–$1030` | 228 |
| `FSSLSS` | `$1031–$1038` | 228 |
| `HMSS` | `$1039–$1040` | 228 |
| `F2NDR2ND` | `$1041–$1048` | 228 |
| `F2NDL2ND` | `$1049–$1050` | 228 |
| `HR2ND` | `$1051–$1058` | 228 |
| `HR1ST` | `$1059–$106F` | 228 |
| `F1STR1ST` | `$1070–$1077` | 228 |
| `F1STL1ST` | `$1078–$107F` | 228 |
| `HRL1ST` | `$1080–$1087` | 228 |
| `F1STPT` | `$1088–$1097` | 228 |
| `HLOUTSSPA` | `$1098–$109F` | 228 |
| `HROUT2NDPA` | `$10A0–$10A7` | 228 |
| `PFB` | `$10A8–$10AE` | 229 |
| `PSB` | `$10AF–$10B5` | 229 |
| `PSU` | `$10B6–$10C3` | 229 |
| `PSD` | `$10C4–$10D1` | 229 |
| `PCO` | `$10D2–$10E6` | 229 |
| `PICI` | `$10E7–$10FB` | 229 |
| `PICO` | `$10FC–$1110` | 229 |

The ROM uses 11 updates for `F2NDR2ND` and 12 for `F2NDL2ND`. The TERSE definitions contain hexadecimal `$0C` and `$0D`, respectively. Several throw sequences end directly with `$0B` or `$0D`; their native handlers select the standing action. The TERSE source remains unchanged.

## Base destinations

`BSRTBL` at `$2460–$246F` supplies four (Y, X) coordinate pairs to runner destination handling. Each coordinate is a little-endian fixed-point cell.

| Base | Y | X |
| --- | --- | --- |
| First | `$3E80` | `$6100` |
| Second | `$2800` | `$4700` |
| Third | `$11C0` | `$6300` |
| Home | `$2800` | `$A600` |

## Animation pointer tables

The 37 tables at `$088D–$0958` contain little-endian addresses. Pattern pairs select bitmap assets. Perspective tables select those pairs. The 11-cell `PATTERNS` matrix at `$0943` selects a family: running, fielding, throwing, covering a base, standing, hidden, ball, standing cover, standing pitcher, pitching, and on-base figures.

| Table | ROM range | TERSE block |
| --- | --- | --- |
| `RUNUP0` | `$088D–$0890` | 186 |
| `RUNUP1` | `$0891–$0894` | 186 |
| `RUNUP2` | `$0895–$0898` | 186 |
| `RUNUP3` | `$0899–$089C` | 186 |
| `RUNUP4` | `$089D–$08A0` | 186 |
| `FLDUP1` | `$08A1–$08A4` | 186 |
| `FLDUP2` | `$08A5–$08A8` | 186 |
| `NOBOD0` | `$08A9–$08AC` | 186 |
| `BALL0` | `$08AD–$08B0` | 186 |
| `ONBS1` | `$08B1–$08B4` | 186 |
| `ONBS2` | `$08B5–$08B8` | 186 |
| `THRWUP1` | `$08B9–$08BC` | 187 |
| `THRWUP2` | `$08BD–$08C0` | 187 |
| `THRWUP3` | `$08C1–$08C4` | 187 |
| `THRWUP4` | `$08C5–$08C8` | 187 |
| `PTTHW1` | `$08C9–$08CC` | 187 |
| `STCB1` | `$08CD–$08D0` | 187 |
| `STCB2` | `$08D1–$08D4` | 187 |
| `STND1` | `$08D5–$08D8` | 188 |
| `STND2` | `$08D9–$08DC` | 188 |
| `STND3` | `$08DD–$08E0` | 188 |
| `STND4` | `$08E1–$08E4` | 188 |
| `STPT1` | `$08E5–$08E8` | 188 |
| `CVRBUP1` | `$08E9–$08EC` | 188 |
| `CVRBUP2` | `$08ED–$08F0` | 188 |
| `BALLM` | `$08F1–$08FA` | 188 |
| `STCB` | `$08FB–$0900` | 188 |
| `STNDPT` | `$0901–$0904` | 188 |
| `PTPT` | `$0905–$0908` | 188 |
| `ONBASE` | `$0909–$090E` | 188 |
| `CVRBUP` | `$090F–$0914` | 189 |
| `THRWUP` | `$0915–$091E` | 189 |
| `NOBODY` | `$091F–$0928` | 189 |
| `RUNUP` | `$0929–$0932` | 189 |
| `FLDUP` | `$0933–$0938` | 189 |
| `STNDS` | `$0939–$0942` | 189 |
| `PATTERNS` | `$0943–$0958` | 189 |

`ENDMUSIC` begins at `$0959`, immediately after `PATTERNS`. It clears the A/B and noise/C volume registers, clears all three tone periods, and executes the end command. Its branch at `$0964` yields between ticks and returns to itself.

## Pixel previews

Every preview uses ROM bit 7 as the leftmost pixel and bit 0 as the rightmost pixel. `#` marks a set bit and `.` marks a clear bit. Large-font records show all ten rows beside individual `DB` bytes. Small text separates four-bit character cells; inning digits use eight-bit cells. Spaces between preview groups add no pixels.

`YOU ARE` at `$0498–$04AB` is 32 bits wide and five rows high. Its rows contain eight four-bit cells: Y, O, U, space, A, R, E, and trailing padding. `tools/verify_graphics.py` checks all 824 preview rows against their literal bytes. The ROM verifier confirms that the assembled bytes match the original archive.
