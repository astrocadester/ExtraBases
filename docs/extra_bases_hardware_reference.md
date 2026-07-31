# Extra Bases Dual Memory & Hardware Blueprint

```text
       SYSTEM MEMORY MAP                       HARDWARE ROM SOCKETS
┌─────────────────────────┐ $FFFF      ┌─────────────────────────┐ $FFFF
│     NOT ADDRESSABLE     │            │     NOT ADDRESSABLE     │
│    (NO DECODE LOGIC)    │            │    (NO DECODE LOGIC)    │
└─────────────────────────┘ $8000      └─────────────────────────┘ $8000
┌─────────────────────────┐ $7FFF      ┌─────────────────────────┐ $7FFF
│ Parameter & Return Stks │            │      Onboard SRAM       │
│ (PSP SP=$7F80/RSP=IX)   │            │ (CPU Board A082-91354)  │
└─────────────────────────┘ $7C00      └─────────────────────────┘ $7C00
┌─────────────────────────┐ $7F7F      ┌─────────────────────────┐ $7BFF
│   TERSE & System Work   │            │                         │
│ (Vectors/Flags/Buffers) │            │                         │
└─────────────────────────┘ $7C00      │                         │
┌─────────────────────────┐ $7BFF      │  Dual RAM Board Assy    │
│  Game State & Work RAM  │            │  (2x A082-91356-C000)   │
│ (Vars/Scores/Inputs)    │            │                         │
└─────────────────────────┘ $4C00      │                         │
┌─────────────────────────┐ $4BFF      │                         │
│  Viewable SCREEN RAM    │            │                         │
│  (320x204 Framebuffer)  │            │                         │
└─────────────────────────┘ $4000      └─────────────────────────┘ $4000
┌─────────────────────────┐ $3FFF      ┌─────────────────────────┐ $3FFF
│  ROM m761d / Socket X7  │            │        Socket X7        │
│                         │            │        ROM m761d        │
│  Sound Data, Char GFX   │            │  Sound Data, Char GFX   │
│  & Opcode Jump Table    │            │  & Opcode Jump Table    │
└─────────────────────────┘ $3000      └─────────────────────────┘ $3000
┌─────────────────────────┐ $2FFF      ┌─────────────────────────┐ $2FFF
│  ROM m761c / Socket X5  │            │        Socket X5        │
│                         │            │        ROM m761c        │
│ TERSE Word Definitions  │            │ TERSE Word Definitions  │
│ & Game Jump Tables      │            │ & Game Jump Tables      │
└─────────────────────────┘ $2000      └─────────────────────────┘ $2000
┌─────────────────────────┐ $1FFF      ┌─────────────────────────┐ $1FFF
│  ROM m761b / Socket X3  │            │        Socket X3        │
│                         │            │        ROM m761b        │
│ Main Game Loop, Player  │            │ Main Game Loop, Player  │
│ & Ball Control Logic    │            │ & Ball Control Logic    │
└─────────────────────────┘ $1000      └─────────────────────────┘ $1000
┌─────────────────────────┐ $0FFF      ┌─────────────────────────┐ $0FFF
│  ROM m761a / Socket X1  │            │        Socket X1        │
│                         │            │        ROM m761a        │
│ Boot Entry, Interrupts  │            │ Boot Entry, Interrupts  │
│ & Inner Interpreter     │            │ & Inner Interpreter     │
└─────────────────────────┘ $0000      └─────────────────────────┘ $0000
```
---

## Memory Map Details

| Address Range | Description | Hardware Allocation | Notes |
| :--- | :--- | :--- | :--- |
| **`$8000 - $FFFF`** | **Not Addressable** | Open Bus | Open-bus behavior. Extra Bases has no decode logic for $A15; upper ROM/RAM expansion boards are not present. |
| **`$7C00 - $7FFF`** | **SRAM Scratchpad & Stacks** | CPU Board (`A082-91354-C000`) | High-speed, zero-wait-state SRAM for PSP (`SP`=$7F80), RSP (`IX`=$8000), vectors (`I`=$7C), and flags. |
| **`$4C00 - $7BFF`** | **Game Work RAM & Variables** | Dual RAM Boards (`A082-91356-C000`) | Runtime workspace for inning counters, scores, trackball input buffers, and game state. |
| **`$4000 - $4BFF`** | **Viewable Screen RAM** | Dual RAM Boards (`A082-91356-C000`) | Framebuffer memory (320 x 204 resolution, 2 bits per pixel, 0x50 bytes per scanline). |
| **`$0000 - $3FFF`** | **Low ROM / Magic Write** | Game Logic Board (`A084-90700-D761`) | Reads fetch program ROMs (`m761a`–`m761d`). Writes trigger Magic Function Generator blits into VRAM (`$4000` + offset). Sockets X2, X4, X6, X8 unused. |

---

## Hardware ROM Socket Configuration

| Socket | Address Range | ROM Binary | Size | Purpose |
| :--- | :--- | :--- | :--- | :--- |
| **X1** | `$0000 - $0FFF` | `m761a` | 4 KB | Reset / Boot entry, Interrupt vectors, TERSE Inner Interpreter. |
| **X3** | `$1000 - $1FFF` | `m761b` | 4 KB | Main game loop, player motion & ball control logic. |
| **X5** | `$2000 - $2FFF` | `m761c` | 4 KB | TERSE word definitions & game state jump tables. |
| **X7** | `$3000 - $3FFF` | `m761d` | 4 KB | Sound data, character graphics & TERSE Opcode Jump Table (`$3EA7`). |