# Extra Bases (Midway, 1980) <br> Hardware Technical Reference
## Architecture & Memory Layout Reference Manual
***

## 1. Document Purpose
This reference manual provides low-level hardware and memory documentation for the **Midway Extra Bases (1980)** arcade system (`ebases`). It bridges the gap between MAME driver implementations and the zmac disassembly pipeline, detailing system buses, hardware registers, custom chips, and I/O maps.

---

## 2. PCB Hardware Overview

| Component | Specification / Part Number | Notes |
| :--- | :--- | :--- |
| **Main CPU** | Zilog Z80 | Clocked at ~1.789 MHz (14.318181 MHz ÷ 8) |
| **Address Space** | 16 KB total active addressing | `0x0000`–`0x7FFF` primary mapping zone |
| **ROM Array** | 4x EPROMs | `0x0000`–`0x3FFF` (16 KB total capacity mapped) |
| **RAM Hardware** | On-board RAM + Function Gen | Screen RAM & Scratchpad (`0x4000`–`0x7FFF` mapped) |
| **Custom Chipset** | Bally Custom Video Chipset | Custom Function Generator, Address Sequencer, I/O Chip |
| **Interrupts** | Mode 1 / Line-based scanline IRQ | Triggered via Custom Light Pen / Scanline Register |
| **Sound System** | Custom Astrocade I/O Chip | Integrated tone, noise, and master volume generators |

---

## 3. ROM Information

### ROM Table (`ebases`)
| Filename | Load Address | Length | CRC32 | Purpose |
| :--- | :--- | :--- | :--- | :--- |
| `m761a` | `0x0000` – `0x0FFF` | 4096 Bytes | `34422147` | Program Code & Vector Table |
| `m761b` | `0x1000` – `0x1FFF` | 4096 Bytes | `4f28dfd6` | Main Game Logic & Graphics |
| `m761c` | `0x2000` – `0x2FFF` | 4096 Bytes | `bff6c97e` | Game State & Interpreter Tables |
| `m761d` | `0x3000` – `0x3FFF` | 4096 Bytes | `5173781a` | Audio Data & Tile Patterns |

### Core System Vectors
* **Reset Vector (`0x0000`):** Cold boot execution entry point.
* **Interrupt Entry (`0x0038`):** Z80 IM 1 interrupt vector; handles VBlank and vertical scanline timing.

---

## 4. Hardware Memory Map

*Note: The Astrocade hardware utilizes a unique memory overlapping technique for its hardware blitter.*

| Address Range | Size | Read/Write | Function / Description |
| :--- | :--- | :--- | :--- |
| `0x0000` – `0x3FFF` | 16 KB | Read Only | Main Game ROMs (`m761a` through `m761d`) |
| `0x0000` – `0x3FFF` | 16 KB | Write Only | **Magic RAM / Function Generator**: Writes to this area are intercepted by the custom video chip, processed via the selected logic (Shift/XOR/OR), and deposited into Video RAM at `0x4000 + offset` |
| `0x4000` – `0x7FFF` | 16 KB | Read / Write | Screen RAM / Framebuffer (Shared Video RAM) |

---

## 5. Custom Registers & Hardware I/O Ports

The Astrocade platform heavily utilizes the Z80 I/O space. The video system occupies `0x00`–`0x0F`, while the sound system occupies `0x10`–`0x17`.

### Video & System Ports (`OUT 0x00` - `0x0F`)

| Port | Access | Bit / Register Function | Hardware Description |
| :--- | :--- | :--- | :--- |
| `0x00` – `0x07` | Write | Color Table | Configures 8 color palette registers |
| `0x08` | Read/Write | Mode Register / Intercept | **Write:** Sets video mode (Bit 0). **Read:** Retrieves intercept (collision) feedback |
| `0x09` | Write | Color Split Pixel | Sets color split boundary and background data |
| `0x0A` | Write | Vertical Blank Register | Sets the vertical blanking boundary |
| `0x0B` | Write | Color Block Transfer | Performs a color block transfer to the palette |
| `0x0C` | Write | Function Generator | Configures hardware blitter logic (shift amount, rotate, expand, OR, XOR, flop) |
| `0x0D` | Write | Interrupt Vector | Sets the interrupt feedback vector |
| `0x0E` | Read/Write | Interrupt Enable/Mode | **Write:** Configures interrupt enablement and mode. **Read:** Vertical lightpen feedback |
| `0x0F` | Read/Write | Interrupt Line | **Write:** Sets vertical scanline IRQ trigger. **Read:** Horizontal lightpen feedback |
| `0x19` | Write | Expand Register | Configures the function generator expansion color bits |
| `0x20` | Write | Coin Counter | Triggers the physical coin counter (Bit 0) |
| `0x28` | Write | Trackball Select | Selects which trackball axis/player to poll |

### Audio Ports (`OUT 0x10` - `0x17`)

| Port | Access | Bit / Register Function | Hardware Description |
| :--- | :--- | :--- | :--- |
| `0x10` | Write | Master Oscillator | Sets the master oscillator frequency |
| `0x11` | Write | Tone Generator A | Sets frequency for Tone A |
| `0x12` | Write | Tone Generator B | Sets frequency for Tone B |
| `0x13` | Write | Tone Generator C | Sets frequency for Tone C |
| `0x14` | Write | Vibrato Control | Bits 6-7: Vibrato Speed. Bits 0-5: Vibrato Depth |
| `0x15` | Write | Noise / Mux / Vol C | Bit 5: Noise AM Enable. Bit 4: Mux Source (0=Vibrato, 1=Noise). Bits 0-3: Tone C Volume |
| `0x16` | Write | Volume A & B | Bits 4-7: Tone B Volume. Bits 0-3: Tone A Volume |
| `0x17` | Write | Noise Volume | Sets global Noise Volume |

---

## 6. Input Systems & Controls

### Hardware Input Ports (`IN 0x10` - `0x13`)

| Port | Direction | Bit Definitions | Functional Mapping |
| :--- | :--- | :--- | :--- |
| `0x10` | Read | Player 1 & 2 Inputs | Bit 0: P2 Button 1. Bit 1: P1 Button 1. Bit 4: P1 Start. Bit 5: P2 Start |
| `0x11` | Read | System & DIPs | Bit 0: Coin 1. Bit 1: Coin 2. Bit 2: Tilt. Bit 4: Monitor DIP (Color/BW). Bit 6: Cabinet DIP (Upright/Cocktail) |
| `0x12` | Read | Game DIP Settings | Bit 0: 2 Players Game Credit Requirement (1 or 2 Credits) |
| `0x13` | Read | Trackball Input | Reads multiplexed horizontal/vertical trackball movement counters |

---

## 7. Video Hardware specifics

### Palette Layout
* **Total Palette Size:** 256 colors total (comprised of 32 base colors, each with 8 luminance values).
* **Grayscale:** The first 8 colors of the base 32 map explicitly to grayscale.
* **Monitor Configurations:** The system supports a Color mode and a B/W mode via DIP switch (Port `0x11`, Bit 4).

### Framebuffer & Scanline Math
* **Vertical Offset:** 22 pixels from the top of the screen to the active game area.
* **Horizontal Offset:** 16 pixels from the left of the screen to the active game area.
* **Collision Detection:** Hardware flags (intercepts) trigger when non-zero pixels overlap during a Function Generator (Magic RAM) write operation, readable on Port `0x08`.

---

## 8. Interrupt Logic & Scanline Timing

1. **Scanline Counter:** Increments each horizontal raster line.
2. **Interrupt Match:** When the internal scanline counter matches the target line value written to Port `0x0F`, an IRQ is asserted if enabled via Port `0x0E`.
3. **Interrupt Vector:** The system can push a specific vector to the Z80 (configured via Port `0x0D`) during the interrupt acknowledge cycle.

---

## 9. RAM Variable Map (Work in Progress)

| Memory Address | Data Type | Usage / Description |
| :--- | :--- | :--- |
| `0x4000` – `0x4C00` | Framebuffer | Screen display memory |
| `0x4C01` | Byte | System Tick Counter |
| `0x4C02` | Byte | Active Player State (`0x00` = P1, `0x01` = P2) |
| `0x4C10` | BCD Byte | Current Inning Display Value |
| `0x4C11` – `0x4C12` | BCD Pair | Player 1 Current Score |
| `0x4C13` – `0x4C14` | BCD Pair | Player 2 Current Score |
| `0x4C20` | Byte | Coin Switch Debounce Buffer |

---

# Technical Notes:

<br>
 
## === Color Processing in Extra Bases ===

### 1. Hardware Abstraction (The CPU's Perspective)
Although *Extra Bases* originally shipped with a black-and-white monitor, the system runs on the standard Bally Astrocade custom video chipset. This architecture inherently utilizes a 256-color palette space comprised of 32 base colors, each with 8 luminance values. The Z80 CPU is hardware-agnostic regarding the physical monitor type; the game software actively boots up, initializes the palette, and writes data to the hardware color ports (`0x00` through `0x07`) just like any other Astrocade title.

### 2. Luminance and The B/W Mask
The monochrome appearance of *Extra Bases* is a result of video output configuration rather than a software limitation. During hardware initialization, the system is explicitly flagged with `AC_MONITOR_BW`. When the custom video chip renders the screen, this flag applies a `colormask` that mathematically strips out the chrominance (color) data, outputting only the raw luminance (brightness) to the display. Therefore, the color values written by the Z80 effectively function as grayscale intensity levels for the on-screen graphics.

### 3. Cabinet Design and Operator Toggles
Bally Midway accounted for physical cabinet variations and potential monitor replacements:
* **Physical Overlays and Backgrounds:** Factory cocktail cabinets utilized a B/W monitor covered by a physical color overlay (the same overlay used for *Space Zap!*). Standard upright cabinets paired the B/W monitor with a printed baseball stadium background.
* **Hardware DIP Switch:** The game board includes a physical DIP switch (Port `0x11`, Bit 4) that allows arcade operators to toggle the video output between "B/W" and "Color" modes. This ensured that if an operator ever swapped a color monitor into the cabinet, the system was fully capable of rendering the native color palette without modifying the ROMs.