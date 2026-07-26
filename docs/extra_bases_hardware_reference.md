# Extra Bases (Midway, 1980) — Hardware Technical Reference
## Architecture & Memory Layout Reference Manual
***

## 1. Document Purpose
This reference manual provides low-level hardware and memory documentation for the **Midway Extra Bases (1980)** arcade system (`ebases`). It bridges the gap between MAME driver implementations and the zmac disassembly pipeline, detailing system buses, hardware registers, custom chips, and I/O maps.

---

## 2. PCB Hardware Overview

| Component | Specification / Part Number | Notes |
| :--- | :--- | :--- |
| **Main CPU** | Zilog Z80A | Clocked at ~1.789 MHz (14.31818 MHz ÷ 8) |
| **Address Space** | 16 KB total addressing | `0x0000`–`0x3FFF` |
| **ROM Array** | 4x EPROMs (2716/2516 or equivalent) | `0x0000`–`0x1FFF` (8 KB total) |
| **RAM Hardware** | 4 KB On-board RAM + Magic RAM | Screen RAM & Scratchpad (`0x4000`–`0x4FFF` mirrored/mapped) |
| **Custom Chipset** | Bally Custom Video Chipset | Pattern Board (Blitter), Address Sequencer, I/O Chip |
| **Interrupts** | Mode 1 / Line-based scanline IRQ | Triggered via Custom Light Pen / Scanline Register |
| **Sound System** | Custom Astrocade Custom Audio Chip | Integrated tone, noise, and master volume generators |

---

## 3. ROM Information

### ROM Table (`ebases`)
| Filename | Load Address | Length | CRC32 | Purpose |
| :--- | :--- | :--- | :--- | :--- |
| `m761a` | `0x0000` – `0x07FF` | 2048 Bytes | Known MAME Dump | Program Code & Vector Table |
| `m761b` | `0x0800` – `0x0FFF` | 2048 Bytes | Known MAME Dump | Main Game Logic & Graphics |
| `m761c` | `0x1000` – `0x17FF` | 2048 Bytes | Known MAME Dump | Game State & Interpreter Tables |
| `m761d` | `0x1800` – `0x1FFF` | 2048 Bytes | Known MAME Dump | Audio Data & Tile Patterns |

### Core System Vectors
* **Reset Vector (`0x0000`):** Cold boot execution entry point (`di`, `jp init`).
* **Interrupt Entry (`0x0038`):** Z80 IM 1 interrupt vector; handles VBlank and vertical scanline timing.
* **Restart Directives (`rst`):**
  * `rst $00`: System re-initialization reset.
  * `rst $08` – `rst $30`: Utilized by custom interp / system helper calls.

---

## 4. Hardware Memory Map

| Address Range | Size | Read/Write | Function / Description |
| :--- | :--- | :--- | :--- |
| `0x0000` – `0x1FFF` | 8 KB | Read Only | Main Game ROMs (`m761a` through `m761d`) |
| `0x2000` – `0x3FFF` | 8 KB | Read / Write | Reserved / Unused ROM/RAM space |
| `0x4000` – `0x4FFF` | 4 KB | Read / Write | Screen RAM / Framebuffer (160x102 2-bpp layout) |
| `0x5000` – `0x5FFF` | 4 KB | Write Only | **Magic RAM** (Hardware blitter / Shift / XOR / OR logic) |
| `0x6000` – `0x7FFF` | 8 KB | — | Unmapped / Hardware Shadow Registers |

---

## 5. Custom Registers & Hardware I/O Ports

The Astrocade platform uses Z80 I/O space (`IN` / `OUT` instructions) for all hardware control registers, sound registers, color palettes, and controller polling.

### Audio & System Output Ports (`OUT`)

| Port Range | Access | Bit / Register Function | Hardware Description |
| :--- | :--- | :--- | :--- |
| `0x00` – `0x07` | Write | Master Audio Control | Custom Sound Chip tone/vibrato registers |
| `0x08` – `0x0B` | Write | Audio Tone Generators | Tone Master Frequency & Noise Controllers |
| `0x0C` – `0x0E` | Write | Audio Volume / Noise | Channel Volume and Noise Generator Feedback |
| `0x0F` | Write | Master Sound / Mute | Global Audio output enablement |
| `0x10` – `0x17` | Write | Color Palette RAM | 8 Palette registers (2-bit pixel mapping to 8-bit color) |
| `0x18` | Write | Sync / Screen Control | Video Sync control & vertical offset |
| `0x19` | Write | Vertical Blank Line | Sets vertical scanline IRQ point |
| `0x1A` | Write | Color Mode / Shift | Background color and split-screen video modes |
| `0x1B` | Write | Magic RAM Mode | Configures shift count and logic operation (XOR, OR, AND) |

---

## 6. Input Systems & Controls

### Hardware Input Ports (`IN`)

| Port | Direction | Bit Definitions | Functional Mapping |
| :--- | :--- | :--- | :--- |
| `0x08` | Read | Bits 0–7: Player 1 Inputs | Joystick / Cabinet Switch States |
| `0x09` | Read | Bits 0–7: Player 2 Inputs | Second Player Controls |
| `0x0A` | Read | Bits 0–7: System Controls | Coin 1, Coin 2, Service Switch, Tilt |
| `0x0B` | Read | Bits 0–7: DIP Switches | Cabinet DIP Options (Lives, Coinage, Diagnostic) |
| `0x0C` – `0x0F` | Read | Trackball / Analog Quadrature | Horizontal and Vertical Trackball movement counters |

---

## 7. DIP Switch Definitions

| Bit Position | Function | Options / Settings |
| :--- | :--- | :--- |
| **Bit 0–1** | Coinage Configuration | `00` = 1 Coin / 1 Credit<br>`01` = 2 Coins / 1 Credit<br>`10` = 1 Coin / 2 Credits |
| **Bit 2–3** | Inning / Game Length | Controls total innings per credit |
| **Bit 4** | Cabinet Type | `0` = Upright<br>`1` = Cocktail |
| **Bit 5** | Service Mode | `0` = Normal Operation<br>`1` = Self Test Diagnostic |
| **Bit 6–7** | Unused / Demo Sound | Controls attract mode sound activation |

---

## 8. Video Hardware & Magic RAM

### Framebuffer Layout
* **Resolution:** 160 × 102 pixels active screen area.
* **Color Depth:** 2 bits per pixel (4 colors simultaneously per pixel block from an 8-color palette table).
* **RAM Footprint:** Pixel RAM begins at `0x4000`.

### Magic RAM Logic
Writing to `0x5000`–`0x5FFF` passes data through the **Bally Pattern Board**, enabling hardware-accelerated sprite rendering:
* **Byte Shifter:** Automatically shifts incoming byte patterns by 0–7 bits horizontally.
* **Logic Operations:** Supports direct overwriting, XOR expansion (for fast collision detection), and bit masking.
* **Collision Detection:** Hardware flags trigger when non-zero pixels overlap during a Magic RAM write.

---

## 9. Interrupt Logic & Scanline Timing

1. **Scanline Counter:** Increments each horizontal raster line.
2. **Interrupt Match:** When the internal scanline counter equals the value written to Port `0x19`, an IRQ is asserted.
3. **Z80 Response:** CPU executes `RST $38` vector.
4. **VBlank Routine:** Polls trackball inputs, updates audio registers, increments system clocks, and refreshes palette entries.

---

## 10. RAM Variable Map (Work in Progress)

| Memory Address | Data Type | Usage / Description |
| :--- | :--- | :--- |
| `0x4000` – `0x4C00` | Framebuffer | Screen display memory |
| `0x4C01` | Byte | System Tick Counter |
| `0x4C02` | Byte | Active Player State (`0x00` = P1, `0x01` = P2) |
| `0x4C10` | BCD Byte | Current Inning Display Value |
| `0x4C11` – `0x4C12` | BCD Pair | Player 1 Current Score |
| `0x4C13` – `0x4C14` | BCD Pair | Player 2 Current Score |
| `0x4C20` | Byte | Coin Switch Debounce Buffer |