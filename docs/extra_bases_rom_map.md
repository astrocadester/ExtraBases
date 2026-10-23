# Extra Bases — ROM map

The 16 KB image is mapped at `$0000–$3FFF`. Addresses identify the released ROM bytes.

## Animation and playaction data

| Range | Contents |
| --- | --- |
| `$02D1–$0438` | Large character font; 36 ten-row glyphs |
| `$0439–$04AB` | Six small-text bitmaps |
| `$088D–$0942` | Animation sequences and perspective pointer tables |
| `$0943–$0958` | `PATTERNS`; 11 animation-family pointers |
| `$0959–$0966` | `ENDMUSIC`; silence and termination commands |
| `$0EF9–$0F1F` | `verase`; saved-vector erase routine |
| `$0F20–$1110` | 46 playaction tables; 64 actions and 49 commands |
| `$2460–$246F` | `BSRTBL`; four base destination coordinate pairs |
| `$278F–$27A8` | `OPTBL`; 13 native command-handler pointers |
| `$27A9–$27C3` | `OPCODECHK`; command dispatch |
| `$27C4–$27D9` | `LOADANM`; magic and animation family selection |
| `$27DA–$27EC` | `ANMSEQLOAD`; perspective selection |
| `$27ED–$282B` | `PACTLOAD`; timing, velocity, and next action pointer |
| `$282C–$2860` | `PATFETCH`; animation phase and bitmap selection |
| `$2861–$2886` | `PLAYACT`; vector animation update pipeline |

The [vector animation and playaction reference](extra_bases_playactions.md) lists each table, record format, and command target.

## Interpreter and native entries

| Address | Symbol |
| --- | --- |
| `$0008` | `_ENTER` |
| `$0015` | `_WARM_START` |
| `$001B` | `_INIT_STACK_LOOP` |
| `$002B` | `_NEXT` |
| `$003A` | `_RETURN` |
| `$0046` | `_LITERAL` |
| `$004F` | `_LITbyte` |
| `$0057` | `_DLIT` |
| `$0061` | `_plusbang` |
| `$006C` | `_ARRAY` |
| `$0071` | `_0` |
| `$0077` | `_1` |
| `$007D` | `_DUP` |
| `$0082` | `_2DUP` |
| `$008A` | `_DROP` |
| `$008D` | `_SWAP` |
| `$0093` | `_at` |
| `$009A` | `_Bat` |
| `$00A1` | `_bang` |
| `$00A8` | `_Bbang` |
| `$00AD` | `_ZERO` |
| `$00B5` | `_plus` |
| `$00BB` | `_minus` |
| `$00C3` | `_1minus` |
| `$00C8` | `_1plus` |
| `$00CD` | `_2plus` |
| `$00D3` | `_2minus` |
| `$00D9` | `_2star` |
| `$00DE` | `_2slash` |
| `$00E6` | `_COUNT` |
| `$00F2` | `_1plusBat` |
| `$00F6` | `_equal` |
| `$0105` | `_not_equal` |
| `$0114` | `_less_than` |
| `$0128` | `_gt_equal` |
| `$013C` | `_greater_than` |
| `$0141` | `_zeroequal` |
| `$0147` | `_AND` |
| `$0152` | `_OR` |
| `$015D` | `_XOR` |
| `$0168` | `_BMOVE` |
| `$0176` | `_DO` |
| `$0191` | `_LOOP` |
| `$01BF` | `_Rat` |
| `$01C8` | `_OVER` |
| `$01CF` | `_SWAB` |
| `$01D6` | `_OUTP` |
| `$01DE` | `_INP` |
| `$01E8` | `_ROT` |
| `$01EF` | `_PICK` |
| `$01F9` | `_BRANCH` |
| `$0201` | `_0BRANCH` |
| `$020B` | `_BRANCH_TAKEN` |
| `$020E` | `_Aquote` |
| `$0219` | `_SSTORE` |
| `$021D` | `_SBSTORE` |
| `$0221` | `_ENDINT` |
| `$022D` | `_INTSTART` |
| `$0243` | `_DI` |
| `$0246` | `_EI` |
| `$0249` | `_SWABN` |
| `$0253` | `_FILL` |
| `$0260` | `_NPICK` |
| `$0269` | `_NPICK_LOOP` |
| `$0275` | `_RND` |
| `$02AF` | `_MULU_LOOP` |
| `$02BB` | `_MULU_SKIP` |
| `$02CD` | `_MULU_DONE` |
| `$0D08` | `relabs` |
| `$0D44` | `reloff` |
| `$0D74` | `write` |
| `$0DF4` | `writep` |
| `$0E01` | `_WRITE` |
| `$0E19` | `_WRITR` |
| `$0E31` | `cpost` |
| `$0ECC` | `vwrite` |
| `$0EF9` | `verase` |
| `$185E` | `_FMIRROR` |
| `$2057` | `_TBALLPITCH` |
| `$324E` | `chkscrtime` |
| `$329F` | `resetrunners` |
| `$3314` | `chkcaught` |
| `$3441` | `throwanim` |
| `$364A` | `throwball` |
| `$3709` | `bathit` |
| `$3759` | `ofldtbl` |
| `$376F` | `buttonchk` |
| `$3E11` | `_TERSECHK` |
| `$3E4E` | `_SENTRY` |
| `$3EA7` | `TOKEN_TABLE` |

## TERSE source matches

The complete token structure of these definitions matches the named TERSE body. Inline ROM/RAM addresses remain tied to the released image.

| ROM range | Definition | TERSE block |
| --- | --- | --- |
| `$0219–$021C` | `S!` | 304 |
| `$021D–$0220` | `SB!` | 304 |
| `$0E85–$0E89` | `3DROP` | 248 |
| `$0E8A–$0E8D` | `CPOST` | 248 |
| `$0E9A–$0EBC` | `dpost` | 249 |
| `$0EBD–$0ECB` | `NPOST` | 249 |
| `$112E–$1131` | `BONE` | 233 |
| `$1132–$1135` | `BZERO` | 233 |
| `$1136–$1148` | `WUPGO` | 233 |
| `$1268–$1276` | `WUPWRT` | 238 |
| `$1277–$1290` | `CHGS` | 238 |
| `$129B–$12A8` | `FLSHTON` | 239 |
| `$17D7–$17F2` | `OUTLINE` | 272 |
| `$1A8B–$1AA8` | `RUN3CHK` | 168 |
| `$1AA9–$1AC0` | `RUN2CHK1ST` | 168 |
| `$1AC1–$1AD8` | `RUN2CHK` | 168 |
| `$1AD9–$1AF6` | `RUN2CHK12ND` | 168 |
| `$1AF7–$1B09` | `RUN1CHK2ND` | 168 |
| `$1B0A–$1B20` | `RUN1CHK1ST` | 168 |
| `$1B21–$1B2B` | `HRBY2` | 169 |
| `$1B2C–$1BA5` | `WHBODDS` | 169 |
| `$1CA7–$1CAA` | `2ROT` | 178 |
| `$1CAB–$1CB9` | `SSAFE` | 178 |
| `$1CBA–$1CC7` | `SFOUL` | 178 |
| `$1D01–$1D0D` | `SWALK` | 179 |
| `$1DD1–$1DDA` | `DOHOMER` | 180 |
| `$1DDB–$1DF1` | `SGO` | 181 |
| `$1EE1–$1EF4` | `FOULTIME` | 182 |
| `$1F66–$1F93` | `STRINGPRC` | 184 |
| `$29F6–$2A1A` | `RETPA` | 213 |
| `$2A1B–$2A76` | `SETTFPA` | 213 |
| `$2A77–$2A7D` | `STFLD` | 214 |
| `$2FB8–$2FE9` | `DP1CN` | 305 |
| `$2FEA–$3027` | `DP12CN` | 305 |
| `$3028–$304F` | `DPCN` | 305 |
| `$36B7–$3708` | `INNODDS` | 123 |
| `$3912–$3966` | `CONGR` | 127 |
| `$39AD–$39C8` | `DP1` | 127 |
| `$39C9–$3A32` | `TCNT` | 128 |
| `$3A33–$3A55` | `SPLR12` | 128 |

## Pattern assets

Rows are one-bit source patterns. The Function Generator expands them into framebuffer pixels. Header-bearing records begin with X/Y hotspot, row width, and row count. UPTRI, DNTRI, and IMRK are headerless.

| ROM range | Pattern | Width × rows | TERSE block |
| --- | --- | --- | --- |
| `$04AC–$04B1` | `NOBOD` | 1 × 2 bytes | 107 |
| `$04B2–$04B9` | `BALLPAT` | 2 × 2 bytes | 107 |
| `$04BA–$04BE` | `UPTRI` | 1 × 5 bytes | 107 |
| `$04BF–$04C3` | `DNTRI` | 1 × 5 bytes | 107 |
| `$04C4–$04C6` | `IMRK` | 1 × 3 bytes | 107 |
| `$04C7–$04E2` | `TUP1M` | 2 × 12 bytes | 108 |
| `$04E3–$04FA` | `TUP2M` | 2 × 10 bytes | 108 |
| `$04FB–$050E` | `TUP3M` | 2 × 8 bytes | 108 |
| `$050F–$051E` | `TUP4M` | 2 × 6 bytes | 108 |
| `$051F–$053E` | `TUP1F` | 2 × 14 bytes | 108 |
| `$053F–$0558` | `TUP2F` | 2 × 11 bytes | 108 |
| `$0559–$056E` | `TUP3F` | 2 × 9 bytes | 108 |
| `$056F–$0580` | `TUP4F` | 2 × 7 bytes | 108 |
| `$0581–$0594` | `RUP3M` | 2 × 8 bytes | 109 |
| `$0595–$05A4` | `RUP4M` | 2 × 6 bytes | 109 |
| `$05A5–$05C4` | `RUP0M` | 2 × 14 bytes | 109 |
| `$05C5–$05E0` | `RUP1M` | 2 × 12 bytes | 109 |
| `$05E1–$05F8` | `RUP2M` | 2 × 10 bytes | 109 |
| `$05F9–$0616` | `RUP0B` | 2 × 13 bytes | 109 |
| `$0617–$062E` | `ONBASE2` | 2 × 10 bytes | 109 |
| `$062F–$0648` | `RUP1B` | 2 × 11 bytes | 110 |
| `$0649–$065E` | `RUP2B` | 2 × 9 bytes | 110 |
| `$065F–$0670` | `RUP3B` | 2 × 7 bytes | 110 |
| `$0671–$0680` | `RUP4B` | 2 × 6 bytes | 110 |
| `$0681–$069C` | `CBUP1` | 2 × 12 bytes | 110 |
| `$069D–$06B6` | `CBUP2` | 2 × 11 bytes | 110 |
| `$06B7–$06D2` | `PTMID` | 2 × 12 bytes | 110 |
| `$06D3–$06EC` | `ONBASE1` | 2 × 11 bytes | 110 |
| `$06ED–$0706` | `FUP1B` | 2 × 11 bytes | 111 |
| `$0707–$071C` | `FUP2B` | 2 × 9 bytes | 111 |
| `$071D–$0736` | `FUP1M` | 2 × 11 bytes | 111 |
| `$0737–$074C` | `FUP2M` | 2 × 9 bytes | 111 |
| `$074D–$0754` | `BATMID` | 2 × 2 bytes | 111 |
| `$0755–$0772` | `BATU45` | 2 × 13 bytes | 111 |
| `$0773–$0788` | `BATU30` | 2 × 9 bytes | 111 |
| `$0789–$07A2` | `BATU90` | 2 × 11 bytes | 111 |
| `$07A3–$07B8` | `BATD30` | 2 × 9 bytes | 112 |
| `$07B9–$07D6` | `BATD45` | 2 × 13 bytes | 112 |
| `$07D7–$07F0` | `BATD90` | 2 × 11 bytes | 112 |
| `$07F1–$0802` | `HOMEPLATE` | 2 × 7 bytes | 112 |
| `$0803–$080E` | `BASEPAT` | 2 × 4 bytes | 112 |
| `$080F–$0818` | `BASE2PAT` | 2 × 3 bytes | 112 |
| `$0819–$0834` | `STN1` | 2 × 12 bytes | 112 |
| `$0835–$084C` | `STN2` | 2 × 10 bytes | 112 |
| `$084D–$0860` | `STN3` | 2 × 8 bytes | 113 |
| `$0861–$0870` | `STN4` | 2 × 6 bytes | 113 |
| `$0871–$088C` | `STNPT` | 2 × 12 bytes | 113 |
| `$16C2–$170D` | `DUGOUT` | 4 × 18 bytes | 270 |

## Music streams

These stream bytes match their TERSE score definitions. Address operands in stream branches point into the ROM music data.

| ROM range | Stream |
| --- | --- |
| `$0A8E–$0AC3` | `BALLSCORE` |
| `$0AC4–$0AE3` | `COINSCORE` |
| `$0AE4–$0B29` | `FOULSCORE` |
| `$0B76–$0B93` | `CRACKSCORE` |
| `$0B94–$0B9A` | `FENCESCORE` |
| `$0B9B–$0C17` | `TAKE_ME` |
| `$0C7E–$0CA8` | `SAFESCORE` |
| `$0CA9–$0CE6` | `OUTSCORE` |

## Runner compaction

`resetrunners` at `$329F` copies later 31-byte runner records into earlier slots and resets R4. The stores at `$32FD`, `$3300`, and `$3303` write R1 status, R3 status, and R3 status again. Those addresses and bytes belong to the released ROM.

## Byte identity

The image SHA1 is `9159c7770da7b693f9c5131453513545d3683831`. `tools/verify_roms.py` verifies all four device CRC32/SHA1 values and compares every byte against `roms/original/ebases.zip` before packaging.
