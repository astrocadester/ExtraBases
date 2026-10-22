# Extra Bases — memory and I/O

![Extra Bases Z80 CPU memory map](../images/extra-bases-memory-map.png)

## CPU address space

| Address | Reads | Writes |
| --- | --- | --- |
| `$0000–$3FFF` | Program ROM | Function Generator; destination RAM at `$4000 + address` |
| `$4000–$7FFF` | Shared video/work RAM | Shared video/work RAM |
| `$8000–$FFFF` | Unmapped/open bus | Unmapped |

The game sets vertical blanking to `$C0`. The resulting 192-line display occupies `$3C00` bytes: 80 bytes per scanline, four two-bit pixels per byte. The RAM above that display stores the interpreter and game workspace.

| RAM | Use |
| --- | --- |
| `$4000–$7BFF` | 320 × 192 visible framebuffer |
| `$7C00–$7CD9` | Interrupt pointer, random state, sound state, game variables and timers |
| `$7CDA–$7E6C` | Thirteen 31-byte vector records |
| `$7E6D–$7FFF` | Drawing state and parameter/control stack workspace |

Reset initializes `SP=$7F80` and `IX=$8000`. Both allocate downward. `BC` carries the token instruction pointer; `IY=$002B` supplies the native dispatch continuation.

## Vector records

| Record | Base | End | Role |
| --- | --- | --- | --- |
| R1 | `$7CDA` | `$7CF8` | Runner 1 |
| R2 | `$7CF9` | `$7D17` | Runner 2 |
| R3 | `$7D18` | `$7D36` | Runner 3 |
| R4 | `$7D37` | `$7D55` | Runner 4 |
| PT | `$7D56` | `$7D74` | Pitcher |
| 1ST | `$7D75` | `$7D93` | First baseman |
| 2ND | `$7D94` | `$7DB2` | Second baseman |
| SS | `$7DB3` | `$7DD1` | Shortstop |
| 3RD | `$7DD2` | `$7DF0` | Third baseman |
| LF | `$7DF1` | `$7E0F` | Left fielder |
| CF | `$7E10` | `$7E2E` | Center fielder |
| RF | `$7E2F` | `$7E4D` | Right fielder |
| BL | `$7E4E` | `$7E6C` | Ball |

Offsets are hexadecimal. Cell fields are little-endian.

| Offset | Field |
| --- | --- |
| `$00` | Magic/shift bits |
| `$01` | Animation phase |
| `$02–$03` | Animation-group pointer |
| `$04–$05` | Perspective animation-sequence pointer |
| `$06–$07` | Playaction instruction pointer |
| `$08` | Action update counter |
| `$09–$0A` | X velocity |
| `$0B–$0C` | X position |
| `$0D–$0E` | Y velocity |
| `$0F–$10` | Y position |
| `$11` | Entity status |
| `$12` | Base number |
| `$13–$14` | Pattern pointer |
| `$15` | Perspective index |
| `$16–$17` | Saved screen address |
| `$18` | Expansion setting |
| `$19–$1A` | Destination X |
| `$1B–$1C` | Destination Y |
| `$1D` | Runner forward state / ball velocity |
| `$1E` | Runner control bits |

## Foreground requests

The native sentry at `$3E4E` polls these cells before dispatching the corresponding handler.

| RAM | Handler | Request |
| --- | --- | --- |
| `$7C4A` | `$376F` | Button handling when take-field state is zero |
| `$7CD9` | `$2057` | Trackball pitch update |
| `$7CA4` | `$3759` | Outfielder table setup |
| `$7CC3` | `$364A` | Issue ball throw |
| `$7C51` | `$3441` | Throw animation |
| `$7CD2` | `$3709` | Bat-contact processing |
| `$7CD4` | `$3314` | Catch processing |
| `$7CCC` | `$324E` | Scoring-runner processing |

## I/O ports

| Port | Direction | Function |
| --- | --- | --- |
| `$00–$07` | Write | Color palette registers |
| `$08` | Read/write | Collision/commercial display control |
| `$09` | Write | Horizontal color boundary |
| `$0A` | Write | Vertical blanking boundary |
| `$0C` | Write | Function Generator magic settings |
| `$0D` | Write | Interrupt feedback/vector selection |
| `$0E` | Write | Interrupt-mode control |
| `$0F` | Write | Next interrupt scanline |
| `$10–$18` | Write | Sound master, tones, vibrato, volumes, noise, and sound extension |
| `$10/$14` | Read | Pitch/bat buttons and start buttons |
| `$11` | Read | Coins, tilt, monitor/cabinet contacts |
| `$12` | Read | Pricing DIP switches |
| `$13` | Read | Selected trackball delta |
| `$19` | Write | Graphics expansion register |
| `$20` | Write | Coin-counter outputs |
| `$28` | Write | Trackball axis/station selection and delta reference |

Input bits are active-low for buttons, starts, coins, and tilt.

| Input port | Bit | Assignment |
| --- | --- | --- |
| `$10/$14` | 0 | Player 2 pitch/bat button |
| `$10/$14` | 1 | Player 1 pitch/bat button |
| `$10/$14` | 4 | Start 1 |
| `$10/$14` | 5 | Start 2 |
| `$11` | 0 | Coin 1 |
| `$11` | 1 | Coin 2 |
| `$11` | 2 | Tilt |
| `$12` | 0 | Two-player first-inning pricing |

The CPU address-space decode and port assignments follow the [MAME driver](https://github.com/mamedev/mame/blob/master/src/mame/bally/astrocde.cpp). ROM-owned RAM addresses and register initialization are taken directly from `src/eb_disassembly.asm`.
