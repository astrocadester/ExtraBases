# Extra Bases Formatting & Style Guide

This document governs all assembly code generation, formatting, and analysis for the *Extra Bases* disassembly project. **All output must strictly adhere to these rules.**

---

## 1. Zero-Byte Shift & Binary Integrity (CRITICAL)
* **Byte Conservation:** You must **NEVER** alter, insert, or delete opcodes, `ORG` directives, or `NOP` padding bytes.
* **Checksum Integrity:** The byte count, layout, and compiled binary output must remain 100% identical to the original ROM. Structural alignment or code cleanup must never sacrifice byte parity.

---

## 2. Comment Philosophy & Semantics
* **Target Audience:** Mid-level Z80 assembly programmers with TERSE VM context.
* **Explain High-Level Intent & VM Semantics:** Explain *what* the virtual machine is doing (e.g., Parameter Stack manipulation, Return Stack ops, Instruction Pointer updates, inner interpreter dispatch), **not** basic Z80 mechanics (e.g., do *not* write "increments BC", write "advances instruction pointer").
* **Ignore Legacy Comments:** Do not port or trust original legacy comments from *Extra Bases* or *Gorf* disassemblies. Always verify code execution against official TERSE documentation.

---

## 3. Strict Column Alignment Matrix
Code must be formatted using exact character column alignment (use spaces, not tabs):

| Column | Field | Examples / Guidelines |
| :--- | :--- | :--- |
| **Col 1** | Labels | `_RETURN:`, `L0015:`, `_DLIT:` |
| **Col 13** | Opcodes / Directives | `ld`, `jp`, `push`, `ORG` |
| **Col 21** | Operands | `a,(bc)`, `hl,de`, `$0046` |
| **Col 41** | Inline Comments | `; Pop LSB of saved IP...` |

### Column Alignment Template
```assembly
;1        13      21                      41
;v        v       v                       v
LABEL:    ld      a,(bc)                  ; Fetch LSB of inline literal
          inc     bc                      ; Advance instruction pointer
```

---

## 4. Header & Divider Box Formatting
* **Divider Line Style:** Use `;=` lines spanning **exactly 90 characters** (including the leading `;`).
* **Header Structure:** Use standard ASCII headers for functions and key inner-interpreter primitives.

### Standard Header Template
```assembly
;=========================================================================================
; ----> [NAME]           [HIGH-LEVEL FUNCTION SUMMARY]  ($[ADDR_START] - $[ADDR_END])
;   [Detailed breakdown of inputs, stack effects, or execution flow]
;=========================================================================================
```