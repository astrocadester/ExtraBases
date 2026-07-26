# Extra Bases (Midway, 1980)
## MAME Hardware Reference
### Reverse Engineering / Emulator Development Notes

---

# Hardware Summary

| Item | Value |
|------|-------|
| CPU | Zilog Z80 |
| CPU Clock | 1.789772 MHz (Astrocade hardware) |
| Video | Bally Astrocade custom video hardware |
| Sound | Bally Astrocade custom sound chip |
| Screen | 352 × 240 |
| Refresh | 60.054442 Hz |
| Orientation | Horizontal |
| Colors | Astrocade palette |

---

# ROM Layout

| ROM | Start Address | End Address | Size |
|------|--------------:|------------:|-----:|
| m761a | 0000 | 0FFF | 4 KB |
| m761b | 1000 | 1FFF | 4 KB |
| m761c | 2000 | 2FFF | 4 KB |
| m761d | 3000 | 3FFF | 4 KB |

Total ROM = 16 KB

Memory image:

0000-0FFF  m761a
1000-1FFF  m761b
2000-2FFF  m761c
3000-3FFF  m761d

---

# Z80 Program Memory Map

Address Range      Description
-------------      ------------------------------------
0000-3FFF          Program ROM
4000-7FFF          RAM
8000-FFFF          Memory-mapped hardware

Unlike many Z80 arcade systems, the upper half of the address space is
primarily decoded by the Astrocade hardware rather than being simple RAM.

---

# RAM Usage

The MAME driver exposes a shared RAM area beginning at 0x4000.

This RAM contains:

- Stack
- Variables
- Score
- Game state
- Object positions
- Scratch RAM
- Video RAM (through hardware mapping)

The original Midway documentation does not separate these into fixed blocks.

---

# Memory-Mapped Video Hardware

The Astrocade hardware maps video functions into the upper memory space.

These include:

• Screen RAM
• Color RAM
• Magic RAM
• Pattern expansion hardware
• Collision hardware

Exact addresses are handled through common Astrocade decode logic rather than
individual game drivers.

---

# I/O Ports

Extra Bases does NOT use a traditional isolated Z80 I/O map for most hardware.

Instead, nearly everything is memory mapped.

The remaining I/O ports are primarily:

Port    Function
----    -----------------------
00-0F   Astrocade sound registers
10-1F   Miscellaneous hardware

Many registers are mirrored.

---

# Astrocade Sound Registers

The Bally custom sound chip contains sixteen write-only registers.

Register    Purpose
--------    ---------------------------
0           Tone A Frequency
1           Tone B Frequency
2           Tone C Frequency
3           Noise Frequency
4           Vibrato
5           Master Volume
6           Tone A Volume
7           Tone B Volume
8           Tone C Volume
9           Noise Volume
A           Mixer
B-F         Miscellaneous control

The exact function of several upper registers is documented in the
Bally Astrocade Hardware Manual.

---

# Input Ports

Player 1

- Joystick Up
- Joystick Down
- Joystick Left
- Joystick Right
- Swing
- Start

Player 2

- Same controls

System

- Coin 1
- Coin 2
- Service
- Tilt

---

# DIP Switches

Typical options include:

- Coinage
- Bonus innings
- Difficulty
- Number of innings
- Free Play

Exact combinations depend on ROM revision.

---

# Interrupt System

CPU: Z80

Interrupt type:

Maskable interrupt (IRQ)

Generated:

Once every video frame

Rate:

Approximately 60 Hz

Purpose:

- Read controls
- Update game logic
- Animate objects
- Update sound
- Refresh display

The Z80 generally remains in HALT until interrupted.

---

# Video Timing

Visible Resolution

352 × 240

Refresh

60.054442 Hz

Vertical Total

262 scanlines

Horizontal Total

455 clocks

Pixel Clock

7.15909 MHz

---

# Graphics Layout

Unlike later Midway hardware,
Extra Bases does not have dedicated character ROMs.

Graphics are generated through:

- CPU RAM
- Astrocade pattern hardware
- Magic RAM expansion logic

This greatly reduces ROM size while allowing hardware-assisted drawing.

---

# Sprite Hardware

There are NO hardware sprites.

Everything is software drawn.

Objects are drawn into screen memory by the CPU using the Astrocade's
Magic RAM hardware.

Advantages:

- Flexible graphics
- Collision hardware
- Pattern expansion
- Fast block copies

---

# Collision Detection

Collision detection is implemented by the Astrocade custom hardware.

The CPU can query collision registers rather than testing pixels manually.

---

# Emulator Notes

An emulator should implement:

✓ Z80 CPU

✓ 16 KB ROM

✓ 16 KB RAM

✓ Astrocade custom video hardware

✓ Astrocade Magic RAM

✓ Astrocade sound chip

✓ 60 Hz interrupt generation

✓ Memory-mapped hardware registers

✓ Collision hardware

✓ Pattern expansion logic

---

# MAME Driver Notes

Current MAME source places Extra Bases inside the shared
Astrocade hardware driver.

Game-specific code consists primarily of:

- ROM definitions
- Input definitions
- DIP switches

Nearly all video, sound, interrupts, memory decoding, and rendering
are implemented by reusable Astrocade hardware classes shared by:

- Wizard of Wor
- Gorf
- Sea Wolf II
- Space Zap
- Robby Roto
- Professor Pac-Man
- Extra Bases
- Other Midway Astrocade games

For emulator authors, the Astrocade hardware implementation is more
important than the game driver itself, since almost all hardware behavior
is common across the platform.