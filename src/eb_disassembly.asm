;=========================================================================================
; Extra Bases Disassembly
; David E. Turner (Commander Dave)
; daveturner0x2a@gmail.com
;
;=========================================================================================
;   ROM Checksums (MAME 'ebases' set):
;   m761a ($0000-$0FFF): CRC32(34422147) SHA1(6483ca1359b675b0dd739605db2a1dbd4b7fb8cb)
;   m761b ($1000-$1FFF): CRC32(4f28dfd6) SHA1(52e571e671fa61b0f9ab397a5947094c24f6c388)
;   m761c ($2000-$2FFF): CRC32(bff6c97e) SHA1(e41fb9db919039c8a48b4caebf80821a066d7ccf)
;   m761d ($3000-$3FFF): CRC32(5173781a) SHA1(e60c3f4b075f8b811ff6a8637c4aa0b089847a82)
;=========================================================================================

            ORG     $0000

            INCLUDE "src/extra_bases.inc"

;=========================================================================================
; COLD START ENTRY POINT ($0000 - $0007)
;=========================================================================================
            nop
            nop
            di                          ; Disable interrupts
            jp      _WARM_START         ; Jump over RST $08 vector
            nop
            nop

;=========================================================================================
; TERSE INNER INTERPRETER ENTRY: _ENTER / RST $08 ($0008 - $0014)
;=========================================================================================
_ENTER:
            dec     ix
            ld      (ix+$00),b          ; Save current Instruction Pointer (BC)
            dec     ix                  ; onto Return Stack (IX)
            ld      (ix+$00),c
            pop     bc                  ; Fetch next Thread Pointer into BC
            jp      (iy)                ; Dispatch TERSE word

;=========================================================================================
; HARDWARE & TERSE STACK INITIALIZATION ($0015 - $002A)
;=========================================================================================
_WARM_START:
            ld      a,$01
            out     ($08),a             ; Set High Resolution mode
            ld      b,$00               ; Loop 256 times to clear/init stacks
_INIT_STACK_LOOP:
            ld      ix,$8000            ; Set Return Stack Pointer (RSP)
            ld      sp,$7F80            ; Set Parameter Stack Pointer (PSP)
            djnz    _INIT_STACK_LOOP
            ld      bc,_VM_BOOT_STREAM  ; Set initial TERSE Instruction Pointer
            ld      iy,$002B            ; Set TERSE Dispatcher address

;=========================================================================================
; ----> NEXT           TERSE INNER INTERPRETER DISPATCHER  ($002B - $0039)
;   Inner interpreter dispatcher loop. Fetches the next opcode byte from
;   the Instruction Pointer (BC), indexes the primitive jump table at $3EA7,
;   and branches to the target execution routine.
;=========================================================================================
_NEXT:
            ld      a,(bc)
            inc     bc
            ld      de,TOKEN_TABLE
            ld      l,a
            ld      h,$00
            add     hl,hl
            add     hl,de
            ld      e,(hl)
            inc     hl
            ld      d,(hl)
            ex      de,hl
            jp      (hl)

;=========================================================================================
; ----> RETURN         EXIT TERSE WORD / RESTORE IP  ($003A - $0045)
;   Exits the current TERSE word by popping the saved Instruction Pointer
;   from the Return Stack (IX) back into BC and returning to the interpreter.
;=========================================================================================
_RETURN:
            ld      c,(ix+$00)          ; Pop LSB of saved IP from Return Stack
            inc     ix
            ld      b,(ix+$00)          ; Pop MSB of saved IP from Return Stack
            inc     ix
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> LITERAL        16-BIT INLINE LITERAL  ($0046 - $004E)
;   Reads a 16-bit word from the TERSE instruction stream and pushes it
;   onto the parameter stack. (Opcode: $1B)
;=========================================================================================
_LITERAL:
            ld      a,(bc)              ; Read low byte from instruction pointer
            inc     bc                  ; Advance instruction pointer
            ld      l,a
            ld      a,(bc)              ; Read high byte from instruction pointer
            inc     bc                  ; Advance instruction pointer
            ld      h,a
            push    hl                  ; Push 16-bit word onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> LITbyte        8-BIT INLINE LITERAL  ($004F - $0056)
;   Reads an 8-bit byte from the TERSE instruction stream, zero-extends
;   it to 16 bits, and pushes it onto the parameter stack. (Opcode: $19)
;=========================================================================================
_LITbyte:
            ld      a,(bc)              ; Read literal byte from instruction pointer
            inc     bc                  ; Advance instruction pointer
            ld      l,a
            ld      h,$00               ; Zero-extend high byte
            push    hl                  ; Push 16-bit value onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> DLIT           PUSH TWO INLINE 16-BIT LITERALS  ($0057 - $0060)
;   Fetches two consecutive 16-bit words from the instruction stream (BC)
;   and pushes both onto the Parameter Stack.
;=========================================================================================
_DLIT:
            ld      a,(bc)              ; Read low byte of first literal word
            inc     bc                  ; Advance instruction pointer
            ld      l,a
            ld      a,(bc)              ; Read high byte of first literal word
            inc     bc                  ; Advance instruction pointer
            ld      h,a
            push    hl                  ; Push first 16-bit word onto parameter stack
            jp      _LITERAL               ; Jump to _LITERAL to fetch/push second word

;=========================================================================================
; ----> +!             ADD INLINE OFFSET TO STACK WORD  ($0061 - $006B)
;   Pops a value from the Parameter Stack, reads a 16-bit inline offset from
;   the instruction stream, adds them together, and pushes the sum. (Opcode: $0E)
;=========================================================================================
_plusbang:
            pop     hl                  ; Pop target value from parameter stack
            ld      a,(bc)              ; Read low byte of inline offset
            inc     bc                  ; Advance instruction pointer
            ld      e,a
            ld      a,(bc)              ; Read high byte of inline offset
            inc     bc                  ; Advance instruction pointer
            ld      d,a
            add     hl,de               ; Add inline offset to popped value
            push    hl                  ; Push sum onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> ARRAY          CALCULATE WORD ARRAY ELEMENT ADDRESS  ($006C - $0070)
;   Pops an index from the Parameter Stack, doubles it for 16-bit word alignment,
;   and jumps to $0062 to add the inline base address and push the result.
;=========================================================================================
_ARRAY:
            pop     hl                  ; Pop array index from parameter stack
            add     hl,hl               ; Double index for 16-bit word offset
            jp      $0062               ; Jump to add inline base address and push

;=========================================================================================
; ----> 0              PUSH CONSTANT ZERO  ($0071 - $0076)
;   Pushes a 16-bit constant value of 0 onto the Parameter Stack. (Opcode: $0D)
;=========================================================================================
_0:
            ld      hl,$0000            ; Load 16-bit constant 0
            push    hl                  ; Push 0 onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 1              PUSH CONSTANT ONE  ($0077 - $007C)
;   Pushes a 16-bit constant value of 1 onto the Parameter Stack. (Opcode: $22)
;=========================================================================================
_1:
            ld      hl,$0001            ; Load 16-bit constant 1
            push    hl                  ; Push 1 onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> DUP            DUPLICATE TOP STACK ITEM  ($007D - $0081)
;   Duplicates the top 16-bit value on the Parameter Stack. (Opcode: $08)
;=========================================================================================
_DUP:
            pop     hl                  ; Pop top value from parameter stack
            push    hl                  ; Push first copy back onto stack
            push    hl                  ; Push second copy onto stack
            jp      (iy)                ; Return to TERSE inner interpreter
;=========================================================================================
; ----> 2DUP           DUPLICATE TOP TWO STACK ITEMS  ($0082 - $0089)
;   Duplicates the top two 16-bit values on the Parameter Stack. (Opcode: $06)
;=========================================================================================
_2DUP:
            pop     hl                  ; Pop top value from parameter stack
            pop     de                  ; Pop second value from parameter stack
            push    de                  ; Push second value back
            push    hl                  ; Push top value back
            push    de                  ; Push duplicate of second value
            push    hl                  ; Push duplicate of top value
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> DROP           DISCARD TOP STACK ITEM  ($008A - $008C)
;   Discards the top 16-bit value from the Parameter Stack. (Opcode: $07)
;=========================================================================================
_DROP:
            pop     hl                  ; Pop and discard top value from stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> SWAP           EXCHANGE TOP TWO STACK ITEMS  ($008D - $0092)
;   Exchanges the positions of the top two 16-bit values on the Parameter Stack. (Opcode: $01)
;=========================================================================================
_SWAP:
            pop     hl                  ; Pop top value from parameter stack
            pop     de                  ; Pop second value from parameter stack
            push    hl                  ; Push top value into second position
            push    de                  ; Push second value into top position
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> @              FETCH 16-BIT WORD FROM MEMORY  ($0093 - $0099)
;   Fetches the 16-bit word stored at the memory address on the Parameter Stack
;   and pushes the fetched value back onto the stack. (Opcode: $24)
;=========================================================================================
_at:
            pop     hl                  ; Pop target memory address from stack
            ld      e,(hl)              ; Read low byte from memory address
            inc     hl                  ; Advance memory pointer
            ld      d,(hl)              ; Read high byte from memory address
            push    de                  ; Push 16-bit fetched word onto stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> B@             FETCH BYTE FROM MEMORY  ($009A - $00A0)
;   Fetches the 8-bit byte stored at the memory address on the Parameter Stack,
;   zero-extends it to 16 bits, and pushes the result back onto the stack. (Opcode: $17)
;=========================================================================================
_Bat:
            pop     hl                  ; Pop memory address from parameter stack
            ld      e,(hl)              ; Fetch byte from memory address
            ld      d,$00               ; Zero-extend high byte
            push    de                  ; Push 16-bit zero-extended value
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> !              STORE 16-BIT WORD TO MEMORY  ($00A1 - $00A7)
;   Pops a 16-bit memory address and a 16-bit word value from the Parameter
;   Stack and stores the word into memory. (Opcode: $02)
;=========================================================================================
_bang:
            pop     hl                  ; Pop target memory address
            pop     de                  ; Pop 16-bit word value
            ld      (hl),e              ; Write LSB to memory address
            inc     hl                  ; Advance memory pointer
            ld      (hl),d              ; Write MSB to memory address
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> B!             STORE BYTE TO MEMORY  ($00A8 - $00AC)
;   Pops a 16-bit address and a value from the Parameter Stack and stores
;   the low-order byte into memory. (Opcode: $04)
;=========================================================================================
_Bbang:
            pop     hl                  ; Pop target byte-address
            pop     de                  ; Pop byte value
            ld      (hl),e              ; Store low-order byte to memory
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> ZERO           CLEAR 16-BIT WORD IN MEMORY  ($00AD - $00B4)
;   Pops a memory address from the Parameter Stack and clears the 16-bit word
;   at that location to zero. (Opcode: $73)
;=========================================================================================
_ZERO:
            pop     hl                  ; Pop target memory address
            ld      (hl),$00            ; Clear LSB in memory to zero
            inc     hl                  ; Advance memory pointer
            ld      (hl),$00            ; Clear MSB in memory to zero
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> +              16-BIT INTEGER ADDITION  ($00B5 - $00BA)
;   Pops two 16-bit values from the Parameter Stack, adds them together,
;   and pushes the 16-bit sum back onto the stack. (Opcode: $14)
;=========================================================================================
_plus:
            pop     de                  ; Pop second operand from parameter stack
            pop     hl                  ; Pop first operand from parameter stack
            add     hl,de               ; Calculate 16-bit sum
            push    hl                  ; Push sum onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> -              16-BIT INTEGER SUBTRACTION  ($00BB - $00C2)
;   Pops two 16-bit values from the Parameter Stack, subtracts the top value
;   from the second value, and pushes the result. (Opcode: $1F)
;=========================================================================================
_minus:
            pop     de                  ; Pop subtrahend from parameter stack
            pop     hl                  ; Pop minuend from parameter stack
            xor     a                   ; Clear carry flag
            sbc     hl,de               ; Subtract subtrahend from minuend
            push    hl                  ; Push difference onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 1-             DECREMENT TOP STACK ITEM  ($00C3 - $00C7)
;   Pops the top 16-bit value from the Parameter Stack, decrements it by 1,
;   and pushes the result back onto the stack. (Opcode: $0A)
;=========================================================================================
_1minus:
            pop     hl                  ; Pop target value from parameter stack
            dec     hl                  ; Decrement value by 1
            push    hl                  ; Push decremented result onto stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 1+             INCREMENT TOP STACK ITEM  ($00C8 - $00CC)
;   Pops the top 16-bit value from the Parameter Stack, increments it by 1,
;   and pushes the result back onto the stack. (Opcode: $09)
;=========================================================================================
_1plus:
            pop     hl                  ; Pop target value from parameter stack
            inc     hl                  ; Increment value by 1
            push    hl                  ; Push result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 2+             ADD TWO TO TOP STACK ITEM  ($00CD - $00D2)
;   Pops the top 16-bit value from the Parameter Stack, increments it by 2,
;   and pushes the result back onto the stack. (Opcode: $2A)
;=========================================================================================
_2plus:
            pop     hl                  ; Pop target value from parameter stack
            inc     hl                  ; Increment value by 1
            inc     hl                  ; Increment value by 1
            push    hl                  ; Push result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 2-             SUBTRACT TWO FROM TOP STACK ITEM  ($00D3 - $00D8)
;   Pops the top 16-bit value from the Parameter Stack, decrements it by 2,
;   and pushes the result back onto the stack. (Opcode: $2B)
;=========================================================================================
_2minus:
            pop     hl                  ; Pop target value from parameter stack
            dec     hl                  ; Decrement value by 1
            dec     hl                  ; Decrement value by 1
            push    hl                  ; Push result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 2*             MULTIPLY TOP STACK ITEM BY TWO  ($00D9 - $00DD)
;   Pops the top 16-bit value from the Parameter Stack, shifts it left by 1 bit,
;   and pushes the doubled value back onto the stack. (Opcode: $18)
;=========================================================================================
_2star:
            pop     hl                  ; Pop target value from parameter stack
            add     hl,hl               ; Shift left 1 bit (multiply by 2)
            push    hl                  ; Push result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 2/             DIVIDE TOP STACK ITEM BY TWO  ($00DE - $00E5)
;   Pops the top 16-bit signed integer from the Parameter Stack, shifts it right
;   arithmetically by 1 bit, and pushes the quotient back onto the stack. (Opcode: $1A)
;=========================================================================================
_2slash:
            pop     hl                  ; Pop target value from parameter stack
            sra     h                   ; Arithmetic shift right high byte
            rr      l                   ; Rotate right low byte with carry
            push    hl                  ; Push result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> B@+7           FETCH CHARACTER AND STRIP HIGH BIT  ($00E6 - $00F1)
;   Fetches byte at address, advances pointer, strips bit 7 end-of-string flag,
;   and pushes the zero-extended character code and updated pointer.
;=========================================================================================
_Bat_inc7:

;=========================================================================================
; ----> _COUNT  Native entry $00E6
;=========================================================================================
            pop     hl                  ; Pop string address from parameter stack
            ld      a,(hl)              ; Read character byte
            inc     hl                  ; Advance string pointer
            push    hl                  ; Push updated string pointer
            ld      l,a                 ; Move character code to low byte
            res     7,l                 ; Strip bit 7 string-end flag
            ld      h,$00               ; Zero-extend high byte
            push    hl                  ; Push character code onto stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 1+B!           INCREMENT BYTE IN MEMORY  ($00F2 - $00F5)
;   Pops a byte address from the Parameter Stack and increments the byte value
;   stored at that memory location by 1.
;=========================================================================================

_1plusBbang:

;=========================================================================================
; ----> _1plusBat  Native entry $00F2
;=========================================================================================
            pop     hl                  ; Pop target byte address
            inc     (hl)                ; Increment byte value in memory
            jp      (iy)                ; Return to TERSE inner interpreter
;=========================================================================================
; ----> =              EQUAL COMPARISON  ($00F6 - $00F7)
;   Pops two 16-bit values from the Parameter Stack, compares them, and pushes
;   1 (true) if they are equal or 0 (false) if they are not. (Opcode: $27)
;=========================================================================================
_equal:
            pop     de                  ; Pop second operand from parameter stack
            pop     hl                  ; Pop first operand from parameter stack
            xor     a                   ; Clear carry flag
            sbc     hl,de               ; Compare operands via subtraction
            ld      hl,$0000            ; Default result to 0 (false)
            jp      nz,$0102            ; If not equal, skip to push false
            inc     hl                  ; Set result to 1 (true)
            push    hl                  ; Push boolean result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> <>             NOT EQUAL COMPARISON  ($0105 - $0113)
;   Pops two 16-bit values from the Parameter Stack, compares them, and pushes
;   1 (true) if they are not equal or 0 (false) if they are equal.
;=========================================================================================
_not_equal:
            pop     de                  ; Pop second operand from parameter stack
            pop     hl                  ; Pop first operand from parameter stack
            xor     a                   ; Clear carry flag
            sbc     hl,de               ; Compare operands via subtraction
            ld      hl,$0000            ; Default result to 0 (false)
            jp      z,$0111             ; If equal, skip to push false
            inc     hl                  ; Set result to 1 (true)
            push    hl                  ; Push boolean result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> <              SIGNED LESS THAN COMPARISON  ($0114 - $0127)
;   Pops two signed 16-bit integers from the Parameter Stack and pushes 1 (true)
;   if the first is strictly less than the second, otherwise 0 (false).
;=========================================================================================
_less:

;=========================================================================================
; ----> _less_than  Native entry $0114
;=========================================================================================
            pop     de                  ; Pop second operand (n) from parameter stack
            pop     hl                  ; Pop first operand (m) from parameter stack
            xor     a                   ; Clear carry flag
            sbc     hl,de               ; Compute m - n
            ld      de,$0000            ; Default result to 0 (false)
            push    af                  ; Save flags resulting from subtraction
            pop     hl                  ; Move flags into HL
            ld      a,l                 ; Extract Z80 status flags byte
            and     $84                 ; Mask Sign (bit 7) and Overflow (bit 2) flags
            jp      pe,$0125            ; If sign matches overflow flag, m >= n
            inc     de                  ; Set result to 1 (true, m < n)
            push    de                  ; Push boolean result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> >=             SIGNED GREATER OR EQUAL COMPARISON  ($0128 - $013B)
;   Pops two signed 16-bit integers from the Parameter Stack and pushes 1 (true)
;   if the first is greater than or equal to the second, otherwise 0 (false).
;=========================================================================================
_gt_equal:
            pop     de                  ; Pop second operand (n) from parameter stack
            pop     hl                  ; Pop first operand (m) from parameter stack
            xor     a                   ; Clear carry flag
            sbc     hl,de               ; Compute m - n
            ld      de,$0000            ; Default result to 0 (false)
            push    af                  ; Save flags resulting from subtraction
            pop     hl                  ; Move flags into HL
            ld      a,l                 ; Extract Z80 status flags byte
            and     $84                 ; Mask Sign (bit 7) and Overflow (bit 2) flags
            jp      po,$0139            ; If sign differs from overflow flag, m < n
            inc     de                  ; Set result to 1 (true, m >= n)
            push    de                  ; Push boolean result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> >              SIGNED GREATER THAN COMPARISON  ($013C - $0140)
;   Pops two signed 16-bit integers from the Parameter Stack in reverse order
;   and branches to the signed less-than handler to evaluate m > n.
;=========================================================================================
_gt:

;=========================================================================================
; ----> _greater_than  Native entry $013C
;=========================================================================================
            pop     hl                  ; Pop first operand (m)
            pop     de                  ; Pop second operand (n)
            jp      $0116               ; Jump into signed less-than evaluation

;=========================================================================================
; ----> 0=             TEST IF EQUAL TO ZERO  ($0141 - $0146)
;   Pops a 16-bit value from the Parameter Stack, sets second operand to 0,
;   and jumps into the equal comparison primitive. (Opcode: $28)
;=========================================================================================
_zeroequal:
            ld      de,$0000            ; Load 0 as second operand
            jp      $00F7               ; Jump into equal comparison routine

;=========================================================================================
; ----> AND            BITWISE LOGICAL AND  ($0147 - $0151)
;   Pops two 16-bit words from the Parameter Stack, performs a bitwise AND,
;   and pushes the 16-bit logical result back onto the stack. (Opcode: $1A)
;=========================================================================================
_AND:
            pop     de                  ; Pop second 16-bit operand
            pop     hl                  ; Pop first 16-bit operand
            ld      a,l                 ; Perform bitwise AND on LSB
            and     e
            ld      l,a
            ld      a,h                 ; Perform bitwise AND on MSB
            and     d
            ld      h,a
            push    hl                  ; Push bitwise result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
;=========================================================================================
; ----> OR             BITWISE LOGICAL INCLUSIVE OR  ($0152 - $015C)
;   Pops two 16-bit values from the Parameter Stack, performs a bitwise inclusive
;   OR operation, and pushes the result back onto the stack. (Opcode: $1D)
;=========================================================================================
_OR:
            pop     de                  ; Pop second 16-bit operand
            pop     hl                  ; Pop first 16-bit operand
            ld      a,l                 ; Perform bitwise OR on LSB
            or      e
            ld      l,a
            ld      a,h                 ; Perform bitwise OR on MSB
            or      d
            ld      h,a
            push    hl                  ; Push bitwise result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> XOR            BITWISE LOGICAL EXCLUSIVE OR  ($015D - $0167)
;   Pops two 16-bit words from the Parameter Stack, performs a bitwise Exclusive-OR,
;   and pushes the result back onto the stack. (Opcode: $1C)
;=========================================================================================
_XOR:
            pop     de                  ; Pop second 16-bit operand
            pop     hl                  ; Pop first 16-bit operand
            ld      a,l                 ; Perform bitwise XOR on LSB
            xor     e
            ld      l,a
            ld      a,h                 ; Perform bitwise XOR on MSB
            xor     d
            ld      h,a
            push    hl                  ; Push bitwise result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> BMOVE          BLOCK MEMORY COPY  ($0168 - $0175)
;   Block-transfers BC bytes from source address (HL) to destination address (DE).
;   Takes count, destination, and source from the Parameter Stack. (Opcode: $0B)
;=========================================================================================
;=========================================================================================
; ----> _BMOVE  Native entry $0168
;=========================================================================================
            exx                         ; Save TERSE VM registers in alternate set
            pop     bc                  ; Pop byte count (u)
            pop     de                  ; Pop destination memory address
            pop     hl                  ; Pop source memory address
            ld      a,b                 ; Test if byte count is zero
            or      c
            jp      z,$0173             ; If count is zero, skip block transfer
            ldir                        ; Block copy BC bytes from (HL) to (DE)
            exx                         ; Restore TERSE VM registers
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> DO             INITIALIZE COUNTED DO-LOOP  ($0176 - $0190)
;   Allocates a 3-word frame on the Return Stack (IX), pops initial index and limit
;   from the Parameter Stack, and stores loop state and calling IP. (Opcode: $15)
;=========================================================================================
_DO:
            ld      de,$FFFA            ; Offset to allocate 3 words on Return Stack
            add     ix,de               ; Move Return Stack Pointer (IX) down 6 bytes
            pop     hl                  ; Pop loop initial index (x1)
            pop     de                  ; Pop loop limit value (x2)
            ld      (ix+$00),l          ; Store loop index LSB on Return Stack
            ld      (ix+$01),h          ; Store loop index MSB on Return Stack
            ld      (ix+$02),e          ; Store loop limit LSB on Return Stack
            ld      (ix+$03),d          ; Store loop limit MSB on Return Stack
            ld      (ix+$04),c          ; Store current IP LSB (loop body start)
            ld      (ix+$05),b          ; Store current IP MSB (loop body start)
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> LOOP           INCREMENT AND TEST DO-LOOP  ($0191 - $01BE)
;   Increments the innermost DO-loop index on the Return Stack by 1 and checks
;   against the limit. Branches back to loop start or deallocates frame. (Opcode: $18)
;=========================================================================================
_LOOP:
            ld      l,(ix+$00)          ; Read current loop index from Return Stack
            ld      h,(ix+$01)
            inc     hl                  ; Increment loop index by 1
            ld      (ix+$00),l          ; Store updated index back to Return Stack
            ld      (ix+$01),h
            ld      e,(ix+$02)          ; Read loop limit value from Return Stack
            ld      d,(ix+$03)
            xor     a                   ; Clear carry flag
            sbc     hl,de               ; Compare index against limit (index - limit)
            push    af                  ; Save comparison flags
            pop     hl                  ; Move flags into HL
            ld      a,l                 ; Extract status flags byte
            and     $84                 ; Mask Sign (bit 7) and Overflow (bit 2) flags
            jp      po,$01B7            ; If sign matches overflow, loop continues
            ld      de,$0006            ; Loop complete: deallocate 3-word loop frame
            add     ix,de               ; Advance Return Stack Pointer (IX)
            jp      $01BD               ; Jump to exit loop and return to interpreter
            ld      c,(ix+$04)          ; Loop continues: reload loop start IP into BC
            ld      b,(ix+$05)
            jp      (iy)                ; Return to TERSE inner interpreter
;=========================================================================================
; ----> R@             FETCH FROM RETURN STACK  ($01BF - $01C7)
;   Copies the top 16-bit word from the Return Stack (IX) without popping it
;   and pushes the value onto the Parameter Stack. (Opcode: $16)
;=========================================================================================
_Rat:
            ld      l,(ix+$00)          ; Read Return Stack top LSB
            ld      h,(ix+$01)          ; Read Return Stack top MSB
            push    hl                  ; Push copied word onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> OVER           DUPLICATE SECOND STACK ITEM  ($01C8 - $01CE)
;   Copies the second 16-bit word on the Parameter Stack to the top of the stack.
;   (Opcode: $13)
;=========================================================================================
_OVER:
            pop     hl                  ; Pop top value from parameter stack
            pop     de                  ; Pop second value from parameter stack
            push    de                  ; Push second value back
            push    hl                  ; Push top value back
            push    de                  ; Push copy of second value onto stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> SWAB           SWAP HIGH AND LOW BYTES  ($01CF - $01D5)
;   Pops a 16-bit word from the Parameter Stack, exchanges its high and low bytes,
;   and pushes the byte-swapped word back onto the stack.
;=========================================================================================
_SWAB:
            pop     hl                  ; Pop target word from parameter stack
            ld      e,l                 ; Swap high and low bytes via DE register
            ld      l,h
            ld      h,e
            push    hl                  ; Push byte-swapped word onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> OUTP           OUTPUT BYTE TO HARDWARE PORT  ($01D6 - $01DD)
;   Pops 16-bit port number (BC) and 8-bit data value (L) from Parameter Stack
;   and writes data to the specified hardware output port. (Opcode: $4B)
;=========================================================================================
_OUTP:
            exx                         ; Save TERSE VM registers in alternate set
            pop     bc                  ; Pop 16-bit port address (C=port, B=sub-port)
            pop     hl                  ; Pop 16-bit value (L = 8-bit data byte)
            out     (c),l               ; Output byte L to hardware port C
            exx                         ; Restore TERSE VM registers
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> INP            INPUT BYTE FROM HARDWARE PORT  ($01DE - $01E7)
;   Pops 16-bit port number (BC) from Parameter Stack, reads an 8-bit byte from
;   the hardware port, zero-extends it, and pushes the result. (Opcode: $7E)
;=========================================================================================
_INP:
            exx                         ; Save TERSE VM registers in alternate set
            pop     bc                  ; Pop 16-bit port address (C=port, B=sub-port)
            in      l,(c)               ; Read byte from hardware port C into L
            ld      h,$00               ; Zero-extend high byte
            push    hl                  ; Push 16-bit input value onto parameter stack
            exx                         ; Restore TERSE VM registers
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> ROT            ROTATE TOP THREE STACK ITEMS  ($01E8 - $01EE)
;   Rotates the top three 16-bit items on the Parameter Stack, bringing the
;   third item (deepest) to the top position. (Opcode: $05)
;=========================================================================================
_ROT:
            pop     de                  ; Pop top value (first item)
            pop     hl                  ; Pop second value
            ex      (sp),hl             ; Swap second value with third value on stack
            push    de                  ; Push top value into second position
            push    hl                  ; Push third value into top position
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> PICK           FETCH N-TH STACK ITEM  ($01EF - $01F8)
;   Pops 1-based index (n) from Parameter Stack, calculates stack frame offset
;   relative to SP, fetches the 16-bit word, and pushes it onto the stack.
;=========================================================================================
_PICK:
            pop     hl                  ; Pop 1-based stack index (n)
            dec     hl                  ; Convert to 0-based offset
            add     hl,hl               ; Convert word index to byte offset
            add     hl,sp               ; Calculate stack memory address
            ld      e,(hl)              ; Read low byte from target stack location
            inc     hl                  ; Advance pointer
            ld      d,(hl)              ; Read high byte from target stack location
            push    de                  ; Push indexed word onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> BRANCH         UNCONDITIONAL INSTRUCTION BRANCH  ($01F9 - $0200)
;   Reads a 16-bit destination address from the instruction stream (BC)
;   and updates the Instruction Pointer to branch unconditionally. (Opcode: $1F)
;=========================================================================================
_BRANCH:
            ld      a,(bc)              ; Fetch destination LSB from instruction stream
            ld      e,a
            inc     bc                  ; Advance instruction pointer
            ld      a,(bc)              ; Fetch destination MSB from instruction stream
            ld      b,a                 ; Load new IP high byte
            ld      c,e                 ; Load new IP low byte
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 0BRANCH        BRANCH IF ZERO / FALSE  ($0201 - $020A)
;   Pops a boolean flag from Parameter Stack. If 0 (false), branches to inline
;   destination address; if non-zero (true), skips destination word. (Opcode: $1E)
;=========================================================================================
_0BRANCH:
            pop     hl                  ; Pop boolean test flag from parameter stack
            ld      a,h                 ; Test if 16-bit flag is zero
            or      l
            jp      z,_BRANCH_TAKEN             ; If zero (false), branch to load jump address
            inc     bc                  ; If non-zero (true), skip inline jump address
            inc     bc
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> A"             BRANCH TRAMPOLINE / INLINE STRING  ($020B - $0218)
;   $020B jumps to the branch primitive. The string entry at $020E pushes BC and skips
;   IP past the length-prefixed inline string data.
;=========================================================================================
            jp      _BRANCH               ; Jump to branch handler
            push    bc                  ; Push string address onto parameter stack
            ld      a,(bc)              ; Read string length byte from stream
            inc     bc                  ; Advance pointer past length byte
            ld      l,a                 ; Load length into L
            ld      h,$00               ; Zero-extend length
            add     hl,bc               ; Calculate address past string data
            ld      b,h                 ; Update Instruction Pointer (BC)
            ld      c,l
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> _SSTORE  TERSE block 304; ROM $0219-$021C
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $01                 ; $021A: SWAP
            DB      $02                 ; $021B: !
            DB      $03                 ; $021C: RETURN

;=========================================================================================
; ----> _SBSTORE  TERSE block 304; ROM $021D-$0220
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $01                 ; $021E: SWAP
            DB      $04                 ; $021F: B!
            DB      $03                 ; $0220: RETURN
            pop     af                  ; Restore primary accumulator & flags
            pop     bc                  ; Restore primary BC registers
            pop     de                  ; Restore primary DE registers
            pop     hl                  ; Restore primary HL registers
            exx                         ; Switch to alternate register set
            ex      af,af'              ; Switch to alternate AF flags
            pop     af                  ; Restore alternate accumulator & flags
            pop     bc                  ; Restore alternate BC registers
            pop     de                  ; Restore alternate DE registers
            pop     hl                  ; Restore alternate HL registers
            ei                          ; Enable hardware interrupts
            ret                         ; Return from interrupt service routine

;=========================================================================================
; ----> INTSTART       INITIALIZE IM2 INTERRUPT VECTOR  ($022D - $0241)
;   Pops vector address from Parameter Stack, stores it at $7C00, configures Z80
;   Interrupt Page Register I=$7C, and enables Interrupt Mode 2. (Opcode: $78)
;=========================================================================================
_INTSTART:
            di                          ; Disable interrupts during vector setup
            pop     hl                  ; Pop interrupt handler address from stack
            ld      (RAM_IPNT),hl          ; Store handler address in vector table
            ld      a,$08               ; Set interrupt mode control
            out     ($0E),a
            ld      a,$7C               ; Load vector table high page byte
            ld      i,a                 ; Set Z80 Interrupt Vector Register
            ld      a,$00
            out     ($0D),a             ; Clear interrupt vector register
            im      2                   ; Set Z80 Interrupt Mode 2
            ei                          ; Enable interrupts
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> DI             DISABLE INTERRUPTS  ($0242 - $0244)
;   Disables hardware interrupts and returns to inner interpreter. (Opcode: $A0)
;=========================================================================================
_DI:
            di                          ; Disable hardware interrupts
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> EI             ENABLE INTERRUPTS  ($0245 - $0247)
;   Enables hardware interrupts and returns to inner interpreter. (Opcode: $25)
;=========================================================================================
_EI:
            ei                          ; Enable hardware interrupts
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> SWABN          SWAP LOW BYTE NIBBLES  ($0248 - $0252)
;   Pops 16-bit word from Parameter Stack, rotates low byte nibbles 4 bits left,
;   and pushes the result back onto the stack. (Opcode: $20)
;=========================================================================================
_SWABN:
            pop     hl                  ; Pop target word from parameter stack
            ld      a,l                 ; Extract low byte
            rlca                        ; Rotate nibbles left 4 bits
            rlca
            rlca
            rlca
            ld      l,a                 ; Store swapped nibble byte back into L
            push    hl                  ; Push result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
            rst     $08                 ; Enter the inline TERSE thread
            DB      $05                 ; $0254: ROT
            DB      $05                 ; $0255: ROT
            DB      $06                 ; $0256: 2DUP
            DB      $02                 ; $0257: !
            DB      $01                 ; $0258: SWAP
            DB      $07                 ; $0259: DROP
            DB      $08                 ; $025A: DUP
            DB      $09                 ; $025B: 1+
            DB      $05                 ; $025C: ROT
            DB      $0A                 ; $025D: 1-
            DB      $0B                 ; $025E: BMOVE
            DB      $03                 ; $025F: RETURN

;=========================================================================================
; ----> NPICK          PUSH COPIES OF NTH STACK ITEM  ($0260 - $0274)
;   Pops item count from stack, iterates through parameter stack frame, and pushes
;   copied 16-bit words back onto the Parameter Stack.
;=========================================================================================
_NPICK:
            exx                         ; Save TERSE VM registers in alternate set
            pop     bc                  ; Pop item count from parameter stack
            dec     c                   ; Decrement loop count
            ld      hl,$0001            ; Offset to target stack frame
            add     hl,sp               ; Add stack pointer
            add     hl,bc               ; Multiply count by 2 for word offset
            add     hl,bc
_NPICK_LOOP:
            ld      d,(hl)              ; Read high byte from stack
            dec     hl                  ; Decrement stack pointer
            ld      e,(hl)              ; Read low byte from stack
            push    de                  ; Push copied word onto stack
            dec     hl                  ; Decrement stack pointer
            dec     c                   ; Decrement loop counter
            jp      p,_NPICK_LOOP       ; Loop until all requested items copied
            exx                         ; Restore TERSE VM registers
            jp      (iy)                ; Return to TERSE inner interpreter

;=========================================================================================
; ----> RND            SCALED RANDOM VALUE  ($0275 - $02D0)
;   Advances 32-bit LCG random seed at $7C02/$7C04 and performs a 32-bit unsigned
;   multiplication, pushing the scaled high word onto the Parameter Stack.
;=========================================================================================
;=========================================================================================
; ----> _RND  Native entry $0275
;=========================================================================================
            exx                         ; Save TERSE VM registers in alternate set
            ld      bc,(RAM_RND_LOW)          ; Load low 16 bits of 32-bit random seed
            ld      hl,$1321            ; Low word of 32-bit LCG multiplier
            add     hl,bc               ; Accumulate low word
            push    hl                  ; Save intermediate low result on stack
            ld      hl,$2776            ; High word of 32-bit LCG multiplier
            adc     hl,bc               ; Accumulate high word
            ld      de,(RAM_RND_HIGH)          ; Load high 16 bits of 32-bit random seed
            add     hl,de
            ex      (sp),hl
            add     hl,bc
            ex      (sp),hl
            adc     hl,de
            ex      (sp),hl
            add     hl,bc
            ex      (sp),hl
            adc     hl,de
            ex      (sp),hl
            ld      d,e
            ld      e,b
            ld      b,c
            ld      c,$00
            add     hl,bc
            ld      (RAM_RND_LOW),hl          ; Store updated low word of random seed
            pop     hl
            adc     hl,de
            ld      (RAM_RND_HIGH),hl          ; Store updated high word of random seed
            exx                         ; Switch to primary register set
            ld      hl,$0000            ; Clear 32-bit accumulator low word
            ld      d,h                 ; Clear 32-bit accumulator high word
            ld      e,l
            exx                         ; Switch to alternate register set
            ex      de,hl               ; Move multiplicand into DE
            pop     bc                  ; Pop multiplier operand from stack
            ld      hl,$0000            ; Clear product low word
_MULU_LOOP:
            srl     b                   ; Shift multiplier right 1 bit
            rr      c
            jp      nc,_MULU_SKIP       ; If bit 0 clear, skip addition
            add     hl,de               ; Add multiplicand to product low word
            exx                         ; Switch to primary set for high word add
            adc     hl,de               ; Add multiplicand to product high word
            exx                         ; Switch back to alternate set
_MULU_SKIP:
            ld      a,b                 ; Test if multiplier is zero
            or      c
            jp      z,_MULU_DONE        ; If zero, multiplication complete
            sla     e                   ; Shift multiplicand left 1 bit
            rl      d
            exx                         ; Switch to primary set for high word shift
            rl      e
            rl      d
            exx                         ; Switch back to alternate set
            jp      _MULU_LOOP          ; Continue multiplication loop
_MULU_DONE:
            exx                         ; Switch to primary set
            push    hl                  ; Push result onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
;=========================================================================================


;=========================================================================================
; ----> Large character font ($02D1-$0438)
;
; SIZE: 1 byte x 10 rows per glyph; # = set bit, . = clear bit.
; Rows run top to bottom; pixels run from bit 7 at left to bit 0 at right.
;=========================================================================================

; Glyph ' ' ($02D1-$02DA)
_FONT_SPACE:
            DB      $00                 ; ........
            DB      $00                 ; ........
            DB      $00                 ; ........
            DB      $00                 ; ........
            DB      $00                 ; ........
            DB      $00                 ; ........
            DB      $00                 ; ........
            DB      $00                 ; ........
            DB      $00                 ; ........
            DB      $00                 ; ........

; Glyph '0' ($02DB-$02E4)
CHRTBL:
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph '1' ($02E5-$02EE)
            DB      $18                 ; ...##...
            DB      $38                 ; ..###...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $3C                 ; ..####..
            DB      $3C                 ; ..####..

; Glyph '2' ($02EF-$02F8)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $06                 ; .....##.
            DB      $3E                 ; ..#####.
            DB      $7C                 ; .#####..
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.

; Glyph '3' ($02F9-$0302)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $06                 ; .....##.
            DB      $1C                 ; ...###..
            DB      $1E                 ; ...####.
            DB      $06                 ; .....##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph '4' ($0303-$030C)
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.

; Glyph '5' ($030D-$0316)
            DB      $7C                 ; .#####..
            DB      $7C                 ; .#####..
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $7C                 ; .#####..
            DB      $7E                 ; .######.
            DB      $06                 ; .....##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph '6' ($0317-$0320)
            DB      $3C                 ; ..####..
            DB      $7C                 ; .#####..
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $7C                 ; .#####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph '7' ($0321-$032A)
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.
            DB      $06                 ; .....##.
            DB      $0E                 ; ....###.
            DB      $0C                 ; ....##..
            DB      $1C                 ; ...###..
            DB      $18                 ; ...##...
            DB      $38                 ; ..###...
            DB      $30                 ; ..##....
            DB      $30                 ; ..##....

; Glyph '8' ($032B-$0334)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph '9' ($0335-$033E)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3E                 ; ..#####.
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.
            DB      $3E                 ; ..#####.
            DB      $3C                 ; ..####..

; Glyph 'A' ($033F-$0348)
            DB      $18                 ; ...##...
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.

; Glyph 'B' ($0349-$0352)
            DB      $7C                 ; .#####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7C                 ; .#####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $7C                 ; .#####..

; Glyph 'C' ($0353-$035C)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph 'D' ($035D-$0366)
            DB      $7C                 ; .#####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $7C                 ; .#####..

; Glyph 'E' ($0367-$0370)
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $7C                 ; .#####..
            DB      $7C                 ; .#####..
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.

; Glyph 'F' ($0371-$037A)
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $7C                 ; .#####..
            DB      $7C                 ; .#####..
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....

; Glyph 'G' ($037B-$0384)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $6E                 ; .##.###.
            DB      $6E                 ; .##.###.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph 'H' ($0385-$038E)
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.

; Glyph 'I' ($038F-$0398)
            DB      $3C                 ; ..####..
            DB      $3C                 ; ..####..
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $3C                 ; ..####..
            DB      $3C                 ; ..####..

; Glyph 'J' ($0399-$03A2)
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.
            DB      $06                 ; .....##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph 'K' ($03A3-$03AC)
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $6E                 ; .##.###.
            DB      $7C                 ; .#####..
            DB      $78                 ; .####...
            DB      $78                 ; .####...
            DB      $6C                 ; .##.##..
            DB      $6E                 ; .##.###.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.

; Glyph 'L' ($03AD-$03B6)
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.

; Glyph 'M' ($03B7-$03C0)
            DB      $C3                 ; ##....##
            DB      $E7                 ; ###..###
            DB      $E7                 ; ###..###
            DB      $DB                 ; ##.##.##
            DB      $DB                 ; ##.##.##
            DB      $C3                 ; ##....##
            DB      $C3                 ; ##....##
            DB      $C3                 ; ##....##
            DB      $C3                 ; ##....##
            DB      $C3                 ; ##....##

; Glyph 'N' ($03C1-$03CA)
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $76                 ; .###.##.
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.
            DB      $6E                 ; .##.###.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.

; Glyph 'O' ($03CB-$03D4)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph 'P' ($03D5-$03DE)
            DB      $7C                 ; .#####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $7C                 ; .#####..
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....
            DB      $60                 ; .##.....

; Glyph 'Q' ($03DF-$03E8)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $6E                 ; .##.###.
            DB      $64                 ; .##..#..
            DB      $3A                 ; ..###.#.

; Glyph 'R' ($03E9-$03F2)
            DB      $7C                 ; .#####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $7C                 ; .#####..
            DB      $6E                 ; .##.###.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.

; Glyph 'S' ($03F3-$03FC)
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $60                 ; .##.....
            DB      $7C                 ; .#####..
            DB      $3E                 ; ..#####.
            DB      $06                 ; .....##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph 'T' ($03FD-$0406)
            DB      $7E                 ; .######.
            DB      $7E                 ; .######.
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...

; Glyph 'U' ($0407-$0410)
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..

; Glyph 'V' ($0411-$041A)
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..
            DB      $3C                 ; ..####..
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...

; Glyph 'W' ($041B-$0424)
            DB      $C3                 ; ##....##
            DB      $C3                 ; ##....##
            DB      $C3                 ; ##....##
            DB      $DB                 ; ##.##.##
            DB      $DB                 ; ##.##.##
            DB      $DB                 ; ##.##.##
            DB      $FF                 ; ########
            DB      $E7                 ; ###..###
            DB      $C3                 ; ##....##
            DB      $C3                 ; ##....##

; Glyph 'X' ($0425-$042E)
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $3C                 ; ..####..
            DB      $7E                 ; .######.
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.

; Glyph 'Y' ($042F-$0438)
            DB      $66                 ; .##..##.
            DB      $66                 ; .##..##.
            DB      $7E                 ; .######.
            DB      $3C                 ; ..####..
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...
            DB      $18                 ; ...##...

;=========================================================================================
; ----> TEXT_CREDITS  CREDITS  ($0439-$044C)
;
; SIZE: 4 bytes x 5 rows; # = set bit, . = clear bit.
; Each preview group contains 4 ROM bits, most significant bit first.
;=========================================================================================
;                                                                  C    R    E    D    I    T    S
            DB      $EC, $EC, $EE, $E0                          ; ###. ##.. ###. ##.. ###. ###. ###. ....
            DB      $8A, $8A, $44, $80                          ; #... #.#. #... #.#. .#.. .#.. #... ....
            DB      $8C, $CA, $44, $E0                          ; #... ##.. ##.. #.#. .#.. .#.. ###. ....
            DB      $8A, $8A, $44, $20                          ; #... #.#. #... #.#. .#.. .#.. ..#. ....
            DB      $EA, $EC, $E4, $E0                          ; ###. #.#. ###. ##.. ###. .#.. ###. ....

;=========================================================================================
; ----> TEXT_ISITOR  ISITOR; suffix after the large V  ($044D-$045B)
;
; SIZE: 3 bytes x 5 rows; # = set bit, . = clear bit.
; Each preview group contains 4 ROM bits, most significant bit first.
;=========================================================================================
;                                                                  I    S    I    T    O    R
            DB      $EE, $EE, $EC                               ; ###. ###. ###. ###. ###. ##..
            DB      $48, $44, $AA                               ; .#.. #... .#.. .#.. #.#. #.#.
            DB      $4E, $44, $AC                               ; .#.. ###. .#.. .#.. #.#. ##..
            DB      $42, $44, $AA                               ; .#.. ..#. .#.. .#.. #.#. #.#.
            DB      $EE, $E4, $EA                               ; ###. ###. ###. .#.. ###. #.#.

;=========================================================================================
; ----> TEXT_OME  OME; suffix after the large H  ($045C-$0465)
;
; SIZE: 2 bytes x 5 rows; # = set bit, . = clear bit.
; Each preview group contains 4 ROM bits, most significant bit first.
;=========================================================================================
;                                                                  O    M    E
            DB      $EA, $E0                                    ; ###. #.#. ###. ....
            DB      $AE, $80                                    ; #.#. ###. #... ....
            DB      $AE, $C0                                    ; #.#. ###. ##.. ....
            DB      $AA, $80                                    ; #.#. #.#. #... ....
            DB      $EA, $E0                                    ; ###. #.#. ###. ....

;=========================================================================================
; ----> TEXT_INNINGS  Inning digits 1 through 9  ($0466-$0492)
;
; SIZE: 9 bytes x 5 rows; # = set bit, . = clear bit.
; Each preview group contains 8 ROM bits, most significant bit first.
;=========================================================================================
;                                                                    1        2        3        4        5        6        7        8        9
            DB      $40, $E0, $E0, $A0, $E0, $E0, $E0, $E0, $E0 ; .#...... ###..... ###..... #.#..... ###..... ###..... ###..... ###..... ###.....
            DB      $40, $20, $20, $A0, $80, $80, $20, $A0, $A0 ; .#...... ..#..... ..#..... #.#..... #....... #....... ..#..... #.#..... #.#.....
            DB      $40, $E0, $60, $E0, $C0, $E0, $40, $E0, $E0 ; .#...... ###..... .##..... ###..... ##...... ###..... .#...... ###..... ###.....
            DB      $40, $80, $20, $20, $20, $A0, $40, $A0, $20 ; .#...... #....... ..#..... ..#..... ..#..... #.#..... .#...... #.#..... ..#.....
            DB      $40, $E0, $E0, $20, $C0, $E0, $40, $E0, $E0 ; .#...... ###..... ###..... ..#..... ##...... ###..... .#...... ###..... ###.....

;=========================================================================================
; ----> TEXT_UP  UP  ($0493-$0497)
;
; SIZE: 1 byte x 5 rows; # = set bit, . = clear bit.
; Each preview group contains 4 ROM bits, most significant bit first.
;=========================================================================================
;                                                                  U    P
            DB      $AE                                         ; #.#. ###.
            DB      $AA                                         ; #.#. #.#.
            DB      $AE                                         ; #.#. ###.
            DB      $A8                                         ; #.#. #...
            DB      $E8                                         ; ###. #...

;=========================================================================================
; ----> TEXT_YOU_ARE  YOU ARE  ($0498-$04AB)
;
; SIZE: 4 bytes x 5 rows; # = set bit, . = clear bit.
; Each preview group contains 4 ROM bits, most significant bit first.
;=========================================================================================
;                                                                  Y    O    U         A    R    E
            DB      $AE, $A0, $EC, $E0                          ; #.#. ###. #.#. .... ###. ##.. ###. ....
            DB      $AA, $A0, $AA, $80                          ; #.#. #.#. #.#. .... #.#. #.#. #... ....
            DB      $4A, $A0, $EC, $C0                          ; .#.. #.#. #.#. .... ###. ##.. ##.. ....
            DB      $4A, $A0, $AA, $80                          ; .#.. #.#. #.#. .... #.#. #.#. #... ....
            DB      $4E, $E0, $AA, $E0                          ; .#.. ###. ###. .... #.#. #.#. ###. ....
;=========================================================================================
; ----> NOBOD  TERSE block 107  ($04AC-$04B1)
; SIZE: 1x2
;=========================================================================================
            DB      $00, $00, $01, $02  ; X/Y hotspot, row width, row count
            DB      $00                 ; ........
            DB      $00                 ; ........
;=========================================================================================
; ----> BALLPAT  TERSE block 107  ($04B2-$04B9)
; SIZE: 2x2
;=========================================================================================
            DB      $00, $00, $02, $02  ; X/Y hotspot, row width, row count
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
;=========================================================================================
; ----> UPTRI  TERSE block 107  ($04BA-$04BE)
; SIZE: 1x5
;=========================================================================================
            DB      $F8                 ; #####...
            DB      $F0                 ; ####....
            DB      $E0                 ; ###.....
            DB      $C0                 ; ##......
            DB      $80                 ; #.......
;=========================================================================================
; ----> DNTRI  TERSE block 107  ($04BF-$04C3)
; SIZE: 1x5
;=========================================================================================
            DB      $08                 ; ....#...
            DB      $18                 ; ...##...
            DB      $38                 ; ..###...
            DB      $78                 ; .####...
            DB      $F8                 ; #####...
;=========================================================================================
; ----> IMRK  TERSE block 107  ($04C4-$04C6)
; SIZE: 1x3
;=========================================================================================
            DB      $F8                 ; #####...
            DB      $70                 ; .###....
            DB      $20                 ; ..#.....
;=========================================================================================
; ----> TUP1M  TERSE block 108  ($04C7-$04E2)
; SIZE: 2x12
;=========================================================================================
            DB      $07, $06, $02, $0C  ; X/Y hotspot, row width, row count
            DB      $07, $00            ; .....###........
            DB      $07, $00            ; .....###........
            DB      $0F, $80            ; ....#####.......
            DB      $FF, $80            ; #########.......
            DB      $0F, $C0            ; ....######......
            DB      $0F, $A0            ; ....#####.#.....
            DB      $0F, $90            ; ....#####..#....
            DB      $0F, $80            ; ....#####.......
            DB      $0D, $80            ; ....##.##.......
            DB      $0D, $80            ; ....##.##.......
            DB      $1D, $80            ; ...###.##.......
            DB      $01, $C0            ; .......###......
;=========================================================================================
; ----> TUP2M  TERSE block 108  ($04E3-$04FA)
; SIZE: 2x10
;=========================================================================================
            DB      $06, $05, $02, $0A  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $1E, $00            ; ...####.........
            DB      $FE, $00            ; #######.........
            DB      $1F, $00            ; ...#####........
            DB      $1E, $80            ; ...####.#.......
            DB      $1E, $00            ; ...####.........
            DB      $12, $00            ; ...#..#.........
            DB      $32, $00            ; ..##..#.........
            DB      $03, $00            ; ......##........
;=========================================================================================
; ----> TUP3M  TERSE block 108  ($04FB-$050E)
; SIZE: 2x8
;=========================================================================================
            DB      $05, $04, $02, $08  ; X/Y hotspot, row width, row count
            DB      $08, $00            ; ....#...........
            DB      $1C, $00            ; ...###..........
            DB      $FE, $00            ; #######.........
            DB      $1B, $00            ; ...##.##........
            DB      $1C, $00            ; ...###..........
            DB      $1C, $00            ; ...###..........
            DB      $34, $00            ; ..##.#..........
            DB      $06, $00            ; .....##.........
;=========================================================================================
; ----> TUP4M  TERSE block 108  ($050F-$051E)
; SIZE: 2x6
;=========================================================================================
            DB      $04, $03, $02, $06  ; X/Y hotspot, row width, row count
            DB      $10, $00            ; ...#............
            DB      $38, $00            ; ..###...........
            DB      $FC, $00            ; ######..........
            DB      $38, $00            ; ..###...........
            DB      $38, $00            ; ..###...........
            DB      $6C, $00            ; .##.##..........
;=========================================================================================
; ----> TUP1F  TERSE block 108  ($051F-$053E)
; SIZE: 2x14
;=========================================================================================
            DB      $01, $07, $02, $0E  ; X/Y hotspot, row width, row count
            DB      $80, $00            ; #...............
            DB      $80, $00            ; #...............
            DB      $B0, $00            ; #.##............
            DB      $B0, $00            ; #.##............
            DB      $78, $00            ; .####...........
            DB      $7C, $00            ; .#####..........
            DB      $7A, $00            ; .####.#.........
            DB      $79, $00            ; .####..#........
            DB      $78, $00            ; .####...........
            DB      $78, $00            ; .####...........
            DB      $F8, $00            ; #####...........
            DB      $D8, $00            ; ##.##...........
            DB      $98, $00            ; #..##...........
            DB      $1C, $00            ; ...###..........
;=========================================================================================
; ----> TUP2F  TERSE block 108  ($053F-$0558)
; SIZE: 2x11
;=========================================================================================
            DB      $01, $05, $02, $0B  ; X/Y hotspot, row width, row count
            DB      $80, $00            ; #...............
            DB      $B0, $00            ; #.##............
            DB      $B0, $00            ; #.##............
            DB      $70, $00            ; .###............
            DB      $78, $00            ; .####...........
            DB      $74, $00            ; .###.#..........
            DB      $70, $00            ; .###............
            DB      $70, $00            ; .###............
            DB      $D0, $00            ; ##.#............
            DB      $90, $00            ; #..#............
            DB      $18, $00            ; ...##...........
;=========================================================================================
; ----> TUP3F  TERSE block 108  ($0559-$056E)
; SIZE: 2x9
;=========================================================================================
            DB      $01, $04, $02, $09  ; X/Y hotspot, row width, row count
            DB      $80, $00            ; #...............
            DB      $A0, $00            ; #.#.............
            DB      $F0, $00            ; ####............
            DB      $68, $00            ; .##.#...........
            DB      $60, $00            ; .##.............
            DB      $60, $00            ; .##.............
            DB      $E0, $00            ; ###.............
            DB      $A0, $00            ; #.#.............
            DB      $30, $00            ; ..##............
;=========================================================================================
; ----> TUP4F  TERSE block 108  ($056F-$0580)
; SIZE: 2x7
;=========================================================================================
            DB      $01, $03, $02, $07  ; X/Y hotspot, row width, row count
            DB      $80, $00            ; #...............
            DB      $A0, $00            ; #.#.............
            DB      $F0, $00            ; ####............
            DB      $06, $00            ; .....##.........
            DB      $E0, $00            ; ###.............
            DB      $A0, $00            ; #.#.............
            DB      $30, $00            ; ..##............
;=========================================================================================
; ----> RUP3M  TERSE block 109  ($0581-$0594)
; SIZE: 2x8
;=========================================================================================
            DB      $03, $04, $02, $08  ; X/Y hotspot, row width, row count
            DB      $10, $00            ; ...#............
            DB      $30, $00            ; ..##............
            DB      $78, $00            ; .####...........
            DB      $34, $00            ; ..##.#..........
            DB      $30, $00            ; ..##............
            DB      $30, $00            ; ..##............
            DB      $20, $00            ; ..#.............
            DB      $30, $00            ; ..##............
;=========================================================================================
; ----> RUP4M  TERSE block 109  ($0595-$05A4)
; SIZE: 2x6
;=========================================================================================
            DB      $03, $03, $02, $06  ; X/Y hotspot, row width, row count
            DB      $10, $00            ; ...#............
            DB      $38, $00            ; ..###...........
            DB      $70, $00            ; .###............
            DB      $B8, $00            ; #.###...........
            DB      $20, $00            ; ..#.............
            DB      $30, $00            ; ..##............
;=========================================================================================
; ----> RUP0M  TERSE block 109  ($05A5-$05C4)
; SIZE: 2x14
;=========================================================================================
            DB      $06, $07, $02, $0E  ; X/Y hotspot, row width, row count
            DB      $06, $00            ; .....##.........
            DB      $06, $00            ; .....##.........
            DB      $0E, $00            ; ....###.........
            DB      $1F, $00            ; ...#####........
            DB      $1F, $00            ; ...#####........
            DB      $1E, $80            ; ...####.#.......
            DB      $1E, $80            ; ...####.#.......
            DB      $0E, $00            ; ....###.........
            DB      $0E, $00            ; ....###.........
            DB      $0E, $00            ; ....###.........
            DB      $0E, $00            ; ....###.........
            DB      $0F, $00            ; ....####........
            DB      $0C, $00            ; ....##..........
            DB      $0E, $00            ; ....###.........
;=========================================================================================
; ----> RUP1M  TERSE block 109  ($05C5-$05E0)
; SIZE: 2x12
;=========================================================================================
            DB      $04, $06, $02, $0C  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $1E, $00            ; ...####.........
            DB      $3F, $00            ; ..######........
            DB      $3D, $00            ; ..####.#........
            DB      $3C, $00            ; ..####..........
            DB      $1C, $00            ; ...###..........
            DB      $1C, $00            ; ...###..........
            DB      $1C, $00            ; ...###..........
            DB      $1E, $00            ; ...####.........
            DB      $18, $00            ; ...##...........
            DB      $1C, $00            ; ...###..........
;=========================================================================================
; ----> RUP2M  TERSE block 109  ($05E1-$05F8)
; SIZE: 2x10
;=========================================================================================
            DB      $04, $05, $02, $0A  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $1E, $00            ; ...####.........
            DB      $3F, $00            ; ..######........
            DB      $3D, $00            ; ..####.#........
            DB      $1C, $00            ; ...###..........
            DB      $1C, $00            ; ...###..........
            DB      $1E, $00            ; ...####.........
            DB      $18, $00            ; ...##...........
            DB      $1C, $00            ; ...###..........
;=========================================================================================
; ----> RUP0B  TERSE block 109  ($05F9-$0616)
; SIZE: 2x13
;=========================================================================================
            DB      $06, $07, $02, $0D  ; X/Y hotspot, row width, row count
            DB      $06, $00            ; .....##.........
            DB      $06, $00            ; .....##.........
            DB      $1E, $00            ; ...####.........
            DB      $2F, $E0            ; ..#.#######.....
            DB      $4E, $00            ; .#..###.........
            DB      $8E, $00            ; #...###.........
            DB      $0E, $00            ; ....###.........
            DB      $0F, $00            ; ....####........
            DB      $1F, $80            ; ...######.......
            DB      $19, $80            ; ...##..##.......
            DB      $F9, $80            ; #####..##.......
            DB      $F9, $80            ; #####..##.......
            DB      $80, $C0            ; #.......##......
;=========================================================================================
; ----> ONBASE2  TERSE block 109  ($0617-$062E)
; SIZE: 2x10
;=========================================================================================
            DB      $0A, $05, $02, $0A  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $1E, $00            ; ...####.........
            DB      $3F, $00            ; ..######........
            DB      $5F, $80            ; .#.######.......
            DB      $8F, $40            ; #...####.#......
            DB      $07, $00            ; .....###........
            DB      $0F, $00            ; ....####........
            DB      $19, $00            ; ...##..#........
            DB      $33, $00            ; ..##..##........
;=========================================================================================
; ----> RUP1B  TERSE block 110  ($062F-$0648)
; SIZE: 2x11
;=========================================================================================
            DB      $04, $06, $02, $0B  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $1C, $00            ; ...###..........
            DB      $3F, $80            ; ..#######.......
            DB      $5C, $00            ; .#.###..........
            DB      $9C, $00            ; #..###..........
            DB      $1E, $00            ; ...####.........
            DB      $1F, $00            ; ...#####........
            DB      $F3, $00            ; ####..##........
            DB      $F3, $00            ; ####..##........
            DB      $83, $80            ; #.....###.......
;=========================================================================================
; ----> RUP2B  TERSE block 110  ($0649-$065E)
; SIZE: 2x9
;=========================================================================================
            DB      $04, $05, $02, $09  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $3F, $80            ; ..#######.......
            DB      $5C, $00            ; .#.###..........
            DB      $9C, $00            ; #..###..........
            DB      $1E, $00            ; ...####.........
            DB      $FF, $00            ; ########........
            DB      $F3, $00            ; ####..##........
            DB      $83, $80            ; #.....###.......
;=========================================================================================
; ----> RUP3B  TERSE block 110  ($065F-$0670)
; SIZE: 2x7
;=========================================================================================
            DB      $03, $04, $02, $07  ; X/Y hotspot, row width, row count
            DB      $10, $00            ; ...#............
            DB      $7C, $00            ; .#####..........
            DB      $B0, $00            ; #.##............
            DB      $30, $00            ; ..##............
            DB      $38, $00            ; ..###...........
            DB      $E8, $00            ; ###.#...........
            DB      $8C, $00            ; #...##..........
;=========================================================================================
; ----> RUP4B  TERSE block 110  ($0671-$0680)
; SIZE: 2x6
;=========================================================================================
            DB      $03, $03, $02, $06  ; X/Y hotspot, row width, row count
            DB      $10, $00            ; ...#............
            DB      $7C, $00            ; .#####..........
            DB      $B0, $00            ; #.##............
            DB      $38, $00            ; ..###...........
            DB      $68, $00            ; .##.#...........
            DB      $4C, $00            ; .#..##..........
;=========================================================================================
; ----> CBUP1  TERSE block 110  ($0681-$069C)
; SIZE: 2x12
;=========================================================================================
            DB      $01, $05, $02, $0C  ; X/Y hotspot, row width, row count
            DB      $60, $00            ; .##.............
            DB      $60, $00            ; .##.............
            DB      $E0, $00            ; ###.............
            DB      $E4, $00            ; ###..#..........
            DB      $E4, $00            ; ###..#..........
            DB      $F8, $00            ; #####...........
            DB      $E0, $00            ; ###.............
            DB      $E0, $00            ; ###.............
            DB      $E0, $00            ; ###.............
            DB      $E0, $00            ; ###.............
            DB      $E0, $00            ; ###.............
            DB      $70, $00            ; .###............
;=========================================================================================
; ----> CBUP2  TERSE block 110  ($069D-$06B6)
; SIZE: 2x11
;=========================================================================================
            DB      $01, $05, $02, $0B  ; X/Y hotspot, row width, row count
            DB      $60, $00            ; .##.............
            DB      $60, $00            ; .##.............
            DB      $E0, $00            ; ###.............
            DB      $E4, $00            ; ###..#..........
            DB      $E4, $00            ; ###..#..........
            DB      $F8, $00            ; #####...........
            DB      $E0, $00            ; ###.............
            DB      $E0, $00            ; ###.............
            DB      $E0, $00            ; ###.............
            DB      $E0, $00            ; ###.............
            DB      $70, $00            ; .###............
;=========================================================================================
; ----> PTMID  TERSE block 110  ($06B7-$06D2)
; SIZE: 2x12
;=========================================================================================
            DB      $06, $06, $02, $0C  ; X/Y hotspot, row width, row count
            DB      $06, $00            ; .....##.........
            DB      $06, $00            ; .....##.........
            DB      $7F, $00            ; .#######........
            DB      $8F, $00            ; #...####........
            DB      $7F, $00            ; .#######........
            DB      $0F, $00            ; ....####........
            DB      $4F, $00            ; .#..####........
            DB      $7F, $00            ; .#######........
            DB      $7F, $00            ; .#######........
            DB      $06, $00            ; .....##.........
            DB      $06, $00            ; .....##.........
            DB      $0E, $00            ; ....###.........
;=========================================================================================
; ----> ONBASE1  TERSE block 110  ($06D3-$06EC)
; SIZE: 2x11
;=========================================================================================
            DB      $07, $06, $02, $0B  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $1F, $00            ; ...#####........
            DB      $3F, $C0            ; ..########......
            DB      $5F, $A0            ; .#.######.#.....
            DB      $8F, $80            ; #...#####.......
            DB      $07, $80            ; .....####.......
            DB      $07, $80            ; .....####.......
            DB      $0C, $80            ; ....##..#.......
            DB      $18, $80            ; ...##...#.......
            DB      $31, $80            ; ..##...##.......
;=========================================================================================
; ----> FUP1B  TERSE block 111  ($06ED-$0706)
; SIZE: 2x11
;=========================================================================================
            DB      $06, $05, $02, $0B  ; X/Y hotspot, row width, row count
            DB      $01, $80            ; .......##.......
            DB      $01, $80            ; .......##.......
            DB      $03, $80            ; ......###.......
            DB      $07, $C0            ; .....#####......
            DB      $0F, $A0            ; ....#####.#.....
            DB      $1F, $10            ; ...#####...#....
            DB      $FE, $00            ; #######.........
            DB      $FE, $00            ; #######.........
            DB      $86, $00            ; #....##.........
            DB      $06, $00            ; .....##.........
            DB      $07, $00            ; .....###........
;=========================================================================================
; ----> FUP2B  TERSE block 111  ($0707-$071C)
; SIZE: 2x9
;=========================================================================================
            DB      $05, $04, $02, $09  ; X/Y hotspot, row width, row count
            DB      $03, $00            ; ......##........
            DB      $03, $00            ; ......##........
            DB      $07, $00            ; .....###........
            DB      $0F, $80            ; ....#####.......
            DB      $1E, $40            ; ...####..#......
            DB      $FC, $20            ; ######....#.....
            DB      $FC, $00            ; ######..........
            DB      $8C, $00            ; #...##..........
            DB      $0E, $00            ; ....###.........
;=========================================================================================
; ----> FUP1M  TERSE block 111  ($071D-$0736)
; SIZE: 2x11
;=========================================================================================
            DB      $03, $05, $02, $0B  ; X/Y hotspot, row width, row count
            DB      $03, $00            ; ......##........
            DB      $03, $00            ; ......##........
            DB      $07, $00            ; .....###........
            DB      $0F, $80            ; ....#####.......
            DB      $1F, $40            ; ...#####.#......
            DB      $3E, $20            ; ..#####...#.....
            DB      $3C, $00            ; ..####..........
            DB      $38, $00            ; ..###...........
            DB      $3C, $00            ; ..####..........
            DB      $30, $00            ; ..##............
            DB      $38, $00            ; ..###...........
;=========================================================================================
; ----> FUP2M  TERSE block 111  ($0737-$074C)
; SIZE: 2x9
;=========================================================================================
            DB      $03, $04, $02, $09  ; X/Y hotspot, row width, row count
            DB      $03, $00            ; ......##........
            DB      $03, $00            ; ......##........
            DB      $07, $00            ; .....###........
            DB      $0F, $80            ; ....#####.......
            DB      $1E, $40            ; ...####..#......
            DB      $3C, $20            ; ..####....#.....
            DB      $38, $00            ; ..###...........
            DB      $30, $00            ; ..##............
            DB      $38, $00            ; ..###...........
;=========================================================================================
; ----> BATMID  TERSE block 111  ($074D-$0754)
; SIZE: 2x2
;=========================================================================================
            DB      $00, $00, $02, $02  ; X/Y hotspot, row width, row count
            DB      $FF, $FF            ; ################
            DB      $FF, $FF            ; ################
;=========================================================================================
; ----> BATU45  TERSE block 111  ($0755-$0772)
; SIZE: 2x13
;=========================================================================================
            DB      $00, $0C, $02, $0D  ; X/Y hotspot, row width, row count
            DB      $00, $18            ; ...........##...
            DB      $00, $38            ; ..........###...
            DB      $00, $70            ; .........###....
            DB      $00, $E0            ; ........###.....
            DB      $01, $C0            ; .......###......
            DB      $03, $80            ; ......###.......
            DB      $07, $00            ; .....###........
            DB      $0E, $00            ; ....###.........
            DB      $1C, $00            ; ...###..........
            DB      $38, $00            ; ..###...........
            DB      $70, $00            ; .###............
            DB      $E0, $00            ; ###.............
            DB      $C0, $00            ; ##..............
;=========================================================================================
; ----> BATU30  TERSE block 111  ($0773-$0788)
; SIZE: 2x9
;=========================================================================================
            DB      $00, $08, $02, $09  ; X/Y hotspot, row width, row count
            DB      $00, $06            ; .............##.
            DB      $00, $1E            ; ...........####.
            DB      $00, $7C            ; .........#####..
            DB      $01, $F0            ; .......#####....
            DB      $07, $C0            ; .....#####......
            DB      $1F, $00            ; ...#####........
            DB      $7C, $00            ; .#####..........
            DB      $F0, $00            ; ####............
            DB      $C0, $00            ; ##..............
;=========================================================================================
; ----> BATU90  TERSE block 111  ($0789-$07A2)
; SIZE: 2x11
;=========================================================================================
            DB      $00, $0D, $02, $0B  ; X/Y hotspot, row width, row count
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
;=========================================================================================
; ----> BATD30  TERSE block 112  ($07A3-$07B8)
; SIZE: 2x9
;=========================================================================================
            DB      $00, $00, $02, $09  ; X/Y hotspot, row width, row count
            DB      $C0, $00            ; ##..............
            DB      $F0, $00            ; ####............
            DB      $7C, $00            ; .#####..........
            DB      $1F, $00            ; ...#####........
            DB      $07, $C0            ; .....#####......
            DB      $01, $F0            ; .......#####....
            DB      $00, $7C            ; .........#####..
            DB      $00, $1E            ; ...........####.
            DB      $00, $06            ; .............##.
;=========================================================================================
; ----> BATD45  TERSE block 112  ($07B9-$07D6)
; SIZE: 2x13
;=========================================================================================
            DB      $00, $00, $02, $0D  ; X/Y hotspot, row width, row count
            DB      $C0, $00            ; ##..............
            DB      $E0, $00            ; ###.............
            DB      $70, $00            ; .###............
            DB      $38, $00            ; ..###...........
            DB      $1C, $00            ; ...###..........
            DB      $0E, $00            ; ....###.........
            DB      $07, $00            ; .....###........
            DB      $03, $80            ; ......###.......
            DB      $01, $C0            ; .......###......
            DB      $00, $E0            ; ........###.....
            DB      $00, $70            ; .........###....
            DB      $00, $38            ; ..........###...
            DB      $00, $18            ; ...........##...
;=========================================================================================
; ----> BATD90  TERSE block 112  ($07D7-$07F0)
; SIZE: 2x11
;=========================================================================================
            DB      $00, $00, $02, $0B  ; X/Y hotspot, row width, row count
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
            DB      $C0, $00            ; ##..............
;=========================================================================================
; ----> HOMEPLATE  TERSE block 112  ($07F1-$0802)
; SIZE: 2x7
;=========================================================================================
            DB      $04, $00, $02, $07  ; X/Y hotspot, row width, row count
            DB      $FE, $00            ; #######.........
            DB      $FE, $00            ; #######.........
            DB      $FE, $00            ; #######.........
            DB      $FE, $00            ; #######.........
            DB      $7C, $00            ; .#####..........
            DB      $38, $00            ; ..###...........
            DB      $10, $00            ; ...#............
;=========================================================================================
; ----> BASEPAT  TERSE block 112  ($0803-$080E)
; SIZE: 2x4
;=========================================================================================
            DB      $04, $00, $02, $04  ; X/Y hotspot, row width, row count
            DB      $F8, $00            ; #####...........
            DB      $F8, $00            ; #####...........
            DB      $F8, $00            ; #####...........
            DB      $F8, $00            ; #####...........
;=========================================================================================
; ----> BASE2PAT  TERSE block 112  ($080F-$0818)
; SIZE: 2x3
;=========================================================================================
            DB      $04, $00, $02, $03  ; X/Y hotspot, row width, row count
            DB      $F0, $00            ; ####............
            DB      $F0, $00            ; ####............
            DB      $F0, $00            ; ####............
;=========================================================================================
; ----> STN1  TERSE block 112  ($0819-$0834)
; SIZE: 2x12
;=========================================================================================
            DB      $04, $06, $02, $0C  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $3F, $00            ; ..######........
            DB      $7F, $80            ; .########.......
            DB      $9E, $40            ; #..####..#......
            DB      $9E, $40            ; #..####..#......
            DB      $9E, $40            ; #..####..#......
            DB      $1E, $00            ; ...####.........
            DB      $12, $00            ; ...#..#.........
            DB      $12, $00            ; ...#..#.........
            DB      $12, $00            ; ...#..#.........
            DB      $33, $00            ; ..##..##........
;=========================================================================================
; ----> STN2  TERSE block 112  ($0835-$084C)
; SIZE: 2x10
;=========================================================================================
            DB      $04, $05, $02, $0A  ; X/Y hotspot, row width, row count
            DB      $0C, $00            ; ....##..........
            DB      $0C, $00            ; ....##..........
            DB      $3F, $00            ; ..######........
            DB      $7F, $80            ; .########.......
            DB      $9E, $40            ; #..####..#......
            DB      $9E, $40            ; #..####..#......
            DB      $1E, $00            ; ...####.........
            DB      $12, $00            ; ...#..#.........
            DB      $12, $00            ; ...#..#.........
            DB      $33, $00            ; ..##..##........
;=========================================================================================
; ----> STN3  TERSE block 113  ($084D-$0860)
; SIZE: 2x8
;=========================================================================================
            DB      $03, $04, $02, $08  ; X/Y hotspot, row width, row count
            DB      $10, $00            ; ...#............
            DB      $7C, $00            ; .#####..........
            DB      $BA, $00            ; #.###.#.........
            DB      $BA, $00            ; #.###.#.........
            DB      $38, $00            ; ..###...........
            DB      $28, $00            ; ..#.#...........
            DB      $28, $00            ; ..#.#...........
            DB      $6C, $00            ; .##.##..........
;=========================================================================================
; ----> STN4  TERSE block 113  ($0861-$0870)
; SIZE: 2x6
;=========================================================================================
            DB      $03, $03, $02, $06  ; X/Y hotspot, row width, row count
            DB      $10, $00            ; ...#............
            DB      $7C, $00            ; .#####..........
            DB      $BA, $00            ; #.###.#.........
            DB      $BA, $00            ; #.###.#.........
            DB      $28, $00            ; ..#.#...........
            DB      $6C, $00            ; .##.##..........
;=========================================================================================
; ----> STNPT  TERSE block 113  ($0871-$088C)
; SIZE: 2x12
;=========================================================================================
            DB      $06, $06, $02, $0C  ; X/Y hotspot, row width, row count
            DB      $07, $00            ; .....###........
            DB      $07, $00            ; .....###........
            DB      $1F, $C0            ; ...#######......
            DB      $3F, $E0            ; ..#########.....
            DB      $4F, $90            ; .#..#####..#....
            DB      $4F, $90            ; .#..#####..#....
            DB      $4F, $90            ; .#..#####..#....
            DB      $0F, $80            ; ....#####.......
            DB      $0D, $80            ; ....##.##.......
            DB      $0D, $80            ; ....##.##.......
            DB      $0D, $80            ; ....##.##.......
            DB      $1D, $C0            ; ...###.###......

;=========================================================================================
; ----> RUNUP0  Animation pointer table ($088D-$0890)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
RUNUP0:
            DW      RUP0B, RUP0M

;=========================================================================================
; ----> RUNUP1  Animation pointer table ($0891-$0894)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
RUNUP1:
            DW      RUP1B, RUP1M

;=========================================================================================
; ----> RUNUP2  Animation pointer table ($0895-$0898)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
RUNUP2:
            DW      RUP2B, RUP2M

;=========================================================================================
; ----> RUNUP3  Animation pointer table ($0899-$089C)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
RUNUP3:
            DW      RUP3B, RUP3M

;=========================================================================================
; ----> RUNUP4  Animation pointer table ($089D-$08A0)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
RUNUP4:
            DW      RUP4B, RUP4M

;=========================================================================================
; ----> FLDUP1  Animation pointer table ($08A1-$08A4)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
FLDUP1:
            DW      FUP1B, FUP1M

;=========================================================================================
; ----> FLDUP2  Animation pointer table ($08A5-$08A8)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
FLDUP2:
            DW      FUP2B, FUP2M

;=========================================================================================
; ----> NOBOD0  Animation pointer table ($08A9-$08AC)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
NOBOD0:
            DW      NOBOD, NOBOD

;=========================================================================================
; ----> BALL0  Animation pointer table ($08AD-$08B0)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
BALL0:
            DW      BALLPAT, BALLPAT

;=========================================================================================
; ----> ONBS1  Animation pointer table ($08B1-$08B4)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
ONBS1:
            DW      ONBASE1, ONBASE1

;=========================================================================================
; ----> ONBS2  Animation pointer table ($08B5-$08B8)
;
; TERSE block 186; little-endian pattern addresses.
;=========================================================================================
ONBS2:
            DW      ONBASE2, ONBASE2

;=========================================================================================
; ----> THRWUP1  Animation pointer table ($08B9-$08BC)
;
; TERSE block 187; little-endian pattern addresses.
;=========================================================================================
THRWUP1:
            DW      TUP1M, TUP1F

;=========================================================================================
; ----> THRWUP2  Animation pointer table ($08BD-$08C0)
;
; TERSE block 187; little-endian pattern addresses.
;=========================================================================================
THRWUP2:
            DW      TUP2M, TUP2F

;=========================================================================================
; ----> THRWUP3  Animation pointer table ($08C1-$08C4)
;
; TERSE block 187; little-endian pattern addresses.
;=========================================================================================
THRWUP3:
            DW      TUP3M, TUP3F

;=========================================================================================
; ----> THRWUP4  Animation pointer table ($08C5-$08C8)
;
; TERSE block 187; little-endian pattern addresses.
;=========================================================================================
THRWUP4:
            DW      TUP4M, TUP4F

;=========================================================================================
; ----> PTTHW1  Animation pointer table ($08C9-$08CC)
;
; TERSE block 187; little-endian pattern addresses.
;=========================================================================================
PTTHW1:
            DW      PTMID, TUP1F

;=========================================================================================
; ----> STCB1  Animation pointer table ($08CD-$08D0)
;
; TERSE block 187; little-endian pattern addresses.
;=========================================================================================
STCB1:
            DW      TUP1M, TUP1M

;=========================================================================================
; ----> STCB2  Animation pointer table ($08D1-$08D4)
;
; TERSE block 187; little-endian pattern addresses.
;=========================================================================================
STCB2:
            DW      TUP2M, TUP2M

;=========================================================================================
; ----> STND1  Animation pointer table ($08D5-$08D8)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
STND1:
            DW      STN1, STN1

;=========================================================================================
; ----> STND2  Animation pointer table ($08D9-$08DC)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
STND2:
            DW      STN2, STN2

;=========================================================================================
; ----> STND3  Animation pointer table ($08DD-$08E0)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
STND3:
            DW      STN3, STN3

;=========================================================================================
; ----> STND4  Animation pointer table ($08E1-$08E4)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
STND4:
            DW      STN4, STN4

;=========================================================================================
; ----> STPT1  Animation pointer table ($08E5-$08E8)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
STPT1:
            DW      STNPT, STNPT

;=========================================================================================
; ----> CVRBUP1  Animation pointer table ($08E9-$08EC)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
CVRBUP1:
            DW      CBUP1, CBUP1

;=========================================================================================
; ----> CVRBUP2  Animation pointer table ($08ED-$08F0)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
CVRBUP2:
            DW      CBUP2, CBUP2

;=========================================================================================
; ----> BALLM  Animation pointer table ($08F1-$08FA)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
BALLM:
            DW      BALL0, BALL0, BALL0, BALL0, BALL0

;=========================================================================================
; ----> STCB  Animation pointer table ($08FB-$0900)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
STCB:
            DW      STCB1, STCB1, STCB2

;=========================================================================================
; ----> STNDPT  Animation pointer table ($0901-$0904)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
STNDPT:
            DW      STPT1, STPT1

;=========================================================================================
; ----> PTPT  Animation pointer table ($0905-$0908)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
PTPT:
            DW      PTTHW1, PTTHW1

;=========================================================================================
; ----> ONBASE  Animation pointer table ($0909-$090E)
;
; TERSE block 188; little-endian pattern and animation table addresses.
;=========================================================================================
ONBASE:
            DW      ONBS1, ONBS1, ONBS2

;=========================================================================================
; ----> CVRBUP  Animation pointer table ($090F-$0914)
;
; TERSE block 189; animation sequence and perspective table addresses.
;=========================================================================================
CVRBUP:
            DW      CVRBUP1, CVRBUP1, CVRBUP2

;=========================================================================================
; ----> THRWUP  Animation pointer table ($0915-$091E)
;
; TERSE block 189; animation sequence and perspective table addresses.
;=========================================================================================
THRWUP:
            DW      THRWUP1, THRWUP1, THRWUP2, THRWUP3, THRWUP4

;=========================================================================================
; ----> NOBODY  Animation pointer table ($091F-$0928)
;
; TERSE block 189; animation sequence and perspective table addresses.
;=========================================================================================
NOBODY:
            DW      NOBOD0, NOBOD0, NOBOD0, NOBOD0, NOBOD0

;=========================================================================================
; ----> RUNUP  Animation pointer table ($0929-$0932)
;
; TERSE block 189; animation sequence and perspective table addresses.
;=========================================================================================
RUNUP:
            DW      RUNUP0, RUNUP1, RUNUP2, RUNUP3, RUNUP4

;=========================================================================================
; ----> FLDUP  Animation pointer table ($0933-$0938)
;
; TERSE block 189; animation sequence and perspective table addresses.
;=========================================================================================
FLDUP:
            DW      FLDUP1, FLDUP1, FLDUP2

;=========================================================================================
; ----> STNDS  Animation pointer table ($0939-$0942)
;
; TERSE block 189; animation sequence and perspective table addresses.
;=========================================================================================
STNDS:
            DW      STND1, STND1, STND2, STND3, STND4

;=========================================================================================
; ----> PATTERNS  Animation pointer table ($0943-$0958)
;
; TERSE block 189; animation sequence and perspective table addresses.
;=========================================================================================
PATTERNS:
            DW      RUNUP, FLDUP, THRWUP, CVRBUP, STNDS, NOBODY, BALLM, STCB, STNDPT, PTPT, ONBASE

;=========================================================================================
; ----> ENDMUSIC  Music shutdown stream ($0959-$0966)
;
; Zero both volume registers and all three tone periods, then terminate playback.
;=========================================================================================
ENDMUSIC:
            DB      $16, $00            ; A/B volumes = 0
            DB      $15, $00            ; Noise/C volumes = 0
            DB      $11, $00            ; Tone A period = 0
            DB      $12, $00            ; Tone B period = 0
            DB      $13, $00            ; Tone C period = 0
            DB      $04                 ; End/repeat command
ENDMUSIC_HOLD:
            DB      $03                 ; Branch and yield
            DW      ENDMUSIC_HOLD       ; Stay silent between ticks

;=========================================================================================
; ----> FETCH_7C1C     FETCH BYTE FROM RAM POINTER 7C1C  ($0967 - $096B)
;   Loads the memory pointer stored at $7C1C into HL and fetches the byte at
;   that address into register A.
;=========================================================================================
_FETCH_7C1C:
            ld      hl,(RAM_MUSPC)          ; Load RAM script/stream pointer into HL
            ld      a,(hl)              ; Fetch byte from target address
            ret                         ; Return

;=========================================================================================
; ----> INC_7C1C       INCREMENT RAM POINTER 7C1C  ($096C - $0973)
;   Loads the memory pointer stored at $7C1C into HL, increments it by 1,
;   and writes the updated 16-bit address back to $7C1C.
;=========================================================================================
_INC_7C1C:
            ld      hl,(RAM_MUSPC)          ; Load RAM script/stream pointer into HL
            inc     hl                  ; Advance pointer by 1 byte
            ld      (RAM_MUSPC),hl          ; Store updated pointer back to RAM
            ret

;=========================================================================================
; ----> _GET_STREAM_BYTE  FETCH BYTE FROM VM STREAM      ($0974 - $097D)
;   Fetches the next 8-bit byte from the script stream pointer ($7C1C),
;   increments the pointer, and returns the byte zero-extended in HL.
;=========================================================================================
_GET_STREAM_BYTE:
            call    _FETCH_7C1C               ; Fetch next script byte from stream pointer ($7C1C)
            call    _INC_7C1C               ; Advance stream pointer to next byte
            ld      h,$00               ; Zero-extend high byte of fetched value
            ld      l,a                 ; Place fetched byte into low byte of HL
            ret                         ; Return with zero-extended value in HL

;=========================================================================================
; ----> _BRANCH_STREAM BRANCH STREAM POINTER                               ($097E - $0988)
;   Fetches a 16-bit destination address from the script stream pointer ($7C1C) and
;   updates the stream pointer to branch unconditionally to that target address.
;=========================================================================================
_BRANCH_STREAM:
            ld      hl,(RAM_MUSPC)          ; Load stream pointer stored at $7C1C into HL
            ld      e,(hl)              ; Fetch branch destination low byte from stream
            inc     hl                  ; Advance stream pointer to destination high byte
            ld      d,(hl)              ; Fetch branch destination high byte from stream
            ld      (RAM_MUSPC),de          ; Store updated branch destination back into $7C1C
            ret                         ; Return to stream interpreter loop

;=========================================================================================
; ----> _AUD_TICK            CHECK SOUND STREAM DELAY                          ($0989 - $0997)
;   Checks if the active sound stream frame delay counter ($7C23) is currently non-zero.
;   Decrements the delay counter if active; otherwise, continues command execution.
;=========================================================================================
_AUD_TICK:
            push    bc                  ; Preserve stream pointer
            ld      a,(RAM_NOTETIMER)           ; Load active sound stream delay counter
            or      a                   ; Check if a stream delay is currently active
            jp      z,_AUD_FETCH_CMD             ; If delay timer is zero, fetch next command
            dec     a                   ; Decrement active delay timer
            ld      (RAM_NOTETIMER),a           ; Store updated delay value back to RAM
            jp      nz,$0A12            ; If delay still active, exit tick immediately

;=========================================================================================
; ----> _AUD_FETCH_CMD            FETCH AND DECODE SOUND COMMAND                    ($0998 - $09A1)
;   Fetches the next command byte from the script stream pointer ($7C1C), advances
;   the pointer, and jumps to check other commands if the command is non-zero.
;=========================================================================================
_AUD_FETCH_CMD:
            call    _FETCH_7C1C               ; Fetch next sound command byte from stream pointer
            call    _INC_7C1C               ; Advance stream pointer to next byte in RAM
            or      a                   ; Check if command byte is zero (CMD 0: Port Output)
            jp      nz,_AUD_CHECK_CMD1            ; If non-zero, jump to check other stream commands

;=========================================================================================
; ----> L09A2            DECODE SOUND PORT OUTPUT COMMAND                  ($09A2 - $09BF)
;   Processes Command 0 (Sound Port Output) by fetching the port address, Value 1, and
;   Value 2 from the stream, updating the LCG random seed, and writing the combined
;   values directly to the hardware sound chip port.
;=========================================================================================
            call    _GET_STREAM_BYTE               ; Fetch first argument (low byte of port) into HL
            push    hl                  ; Push port address to stack
            call    _GET_STREAM_BYTE               ; Fetch second argument (Value 1) into HL
            push    hl                  ; Push Value 1 to stack
            call    _GET_STREAM_BYTE               ; Fetch third argument (Value 2) into HL
            push    hl                  ; Push Value 2 to stack
            ld      bc,_AUD_CMD0_RET            ; Load return hook address ($09B4)
            jp      _RND               ; Jump to double multiply / LCG routine

_AUD_CMD0_RET:
            inc     c                   ; LCG update math adjustment
            nop                         ; Padding
            pop     hl                  ; Pop Value 2 from stack
            pop     de                  ; Pop Value 1 from stack
            add     hl,de               ; Combine values (Value 1 + Value 2)
            pop     bc                  ; Pop Port Address from stack
            out     (c),l               ; Output combined value to hardware sound port
            xor     a                   ; Clear accumulator (no delay)
            jp      $0A12               ; Exit stream parser tick

;=========================================================================================
; ----> _AUD_CHECK_CMD1            DECODE REMAINING SOUND STREAM COMMANDS            ($09C0 - $0A17)
;   Parses and executes stream commands CMD 1 (Wait/Delay), CMD 2 (Branch), CMD 3 (Wait
;   with Attribute), CMD 4 (Loop/End Stream), and CMD >= 5 (Direct port register writes).
;=========================================================================================
_AUD_CHECK_CMD1:
            dec     a                   ; Check if command is 1 (CMD 1: Wait/Delay)
            jp      nz,_AUD_CHECK_CMD2            ; If not 1, branch to check next command
            call    _FETCH_7C1C               ; Fetch next byte (delay ticks) from stream into A
            ld      (RAM_NOTETIMER),a           ; Store ticks in active stream delay counter
            call    _INC_7C1C               ; Advance stream pointer in RAM
            or      $01                 ; Set non-zero status in accumulator
            jp      $0A12               ; Exit stream interpreter tick
_AUD_CHECK_CMD2:
            dec     a                   ; Check if command is 2 (CMD 2: Stream Branch)
            jp      nz,_AUD_CHECK_CMD3            ; If not 2, branch to check next command
            call    _BRANCH_STREAM               ; Fetch 16-bit address and branch stream pointer
            xor     a                   ; Clear accumulator (continue execution)
            jp      $0A12               ; Exit stream interpreter tick
_AUD_CHECK_CMD3:
            dec     a                   ; Check if command is 3 (CMD 3: Wait with Attribute)
            jp      nz,_AUD_CHECK_CMD4            ; If not 3, branch to check next command
            call    _BRANCH_STREAM               ; Fetch branch/attribute target from stream
            or      $01                 ; Set non-zero status in accumulator
            jp      $0A12               ; Exit stream interpreter tick
_AUD_CHECK_CMD4:
            dec     a                   ; Check if command is 4 (CMD 4: Loop/End Stream)
            jp      nz,_AUD_DIRECT_PORT            ; If not 4, branch to check next command
            ld      a,(RAM_MUSREPEAT)           ; Load stream active flag ($7C20)
            dec     a                   ; Decrement active flag
            ld      (RAM_MUSREPEAT),a           ; Store updated active flag back to RAM
            jp      z,_AUD_STOP_STREAM             ; If active flag is zero, branch to end stream
            ld      hl,(RAM_MUSSTART)          ; Load loop start pointer from $7C21 into HL
            ld      (RAM_MUSPC),hl          ; Loop back: restore stream pointer to $7C1C
            jp      $0A12               ; Exit stream interpreter tick
_AUD_STOP_STREAM:
            ld      ($7C24),a           ; Store zero in stream status ($7C24)
            jp      $0A12               ; Exit stream interpreter tick
_AUD_DIRECT_PORT:
            add     a,$04               ; Add port offset ($04) to command byte
            ld      c,a                 ; Move calculated hardware port address to C
            call    _FETCH_7C1C               ; Fetch next byte (port value) from stream
            out     (c),a               ; Output value directly to sound chip port in C
            call    _INC_7C1C               ; Advance stream pointer in RAM
            xor     a                   ; Clear accumulator (continue execution)
            or      a                   ; Test accumulator status
            jp      z,_AUD_FETCH_CMD             ; If zero (no delay), loop immediately to fetch next cmd
_AUD_TICK_EXIT:
            pop     bc                  ; Restore BC (stream pointer)
            ret                         ; Return to interrupt caller

;=========================================================================================
; ----> _AUD_INIT_POINTERS            INITIALIZE SOUND STREAM POINTERS                  ($0A18 - $0A1E)
;   Subroutine to initialize the active stream pointer ($7C1C) and the loop start
;   address pointer ($7C21) to the address passed in HL.
;=========================================================================================
_AUD_INIT_POINTERS:

;=========================================================================================
; ----> loadpc  Native entry $0A18
;=========================================================================================
            ld      (RAM_MUSPC),hl          ; Store stream pointer stored in HL to $7C1C
            ld      (RAM_MUSSTART),hl          ; Store loop start address stored in HL to $7C21
            ret                         ; Return to caller

;=========================================================================================

;=========================================================================================
; ----> music_gate  Native entry $0A1F
;=========================================================================================
            ld      a,($7C19)
            and     a
            ret     nz
            call    loadpc
            xor     a
            ld      (RAM_NOTETIMER),a
            inc     a
            ld      (RAM_MUSREPEAT),a
            ret
;=========================================================================================





;=========================================================================================
; ----> _BMUSIC  Native entry $0A30
;=========================================================================================
            pop     hl
            call    music_gate
            jp      (iy)

;=========================================================================================
; ----> _EMUSIC  Native entry $0A36
;=========================================================================================
            ld      hl,ENDMUSIC
            call    loadpc
            ld      a,$01
            ld      (RAM_NOTETIMER),a
            ld      (RAM_MUSREPEAT),a
            jp      (iy)
            djnz    $0A6B
            ld      d,$AB
            dec     d
            dec     bc
            inc     d
            nop
            inc     de
            ld      c,d
            ld      bc,$1201
            ld      b,(hl)
            ld      de,$135E
            ld      a,$01
            ld      bc,$4212
            inc     de
            scf
            ld      bc,$1201
            inc     (hl)
            inc     de
            ld      l,$01
            ld      bc,$2C12
            inc     de
            daa
            ld      bc,$1201
            dec     h
            inc     de
            ld      ($0101),hl
            ld      (de),a
            jr      nz,$0A88
            ld      a,$01
            ld      bc,$1D12
            inc     de
            jr      $0A7E
            ex      af,af'
            ld      (de),a
            rla
            ld      d,$00
            dec     d
            nop
            ld      de,$1200
            nop
            inc     de
            nop
            inc     b
            inc     bc
            adc     a,e
            ld      a,(bc)
;=========================================================================================
; ----> BALLSCORE  Music command stream  ($0A8E-$0AC3)
; Commands set sound registers, schedule durations, and branch to other streams.
;=========================================================================================
            DB      $10, $28, $16, $AB, $15, $0A, $14, $00; $0A8E
            DB      $11, $54, $12, $46, $13, $3E, $01, $02; $0A96
            DB      $11, $5E, $12, $4A, $13, $3E, $01, $02; $0A9E
            DB      $11, $64, $12, $54, $13, $3E, $01, $02; $0AA6
            DB      $11, $70, $12, $5E, $13, $3E, $01, $05; $0AAE
            DB      $16, $00, $15, $00, $11, $00, $12, $00; $0AB6
            DB      $13, $00, $04, $03, $C1, $0A; $0ABE
;=========================================================================================
; ----> COINSCORE  Music command stream  ($0AC4-$0AE3)
; Commands set sound registers, schedule durations, and branch to other streams.
;=========================================================================================
            DB      $10, $23, $16, $FF, $15, $2F, $17, $E8; $0AC4
            DB      $14, $52, $11, $4A, $12, $54, $13, $5E; $0ACC
            DB      $01, $12, $16, $00, $15, $00, $11, $00; $0AD4
            DB      $12, $00, $13, $00, $04, $03, $E1, $0A; $0ADC
;=========================================================================================
; ----> FOULSCORE  Music command stream  ($0AE4-$0B29)
; Commands set sound registers, schedule durations, and branch to other streams.
;=========================================================================================
            DB      $14, $00, $10, $46, $16, $0F, $15, $00; $0AE4
            DB      $11, $37, $01, $04, $11, $3E, $01, $05; $0AEC
            DB      $11, $46, $01, $05, $11, $4A, $01, $06; $0AF4
            DB      $11, $54, $01, $06, $11, $5E, $01, $07; $0AFC
            DB      $11, $64, $01, $07, $11, $70, $01, $08; $0B04
            DB      $11, $7E, $01, $08, $11, $8D, $01, $09; $0B0C
            DB      $11, $96, $01, $0A, $11, $A8, $01, $0B; $0B14
            DB      $16, $00, $15, $00, $11, $00, $12, $00; $0B1C
            DB      $13, $00, $04, $03, $27, $0B; $0B24
            djnz    $0B61
            rla
            inc     sp
            inc     d
            nop
            ld      d,$AA
            dec     d
            ld      a,($2E11)
            ld      (de),a
            ld      b,b
            inc     de
            ld      d,b
            ld      bc,lvrstat
            cpl
            ld      (de),a
            ld      b,d
            inc     de
            ld      d,e
            ld      bc,$1604
            adc     a,b
            dec     d
            jr      c,$0B5A
            jr      nc,$0B5D
            ld      b,h
            inc     de
            ld      d,(hl)
            ld      bc,$1604
            ld      h,(hl)
            dec     d
            ld      (hl),$11
            ld      sp,$4612
            inc     de
            ld      e,c
            ld      bc,$1604
            ld      b,h
            dec     d
            inc     (hl)
            ld      bc,$1605
            ld      ($3215),hl
            ld      bc,$1607
            nop
            dec     d
            nop
            ld      de,$1200
            nop
            inc     de
            nop
            inc     b
            inc     bc
            ld      (hl),e
            dec     bc
;=========================================================================================
; ----> CRACKSCORE  Music command stream  ($0B76-$0B93)
; Commands set sound registers, schedule durations, and branch to other streams.
;=========================================================================================
            DB      $10, $50, $17, $3D, $16, $FF, $15, $1F; $0B76
            DB      $12, $11, $11, $12, $13, $0F, $01, $06; $0B7E
            DB      $16, $00, $15, $00, $11, $00, $12, $00; $0B86
            DB      $13, $00, $04, $03, $91, $0B; $0B8E
;=========================================================================================
; ----> FENCESCORE  Music command stream  ($0B94-$0B9A)
; Commands set sound registers, schedule durations, and branch to other streams.
;=========================================================================================
            DB      $10, $48, $17, $38, $02, $7A, $0B; $0B94
;=========================================================================================
; ----> TAKE_ME  Music command stream  ($0B9B-$0C17)
; Commands set sound registers, schedule durations, and branch to other streams.
;=========================================================================================
            DB      $10, $1C, $17, $00, $16, $EF, $15, $0F; $0B9B
            DB      $14, $00, $11, $5E, $12, $96, $13, $BD; $0BA3
            DB      $01, $14, $11, $2E, $12, $7E, $13, $96; $0BAB
            DB      $01, $0A, $11, $37, $12, $8D, $13, $BD; $0BB3
            DB      $01, $0A, $11, $3E, $12, $96, $13, $BD; $0BBB
            DB      $01, $0A, $11, $4A, $12, $7E, $13, $BD; $0BC3
            DB      $01, $0A, $11, $3E, $12, $A8, $13, $C8; $0BCB
            DB      $01, $1E, $11, $54, $12, $8D, $13, $FD; $0BD3
            DB      $01, $1E, $11, $5E, $12, $96, $13, $BD; $0BDB
            DB      $01, $14, $11, $2E, $12, $7E, $13, $96; $0BE3
            DB      $01, $0A, $11, $37, $12, $5E, $13, $8D; $0BEB
            DB      $01, $0A, $11, $3E, $12, $5E, $13, $96; $0BF3
            DB      $01, $0A, $11, $4A, $12, $7E, $13, $BD; $0BFB
            DB      $01, $0A, $11, $3E, $12, $A8, $13, $C8; $0C03
            DB      $01, $3C, $11, $2E, $12, $4A, $13, $BD; $0C0B
            DB      $01, $3C, $02, $2A, $0B; $0C13
            DB      $16                 ; $0C18: preserved data boundary
            xor     e
            dec     d
            dec     bc
            nop
            ld      de,$905E
            nop
            inc     de
            ld      e,(hl)
            add     a,b
            nop
            ld      (de),a
            ld      e,(hl)
            ld      (hl),b
            djnz    $0C3A
            ld      bc,$1001
            ld      c,$01
            ld      bc,$0C10
            ld      bc,$1001
            ld      a,(bc)
            ld      bc,$1001
            ex      af,af'
            ld      bc,$1001
            ld      b,$01
            ld      bc,$0410
            ld      bc,$1001
            ld      (bc),a
            ld      bc,$0201
            ld      hl,($160C)
            rst     $38
            dec     d
            rra
            djnz    $0C53
            rla
            ex      af,af'
            inc     de
            ld      d,h
            ld      (de),a
            ld      b,d
            ld      de,$013B
            ld      b,$13
            ld      e,(hl)
            ld      de,$014A
            ld      b,$13
            ld      h,h
            ld      (de),a
            ld      d,h
            ld      bc,$1606
            db      $dd,$15
            ld      a,(de)
            inc     de
            ld      (hl),b
            ld      de,$015E
            ld      b,$16
            xor     d
            dec     d
            rla
            inc     de
            ld      a,(hl)
            ld      (de),a
            ld      h,h
            ld      bc,$0206
            jr      $0C8A
;=========================================================================================
; ----> SAFESCORE  Music command stream  ($0C7E-$0CA8)
; Commands set sound registers, schedule durations, and branch to other streams.
;=========================================================================================
            DB      $10, $34, $16, $AB, $15, $0B, $14, $00; $0C7E
            DB      $11, $3E, $12, $4A, $13, $5E, $01, $05; $0C86
            DB      $11, $31, $12, $29, $13, $3E, $01, $05; $0C8E
            DB      $11, $2E, $12, $54, $13, $37, $01, $05; $0C96
            DB      $11, $1F, $12, $29, $13, $31, $01, $12; $0C9E
            DB      $02, $2A, $0B       ; $0CA6
;=========================================================================================
; ----> OUTSCORE  Music command stream  ($0CA9-$0CE6)
; Commands set sound registers, schedule durations, and branch to other streams.
;=========================================================================================
            DB      $10, $23, $16, $AB, $15, $0B, $14, $00; $0CA9
            DB      $11, $46, $12, $54, $13, $3E, $01, $05; $0CB1
            DB      $11, $54, $12, $64, $13, $4A, $01, $05; $0CB9
            DB      $11, $8D, $12, $77, $13, $64, $01, $05; $0CC1
            DB      $11, $C8, $12, $8D, $13, $96, $01, $05; $0CC9
            DB      $11, $70, $12, $8D, $13, $FD, $01, $12; $0CD1
            DB      $16, $00, $15, $00, $11, $00, $12, $00; $0CD9
            DB      $13, $00, $04, $03, $E4, $0C; $0CE1
            rst     $08                 ; Enter the inline TERSE thread
            DB      $0D                 ; $0CE8: 0
            DB      $0E                 ; $0CE9: inline base addition
            DW      $0B2A               ; Inline cell
            DB      $0F                 ; $0CEC: _BMUSIC
            DB      $03                 ; $0CED: RETURN
            ld      a,h
            ld      h,$00
            ld      l,a
            add     hl,hl
            add     hl,hl
            add     hl,hl
            add     hl,hl
            push    de
            ld      e,l
            ld      d,h
            add     hl,hl
            add     hl,hl
            add     hl,de
            ex      de,hl
            pop     hl
            ld      a,l
            ld      l,h
            ld      h,$00
            add     hl,de
            rlca
            rlca
            and     $03
            ret

;=========================================================================================
; ----> relabs  Native entry $0D08
;=========================================================================================
            ld      a,($7C0A)
            and     a
            jr      z,$0D2F
            ld      a,$60
            sub     h
            add     a,$60
            ld      h,a
            ld      a,$27
            sub     d
            add     a,$27
            inc     a
            ld      d,a
            ld      a,c
            or      $80
            xor     $40
            ld      c,a
            call    $0CEE
            bit     6,c
            jr      nz,$0D2D
            neg
            jr      nz,$0D2D
            inc     hl
            jr      $0D3B
            call    $0CEE
            bit     6,c
            jr      z,$0D3B
            neg
            jr      nz,$0D3B
            dec     hl
            and     $03
            ld      e,a
            ld      a,c
            and     $FC
            or      e
            ld      c,a
            ret

;=========================================================================================
; ----> reloff  Native entry $0D44
;=========================================================================================
            push    hl
            ex      de,hl
            ld      d,(iy+$00)
            ld      e,$00
            sra     d
            rr      e
            sra     d
            rr      e
            bit     6,c
            jr      z,$0D5A
            add     hl,de
            jr      $0D5D
            or      a
            sbc     hl,de
            ex      (sp),hl
            ld      d,(iy+$01)
            ld      e,$00
            bit     7,c
            jr      z,$0D6A
            add     hl,de
            jr      $0D6E
            scf
            ccf
            sbc     hl,de
            pop     de
            inc     iy
            inc     iy
            ret

;=========================================================================================
; ----> write  Native entry $0D74
;=========================================================================================
            push    bc
            ld      a,($7C1B)
            and     a
            ld      a,b
            jr      nz,$0D82
            cp      $08
            jr      nz,$0D82
            ld      a,$0C
            out     ($19),a
            ld      a,c
            out     ($0C),a
            push    iy
            pop     bc
            bit     7,a
            jr      nz,$0DBE
            bit     6,a
            jr      z,$0DA8
            push    de
            push    hl
            ld      a,(bc)
            ld      (hl),a
            dec     hl
            ld      (hl),a
            dec     hl
            inc     bc
            dec     e
            jr      nz,$0D94
            pop     hl
            ld      de,$0050
            add     hl,de
            pop     de
            dec     d
            jr      nz,$0D92
            jr      $0DBC
            push    de
            push    hl
            ld      a,(bc)
            ld      (hl),a
            inc     hl
            ld      (hl),a
            inc     hl
            inc     bc
            dec     e
            jr      nz,$0DAA
            pop     hl
            ld      de,$0050
            add     hl,de
            pop     de
            dec     d
            jr      nz,$0DA8
            jr      $0DF2
            bit     6,a
            jr      z,$0DDB
            push    de
            push    hl
            ld      a,(bc)
            ld      (hl),a
            dec     hl
            ld      (hl),a
            dec     hl
            inc     bc
            dec     e
            jr      nz,$0DC4
            pop     hl
            ld      de,$0050
            scf
            ccf
            sbc     hl,de
            pop     de
            dec     d
            jr      nz,$0DC2
            jr      $0DF2
            push    de
            push    hl
            ld      a,(bc)
            ld      (hl),a
            inc     hl
            ld      (hl),a
            inc     hl
            inc     bc
            dec     e
            jr      nz,$0DDD
            pop     hl
            ld      de,$0050
            scf
            ccf
            sbc     hl,de
            pop     de
            dec     d
            jr      nz,$0DDB
            pop     bc
            ret

;=========================================================================================
; ----> writep  Native entry $0DF4
;=========================================================================================
            ld      e,(iy+$00)
            inc     iy
            ld      d,(iy+$00)
            inc     iy
            jp      write

;=========================================================================================
; ----> _WRITE  Native entry $0E01
;=========================================================================================
            push    iy
            pop     hl
            exx
            pop     bc
            pop     hl
            pop     iy
            pop     de
            ex      (sp),hl
            ex      de,hl
            call    relabs
            pop     de
            call    write
            exx
            push    hl
            pop     iy
            jp      (iy)

;=========================================================================================
; ----> _WRITR  Native entry $0E19
;=========================================================================================
            push    iy
            pop     hl
            exx
            pop     bc
            pop     iy
            pop     hl
            pop     de
            call    reloff
            call    relabs
            call    writep
            exx
            push    hl
            pop     iy
            jp      (iy)

;=========================================================================================
; ----> cpost  Native entry $0E31
;=========================================================================================
            push    iy
            pop     hl
            exx
            pop     hl
            ld      a,l
            pop     bc
            cp      $41
            jr      c,$0E40
            sub     $36
            jr      $0E4A
            cp      $30
            jr      c,$0E48
            sub     $2F
            jr      $0E4A
            sub     $20
            ld      l,a
            ld      h,$00
            sla     l
            rl      h
            ld      d,h
            ld      e,l
            sla     l
            rl      h
            sla     l
            rl      h
            add     hl,de
            ld      de,$02D1
            add     hl,de
            push    hl
            pop     iy
            pop     hl
            pop     de
            push    de
            push    hl
            push    bc
            call    relabs
            ld      de,$0A01
            ld      a,$02
            push    af
            call    write
            pop     af
            pop     bc
            pop     hl
            ex      (sp),hl
            ld      d,a
            ld      l,$00
            add     hl,de
            ex      (sp),hl
            push    hl
            push    bc
            exx
            push    hl
            pop     iy
            jp      (iy)

;=========================================================================================
; ----> _3DROP  TERSE block 248; ROM $0E85-$0E89
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $07                 ; $0E86: DROP
            DB      $07                 ; $0E87: DROP
            DB      $07                 ; $0E88: DROP
            DB      $03                 ; $0E89: RETURN

;=========================================================================================
; ----> _CPOST  TERSE block 248; ROM $0E8A-$0E8D
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $10                 ; $0E8B: cpost
            DB      $11                 ; $0E8C: _3DROP
            DB      $03                 ; $0E8D: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $12                 ; $0E8F: COUNT
            DB      $13                 ; $0E90: OVER
            DB      $14                 ; $0E91: +
            DB      $01                 ; $0E92: SWAP
            DB      $15                 ; $0E93: DO
            DB      $16                 ; $0E94: I / R@
            DB      $17                 ; $0E95: B@
            DB      $10                 ; $0E96: cpost
            DB      $18                 ; $0E97: LOOP
            DB      $11                 ; $0E98: _3DROP
            DB      $03                 ; $0E99: RETURN

;=========================================================================================
; ----> _dpost  TERSE block 249; ROM $0E9A-$0EBC
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $0E9B: literal8
            DB      $0F                 ; Inline byte
            DB      $1A                 ; $0E9D: AND
            DB      $13                 ; $0E9E: OVER
            DB      $1B                 ; $0E9F: literal16
            DW      $4000               ; Inline cell
            DB      $1A                 ; $0EA2: AND
            DB      $1B                 ; $0EA3: literal16
            DW      $4000               ; Inline cell
            DB      $1C                 ; $0EA6: XOR
            DB      $13                 ; $0EA7: OVER
            DB      $1D                 ; $0EA8: OR
            DB      $1E                 ; $0EA9: 0BRANCH
            DW      $0EB8               ; Branch destination
            DB      $19                 ; $0EAC: literal8
            DB      $30                 ; Inline byte
            DB      $14                 ; $0EAE: +
            DB      $01                 ; $0EAF: SWAP
            DB      $1B                 ; $0EB0: literal16
            DW      $BFFF               ; Inline cell
            DB      $1A                 ; $0EB3: AND
            DB      $01                 ; $0EB4: SWAP
            DB      $1F                 ; $0EB5: BRANCH
            DW      $0EBB               ; Branch destination
            DB      $07                 ; $0EB8: DROP
            DB      $19                 ; $0EB9: literal8
            DB      $20                 ; Inline byte
            DB      $10                 ; $0EBB: cpost
            DB      $03                 ; $0EBC: RETURN

;=========================================================================================
; ----> _NPOST  TERSE block 249; ROM $0EBD-$0ECB
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $13                 ; $0EBE: OVER
            DB      $14                 ; $0EBF: +
            DB      $01                 ; $0EC0: SWAP
            DB      $15                 ; $0EC1: DO
            DB      $16                 ; $0EC2: I / R@
            DB      $17                 ; $0EC3: B@
            DB      $20                 ; $0EC4: SWAN
            DB      $21                 ; $0EC5: _dpost
            DB      $16                 ; $0EC6: I / R@
            DB      $17                 ; $0EC7: B@
            DB      $21                 ; $0EC8: _dpost
            DB      $18                 ; $0EC9: LOOP
            DB      $11                 ; $0ECA: _3DROP
            DB      $03                 ; $0ECB: RETURN

;=========================================================================================
; ----> vwrite  Native entry $0ECC
;=========================================================================================
            ld      b,$08
            ld      c,(ix+$00)
            ld      d,(ix+$0c)
            ld      e,(ix+$0b)
            ld      h,(ix+$14)
            ld      l,(ix+$13)
            push    hl
            pop     iy
            ld      h,(ix+$10)
            ld      l,(ix+$0f)
            call    reloff
            call    relabs
            ld      (ix+$17),h
            ld      (ix+$16),l
            call    writep
            ld      (ix+$00),c
            ret

;=========================================================================================
; ----> verase  Erase the saved vector image ($0EF9-$0F1F)
;
; IX selects the vector. Skip the pattern hotspot and erase at its saved address.
; A nonzero byte at $7C0A clears vertical flip and toggles horizontal mirror.
; Both return paths end before the playaction data at $0F20.
;=========================================================================================
            ld      b,$08
            ld      c,(ix+$00)
            ld      h,(ix+$14)
            ld      l,(ix+$13)
            inc     hl
            inc     hl
            push    hl
            pop     iy
            ld      h,(ix+$17)
            ld      l,(ix+$16)
            call    writep
            ld      a,($7C0A)
            and     a
            ret     z
            ld      a,c
            and     $7F
            xor     $40
            ld      (ix+$00),a
            ret

;=========================================================================================
; ----> Playaction data ($0F20-$1110)
;
; OPCODECHK treats bytes $02-$0E as commands and dispatches through OPTBL.
; PACTLOAD reads seven-byte actions: magic, animation index, update count, dy, dx.
; dy and dx are signed 16-bit little-endian fixed-point increments.
;=========================================================================================

;=========================================================================================
; ----> RUNBPA ($0F20-$0F20)
;
; TERSE block 226.
;=========================================================================================
RUNBPA:
            DB      $08                 ; $0F20: Move runner to destination

;=========================================================================================
; ----> OFFFPA ($0F21-$0F21)
;
; TERSE block 226.
;=========================================================================================
OFFFPA:
            DB      $09                 ; $0F21: Move outfielder to destination

;=========================================================================================
; ----> TFPA ($0F22-$0F22)
;
; TERSE block 226.
;=========================================================================================
TFPA:
            DB      $07                 ; $0F22: Move to field destination

;=========================================================================================
; ----> OFTBLPA ($0F23-$0F23)
;
; TERSE block 226.
;=========================================================================================
OFTBLPA:
            DB      $05                 ; $0F23: Use outfielder trackball action

;=========================================================================================
; ----> TFPA1 ($0F24-$0F2B)
;
; TERSE block 226.
;=========================================================================================
TFPA1:
            DB      $28, $05, $10, $00, $00, $00, $00 ; $0F24: NBD, updates=16, dy=0, dx=0
            DB      $07                 ; $0F2B: Move to field destination

;=========================================================================================
; ----> TFPA2 ($0F2C-$0F33)
;
; TERSE block 226.
;=========================================================================================
TFPA2:
            DB      $28, $05, $20, $00, $00, $00, $00 ; $0F2C: NBD, updates=32, dy=0, dx=0
            DB      $07                 ; $0F33: Move to field destination

;=========================================================================================
; ----> THWBLPA ($0F34-$0F34)
;
; TERSE block 226.
;=========================================================================================
THWBLPA:
            DB      $0A                 ; $0F34: Move ball to destination

;=========================================================================================
; ----> PITCHBLPA ($0F35-$0F35)
;
; TERSE block 226.
;=========================================================================================
PITCHBLPA:
            DB      $06                 ; $0F35: Use ball trackball action

;=========================================================================================
; ----> NOACTPA ($0F36-$0F3D)
;
; ROM playaction records.
;=========================================================================================
NOACTPA:
            DB      $28, $04, $00, $00, $00, $00, $00 ; $0F36: STND, updates=0, dy=0, dx=0
            DB      $0C                 ; $0F3D: Deactivate vector

;=========================================================================================
; ----> HL1ST ($0F3E-$0F4D)
;
; TERSE block 226.
;=========================================================================================
HL1ST:
            DB      $28, $00, $0E, $60, $00, $00, $02 ; $0F3E: RRUN, updates=14, dy=96, dx=512
            DB      $02                 ; $0F45: Record first-base fielder
            DB      $68, $03, $00, $00, $00, $00, $00 ; $0F46: LCB, updates=0, dy=0, dx=0
            DB      $0C                 ; $0F4D: Deactivate vector

;=========================================================================================
; ----> HL2ND ($0F4E-$0F5D)
;
; TERSE block 226.
;=========================================================================================
HL2ND:
            DB      $68, $00, $0A, $00, $00, $00, $FD ; $0F4E: LRUN, updates=10, dy=0, dx=-768
            DB      $03                 ; $0F55: Record second-base fielder
            DB      $68, $03, $00, $00, $00, $00, $00 ; $0F56: LCB, updates=0, dy=0, dx=0
            DB      $0C                 ; $0F5D: Deactivate vector

;=========================================================================================
; ----> HRSS ($0F5E-$0F6D)
;
; TERSE block 226.
;=========================================================================================
HRSS:
            DB      $28, $00, $0D, $E0, $FF, $00, $03 ; $0F5E: RRUN, updates=13, dy=-32, dx=768
            DB      $03                 ; $0F65: Record second-base fielder
            DB      $28, $03, $00, $00, $00, $00, $00 ; $0F66: RCB, updates=0, dy=0, dx=0
            DB      $0C                 ; $0F6D: Deactivate vector

;=========================================================================================
; ----> HR3RD ($0F6E-$0F7D)
;
; TERSE block 226.
;=========================================================================================
HR3RD:
            DB      $68, $00, $0A, $B0, $00, $00, $FE ; $0F6E: LRUN, updates=10, dy=176, dx=-512
            DB      $04                 ; $0F75: Record third-base fielder
            DB      $28, $03, $00, $00, $00, $00, $00 ; $0F76: RCB, updates=0, dy=0, dx=0
            DB      $0C                 ; $0F7D: Deactivate vector

;=========================================================================================
; ----> HLPT ($0F7E-$0F8C)
;
; TERSE block 226.
;=========================================================================================
HLPT:
            DB      $68, $00, $12, $00, $00, $00, $FF ; $0F7E: LRUN, updates=18, dy=0, dx=-256
            DB      $28, $08, $00, $00, $00, $00, $00 ; $0F85: STPT, updates=0, dy=0, dx=0
            DB      $0C                 ; $0F8C: Deactivate vector

;=========================================================================================
; ----> HRPT ($0F8D-$0F9B)
;
; TERSE block 226.
;=========================================================================================
HRPT:
            DB      $28, $00, $12, $00, $00, $00, $01 ; $0F8D: RRUN, updates=18, dy=0, dx=256
            DB      $28, $08, $00, $00, $00, $00, $00 ; $0F94: STPT, updates=0, dy=0, dx=0
            DB      $0C                 ; $0F9B: Deactivate vector

;=========================================================================================
; ----> PITCHPA ($0F9C-$0FAA)
;
; TERSE block 227.
;=========================================================================================
PITCHPA:
            DB      $28, $09, $12, $00, $00, $00, $00 ; $0F9C: PTTHW, updates=18, dy=0, dx=0
            DB      $28, $08, $00, $00, $00, $00, $00 ; $0FA3: STPT, updates=0, dy=0, dx=0
            DB      $0C                 ; $0FAA: Deactivate vector

;=========================================================================================
; ----> RTHWPA ($0FAB-$0FB2)
;
; TERSE block 227.
;=========================================================================================
RTHWPA:
            DB      $28, $02, $05, $00, $00, $00, $00 ; $0FAB: RTRW, updates=5, dy=0, dx=0
            DB      $0E                 ; $0FB2: Select NOACTPA

;=========================================================================================
; ----> LTHWPA ($0FB3-$0FBA)
;
; TERSE block 227.
;=========================================================================================
LTHWPA:
            DB      $68, $02, $05, $00, $00, $00, $00 ; $0FB3: LTRW, updates=5, dy=0, dx=0
            DB      $0E                 ; $0FBA: Select NOACTPA

;=========================================================================================
; ----> FBLR1ST ($0FBB-$0FCA)
;
; TERSE block 227.
;=========================================================================================
FBLR1ST:
            DB      $28, $00, $16, $60, $00, $20, $02 ; $0FBB: RRUN, updates=22, dy=96, dx=544
            DB      $28, $01, $02, $40, $00, $00, $01 ; $0FC2: RFLD, updates=2, dy=64, dx=256
            DB      $0B                 ; $0FC9: Start throw animation
            DB      $0E                 ; $0FCA: Select NOACTPA

;=========================================================================================
; ----> FBLL3RD ($0FCB-$0FDA)
;
; TERSE block 227.
;=========================================================================================
FBLL3RD:
            DB      $68, $00, $12, $80, $00, $10, $FE ; $0FCB: LRUN, updates=18, dy=128, dx=-496
            DB      $68, $01, $02, $40, $00, $80, $FF ; $0FD2: LFLD, updates=2, dy=64, dx=-128
            DB      $0B                 ; $0FD9: Start throw animation
            DB      $0E                 ; $0FDA: Select NOACTPA

;=========================================================================================
; ----> HLL3RD ($0FDB-$0FF1)
;
; TERSE block 227.
;=========================================================================================
HLL3RD:
            DB      $68, $01, $12, $00, $00, $00, $FF ; $0FDB: LFLD, updates=18, dy=0, dx=-256
            DB      $68, $00, $05, $00, $01, $00, $00 ; $0FE2: LRUN, updates=5, dy=256, dx=0
            DB      $04                 ; $0FE9: Record third-base fielder
            DB      $28, $03, $00, $00, $00, $00, $00 ; $0FEA: RCB, updates=0, dy=0, dx=0
            DB      $0C                 ; $0FF1: Deactivate vector

;=========================================================================================
; ----> F3RDR3RD ($0FF2-$0FF9)
;
; TERSE block 227.
;=========================================================================================
F3RDR3RD:
            DB      $68, $01, $0A, $40, $00, $D0, $FF ; $0FF2: LFLD, updates=10, dy=64, dx=-48
            DB      $0B                 ; $0FF9: Start throw animation

;=========================================================================================
; ----> F3RDL3RD ($0FFA-$1001)
;
; TERSE block 227.
;=========================================================================================
F3RDL3RD:
            DB      $28, $01, $0A, $40, $00, $80, $00 ; $0FFA: RFLD, updates=10, dy=64, dx=128
            DB      $0B                 ; $1001: Start throw animation

;=========================================================================================
; ----> F3RDLSS ($1002-$1009)
;
; TERSE block 227.
;=========================================================================================
F3RDLSS:
            DB      $68, $00, $12, $40, $00, $00, $FF ; $1002: LRUN, updates=18, dy=64, dx=-256
            DB      $0E                 ; $1009: Select NOACTPA

;=========================================================================================
; ----> HL3RD ($100A-$1020)
;
; TERSE block 227.
;=========================================================================================
HL3RD:
            DB      $28, $01, $12, $C0, $FF, $80, $00 ; $100A: RFLD, updates=18, dy=-64, dx=128
            DB      $68, $00, $0E, $C0, $00, $00, $FE ; $1011: LRUN, updates=14, dy=192, dx=-512
            DB      $04                 ; $1018: Record third-base fielder
            DB      $28, $03, $00, $00, $00, $00, $00 ; $1019: RCB, updates=0, dy=0, dx=0
            DB      $0C                 ; $1020: Deactivate vector

;=========================================================================================
; ----> HLSS ($1021-$1028)
;
; TERSE block 228.
;=========================================================================================
HLSS:
            DB      $68, $01, $10, $00, $00, $80, $FF ; $1021: LFLD, updates=16, dy=0, dx=-128
            DB      $0E                 ; $1028: Select NOACTPA

;=========================================================================================
; ----> FSSRSS ($1029-$1030)
;
; TERSE block 228.
;=========================================================================================
FSSRSS:
            DB      $68, $01, $0C, $80, $00, $80, $FF ; $1029: LFLD, updates=12, dy=128, dx=-128
            DB      $0B                 ; $1030: Start throw animation

;=========================================================================================
; ----> FSSLSS ($1031-$1038)
;
; TERSE block 228.
;=========================================================================================
FSSLSS:
            DB      $28, $01, $0C, $80, $00, $80, $01 ; $1031: RFLD, updates=12, dy=128, dx=384
            DB      $0B                 ; $1038: Start throw animation

;=========================================================================================
; ----> HMSS ($1039-$1040)
;
; TERSE block 228.
;=========================================================================================
HMSS:
            DB      $28, $00, $0C, $C0, $FF, $00, $01 ; $1039: RRUN, updates=12, dy=-64, dx=256
            DB      $0E                 ; $1040: Select NOACTPA

;=========================================================================================
; ----> F2NDR2ND ($1041-$1048)
;
; TERSE block 228.
;=========================================================================================
F2NDR2ND:
            DB      $68, $01, $0B, $A0, $00, $20, $FF ; $1041: LFLD, updates=11, dy=160, dx=-224
            DB      $0B                 ; $1048: Start throw animation

;=========================================================================================
; ----> F2NDL2ND ($1049-$1050)
;
; TERSE block 228.
;=========================================================================================
F2NDL2ND:
            DB      $28, $01, $0C, $00, $00, $80, $00 ; $1049: RFLD, updates=12, dy=0, dx=128
            DB      $0B                 ; $1050: Start throw animation

;=========================================================================================
; ----> HR2ND ($1051-$1058)
;
; TERSE block 228.
;=========================================================================================
HR2ND:
            DB      $28, $01, $12, $00, $00, $80, $00 ; $1051: RFLD, updates=18, dy=0, dx=128
            DB      $0E                 ; $1058: Select NOACTPA

;=========================================================================================
; ----> HR1ST ($1059-$106F)
;
; TERSE block 228.
;=========================================================================================
HR1ST:
            DB      $68, $01, $12, $C0, $FF, $80, $FF ; $1059: LFLD, updates=18, dy=-64, dx=-128
            DB      $28, $00, $13, $90, $00, $00, $02 ; $1060: RRUN, updates=19, dy=144, dx=512
            DB      $02                 ; $1067: Record first-base fielder
            DB      $68, $03, $00, $00, $00, $00, $00 ; $1068: LCB, updates=0, dy=0, dx=0
            DB      $0C                 ; $106F: Deactivate vector

;=========================================================================================
; ----> F1STR1ST ($1070-$1077)
;
; TERSE block 228.
;=========================================================================================
F1STR1ST:
            DB      $68, $01, $0A, $30, $00, $C0, $FF ; $1070: LFLD, updates=10, dy=48, dx=-64
            DB      $0D                 ; $1077: Wait for first-base throw

;=========================================================================================
; ----> F1STL1ST ($1078-$107F)
;
; TERSE block 228.
;=========================================================================================
F1STL1ST:
            DB      $28, $01, $0B, $C0, $FF, $40, $01 ; $1078: RFLD, updates=11, dy=-64, dx=320
            DB      $0D                 ; $107F: Wait for first-base throw

;=========================================================================================
; ----> HRL1ST ($1080-$1087)
;
; TERSE block 228.
;=========================================================================================
HRL1ST:
            DB      $28, $01, $18, $00, $00, $00, $01 ; $1080: RFLD, updates=24, dy=0, dx=256
            DB      $0E                 ; $1087: Select NOACTPA

;=========================================================================================
; ----> F1STPT ($1088-$1097)
;
; TERSE block 228.
;=========================================================================================
F1STPT:
            DB      $28, $00, $15, $00, $00, $80, $04 ; $1088: RRUN, updates=21, dy=0, dx=1152
            DB      $02                 ; $108F: Record first-base fielder
            DB      $68, $03, $00, $00, $00, $00, $00 ; $1090: LCB, updates=0, dy=0, dx=0
            DB      $0C                 ; $1097: Deactivate vector

;=========================================================================================
; ----> HLOUTSSPA ($1098-$109F)
;
; TERSE block 228.
;=========================================================================================
HLOUTSSPA:
            DB      $68, $00, $10, $80, $FF, $E0, $FF ; $1098: LRUN, updates=16, dy=-128, dx=-32
            DB      $0E                 ; $109F: Select NOACTPA

;=========================================================================================
; ----> HROUT2NDPA ($10A0-$10A7)
;
; TERSE block 228.
;=========================================================================================
HROUT2NDPA:
            DB      $28, $00, $10, $80, $00, $20, $00 ; $10A0: RRUN, updates=16, dy=128, dx=32
            DB      $0E                 ; $10A7: Select NOACTPA

;=========================================================================================
; ----> PFB ($10A8-$10AE)
;
; TERSE block 229.
;=========================================================================================
PFB:
            DB      $28, $06, $50, $00, $03, $00, $00 ; $10A8: BAL, updates=80, dy=768, dx=0

;=========================================================================================
; ----> PSB ($10AF-$10B5)
;
; TERSE block 229.
;=========================================================================================
PSB:
            DB      $28, $06, $80, $00, $01, $00, $00 ; $10AF: BAL, updates=128, dy=256, dx=0

;=========================================================================================
; ----> PSU ($10B6-$10C3)
;
; TERSE block 229.
;=========================================================================================
PSU:
            DB      $28, $06, $35, $00, $01, $00, $00 ; $10B6: BAL, updates=53, dy=256, dx=0
            DB      $28, $06, $50, $00, $03, $00, $00 ; $10BD: BAL, updates=80, dy=768, dx=0

;=========================================================================================
; ----> PSD ($10C4-$10D1)
;
; TERSE block 229.
;=========================================================================================
PSD:
            DB      $28, $06, $12, $00, $03, $00, $00 ; $10C4: BAL, updates=18, dy=768, dx=0
            DB      $28, $06, $50, $00, $01, $00, $00 ; $10CB: BAL, updates=80, dy=256, dx=0

;=========================================================================================
; ----> PCO ($10D2-$10E6)
;
; TERSE block 229.
;=========================================================================================
PCO:
            DB      $28, $06, $12, $00, $03, $00, $00 ; $10D2: BAL, updates=18, dy=768, dx=0
            DB      $28, $06, $09, $00, $02, $00, $01 ; $10D9: BAL, updates=9, dy=512, dx=256
            DB      $28, $06, $50, $00, $02, $00, $00 ; $10E0: BAL, updates=80, dy=512, dx=0

;=========================================================================================
; ----> PICI ($10E7-$10FB)
;
; TERSE block 229.
;=========================================================================================
PICI:
            DB      $28, $06, $1A, $00, $02, $F0, $FF ; $10E7: BAL, updates=26, dy=512, dx=-16
            DB      $28, $06, $09, $00, $02, $00, $FF ; $10EE: BAL, updates=9, dy=512, dx=-256
            DB      $28, $06, $50, $00, $02, $00, $00 ; $10F5: BAL, updates=80, dy=512, dx=0

;=========================================================================================
; ----> PICO ($10FC-$1110)
;
; TERSE block 229.
;=========================================================================================
PICO:
            DB      $28, $06, $1A, $00, $02, $E0, $FF ; $10FC: BAL, updates=26, dy=512, dx=-32
            DB      $28, $06, $09, $00, $02, $60, $00 ; $1103: BAL, updates=9, dy=512, dx=96
            DB      $28, $06, $50, $00, $02, $00, $00 ; $110A: BAL, updates=80, dy=512, dx=0

;=========================================================================================
; ----> comphl  Native entry $1111
;=========================================================================================
            ld      a,h
            cpl
            ld      h,a
            ld      a,l
            cpl
            ld      l,a
            inc     hl
            ret

;=========================================================================================
; ----> compde  Native entry $1119
;=========================================================================================
            push    hl
            ex      de,hl
            call    comphl
            ex      de,hl
            pop     hl
            ret

;=========================================================================================
; ----> timedcr  Native entry $1121
;=========================================================================================
            ld      a,(hl)
            and     a
            ret     z
            dec     a
            ld      (hl),a
            and     a
            jr      nz,$112C
            inc     a
            jr      $112D
            xor     a
            ret

;=========================================================================================
; ----> _BONE  TERSE block 233; ROM $112E-$1131
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $22                 ; $112F: 1
            DB      $23                 ; $1130: _SBSTORE
            DB      $03                 ; $1131: RETURN

;=========================================================================================
; ----> _BZERO  TERSE block 233; ROM $1132-$1135
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $0D                 ; $1133: 0
            DB      $23                 ; $1134: _SBSTORE
            DB      $03                 ; $1135: RETURN

;=========================================================================================
; ----> _WUPGO  TERSE block 233; ROM $1136-$1148
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1137: literal16
            DW      $7C4B               ; Inline cell
            DB      $24                 ; $113A: @
            DB      $08                 ; $113B: DUP
            DB      $19                 ; $113C: literal8
            DB      $11                 ; Inline byte
            DB      $14                 ; $113E: +
            DB      $19                 ; $113F: literal8
            DB      $81                 ; Inline byte
            DB      $23                 ; $1141: _SBSTORE
            DB      $19                 ; $1142: literal8
            DB      $1E                 ; Inline byte
            DB      $14                 ; $1144: +
            DB      $19                 ; $1145: literal8
            DB      $03                 ; Inline byte
            DB      $23                 ; $1147: _SBSTORE
            DB      $03                 ; $1148: RETURN

;=========================================================================================
; ----> _EX  Native entry $1149
;=========================================================================================
            ret
            jp      (iy)

;=========================================================================================
; ----> indexw  Native entry $114C
;=========================================================================================
            push    af
            sla     a
            add     a,l
            ld      l,a
            ld      a,$00
            adc     a,h
            ld      h,a
            ld      e,(hl)
            inc     hl
            ld      d,(hl)
            dec     hl
            pop     af
            ret

;=========================================================================================
; ----> autor1  Native entry $115B
;=========================================================================================
            ld      a,$03
            ld      ($7CF8),a
            ld      a,$81
            ld      ($7CEB),a
            ret

;=========================================================================================
; ----> autor2  Native entry $1166
;=========================================================================================
            ld      a,$03
            ld      ($7D17),a
            ld      a,$81
            ld      ($7D0A),a
            ret

;=========================================================================================
; ----> autor3  Native entry $1171
;=========================================================================================
            ld      a,$03
            ld      ($7D36),a
            ld      a,$81
            ld      ($7D29),a
            ret

;=========================================================================================
; ----> lvrstat  Native entry $117C
;=========================================================================================
            ld      ($7CF8),a
            ld      ($7D17),a
            ld      ($7D36),a
            ld      ($7D55),a
            ret

;=========================================================================================
; ----> walkover  Native entry $1189
;=========================================================================================
            ld      a,$01
            ld      (RAM_CAUGHT),a
            ld      ($7C3F),a
            ret

;=========================================================================================
; ----> multhlby4  Native entry $1192
;=========================================================================================
            bit     7,h
            push    af
            call    nz,comphl
            sla     l
            rl      h
            sla     l
            rl      h
            pop     af
            call    nz,comphl
            ret

;=========================================================================================
; ----> killof  Native entry $11A5
;=========================================================================================
            ld      hl,$0000
            ld      ($7C77),hl
            ld      ($7C75),hl
            ld      hl,$0428
            ld      ($7C72),hl
            xor     a
            ld      ($7C47),a
            ret

;=========================================================================================
; ----> wait  Native entry $11B9
;=========================================================================================
            push    af
            ld      a,$FF
            dec     a
            jr      nz,$11BC
            pop     af
            dec     a
            jr      nz,wait
            ret
            rst     $08                 ; Enter the inline TERSE thread
            DB      $25                 ; $11C5: EI
            DB      $19                 ; $11C6: literal8
            DB      $FF                 ; Inline byte
            DB      $0D                 ; $11C8: 0
            DB      $15                 ; $11C9: DO
            DB      $18                 ; $11CA: LOOP
            DB      $1B                 ; $11CB: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $11CE: B@
            DB      $08                 ; $11CF: DUP
            DB      $1E                 ; $11D0: 0BRANCH
            DW      $11EC               ; Branch destination
            DB      $22                 ; $11D3: 1
            DB      $26                 ; $11D4: =
            DB      $1E                 ; $11D5: 0BRANCH
            DW      $11E7               ; Branch destination
            DB      $1B                 ; $11D8: literal16
            DW      $7C1A               ; Inline cell
            DB      $17                 ; $11DB: B@
            DB      $1E                 ; $11DC: 0BRANCH
            DW      $11E2               ; Branch destination
            DB      $1F                 ; $11DF: BRANCH
            DW      $11E4               ; Branch destination
            DB      $07                 ; $11E2: DROP
            DB      $22                 ; $11E3: 1
            DB      $1F                 ; $11E4: BRANCH
            DW      $11E9               ; Branch destination
            DB      $07                 ; $11E7: DROP
            DB      $22                 ; $11E8: 1
            DB      $1F                 ; $11E9: BRANCH
            DW      $11ED               ; Branch destination
            DB      $07                 ; $11EC: DROP
            DB      $19                 ; $11ED: literal8
            DB      $50                 ; Inline byte
            DB      $0D                 ; $11EF: 0
            DB      $15                 ; $11F0: DO
            DB      $18                 ; $11F1: LOOP
            DB      $22                 ; $11F2: 1
            DB      $27                 ; $11F3: -
            DB      $08                 ; $11F4: DUP
            DB      $28                 ; $11F5: 0=
            DB      $1E                 ; $11F6: 0BRANCH
            DW      $11C6               ; Branch destination
            DB      $07                 ; $11F9: DROP
            DB      $03                 ; $11FA: RETURN
            db      $21, $02, $7E
            db      $3E, $03
            db      $11, $1F, $00
            db      $CB, $FE
            db      $19
            db      $3D
            db      $20, $FA
            db      $C9
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $120B: literal16
            DW      $4200               ; Inline cell
            DB      $1B                 ; $120E: literal16
            DW      $7A00               ; Inline cell
            DB      $1B                 ; $1211: literal16
            DW      $0828               ; Inline cell
            DB      $19                 ; $1214: literal8
            DB      $48                 ; Inline byte
            DB      $29                 ; $1216: _CPOST
            DB      $1B                 ; $1217: literal16
            DW      $4400               ; Inline cell
            DB      $1B                 ; $121A: literal16
            DW      $7F00               ; Inline cell
            DB      $1B                 ; $121D: literal16
            DW      $045C               ; Inline cell
            DB      $1B                 ; $1220: literal16
            DW      $0502               ; Inline cell
            DB      $1B                 ; $1223: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $1226: _WRITE
            DB      $03                 ; $1227: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1229: literal16
            DW      $0700               ; Inline cell
            DB      $1B                 ; $122C: literal16
            DW      $7A00               ; Inline cell
            DB      $1B                 ; $122F: literal16
            DW      $0828               ; Inline cell
            DB      $19                 ; $1232: literal8
            DB      $56                 ; Inline byte
            DB      $29                 ; $1234: _CPOST
            DB      $1B                 ; $1235: literal16
            DW      $0900               ; Inline cell
            DB      $1B                 ; $1238: literal16
            DW      $7F00               ; Inline cell
            DB      $1B                 ; $123B: literal16
            DW      $044D               ; Inline cell
            DB      $1B                 ; $123E: literal16
            DW      $0503               ; Inline cell
            DB      $1B                 ; $1241: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $1244: _WRITE
            DB      $03                 ; $1245: RETURN
            DB      $DD                 ; $1246: preserved data boundary
            push    hl
            ld      ix,VEC_BL
            call    verase
            res     7,(ix+$11)
            pop     ix
            ld      hl,NOBOD
            ld      ($7E61),hl
            ret

;=========================================================================================
; ----> _PTAUTOTM  Native entry $125C
;=========================================================================================
            ld      hl,$7CB7
            ld      a,($7CA6)
            and     a
            call    z,timedcr
            jp      (iy)

;=========================================================================================
; ----> _WUPWRT  TERSE block 238; ROM $1268-$1276
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $2B                 ; $1269: _PTAUTOTM
            DB      $1B                 ; $126A: literal16
            DW      RAM_PLYR1UP         ; Inline cell
            DB      $17                 ; $126D: B@
            DB      $1E                 ; $126E: 0BRANCH
            DW      $1275               ; Branch destination
            DB      $2C                 ; $1271: _HOM
            DB      $1F                 ; $1272: BRANCH
            DW      $1276               ; Branch destination
            DB      $2D                 ; $1275: _VIS
            DB      $03                 ; $1276: RETURN

;=========================================================================================
; ----> _CHGS  TERSE block 238; ROM $1277-$1290
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1278: literal16
            DW      $1C00               ; Inline cell
            DB      $1B                 ; $127B: literal16
            DW      $2000               ; Inline cell
            DB      $1B                 ; $127E: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $1281: counted string
            DB      12                  ; Counted-string length
            DB      $43, $48, $41, $4E, $47, $45, $20, $53, $49, $44, $45, $53; CHANGE SIDES
            DB      $2F                 ; $128F: _SPOST
            DB      $03                 ; $1290: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $0D                 ; $1292: 0
            DB      $15                 ; $1293: DO
            DB      $19                 ; $1294: literal8
            DB      $FF                 ; Inline byte
            DB      $0D                 ; $1296: 0
            DB      $15                 ; $1297: DO
            DB      $18                 ; $1298: LOOP
            DB      $18                 ; $1299: LOOP
            DB      $03                 ; $129A: RETURN

;=========================================================================================
; ----> _FLSHTON  TERSE block 239; ROM $129B-$12A8
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $129C: literal16
            DW      $7CA8               ; Inline cell
            DB      $02                 ; $129F: !
            DB      $1B                 ; $12A0: literal16
            DW      $7CB1               ; Inline cell
            DB      $30                 ; $12A3: _BONE
            DB      $1B                 ; $12A4: literal16
            DW      $7CB2               ; Inline cell
            DB      $30                 ; $12A7: _BONE
            DB      $03                 ; $12A8: RETURN
            rst     $08
            dec     de
            xor     b
            ld      a,h
            inc     h
            ld      sp,$DD03
            push    hl
            push    iy
            ld      hl,$7CB0
            ld      a,($7CB1)
            and     a
            ld      a,(hl)
            jr      z,$12D8
            and     a
            jr      nz,$12C7
            ld      (hl),$01
            ld      a,$28
            jr      $12CB
            ld      (hl),$00
            ld      a,$08
            ld      ($7CB2),a
            ld      bc,$12D4
            jp      $12A9
            ld      ($1800),a
            dec     c
            and     a
            jr      z,$12E5
            ld      (hl),$00
            ld      bc,$12E3
            jp      $12A9
            inc     sp
            nop
            pop     iy
            pop     ix
            ret
            push    bc
            xor     a
            ld      ($7CB1),a
            call    flshwup
            pop     bc
            jp      (iy)
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $12F6: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $12F9: B@
            DB      $1E                 ; $12FA: 0BRANCH
            DW      $1300               ; Branch destination
            DB      $1F                 ; $12FD: BRANCH
            DW      $1310               ; Branch destination
            DB      $1B                 ; $1300: literal16
            DW      $7C1E               ; Inline cell
            DB      $34                 ; $1303: _BZERO
            DB      $1B                 ; $1304: literal16
            DW      _CHGS               ; Inline cell
            DB      $35                 ; $1307: _FLSHTON
            DB      $19                 ; $1308: literal8
            DB      $25                 ; Inline byte
            DB      $36                 ; $130A: _DWAIT
            DB      $1B                 ; $130B: literal16
            DW      $7C1E               ; Inline cell
            DB      $30                 ; $130E: _BONE
            DB      $37                 ; $130F: word at $12EA
            DB      $1B                 ; $1310: literal16
            DW      $7C10               ; Inline cell
            DB      $34                 ; $1313: _BZERO
            DB      $03                 ; $1314: RETURN
            ex      af,af'
            ld      b,(ix+$0c)
            ld      c,(ix+$0b)
            sbc     hl,bc
            push    af
            call    c,comphl
            sla     l
            rl      h
            sla     l
            rl      h
            ex      de,hl
            ld      b,(ix+$10)
            ld      c,(ix+$0f)
            sbc     hl,bc
            push    af
            call    c,comphl
            ex      af,af'
            push    af
            ex      af,af'
            pop     af
            inc     a
            inc     a
            cp      h
            jr      c,$1360
            cp      d
            jr      c,$1360
            xor     a
            cp      h
            jr      nz,$1396
            cp      d
            jr      nz,$1396
            ld      hl,$0000
            ld      de,$0000
            pop     af
            pop     af
            ld      a,$FF
            ld      ($7CBF),a
            res     7,(ix+$11)
            res     3,(ix+$11)
            ret
            bit     3,(ix+$11)
            jr      z,$136F
            pop     af
            pop     af
            ld      a,$05
            ld      (RAM_SAMEDLT),a
            jr      $13B6
            ld      a,h
            cp      d
            push    af
            jr      nc,$1377
            ex      de,hl
            jr      $1381
            jr      nz,$1381
            ld      a,l
            cp      e
            jr      nc,$1381
            ex      de,hl
            pop     af
            scf
            push    af
            ex      af,af'
            ld      b,$00
            inc     b
            srl     h
            rr      l
            cp      h
            jr      c,$1384
            srl     d
            rr      e
            djnz    $138C
            pop     af
            jr      nc,$1396
            ex      de,hl
            pop     af
            jr      nc,$139C
            call    comphl
            pop     af
            push    af
            jr      nc,$13A3
            call    compde
            pop     af
            jr      nc,$13AB
            ld      bc,$0068
            jr      $13AE
            ld      bc,$0028
            xor     a
            ld      ($7CBF),a
            set     3,(ix+$11)
            ret
            ld      h,(ix+$1a)
            ld      l,(ix+$19)
            ld      d,(ix+$1c)
            ld      e,(ix+$1b)
            ret
            di
            ld      a,($7C47)
            and     a
            ret     z
            ei
            ld      ($7C1E),a
            push    ix
            ld      a,($7E68)
            cp      $1C
            jr      c,$13E7
            cp      $34
            jr      c,$13E1
            ld      ix,VEC_RF
            jr      $13E5
            ld      ix,VEC_CF
            jr      $13EB
            ld      ix,VEC_LF
            ld      ($7C99),ix
            ld      hl,($7E67)
            ld      de,($7E69)
            ld      a,$02
            res     3,(ix+$11)
            call    $1315
            ld      ($7C77),de
            ld      ($7C75),hl
            ld      ($7C72),bc
            call    $11FB
            xor     a
            ld      ($7C1E),a
            pop     ix
            ret
            ld      hl,$7C55
            dec     (hl)
            jr      z,$1421
            ld      a,$FF
            ld      ($7C53),a
            jr      $142A
            call    $13C4
            ei
            ld      a,$01
            ld      ($7C54),a
            ret
            nop
            nop
            nop
            nop
            add     a,b
            jr      nz,$143A
            ld      (bc),a
            ret     nz
            jr      nc,$1442
            inc     bc
            rst     $08                 ; Enter the inline TERSE thread
            DB      $0D                 ; $1438: 0
            DB      $0E                 ; $1439: inline base addition
            DW      $1433               ; Inline cell
            DB      $1B                 ; $143C: literal16
            DW      $7E6D               ; Inline cell
            DB      $02                 ; $143F: !
            DB      $03                 ; $1440: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $0D                 ; $1442: 0
            DB      $0E                 ; $1443: inline base addition
            DW      $142B               ; Inline cell
            DB      $1B                 ; $1446: literal16
            DW      $7E6D               ; Inline cell
            DB      $02                 ; $1449: !
            DB      $03                 ; $144A: RETURN
            ccf
            rst     $08
            di
            call    m,$0BCB
            rrc     e
            rrc     d
            rrc     d
            exx
            jr      c,$1461
            ld      hl,($7E79)
            inc     hl
            ld      ($7E79),hl
            ld      hl,($7E75)
            inc     hl
            ld      ($7E75),hl
            exx
            jp      $1516
            rlc     e
            rlc     e
            rlc     d
            rlc     d
            exx
            jr      c,$147E
            ld      hl,($7E79)
            dec     hl
            ld      ($7E79),hl
            ld      hl,($7E75)
            dec     hl
            ld      ($7E75),hl
            exx
            jp      $1516
            ld      hl,$7E73
            inc     (hl)
            push    de
            ld      de,$0050
            ld      hl,($7E79)
            add     hl,de
            ld      ($7E79),hl
            pop     de
            ret
            ld      hl,$7E73
            dec     (hl)
            push    de
            ld      de,$FFB0
            ld      hl,($7E79)
            add     hl,de
            ld      ($7E79),hl
            pop     de
            ret
            jp      (iy)
            ld      de,($7E75)
            ld      hl,($7E6F)
            xor     a
            sbc     hl,de
            jr      c,$14BF
            ld      ix,$144F
            jr      $14CA
            ld      ix,$146C
            ex      de,hl
            xor     a
            ld      hl,$0000
            sbc     hl,de
            ld      de,($7E73)
            ld      a,($7E71)
            sub     e
            jr      c,$14DA
            ld      iy,$1489
            jr      $14E0
            ld      iy,$149A
            cpl
            inc     a
            exx
            ld      l,a
            ld      h,$00
            exx
            ld      e,l
            ld      d,h
            or      l
            ld      l,a
            or      h
            ret     z
            add     hl,hl
            jr      c,$14F6
            ex      de,hl
            add     hl,hl
            ex      de,hl
            exx
            add     hl,hl
            exx
            jr      $14EB
            push    de
            exx
            push    hl
            exx
            pop     bc
            ld      e,c
            ld      d,b
            exx
            ld      bc,($7E77)
            ld      hl,($7E6D)
            add     hl,bc
            ld      e,(hl)
            ld      hl,$144B
            add     hl,bc
            ld      d,(hl)
            pop     hl
            ld      b,h
            ld      c,l
            exx
            exx
            add     hl,bc
            jr      nc,$1523
            jp      (ix)
            exx
            ex      de,hl
            add     hl,bc
            ex      de,hl
            jr      nc,$151F
            call    $14AB
            jr      $1530
            jr      $152E
            exx
            ex      de,hl
            add     hl,bc
            ex      de,hl
            jr      nc,$152E
            call    $14AB
            jr      $1530
            jr      $1510
            exx
            push    de
            exx
            pop     hl
            ex      de,hl
            push    hl
            ld      hl,($7E79)
            ld      a,($7E7B)
            or      a
            jr      z,$1542
            ld      (hl),e
            jr      $1546
            ld      a,(hl)
            and     d
            or      e
            ld      (hl),a
            pop     de
            ld      a,($7E71)
            ld      h,a
            ld      a,($7E73)
            cp      h
            jr      nz,$1510
            push    de
            xor     a
            ld      de,($7E6F)
            ld      hl,($7E75)
            sbc     hl,de
            pop     de
            jr      nz,$1510
            ld      a,($7E75)
            and     $03
            ld      ($7E77),a
            ret
            push    bc
            ld      c,h
            ld      b,e
            ld      h,a
            in      a,(c)
            xor     l
            and     h
            jr      nz,$157A
            dec     e
            jr      nz,$1578
            inc     a
            pop     bc
            ret
            jr      $156C
            dec     d
            jr      nz,$1580
            xor     a
            pop     bc
            ret
            ld      e,b
            jr      $156C
            ld      hl,COINSCORE
            call    $0A24
            xor     a
            ld      ($7CA3),a
            inc     a
            out     ($20),a
            ld      ($7C14),a
            ld      a,$07
            ld      ($7C26),a
            ld      hl,$7C25
            inc     (hl)
            ld      hl,RAM_CREDITS
            inc     (hl)
            ret
            ld      a,($7C16)
            and     a
            jr      nz,$15BF
            ld      a,$01
            ld      de,$1020
            ld      hl,$11FE
            call    $1568
            and     a
            jr      z,$15D0
            ld      ($7C16),a
            call    $1583
            jr      $15D0
            jr      $15D0
            ld      a,$01
            ld      de,$0520
            ld      hl,$11FE
            call    $1568
            and     a
            jr      nz,$15D0
            ld      ($7C16),a
            ld      a,($7C17)
            and     a
            jr      nz,$15FE
            ld      a,$02
            ld      de,$1020
            ld      hl,$11FD
            call    $1568
            and     a
            jr      z,$160F
            ld      ($7C17),a
            call    $1583
            in      a,($12)
            bit     1,a
            jr      nz,$15FA
            inc     (hl)
            inc     (hl)
            inc     (hl)
            inc     (hl)
            ld      hl,$7C25
            inc     (hl)
            inc     (hl)
            inc     (hl)
            jr      $160F
            jr      $160F
            ld      a,$02
            ld      de,$0520
            ld      hl,$11FD
            call    $1568
            and     a
            jr      nz,$160F
            ld      ($7C17),a
            in      a,($11)
            and     $04
            ret     nz
            inc     a
            ld      ($7C1F),a
            ret
            ld      l,a
            ld      b,e
            ld      d,b
            and     b
            ld      l,(hl)
            ld      b,d
            ld      c,a
            and     b
            ld      l,(hl)
            ld      b,c
            ld      c,(hl)
            and     b
            ld      l,l
            ld      b,b
            ld      c,l
            and     b
            ld      l,h
            ccf
            ld      c,h
            and     b
            ld      l,h
            ld      a,$4B
            and     b
            ld      l,e
            dec     a
            ld      c,d
            and     b
            ld      l,d
            inc     a
            ld      c,c
            and     b
            ld      l,d
            dec     sp
            ld      c,b
            and     b
            ld      l,c
            ld      a,($9E48)
            ld      l,b
            ld      a,($9C48)
            ld      l,b
            add     hl,sp
            ld      c,b
            sbc     a,d
            ld      l,b
            add     hl,sp
            ld      c,b
            sub     a
            ld      h,a
            jr      c,$1698
            sub     h
            ld      h,a
            jr      c,$169C
            sub     c
            ld      h,(hl)
            scf
            ld      c,c
            adc     a,a
            ld      h,(hl)
            ld      (hl),$49
            adc     a,l
            ld      h,l
            dec     (hl)
            ld      c,c
            adc     a,c
            ld      h,l
            inc     (hl)
            ld      c,c
            add     a,(hl)
            ld      h,h
            inc     (hl)
            ld      c,d
            add     a,d
            ld      h,h
            inc     sp
            ld      c,d
            ld      a,(hl)
            ld      h,e
            ld      ($7B4A),a
            ld      h,e
            ld      sp,$784B
            ld      h,d
            jr      nc,$16C3
            ld      (hl),h
            ld      h,d
            jr      nc,$16C8
            ld      l,(hl)
            ld      h,d
            cpl
            ld      c,l
            ld      l,b
            ld      e,a
            scf
            ld      d,b
            ld      e,(hl)
            ld      h,c
            cpl
            ld      d,b
            ld      e,d
            ld      h,c
            ld      l,$53
            ld      d,b
            ld      h,b
            ld      l,$55
            ld      c,e
            ld      e,a
            dec     l
            ld      d,(hl)
            ld      b,(hl)
            ld      e,a
            dec     l
            ld      d,a
            ld      b,d
            ld      l,a
            and     b
            ld      h,h
            and     b
            ld      l,a
            sbc     a,a
            ld      h,h
            sbc     a,a
            ld      l,a
            sbc     a,(hl)
            ld      h,h
            sbc     a,(hl)
            ld      l,a
            sbc     a,l
            ld      h,h
            sbc     a,l
            ld      l,(hl)
            sbc     a,h
            ld      h,l
            sbc     a,h
            ld      l,(hl)
            sbc     a,e
            ld      h,l
            sbc     a,e
            ld      l,l
            sbc     a,d
            ld      h,(hl)
            sbc     a,d
            ld      l,l
            sbc     a,c
            ld      h,(hl)
            sbc     a,c
            ld      l,h
            sbc     a,b
            ld      h,a
            sbc     a,b
            ld      l,e
            sub     a
            ld      l,b
            sub     a
            rst     $38
;=========================================================================================
; ----> DUGOUT  TERSE block 270  ($16C2-$170D)
; SIZE: 4x18
;=========================================================================================
            DB      $00, $00, $04, $12  ; X/Y hotspot, row width, row count
            DB      $00, $00, $10, $00  ; ...................#............
            DB      $00, $00, $78, $00  ; .................####...........
            DB      $00, $00, $FE, $00  ; ................#######.........
            DB      $00, $00, $7F, $00  ; .................#######........
            DB      $00, $00, $1F, $80  ; ...................######.......
            DB      $00, $00, $1F, $80  ; ...................######.......
            DB      $00, $00, $3F, $00  ; ..................######........
            DB      $00, $00, $7E, $00  ; .................######.........
            DB      $00, $01, $F8, $00  ; ...............######...........
            DB      $00, $03, $F0, $00  ; ..............######............
            DB      $00, $0F, $C0, $00  ; ............######..............
            DB      $10, $1F, $80, $00  ; ...#.......######...............
            DB      $78, $7E, $00, $00  ; .####....######.................
            DB      $FE, $FC, $00, $00  ; #######.######..................
            DB      $7F, $F0, $00, $00  ; .###########....................
            DB      $1F, $E0, $00, $00  ; ...########.....................
            DB      $0F, $80, $00, $00  ; ....#####.......................
            DB      $03, $00, $00, $00  ; ......##........................
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $170F: literal16
            DW      $7C0A               ; Inline cell
            DB      $17                 ; $1712: B@
            DB      $1E                 ; $1713: 0BRANCH
            DW      $1727               ; Branch destination
            DB      $19                 ; $1716: literal8
            DB      $60                 ; Inline byte
            DB      $01                 ; $1718: SWAP
            DB      $27                 ; $1719: -
            DB      $19                 ; $171A: literal8
            DB      $60                 ; Inline byte
            DB      $14                 ; $171C: +
            DB      $01                 ; $171D: SWAP
            DB      $19                 ; $171E: literal8
            DB      $9F                 ; Inline byte
            DB      $01                 ; $1720: SWAP
            DB      $27                 ; $1721: -
            DB      $19                 ; $1722: literal8
            DB      $9F                 ; Inline byte
            DB      $14                 ; $1724: +
            DB      $09                 ; $1725: 1+
            DB      $01                 ; $1726: SWAP
            DB      $03                 ; $1727: RETURN
            DB      $C5                 ; $1728: preserved data boundary
            push    iy
            push    ix
            call    $14AD
            pop     ix
            pop     iy
            pop     bc
            jp      (iy)
            pop     hl
            pop     de
            sla     e
            rl      d
            sla     e
            rl      d
            sla     e
            rl      d
            sla     e
            rl      d
            sla     e
            rl      d
            sla     e
            rl      d
            push    bc
            ld      c,$00
            call    $0D2F
            and     $03
            ld      ($7E77),a
            ld      de,$4000
            add     hl,de
            ld      ($7E79),hl
            pop     bc
            jp      (iy)
            rst     $08                 ; Enter the inline TERSE thread
            DB      $38                 ; $1767: _VM_170E
            DB      $1B                 ; $1768: literal16
            DW      $7E71               ; Inline cell
            DB      $02                 ; $176B: !
            DB      $1B                 ; $176C: literal16
            DW      $7E6F               ; Inline cell
            DB      $02                 ; $176F: !
            DB      $39                 ; $1770: word at $1728
            DB      $03                 ; $1771: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $38                 ; $1773: _VM_170E
            DB      $1B                 ; $1774: literal16
            DW      $7E71               ; Inline cell
            DB      $02                 ; $1777: !
            DB      $1B                 ; $1778: literal16
            DW      $7E6F               ; Inline cell
            DB      $02                 ; $177B: !
            DB      $38                 ; $177C: _VM_170E
            DB      $06                 ; $177D: 2DUP
            DB      $1B                 ; $177E: literal16
            DW      $7E73               ; Inline cell
            DB      $02                 ; $1781: !
            DB      $1B                 ; $1782: literal16
            DW      $7E75               ; Inline cell
            DB      $02                 ; $1785: !
            DB      $3A                 ; $1786: SWAB
            DB      $3B                 ; $1787: word at $1737
            DB      $39                 ; $1788: word at $1728
            DB      $03                 ; $1789: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $08                 ; $178B: DUP
            DB      $17                 ; $178C: B@
            DB      $01                 ; $178D: SWAP
            DB      $09                 ; $178E: 1+
            DB      $03                 ; $178F: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1791: literal16
            DW      $1619               ; Inline cell
            DB      $08                 ; $1794: DUP
            DB      $3C                 ; $1795: _VM_178A
            DB      $3C                 ; $1796: _VM_178A
            DB      $07                 ; $1797: DROP
            DB      $01                 ; $1798: SWAP
            DB      $3D                 ; $1799: 2-
            DB      $19                 ; $179A: literal8
            DB      $03                 ; Inline byte
            DB      $3E                 ; $179C: PICK
            DB      $3F                 ; $179D: 2+
            DB      $3C                 ; $179E: _VM_178A
            DB      $3C                 ; $179F: _VM_178A
            DB      $07                 ; $17A0: DROP
            DB      $01                 ; $17A1: SWAP
            DB      $3D                 ; $17A2: 2-
            DB      $06                 ; $17A3: 2DUP
            DB      $19                 ; $17A4: literal8
            DB      $06                 ; Inline byte
            DB      $3E                 ; $17A6: PICK
            DB      $19                 ; $17A7: literal8
            DB      $06                 ; Inline byte
            DB      $3E                 ; $17A9: PICK
            DB      $40                 ; $17AA: _VM_1772
            DB      $40                 ; $17AB: _VM_1772
            DB      $19                 ; $17AC: literal8
            DB      $04                 ; Inline byte
            DB      $14                 ; $17AE: +
            DB      $08                 ; $17AF: DUP
            DB      $17                 ; $17B0: B@
            DB      $19                 ; $17B1: literal8
            DB      $FF                 ; Inline byte
            DB      $26                 ; $17B3: =
            DB      $1E                 ; $17B4: 0BRANCH
            DW      $1794               ; Branch destination
            DB      $07                 ; $17B7: DROP
            DB      $03                 ; $17B8: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $17BA: literal8
            DB      $04                 ; Inline byte
            DB      $3E                 ; $17BC: PICK
            DB      $19                 ; $17BD: literal8
            DB      $04                 ; Inline byte
            DB      $3E                 ; $17BF: PICK
            DB      $06                 ; $17C0: 2DUP
            DB      $01                 ; $17C1: SWAP
            DB      $19                 ; $17C2: literal8
            DB      $06                 ; Inline byte
            DB      $3E                 ; $17C4: PICK
            DB      $14                 ; $17C5: +
            DB      $01                 ; $17C6: SWAP
            DB      $40                 ; $17C7: _VM_1772
            DB      $05                 ; $17C8: ROT
            DB      $09                 ; $17C9: 1+
            DB      $05                 ; $17CA: ROT
            DB      $05                 ; $17CB: ROT
            DB      $0A                 ; $17CC: 1-
            DB      $08                 ; $17CD: DUP
            DB      $28                 ; $17CE: 0=
            DB      $1E                 ; $17CF: 0BRANCH
            DW      $17BA               ; Branch destination
            DB      $07                 ; $17D2: DROP
            DB      $07                 ; $17D3: DROP
            DB      $07                 ; $17D4: DROP
            DB      $07                 ; $17D5: DROP
            DB      $03                 ; $17D6: RETURN

;=========================================================================================
; ----> _OUTLINE  TERSE block 272; ROM $17D7-$17F2
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $17D8: literal8
            DB      $04                 ; Inline byte
            DB      $41                 ; $17DA: NDUP
            DB      $07                 ; $17DB: DROP
            DB      $19                 ; $17DC: literal8
            DB      $03                 ; Inline byte
            DB      $3E                 ; $17DE: PICK
            DB      $14                 ; $17DF: +
            DB      $13                 ; $17E0: OVER
            DB      $19                 ; $17E1: literal8
            DB      $04                 ; Inline byte
            DB      $41                 ; $17E3: NDUP
            DB      $40                 ; $17E4: _VM_1772
            DB      $19                 ; $17E5: literal8
            DB      $05                 ; Inline byte
            DB      $3E                 ; $17E7: PICK
            DB      $14                 ; $17E8: +
            DB      $42                 ; $17E9: _VM_1766
            DB      $19                 ; $17EA: literal8
            DB      $03                 ; Inline byte
            DB      $3E                 ; $17EC: PICK
            DB      $14                 ; $17ED: +
            DB      $42                 ; $17EE: _VM_1766
            DB      $07                 ; $17EF: DROP
            DB      $07                 ; $17F0: DROP
            DB      $42                 ; $17F1: _VM_1766
            DB      $03                 ; $17F2: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $17F4: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $17F7: B@
            DB      $1E                 ; $17F8: 0BRANCH
            DW      $1801               ; Branch destination
            DB      $1B                 ; $17FB: literal16
            DW      $0608               ; Inline cell
            DB      $1F                 ; $17FE: BRANCH
            DW      $1804               ; Branch destination
            DB      $1B                 ; $1801: literal16
            DW      $0308               ; Inline cell
            DB      $08                 ; $1804: DUP
            DB      $08                 ; $1805: DUP
            DB      $1B                 ; $1806: literal16
            DW      $3700               ; Inline cell
            DB      $1B                 ; $1809: literal16
            DW      $B000               ; Inline cell
            DB      $05                 ; $180C: ROT
            DB      $1B                 ; $180D: literal16
            DW      $7C96               ; Inline cell
            DB      $17                 ; $1810: B@
            DB      $29                 ; $1811: _CPOST
            DB      $1B                 ; $1812: literal16
            DW      $3F00               ; Inline cell
            DB      $1B                 ; $1815: literal16
            DW      $B000               ; Inline cell
            DB      $05                 ; $1818: ROT
            DB      $1B                 ; $1819: literal16
            DW      $7C95               ; Inline cell
            DB      $17                 ; $181C: B@
            DB      $29                 ; $181D: _CPOST
            DB      $1B                 ; $181E: literal16
            DW      $4700               ; Inline cell
            DB      $1B                 ; $1821: literal16
            DW      $B000               ; Inline cell
            DB      $05                 ; $1824: ROT
            DB      $1B                 ; $1825: literal16
            DW      $7C49               ; Inline cell
            DB      $17                 ; $1828: B@
            DB      $29                 ; $1829: _CPOST
            DB      $03                 ; $182A: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $182C: literal16
            DW      $8C00               ; Inline cell
            DB      $1B                 ; $182F: literal16
            DW      $0493               ; Inline cell
            DB      $1B                 ; $1832: literal16
            DW      $0501               ; Inline cell
            DB      $1B                 ; $1835: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $1838: _WRITE
            DB      $03                 ; $1839: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $183B: literal16
            DW      $0F00               ; Inline cell
            DB      $43                 ; $183E: _SUP
            DB      $1B                 ; $183F: literal16
            DW      $3F00               ; Inline cell
            DB      $43                 ; $1842: _SUP
            DB      $03                 ; $1843: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $0D                 ; $1845: 0
            DB      $1B                 ; $1846: literal16
            DW      $4000               ; Inline cell
            DB      $1B                 ; $1849: literal16
            DW      $3C00               ; Inline cell
            DB      $44                 ; $184C: FILL
            DB      $03                 ; $184D: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $0D                 ; $184F: 0
            DB      $1B                 ; $1850: literal16
            DW      $7C30               ; Inline cell
            DB      $1B                 ; $1853: literal16
            DW      $0270               ; Inline cell
            DB      $44                 ; $1856: FILL
            DB      $19                 ; $1857: literal8
            DB      $03                 ; Inline byte
            DB      $1B                 ; $1859: literal16
            DW      $7C3D               ; Inline cell
            DB      $04                 ; $185C: B!
            DB      $03                 ; $185D: RETURN

;=========================================================================================
; ----> _FMIRROR  Native entry $185E
;=========================================================================================
            push    bc
            ld      a,$0C
            out     ($19),a
            ld      a,$50
            out     ($0C),a
            ld      de,$C050
            ld      bc,$4000
            ld      hl,$004F
            push    de
            push    hl
            ld      a,(bc)
            ld      (hl),a
            dec     hl
            inc     bc
            dec     e
            jr      nz,$1872
            pop     hl
            ld      de,$0050
            add     hl,de
            pop     de
            dec     d
            jr      nz,$1870
            pop     bc
            jp      (iy)
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1886: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $1889: B@
            DB      $08                 ; $188A: DUP
            DB      $1E                 ; $188B: 0BRANCH
            DW      $1894               ; Branch destination
            DB      $1B                 ; $188E: literal16
            DW      $0608               ; Inline cell
            DB      $1F                 ; $1891: BRANCH
            DW      $1897               ; Branch destination
            DB      $1B                 ; $1894: literal16
            DW      $0308               ; Inline cell
            DB      $08                 ; $1897: DUP
            DB      $1B                 ; $1898: literal16
            DW      RAM_SCORE1          ; Inline cell
            DB      $17                 ; $189B: B@
            DB      $1E                 ; $189C: 0BRANCH
            DW      $18B2               ; Branch destination
            DB      $1B                 ; $189F: literal16
            DW      $4300               ; Inline cell
            DB      $1B                 ; $18A2: literal16
            DW      $8C00               ; Inline cell
            DB      $05                 ; $18A5: ROT
            DB      $1B                 ; $18A6: literal16
            DW      $4000               ; Inline cell
            DB      $1D                 ; $18A9: OR
            DB      $1B                 ; $18AA: literal16
            DW      RAM_SCORE1          ; Inline cell
            DB      $22                 ; $18AD: 1
            DB      $45                 ; $18AE: _NPOST
            DB      $1F                 ; $18AF: BRANCH
            DW      $18BC               ; Branch destination
            DB      $1B                 ; $18B2: literal16
            DW      $4500               ; Inline cell
            DB      $1B                 ; $18B5: literal16
            DW      $8C00               ; Inline cell
            DB      $05                 ; $18B8: ROT
            DB      $19                 ; $18B9: literal8
            DB      $30                 ; Inline byte
            DB      $29                 ; $18BB: _CPOST
            DB      $01                 ; $18BC: SWAP
            DB      $1E                 ; $18BD: 0BRANCH
            DW      $18C4               ; Branch destination
            DB      $1B                 ; $18C0: literal16
            DW      $0800               ; Inline cell
            DB      $1D                 ; $18C3: OR
            DB      $1B                 ; $18C4: literal16
            DW      RAM_SCORE2          ; Inline cell
            DB      $17                 ; $18C7: B@
            DB      $1E                 ; $18C8: 0BRANCH
            DW      $18DE               ; Branch destination
            DB      $1B                 ; $18CB: literal16
            DW      $0900               ; Inline cell
            DB      $1B                 ; $18CE: literal16
            DW      $8C00               ; Inline cell
            DB      $05                 ; $18D1: ROT
            DB      $1B                 ; $18D2: literal16
            DW      $4000               ; Inline cell
            DB      $1D                 ; $18D5: OR
            DB      $1B                 ; $18D6: literal16
            DW      RAM_SCORE2          ; Inline cell
            DB      $22                 ; $18D9: 1
            DB      $45                 ; $18DA: _NPOST
            DB      $1F                 ; $18DB: BRANCH
            DW      $18E8               ; Branch destination
            DB      $1B                 ; $18DE: literal16
            DW      $0B00               ; Inline cell
            DB      $1B                 ; $18E1: literal16
            DW      $8C00               ; Inline cell
            DB      $05                 ; $18E4: ROT
            DB      $19                 ; $18E5: literal8
            DB      $30                 ; Inline byte
            DB      $29                 ; $18E7: _CPOST
            DB      $03                 ; $18E8: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $18EA: literal16
            DW      $B600               ; Inline cell
            DB      $1B                 ; $18ED: literal16
            DW      UPTRI               ; Inline cell
            DB      $1B                 ; $18F0: literal16
            DW      $0501               ; Inline cell
            DB      $1B                 ; $18F3: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $18F6: _WRITE
            DB      $03                 ; $18F7: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $18F9: literal16
            DW      $B700               ; Inline cell
            DB      $1B                 ; $18FC: literal16
            DW      DNTRI               ; Inline cell
            DB      $1B                 ; $18FF: literal16
            DW      $0501               ; Inline cell
            DB      $1B                 ; $1902: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $1905: _WRITE
            DB      $03                 ; $1906: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1908: literal16
            DW      $0AC0               ; Inline cell
            DB      $01                 ; $190B: SWAP
            DB      $08                 ; $190C: DUP
            DB      $1E                 ; $190D: 0BRANCH
            DW      $191E               ; Branch destination
            DB      $0D                 ; $1910: 0
            DB      $15                 ; $1911: DO
            DB      $08                 ; $1912: DUP
            DB      $08                 ; $1913: DUP
            DB      $46                 ; $1914: _VM_18E9
            DB      $47                 ; $1915: _VM_18F8
            DB      $1B                 ; $1916: literal16
            DW      $0200               ; Inline cell
            DB      $14                 ; $1919: +
            DB      $18                 ; $191A: LOOP
            DB      $1F                 ; $191B: BRANCH
            DW      $191F               ; Branch destination
            DB      $07                 ; $191E: DROP
            DB      $03                 ; $191F: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $48                 ; $1921: _VM_184E
            DB      $49                 ; $1922: _VM_1844
            DB      $4A                 ; $1923: _VM_1437
            DB      $1B                 ; $1924: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $1927: B@
            DB      $1E                 ; $1928: 0BRANCH
            DW      $1944               ; Branch destination
            DB      $1B                 ; $192B: literal16
            DW      $7C8B               ; Inline cell
            DB      $30                 ; $192E: _BONE
            DB      $19                 ; $192F: literal8
            DB      $B1                 ; Inline byte
            DB      $08                 ; $1931: DUP
            DB      $08                 ; $1932: DUP
            DB      $22                 ; $1933: 1
            DB      $4B                 ; $1934: OUTP
            DB      $19                 ; $1935: literal8
            DB      $02                 ; Inline byte
            DB      $4B                 ; $1937: OUTP
            DB      $19                 ; $1938: literal8
            DB      $03                 ; Inline byte
            DB      $4B                 ; $193A: OUTP
            DB      $4C                 ; $193B: _VM_1790
            DB      $0D                 ; $193C: 0
            DB      $0E                 ; $193D: inline base addition
            DW      $142F               ; Inline cell
            DB      $1B                 ; $1940: literal16
            DW      $7E6D               ; Inline cell
            DB      $02                 ; $1943: !
            DB      $19                 ; $1944: literal8
            DB      $1F                 ; Inline byte
            DB      $19                 ; $1946: literal8
            DB      $8A                 ; Inline byte
            DB      $19                 ; $1948: literal8
            DB      $18                 ; Inline byte
            DB      $19                 ; $194A: literal8
            DB      $0E                 ; Inline byte
            DB      $4D                 ; $194C: _VM_17B9
            DB      $19                 ; $194D: literal8
            DB      $9D                 ; Inline byte
            DB      $19                 ; $194F: literal8
            DB      $AC                 ; Inline byte
            DB      $0D                 ; $1951: 0
            DB      $19                 ; $1952: literal8
            DB      $3E                 ; Inline byte
            DB      $40                 ; $1954: _VM_1772
            DB      $22                 ; $1955: 1
            DB      $19                 ; $1956: literal8
            DB      $2D                 ; Inline byte
            DB      $42                 ; $1958: _VM_1766
            DB      $19                 ; $1959: literal8
            DB      $04                 ; Inline byte
            DB      $19                 ; $195B: literal8
            DB      $24                 ; Inline byte
            DB      $42                 ; $195D: _VM_1766
            DB      $19                 ; $195E: literal8
            DB      $08                 ; Inline byte
            DB      $19                 ; $1960: literal8
            DB      $1D                 ; Inline byte
            DB      $42                 ; $1962: _VM_1766
            DB      $19                 ; $1963: literal8
            DB      $0D                 ; Inline byte
            DB      $19                 ; $1965: literal8
            DB      $16                 ; Inline byte
            DB      $42                 ; $1967: _VM_1766
            DB      $19                 ; $1968: literal8
            DB      $14                 ; Inline byte
            DB      $19                 ; $196A: literal8
            DB      $0D                 ; Inline byte
            DB      $42                 ; $196C: _VM_1766
            DB      $19                 ; $196D: literal8
            DB      $1F                 ; Inline byte
            DB      $19                 ; $196F: literal8
            DB      $06                 ; Inline byte
            DB      $42                 ; $1971: _VM_1766
            DB      $19                 ; $1972: literal8
            DB      $28                 ; Inline byte
            DB      $19                 ; $1974: literal8
            DB      $03                 ; Inline byte
            DB      $42                 ; $1976: _VM_1766
            DB      $19                 ; $1977: literal8
            DB      $A0                 ; Inline byte
            DB      $19                 ; $1979: literal8
            DB      $03                 ; Inline byte
            DB      $42                 ; $197B: _VM_1766
            DB      $1B                 ; $197C: literal16
            DW      $1D00               ; Inline cell
            DB      $1B                 ; $197F: literal16
            DW      $8D00               ; Inline cell
            DB      $1B                 ; $1982: literal16
            DW      DUGOUT              ; Inline cell
            DB      $1B                 ; $1985: literal16
            DW      $0868               ; Inline cell
            DB      $4E                 ; $1988: _WRITR
            DB      $1B                 ; $1989: literal16
            DW      $10C0               ; Inline cell
            DB      $1B                 ; $198C: literal16
            DW      $6600               ; Inline cell
            DB      $1B                 ; $198F: literal16
            DW      BASEPAT             ; Inline cell
            DB      $1B                 ; $1992: literal16
            DW      $0428               ; Inline cell
            DB      $4E                 ; $1995: _WRITR
            DB      $4F                 ; $1996: _FMIRROR
            DB      $1B                 ; $1997: literal16
            DW      $2880               ; Inline cell
            DB      $1B                 ; $199A: literal16
            DW      $4C00               ; Inline cell
            DB      $1B                 ; $199D: literal16
            DW      BASE2PAT            ; Inline cell
            DB      $1B                 ; $19A0: literal16
            DW      $0428               ; Inline cell
            DB      $4E                 ; $19A3: _WRITR
            DB      $1B                 ; $19A4: literal16
            DW      $2800               ; Inline cell
            DB      $1B                 ; $19A7: literal16
            DW      $AC00               ; Inline cell
            DB      $1B                 ; $19AA: literal16
            DW      HOMEPLATE           ; Inline cell
            DB      $1B                 ; $19AD: literal16
            DW      $0808               ; Inline cell
            DB      $4E                 ; $19B0: _WRITR
            DB      $1B                 ; $19B1: literal16
            DW      $2600               ; Inline cell
            DB      $1B                 ; $19B4: literal16
            DW      $AF00               ; Inline cell
            DB      $1B                 ; $19B7: literal16
            DW      BATD90              ; Inline cell
            DB      $1B                 ; $19BA: literal16
            DW      $0828               ; Inline cell
            DB      $4E                 ; $19BD: _WRITR
            DB      $19                 ; $19BE: literal8
            DB      $0C                 ; Inline byte
            DB      $19                 ; $19C0: literal8
            DB      $AA                 ; Inline byte
            DB      $19                 ; $19C2: literal8
            DB      $6E                 ; Inline byte
            DB      $19                 ; $19C4: literal8
            DB      $15                 ; Inline byte
            DB      $50                 ; $19C6: _OUTLINE
            DB      $1B                 ; $19C7: literal16
            DW      $0400               ; Inline cell
            DB      $1B                 ; $19CA: literal16
            DW      $B000               ; Inline cell
            DB      $1B                 ; $19CD: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $19D0: counted string
            DB      3                   ; Counted-string length
            DB      $49, $4E, $4E       ; INN
            DB      $2F                 ; $19D5: _SPOST
            DB      $1B                 ; $19D6: literal16
            DW      $0B00               ; Inline cell
            DB      $1B                 ; $19D9: literal16
            DW      $AF00               ; Inline cell
            DB      $1B                 ; $19DC: literal16
            DW      $0466               ; Inline cell
            DB      $1B                 ; $19DF: literal16
            DW      $0509               ; Inline cell
            DB      $1B                 ; $19E2: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $19E5: _WRITE
            DB      $19                 ; $19E6: literal8
            DB      $C4                 ; Inline byte
            DB      $19                 ; $19E8: literal8
            DB      $AA                 ; Inline byte
            DB      $19                 ; $19EA: literal8
            DB      $6C                 ; Inline byte
            DB      $19                 ; $19EC: literal8
            DB      $15                 ; Inline byte
            DB      $50                 ; $19EE: _OUTLINE
            DB      $1B                 ; $19EF: literal16
            DW      $3300               ; Inline cell
            DB      $1B                 ; $19F2: literal16
            DW      $B000               ; Inline cell
            DB      $1B                 ; $19F5: literal16
            DW      $0828               ; Inline cell
            DB      $19                 ; $19F8: literal8
            DB      $42                 ; Inline byte
            DB      $29                 ; $19FA: _CPOST
            DB      $19                 ; $19FB: literal8
            DB      $D7                 ; Inline byte
            DB      $19                 ; $19FD: literal8
            DB      $AE                 ; Inline byte
            DB      $19                 ; $19FF: literal8
            DB      $10                 ; Inline byte
            DB      $19                 ; $1A01: literal8
            DB      $0E                 ; Inline byte
            DB      $4D                 ; $1A03: _VM_17B9
            DB      $1B                 ; $1A04: literal16
            DW      $3B00               ; Inline cell
            DB      $1B                 ; $1A07: literal16
            DW      $B000               ; Inline cell
            DB      $1B                 ; $1A0A: literal16
            DW      $0828               ; Inline cell
            DB      $19                 ; $1A0D: literal8
            DB      $53                 ; Inline byte
            DB      $29                 ; $1A0F: _CPOST
            DB      $19                 ; $1A10: literal8
            DB      $F7                 ; Inline byte
            DB      $19                 ; $1A12: literal8
            DB      $AE                 ; Inline byte
            DB      $19                 ; $1A14: literal8
            DB      $10                 ; Inline byte
            DB      $19                 ; $1A16: literal8
            DB      $0E                 ; Inline byte
            DB      $4D                 ; $1A18: _VM_17B9
            DB      $1B                 ; $1A19: literal16
            DW      $4300               ; Inline cell
            DB      $1B                 ; $1A1C: literal16
            DW      $B000               ; Inline cell
            DB      $1B                 ; $1A1F: literal16
            DW      $0828               ; Inline cell
            DB      $19                 ; $1A22: literal8
            DB      $4F                 ; Inline byte
            DB      $29                 ; $1A24: _CPOST
            DB      $1B                 ; $1A25: literal16
            DW      $0117               ; Inline cell
            DB      $19                 ; $1A28: literal8
            DB      $AE                 ; Inline byte
            DB      $19                 ; $1A2A: literal8
            DB      $10                 ; Inline byte
            DB      $19                 ; $1A2C: literal8
            DB      $0E                 ; Inline byte
            DB      $4D                 ; $1A2E: _VM_17B9
            DB      $2C                 ; $1A2F: _HOM
            DB      $2D                 ; $1A30: _VIS
            DB      $51                 ; $1A31: _VM_1885
            DB      $19                 ; $1A32: literal8
            DB      $30                 ; Inline byte
            DB      $08                 ; $1A34: DUP
            DB      $08                 ; $1A35: DUP
            DB      $1B                 ; $1A36: literal16
            DW      $7C96               ; Inline cell
            DB      $04                 ; $1A39: B!
            DB      $1B                 ; $1A3A: literal16
            DW      $7C95               ; Inline cell
            DB      $04                 ; $1A3D: B!
            DB      $1B                 ; $1A3E: literal16
            DW      $7C49               ; Inline cell
            DB      $04                 ; $1A41: B!
            DB      $52                 ; $1A42: _VM_17F3
            DB      $1B                 ; $1A43: literal16
            DW      $7C0A               ; Inline cell
            DB      $17                 ; $1A46: B@
            DB      $1E                 ; $1A47: 0BRANCH
            DW      $1A50               ; Branch destination
            DB      $1B                 ; $1A4A: literal16
            DW      $3F00               ; Inline cell
            DB      $1F                 ; $1A4D: BRANCH
            DW      $1A53               ; Branch destination
            DB      $1B                 ; $1A50: literal16
            DW      $0F00               ; Inline cell
            DB      $43                 ; $1A53: _SUP
            DB      $1B                 ; $1A54: literal16
            DW      $0300               ; Inline cell
            DB      $1B                 ; $1A57: literal16
            DW      $A300               ; Inline cell
            DB      $1B                 ; $1A5A: literal16
            DW      $0439               ; Inline cell
            DB      $1B                 ; $1A5D: literal16
            DW      $0504               ; Inline cell
            DB      $1B                 ; $1A60: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $1A63: _WRITE
            DB      $1B                 ; $1A64: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $1A67: B@
            DB      $1E                 ; $1A68: 0BRANCH
            DW      $1A86               ; Branch destination
            DB      $1B                 ; $1A6B: literal16
            DW      $7C0C               ; Inline cell
            DB      $17                 ; $1A6E: B@
            DB      $08                 ; $1A6F: DUP
            DB      $1E                 ; $1A70: 0BRANCH
            DW      $1A85               ; Branch destination
            DB      $1B                 ; $1A73: literal16
            DW      RAM_PLYR1UP         ; Inline cell
            DB      $17                 ; $1A76: B@
            DB      $1E                 ; $1A77: 0BRANCH
            DW      $1A80               ; Branch destination
            DB      $0A                 ; $1A7A: 1-
            DB      $53                 ; $1A7B: _VM_1907
            DB      $46                 ; $1A7C: _VM_18E9
            DB      $1F                 ; $1A7D: BRANCH
            DW      $1A82               ; Branch destination
            DB      $53                 ; $1A80: _VM_1907
            DB      $07                 ; $1A81: DROP
            DB      $1F                 ; $1A82: BRANCH
            DW      $1A86               ; Branch destination
            DB      $07                 ; $1A85: DROP
            DB      $1B                 ; $1A86: literal16
            DW      $7C8B               ; Inline cell
            DB      $34                 ; $1A89: _BZERO
            DB      $03                 ; $1A8A: RETURN

;=========================================================================================
; ----> _RUN3CHK  TERSE block 168; ROM $1A8B-$1AA8
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $1A8C: literal8
            DB      $12                 ; Inline byte
            DB      $0E                 ; $1A8E: inline base addition
            DW      VEC_R3              ; Inline cell
            DB      $17                 ; $1A91: B@
            DB      $0D                 ; $1A92: 0
            DB      $26                 ; $1A93: =
            DB      $1E                 ; $1A94: 0BRANCH
            DW      $1AA1               ; Branch destination
            DB      $19                 ; $1A97: literal8
            DB      $07                 ; Inline byte
            DB      $19                 ; $1A99: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1A9B: inline base addition
            DW      VEC_R3              ; Inline cell
            DB      $1F                 ; $1A9E: BRANCH
            DW      $1AA8               ; Branch destination
            DB      $19                 ; $1AA1: literal8
            DB      $05                 ; Inline byte
            DB      $19                 ; $1AA3: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1AA5: inline base addition
            DW      VEC_R4              ; Inline cell
            DB      $03                 ; $1AA8: RETURN

;=========================================================================================
; ----> _RUN2CHK1ST  TERSE block 168; ROM $1AA9-$1AC0
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $1AAA: literal8
            DB      $12                 ; Inline byte
            DB      $0E                 ; $1AAC: inline base addition
            DW      VEC_R2              ; Inline cell
            DB      $17                 ; $1AAF: B@
            DB      $22                 ; $1AB0: 1
            DB      $26                 ; $1AB1: =
            DB      $1E                 ; $1AB2: 0BRANCH
            DW      $1ABF               ; Branch destination
            DB      $19                 ; $1AB5: literal8
            DB      $06                 ; Inline byte
            DB      $19                 ; $1AB7: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1AB9: inline base addition
            DW      VEC_R3              ; Inline cell
            DB      $1F                 ; $1ABC: BRANCH
            DW      $1AC0               ; Branch destination
            DB      $54                 ; $1ABF: _RUN3CHK
            DB      $03                 ; $1AC0: RETURN

;=========================================================================================
; ----> _RUN2CHK  TERSE block 168; ROM $1AC1-$1AD8
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $1AC2: literal8
            DB      $12                 ; Inline byte
            DB      $0E                 ; $1AC4: inline base addition
            DW      VEC_R2              ; Inline cell
            DB      $17                 ; $1AC7: B@
            DB      $0D                 ; $1AC8: 0
            DB      $26                 ; $1AC9: =
            DB      $1E                 ; $1ACA: 0BRANCH
            DW      $1AD7               ; Branch destination
            DB      $19                 ; $1ACD: literal8
            DB      $03                 ; Inline byte
            DB      $19                 ; $1ACF: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1AD1: inline base addition
            DW      VEC_R2              ; Inline cell
            DB      $1F                 ; $1AD4: BRANCH
            DW      $1AD8               ; Branch destination
            DB      $55                 ; $1AD7: _RUN2CHK1ST
            DB      $03                 ; $1AD8: RETURN

;=========================================================================================
; ----> _RUN2CHK12ND  TERSE block 168; ROM $1AD9-$1AF6
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $1ADA: literal8
            DB      $12                 ; Inline byte
            DB      $0E                 ; $1ADC: inline base addition
            DW      VEC_R2              ; Inline cell
            DB      $17                 ; $1ADF: B@
            DB      $0D                 ; $1AE0: 0
            DB      $26                 ; $1AE1: =
            DB      $1E                 ; $1AE2: 0BRANCH
            DW      $1AEF               ; Branch destination
            DB      $19                 ; $1AE5: literal8
            DB      $02                 ; Inline byte
            DB      $19                 ; $1AE7: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1AE9: inline base addition
            DW      VEC_R2              ; Inline cell
            DB      $1F                 ; $1AEC: BRANCH
            DW      $1AF6               ; Branch destination
            DB      $19                 ; $1AEF: literal8
            DB      $04                 ; Inline byte
            DB      $19                 ; $1AF1: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1AF3: inline base addition
            DW      VEC_R3              ; Inline cell
            DB      $03                 ; $1AF6: RETURN

;=========================================================================================
; ----> _RUN1CHK2ND  TERSE block 168; ROM $1AF7-$1B09
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $1AF8: literal8
            DB      $12                 ; Inline byte
            DB      $0E                 ; $1AFA: inline base addition
            DW      VEC_R1              ; Inline cell
            DB      $17                 ; $1AFD: B@
            DB      $19                 ; $1AFE: literal8
            DB      $02                 ; Inline byte
            DB      $26                 ; $1B00: =
            DB      $1E                 ; $1B01: 0BRANCH
            DW      $1B08               ; Branch destination
            DB      $56                 ; $1B04: _RUN2CHK12ND
            DB      $1F                 ; $1B05: BRANCH
            DW      $1B09               ; Branch destination
            DB      $57                 ; $1B08: _RUN2CHK
            DB      $03                 ; $1B09: RETURN

;=========================================================================================
; ----> _RUN1CHK1ST  TERSE block 168; ROM $1B0A-$1B20
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $1B0B: literal8
            DB      $12                 ; Inline byte
            DB      $0E                 ; $1B0D: inline base addition
            DW      VEC_R1              ; Inline cell
            DB      $17                 ; $1B10: B@
            DB      $22                 ; $1B11: 1
            DB      $26                 ; $1B12: =
            DB      $1E                 ; $1B13: 0BRANCH
            DW      $1B1F               ; Branch destination
            DB      $22                 ; $1B16: 1
            DB      $19                 ; $1B17: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1B19: inline base addition
            DW      VEC_R2              ; Inline cell
            DB      $1F                 ; $1B1C: BRANCH
            DW      $1B20               ; Branch destination
            DB      $58                 ; $1B1F: _RUN1CHK2ND
            DB      $03                 ; $1B20: RETURN

;=========================================================================================
; ----> _HRBY2  TERSE block 169; ROM $1B21-$1B2B
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1B22: literal16
            DW      $7C0F               ; Inline cell
            DB      $17                 ; $1B25: B@
            DB      $59                 ; $1B26: 2/
            DB      $1B                 ; $1B27: literal16
            DW      $7C0F               ; Inline cell
            DB      $04                 ; $1B2A: B!
            DB      $03                 ; $1B2B: RETURN

;=========================================================================================
; ----> _WHBODDS  TERSE block 169; ROM $1B2C-$1BA5
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $1B2D: literal8
            DB      $12                 ; Inline byte
            DB      $0E                 ; $1B2F: inline base addition
            DW      VEC_R1              ; Inline cell
            DB      $17                 ; $1B32: B@
            DB      $0D                 ; $1B33: 0
            DB      $26                 ; $1B34: =
            DB      $1E                 ; $1B35: 0BRANCH
            DW      $1B41               ; Branch destination
            DB      $0D                 ; $1B38: 0
            DB      $19                 ; $1B39: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1B3B: inline base addition
            DW      VEC_R1              ; Inline cell
            DB      $1F                 ; $1B3E: BRANCH
            DW      $1B42               ; Branch destination
            DB      $5A                 ; $1B41: _RUN1CHK1ST
            DB      $1B                 ; $1B42: literal16
            DW      $7C4B               ; Inline cell
            DB      $02                 ; $1B45: !
            DB      $1B                 ; $1B46: literal16
            DW      $7C3C               ; Inline cell
            DB      $04                 ; $1B49: B!
            DB      $19                 ; $1B4A: literal8
            DB      $24                 ; Inline byte
            DB      $5B                 ; $1B4C: RND
            DB      $1B                 ; $1B4D: literal16
            DW      $7C07               ; Inline cell
            DB      $04                 ; $1B50: B!
            DB      $19                 ; $1B51: literal8
            DB      $0A                 ; Inline byte
            DB      $5B                 ; $1B53: RND
            DB      $1B                 ; $1B54: literal16
            DW      $7C56               ; Inline cell
            DB      $04                 ; $1B57: B!
            DB      $1B                 ; $1B58: literal16
            DW      $7CAA               ; Inline cell
            DB      $17                 ; $1B5B: B@
            DB      $1B                 ; $1B5C: literal16
            DW      $7C0F               ; Inline cell
            DB      $04                 ; $1B5F: B!
            DB      $1B                 ; $1B60: literal16
            DW      RAM_SCORE2          ; Inline cell
            DB      $17                 ; $1B63: B@
            DB      $1B                 ; $1B64: literal16
            DW      RAM_SCORE1          ; Inline cell
            DB      $17                 ; $1B67: B@
            DB      $1B                 ; $1B68: literal16
            DW      RAM_PLYR1UP         ; Inline cell
            DB      $17                 ; $1B6B: B@
            DB      $1E                 ; $1B6C: 0BRANCH
            DW      $1B70               ; Branch destination
            DB      $01                 ; $1B6F: SWAP
            DB      $27                 ; $1B70: -
            DB      $08                 ; $1B71: DUP
            DB      $0D                 ; $1B72: 0
            DB      $5C                 ; $1B73: <
            DB      $1E                 ; $1B74: 0BRANCH
            DW      $1B8C               ; Branch destination
            DB      $1B                 ; $1B77: literal16
            DW      $FFFD               ; Inline cell
            DB      $5D                 ; $1B7A: >
            DB      $1E                 ; $1B7B: 0BRANCH
            DW      $1B83               ; Branch destination
            DB      $19                 ; $1B7E: literal8
            DB      $07                 ; Inline byte
            DB      $1F                 ; $1B80: BRANCH
            DW      $1B85               ; Branch destination
            DB      $19                 ; $1B83: literal8
            DB      $08                 ; Inline byte
            DB      $1B                 ; $1B85: literal16
            DW      $7C0F               ; Inline cell
            DB      $04                 ; $1B88: B!
            DB      $1F                 ; $1B89: BRANCH
            DW      $1BA5               ; Branch destination
            DB      $08                 ; $1B8C: DUP
            DB      $19                 ; $1B8D: literal8
            DB      $02                 ; Inline byte
            DB      $5D                 ; $1B8F: >
            DB      $1E                 ; $1B90: 0BRANCH
            DW      $1BA4               ; Branch destination
            DB      $5E                 ; $1B93: _HRBY2
            DB      $08                 ; $1B94: DUP
            DB      $19                 ; $1B95: literal8
            DB      $04                 ; Inline byte
            DB      $5D                 ; $1B97: >
            DB      $1E                 ; $1B98: 0BRANCH
            DW      $1BA4               ; Branch destination
            DB      $5E                 ; $1B9B: _HRBY2
            DB      $08                 ; $1B9C: DUP
            DB      $19                 ; $1B9D: literal8
            DB      $06                 ; Inline byte
            DB      $5D                 ; $1B9F: >
            DB      $1E                 ; $1BA0: 0BRANCH
            DW      $1BA4               ; Branch destination
            DB      $5E                 ; $1BA3: _HRBY2
            DB      $07                 ; $1BA4: DROP
            DB      $03                 ; $1BA5: RETURN
            ret
            call    autor1
            ret
            ld      ($7CEB),a
            ret
            ld      ($7CEB),a
            ret
            call    autor1
            call    autor2
            ret
            ld      ($7CEB),a
            ld      ($7D0A),a
            ret
            call    autor1
            call    autor2
            call    autor3
            ret
            ld      ($7CEB),a
            call    autor2
            ret
            and     (hl)
            dec     de
            and     a
            dec     de
            xor     e
            dec     de
            xor     a
            dec     de
            or      e
            dec     de
            pop     bc
            dec     de
            rr      e
            cp      d
            dec     de
            ld      a,($7C3C)
            ld      hl,$1BD2
            call    indexw
            ld      hl,$1BF3
            ld      a,$81
            push    hl
            ex      de,hl
            jp      (hl)
            ret
            ld      a,$01
            ld      ($7C46),a
            ret
            ret
            call    autor1
            ld      a,($7CCF)
            and     a
            jp      nz,$1BF4
            ld      bc,VEC_R2
            ret
            ld      a,($7CD0)
            and     a
            jr      nz,$1C12
            call    autor1
            ld      bc,VEC_R2
            ret
            ld      bc,VEC_R2
            ld      a,($7CCF)
            and     a
            call    nz,autor1
            ret
            call    autor1
            call    autor2
            ld      bc,VEC_R2
            ld      a,($7CCF)
            and     a
            jp      nz,$1BF4
            ld      bc,VEC_R3
            ret
            ld      bc,VEC_R3
            ld      a,($7CCF)
            and     a
            jr      z,$1C48
            call    autor1
            ld      a,($7CD0)
            and     a
            call    z,autor2
            ret
            call    autor1
            call    autor2
            call    autor3
            ld      bc,VEC_R3
            ld      a,($7CCF)
            and     a
            jp      nz,$1BF4
            ld      bc,VEC_R1
            ret
            call    autor2
            ld      a,($7CCF)
            and     a
            ld      bc,VEC_R2
            jr      z,$1C72
            call    autor1
            jp      $1BF4
            ld      bc,VEC_R3
            ret
            jp      m,$FB1B
            dec     de
            add     hl,bc
            inc     e
            ld      d,$1C
            ld      hl,$491C
            inc     e
            ld      h,b
            inc     e
            dec     (hl)
            inc     e
            xor     a
            ld      ($7C47),a
            push    bc
            ld      a,($7C3C)
            ld      bc,VEC_R1
            ld      hl,$1C76
            call    indexw
            ld      hl,$1CA0
            ld      a,($7C39)
            push    hl
            ex      de,hl
            jp      (hl)
            ld      ($7C43),bc
            pop     bc
            jp      (iy)

;=========================================================================================
; ----> _2ROT  TERSE block 178; ROM $1CA7-$1CAA
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $05                 ; $1CA8: ROT
            DB      $05                 ; $1CA9: ROT
            DB      $03                 ; $1CAA: RETURN

;=========================================================================================
; ----> _SSAFE  TERSE block 178; ROM $1CAB-$1CB9
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1CAC: literal16
            DW      $2400               ; Inline cell
            DB      $5F                 ; $1CAF: _2ROT
            DB      $2E                 ; $1CB0: counted string
            DB      5                   ; Counted-string length
            DB      $53, $41, $46, $45, $20; SAFE
            DB      $2F                 ; $1CB7: _SPOST
            DB      $52                 ; $1CB8: _VM_17F3
            DB      $03                 ; $1CB9: RETURN

;=========================================================================================
; ----> _SFOUL  TERSE block 178; ROM $1CBA-$1CC7
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1CBB: literal16
            DW      $2400               ; Inline cell
            DB      $5F                 ; $1CBE: _2ROT
            DB      $2E                 ; $1CBF: counted string
            DB      5                   ; Counted-string length
            DB      $46, $4F, $55, $4C, $20; FOUL
            DB      $2F                 ; $1CC6: _SPOST
            DB      $03                 ; $1CC7: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1CC9: literal16
            DW      $7CC0               ; Inline cell
            DB      $17                 ; $1CCC: B@
            DB      $1E                 ; $1CCD: 0BRANCH
            DW      $1CEF               ; Branch destination
            DB      $1B                 ; $1CD0: literal16
            DW      $2300               ; Inline cell
            DB      $5F                 ; $1CD3: _2ROT
            DB      $2E                 ; $1CD4: counted string
            DB      5                   ; Counted-string length
            DB      $47, $52, $41, $4E, $44; GRAND
            DB      $2F                 ; $1CDB: _SPOST
            DB      $1B                 ; $1CDC: literal16
            DW      $2400               ; Inline cell
            DB      $1B                 ; $1CDF: literal16
            DW      $8800               ; Inline cell
            DB      $1B                 ; $1CE2: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $1CE5: counted string
            DB      4                   ; Counted-string length
            DB      $53, $4C, $41, $4D  ; SLAM
            DB      $2F                 ; $1CEB: _SPOST
            DB      $1F                 ; $1CEC: BRANCH
            DW      $1D00               ; Branch destination
            DB      $19                 ; $1CEF: literal8
            DB      $88                 ; Inline byte
            DB      $19                 ; $1CF1: literal8
            DB      $14                 ; Inline byte
            DB      $4B                 ; $1CF3: OUTP
            DB      $1B                 ; $1CF4: literal16
            DW      $2300               ; Inline cell
            DB      $5F                 ; $1CF7: _2ROT
            DB      $2E                 ; $1CF8: counted string
            DB      5                   ; Counted-string length
            DB      $48, $4F, $4D, $45, $52; HOMER
            DB      $2F                 ; $1CFF: _SPOST
            DB      $03                 ; $1D00: RETURN

;=========================================================================================
; ----> _SWALK  TERSE block 179; ROM $1D01-$1D0D
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1D02: literal16
            DW      $2400               ; Inline cell
            DB      $5F                 ; $1D05: _2ROT
            DB      $2E                 ; $1D06: counted string
            DB      4                   ; Counted-string length
            DB      $57, $41, $4C, $4B  ; WALK
            DB      $2F                 ; $1D0C: _SPOST
            DB      $03                 ; $1D0D: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1D0F: literal16
            DW      $7C49               ; Inline cell
            DB      $17                 ; $1D12: B@
            DB      $08                 ; $1D13: DUP
            DB      $19                 ; $1D14: literal8
            DB      $31                 ; Inline byte
            DB      $26                 ; $1D16: =
            DB      $1E                 ; $1D17: 0BRANCH
            DW      $1D2A               ; Branch destination
            DB      $07                 ; $1D1A: DROP
            DB      $1B                 ; $1D1B: literal16
            DW      $2300               ; Inline cell
            DB      $5F                 ; $1D1E: _2ROT
            DB      $2E                 ; $1D1F: counted string
            DB      5                   ; Counted-string length
            DB      $31, $20, $4F, $55, $54; 1 OUT
            DB      $2F                 ; $1D26: _SPOST
            DB      $1F                 ; $1D27: BRANCH
            DW      $1D4D               ; Branch destination
            DB      $19                 ; $1D2A: literal8
            DB      $32                 ; Inline byte
            DB      $26                 ; $1D2C: =
            DB      $1E                 ; $1D2D: 0BRANCH
            DW      $1D40               ; Branch destination
            DB      $1B                 ; $1D30: literal16
            DW      $2200               ; Inline cell
            DB      $5F                 ; $1D33: _2ROT
            DB      $2E                 ; $1D34: counted string
            DB      6                   ; Counted-string length
            DB      $32, $20, $4F, $55, $54, $53; 2 OUTS
            DB      $2F                 ; $1D3C: _SPOST
            DB      $1F                 ; $1D3D: BRANCH
            DW      $1D4D               ; Branch destination
            DB      $1B                 ; $1D40: literal16
            DW      $2200               ; Inline cell
            DB      $5F                 ; $1D43: _2ROT
            DB      $2E                 ; $1D44: counted string
            DB      6                   ; Counted-string length
            DB      $33, $20, $4F, $55, $54, $53; 3 OUTS
            DB      $2F                 ; $1D4C: _SPOST
            DB      $03                 ; $1D4D: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1D4F: literal16
            DW      $7C95               ; Inline cell
            DB      $17                 ; $1D52: B@
            DB      $19                 ; $1D53: literal8
            DB      $31                 ; Inline byte
            DB      $26                 ; $1D55: =
            DB      $1E                 ; $1D56: 0BRANCH
            DW      $1D6B               ; Branch destination
            DB      $1B                 ; $1D59: literal16
            DW      $2000               ; Inline cell
            DB      $5F                 ; $1D5C: _2ROT
            DB      $2E                 ; $1D5D: counted string
            DB      8                   ; Counted-string length
            DB      $53, $54, $52, $49, $4B, $45, $20, $31; STRIKE 1
            DB      $2F                 ; $1D67: _SPOST
            DB      $1F                 ; $1D68: BRANCH
            DW      $1D7A               ; Branch destination
            DB      $1B                 ; $1D6B: literal16
            DW      $2100               ; Inline cell
            DB      $5F                 ; $1D6E: _2ROT
            DB      $2E                 ; $1D6F: counted string
            DB      8                   ; Counted-string length
            DB      $53, $54, $52, $49, $4B, $45, $20, $32; STRIKE 2
            DB      $2F                 ; $1D79: _SPOST
            DB      $03                 ; $1D7A: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1D7C: literal16
            DW      $7C96               ; Inline cell
            DB      $17                 ; $1D7F: B@
            DB      $08                 ; $1D80: DUP
            DB      $19                 ; $1D81: literal8
            DB      $31                 ; Inline byte
            DB      $26                 ; $1D83: =
            DB      $1E                 ; $1D84: 0BRANCH
            DW      $1D98               ; Branch destination
            DB      $07                 ; $1D87: DROP
            DB      $1B                 ; $1D88: literal16
            DW      $2200               ; Inline cell
            DB      $5F                 ; $1D8B: _2ROT
            DB      $2E                 ; $1D8C: counted string
            DB      6                   ; Counted-string length
            DB      $42, $41, $4C, $4C, $20, $31; BALL 1
            DB      $2F                 ; $1D94: _SPOST
            DB      $1F                 ; $1D95: BRANCH
            DW      $1DBB               ; Branch destination
            DB      $19                 ; $1D98: literal8
            DB      $32                 ; Inline byte
            DB      $26                 ; $1D9A: =
            DB      $1E                 ; $1D9B: 0BRANCH
            DW      $1DAE               ; Branch destination
            DB      $1B                 ; $1D9E: literal16
            DW      $2200               ; Inline cell
            DB      $5F                 ; $1DA1: _2ROT
            DB      $2E                 ; $1DA2: counted string
            DB      6                   ; Counted-string length
            DB      $42, $41, $4C, $4C, $20, $32; BALL 2
            DB      $2F                 ; $1DAA: _SPOST
            DB      $1F                 ; $1DAB: BRANCH
            DW      $1DBB               ; Branch destination
            DB      $1B                 ; $1DAE: literal16
            DW      $2200               ; Inline cell
            DB      $5F                 ; $1DB1: _2ROT
            DB      $2E                 ; $1DB2: counted string
            DB      6                   ; Counted-string length
            DB      $42, $41, $4C, $4C, $20, $33; BALL 3
            DB      $2F                 ; $1DBA: _SPOST
            DB      $03                 ; $1DBB: RETURN
            ld      a,$30
            ld      ($7C96),a
            ld      ($7C95),a
            jp      (iy)
            push    bc
            push    iy
            call    blerase
            pop     iy
            pop     bc
            jp      (iy)

;=========================================================================================
; ----> _DOHOMER  TERSE block 180; ROM $1DD1-$1DDA
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $60                 ; $1DD2: word at $1DC6
            DB      $61                 ; $1DD3: _VM_1CC8
            DB      $62                 ; $1DD4: word at $1DBC
            DB      $52                 ; $1DD5: _VM_17F3
            DB      $1B                 ; $1DD6: literal16
            DW      $7CA0               ; Inline cell
            DB      $34                 ; $1DD9: _BZERO
            DB      $03                 ; $1DDA: RETURN

;=========================================================================================
; ----> _SGO  TERSE block 181; ROM $1DDB-$1DF1
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1DDC: literal16
            DW      $2000               ; Inline cell
            DB      $1B                 ; $1DDF: literal16
            DW      $2D00               ; Inline cell
            DB      $1B                 ; $1DE2: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $1DE5: counted string
            DB      9                   ; Counted-string length
            DB      $47, $41, $4D, $45, $20, $4F, $56, $45, $52; GAME OVER
            DB      $2F                 ; $1DF0: _SPOST
            DB      $03                 ; $1DF1: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1DF3: literal16
            DW      $7C49               ; Inline cell
            DB      $08                 ; $1DF6: DUP
            DB      $63                 ; $1DF7: 1+B!
            DB      $17                 ; $1DF8: B@
            DB      $19                 ; $1DF9: literal8
            DB      $33                 ; Inline byte
            DB      $26                 ; $1DFB: =
            DB      $1E                 ; $1DFC: 0BRANCH
            DW      $1E83               ; Branch destination
            DB      $64                 ; $1DFF: _VM_0CE7
            DB      $19                 ; $1E00: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1E02: inline base addition
            DW      VEC_PT              ; Inline cell
            DB      $19                 ; $1E05: literal8
            DB      $08                 ; Inline byte
            DB      $0D                 ; $1E07: 0
            DB      $15                 ; $1E08: DO
            DB      $08                 ; $1E09: DUP
            DB      $08                 ; $1E0A: DUP
            DB      $19                 ; $1E0B: literal8
            DB      $06                 ; Inline byte
            DB      $14                 ; $1E0D: +
            DB      $1B                 ; $1E0E: literal16
            DW      OFFFPA               ; Inline cell
            DB      $65                 ; $1E11: _SSTORE
            DB      $19                 ; $1E12: literal8
            DB      $11                 ; Inline byte
            DB      $14                 ; $1E14: +
            DB      $08                 ; $1E15: DUP
            DB      $17                 ; $1E16: B@
            DB      $19                 ; $1E17: literal8
            DB      $80                 ; Inline byte
            DB      $1D                 ; $1E19: OR
            DB      $19                 ; $1E1A: literal8
            DB      $F7                 ; Inline byte
            DB      $1A                 ; $1E1C: AND
            DB      $23                 ; $1E1D: _SBSTORE
            DB      $19                 ; $1E1E: literal8
            DB      $1F                 ; Inline byte
            DB      $14                 ; $1E20: +
            DB      $18                 ; $1E21: LOOP
            DB      $07                 ; $1E22: DROP
            DB      $1B                 ; $1E23: literal16
            DW      RAM_TAKEFIELD       ; Inline cell
            DB      $30                 ; $1E26: _BONE
            DB      $1B                 ; $1E27: literal16
            DW      $7C95               ; Inline cell
            DB      $17                 ; $1E2A: B@
            DB      $19                 ; $1E2B: literal8
            DB      $33                 ; Inline byte
            DB      $26                 ; $1E2D: =
            DB      $1E                 ; $1E2E: 0BRANCH
            DW      $1E32               ; Branch destination
            DB      $60                 ; $1E31: word at $1DC6
            DB      $19                 ; $1E32: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $1E34: inline base addition
            DW      VEC_R1              ; Inline cell
            DB      $19                 ; $1E37: literal8
            DB      $04                 ; Inline byte
            DB      $0D                 ; $1E39: 0
            DB      $15                 ; $1E3A: DO
            DB      $08                 ; $1E3B: DUP
            DB      $08                 ; $1E3C: DUP
            DB      $08                 ; $1E3D: DUP
            DB      $19                 ; $1E3E: literal8
            DB      $06                 ; Inline byte
            DB      $14                 ; $1E40: +
            DB      $1B                 ; $1E41: literal16
            DW      OFFFPA               ; Inline cell
            DB      $65                 ; $1E44: _SSTORE
            DB      $19                 ; $1E45: literal8
            DB      $11                 ; Inline byte
            DB      $14                 ; $1E47: +
            DB      $08                 ; $1E48: DUP
            DB      $17                 ; $1E49: B@
            DB      $19                 ; $1E4A: literal8
            DB      $F7                 ; Inline byte
            DB      $1A                 ; $1E4C: AND
            DB      $23                 ; $1E4D: _SBSTORE
            DB      $19                 ; $1E4E: literal8
            DB      $12                 ; Inline byte
            DB      $14                 ; $1E50: +
            DB      $17                 ; $1E51: B@
            DB      $1E                 ; $1E52: 0BRANCH
            DW      $1E5F               ; Branch destination
            DB      $08                 ; $1E55: DUP
            DB      $19                 ; $1E56: literal8
            DB      $11                 ; Inline byte
            DB      $14                 ; $1E58: +
            DB      $08                 ; $1E59: DUP
            DB      $17                 ; $1E5A: B@
            DB      $19                 ; $1E5B: literal8
            DB      $80                 ; Inline byte
            DB      $1D                 ; $1E5D: OR
            DB      $23                 ; $1E5E: _SBSTORE
            DB      $19                 ; $1E5F: literal8
            DB      $1F                 ; Inline byte
            DB      $14                 ; $1E61: +
            DB      $18                 ; $1E62: LOOP
            DB      $07                 ; $1E63: DROP
            DB      $1B                 ; $1E64: literal16
            DW      RAM_PLYR1UP         ; Inline cell
            DB      $17                 ; $1E67: B@
            DB      $1E                 ; $1E68: 0BRANCH
            DW      $1E80               ; Branch destination
            DB      $1B                 ; $1E6B: literal16
            DW      $7C0C               ; Inline cell
            DB      $17                 ; $1E6E: B@
            DB      $1B                 ; $1E6F: literal16
            DW      $7C08               ; Inline cell
            DB      $17                 ; $1E72: B@
            DB      $26                 ; $1E73: =
            DB      $1E                 ; $1E74: 0BRANCH
            DW      $1E80               ; Branch destination
            DB      $1B                 ; $1E77: literal16
            DW      $7C10               ; Inline cell
            DB      $30                 ; $1E7A: _BONE
            DB      $1B                 ; $1E7B: literal16
            DW      $7E7D               ; Inline cell
            DB      $30                 ; $1E7E: _BONE
            DB      $37                 ; $1E7F: word at $12EA
            DB      $1F                 ; $1E80: BRANCH
            DW      $1E88               ; Branch destination
            DB      $0D                 ; $1E83: 0
            DB      $0E                 ; $1E84: inline base addition
            DW      $0CA9               ; Inline cell
            DB      $0F                 ; $1E87: _BMUSIC
            DB      $62                 ; $1E88: word at $1DBC
            DB      $52                 ; $1E89: _VM_17F3
            DB      $66                 ; $1E8A: _VM_1D0E
            DB      $03                 ; $1E8B: RETURN
            rst     $08
            dec     de
            sub     l
            ld      a,h
            ex      af,af'
            ld      h,e
            rla
            add     hl,de
            inc     sp
            ld      h,$1E
            and     e
            ld      e,$67
            add     hl,de
            ld      (bc),a
            dec     de
            ld      b,b
            ld      a,h
            inc     b
            rra
            xor     c
            ld      e,$0D
            ld      c,$46
            ld      a,(bc)
            rrca
            ld      l,b
            ld      d,d
            inc     bc
            rst     $08
            dec     de
            sub     (hl)
            ld      a,h
            ex      af,af'
            ld      h,e
            rla
            add     hl,de
            inc     (hl)
            ld      h,$1E
            exx
            ld      e,$69
            ld      h,h
            dec     de
            and     d
            ld      a,h
            ld      h,e
            add     hl,de
            rlca
            dec     de
            ld      b,b
            ld      a,h
            inc     b
            dec     de
            ld      (hl),$7C
            jr      nc,$1EE2
            ld      b,b
            dec     de
            scf
            ld      a,h
            inc     b
            dec     de
            ret     nc
            ld      a,h
            jr      nc,$1F3D
            ld      l,e
            ld      l,h
            ld      h,d
            rra
            rst     $18
            ld      e,$0D
            ld      c,$8E
            ld      a,(bc)
            rrca
            ld      l,l
            ld      d,d
            inc     bc

;=========================================================================================
; ----> _FOULTIME  TERSE block 182; ROM $1EE1-$1EF4
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $6E                 ; $1EE2: _SFOUL
            DB      $1B                 ; $1EE3: literal16
            DW      $7C95               ; Inline cell
            DB      $08                 ; $1EE6: DUP
            DB      $17                 ; $1EE7: B@
            DB      $19                 ; $1EE8: literal8
            DB      $32                 ; Inline byte
            DB      $26                 ; $1EEA: =
            DB      $1E                 ; $1EEB: 0BRANCH
            DW      $1EF2               ; Branch destination
            DB      $07                 ; $1EEE: DROP
            DB      $1F                 ; $1EEF: BRANCH
            DW      $1EF4               ; Branch destination
            DB      $63                 ; $1EF2: 1+B!
            DB      $52                 ; $1EF3: _VM_17F3
            DB      $03                 ; $1EF4: RETURN
            rst     $08
            dec     c
            ld      c,$7E
            inc     c
            rrca
            ld      l,a
            inc     bc
            xor     e
            inc     e
            cp      d
            inc     e
            ld      c,$1D
            ld      c,(hl)
            dec     e
            ld      a,e
            dec     e
            ret     z
            inc     e
            xor     e
            inc     e
            ld      bc,$AB1D
            inc     e
            pop     hl
            ld      e,$F2
            dec     e
            adc     a,h
            ld      e,$AB
            ld      e,$D1
            dec     e
            push    af
            ld      e,$CF
            dec     de
            sbc     a,b
            ld      a,h
            inc     (hl)
            dec     de
            ld      e,$7C
            jr      nc,$1F76
            dec     de
            ld      e,$7C
            inc     (hl)
            dec     de
            sub     a
            ld      a,h
            rla
            ld      e,$38
            rra
            dec     c
            ld      c,$4B
            inc     c
            rrca
            rra
            add     hl,sp
            rra
            ld      h,h
            inc     bc
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1F3B: literal16
            DW      $7A00               ; Inline cell
            DB      $1B                 ; $1F3E: literal16
            DW      $0828               ; Inline cell
            DB      $19                 ; $1F41: literal8
            DB      $04                 ; Inline byte
            DB      $3E                 ; $1F43: PICK
            DB      $19                 ; $1F44: literal8
            DB      $04                 ; Inline byte
            DB      $3E                 ; $1F46: PICK
            DB      $1E                 ; $1F47: 0BRANCH
            DW      $1F50               ; Branch destination
            DB      $70                 ; $1F4A: word-array index
            DW      $1EFD               ; Inline cell
            DB      $1F                 ; $1F4D: BRANCH
            DW      $1F59               ; Branch destination
            DB      $70                 ; $1F50: word-array index
            DW      $1F0D               ; Inline cell
            DB      $19                 ; $1F53: literal8
            DB      $50                 ; Inline byte
            DB      $1B                 ; $1F55: literal16
            DW      $7CA0               ; Inline cell
            DB      $04                 ; $1F58: B!
            DB      $24                 ; $1F59: @
            DB      $1B                 ; $1F5A: literal16
            DW      $7C1E               ; Inline cell
            DB      $30                 ; $1F5D: _BONE
            DB      $31                 ; $1F5E: _EX
            DB      $1B                 ; $1F5F: literal16
            DW      $7C1E               ; Inline cell
            DB      $34                 ; $1F62: _BZERO
            DB      $07                 ; $1F63: DROP
            DB      $07                 ; $1F64: DROP
            DB      $03                 ; $1F65: RETURN

;=========================================================================================
; ----> _STRINGPRC  TERSE block 184; ROM $1F66-$1F93
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $1F67: literal16
            DW      $7C9F               ; Inline cell
            DB      $17                 ; $1F6A: B@
            DB      $08                 ; $1F6B: DUP
            DB      $1B                 ; $1F6C: literal16
            DW      $7C9F               ; Inline cell
            DB      $34                 ; $1F6F: _BZERO
            DB      $1B                 ; $1F70: literal16
            DW      $7CA0               ; Inline cell
            DB      $17                 ; $1F73: B@
            DB      $1E                 ; $1F74: 0BRANCH
            DW      $1F86               ; Branch destination
            DB      $1B                 ; $1F77: literal16
            DW      $7C40               ; Inline cell
            DB      $17                 ; $1F7A: B@
            DB      $22                 ; $1F7B: 1
            DB      $71                 ; $1F7C: _VM_1F3A
            DB      $1B                 ; $1F7D: literal16
            DW      $7C40               ; Inline cell
            DB      $04                 ; $1F80: B!
            DB      $0D                 ; $1F81: 0
            DB      $71                 ; $1F82: _VM_1F3A
            DB      $1F                 ; $1F83: BRANCH
            DW      $1F8F               ; Branch destination
            DB      $1B                 ; $1F86: literal16
            DW      $7C40               ; Inline cell
            DB      $04                 ; $1F89: B!
            DB      $1B                 ; $1F8A: literal16
            DW      $7C45               ; Inline cell
            DB      $17                 ; $1F8D: B@
            DB      $71                 ; $1F8E: _VM_1F3A
            DB      $1B                 ; $1F8F: literal16
            DW      $7C45               ; Inline cell
            DB      $34                 ; $1F92: _BZERO
            DB      $03                 ; $1F93: RETURN
            ld      a,(hl)
            ld      hl,$0000
            and     a
            ret     z
            ld      hl,$01B0
            bit     7,a
            jr      z,$1FA4
            call    nz,comphl
            ret
            ld      hl,$7E7E
            ld      a,($7C0A)
            and     a
            jr      z,$1FCC
            ld      a,(hl)
            and     a
            jr      nz,$1FBF
            in      a,($13)
            neg
            ld      ($7C59),a
            ld      a,$03
            out     ($28),a
            jr      $1FCA
            in      a,($13)
            neg
            ld      ($7C57),a
            ld      a,$02
            out     ($28),a
            jr      $1FEF
            ld      a,($7C1B)
            and     a
            jr      z,$1FF1
            ld      a,($7C35)
            and     a
            jr      nz,$1FF1
            ld      a,(hl)
            and     a
            jr      nz,$1FE7
            in      a,($13)
            ld      ($7C59),a
            ld      a,$01
            out     ($28),a
            jr      $1FEF
            in      a,($13)
            ld      ($7C57),a
            xor     a
            out     ($28),a
            jr      $2009
            ld      a,(hl)
            and     a
            jr      nz,$2000
            in      a,($13)
            ld      ($7C59),a
            ld      a,$03
            out     ($28),a
            jr      $2009
            in      a,($13)
            ld      ($7C57),a
            ld      a,$02
            out     ($28),a
            ld      a,(hl)
            xor     $01
            ld      (hl),a
            ld      a,($7C34)
            and     a
            ret     nz
            ld      a,($7C47)
            and     a
            ret     z
            ld      a,($7C54)
            and     a
            ret     nz
            ld      hl,$7C57
            call    $1F94
            ld      ($7C75),hl
            push    hl
            ld      hl,$7C59
            call    $1F94
            ld      ($7C77),hl
            pop     de
            bit     7,h
            jr      nz,$204B
            xor     a
            cp      h
            jr      nz,$2046
            cp      d
            jr      nz,$2046
            cp      e
            jr      nz,$2046
            cp      l
            jr      nz,$2046
            ld      hl,$0428
            jr      $2053
            ld      hl,$0028
            jr      $204E
            ld      hl,$0068
            push    hl
            call    $11FB
            pop     hl
            ld      ($7C72),hl
            ret

;=========================================================================================
; ----> _TBALLPITCH  Native entry $2057
;=========================================================================================
            ld      hl,$7C58
            ld      a,($7C57)
            bit     7,a
            push    af
            sub     (hl)
            ex      af,af'
            pop     af
            jp      m,$2077
            ex      af,af'
            jp      m,$2074
            add     a,(hl)
            ld      (hl),a
            cp      $03
            jp      c,$2073
            ld      a,$03
            ld      (hl),a
            jp      $207E
            ld      a,(hl)
            cp      $02
            jp      c,$207E
            dec     (hl)
            ld      a,(hl)
            ld      h,a
            ld      l,$00
            di
            ld      ($7C7D),hl
            ld      hl,$7C59
            ld      de,$0000
            ld      a,($7CA2)
            cp      $02
            jp      nc,$20A7
            ld      a,(hl)
            and     a
            jp      z,$20A7
            bit     7,a
            jp      nz,$20A4
            ld      de,$00C0
            jp      $20A7
            ld      de,$FF40
            ld      ($7C7F),de
            ei
            ret
            nop
            ld      (bc),a
            nop
            djnz    $20B2
            jr      nz,$20B4
            jr      nc,$20B6
            ld      b,b
            nop
            ld      (bc),a
            nop
            ex      af,af'
            nop
            djnz    $20BE
            ld      d,$00
            jr      $20C2
            inc     h
            nop
            jr      z,$20C6
            ld      l,$00
            scf
            nop
            ld      a,($3F00)
            nop
            ld      b,a
            nop
            ld      c,(hl)
            nop
            jr      z,$20D4
            jr      nz,$20D6
            inc     bc
            rst     $08
            dec     de
            jp      c,$1B0F
            rrc     a
            dec     de
            ccf
            ld      a,h
            jr      nc,$20FE
            pop     de
            ld      a,h
            jr      nc,$20EA
            rst     $08
            dec     de
            ld      b,d
            ld      a,h
            jr      nc,$2108
            jp      c,$1B0F
            in      a,($0F)
            inc     bc
            rst     $08
            dec     de
            jp      c,$1B0F
            jp      p,$030F
            rst     $08
            dec     de
            ld      (bc),a
            djnz    $211B
            jp      m,$030F
            rst     $08
            dec     de
            ld      b,d
            ld      a,h
            jr      nc,$2124
            ld      hl,$1B10
            ld      a,(bc)
            djnz    $2112
            rst     $08
            dec     de
            rst     $08
            ld      a,h
            jr      nc,$2130
            add     hl,hl
            djnz    $2133
            ld      l,(hl)
            rrca
            inc     bc
            rst     $08
            dec     de
            rst     $08
            ld      a,h
            jr      nc,$213C
            ld      sp,$1B10
            ld      l,(hl)
            rrca
            inc     bc
            rst     $08
            dec     de
            ld      b,d
            ld      a,h
            jr      nc,$2148
            add     hl,sp
            djnz    $214B
            ld      l,(hl)
            rrca
            inc     bc
            rst     $08
            dec     de
            rst     $08
            ld      a,h
            jr      nc,$2154
            adc     a,l
            rrca
            dec     de
            ld      a,$0F
            dec     de
            ld      b,c
            djnz    $2145
            rst     $08
            dec     de
            rst     $08
            ld      a,h
            jr      nc,$2163
            adc     a,l
            rrca
            dec     de
            ld      a,$0F
            dec     de
            ld      c,c
            djnz    $2154
            rst     $08
            dec     de
            ld      b,d
            ld      a,h
            jr      nc,$2172
            adc     a,l
            rrca
            dec     de
            ld      e,c
            djnz    $2178
            ld      d,c
            djnz    $2163
            rst     $08
            dec     de
            adc     a,b
            djnz    $2180
            ld      (hl),b
            djnz    $2183
            jp      c,$030F
            rst     $08
            dec     de
            adc     a,b
            djnz    $218B
            ld      a,b
            djnz    $218E
            jp      c,$030F
            rst     $08
            dec     de
            ld      b,d
            ld      a,h
            jr      nc,$2197
            adc     a,l
            rrca
            dec     de
            add     a,b
            djnz    $219D
            jp      c,$030F
            rst     $08
            dec     de
            pop     de
            ld      a,h
            jr      nc,$21A6
            ccf
            ld      a,h
            jr      nc,$21AA
            jp      c,$1B0F
            cp      e
            rrca
            dec     de
            jp      c,$030F
            rst     $10
            jr      nz,$2182
            jr      nz,$2190
            jr      nz,$219A
            jr      nz,$21A4
            ld      hl,$210F
            dec     de
            ld      hl,$2127
            inc     sp
            ld      hl,$2142
            ld      d,c
            ld      hl,$2160
            ld      l,e
            ld      hl,$2176
            add     a,l
            ld      hl,$F1D9
            add     a,$05
            ld      ($7C92),a
            pop     af
            add     a,$04
            ld      b,a
            pop     hl
            ld      a,l
            pop     hl
            pop     de
            and     a
            jr      z,$21DA
            cp      $01
            jr      nz,$21D4
            ld      ($7C4E),a
            ld      de,$0500
            jr      $21DA
            ld      ($7C4D),a
            ld      de,$0100
            ld      c,a
            ld      a,d
            cp      $28
            jr      nc,$2227
            ld      a,h
            cp      $0A
            jr      nc,$21F5
            ld      hl,$20D1
            ld      a,c
            call    indexw
            ld      h,b
            ld      ($7C8F),hl
            ld      hl,$01C0
            jr      $2227
            cp      $46
            jr      c,$220B
            ld      hl,$20D1
            ld      a,c
            call    indexw
            ld      a,b
            neg
            ld      ($7C90),a
            ld      hl,$4E00
            jr      $2227
            ld      a,($7C15)
            dec     a
            jr      nz,$2214
            ld      a,b
            jr      $2224
            cp      $04
            jr      nz,$221D
            ld      a,b
            neg
            jr      $2224
            ld      a,b
            bit     0,l
            jr      nz,$2224
            neg
            ld      ($7C90),a
            ld      ($7E67),hl
            ld      ($7E69),de
            exx
            jp      (iy)
            rst     $08
            dec     de
            sbc     a,l
            ld      a,h
            inc     (hl)
            dec     de
            ld      (hl),$7C
            inc     (hl)
            dec     de
            and     d
            ld      a,h
            inc     (hl)
            dec     de
            xor     e
            ld      a,h
            inc     (hl)
            dec     c
            ld      c,$76
            dec     bc
            rrca
            dec     de
            ld      c,l
            ld      a,h
            inc     (hl)
            add     hl,de
            nop
            ld      c,$DA
            ld      a,h
            dec     de
            ld      b,e
            ld      a,h
            ld      (bc),a
            dec     de
            call    $347C
            dec     de
            xor     a
            ld      a,h
            inc     (hl)
            dec     de
            ret     nz
            ld      a,h
            inc     (hl)
            dec     de
            ld      a,($347C)
            dec     de
            ld      c,(hl)
            ld      a,h
            inc     (hl)
            dec     de
            push    bc
            ld      a,h
            inc     (hl)
            dec     de
            dec     d
            ld      a,h
            rla
            ex      af,af'
            ld      e,$8A
            ld      ($1B07),hl
            rrca
            ld      a,h
            rla
            add     hl,de
            ld      a,(bc)
            ld      e,e
            ld      e,h
            ld      e,$84
            ld      ($1F0D),hl
            add     a,l
            ld      ($0822),hl
            dec     de
            jr      c,$2305
            inc     b
            ld      e,$1D
            inc     hl
            dec     de
            ld      b,a
            ld      a,h
            jr      nc,$22AB
            jr      $22AF
            ld      d,d
            ld      a,h
            inc     b
            dec     de
            ld      b,d
            ld      a,h
            jr      nc,$22B5
            inc     bc
            ex      af,af'
            add     hl,de
            dec     e
            ld      c,$4E
            ld      a,(hl)
            inc     b
            dec     de
            ld      d,l
            ld      a,h
            inc     b
            dec     de
            ld      d,e
            ld      a,h
            jr      nc,$22C8
            push    bc
            ld      a,h
            jr      nc,$22CC
            nop
            jr      nc,$230F
            dec     de
            nop
            rlca
            inc     d
            dec     de
            dec     d
            ld      a,h
            rla
            ld      a,(bc)
            ld      (hl),b
            xor     l
            jr      nz,$22E5
            dec     de
            nop
            rrca
            ld      e,e
            inc     d
            add     hl,de
            ld      a,(bc)
            ld      e,e
            ex      af,af'
            ld      e,$DB
            ld      ($0519),hl
            ld      e,h
            ld      e,$D7
            ld      ($1F0D),hl
            ret     c
            ld      ($1F22),hl
            sbc     a,$22
            add     hl,de
            ld      (bc),a
            inc     d
            dec     de
            rst     $38
            dec     b
            ld      e,e
            dec     de
            rst     $38
            dec     b
            ld      e,e
            ld      (hl),d
            ld      l,h
            dec     de
            adc     a,l
            rrca
            dec     de
            ld      a,$0F
            add     hl,de
            add     hl,de
            ld      c,$4E
            ld      a,(hl)
            inc     h
            dec     de
            nop
            jr      z,$2354
            ld      e,$04
            inc     hl
            dec     de
            ld      c,(hl)
            rrca
            dec     de
            sbc     a,b
            djnz    $2321
            ld      a,(bc)
            inc     hl
            dec     de
            and     b
            djnz    $2323
            ld      e,(hl)
            rrca
            dec     de
            ld      l,(hl)
            rrca
            dec     de
            inc     (hl)
            ld      a,h
            rla
            ld      e,$1A
            inc     hl
            add     hl,de
            jr      nc,$2332
            cp      d
            ld      a,h
            inc     b
            rra
            inc     b
            inc     h
            dec     de
            call    $307C
            add     hl,de
            ld      (bc),a
            add     hl,de
            dec     e
            ld      c,$4E
            ld      a,(hl)
            inc     b
            dec     de
            ld      b,d
            ld      a,h
            inc     (hl)
            dec     de
            rst     $08
            ld      a,h
            inc     (hl)
            dec     de
            pop     de
            ld      a,h
            inc     (hl)
            dec     de
            dec     d
            ld      a,h
            rla
            ex      af,af'
            ld      e,$45
            inc     hl
            ld      a,(bc)
            ex      af,af'
            ld      (hl),e
            inc     d
            add     hl,de
            inc     bc
            ld      e,e
            inc     d
            ex      af,af'
            dec     de
            add     hl,sp
            ld      a,h
            inc     b
            ld      (hl),b
            sbc     a,b
            ld      hl,$3124
            dec     de
            add     hl,sp
            ld      a,h
            rla
            add     hl,de
            ex      af,af'
            ld      e,h
            ld      e,$6C
            inc     hl
            dec     de
            ret     nc
            ld      a,h
            jr      nc,$2379
            ld      a,(hl)
            rrca
            ld      e,a
            dec     de
            ld      a,$0F
            ld      e,a
            dec     de
            ld      c,(hl)
            rrca
            ld      e,a
            rra
            halt
            inc     hl
            dec     de
            ret     nc
            ld      a,h
            inc     (hl)
            dec     de
            ld      e,(hl)
            rrca
            dec     de
            ld      l,(hl)
            rrca
            dec     de
            pop     de
            ld      a,h
            rla
            ld      e,$AE
            inc     hl
            dec     c
            ld      c,$E4
            ld      a,(bc)
            rrca
            dec     de
            ccf
            ld      a,h
            jr      nc,$23A0
            ld      bc,$9F1B
            ld      a,h
            inc     b
            dec     de
            ret     nc
            ld      a,h
            rla
            ld      e,$99
            inc     hl
            dec     de
            nop
            ex      af,af'
            rra
            sbc     a,h
            inc     hl
            dec     de
            nop
            ld      c,b
            add     hl,de
            add     hl,de
            ld      c,$4E
            ld      a,(hl)
            ld      (bc),a
            dec     de
            nop
            ld      h,h
            add     hl,de
            dec     de
            ld      c,$4E
            ld      a,(hl)
            ld      (bc),a
            rra
            inc     b
            inc     h
            ld      l,h
            dec     de
            ld      b,d
            ld      a,h
            rla
            ld      e,$DA
            inc     hl
            add     hl,de
            djnz    $23D4
            ld      d,d
            ld      a,h
            inc     b
            dec     de
            ld      b,a
            ld      a,h
            jr      nc,$23DC
            ld      d,e
            ld      a,h
            jr      nc,$23DE
            inc     bc
            dec     de
            ld      d,l
            ld      a,h
            inc     b
            dec     de
            inc     (hl)
            ld      a,h
            rla
            ld      e,$D7
            inc     hl
            add     hl,de
            dec     (hl)
            dec     de
            cp      d
            ld      a,h
            inc     b
            rra
            rst     $18
            inc     hl
            ld      l,e
            dec     de
            ld      (hl),$7C
            jr      nc,$23FB
            add     hl,sp
            ld      a,h
            rla
            ld      a,(bc)
            ex      af,af'
            ld      (hl),b
            or      a
            jr      nz,$240D
            add     hl,de
            add     hl,de
            ld      c,$4E
            ld      a,(hl)
            ld      (bc),a
            add     hl,de
            ex      af,af'
            ld      h,$1E
            ei
            inc     hl
            dec     de
            nop
            inc     l
            rra
            cp      $23
            dec     de
            nop
            inc     a
            add     hl,de
            dec     de
            ld      c,$4E
            ld      a,(hl)
            ld      (bc),a
            add     hl,de
            ld      b,$0E
            jp      nc,$027D
            add     hl,de
            ld      b,$0E
            or      e
            ld      a,l
            ld      (bc),a
            add     hl,de
            ld      b,$0E
            sub     h
            ld      a,l
            ld      (bc),a
            add     hl,de
            ld      b,$0E
            ld      (hl),l
            ld      a,l
            ld      (bc),a
            add     hl,de
            ld      b,$0E
            ld      d,(hl)
            ld      a,l
            ld      (bc),a
            add     hl,de
            ex      af,af'
            ld      c,$4E
            ld      a,(hl)
            inc     (hl)
            dec     de
            inc     (hl)
            rrca
            add     hl,de
            ld      b,$0E
            ld      c,(hl)
            ld      a,(hl)
            ld      (bc),a
            dec     de
            jr      z,$243A
            dec     de
            ld      e,d
            ld      a,h
            ld      (bc),a
            dec     de
            nop
            jr      z,$2455
            dec     bc
            ld      c,$4E
            ld      a,(hl)
            ld      (bc),a
            dec     de
            nop
            xor     l
            add     hl,de
            rrca
            ld      c,$4E
            ld      a,(hl)
            ld      (bc),a
            add     hl,de
            ld      de,$560E
            ld      a,l
            add     hl,de
            add     hl,bc
            dec     c
            dec     d
            ex      af,af'
            ex      af,af'
            rla
            add     hl,de
            add     a,b
            dec     e
            inc     hl
            add     hl,de
            rra
            inc     d
            jr      $2466
            inc     bc

;=========================================================================================
; ----> BSRTBL  Base destination coordinates ($2460-$246F)
;
; Four little-endian (Y, X) fixed-point pairs; TERSE block 190.
;=========================================================================================
BSRTBL:
            DW      $3E80, $6100         ; First base: Y, X
            DW      $2800, $4700         ; Second base: Y, X
            DW      $11C0, $6300         ; Third base: Y, X
            DW      $2800, $A600         ; Home: Y, X
            res     7,(ix+$11)
            ld      a,$01
            ld      (RAM_SAMEDLT),a
            ret

;=========================================================================================
; ----> STOP_ACTION  Native entry $247A
;
; Select the standing action at NOACTPA through the shared action pointer.
;=========================================================================================
            ld      hl,NOACTPA
            ld      (RAM_VECTPC),hl
            ret

;=========================================================================================
; ----> THWANMSET  Native entry $2481
;
; Save the throwing vector, erase the ball, and schedule throw animation.
;=========================================================================================
            push    ix
            pop     hl
            ld      ($7C4F),hl
            call    blerase
            ld      a,$01
            ld      ($7CC5),a
            ld      (RAM_THROWANM),a
            jr      STOP_ACTION

;=========================================================================================
; ----> ON1ST  Native entry $2494
;
; Save IX as the first-base fielder.
;=========================================================================================
            push    ix
            pop     hl
            ld      ($7CC6),hl
            ret

;=========================================================================================
; ----> ON2ND  Native entry $249B
;
; Save IX as the second-base fielder.
;=========================================================================================
            push    ix
            pop     hl
            ld      ($7CC8),hl
            ret

;=========================================================================================
; ----> ON3RD  Native entry $24A2
;
; Save IX as the third-base fielder.
;=========================================================================================
            push    ix
            pop     hl
            ld      ($7CCA),hl
            ret

;=========================================================================================
; ----> BLDST  Native entry $24A9
;
; Calculate ball movement toward its destination.
;=========================================================================================
            ld      a,($7E6B)
            call    $13B7
            call    $1315
            cp      $05
            jp      z,$254F
            and     a
            jp      z,$2548
            xor     a
            ld      ($7CCD),a
            ld      ($7CC5),a
            ld      a,($7C3E)
            and     a
            jr      z,$24D3
            ld      hl,$0528
            ld      ($7C5A),hl
            ld      (RAM_CAUGHT),a
            jr      $2548
            push    hl
            push    de
            ld      a,($7C42)
            and     a
            jr      z,$2546
            ld      a,($7C34)
            and     a
            call    nz,$13C4
            ld      a,($7C4D)
            and     a
            jr      z,$251A
            ld      ($7CB4),a
            ld      ($7C97),a
            push    hl
            ld      hl,$0C4B
            call    music_gate
            pop     hl
            ld      hl,VEC_R4
            ld      a,($7C4B)
            cp      l
            jr      nz,$2504
            ld      a,$01
            ld      ($7CC0),a
            ld      a,$05
            ld      ($7C9F),a
            ld      a,$10
            ld      ($7CB9),a
            ld      a,$05
            ld      ($7CB8),a
            xor     a
            ld      ($7C4D),a
            call    killof
            ld      a,($7C4E)
            and     a
            jr      z,$2546
            ld      hl,($7C8F)
            ld      de,($7E59)
            add     hl,de
            ld      ($7E67),hl
            ld      hl,($7E5D)
            ld      de,($7C91)
            add     hl,de
            ld      ($7E69),hl
            push    hl
            ld      hl,FENCESCORE
            call    music_gate
            pop     hl
            xor     a
            ld      ($7C4E),a
            set     7,(ix+$11)
            pop     de
            pop     hl
            ld      ($7C5D),hl
            ld      ($7C5F),de
            ld      hl,$7C5A
            ld      (RAM_VECTPC),hl
            ret

;=========================================================================================
; ----> FLDDST  Native entry $2556
;
; Calculate fielder movement toward the field destination.
;=========================================================================================
            ld      a,$04
            call    $13B7
            call    $1315
            cp      $05
            jr      z,$25AE
            and     a
            jr      z,$25A3
            bit     4,(ix+$11)
            jr      z,$2585
            ld      bc,$0828
            ld      ($7CD8),a
            ld      a,($7C34)
            and     a
            jr      z,$257B
            ld      a,$04
            jr      $257D
            ld      a,$1C
            ld      ($7CB7),a
            ld      ($7C47),a
            jr      $2588
            ld      bc,$0428
            bit     5,(ix+$11)
            jr      z,$25A3
            ld      a,($7C3D)
            dec     a
            ld      ($7C3D),a
            and     a
            jr      nz,$25A3
            ld      (RAM_TAKEFIELD),a
            ld      a,$03
            ld      (RAM_OFTOTBL),a
            ld      ($7C3D),a
            ld      ($7C6A),bc
            ld      ($7C6D),hl
            ld      ($7C6F),de
            ld      hl,$7C6A
            ld      (RAM_VECTPC),hl
            ret

;=========================================================================================
; ----> OFFFDST  Native entry $25B5
;
; Calculate outfielder movement toward the field destination.
;=========================================================================================
            bit     5,(ix+$11)
            jr      z,$25C0
            ld      a,$20
            ld      ($7C8E),a
            ld      a,(RAM_PLYR1UP)
            bit     0,(ix+$11)
            jr      z,$25CB
            xor     $01
            and     a
            jr      nz,$25D3
            ld      hl,$3600
            jr      $25D6
            ld      hl,$1B00
            ld      de,$9300
            ld      a,$05
            call    $1315
            cp      $05
            jr      z,$2628
            and     a
            jr      z,$261D
            ld      bc,$0528
            bit     0,(ix+$11)
            jr      z,$261D
            ld      a,($7CA6)
            dec     a
            ld      ($7CA6),a
            jr      nz,$261D
            ld      a,($7C97)
            and     a
            jr      z,$261D
            push    hl
            push    ix
            pop     hl
            ld      a,($7C4B)
            cp      l
            pop     hl
            jr      nz,$261D
            ld      a,$01
            ld      (RAM_CAUGHT),a
            ld      ($7C3F),a
            ld      ($7CB4),a
            ld      ($7CB5),a
            ld      ($7CA0),a
            xor     a
            ld      ($7C97),a
            ld      ($7C82),bc
            ld      ($7C87),de
            ld      ($7C85),hl
            ld      hl,$7C82
            ld      (RAM_VECTPC),hl
            ret

;=========================================================================================
; ----> RUNDST  Native entry $262F
;
; Update runner movement, base occupancy, and arrival state.
;=========================================================================================
            ld      b,(ix+$12)
            ld      a,($7CAB)
            and     a
            jr      z,$265C
            push    ix
            pop     hl
            ld      a,(VEC_R1)
            cp      l
            jr      z,$265C
            ld      de,$001F
            and     a
            sbc     hl,de
            push    hl
            pop     iy
            ld      a,(iy+$12)
            dec     a
            cp      b
            jr      nz,$265C
            bit     6,(iy+$11)
            jr      z,$265C
            ld      a,$02
            ld      (ix+$1e),a
            ld      d,(ix+$1e)
            ld      c,(ix+$1d)
            ld      a,($7C97)
            and     a
            jr      nz,$2691
            bit     1,d
            jr      z,$2681
            bit     0,d
            jr      z,$2676
            ld      a,c
            and     a
            jr      nz,$26C7
            jr      $2698
            ld      a,c
            and     a
            jr      z,$26B4
            xor     a
            ld      (ix+$1d),a
            dec     b
            jr      $269D
            ld      a,($7CD7)
            and     a
            jr      z,$26A3
            ld      a,c
            and     a
            jr      z,$2698
            bit     2,(ix+$11)
            jr      z,$26C7
            ld      a,$03
            call    lvrstat
            jr      $26C7
            ld      a,$01
            ld      (ix+$1d),a
            res     3,(ix+$11)
            jr      $26C7
            ld      a,($7C3A)
            and     a
            jr      z,$26B0
            ld      a,$02
            ld      (ix+$1e),a
            jr      $2676
            ld      a,c
            and     a
            jr      nz,$267A
            dec     b
            bit     6,(ix+$11)
            jr      z,$26C7
            ld      a,($7CAB)
            and     a
            jr      z,$2735
            res     7,(ix+$11)
            jr      $2735
            ld      a,b
            push    bc
            ld      hl,BSRTBL
            sla     a
            call    indexw
            push    de
            inc     hl
            inc     hl
            ld      e,(hl)
            inc     hl
            ld      d,(hl)
            ld      a,$04
            pop     hl
            call    $1315
            cp      $05
            jr      z,$2759
            and     a
            jr      z,$274A
            set     6,(ix+$11)
            res     2,(ix+$11)
            res     1,(ix+$1e)
            pop     bc
            push    bc
            xor     a
            ld      (ix+$1d),a
            ld      a,(ix+$12)
            cp      b
            jr      nz,$2719
            inc     a
            cp      $04
            jr      nz,$2716
            ld      (RAM_SCRTIME),a
            pop     af
            ld      a,($7CA6)
            inc     a
            ld      ($7CA6),a
            set     7,(ix+$11)
            ld      bc,$0428
            jp      $261D
            ld      (ix+$12),a
            ld      a,($7C97)
            and     a
            jr      nz,$2731
            ld      a,($7C47)
            and     a
            jr      z,$2735
            ld      a,($7C36)
            and     a
            jr      nz,$2735
            ld      a,($7CAB)
            and     a
            jr      nz,$2735
            set     7,(ix+$11)
            ld      bc,$0A28
            ld      a,(ix+$0c)
            cp      $19
            jr      nc,$2742
            ld      bc,$0A68
            ld      hl,$0000
            ld      de,$0000
            jr      $274E
            res     6,(ix+$11)
            ld      ($7C62),bc
            ld      ($7C65),hl
            ld      ($7C67),de
            pop     af
            ld      hl,$7C62
            ld      (RAM_VECTPC),hl
            ret

;=========================================================================================
; ----> OFMOTION  Native entry $2761
;
; Select the outfielder trackball action in RAM.
;=========================================================================================
            ld      a,($7C73)
            cp      $04
            jr      nz,$276C
            res     7,(ix+$11)
            ld      hl,$7C72
            ld      (RAM_VECTPC),hl
            ret

;=========================================================================================
; ----> WAITTHRW  Native entry $2773
;
; Start throw setup and schedule the first-base wait timer.
;=========================================================================================
            call    THWANMSET
            ld      a,($7C3C)
            cp      $05
            ret     z
            xor     a
            ld      (RAM_THROWANM),a
            ld      a,$20
            ld      ($7C9E),a
            jp      STOP_ACTION

;=========================================================================================
; ----> BLMOTION  Native entry $2788
;
; Select the ball trackball action in RAM.
;=========================================================================================
            ld      hl,$7C7A
            ld      (RAM_VECTPC),hl
            ret

;=========================================================================================
; ----> OPTBL  Playaction command dispatch ($278F-$27A8)
;
; Thirteen little-endian native entry addresses, indexed by command minus $02.
;=========================================================================================
OPTBL:
            DW      ON1ST                ; $02
            DW      ON2ND                ; $03
            DW      ON3RD                ; $04
            DW      OFMOTION             ; $05
            DW      BLMOTION             ; $06
            DW      FLDDST               ; $07
            DW      RUNDST               ; $08
            DW      OFFFDST              ; $09
            DW      BLDST                ; $0A
            DW      THWANMSET            ; $0B
            DW      DEACTIVATE           ; $0C
            DW      WAITTHRW             ; $0D
            DW      STOP_ACTION          ; $0E

;=========================================================================================
; ----> OPCODECHK  Native entry $27A9
;
; Dispatch one playaction command below $28 through OPTBL.
;=========================================================================================
            ld      a,(hl)
            cp      $28
            jr      nc,$27C3
            dec     a
            dec     a
            inc     hl
            ld      (RAM_VECTPC),hl
            ld      hl,OPTBL
            call    indexw
            ld      hl,$27C0
            push    hl
            ex      de,hl
            jp      (hl)
            ld      hl,(RAM_VECTPC)
            ret

;=========================================================================================
; ----> LOADANM  Native entry $27C4
;
; Load magic and animation selection from the action record.
;=========================================================================================
            ld      a,(hl)
            ld      (ix+$00),a
            inc     hl
            ld      a,(hl)
            push    hl
            ld      hl,PATTERNS
            call    indexw
            ld      (ix+$03),d
            ld      (ix+$02),e
            pop     hl
            inc     hl
            ret

;=========================================================================================
; ----> ANMSEQLOAD  Native entry $27DA
;
; Select the animation sequence for the vector perspective.
;=========================================================================================
            ld      h,(ix+$03)
            ld      l,(ix+$02)
            ld      a,(ix+$15)
            call    indexw
            ld      (ix+$05),d
            ld      (ix+$04),e
            ret

;=========================================================================================
; ----> PACTLOAD  Native entry $27ED
;
; Load action timing and signed dy/dx increments into the vector.
;=========================================================================================
            ld      h,(ix+$07)
            ld      l,(ix+$06)
            call    OPCODECHK
            ld      a,(RAM_SAMEDLT)
            and     a
            jr      z,$2809
            inc     hl
            inc     hl
            xor     a
            ld      (RAM_SAMEDLT),a
            inc     hl
            inc     hl
            inc     hl
            inc     hl
            inc     hl
            jr      $2825
            call    LOADANM
            ld      a,(hl)
            ld      (ix+$08),a
            inc     hl
            ld      a,(hl)
            ld      (ix+$0d),a
            inc     hl
            ld      a,(hl)
            ld      (ix+$0e),a
            inc     hl
            ld      a,(hl)
            ld      (ix+$09),a
            inc     hl
            ld      a,(hl)
            ld      (ix+$0a),a
            inc     hl
            ld      (ix+$07),h
            ld      (ix+$06),l
            ret

;=========================================================================================
; ----> PATFETCH  Native entry $282C
;
; Advance the animation phase and store the selected bitmap pointer.
;=========================================================================================
            ld      hl,$0503
            ld      a,($7CD3)
            and     a
            jr      nz,$283E
            bit     4,(ix+$11)
            jr      z,$283E
            ld      hl,$1812
            ld      a,(ix+$01)
            inc     a
            cp      h
            jr      c,$2846
            xor     a
            ld      (ix+$01),a
            cp      l
            jr      nc,$284F
            xor     a
            jr      $2851
            ld      a,$01
            ld      h,(ix+$05)
            ld      l,(ix+$04)
            call    indexw
            ld      (ix+$14),d
            ld      (ix+$13),e
            ret

;=========================================================================================
; ----> PLAYACT  Native entry $2861
;
; Update action timing, select the perspective sequence, and fetch its bitmap.
;=========================================================================================
            push    bc
            push    ix
            ld      ix,(RAM_VECTIX)
            ld      a,(ix+$08)
            and     a
            jr      nz,$2873
            call    PACTLOAD
            jr      $287D
            cp      $FF
            jr      nz,$2879
            jr      $287D
            dec     a
            ld      (ix+$08),a
            call    ANMSEQLOAD
            call    PATFETCH
            pop     ix
            pop     bc
            ret
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $2888: literal16
            DW      $1E00               ; Inline cell
            DB      $19                 ; $288B: literal8
            DB      $19                 ; Inline byte
            DB      $0E                 ; $288D: inline base addition
            DW      VEC_SS              ; Inline cell
            DB      $02                 ; $2890: !
            DB      $1B                 ; $2891: literal16
            DW      $4800               ; Inline cell
            DB      $19                 ; $2894: literal8
            DB      $1B                 ; Inline byte
            DB      $0E                 ; $2896: inline base addition
            DW      VEC_SS              ; Inline cell
            DB      $02                 ; $2899: !
            DB      $1B                 ; $289A: literal16
            DW      $3A00               ; Inline cell
            DB      $19                 ; $289D: literal8
            DB      $19                 ; Inline byte
            DB      $0E                 ; $289F: inline base addition
            DW      VEC_FIRST           ; Inline cell
            DB      $02                 ; $28A2: !
            DB      $1B                 ; $28A3: literal16
            DW      $5B00               ; Inline cell
            DB      $19                 ; $28A6: literal8
            DB      $1B                 ; Inline byte
            DB      $0E                 ; $28A8: inline base addition
            DW      VEC_FIRST           ; Inline cell
            DB      $02                 ; $28AB: !
            DB      $1B                 ; $28AC: literal16
            DW      $1400               ; Inline cell
            DB      $19                 ; $28AF: literal8
            DB      $19                 ; Inline byte
            DB      $0E                 ; $28B1: inline base addition
            DW      VEC_THIRD           ; Inline cell
            DB      $02                 ; $28B4: !
            DB      $1B                 ; $28B5: literal16
            DW      $5B00               ; Inline cell
            DB      $19                 ; $28B8: literal8
            DB      $1B                 ; Inline byte
            DB      $0E                 ; $28BA: inline base addition
            DW      VEC_THIRD           ; Inline cell
            DB      $02                 ; $28BD: !
            DB      $1B                 ; $28BE: literal16
            DW      $3200               ; Inline cell
            DB      $19                 ; $28C1: literal8
            DB      $19                 ; Inline byte
            DB      $0E                 ; $28C3: inline base addition
            DW      VEC_SECOND          ; Inline cell
            DB      $02                 ; $28C6: !
            DB      $1B                 ; $28C7: literal16
            DW      $4800               ; Inline cell
            DB      $19                 ; $28CA: literal8
            DB      $1B                 ; Inline byte
            DB      $0E                 ; $28CC: inline base addition
            DW      VEC_SECOND          ; Inline cell
            DB      $02                 ; $28CF: !
            DB      $1B                 ; $28D0: literal16
            DW      $2800               ; Inline cell
            DB      $19                 ; $28D3: literal8
            DB      $19                 ; Inline byte
            DB      $0E                 ; $28D5: inline base addition
            DW      VEC_PT              ; Inline cell
            DB      $02                 ; $28D8: !
            DB      $1B                 ; $28D9: literal16
            DW      $6100               ; Inline cell
            DB      $19                 ; $28DC: literal8
            DB      $1B                 ; Inline byte
            DB      $0E                 ; $28DE: inline base addition
            DW      VEC_PT              ; Inline cell
            DB      $02                 ; $28E1: !
            DB      $1B                 ; $28E2: literal16
            DW      $1400               ; Inline cell
            DB      $19                 ; $28E5: literal8
            DB      $19                 ; Inline byte
            DB      $0E                 ; $28E7: inline base addition
            DW      VEC_LF              ; Inline cell
            DB      $02                 ; $28EA: !
            DB      $1B                 ; $28EB: literal16
            DW      $2A00               ; Inline cell
            DB      $19                 ; $28EE: literal8
            DB      $1B                 ; Inline byte
            DB      $0E                 ; $28F0: inline base addition
            DW      VEC_LF              ; Inline cell
            DB      $02                 ; $28F3: !
            DB      $1B                 ; $28F4: literal16
            DW      $3C00               ; Inline cell
            DB      $19                 ; $28F7: literal8
            DB      $19                 ; Inline byte
            DB      $0E                 ; $28F9: inline base addition
            DW      VEC_RF              ; Inline cell
            DB      $02                 ; $28FC: !
            DB      $1B                 ; $28FD: literal16
            DW      $2A00               ; Inline cell
            DB      $19                 ; $2900: literal8
            DB      $1B                 ; Inline byte
            DB      $0E                 ; $2902: inline base addition
            DW      VEC_RF              ; Inline cell
            DB      $02                 ; $2905: !
            DB      $1B                 ; $2906: literal16
            DW      $2800               ; Inline cell
            DB      $19                 ; $2909: literal8
            DB      $19                 ; Inline byte
            DB      $0E                 ; $290B: inline base addition
            DW      VEC_CF              ; Inline cell
            DB      $02                 ; $290E: !
            DB      $1B                 ; $290F: literal16
            DW      $1600               ; Inline cell
            DB      $19                 ; $2912: literal8
            DB      $1B                 ; Inline byte
            DB      $0E                 ; $2914: inline base addition
            DW      VEC_CF              ; Inline cell
            DB      $02                 ; $2917: !
            DB      $03                 ; $2918: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $291A: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $291C: inline base addition
            DW      VEC_R1              ; Inline cell
            DB      $19                 ; $291F: literal8
            DB      $04                 ; Inline byte
            DB      $0D                 ; $2921: 0
            DB      $15                 ; $2922: DO
            DB      $08                 ; $2923: DUP
            DB      $08                 ; $2924: DUP
            DB      $08                 ; $2925: DUP
            DB      $08                 ; $2926: DUP
            DB      $08                 ; $2927: DUP
            DB      $19                 ; $2928: literal8
            DB      $28                 ; Inline byte
            DB      $23                 ; $292A: _SBSTORE
            DB      $19                 ; $292B: literal8
            DB      $0C                 ; Inline byte
            DB      $14                 ; $292D: +
            DB      $19                 ; $292E: literal8
            DB      $25                 ; Inline byte
            DB      $23                 ; $2930: _SBSTORE
            DB      $19                 ; $2931: literal8
            DB      $10                 ; Inline byte
            DB      $14                 ; $2933: +
            DB      $19                 ; $2934: literal8
            DB      $A8                 ; Inline byte
            DB      $23                 ; $2936: _SBSTORE
            DB      $19                 ; $2937: literal8
            DB      $11                 ; Inline byte
            DB      $14                 ; $2939: +
            DB      $22                 ; $293A: 1
            DB      $23                 ; $293B: _SBSTORE
            DB      $19                 ; $293C: literal8
            DB      $13                 ; Inline byte
            DB      $14                 ; $293E: +
            DB      $1B                 ; $293F: literal16
            DW      NOBOD               ; Inline cell
            DB      $65                 ; $2942: _SSTORE
            DB      $19                 ; $2943: literal8
            DB      $1F                 ; Inline byte
            DB      $14                 ; $2945: +
            DB      $18                 ; $2946: LOOP
            DB      $19                 ; $2947: literal8
            DB      $08                 ; Inline byte
            DB      $0D                 ; $2949: 0
            DB      $15                 ; $294A: DO
            DB      $08                 ; $294B: DUP
            DB      $08                 ; $294C: DUP
            DB      $08                 ; $294D: DUP
            DB      $08                 ; $294E: DUP
            DB      $19                 ; $294F: literal8
            DB      $28                 ; Inline byte
            DB      $23                 ; $2951: _SBSTORE
            DB      $19                 ; $2952: literal8
            DB      $0C                 ; Inline byte
            DB      $14                 ; $2954: +
            DB      $1B                 ; $2955: literal16
            DW      RAM_PLYR1UP         ; Inline cell
            DB      $17                 ; $2958: B@
            DB      $1E                 ; $2959: 0BRANCH
            DW      $2961               ; Branch destination
            DB      $19                 ; $295C: literal8
            DB      $1B                 ; Inline byte
            DB      $1F                 ; $295E: BRANCH
            DW      $2963               ; Branch destination
            DB      $19                 ; $2961: literal8
            DB      $36                 ; Inline byte
            DB      $23                 ; $2963: _SBSTORE
            DB      $19                 ; $2964: literal8
            DB      $10                 ; Inline byte
            DB      $14                 ; $2966: +
            DB      $19                 ; $2967: literal8
            DB      $93                 ; Inline byte
            DB      $23                 ; $2969: _SBSTORE
            DB      $19                 ; $296A: literal8
            DB      $13                 ; Inline byte
            DB      $14                 ; $296C: +
            DB      $1B                 ; $296D: literal16
            DW      NOBOD               ; Inline cell
            DB      $65                 ; $2970: _SSTORE
            DB      $19                 ; $2971: literal8
            DB      $1F                 ; Inline byte
            DB      $14                 ; $2973: +
            DB      $18                 ; $2974: LOOP
            DB      $07                 ; $2975: DROP
            DB      $19                 ; $2976: literal8
            DB      $28                 ; Inline byte
            DB      $19                 ; $2978: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $297A: inline base addition
            DW      VEC_BL              ; Inline cell
            DB      $02                 ; $297D: !
            DB      $1B                 ; $297E: literal16
            DW      NOBOD               ; Inline cell
            DB      $19                 ; $2981: literal8
            DB      $13                 ; Inline byte
            DB      $0E                 ; $2983: inline base addition
            DW      VEC_BL              ; Inline cell
            DB      $02                 ; $2986: !
            DB      $19                 ; $2987: literal8
            DB      $02                 ; Inline byte
            DB      $19                 ; $2989: literal8
            DB      $11                 ; Inline byte
            DB      $0E                 ; $298B: inline base addition
            DW      VEC_BL              ; Inline cell
            DB      $04                 ; $298E: B!
            DB      $19                 ; $298F: literal8
            DB      $10                 ; Inline byte
            DB      $19                 ; $2991: literal8
            DB      $11                 ; Inline byte
            DB      $0E                 ; $2993: inline base addition
            DW      VEC_PT              ; Inline cell
            DB      $04                 ; $2996: B!
            DB      $19                 ; $2997: literal8
            DB      $20                 ; Inline byte
            DB      $19                 ; $2999: literal8
            DB      $11                 ; Inline byte
            DB      $0E                 ; $299B: inline base addition
            DW      VEC_RF              ; Inline cell
            DB      $04                 ; $299E: B!
            DB      $19                 ; $299F: literal8
            DB      $20                 ; Inline byte
            DB      $19                 ; $29A1: literal8
            DB      $11                 ; Inline byte
            DB      $0E                 ; $29A3: inline base addition
            DW      VEC_LF              ; Inline cell
            DB      $04                 ; $29A6: B!
            DB      $19                 ; $29A7: literal8
            DB      $20                 ; Inline byte
            DB      $19                 ; $29A9: literal8
            DB      $11                 ; Inline byte
            DB      $0E                 ; $29AB: inline base addition
            DW      VEC_CF              ; Inline cell
            DB      $04                 ; $29AE: B!
            DB      $19                 ; $29AF: literal8
            DB      $03                 ; Inline byte
            DB      $1B                 ; $29B1: literal16
            DW      $7C3D               ; Inline cell
            DB      $04                 ; $29B4: B!
            DB      $19                 ; $29B5: literal8
            DB      $07                 ; Inline byte
            DB      $1B                 ; $29B7: literal16
            DW      $7C71               ; Inline cell
            DB      $04                 ; $29BA: B!
            DB      $19                 ; $29BB: literal8
            DB      $06                 ; Inline byte
            DB      $1B                 ; $29BD: literal16
            DW      $7C81               ; Inline cell
            DB      $04                 ; $29C0: B!
            DB      $19                 ; $29C1: literal8
            DB      $05                 ; Inline byte
            DB      $1B                 ; $29C3: literal16
            DW      $7C79               ; Inline cell
            DB      $04                 ; $29C6: B!
            DB      $19                 ; $29C7: literal8
            DB      $09                 ; Inline byte
            DB      $1B                 ; $29C9: literal16
            DW      $7C89               ; Inline cell
            DB      $04                 ; $29CC: B!
            DB      $19                 ; $29CD: literal8
            DB      $08                 ; Inline byte
            DB      $1B                 ; $29CF: literal16
            DW      $7C69               ; Inline cell
            DB      $04                 ; $29D2: B!
            DB      $19                 ; $29D3: literal8
            DB      $0A                 ; Inline byte
            DB      $1B                 ; $29D5: literal16
            DW      $7C61               ; Inline cell
            DB      $04                 ; $29D8: B!
            DB      $1B                 ; $29D9: literal16
            DW      $0528               ; Inline cell
            DB      $1B                 ; $29DC: literal16
            DW      $7C62               ; Inline cell
            DB      $02                 ; $29DF: !
            DB      $1B                 ; $29E0: literal16
            DW      $0428               ; Inline cell
            DB      $1B                 ; $29E3: literal16
            DW      $7C72               ; Inline cell
            DB      $02                 ; $29E6: !
            DB      $1B                 ; $29E7: literal16
            DW      $0528               ; Inline cell
            DB      $1B                 ; $29EA: literal16
            DW      $7C7A               ; Inline cell
            DB      $02                 ; $29ED: !
            DB      $1B                 ; $29EE: literal16
            DW      $0628               ; Inline cell
            DB      $1B                 ; $29F1: literal16
            DW      $7C5A               ; Inline cell
            DB      $02                 ; $29F4: !
            DB      $03                 ; $29F5: RETURN

;=========================================================================================
; ----> _RETPA  TERSE block 213; ROM $29F6-$2A1A
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $29F7: literal8
            DB      $00                 ; Inline byte
            DB      $0E                 ; $29F9: inline base addition
            DW      VEC_PT              ; Inline cell
            DB      $19                 ; $29FC: literal8
            DB      $08                 ; Inline byte
            DB      $0D                 ; $29FE: 0
            DB      $15                 ; $29FF: DO
            DB      $08                 ; $2A00: DUP
            DB      $08                 ; $2A01: DUP
            DB      $19                 ; $2A02: literal8
            DB      $06                 ; Inline byte
            DB      $14                 ; $2A04: +
            DB      $1B                 ; $2A05: literal16
            DW      TFPA               ; Inline cell
            DB      $65                 ; $2A08: _SSTORE
            DB      $19                 ; $2A09: literal8
            DB      $11                 ; Inline byte
            DB      $14                 ; $2A0B: +
            DB      $08                 ; $2A0C: DUP
            DB      $17                 ; $2A0D: B@
            DB      $19                 ; $2A0E: literal8
            DB      $80                 ; Inline byte
            DB      $1D                 ; $2A10: OR
            DB      $19                 ; $2A11: literal8
            DB      $F7                 ; Inline byte
            DB      $1A                 ; $2A13: AND
            DB      $23                 ; $2A14: _SBSTORE
            DB      $19                 ; $2A15: literal8
            DB      $1F                 ; Inline byte
            DB      $14                 ; $2A17: +
            DB      $18                 ; $2A18: LOOP
            DB      $07                 ; $2A19: DROP
            DB      $03                 ; $2A1A: RETURN

;=========================================================================================
; ----> _SETTFPA  TERSE block 213; ROM $2A1B-$2A76
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $2A1C: literal16
            DW      TFPA2               ; Inline cell
            DB      $19                 ; $2A1F: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A21: inline base addition
            DW      VEC_PT              ; Inline cell
            DB      $02                 ; $2A24: !
            DB      $1B                 ; $2A25: literal16
            DW      TFPA1               ; Inline cell
            DB      $19                 ; $2A28: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A2A: inline base addition
            DW      VEC_FIRST           ; Inline cell
            DB      $02                 ; $2A2D: !
            DB      $1B                 ; $2A2E: literal16
            DW      TFPA1               ; Inline cell
            DB      $19                 ; $2A31: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A33: inline base addition
            DW      VEC_SECOND          ; Inline cell
            DB      $02                 ; $2A36: !
            DB      $1B                 ; $2A37: literal16
            DW      TFPA1               ; Inline cell
            DB      $19                 ; $2A3A: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A3C: inline base addition
            DW      VEC_THIRD           ; Inline cell
            DB      $02                 ; $2A3F: !
            DB      $1B                 ; $2A40: literal16
            DW      TFPA1               ; Inline cell
            DB      $19                 ; $2A43: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A45: inline base addition
            DW      VEC_SS              ; Inline cell
            DB      $02                 ; $2A48: !
            DB      $1B                 ; $2A49: literal16
            DW      RUNBPA               ; Inline cell
            DB      $19                 ; $2A4C: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A4E: inline base addition
            DW      VEC_R1              ; Inline cell
            DB      $02                 ; $2A51: !
            DB      $1B                 ; $2A52: literal16
            DW      RUNBPA               ; Inline cell
            DB      $19                 ; $2A55: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A57: inline base addition
            DW      VEC_R2              ; Inline cell
            DB      $02                 ; $2A5A: !
            DB      $1B                 ; $2A5B: literal16
            DW      RUNBPA               ; Inline cell
            DB      $19                 ; $2A5E: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A60: inline base addition
            DW      VEC_R3              ; Inline cell
            DB      $02                 ; $2A63: !
            DB      $1B                 ; $2A64: literal16
            DW      RUNBPA               ; Inline cell
            DB      $19                 ; $2A67: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A69: inline base addition
            DW      VEC_R4              ; Inline cell
            DB      $02                 ; $2A6C: !
            DB      $1B                 ; $2A6D: literal16
            DW      $7C7A               ; Inline cell
            DB      $19                 ; $2A70: literal8
            DB      $06                 ; Inline byte
            DB      $0E                 ; $2A72: inline base addition
            DW      VEC_BL              ; Inline cell
            DB      $02                 ; $2A75: !
            DB      $03                 ; $2A76: RETURN

;=========================================================================================
; ----> _STFLD  TERSE block 214; ROM $2A77-$2A7D
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $74                 ; $2A78: _RETPA
            DB      $1B                 ; $2A79: literal16
            DW      RAM_TAKEFIELD       ; Inline cell
            DB      $30                 ; $2A7C: _BONE
            DB      $03                 ; $2A7D: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $75                 ; $2A7F: _VM_2919
            DB      $76                 ; $2A80: _STFLD
            DB      $77                 ; $2A81: _SETTFPA
            DB      $03                 ; $2A82: RETURN
            nop
            nop
            ld      b,b
            nop
            ld      b,b
            nop
            ld      b,b
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            ret     nz
            rst     $38
            ret     nz
            rst     $38
            ret     nz
            rst     $38
            nop
            nop
            nop
            nop
            ld      a,($7CCD)
            and     a
            ret     z
            ld      a,($7CCE)
            inc     a
            cp      $0D
            jr      c,$2AAB
            xor     a
            ld      ($7CCE),a
            push    hl
            ld      hl,$2A83
            call    indexw
            ld      a,(ix+$0c)
            cp      $A0
            call    c,compde
            pop     hl
            add     hl,de
            ret
            ld      hl,$7CC1
            call    timedcr
            and     a
            jr      z,$2ACC
            ld      (RAM_THROWTIME),a
            ld      hl,$7CA0
            call    timedcr
            and     a
            jr      z,$2ADE
            ld      ($7C45),a
            ld      a,($7C40)
            ld      ($7C9F),a
            ld      hl,$7C8E
            call    timedcr
            and     a
            jr      z,$2AEA
            ld      ($7CA7),a
            ld      hl,$7C9E
            call    timedcr
            and     a
            jr      z,$2AF6
            ld      (RAM_THROWANM),a
            ld      hl,$7CBA
            call    timedcr
            and     a
            call    nz,$13C4
            ei
            ld      hl,$7CB2
            call    timedcr
            and     a
            call    nz,flshwup
            ld      hl,$7C52
            call    timedcr
            and     a
            call    nz,$1BE2
            ld      hl,$7C37
            call    timedcr
            and     a
            call    nz,walkover
            ld      hl,$7C53
            call    timedcr
            and     a
            call    nz,$1414
            ret
            ld      e,$00
            ld      h,(ix+$10)
            ld      a,$54
            cp      h
            jr      nc,$2B41
            ld      a,$84
            cp      h
            jr      nc,$2B3D
            ld      d,$00
            jr      $2B3F
            ld      d,$01
            jr      $2B55
            ld      a,$3A
            cp      h
            jr      nc,$2B4A
            ld      d,$02
            jr      $2B55
            ld      a,$1F
            cp      h
            jr      nc,$2B53
            ld      d,$03
            jr      $2B55
            ld      d,$04
            ld      a,(ix+$15)
            cp      d
            ld      (ix+$15),d
            jr      z,$2B62
            set     2,(ix+$11)
            ret
            ld      bc,$C001
            ld      de,$4E01
            ld      a,(RAM_TAKEFIELD)
            and     a
            jr      nz,$2B7B
            bit     5,(ix+$11)
            jr      z,$2B7B
            ld      bc,$4009
            ld      de,$4D02
            push    de
            ld      d,(ix+$0c)
            ld      e,(ix+$0b)
            ld      h,(ix+$0a)
            ld      l,(ix+$09)
            bit     7,h
            push    af
            call    nz,comphl
            srl     h
            rr      l
            srl     h
            rr      l
            pop     af
            call    nz,comphl
            add     hl,de
            bit     1,(ix+$11)
            call    nz,$2A9D
            pop     de
            ld      a,e
            cp      h
            jr      c,$2BAA
            ld      h,a
            jr      $2BAF
            ld      a,d
            cp      h
            jr      nc,$2BAF
            ld      h,a
            ld      (ix+$0c),h
            ld      (ix+$0b),l
            ld      h,(ix+$10)
            ld      l,(ix+$0f)
            ld      d,(ix+$0e)
            ld      e,(ix+$0d)
            add     hl,de
            ld      a,c
            cp      h
            jr      c,$2BC9
            ld      h,a
            jr      $2BCE
            ld      a,b
            cp      h
            jr      nc,$2BCE
            ld      h,a
            ld      (ix+$10),h
            ld      (ix+$0f),l
            ret
            and     d
            ld      c,$96
            ld      b,$A3
            dec     c
            sbc     a,b
            dec     c
            and     a
            add     hl,bc
            sbc     a,b
            rrca
            xor     h
            ex      af,af'
            sbc     a,b
            djnz    $2B95
            add     hl,bc
            sbc     a,b
            rrca
            xor     a
            dec     c
            sbc     a,b
            dec     c
            ld      a,(hl)
            sla     a
            ld      hl,$2BD5
            call    indexw
            ld      a,($7E5E)
            sub     e
            cp      d
            ret     nc
            inc     hl
            inc     hl
            push    hl
            ld      hl,($7E59)
            call    multhlby4
            ld      a,h
            pop     hl
            sub     (hl)
            inc     hl
            cp      (hl)
            ret     nc
            ld      a,($7CD3)
            and     a
            ret     nz
            inc     a
            ld      (RAM_HITTIME),a
            ld      ($7C3B),a
            call    blerase
            ret
            adc     a,c
            rlca
            ld      d,l
            rlca
            ld      (hl),e
            rlca
            ld      c,l
            rlca
            and     e
            rlca
            cp      c
            rlca
            rst     $10
            rlca
            push    hl
            ld      a,(hl)
            ld      hl,$2C1B
            call    indexw
            push    de
            pop     iy
            ld      de,$2600
            ld      hl,$AF00
            ld      bc,$0828
            call    reloff
            call    relabs
            call    writep
            pop     hl
            ret
            ld      hl,$7C15
            ld      a,($7CD5)
            and     a
            jr      z,$2C73
            ld      ($7CA1),a
            ld      a,(hl)
            and     a
            jr      z,$2C68
            call    $2C29
            dec     (hl)
            call    $2C29
            ld      a,($7C3B)
            and     a
            call    z,$2BED
            jr      $2C71
            xor     a
            ld      ($7CD5),a
            ld      a,$18
            ld      ($7CD6),a
            jr      $2C8F
            ld      a,(hl)
            and     a
            jr      nz,$2C8F
            xor     a
            ld      ($7C3B),a
            ld      a,($7CD6)
            and     a
            jr      nz,$2C8B
            call    $2C29
            ld      (hl),$06
            call    $2C29
            jr      $2C8F
            dec     a
            ld      ($7CD6),a
            ret
            ld      bc,$001F
            ld      hl,($7E59)
            ld      iy,VEC_LF
            ld      a,($7E5E)
            inc     a
            ld      e,a
            ld      a,$03
            push    hl
            ex      af,af'
            ld      a,(iy+$10)
            sub     e
            jr      nc,$2CAB
            neg
            cp      d
            jr      nc,$2CCC
            push    de
            ld      d,(iy+$0c)
            ld      e,(iy+$0b)
            and     a
            sbc     hl,de
            call    c,comphl
            pop     de
            ld      a,$10
            cp      h
            jr      c,$2CCC
            call    multhlby4
            ld      a,h
            cp      d
            jr      nc,$2CCC
            ld      a,$01
            pop     hl
            ret
            add     iy,bc
            ex      af,af'
            dec     a
            pop     hl
            jr      nz,$2CA1
            ret
            ld      a,($7CD3)
            and     a
            jr      nz,$2D4B
            ld      a,(ix+$10)
            cp      $BC
            jr      c,$2D37
            ld      a,(RAM_HITTIME)
            and     a
            ret     nz
            ld      a,($7CD3)
            and     a
            ret     nz
            ld      hl,($7D61)
            ld      ($7E67),hl
            ld      hl,($7D65)
            ld      ($7E69),hl
            ld      hl,THWBLPA
            ld      ($7E54),hl
            xor     a
            ld      ($7E56),a
            ld      a,$04
            ld      ($7E6B),a
            ld      a,$81
            ld      ($7E5F),a
            ld      hl,$0628
            ld      ($7C5A),hl
            ld      a,($7CA1)
            and     a
            jr      z,$2D1B
            ld      a,$03
            jr      $2D1D
            ld      a,$04
            ld      ($7C9F),a
            xor     a
            ld      (RAM_PITCHTIME),a
            ld      ($7CA1),a
            ld      ($7CB3),a
            ld      a,$01
            ld      ($7CD3),a
            ld      ($7C3E),a
            ld      ($7C3F),a
            jr      $2D49
            sbc     a,$A9
            cp      $05
            ret     nc
            ld      a,(ix+$0c)
            sbc     a,$26
            cp      $02
            ret     nc
            ld      a,$01
            ld      ($7CA1),a
            jr      $2D96
            ld      d,(ix+$10)
            ld      a,$3C
            cp      d
            ret     c
            ld      a,($7C9D)
            and     a
            ret     nz
            ld      d,$05
            call    $2C90
            and     a
            ret     z
            ld      a,($7CC5)
            and     a
            jr      z,$2D78
            ld      a,$02
            call    lvrstat
            ld      ($7CAD),a
            ld      (RAM_CAUGHT),a
            ld      hl,($7C4B)
            ld      ($7C43),hl
            xor     a
            jr      $2D7C
            inc     a
            ld      ($7C3A),a
            ld      (RAM_THROWANM),a
            inc     a
            ld      ($7C9D),a
            push    iy
            pop     hl
            ld      ($7C4F),hl
            call    blerase
            xor     a
            ld      ($7C53),a
            ld      ($7C47),a
            call    killof
            ret
            ld      (hl),l
            ld      a,l
            ld      sp,hl
            ld      a,h
            scf
            ld      a,l
            sub     h
            ld      a,l
            jr      $2E1E
            ld      d,(hl)
            ld      a,l
            jp      nc,$DA7D
            ld      a,h
            or      e
            ld      a,l
            djnz    $2E29
            cpl
            ld      a,(hl)
            pop     af
            ld      a,l
            jp      (iy)
            ex      (sp),hl
            push    de
            push    bc
            push    af
            ld      a,(hl)
            out     ($0F),a
            inc     hl
            ld      (RAM_IPNT),hl
            exx
            ex      af,af'
            push    hl
            push    de
            push    bc
            push    af
            ei
            ld      a,($7C1B)
            and     a
            jr      z,$2DD7
            ld      a,($7C8B)
            and     a
            jr      nz,$2DD7
            ld      a,$F0
            out     ($03),a
            ld      a,$52
            out     ($01),a
            ld      a,($7C1E)
            and     a
            jp      nz,$2E82
            ld      a,($7C48)
            inc     a
            ld      ($7C48),a
            cp      $02
            jp      nc,$2E82
            push    iy
            push    ix
            ld      a,($7CBD)
            add     a,$03
            cp      $0C
            jr      nz,$2DF8
            xor     a
            ld      ($7CBD),a
            ld      hl,$2D97
            call    indexw
            push    de
            pop     ix
            inc     hl
            ld      a,$03
            push    af
            push    hl
            bit     7,(ix+$11)
            jr      z,$2E26
            xor     a
            ld      ($7CBE),a
            call    verase
            ld      ($7C93),ix
            call    PLAYACT
            call    $2B63
            call    $2B2A
            call    vwrite
            pop     hl
            inc     hl
            ld      e,(hl)
            inc     hl
            ld      d,(hl)
            push    de
            pop     ix
            pop     af
            dec     a
            jr      nz,$2E07
            call    $2C48
            ld      ix,VEC_BL
            bit     7,(ix+$11)
            jr      z,$2E5F
            ld      a,($7CBE)
            and     a
            jr      z,$2E4A
            call    wait
            jr      $2E4F
            ld      a,$02
            ld      ($7CBE),a
            call    verase
            ld      ($7C93),ix
            call    PLAYACT
            call    $2B63
            call    vwrite
            call    $2CD4
            pop     ix
            pop     iy
            push    iy
            push    ix
            call    $2AC0
            ld      a,(RAM_TAKEFIELD)
            and     a
            call    z,$1FA5
            pop     ix
            pop     iy
            ld      a,($7C48)
            dec     a
            ld      ($7C48),a
            jp      nz,$2DEA
            di
            call    _AUD_TICK
            ei
            di
            call    $15A1
            ei
            ld      hl,$7C26
            call    timedcr
            and     a
            jr      z,$2EBB
            ld      a,($7C27)
            and     a
            jr      z,$2EAA
            ld      a,$01
            out     ($20),a
            ld      a,$07
            ld      ($7C26),a
            xor     a
            ld      ($7C27),a
            jr      $2EBB
            xor     a
            out     ($20),a
            ld      hl,$7C25
            dec     (hl)
            jr      z,$2EBB
            ld      a,$07
            ld      ($7C26),a
            ld      ($7C27),a
            jp      _ENDINT
            jp      (iy)
            ex      (sp),hl
            push    de
            push    bc
            push    af
            ld      a,(hl)
            out     ($0F),a
            inc     hl
            ld      (RAM_IPNT),hl
            exx
            ex      af,af'
            push    hl
            push    de
            push    bc
            push    af
            ld      a,($7C8B)
            and     a
            jr      nz,$2EDF
            ld      a,$6C
            out     ($03),a
            ld      a,$07
            out     ($01),a
            jp      _ENDINT
            jp      (iy)
            ex      (sp),hl
            push    de
            push    bc
            push    af
            ld      a,(hl)
            out     ($0F),a
            inc     hl
            ld      (RAM_IPNT),hl
            exx
            ex      af,af'
            push    hl
            push    de
            push    bc
            push    af
            ld      hl,$7CB9
            ld      a,(hl)
            and     a
            jr      nz,$2F2E
            ld      a,($7CB6)
            xor     $01
            ld      ($7CB6),a
            ld      (hl),$20
            push    af
            ld      a,($7C1B)
            and     a
            jr      nz,$2F21
            pop     af
            jr      z,$2F16
            ld      a,$07
            ld      d,$00
            jr      $2F18
            ld      d,$07
            out     ($00),a
            out     ($02),a
            ld      a,d
            out     ($03),a
            jr      $2F2E
            pop     af
            jr      z,$2F28
            ld      a,$F5
            jr      $2F2A
            ld      a,$B2
            out     ($00),a
            out     ($04),a
            dec     (hl)
            jp      _ENDINT
            call    $2DB1
            ld      (hl),e
            jp      $2F32
            call    $2EE4
            ld      (hl),e
            call    $2DB1
            ret     nz
            jp      $2F39
            call    $2EC0
            ld      (hl),e
            call    $2DB1
            nop
            jp      $2F44
            call    $2EC0
            ld      (hl),e
            call    $2DB1
            ret     nz
            call    $2EE4
            nop
            jp      $2F4F
            call    $2DB1
            inc     (hl)
            call    $2EC0
            ld      a,a
            jp      $2F5E
            call    $2EC0
            ld      a,a
            call    $2DB1
            ret     nz
            call    $2EE4
            inc     (hl)
            jp      $2F69
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $2F79: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $2F7C: B@
            DB      $1E                 ; $2F7D: 0BRANCH
            DW      $2FA0               ; Branch destination
            DB      $19                 ; $2F80: literal8
            DB      $B1                 ; Inline byte
            DB      $08                 ; $2F82: DUP
            DB      $0D                 ; $2F83: 0
            DB      $4B                 ; $2F84: OUTP
            DB      $19                 ; $2F85: literal8
            DB      $04                 ; Inline byte
            DB      $4B                 ; $2F87: OUTP
            DB      $19                 ; $2F88: literal8
            DB      $07                 ; Inline byte
            DB      $19                 ; $2F8A: literal8
            DB      $02                 ; Inline byte
            DB      $4B                 ; $2F8C: OUTP
            DB      $1B                 ; $2F8D: literal16
            DW      $7C0A               ; Inline cell
            DB      $17                 ; $2F90: B@
            DB      $1E                 ; $2F91: 0BRANCH
            DW      $2F9A               ; Branch destination
            DB      $1B                 ; $2F94: literal16
            DW      $2F5E               ; Inline cell
            DB      $1F                 ; $2F97: BRANCH
            DW      $2F9D               ; Branch destination
            DB      $1B                 ; $2F9A: literal16
            DW      $2F44               ; Inline cell
            DB      $1F                 ; $2F9D: BRANCH
            DW      $2FB6               ; Branch destination
            DB      $19                 ; $2FA0: literal8
            DB      $07                 ; Inline byte
            DB      $08                 ; $2FA2: DUP
            DB      $22                 ; $2FA3: 1
            DB      $4B                 ; $2FA4: OUTP
            DB      $19                 ; $2FA5: literal8
            DB      $03                 ; Inline byte
            DB      $4B                 ; $2FA7: OUTP
            DB      $0D                 ; $2FA8: 0
            DB      $08                 ; $2FA9: DUP
            DB      $08                 ; $2FAA: DUP
            DB      $08                 ; $2FAB: DUP
            DB      $4B                 ; $2FAC: OUTP
            DB      $19                 ; $2FAD: literal8
            DB      $02                 ; Inline byte
            DB      $4B                 ; $2FAF: OUTP
            DB      $19                 ; $2FB0: literal8
            DB      $04                 ; Inline byte
            DB      $4B                 ; $2FB2: OUTP
            DB      $1B                 ; $2FB3: literal16
            DW      $2F32               ; Inline cell
            DB      $78                 ; $2FB6: _INTSTART
            DB      $03                 ; $2FB7: RETURN

;=========================================================================================
; ----> _DP1CN  TERSE block 305; ROM $2FB8-$2FE9
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $2FB9: literal16
            DW      $0400               ; Inline cell
            DB      $1B                 ; $2FBC: literal16
            DW      $2800               ; Inline cell
            DB      $1B                 ; $2FBF: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $2FC2: counted string
            DB      36                  ; Counted-string length
            DB      $44, $45, $50, $4F, $53, $49, $54, $20, $31, $20, $43, $4F, $49, $4E, $20, $54; DEPOSIT 1 COIN T
            DB      $4F, $20, $43, $4F, $4E, $54, $49, $4E, $55, $45, $20, $54, $48, $49, $53, $20; O CONTINUE THIS
            DB      $47, $41, $4D, $45  ; GAME
            DB      $2F                 ; $2FE8: _SPOST
            DB      $03                 ; $2FE9: RETURN

;=========================================================================================
; ----> _DP12CN  TERSE block 305; ROM $2FEA-$3027
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $2FEB: literal16
            DW      $7C09               ; Inline cell
            DB      $17                 ; $2FEE: B@
            DB      $1E                 ; $2FEF: 0BRANCH
            DW      $3026               ; Branch destination
            DB      $1B                 ; $2FF2: literal16
            DW      $0300               ; Inline cell
            DB      $1B                 ; $2FF5: literal16
            DW      $2800               ; Inline cell
            DB      $1B                 ; $2FF8: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $2FFB: counted string
            DB      37                  ; Counted-string length
            DB      $44, $45, $50, $4F, $53, $49, $54, $20, $32, $20, $43, $4F, $49, $4E, $53, $20; DEPOSIT 2 COINS
            DB      $54, $4F, $20, $43, $4F, $4E, $54, $49, $4E, $55, $45, $20, $54, $48, $49, $53; TO CONTINUE THIS
            DB      $20, $47, $41, $4D, $45; GAME
            DB      $2F                 ; $3022: _SPOST
            DB      $1F                 ; $3023: BRANCH
            DW      $3027               ; Branch destination
            DB      $79                 ; $3026: _DP1CN
            DB      $03                 ; $3027: RETURN

;=========================================================================================
; ----> _DPCN  TERSE block 305; ROM $3028-$304F
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $79                 ; $3029: _DP1CN
            DB      $1B                 ; $302A: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $34                 ; $302D: _BZERO
            DB      $19                 ; $302E: literal8
            DB      $FF                 ; Inline byte
            DB      $7A                 ; $3030: _VM_11C4
            DB      $19                 ; $3031: literal8
            DB      $FF                 ; Inline byte
            DB      $7A                 ; $3033: _VM_11C4
            DB      $79                 ; $3034: _DP1CN
            DB      $1B                 ; $3035: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $3038: B@
            DB      $1E                 ; $3039: 0BRANCH
            DW      $3043               ; Branch destination
            DB      $1B                 ; $303C: literal16
            DW      $7C10               ; Inline cell
            DB      $34                 ; $303F: _BZERO
            DB      $1F                 ; $3040: BRANCH
            DW      $304B               ; Branch destination
            DB      $1B                 ; $3043: literal16
            DW      $7C08               ; Inline cell
            DB      $34                 ; $3046: _BZERO
            DB      $1B                 ; $3047: literal16
            DW      $7C14               ; Inline cell
            DB      $30                 ; $304A: _BONE
            DB      $1B                 ; $304B: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $63                 ; $304E: 1+B!
            DB      $03                 ; $304F: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $7B                 ; $3051: _DP12CN
            DB      $19                 ; $3052: literal8
            DB      $A0                 ; Inline byte
            DB      $7A                 ; $3054: _VM_11C4
            DB      $7B                 ; $3055: _DP12CN
            DB      $1B                 ; $3056: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $3059: B@
            DB      $08                 ; $305A: DUP
            DB      $1E                 ; $305B: 0BRANCH
            DW      $3065               ; Branch destination
            DB      $1B                 ; $305E: literal16
            DW      $7C10               ; Inline cell
            DB      $34                 ; $3061: _BZERO
            DB      $1F                 ; $3062: BRANCH
            DW      $3072               ; Branch destination
            DB      $1B                 ; $3065: literal16
            DW      $7C0A               ; Inline cell
            DB      $17                 ; $3068: B@
            DB      $1E                 ; $3069: 0BRANCH
            DW      $3072               ; Branch destination
            DB      $1B                 ; $306C: literal16
            DW      $7C0A               ; Inline cell
            DB      $34                 ; $306F: _BZERO
            DB      $7C                 ; $3070: _FL
            DB      $7D                 ; $3071: _VM_2F78
            DB      $03                 ; $3072: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $3074: literal8
            DB      $FF                 ; Inline byte
            DB      $0D                 ; $3076: 0
            DB      $15                 ; $3077: DO
            DB      $18                 ; $3078: LOOP
            DB      $19                 ; $3079: literal8
            DB      $10                 ; Inline byte
            DB      $7E                 ; $307B: INP
            DB      $19                 ; $307C: literal8
            DB      $03                 ; Inline byte
            DB      $1A                 ; $307E: AND
            DB      $19                 ; $307F: literal8
            DB      $03                 ; Inline byte
            DB      $7F                 ; $3081: <>
            DB      $1E                 ; $3082: 0BRANCH
            DW      $308B               ; Branch destination
            DB      $07                 ; $3085: DROP
            DB      $22                 ; $3086: 1
            DB      $1B                 ; $3087: literal16
            DW      $7CAC               ; Inline cell
            DB      $30                 ; $308A: _BONE
            DB      $1B                 ; $308B: literal16
            DW      $7C1F               ; Inline cell
            DB      $17                 ; $308E: B@
            DB      $1E                 ; $308F: 0BRANCH
            DW      $3098               ; Branch destination
            DB      $07                 ; $3092: DROP
            DB      $22                 ; $3093: 1
            DB      $1B                 ; $3094: literal16
            DW      $7CAC               ; Inline cell
            DB      $30                 ; $3097: _BONE
            DB      $0A                 ; $3098: 1-
            DB      $08                 ; $3099: DUP
            DB      $28                 ; $309A: 0=
            DB      $1E                 ; $309B: 0BRANCH
            DW      $3074               ; Branch destination
            DB      $07                 ; $309E: DROP
            DB      $03                 ; $309F: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $30A1: literal16
            DW      $1A00               ; Inline cell
            DB      $1B                 ; $30A4: literal16
            DW      $1000               ; Inline cell
            DB      $1B                 ; $30A7: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $30AA: counted string
            DB      14                  ; Counted-string length
            DB      $59, $4F, $55, $20, $41, $52, $45, $20, $55, $50, $20, $31, $53, $54; YOU ARE UP 1ST
            DB      $2F                 ; $30BA: _SPOST
            DB      $1B                 ; $30BB: literal16
            DW      $0F00               ; Inline cell
            DB      $1B                 ; $30BE: literal16
            DW      $2400               ; Inline cell
            DB      $1B                 ; $30C1: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $30C4: counted string
            DB      24                  ; Counted-string length
            DB      $42, $45, $41, $54, $20, $4D, $45, $20, $46, $4F, $52, $20, $45, $58, $54, $52; BEAT ME FOR EXTR
            DB      $41, $20, $49, $4E, $4E, $49, $4E, $47; A INNING
            DB      $2F                 ; $30DE: _SPOST
            DB      $1B                 ; $30DF: literal16
            DW      $1F00               ; Inline cell
            DB      $1B                 ; $30E2: literal16
            DW      $3800               ; Inline cell
            DB      $1B                 ; $30E5: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $30E8: counted string
            DB      9                   ; Counted-string length
            DB      $47, $4F, $4F, $44, $20, $4C, $55, $43, $4B; GOOD LUCK
            DB      $2F                 ; $30F3: _SPOST
            DB      $03                 ; $30F4: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $30F6: literal16
            DW      $7CAC               ; Inline cell
            DB      $34                 ; $30F9: _BZERO
            DB      $49                 ; $30FA: _VM_1844
            DB      $1B                 ; $30FB: literal16
            DW      $2300               ; Inline cell
            DB      $1B                 ; $30FE: literal16
            DW      $1000               ; Inline cell
            DB      $1B                 ; $3101: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3104: counted string
            DB      5                   ; Counted-string length
            DB      $50, $49, $54, $43, $48; PITCH
            DB      $2F                 ; $310B: _SPOST
            DB      $1B                 ; $310C: literal16
            DW      $0700               ; Inline cell
            DB      $1B                 ; $310F: literal16
            DW      $4000               ; Inline cell
            DB      $1B                 ; $3112: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3115: counted string
            DB      33                  ; Counted-string length
            DB      $50, $52, $45, $53, $53, $20, $50, $49, $54, $43, $48, $20, $42, $55, $54, $54; PRESS PITCH BUTT
            DB      $4F, $4E, $20, $54, $4F, $20, $53, $54, $41, $52, $54, $20, $50, $49, $54, $43; ON TO START PITC
            DB      $48                 ; H
            DB      $2F                 ; $3138: _SPOST
            DB      $1B                 ; $3139: literal16
            DW      $0F00               ; Inline cell
            DB      $1B                 ; $313C: literal16
            DW      $6000               ; Inline cell
            DB      $1B                 ; $313F: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3142: counted string
            DB      25                  ; Counted-string length
            DB      $52, $4F, $4C, $4C, $45, $52, $42, $41, $4C, $4C, $20, $43, $4F, $4E, $54, $52; ROLLERBALL CONTR
            DB      $4F, $4C, $53, $20, $50, $49, $54, $43, $48; OLS PITCH
            DB      $2F                 ; $315D: _SPOST
            DB      $1B                 ; $315E: literal16
            DW      $0C00               ; Inline cell
            DB      $1B                 ; $3161: literal16
            DW      $8000               ; Inline cell
            DB      $1B                 ; $3164: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3167: counted string
            DB      28                  ; Counted-string length
            DB      $52, $4F, $4C, $4C, $45, $52, $42, $41, $4C, $4C, $20, $4D, $4F, $56, $45, $53; ROLLERBALL MOVES
            DB      $20, $4F, $55, $54, $46, $49, $45, $4C, $44, $45, $52, $53; OUTFIELDERS
            DB      $2F                 ; $3185: _SPOST
            DB      $19                 ; $3186: literal8
            DB      $80                 ; Inline byte
            DB      $80                 ; $3188: _VM_3073
            DB      $1B                 ; $3189: literal16
            DW      $7CAC               ; Inline cell
            DB      $17                 ; $318C: B@
            DB      $1E                 ; $318D: 0BRANCH
            DW      $3193               ; Branch destination
            DB      $1F                 ; $3190: BRANCH
            DW      $3236               ; Branch destination
            DB      $49                 ; $3193: _VM_1844
            DB      $1B                 ; $3194: literal16
            DW      $2500               ; Inline cell
            DB      $1B                 ; $3197: literal16
            DW      $1000               ; Inline cell
            DB      $1B                 ; $319A: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $319D: counted string
            DB      3                   ; Counted-string length
            DB      $42, $41, $54       ; BAT
            DB      $2F                 ; $31A2: _SPOST
            DB      $1B                 ; $31A3: literal16
            DW      $0B00               ; Inline cell
            DB      $1B                 ; $31A6: literal16
            DW      $4000               ; Inline cell
            DB      $1B                 ; $31A9: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $31AC: counted string
            DB      29                  ; Counted-string length
            DB      $50, $52, $45, $53, $53, $20, $42, $41, $54, $20, $42, $55, $54, $54, $4F, $4E; PRESS BAT BUTTON
            DB      $20, $54, $4F, $20, $53, $57, $49, $4E, $47, $20, $42, $41, $54; TO SWING BAT
            DB      $2F                 ; $31CB: _SPOST
            DB      $1B                 ; $31CC: literal16
            DW      $0500               ; Inline cell
            DB      $1B                 ; $31CF: literal16
            DW      $6000               ; Inline cell
            DB      $1B                 ; $31D2: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $31D5: counted string
            DB      35                  ; Counted-string length
            DB      $48, $4F, $4C, $44, $20, $42, $55, $54, $54, $4F, $4E, $20, $44, $4F, $57, $4E; HOLD BUTTON DOWN
            DB      $20, $54, $4F, $20, $41, $44, $56, $41, $4E, $43, $45, $20, $52, $55, $4E, $4E; TO ADVANCE RUNN
            DB      $45, $52, $53       ; ERS
            DB      $2F                 ; $31FA: _SPOST
            DB      $19                 ; $31FB: literal8
            DB      $60                 ; Inline byte
            DB      $80                 ; $31FD: _VM_3073
            DB      $1B                 ; $31FE: literal16
            DW      $7CAC               ; Inline cell
            DB      $17                 ; $3201: B@
            DB      $1E                 ; $3202: 0BRANCH
            DW      $3208               ; Branch destination
            DB      $1F                 ; $3205: BRANCH
            DW      $3236               ; Branch destination
            DB      $49                 ; $3208: _VM_1844
            DB      $1B                 ; $3209: literal16
            DW      _AUD_STOP_STREAM    ; Inline cell
            DB      $1B                 ; $320C: literal16
            DW      $2800               ; Inline cell
            DB      $1B                 ; $320F: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3212: counted string
            DB      30                  ; Counted-string length
            DB      $50, $52, $45, $53, $53, $20, $41, $4E, $59, $20, $42, $55, $54, $54, $4F, $4E; PRESS ANY BUTTON
            DB      $20, $54, $4F, $20, $53, $54, $41, $52, $54, $20, $47, $41, $4D, $45; TO START GAME
            DB      $2F                 ; $3232: _SPOST
            DB      $19                 ; $3233: literal8
            DB      $30                 ; Inline byte
            DB      $80                 ; $3235: _VM_3073
            DB      $1B                 ; $3236: literal16
            DW      $7CAC               ; Inline cell
            DB      $17                 ; $3239: B@
            DB      $1E                 ; $323A: 0BRANCH
            DW      $30FA               ; Branch destination
            DB      $03                 ; $323D: RETURN
            nop
            ld      h,b
            nop
            ld      b,b
            nop
            ld      b,h
            nop
            jr      z,$3247
            ld      h,b
            nop
            djnz    $324B
            xor     d
            nop
            DB      $28                 ; $324D: preserved data boundary
            di                          ; Protect the scoring-runner update
            push    ix
            ld      a,($7C42)
            and     a
            jr      z,$3273
            ld      hl,($7C43)
            push    hl
            pop     ix
            ld      de,VEC_R4
            ld      a,e
            cp      l
            jr      z,$3271
            ld      a,($7CAF)
            and     a
            jr      nz,$3271
            ld      de,$001F
            add     hl,de
            ld      ($7C43),hl
            jr      $3277
            ld      ix,VEC_R1
            xor     a
            ld      (ix+$12),a
            ld      (RAM_SCRTIME),a
            pop     ix
            ei
            ld      a,(RAM_PLYR1UP)
            and     a
            jr      z,$328C
            ld      hl,RAM_SCORE1
            jr      $328F
            ld      hl,RAM_SCORE2
            ld      a,(hl)
            add     a,$01
            daa
            ld      (hl),a
            push    bc
            ld      bc,$329B
            jp      $1F1B
            DB      $81, $00            ; Native return token $81 and padding byte
            pop     bc
            ret

;=========================================================================================
; ----> resetrunners  Native entry $329F
;=========================================================================================
            ld      a,$04
            push    af
            ld      a,($7CEC)
            and     a
            jr      z,$32B9
            ld      a,($7D0B)
            and     a
            jp      z,$32C4
            ld      a,($7D2A)
            and     a
            jp      z,$32CF
            jp      $32DA
            ld      de,VEC_R1
            ld      hl,VEC_R2
            ld      bc,$001F
            ldir
            ld      de,VEC_R2
            ld      hl,VEC_R3
            ld      bc,$001F
            ldir
            ld      de,VEC_R3
            ld      hl,VEC_R4
            ld      bc,$001F
            ldir
            xor     a
            ld      ($7D49),a
            ld      ($7D54),a
            ld      hl,$2800
            ld      ($7D42),hl
            ld      h,a
            ld      l,a
            ld      ($7D40),hl
            ld      ($7D44),hl
            ld      hl,$AC00
            ld      ($7D46),hl
            ld      hl,NOBOD
            ld      ($7D4A),hl
            ld      a,$01
            ld      ($7CEB),a
            ld      ($7D29),a
            ld      ($7D29),a
            ld      ($7D48),a
            ld      hl,RUNBPA
            ld      ($7D3D),hl
            pop     af
            dec     a
            jr      nz,$32A1
            ret

;=========================================================================================
; ----> chkcaught  Native entry $3314
;=========================================================================================
            ld      a,($7C37)
            and     a
            ret     nz
            push    iy
            push    ix
            di
            ld      ($7C3E),a
            ld      (RAM_CAUGHT),a
            ld      ($7C54),a
            ld      ($7C53),a
            ld      a,$01
            ld      ($7CAB),a
            ld      a,($7C3F)
            and     a
            jp      nz,$3408
            ld      a,$30
            ld      ($7C95),a
            ld      ($7C96),a
            ld      a,($7CAD)
            and     a
            di
            jr      z,$334E
            ld      (RAM_THROWANM),a
            ld      iy,($7C4B)
            jr      $3386
            ld      iy,($7C43)
            ld      a,($7CAE)
            and     a
            jr      z,$335E
            xor     a
            ld      ($7CAE),a
            jr      $3363
            ld      a,$06
            ld      ($7C9F),a
            ld      a,($7C41)
            ld      c,a
            bit     6,(iy+$11)
            jr      nz,$33B1
            ld      a,(iy+$1d)
            and     a
            jr      z,$33B1
            bit     2,(iy+$1e)
            jr      z,$3380
            ld      a,$02
            call    lvrstat
            jr      $33B1
            ld      a,(iy+$12)
            cp      c
            jr      nz,$33B1
            ld      hl,OFFFPA
            xor     a
            ld      (iy+$12),a
            ld      (iy+$07),h
            ld      (iy+$06),l
            ld      hl,$7CA6
            inc     (hl)
            ld      a,$02
            ld      ($7C9F),a
            res     3,(iy+$11)
            ld      a,($7C49)
            cp      $32
            jr      nz,$33B1
            xor     a
            ld      (RAM_THROWANM),a
            pop     ix
            pop     iy
            ei
            ret
            ld      a,($7CAD)
            and     a
            jr      z,$33BC
            ld      ($7CAE),a
            jr      $33FE
            ld      a,c
            cp      $03
            jr      z,$3408
            ld      hl,$7CC6
            call    indexw
            push    de
            pop     ix
            bit     4,(ix+$11)
            jr      nz,$3408
            push    ix
            pop     hl
            ld      ($7C4F),hl
            ld      a,$01
            ld      (RAM_THROWANM),a
            ld      ($7CC5),a
            ld      a,($7C46)
            and     a
            jr      z,$33F9
            xor     a
            ld      ($7C46),a
            ld      de,$001F
            push    iy
            pop     hl
            add     hl,de
            ld      ($7C43),hl
            ld      a,$01
            ld      ($7CAF),a
            jr      $33FE
            ld      a,$01
            ld      ($7C3F),a
            xor     a
            ld      ($7CAD),a
            pop     ix
            pop     iy
            ei
            ret
            ei
            xor     a
            ld      ($7C3F),a
            pop     ix
            pop     iy
            ld      a,$01
            ld      ($7C1E),a
            ld      bc,$341C
            jp      _STFLD
            add     a,d
            nop
            ld      bc,$3424
            jp      _WUPWRT
            add     a,e
            nop
            ld      hl,_WUPWRT
            ld      ($7CA8),hl
            ld      a,$01
            ld      ($7CB1),a
            ld      ($7CB2),a
            xor     a
            ld      ($7C1E),a
            ret
            bit     7,a
            ret     z
            bit     6,a
            ret     nz
            inc     e
            ret

;=========================================================================================
; ----> throwanim  Native entry $3441
;=========================================================================================
            push    ix
            push    iy
            di
            xor     a
            ld      ix,($7C4F)
            ld      ($7CCD),a
            ld      (RAM_THROWANM),a
            ld      (ix+$01),a
            ld      (ix+$09),a
            ld      (ix+$0a),a
            ld      (ix+$0d),a
            ld      (ix+$0e),a
            ld      h,(ix+$0c)
            inc     hl
            inc     hl
            ld      ($7E59),hl
            ld      h,(ix+$10)
            ld      ($7E5D),hl
            ld      a,($7C3F)
            and     a
            jr      z,$3482
            ld      hl,($7D65)
            ld      ($7E69),hl
            ld      de,($7D61)
            ld      b,$04
            jr      $34CF
            ld      iy,($7C43)
            ld      a,($7C42)
            and     a
            ld      a,(iy+$12)
            jr      z,$34B9
            and     a
            jr      nz,$3493
            inc     a
            ld      d,a
            ld      e,$00
            ld      a,($7CEB)
            call    $3439
            ld      a,($7D0A)
            call    $3439
            ld      a,($7D29)
            call    $3439
            ld      a,($7D48)
            call    $3439
            xor     a
            or      e
            jr      nz,$34B4
            ld      d,$01
            ld      a,d
            ld      b,$02
            jr      $34BB
            ld      b,$05
            ld      ($7C41),a
            sla     a
            ld      hl,$323E
            call    indexw
            ld      ($7E69),de
            inc     hl
            inc     hl
            ld      e,(hl)
            inc     hl
            ld      d,(hl)
            ld      a,b
            ld      ($7E6B),a
            ld      ($7E67),de
            ld      a,(ix+$0c)
            cp      d
            jr      nc,$34E2
            ld      hl,RTHWPA
            jr      $34E5
            ld      hl,LTHWPA
            ld      (ix+$07),h
            ld      (ix+$06),l
            set     7,(ix+$11)
            res     3,(ix+$11)
            ld      a,$10
            ld      ($7CC1),a
            ld      ($7C3E),a
            pop     iy
            pop     ix
            ei
            ret
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3502: literal16
            DW      $7C0C               ; Inline cell
            DB      $17                 ; $3505: B@
            DB      $19                 ; $3506: literal8
            DB      $0A                 ; Inline byte
            DB      $26                 ; $3508: =
            DB      $1E                 ; $3509: 0BRANCH
            DW      $3519               ; Branch destination
            DB      $1B                 ; $350C: literal16
            DW      $7C0C               ; Inline cell
            DB      $30                 ; $350F: _BONE
            DB      $1B                 ; $3510: literal16
            DW      $7C08               ; Inline cell
            DB      $08                 ; $3513: DUP
            DB      $17                 ; $3514: B@
            DB      $19                 ; $3515: literal8
            DB      $09                 ; Inline byte
            DB      $27                 ; $3517: -
            DB      $23                 ; $3518: _SBSTORE
            DB      $03                 ; $3519: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $84                 ; $351B: _VM_1441
            DB      $19                 ; $351C: literal8
            DB      $2A                 ; Inline byte
            DB      $19                 ; $351E: literal8
            DB      $A5                 ; Inline byte
            DB      $19                 ; $3520: literal8
            DB      $4D                 ; Inline byte
            DB      $19                 ; $3522: literal8
            DB      $03                 ; Inline byte
            DB      $4D                 ; $3524: _VM_17B9
            DB      $1B                 ; $3525: literal16
            DW      $7C08               ; Inline cell
            DB      $17                 ; $3528: B@
            DB      $08                 ; $3529: DUP
            DB      $08                 ; $352A: DUP
            DB      $1E                 ; $352B: 0BRANCH
            DW      $3556               ; Branch destination
            DB      $19                 ; $352E: literal8
            DB      $0A                 ; Inline byte
            DB      $5C                 ; $3530: <
            DB      $1E                 ; $3531: 0BRANCH
            DW      $3542               ; Branch destination
            DB      $1B                 ; $3534: literal16
            DW      $08F0               ; Inline cell
            DB      $01                 ; $3537: SWAP
            DB      $0D                 ; $3538: 0
            DB      $15                 ; $3539: DO
            DB      $1B                 ; $353A: literal16
            DW      $0200               ; Inline cell
            DB      $14                 ; $353D: +
            DB      $18                 ; $353E: LOOP
            DB      $1F                 ; $353F: BRANCH
            DW      $3546               ; Branch destination
            DB      $07                 ; $3542: DROP
            DB      $1B                 ; $3543: literal16
            DW      $1CF0               ; Inline cell
            DB      $1B                 ; $3546: literal16
            DW      $A500               ; Inline cell
            DB      $1B                 ; $3549: literal16
            DW      IMRK                ; Inline cell
            DB      $1B                 ; $354C: literal16
            DW      $0301               ; Inline cell
            DB      $1B                 ; $354F: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $3552: _WRITE
            DB      $1F                 ; $3553: BRANCH
            DW      $3558               ; Branch destination
            DB      $07                 ; $3556: DROP
            DB      $07                 ; $3557: DROP
            DB      $03                 ; $3558: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $355A: literal16
            DW      $7C14               ; Inline cell
            DB      $34                 ; $355D: _BZERO
            DB      $1B                 ; $355E: literal16
            DW      $7C8A               ; Inline cell
            DB      $17                 ; $3561: B@
            DB      $1E                 ; $3562: 0BRANCH
            DW      $356C               ; Branch destination
            DB      $1B                 ; $3565: literal16
            DW      $7CBC               ; Inline cell
            DB      $30                 ; $3568: _BONE
            DB      $1F                 ; $3569: BRANCH
            DW      $3627               ; Branch destination
            DB      $1B                 ; $356C: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $356F: B@
            DB      $1B                 ; $3570: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $34                 ; $3573: _BZERO
            DB      $08                 ; $3574: DUP
            DB      $1E                 ; $3575: 0BRANCH
            DW      $3626               ; Branch destination
            DB      $1B                 ; $3578: literal16
            DW      $7C09               ; Inline cell
            DB      $17                 ; $357B: B@
            DB      $1E                 ; $357C: 0BRANCH
            DW      $35FE               ; Branch destination
            DB      $1B                 ; $357F: literal16
            DW      $7C10               ; Inline cell
            DB      $17                 ; $3582: B@
            DB      $1E                 ; $3583: 0BRANCH
            DW      $35C6               ; Branch destination
            DB      $1B                 ; $3586: literal16
            DW      $7E7D               ; Inline cell
            DB      $17                 ; $3589: B@
            DB      $1E                 ; $358A: 0BRANCH
            DW      $35B0               ; Branch destination
            DB      $08                 ; $358D: DUP
            DB      $22                 ; $358E: 1
            DB      $26                 ; $358F: =
            DB      $1E                 ; $3590: 0BRANCH
            DW      $35A9               ; Branch destination
            DB      $1B                 ; $3593: literal16
            DW      $7C06               ; Inline cell
            DB      $17                 ; $3596: B@
            DB      $1E                 ; $3597: 0BRANCH
            DW      $359D               ; Branch destination
            DB      $1F                 ; $359A: BRANCH
            DW      $35A6               ; Branch destination
            DB      $1B                 ; $359D: literal16
            DW      $7E7F               ; Inline cell
            DB      $30                 ; $35A0: _BONE
            DB      $1B                 ; $35A1: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $04                 ; $35A4: B!
            DB      $0D                 ; $35A5: 0
            DB      $1F                 ; $35A6: BRANCH
            DW      $35AD               ; Branch destination
            DB      $1B                 ; $35A9: literal16
            DW      $7E7F               ; Inline cell
            DB      $34                 ; $35AC: _BZERO
            DB      $1F                 ; $35AD: BRANCH
            DW      $35C3               ; Branch destination
            DB      $1B                 ; $35B0: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $04                 ; $35B3: B!
            DB      $1B                 ; $35B4: literal16
            DW      $7CBB               ; Inline cell
            DB      $17                 ; $35B7: B@
            DB      $1E                 ; $35B8: 0BRANCH
            DW      $35BE               ; Branch destination
            DB      $1F                 ; $35BB: BRANCH
            DW      $35C2               ; Branch destination
            DB      $1B                 ; $35BE: literal16
            DW      $7CBC               ; Inline cell
            DB      $30                 ; $35C1: _BONE
            DB      $0D                 ; $35C2: 0
            DB      $1F                 ; $35C3: BRANCH
            DW      $35FB               ; Branch destination
            DB      $1B                 ; $35C6: literal16
            DW      $7C06               ; Inline cell
            DB      $17                 ; $35C9: B@
            DB      $1E                 ; $35CA: 0BRANCH
            DW      $35E2               ; Branch destination
            DB      $1B                 ; $35CD: literal16
            DW      $7C08               ; Inline cell
            DB      $17                 ; $35D0: B@
            DB      $1E                 ; $35D1: 0BRANCH
            DW      $35D8               ; Branch destination
            DB      $73                 ; $35D4: 2*
            DB      $1F                 ; $35D5: BRANCH
            DW      $35DF               ; Branch destination
            DB      $1B                 ; $35D8: literal16
            DW      $7CBC               ; Inline cell
            DB      $30                 ; $35DB: _BONE
            DB      $0A                 ; $35DC: 1-
            DB      $73                 ; $35DD: 2*
            DB      $09                 ; $35DE: 1+
            DB      $1F                 ; $35DF: BRANCH
            DW      $35FB               ; Branch destination
            DB      $08                 ; $35E2: DUP
            DB      $22                 ; $35E3: 1
            DB      $1A                 ; $35E4: AND
            DB      $1B                 ; $35E5: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $04                 ; $35E8: B!
            DB      $19                 ; $35E9: literal8
            DB      $FE                 ; Inline byte
            DB      $1A                 ; $35EB: AND
            DB      $1B                 ; $35EC: literal16
            DW      $7C08               ; Inline cell
            DB      $17                 ; $35EF: B@
            DB      $1E                 ; $35F0: 0BRANCH
            DW      $35F6               ; Branch destination
            DB      $1F                 ; $35F3: BRANCH
            DW      $35FB               ; Branch destination
            DB      $1B                 ; $35F6: literal16
            DW      $7CBC               ; Inline cell
            DB      $30                 ; $35F9: _BONE
            DB      $0A                 ; $35FA: 1-
            DB      $1F                 ; $35FB: BRANCH
            DW      $3610               ; Branch destination
            DB      $1B                 ; $35FE: literal16
            DW      $7C08               ; Inline cell
            DB      $17                 ; $3601: B@
            DB      $1E                 ; $3602: 0BRANCH
            DW      $3609               ; Branch destination
            DB      $73                 ; $3605: 2*
            DB      $1F                 ; $3606: BRANCH
            DW      $3610               ; Branch destination
            DB      $1B                 ; $3609: literal16
            DW      $7CBC               ; Inline cell
            DB      $30                 ; $360C: _BONE
            DB      $0A                 ; $360D: 1-
            DB      $73                 ; $360E: 2*
            DB      $09                 ; $360F: 1+
            DB      $1B                 ; $3610: literal16
            DW      $7C08               ; Inline cell
            DB      $17                 ; $3613: B@
            DB      $14                 ; $3614: +
            DB      $1B                 ; $3615: literal16
            DW      $7C08               ; Inline cell
            DB      $04                 ; $3618: B!
            DB      $85                 ; $3619: _VM_3501
            DB      $1B                 ; $361A: literal16
            DW      $7C1E               ; Inline cell
            DB      $30                 ; $361D: _BONE
            DB      $86                 ; $361E: _VM_351A
            DB      $1B                 ; $361F: literal16
            DW      $7C1E               ; Inline cell
            DB      $34                 ; $3622: _BZERO
            DB      $1F                 ; $3623: BRANCH
            DW      $3627               ; Branch destination
            DB      $07                 ; $3626: DROP
            DB      $1B                 ; $3627: literal16
            DW      $7E7F               ; Inline cell
            DB      $17                 ; $362A: B@
            DB      $1E                 ; $362B: 0BRANCH
            DW      $3631               ; Branch destination
            DB      $1F                 ; $362E: BRANCH
            DW      $3635               ; Branch destination
            DB      $1B                 ; $3631: literal16
            DW      $7C10               ; Inline cell
            DB      $34                 ; $3634: _BZERO
            DB      $03                 ; $3635: RETURN
            xor     a
            djnz    $360B
            djnz    $3637
            djnz    $35E5
            djnz    $35E7
            djnz    $3613
            djnz    $35F9
            djnz    $3609
            djnz    $362E
            djnz    $35FF
            djnz    $35FA
            ld      (RAM_THROWTIME),a
            ld      hl,$0628
            ld      a,(RAM_PITCHTIME)
            and     a
            jr      z,$369C
            ld      ($7C7A),hl
            di
            ld      hl,($7D61)
            dec     hl
            dec     hl
            dec     hl
            dec     hl
            ld      ($7E59),hl
            ld      hl,($7D65)
            dec     hl
            dec     hl
            dec     hl
            dec     hl
            dec     hl
            dec     hl
            dec     hl
            ld      ($7E5D),hl
            ei
            call    resetrunners
            ld      bc,$367C
            jp      _WHBODDS
            add     a,a
            nop
            di
            ld      hl,PITCHBLPA
            ld      a,$01
            ld      ($7C58),a
            ld      ($7CB3),a
            ld      a,($7C34)
            and     a
            jr      z,$369A
            ld      a,($7C56)
            ld      hl,$3636
            call    indexw
            ex      de,hl
            jr      $36A2
            ld      ($7C5A),hl
            ld      hl,THWBLPA
            ld      ($7E54),hl
            ld      hl,$7E5F
            set     7,(hl)
            res     3,(hl)
            ei
            ret
            dec     b
            inc     bc
            inc     bc
            inc     bc
            inc     bc
            ld      (bc),a
            ld      (bc),a
            DB      $01, $01            ; $36B5: preserved data boundary

;=========================================================================================
; ----> _INNODDS  TERSE block 123; ROM $36B7-$3708
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $36B8: literal16
            DW      $7C0C               ; Inline cell
            DB      $17                 ; $36BB: B@
            DB      $1B                 ; $36BC: literal16
            DW      $7C35               ; Inline cell
            DB      $17                 ; $36BF: B@
            DB      $1E                 ; $36C0: 0BRANCH
            DW      $36E8               ; Branch destination
            DB      $08                 ; $36C3: DUP
            DB      $19                 ; $36C4: literal8
            DB      $06                 ; Inline byte
            DB      $5D                 ; $36C6: >
            DB      $1E                 ; $36C7: 0BRANCH
            DW      $36CF               ; Branch destination
            DB      $07                 ; $36CA: DROP
            DB      $22                 ; $36CB: 1
            DB      $1F                 ; $36CC: BRANCH
            DW      $36DB               ; Branch destination
            DB      $22                 ; $36CF: 1
            DB      $5D                 ; $36D0: >
            DB      $1E                 ; $36D1: 0BRANCH
            DW      $36D9               ; Branch destination
            DB      $19                 ; $36D4: literal8
            DB      $02                 ; Inline byte
            DB      $1F                 ; $36D6: BRANCH
            DW      $36DB               ; Branch destination
            DB      $19                 ; $36D9: literal8
            DB      $03                 ; Inline byte
            DB      $1B                 ; $36DB: literal16
            DW      $7CA3               ; Inline cell
            DB      $17                 ; $36DE: B@
            DB      $1E                 ; $36DF: 0BRANCH
            DW      $36E5               ; Branch destination
            DB      $07                 ; $36E2: DROP
            DB      $19                 ; $36E3: literal8
            DB      $04                 ; Inline byte
            DB      $1F                 ; $36E5: BRANCH
            DW      $3704               ; Branch destination
            DB      $1B                 ; $36E8: literal16
            DW      $7CA3               ; Inline cell
            DB      $17                 ; $36EB: B@
            DB      $1E                 ; $36EC: 0BRANCH
            DW      $36FE               ; Branch destination
            DB      $19                 ; $36EF: literal8
            DB      $03                 ; Inline byte
            DB      $5D                 ; $36F1: >
            DB      $1E                 ; $36F2: 0BRANCH
            DW      $36F9               ; Branch destination
            DB      $22                 ; $36F5: 1
            DB      $1F                 ; $36F6: BRANCH
            DW      $36FB               ; Branch destination
            DB      $19                 ; $36F9: literal8
            DB      $02                 ; Inline byte
            DB      $1F                 ; $36FB: BRANCH
            DW      $3704               ; Branch destination
            DB      $22                 ; $36FE: 1
            DB      $27                 ; $36FF: -
            DB      $0E                 ; $3700: inline base addition
            DW      $36AE               ; Inline cell
            DB      $17                 ; $3703: B@
            DB      $1B                 ; $3704: literal16
            DW      $7CAA               ; Inline cell
            DB      $04                 ; $3707: B!
            DB      $03                 ; $3708: RETURN

;=========================================================================================
; ----> bathit  Native entry $3709
;=========================================================================================
            ld      ($7CD3),a
            ld      ($7C1E),a
            ld      bc,$3715
            jp      $2231
            adc     a,b
            nop
            xor     a
            ld      (RAM_HITTIME),a
            ld      (RAM_PITCHTIME),a
            ld      ($7CB3),a
            ld      ($7C1E),a
            ret
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3726: literal16
            DW      $7CB4               ; Inline cell
            DB      $34                 ; $3729: _BZERO
            DB      $1B                 ; $372A: literal16
            DW      $7CB5               ; Inline cell
            DB      $17                 ; $372D: B@
            DB      $1E                 ; $372E: 0BRANCH
            DW      $373A               ; Branch destination
            DB      $64                 ; $3731: _VM_0CE7
            DB      $1B                 ; $3732: literal16
            DW      $7CB5               ; Inline cell
            DB      $34                 ; $3735: _BZERO
            DB      $7D                 ; $3736: _VM_2F78
            DB      $1F                 ; $3737: BRANCH
            DW      $3758               ; Branch destination
            DB      $1B                 ; $373A: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $373D: B@
            DB      $1E                 ; $373E: 0BRANCH
            DW      $3754               ; Branch destination
            DB      $1B                 ; $3741: literal16
            DW      $7C0A               ; Inline cell
            DB      $17                 ; $3744: B@
            DB      $1E                 ; $3745: 0BRANCH
            DW      $374E               ; Branch destination
            DB      $1B                 ; $3748: literal16
            DW      $2F69               ; Inline cell
            DB      $1F                 ; $374B: BRANCH
            DW      $3751               ; Branch destination
            DB      $1B                 ; $374E: literal16
            DW      $2F4F               ; Inline cell
            DB      $1F                 ; $3751: BRANCH
            DW      $3757               ; Branch destination
            DB      $1B                 ; $3754: literal16
            DW      $2F39               ; Inline cell
            DB      $78                 ; $3757: _INTSTART
            DB      $03                 ; $3758: RETURN

;=========================================================================================
; ----> ofldtbl  Native entry $3759
;=========================================================================================
            ld      hl,OFTBLPA
            xor     a
            ld      (RAM_OFTOTBL),a
            di
            ld      ($7E35),hl
            ld      ($7E16),hl
            ld      ($7DF7),hl
            call    $11FB
            ei
            ret

;=========================================================================================
; ----> buttonchk  Native entry $376F
;=========================================================================================
            ld      de,$0201
            ld      a,($7C0A)
            and     a
            jr      z,$377B
            ld      de,$0102
            ld      a,($7CD3)
            and     a
            jp      z,$380A
            ld      a,($7C35)
            and     a
            jr      z,$37A5
            ld      a,($7C1B)
            and     a
            jr      z,$3790
            ld      e,$02
            push    de
            di
            push    ix
            push    iy
            ld      d,$0A
            call    $2C90
            pop     iy
            pop     ix
            ei
            pop     de
            xor     $01
            jr      $37A9
            in      a,($10)
            and     d
            xor     d
            ld      ($7CD7),a
            ld      a,($7CD8)
            and     a
            ret     z
            ld      a,($7CA6)
            and     a
            ret     nz
            ld      a,($7CB7)
            and     a
            jr      z,$37C0
            in      a,($10)
            and     e
            ret     nz
            inc     a
            ld      ($7C1E),a
            xor     a
            ld      ($7CA1),a
            ld      ($7CD3),a
            ld      a,($7CB0)
            and     a
            jr      nz,$37D9
            ld      bc,$37D7
            jp      _WUPWRT
            adc     a,c
            nop
            xor     a
            ld      ($7CB1),a
            ld      ($7CB2),a
            ld      ($7CB0),a
            ld      hl,PITCHPA
            ld      ($7D5C),hl
            ld      ($7CD8),a
            ld      ($7D5E),a
            ld      a,$4A
            ld      ($7CC1),a
            ld      (RAM_PITCHTIME),a
            ld      hl,VEC_PT
            ld      ($7C4F),hl
            ld      hl,$7D67
            set     7,(hl)
            call    killof
            xor     a
            ld      ($7C1E),a
            ret
            ld      a,($7C35)
            and     a
            jr      z,$3825
            ld      a,($7C07)
            add     a,$98
            ld      d,a
            ld      a,($7E5E)
            cp      d
            ret     c
            ld      a,($7E5A)
            sbc     a,$26
            cp      $04
            ret     nc
            jr      $3829
            in      a,($10)
            and     d
            ret     nz
            ld      a,($7CB3)
            and     a
            ret     z
            ld      ($7CD5),a
            ret
            rst     $08
            dec     de
            nop
            inc     e
            dec     de
            nop
            ld      a,(bc)
            dec     de
            jr      z,$3844
            ld      l,$0C
            ld      c,c
            ld      c,(hl)
            ld      d,e
            ld      b,l
            ld      d,d
            ld      d,h
            jr      nz,$3889
            ld      c,a
            ld      c,c
            ld      c,(hl)
            ld      d,e
            cpl
            inc     bc
            rst     $08                 ; Enter the inline TERSE thread
            DB      $8A                 ; $384D: _SGO
            DB      $1B                 ; $384E: literal16
            DW      $3832               ; Inline cell
            DB      $35                 ; $3851: _FLSHTON
            DB      $1B                 ; $3852: literal16
            DW      $7C09               ; Inline cell
            DB      $17                 ; $3855: B@
            DB      $1E                 ; $3856: 0BRANCH
            DW      $38C6               ; Branch destination
            DB      $1B                 ; $3859: literal16
            DW      $0C00               ; Inline cell
            DB      $1B                 ; $385C: literal16
            DW      $1A00               ; Inline cell
            DB      $1B                 ; $385F: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3862: counted string
            DB      28                  ; Counted-string length
            DB      $31, $20, $43, $4F, $49, $4E, $20, $50, $45, $52, $20, $50, $4C, $41, $59, $45; 1 COIN PER PLAYE
            DB      $52, $20, $31, $53, $54, $20, $49, $4E, $4E, $49, $4E, $47; R 1ST INNING
            DB      $2F                 ; $3880: _SPOST
            DB      $1B                 ; $3881: literal16
            DW      $1700               ; Inline cell
            DB      $1B                 ; $3884: literal16
            DW      $2A00               ; Inline cell
            DB      $1B                 ; $3887: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $388A: counted string
            DB      17                  ; Counted-string length
            DB      $31, $20, $43, $4F, $49, $4E, $20, $50, $45, $52, $20, $50, $4C, $41, $59, $45; 1 COIN PER PLAYE
            DB      $52                 ; R
            DB      $2F                 ; $389D: _SPOST
            DB      $1B                 ; $389E: literal16
            DW      $0F00               ; Inline cell
            DB      $1B                 ; $38A1: literal16
            DW      $3A00               ; Inline cell
            DB      $1B                 ; $38A4: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $38A7: counted string
            DB      25                  ; Counted-string length
            DB      $45, $41, $43, $48, $20, $41, $44, $44, $49, $54, $49, $4F, $4E, $41, $4C, $20; EACH ADDITIONAL
            DB      $32, $20, $49, $4E, $4E, $49, $4E, $47, $53; 2 INNINGS
            DB      $2F                 ; $38C2: _SPOST
            DB      $1F                 ; $38C3: BRANCH
            DW      $3911               ; Branch destination
            DB      $1B                 ; $38C6: literal16
            DW      $1800               ; Inline cell
            DB      $1B                 ; $38C9: literal16
            DW      $1D00               ; Inline cell
            DB      $1B                 ; $38CC: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $38CF: counted string
            DB      18                  ; Counted-string length
            DB      $31, $20, $43, $4F, $49, $4E, $20, $31, $53, $54, $20, $49, $4E, $4E, $49, $4E; 1 COIN 1ST INNIN
            DB      $47, $20            ; G
            DB      $2F                 ; $38E3: _SPOST
            DB      $1B                 ; $38E4: literal16
            DW      $0800               ; Inline cell
            DB      $1B                 ; $38E7: literal16
            DW      $3000               ; Inline cell
            DB      $1B                 ; $38EA: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $38ED: counted string
            DB      33                  ; Counted-string length
            DB      $31, $20, $43, $4F, $49, $4E, $20, $45, $41, $43, $48, $20, $41, $44, $44, $49; 1 COIN EACH ADDI
            DB      $54, $49, $4F, $4E, $41, $4C, $20, $32, $20, $49, $4E, $4E, $49, $4E, $47, $53; TIONAL 2 INNINGS
            DB      $20                 ;
            DB      $2F                 ; $3910: _SPOST
            DB      $03                 ; $3911: RETURN

;=========================================================================================
; ----> _CONGR  TERSE block 127; ROM $3912-$3966
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3913: literal16
            DW      $0700               ; Inline cell
            DB      $1B                 ; $3916: literal16
            DW      $1000               ; Inline cell
            DB      $1B                 ; $3919: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $391C: counted string
            DB      33                  ; Counted-string length
            DB      $43, $4F, $4E, $47, $52, $41, $54, $55, $4C, $41, $54, $49, $4F, $4E, $53, $20; CONGRATULATIONS
            DB      $59, $4F, $55, $20, $41, $52, $45, $20, $56, $45, $52, $59, $20, $47, $4F, $4F; YOU ARE VERY GOO
            DB      $44                 ; D
            DB      $2F                 ; $393F: _SPOST
            DB      $1B                 ; $3940: literal16
            DW      $0E00               ; Inline cell
            DB      $1B                 ; $3943: literal16
            DW      $2800               ; Inline cell
            DB      $1B                 ; $3946: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3949: counted string
            DB      26                  ; Counted-string length
            DB      $4C, $45, $54, $53, $20, $50, $4C, $41, $59, $20, $41, $47, $41, $49, $4E, $20; LETS PLAY AGAIN
            DB      $49, $20, $57, $49, $4C, $4C, $20, $42, $55, $59; I WILL BUY
            DB      $2F                 ; $3965: _SPOST
            DB      $03                 ; $3966: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3968: literal16
            DW      RAM_SCORE1          ; Inline cell
            DB      $17                 ; $396B: B@
            DB      $1B                 ; $396C: literal16
            DW      RAM_SCORE2          ; Inline cell
            DB      $17                 ; $396F: B@
            DB      $26                 ; $3970: =
            DB      $1E                 ; $3971: 0BRANCH
            DW      $3992               ; Branch destination
            DB      $1B                 ; $3974: literal16
            DW      $1900               ; Inline cell
            DB      $1B                 ; $3977: literal16
            DW      $1000               ; Inline cell
            DB      $1B                 ; $397A: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $397D: counted string
            DB      15                  ; Counted-string length
            DB      $54, $4F, $4F, $20, $42, $41, $44, $20, $57, $45, $20, $54, $49, $45, $44; TOO BAD WE TIED
            DB      $2F                 ; $398E: _SPOST
            DB      $1F                 ; $398F: BRANCH
            DW      $39AB               ; Branch destination
            DB      $1B                 ; $3992: literal16
            DW      $1B00               ; Inline cell
            DB      $1B                 ; $3995: literal16
            DW      $1000               ; Inline cell
            DB      $1B                 ; $3998: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $399B: counted string
            DB      13                  ; Counted-string length
            DB      $54, $4F, $4F, $20, $42, $41, $44, $20, $49, $20, $57, $4F, $4E; TOO BAD I WON
            DB      $2F                 ; $39AA: _SPOST
            DB      $79                 ; $39AB: _DP1CN
            DB      $03                 ; $39AC: RETURN

;=========================================================================================
; ----> _DP1  TERSE block 127; ROM $39AD-$39C8
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $39AE: literal16
            DW      $1A00               ; Inline cell
            DB      $1B                 ; $39B1: literal16
            DW      $2C00               ; Inline cell
            DB      $1B                 ; $39B4: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $39B7: counted string
            DB      14                  ; Counted-string length
            DB      $44, $45, $50, $4F, $53, $49, $54, $20, $31, $20, $43, $4F, $49, $4E; DEPOSIT 1 COIN
            DB      $2F                 ; $39C7: _SPOST
            DB      $03                 ; $39C8: RETURN

;=========================================================================================
; ----> _TCNT  TERSE block 128; ROM $39C9-$3A32
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $39CA: literal16
            DW      $0700               ; Inline cell
            DB      $1B                 ; $39CD: literal16
            DW      $1800               ; Inline cell
            DB      $1B                 ; $39D0: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $39D3: counted string
            DB      33                  ; Counted-string length
            DB      $54, $4F, $20, $43, $4F, $4E, $54, $49, $4E, $55, $45, $20, $47, $41, $4D, $45; TO CONTINUE GAME
            DB      $20, $41, $54, $20, $45, $4E, $44, $20, $4F, $46, $20, $49, $4E, $4E, $49, $4E; AT END OF INNIN
            DB      $47                 ; G
            DB      $2F                 ; $39F6: _SPOST
            DB      $1B                 ; $39F7: literal16
            DW      $7C1A               ; Inline cell
            DB      $17                 ; $39FA: B@
            DB      $1E                 ; $39FB: 0BRANCH
            DW      $3A31               ; Branch destination
            DB      $1B                 ; $39FE: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $3A01: B@
            DB      $1E                 ; $3A02: 0BRANCH
            DW      $3A09               ; Branch destination
            DB      $8B                 ; $3A05: _DP1
            DB      $1F                 ; $3A06: BRANCH
            DW      $3A2E               ; Branch destination
            DB      $1B                 ; $3A09: literal16
            DW      $0F00               ; Inline cell
            DB      $1B                 ; $3A0C: literal16
            DW      $2C00               ; Inline cell
            DB      $1B                 ; $3A0F: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3A12: counted string
            DB      25                  ; Counted-string length
            DB      $44, $45, $50, $4F, $53, $49, $54, $20, $31, $20, $43, $4F, $49, $4E, $20, $50; DEPOSIT 1 COIN P
            DB      $45, $52, $20, $50, $4C, $41, $59, $45, $52; ER PLAYER
            DB      $2F                 ; $3A2D: _SPOST
            DB      $1F                 ; $3A2E: BRANCH
            DW      $3A32               ; Branch destination
            DB      $8B                 ; $3A31: _DP1
            DB      $03                 ; $3A32: RETURN

;=========================================================================================
; ----> _SPLR12  TERSE block 128; ROM $3A33-$3A55
;=========================================================================================
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3A34: literal16
            DW      $1400               ; Inline cell
            DB      $1B                 ; $3A37: literal16
            DW      $2000               ; Inline cell
            DB      $1B                 ; $3A3A: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3A3D: counted string
            DB      21                  ; Counted-string length
            DB      $53, $45, $4C, $45, $43, $54, $20, $31, $20, $4F, $52, $20, $32, $20, $50, $4C; SELECT 1 OR 2 PL
            DB      $41, $59, $45, $52, $53; AYERS
            DB      $2F                 ; $3A54: _SPOST
            DB      $03                 ; $3A55: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3A57: literal16
            DW      $7C09               ; Inline cell
            DB      $17                 ; $3A5A: B@
            DB      $1E                 ; $3A5B: 0BRANCH
            DW      $3ABD               ; Branch destination
            DB      $1B                 ; $3A5E: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $3A61: B@
            DB      $22                 ; $3A62: 1
            DB      $7F                 ; $3A63: <>
            DB      $1E                 ; $3A64: 0BRANCH
            DW      $3A6B               ; Branch destination
            DB      $8C                 ; $3A67: _SPLR12
            DB      $1F                 ; $3A68: BRANCH
            DW      $3ABA               ; Branch destination
            DB      $1B                 ; $3A6B: literal16
            DW      $0E00               ; Inline cell
            DB      $1B                 ; $3A6E: literal16
            DW      $1A00               ; Inline cell
            DB      $1B                 ; $3A71: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3A74: counted string
            DB      26                  ; Counted-string length
            DB      $53, $45, $4C, $45, $43, $54, $20, $31, $20, $50, $4C, $41, $59, $45, $52, $20; SELECT 1 PLAYER
            DB      $4F, $52, $20, $44, $45, $50, $4F, $53, $49, $54; OR DEPOSIT
            DB      $2F                 ; $3A90: _SPOST
            DB      $1B                 ; $3A91: literal16
            DW      $0F00               ; Inline cell
            DB      $1B                 ; $3A94: literal16
            DW      $3000               ; Inline cell
            DB      $1B                 ; $3A97: literal16
            DW      $0828               ; Inline cell
            DB      $2E                 ; $3A9A: counted string
            DB      25                  ; Counted-string length
            DB      $31, $20, $4D, $4F, $52, $45, $20, $43, $4F, $49, $4E, $20, $46, $4F, $52, $20; 1 MORE COIN FOR
            DB      $32, $20, $50, $4C, $41, $59, $45, $52, $53; 2 PLAYERS
            DB      $2F                 ; $3AB5: _SPOST
            DB      $1B                 ; $3AB6: literal16
            DW      $7C8A               ; Inline cell
            DB      $30                 ; $3AB9: _BONE
            DB      $1F                 ; $3ABA: BRANCH
            DW      $3ABE               ; Branch destination
            DB      $8C                 ; $3ABD: _SPLR12
            DB      $03                 ; $3ABE: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $8A                 ; $3AC0: _SGO
            DB      $19                 ; $3AC1: literal8
            DB      $32                 ; Inline byte
            DB      $1B                 ; $3AC3: literal16
            DW      $7C49               ; Inline cell
            DB      $04                 ; $3AC6: B!
            DB      $1B                 ; $3AC7: literal16
            DW      $7C35               ; Inline cell
            DB      $30                 ; $3ACA: _BONE
            DB      $1B                 ; $3ACB: literal16
            DW      $7C34               ; Inline cell
            DB      $30                 ; $3ACE: _BONE
            DB      $84                 ; $3ACF: _VM_1441
            DB      $19                 ; $3AD0: literal8
            DB      $2A                 ; Inline byte
            DB      $19                 ; $3AD2: literal8
            DB      $B6                 ; Inline byte
            DB      $19                 ; $3AD4: literal8
            DB      $4D                 ; Inline byte
            DB      $19                 ; $3AD6: literal8
            DB      $08                 ; Inline byte
            DB      $4D                 ; $3AD8: _VM_17B9
            DB      $1B                 ; $3AD9: literal16
            DW      $08C0               ; Inline cell
            DB      $1B                 ; $3ADC: literal16
            DW      $7C12               ; Inline cell
            DB      $02                 ; $3ADF: !
            DB      $1B                 ; $3AE0: literal16
            DW      $7C0C               ; Inline cell
            DB      $34                 ; $3AE3: _BZERO
            DB      $1B                 ; $3AE4: literal16
            DW      $7C10               ; Inline cell
            DB      $34                 ; $3AE7: _BZERO
            DB      $19                 ; $3AE8: literal8
            DB      $09                 ; Inline byte
            DB      $1B                 ; $3AEA: literal16
            DW      $7C08               ; Inline cell
            DB      $04                 ; $3AED: B!
            DB      $86                 ; $3AEE: _VM_351A
            DB      $1B                 ; $3AEF: literal16
            DW      $7C10               ; Inline cell
            DB      $30                 ; $3AF2: _BONE
            DB      $1B                 ; $3AF3: literal16
            DW      $7C08               ; Inline cell
            DB      $34                 ; $3AF6: _BZERO
            DB      $1B                 ; $3AF7: literal16
            DW      RAM_SCORE1          ; Inline cell
            DB      $8D                 ; $3AFA: ZERO
            DB      $51                 ; $3AFB: _VM_1885
            DB      $1B                 ; $3AFC: literal16
            DW      $7C06               ; Inline cell
            DB      $34                 ; $3AFF: _BZERO
            DB      $1B                 ; $3B00: literal16
            DW      $7C9B               ; Inline cell
            DB      $17                 ; $3B03: B@
            DB      $1E                 ; $3B04: 0BRANCH
            DW      $3B0C               ; Branch destination
            DB      $1B                 ; $3B07: literal16
            DW      $7C9B               ; Inline cell
            DB      $34                 ; $3B0A: _BZERO
            DB      $37                 ; $3B0B: word at $12EA
            DB      $19                 ; $3B0C: literal8
            DB      $10                 ; Inline byte
            DB      $7A                 ; $3B0E: _VM_11C4
            DB      $8E                 ; $3B0F: _VM_384C
            DB      $1B                 ; $3B10: literal16
            DW      $7C1E               ; Inline cell
            DB      $34                 ; $3B13: _BZERO
            DB      $19                 ; $3B14: literal8
            DB      $60                 ; Inline byte
            DB      $7A                 ; $3B16: _VM_11C4
            DB      $1B                 ; $3B17: literal16
            DW      $7C1E               ; Inline cell
            DB      $30                 ; $3B1A: _BONE
            DB      $8E                 ; $3B1B: _VM_384C
            DB      $1B                 ; $3B1C: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $3B1F: B@
            DB      $1E                 ; $3B20: 0BRANCH
            DW      $3B24               ; Branch destination
            DB      $8A                 ; $3B23: _SGO
            DB      $1B                 ; $3B24: literal16
            DW      $7C19               ; Inline cell
            DB      $30                 ; $3B27: _BONE
            DB      $1B                 ; $3B28: literal16
            DW      $7C0A               ; Inline cell
            DB      $34                 ; $3B2B: _BZERO
            DB      $37                 ; $3B2C: word at $12EA
            DB      $07                 ; $3B2D: DROP
            DB      $0D                 ; $3B2E: 0
            DB      $1B                 ; $3B2F: literal16
            DW      RAM_PLYR1UP         ; Inline cell
            DB      $34                 ; $3B32: _BZERO
            DB      $03                 ; $3B33: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3B35: literal16
            DW      $7C28               ; Inline cell
            DB      $34                 ; $3B38: _BZERO
            DB      $1B                 ; $3B39: literal16
            DW      $7C1E               ; Inline cell
            DB      $30                 ; $3B3C: _BONE
            DB      $48                 ; $3B3D: _VM_184E
            DB      $19                 ; $3B3E: literal8
            DB      $30                 ; Inline byte
            DB      $08                 ; $3B40: DUP
            DB      $08                 ; $3B41: DUP
            DB      $1B                 ; $3B42: literal16
            DW      $7C49               ; Inline cell
            DB      $04                 ; $3B45: B!
            DB      $1B                 ; $3B46: literal16
            DW      $7C96               ; Inline cell
            DB      $04                 ; $3B49: B!
            DB      $1B                 ; $3B4A: literal16
            DW      $7C95               ; Inline cell
            DB      $04                 ; $3B4D: B!
            DB      $19                 ; $3B4E: literal8
            DB      $12                 ; Inline byte
            DB      $7E                 ; $3B50: INP
            DB      $22                 ; $3B51: 1
            DB      $1A                 ; $3B52: AND
            DB      $22                 ; $3B53: 1
            DB      $1C                 ; $3B54: XOR
            DB      $1B                 ; $3B55: literal16
            DW      $7C09               ; Inline cell
            DB      $04                 ; $3B58: B!
            DB      $1B                 ; $3B59: literal16
            DW      RAM_PLYR1UP         ; Inline cell
            DB      $08                 ; $3B5C: DUP
            DB      $17                 ; $3B5D: B@
            DB      $22                 ; $3B5E: 1
            DB      $1C                 ; $3B5F: XOR
            DB      $08                 ; $3B60: DUP
            DB      $05                 ; $3B61: ROT
            DB      $04                 ; $3B62: B!
            DB      $1B                 ; $3B63: literal16
            DW      $7C06               ; Inline cell
            DB      $17                 ; $3B66: B@
            DB      $1E                 ; $3B67: 0BRANCH
            DW      $3B79               ; Branch destination
            DB      $08                 ; $3B6A: DUP
            DB      $1E                 ; $3B6B: 0BRANCH
            DW      $3B75               ; Branch destination
            DB      $1B                 ; $3B6E: literal16
            DW      $7C35               ; Inline cell
            DB      $30                 ; $3B71: _BONE
            DB      $1F                 ; $3B72: BRANCH
            DW      $3B79               ; Branch destination
            DB      $1B                 ; $3B75: literal16
            DW      $7C34               ; Inline cell
            DB      $30                 ; $3B78: _BONE
            DB      $1B                 ; $3B79: literal16
            DW      $7C19               ; Inline cell
            DB      $17                 ; $3B7C: B@
            DB      $1E                 ; $3B7D: 0BRANCH
            DW      $3B85               ; Branch destination
            DB      $8A                 ; $3B80: _SGO
            DB      $8F                 ; $3B81: _VM_3ABF
            DB      $1F                 ; $3B82: BRANCH
            DW      $3C12               ; Branch destination
            DB      $1B                 ; $3B85: literal16
            DW      $7C10               ; Inline cell
            DB      $17                 ; $3B88: B@
            DB      $1E                 ; $3B89: 0BRANCH
            DW      $3C07               ; Branch destination
            DB      $1B                 ; $3B8C: literal16
            DW      $7C06               ; Inline cell
            DB      $17                 ; $3B8F: B@
            DB      $1E                 ; $3B90: 0BRANCH
            DW      $3BC8               ; Branch destination
            DB      $1B                 ; $3B93: literal16
            DW      RAM_SCORE1          ; Inline cell
            DB      $17                 ; $3B96: B@
            DB      $1B                 ; $3B97: literal16
            DW      RAM_SCORE2          ; Inline cell
            DB      $17                 ; $3B9A: B@
            DB      $5C                 ; $3B9B: <
            DB      $1E                 ; $3B9C: 0BRANCH
            DW      $3BB4               ; Branch destination
            DB      $90                 ; $3B9F: _CONGR
            DB      $19                 ; $3BA0: literal8
            DB      $50                 ; Inline byte
            DB      $7A                 ; $3BA2: _VM_11C4
            DB      $1B                 ; $3BA3: literal16
            DW      $7C08               ; Inline cell
            DB      $63                 ; $3BA6: 1+B!
            DB      $86                 ; $3BA7: _VM_351A
            DB      $90                 ; $3BA8: _CONGR
            DB      $1B                 ; $3BA9: literal16
            DW      $7C10               ; Inline cell
            DB      $34                 ; $3BAC: _BZERO
            DB      $1B                 ; $3BAD: literal16
            DW      $7CA3               ; Inline cell
            DB      $30                 ; $3BB0: _BONE
            DB      $1F                 ; $3BB1: BRANCH
            DW      $3BC5               ; Branch destination
            DB      $91                 ; $3BB4: _VM_3967
            DB      $19                 ; $3BB5: literal8
            DB      $A0                 ; Inline byte
            DB      $7A                 ; $3BB7: _VM_11C4
            DB      $91                 ; $3BB8: _VM_3967
            DB      $1B                 ; $3BB9: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $3BBC: B@
            DB      $1E                 ; $3BBD: 0BRANCH
            DW      $3BC4               ; Branch destination
            DB      $92                 ; $3BC0: _VM_12F5
            DB      $1F                 ; $3BC1: BRANCH
            DW      $3BC5               ; Branch destination
            DB      $8F                 ; $3BC4: _VM_3ABF
            DB      $1F                 ; $3BC5: BRANCH
            DW      $3C04               ; Branch destination
            DB      $1B                 ; $3BC8: literal16
            DW      $7C09               ; Inline cell
            DB      $17                 ; $3BCB: B@
            DB      $1E                 ; $3BCC: 0BRANCH
            DW      $3BFB               ; Branch destination
            DB      $1B                 ; $3BCF: literal16
            DW      $7C1A               ; Inline cell
            DB      $34                 ; $3BD2: _BZERO
            DB      $1B                 ; $3BD3: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $3BD6: B@
            DB      $22                 ; $3BD7: 1
            DB      $26                 ; $3BD8: =
            DB      $1E                 ; $3BD9: 0BRANCH
            DW      $3BE0               ; Branch destination
            DB      $93                 ; $3BDC: _DPCN
            DB      $1F                 ; $3BDD: BRANCH
            DW      $3BF4               ; Branch destination
            DB      $94                 ; $3BE0: _VM_3050
            DB      $08                 ; $3BE1: DUP
            DB      $1E                 ; $3BE2: 0BRANCH
            DW      $3BF2               ; Branch destination
            DB      $22                 ; $3BE5: 1
            DB      $26                 ; $3BE6: =
            DB      $1E                 ; $3BE7: 0BRANCH
            DW      $3BEE               ; Branch destination
            DB      $93                 ; $3BEA: _DPCN
            DB      $1F                 ; $3BEB: BRANCH
            DW      $3BEF               ; Branch destination
            DB      $92                 ; $3BEE: _VM_12F5
            DB      $1F                 ; $3BEF: BRANCH
            DW      $3BF4               ; Branch destination
            DB      $07                 ; $3BF2: DROP
            DB      $8F                 ; $3BF3: _VM_3ABF
            DB      $1B                 ; $3BF4: literal16
            DW      $7C1A               ; Inline cell
            DB      $30                 ; $3BF7: _BONE
            DB      $1F                 ; $3BF8: BRANCH
            DW      $3C04               ; Branch destination
            DB      $94                 ; $3BFB: _VM_3050
            DB      $1E                 ; $3BFC: 0BRANCH
            DW      $3C03               ; Branch destination
            DB      $92                 ; $3BFF: _VM_12F5
            DB      $1F                 ; $3C00: BRANCH
            DW      $3C04               ; Branch destination
            DB      $8F                 ; $3C03: _VM_3ABF
            DB      $1F                 ; $3C04: BRANCH
            DW      $3C12               ; Branch destination
            DB      $1B                 ; $3C07: literal16
            DW      $7C18               ; Inline cell
            DB      $17                 ; $3C0A: B@
            DB      $1E                 ; $3C0B: 0BRANCH
            DW      $3C11               ; Branch destination
            DB      $1F                 ; $3C0E: BRANCH
            DW      $3C12               ; Branch destination
            DB      $92                 ; $3C11: _VM_12F5
            DB      $1B                 ; $3C12: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $3C15: B@
            DB      $1E                 ; $3C16: 0BRANCH
            DW      $3C3C               ; Branch destination
            DB      $1B                 ; $3C19: literal16
            DW      $7C19               ; Inline cell
            DB      $17                 ; $3C1C: B@
            DB      $1E                 ; $3C1D: 0BRANCH
            DW      $3C23               ; Branch destination
            DB      $1F                 ; $3C20: BRANCH
            DW      $3C3C               ; Branch destination
            DB      $1B                 ; $3C23: literal16
            DW      $7C06               ; Inline cell
            DB      $17                 ; $3C26: B@
            DB      $1E                 ; $3C27: 0BRANCH
            DW      $3C2D               ; Branch destination
            DB      $1F                 ; $3C2A: BRANCH
            DW      $3C3C               ; Branch destination
            DB      $08                 ; $3C2D: DUP
            DB      $1B                 ; $3C2E: literal16
            DW      $7C0A               ; Inline cell
            DB      $04                 ; $3C31: B!
            DB      $1B                 ; $3C32: literal16
            DW      $7C0C               ; Inline cell
            DB      $17                 ; $3C35: B@
            DB      $1E                 ; $3C36: 0BRANCH
            DW      $3C3C               ; Branch destination
            DB      $7C                 ; $3C39: _FL
            DB      $7D                 ; $3C3A: _VM_2F78
            DB      $86                 ; $3C3B: _VM_351A
            DB      $1E                 ; $3C3C: 0BRANCH
            DW      $3C5D               ; Branch destination
            DB      $1B                 ; $3C3F: literal16
            DW      $7C12               ; Inline cell
            DB      $24                 ; $3C42: @
            DB      $1B                 ; $3C43: literal16
            DW      $B700               ; Inline cell
            DB      $1B                 ; $3C46: literal16
            DW      DNTRI               ; Inline cell
            DB      $1B                 ; $3C49: literal16
            DW      $7C0C               ; Inline cell
            DB      $17                 ; $3C4C: B@
            DB      $1B                 ; $3C4D: literal16
            DW      $7C08               ; Inline cell
            DB      $17                 ; $3C50: B@
            DB      $26                 ; $3C51: =
            DB      $1E                 ; $3C52: 0BRANCH
            DW      $3C5A               ; Branch destination
            DB      $95                 ; $3C55: _TCNT
            DB      $19                 ; $3C56: literal8
            DB      $30                 ; Inline byte
            DB      $7A                 ; $3C58: _VM_11C4
            DB      $95                 ; $3C59: _TCNT
            DB      $1F                 ; $3C5A: BRANCH
            DW      $3C98               ; Branch destination
            DB      $1B                 ; $3C5D: literal16
            DW      $7C0C               ; Inline cell
            DB      $08                 ; $3C60: DUP
            DB      $63                 ; $3C61: 1+B!
            DB      $17                 ; $3C62: B@
            DB      $19                 ; $3C63: literal8
            DB      $0A                 ; Inline byte
            DB      $26                 ; $3C65: =
            DB      $1E                 ; $3C66: 0BRANCH
            DW      $3C86               ; Branch destination
            DB      $1B                 ; $3C69: literal16
            DW      $7C14               ; Inline cell
            DB      $17                 ; $3C6C: B@
            DB      $1E                 ; $3C6D: 0BRANCH
            DW      $3C73               ; Branch destination
            DB      $1F                 ; $3C70: BRANCH
            DW      $3C75               ; Branch destination
            DB      $85                 ; $3C73: _VM_3501
            DB      $86                 ; $3C74: _VM_351A
            DB      $84                 ; $3C75: _VM_1441
            DB      $19                 ; $3C76: literal8
            DB      $2A                 ; Inline byte
            DB      $19                 ; $3C78: literal8
            DB      $B6                 ; Inline byte
            DB      $19                 ; $3C7A: literal8
            DB      $4D                 ; Inline byte
            DB      $19                 ; $3C7C: literal8
            DB      $08                 ; Inline byte
            DB      $4D                 ; $3C7E: _VM_17B9
            DB      $1B                 ; $3C7F: literal16
            DW      $08C0               ; Inline cell
            DB      $1B                 ; $3C82: literal16
            DW      $7C12               ; Inline cell
            DB      $02                 ; $3C85: !
            DB      $1B                 ; $3C86: literal16
            DW      $7C12               ; Inline cell
            DB      $08                 ; $3C89: DUP
            DB      $24                 ; $3C8A: @
            DB      $1B                 ; $3C8B: literal16
            DW      $0200               ; Inline cell
            DB      $14                 ; $3C8E: +
            DB      $08                 ; $3C8F: DUP
            DB      $05                 ; $3C90: ROT
            DB      $02                 ; $3C91: !
            DB      $1B                 ; $3C92: literal16
            DW      $B600               ; Inline cell
            DB      $1B                 ; $3C95: literal16
            DW      UPTRI               ; Inline cell
            DB      $1B                 ; $3C98: literal16
            DW      $0501               ; Inline cell
            DB      $1B                 ; $3C9B: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $3C9E: _WRITE
            DB      $1B                 ; $3C9F: literal16
            DW      $7C9B               ; Inline cell
            DB      $17                 ; $3CA2: B@
            DB      $1E                 ; $3CA3: 0BRANCH
            DW      $3CAD               ; Branch destination
            DB      $1B                 ; $3CA6: literal16
            DW      $7C9C               ; Inline cell
            DB      $30                 ; $3CA9: _BONE
            DB      $1F                 ; $3CAA: BRANCH
            DW      $3CB2               ; Branch destination
            DB      $1B                 ; $3CAD: literal16
            DW      _WUPWRT             ; Inline cell
            DB      $96                 ; $3CB0: _WUPWRT
            DB      $35                 ; $3CB1: _FLSHTON
            DB      $97                 ; $3CB2: _VM_2887
            DB      $98                 ; $3CB3: _VM_2A7E
            DB      $52                 ; $3CB4: _VM_17F3
            DB      $1B                 ; $3CB5: literal16
            DW      $7CB6               ; Inline cell
            DB      $34                 ; $3CB8: _BZERO
            DB      $19                 ; $3CB9: literal8
            DB      $03                 ; Inline byte
            DB      $1B                 ; $3CBB: literal16
            DW      $7C3D               ; Inline cell
            DB      $04                 ; $3CBE: B!
            DB      $99                 ; $3CBF: _INNODDS
            DB      $1B                 ; $3CC0: literal16
            DW      $7C06               ; Inline cell
            DB      $17                 ; $3CC3: B@
            DB      $1E                 ; $3CC4: 0BRANCH
            DW      $3CCB               ; Branch destination
            DB      $9A                 ; $3CC7: _VM_183A
            DB      $1F                 ; $3CC8: BRANCH
            DW      $3CD6               ; Branch destination
            DB      $1B                 ; $3CCB: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $3CCE: B@
            DB      $1E                 ; $3CCF: 0BRANCH
            DW      $3CD5               ; Branch destination
            DB      $1F                 ; $3CD2: BRANCH
            DW      $3CD6               ; Branch destination
            DB      $9A                 ; $3CD5: _VM_183A
            DB      $1B                 ; $3CD6: literal16
            DW      $7CD3               ; Inline cell
            DB      $30                 ; $3CD9: _BONE
            DB      $64                 ; $3CDA: _VM_0CE7
            DB      $7D                 ; $3CDB: _VM_2F78
            DB      $1B                 ; $3CDC: literal16
            DW      $7C1E               ; Inline cell
            DB      $34                 ; $3CDF: _BZERO
            DB      $03                 ; $3CE0: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3CE2: literal16
            DW      $7C1E               ; Inline cell
            DB      $30                 ; $3CE5: _BONE
            DB      $48                 ; $3CE6: _VM_184E
            DB      $1B                 ; $3CE7: literal16
            DW      $7C0C               ; Inline cell
            DB      $34                 ; $3CEA: _BZERO
            DB      $1B                 ; $3CEB: literal16
            DW      RAM_SCORE1          ; Inline cell
            DB      $8D                 ; $3CEE: ZERO
            DB      $1B                 ; $3CEF: literal16
            DW      $7C28               ; Inline cell
            DB      $17                 ; $3CF2: B@
            DB      $1E                 ; $3CF3: 0BRANCH
            DW      $3CF9               ; Branch destination
            DB      $1F                 ; $3CF6: BRANCH
            DW      $3CFA               ; Branch destination
            DB      $9B                 ; $3CF9: _VM_30F5
            DB      $7C                 ; $3CFA: _FL
            DB      $7D                 ; $3CFB: _VM_2F78
            DB      $1B                 ; $3CFC: literal16
            DW      $7C28               ; Inline cell
            DB      $30                 ; $3CFF: _BONE
            DB      $1B                 ; $3D00: literal16
            DW      $7CBB               ; Inline cell
            DB      $30                 ; $3D03: _BONE
            DB      $9C                 ; $3D04: _VM_3A56
            DB      $1B                 ; $3D05: literal16
            DW      $7CBC               ; Inline cell
            DB      $34                 ; $3D08: _BZERO
            DB      $86                 ; $3D09: _VM_351A
            DB      $03                 ; $3D0A: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $9C                 ; $3D0C: _VM_3A56
            DB      $86                 ; $3D0D: _VM_351A
            DB      $1B                 ; $3D0E: literal16
            DW      RAM_PLYR1UP         ; Inline cell
            DB      $30                 ; $3D11: _BONE
            DB      $1B                 ; $3D12: literal16
            DW      $7C8A               ; Inline cell
            DB      $34                 ; $3D15: _BZERO
            DB      $1B                 ; $3D16: literal16
            DW      $7C10               ; Inline cell
            DB      $34                 ; $3D19: _BZERO
            DB      $1B                 ; $3D1A: literal16
            DW      $7C09               ; Inline cell
            DB      $17                 ; $3D1D: B@
            DB      $1E                 ; $3D1E: 0BRANCH
            DW      $3D25               ; Branch destination
            DB      $9D                 ; $3D21: _VM_3559
            DB      $1F                 ; $3D22: BRANCH
            DW      $3D26               ; Branch destination
            DB      $86                 ; $3D25: _VM_351A
            DB      $1B                 ; $3D26: literal16
            DW      $7C19               ; Inline cell
            DB      $34                 ; $3D29: _BZERO
            DB      $1B                 ; $3D2A: literal16
            DW      $7C06               ; Inline cell
            DB      $17                 ; $3D2D: B@
            DB      $1E                 ; $3D2E: 0BRANCH
            DW      $3D3A               ; Branch destination
            DB      $9E                 ; $3D31: _VM_30A0
            DB      $19                 ; $3D32: literal8
            DB      $50                 ; Inline byte
            DB      $36                 ; $3D34: _DWAIT
            DB      $9E                 ; $3D35: _VM_30A0
            DB      $9A                 ; $3D36: _VM_183A
            DB      $1F                 ; $3D37: BRANCH
            DW      $3D45               ; Branch destination
            DB      $1B                 ; $3D3A: literal16
            DW      $7C1B               ; Inline cell
            DB      $17                 ; $3D3D: B@
            DB      $1E                 ; $3D3E: 0BRANCH
            DW      $3D44               ; Branch destination
            DB      $1F                 ; $3D41: BRANCH
            DW      $3D45               ; Branch destination
            DB      $9A                 ; $3D44: _VM_183A
            DB      $1B                 ; $3D45: literal16
            DW      $08C0               ; Inline cell
            DB      $1B                 ; $3D48: literal16
            DW      $7C12               ; Inline cell
            DB      $02                 ; $3D4B: !
            DB      $1B                 ; $3D4C: literal16
            DW      $7C18               ; Inline cell
            DB      $30                 ; $3D4F: _BONE
            DB      $9F                 ; $3D50: _VM_3B34
            DB      $1B                 ; $3D51: literal16
            DW      $7C18               ; Inline cell
            DB      $34                 ; $3D54: _BZERO
            DB      $0D                 ; $3D55: 0
            DB      $0E                 ; $3D56: inline base addition
            DW      $0B9B               ; Inline cell
            DB      $0F                 ; $3D59: _BMUSIC
            DB      $03                 ; $3D5A: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $A0                 ; $3D5C: DI
            DB      $0D                 ; $3D5D: 0
            DB      $1B                 ; $3D5E: literal16
            DW      RAM_IPNT            ; Inline cell
            DB      $1B                 ; $3D61: literal16
            DW      $0300               ; Inline cell
            DB      $44                 ; $3D64: FILL
            DB      $A1                 ; $3D65: _EMUSIC
            DB      $19                 ; $3D66: literal8
            DB      $11                 ; Inline byte
            DB      $7E                 ; $3D68: INP
            DB      $19                 ; $3D69: literal8
            DB      $10                 ; Inline byte
            DB      $1A                 ; $3D6B: AND
            DB      $19                 ; $3D6C: literal8
            DB      $10                 ; Inline byte
            DB      $1C                 ; $3D6E: XOR
            DB      $1B                 ; $3D6F: literal16
            DW      $7C1B               ; Inline cell
            DB      $04                 ; $3D72: B!
            DB      $19                 ; $3D73: literal8
            DB      $06                 ; Inline byte
            DB      $1B                 ; $3D75: literal16
            DW      $7C15               ; Inline cell
            DB      $04                 ; $3D78: B!
            DB      $19                 ; $3D79: literal8
            DB      $06                 ; Inline byte
            DB      $1B                 ; $3D7B: literal16
            DW      $7C15               ; Inline cell
            DB      $04                 ; $3D7E: B!
            DB      $1B                 ; $3D7F: literal16
            DW      $7C19               ; Inline cell
            DB      $30                 ; $3D82: _BONE
            DB      $1B                 ; $3D83: literal16
            DW      $7C1E               ; Inline cell
            DB      $30                 ; $3D86: _BONE
            DB      $7D                 ; $3D87: _VM_2F78
            DB      $7C                 ; $3D88: _FL
            DB      $7D                 ; $3D89: _VM_2F78
            DB      $8A                 ; $3D8A: _SGO
            DB      $03                 ; $3D8B: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $1B                 ; $3D8D: literal16
            DW      $7C08               ; Inline cell
            DB      $17                 ; $3D90: B@
            DB      $08                 ; $3D91: DUP
            DB      $1E                 ; $3D92: 0BRANCH
            DW      $3DA9               ; Branch destination
            DB      $1B                 ; $3D95: literal16
            DW      $7C0C               ; Inline cell
            DB      $17                 ; $3D98: B@
            DB      $27                 ; $3D99: -
            DB      $1B                 ; $3D9A: literal16
            DW      $7C1A               ; Inline cell
            DB      $17                 ; $3D9D: B@
            DB      $1E                 ; $3D9E: 0BRANCH
            DW      $3DA4               ; Branch destination
            DB      $1F                 ; $3DA1: BRANCH
            DW      $3DA9               ; Branch destination
            DB      $08                 ; $3DA4: DUP
            DB      $1E                 ; $3DA5: 0BRANCH
            DW      $3DA9               ; Branch destination
            DB      $59                 ; $3DA8: 2/
            DB      $1B                 ; $3DA9: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $17                 ; $3DAC: B@
            DB      $14                 ; $3DAD: +
            DB      $A2                 ; $3DAE: _VM_3D5B
            DB      $08                 ; $3DAF: DUP
            DB      $1E                 ; $3DB0: 0BRANCH
            DW      $3DBE               ; Branch destination
            DB      $1B                 ; $3DB3: literal16
            DW      RAM_CREDITS         ; Inline cell
            DB      $04                 ; $3DB6: B!
            DB      $1B                 ; $3DB7: literal16
            DW      $7C14               ; Inline cell
            DB      $30                 ; $3DBA: _BONE
            DB      $1F                 ; $3DBB: BRANCH
            DW      $3DBF               ; Branch destination
            DB      $07                 ; $3DBE: DROP
            DB      $1B                 ; $3DBF: literal16
            DW      $7C10               ; Inline cell
            DB      $30                 ; $3DC2: _BONE
            DB      $9F                 ; $3DC3: _VM_3B34
            DB      $1B                 ; $3DC4: literal16
            DW      $7C1F               ; Inline cell
            DB      $34                 ; $3DC7: _BZERO
            DB      $03                 ; $3DC8: RETURN
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $3DCA: literal8
            DB      $10                 ; Inline byte
            DB      $7E                 ; $3DCC: INP
            DB      $08                 ; $3DCD: DUP
            DB      $19                 ; $3DCE: literal8
            DB      $10                 ; Inline byte
            DB      $1A                 ; $3DD0: AND
            DB      $19                 ; $3DD1: literal8
            DB      $10                 ; Inline byte
            DB      $1C                 ; $3DD3: XOR
            DB      $1E                 ; $3DD4: 0BRANCH
            DW      $3DF0               ; Branch destination
            DB      $07                 ; $3DD7: DROP
            DB      $1B                 ; $3DD8: literal16
            DW      $7C06               ; Inline cell
            DB      $30                 ; $3DDB: _BONE
            DB      $A3                 ; $3DDC: _VM_3D0B
            DB      $1B                 ; $3DDD: literal16
            DW      $0800               ; Inline cell
            DB      $1B                 ; $3DE0: literal16
            DW      $7000               ; Inline cell
            DB      $1B                 ; $3DE3: literal16
            DW      $0498               ; Inline cell
            DB      $1B                 ; $3DE6: literal16
            DW      $0504               ; Inline cell
            DB      $1B                 ; $3DE9: literal16
            DW      $0828               ; Inline cell
            DB      $2A                 ; $3DEC: _WRITE
            DB      $1F                 ; $3DED: BRANCH
            DW      $3E10               ; Branch destination
            DB      $1B                 ; $3DF0: literal16
            DW      $7C8A               ; Inline cell
            DB      $17                 ; $3DF3: B@
            DB      $1E                 ; $3DF4: 0BRANCH
            DW      $3DFB               ; Branch destination
            DB      $07                 ; $3DF7: DROP
            DB      $1F                 ; $3DF8: BRANCH
            DW      $3E10               ; Branch destination
            DB      $19                 ; $3DFB: literal8
            DB      $20                 ; Inline byte
            DB      $1A                 ; $3DFD: AND
            DB      $19                 ; $3DFE: literal8
            DB      $20                 ; Inline byte
            DB      $1C                 ; $3E00: XOR
            DB      $1E                 ; $3E01: 0BRANCH
            DW      $3E10               ; Branch destination
            DB      $1B                 ; $3E04: literal16
            DW      $7C09               ; Inline cell
            DB      $17                 ; $3E07: B@
            DB      $1E                 ; $3E08: 0BRANCH
            DW      $3E0F               ; Branch destination
            DB      $1B                 ; $3E0B: literal16
            DW      $7C1A               ; Inline cell
            DB      $30                 ; $3E0E: _BONE
            DB      $A3                 ; $3E0F: _VM_3D0B
            DB      $03                 ; $3E10: RETURN

;=========================================================================================
; ----> _TERSECHK  Native entry $3E11
;=========================================================================================
            rst     $08
            dec     c
            ld      e,e
            rlca
            dec     de
            and     a
            ld      a,h
            rla
            ld      e,$1D
            ld      a,$9F
            dec     de
            cp      h
            ld      a,h
            rla
            ld      e,$25
            ld      a,$A4
            dec     de
            cp      e
            ld      a,h
            rla
            ld      e,$2D
            ld      a,$A5
            dec     de
            inc     d
            ld      a,h
            rla
            ld      e,$35
            ld      a,$9D
            dec     de
            rra
            ld      a,h
            rla
            ld      e,$3D
            ld      a,$A6
            dec     de
            sbc     a,a
            ld      a,h
            rla
            ld      e,$45
            ld      a,$A7
            dec     de
            or      h
            ld      a,h
            rla
            ld      e,$4D
            ld      a,$A8
            inc     bc

;=========================================================================================
; ----> _SENTRY  Native entry $3E4E
;=========================================================================================
            push    bc
            ld      a,(RAM_TAKEFIELD)
            and     a
            call    z,buttonchk
            ld      a,(RAM_PITCHTIME)
            and     a
            call    nz,_TBALLPITCH
            ld      a,(RAM_OFTOTBL)
            and     a
            call    nz,ofldtbl
            ld      a,(RAM_THROWTIME)
            and     a
            call    nz,throwball
            ld      a,(RAM_THROWANM)
            and     a
            call    nz,throwanim
            ld      a,(RAM_HITTIME)
            and     a
            call    nz,bathit
            ld      a,(RAM_CAUGHT)
            and     a
            call    nz,chkcaught
            ld      a,(RAM_SCRTIME)
            and     a
            call    nz,chkscrtime
            ld      bc,$3E8D
            jp      _TERSECHK
            DB      $A9, $00            ; Resume the native sentry loop

;=========================================================================================
; ----> sentry_resume  Native entry $3E8F
;=========================================================================================
            pop     bc
            jp      _SENTRY
            jp      (iy)
            rst     $08                 ; Enter the inline TERSE thread
            DB      $19                 ; $3E96: literal8
            DB      $C0                 ; Inline byte
            DB      $19                 ; $3E98: literal8
            DB      $0A                 ; Inline byte
            DB      $4B                 ; $3E9A: OUTP
            DB      $0D                 ; $3E9B: 0
            DB      $19                 ; $3E9C: literal8
            DB      $09                 ; Inline byte
            DB      $4B                 ; $3E9E: OUTP
            DB      $A2                 ; $3E9F: _VM_3D5B
            DB      $1B                 ; $3EA0: literal16
            DW      $7C10               ; Inline cell
            DB      $30                 ; $3EA3: _BONE
            DB      $9F                 ; $3EA4: _VM_3B34
            DB      $AA                 ; $3EA5: _SENTRY
            db      $03                 ; NEXT
;=========================================================================================
; ----> TOKEN_TABLE  Byte-TERSE dispatch addresses ($3EA7-$3FFE)
; The dispatcher indexes this table with twice the token byte.
;=========================================================================================
            DW      $0000               ; Token $00: RESET
            DW      _SWAP               ; Token $01: SWAP
            DW      _bang               ; Token $02: !
            DW      _RETURN             ; Token $03: RETURN
            DW      _Bbang              ; Token $04: B!
            DW      _ROT                ; Token $05: ROT
            DW      _2DUP               ; Token $06: 2DUP
            DW      _DROP               ; Token $07: DROP
            DW      _DUP                ; Token $08: DUP
            DW      _1plus              ; Token $09: 1+
            DW      _1minus             ; Token $0A: 1-
            DW      _BMOVE              ; Token $0B: BMOVE
            DW      $09B6               ; Token $0C: native entry $09B6
            DW      _0                  ; Token $0D: 0
            DW      _plusbang           ; Token $0E: inline base addition
            DW      _BMUSIC             ; Token $0F: _BMUSIC
            DW      cpost               ; Token $10: cpost
            DW      _3DROP              ; Token $11: _3DROP
            DW      _COUNT              ; Token $12: COUNT
            DW      _OVER               ; Token $13: OVER
            DW      _plus               ; Token $14: +
            DW      _DO                 ; Token $15: DO
            DW      _Rat                ; Token $16: I / R@
            DW      _Bat                ; Token $17: B@
            DW      _LOOP               ; Token $18: LOOP
            DW      _LITbyte            ; Token $19: literal8
            DW      _AND                ; Token $1A: AND
            DW      _LITERAL            ; Token $1B: literal16
            DW      _XOR                ; Token $1C: XOR
            DW      _OR                 ; Token $1D: OR
            DW      _0BRANCH            ; Token $1E: 0BRANCH
            DW      _BRANCH             ; Token $1F: BRANCH
            DW      _SWABN              ; Token $20: SWAN
            DW      _dpost              ; Token $21: _dpost
            DW      _1                  ; Token $22: 1
            DW      _SBSTORE            ; Token $23: _SBSTORE
            DW      _at                 ; Token $24: @
            DW      _EI                 ; Token $25: EI
            DW      _equal              ; Token $26: =
            DW      _minus              ; Token $27: -
            DW      _zeroequal          ; Token $28: 0=
            DW      _CPOST              ; Token $29: _CPOST
            DW      _WRITE              ; Token $2A: _WRITE
            DW      _PTAUTOTM           ; Token $2B: _PTAUTOTM
            DW      _HOM                ; Token $2C: _HOM
            DW      _VIS                ; Token $2D: _VIS
            DW      _Aquote             ; Token $2E: counted string
            DW      _SPOST              ; Token $2F: _SPOST
            DW      _BONE               ; Token $30: _BONE
            DW      _EX                 ; Token $31: _EX
            DW      $12D6               ; Token $32: native entry $12D6
            DW      $12E5               ; Token $33: native entry $12E5
            DW      _BZERO              ; Token $34: _BZERO
            DW      _FLSHTON            ; Token $35: _FLSHTON
            DW      _DWAIT              ; Token $36: _DWAIT
            DW      $12EA               ; Token $37: native entry $12EA
            DW      _VM_170E            ; Token $38: _VM_170E
            DW      $1728               ; Token $39: native entry $1728
            DW      _SWAB               ; Token $3A: SWAB
            DW      $1737               ; Token $3B: native entry $1737
            DW      _VM_178A            ; Token $3C: _VM_178A
            DW      _2minus             ; Token $3D: 2-
            DW      _PICK               ; Token $3E: PICK
            DW      _2plus              ; Token $3F: 2+
            DW      _VM_1772            ; Token $40: _VM_1772
            DW      _NPICK              ; Token $41: NDUP
            DW      _VM_1766            ; Token $42: _VM_1766
            DW      _SUP                ; Token $43: _SUP
            DW      _FILL               ; Token $44: FILL
            DW      _NPOST              ; Token $45: _NPOST
            DW      _VM_18E9            ; Token $46: _VM_18E9
            DW      _VM_18F8            ; Token $47: _VM_18F8
            DW      _VM_184E            ; Token $48: _VM_184E
            DW      _VM_1844            ; Token $49: _VM_1844
            DW      _VM_1437            ; Token $4A: _VM_1437
            DW      _OUTP               ; Token $4B: OUTP
            DW      _VM_1790            ; Token $4C: _VM_1790
            DW      _VM_17B9            ; Token $4D: _VM_17B9
            DW      _WRITR              ; Token $4E: _WRITR
            DW      _FMIRROR            ; Token $4F: _FMIRROR
            DW      _OUTLINE            ; Token $50: _OUTLINE
            DW      _VM_1885            ; Token $51: _VM_1885
            DW      _VM_17F3            ; Token $52: _VM_17F3
            DW      _VM_1907            ; Token $53: _VM_1907
            DW      _RUN3CHK            ; Token $54: _RUN3CHK
            DW      _RUN2CHK1ST         ; Token $55: _RUN2CHK1ST
            DW      _RUN2CHK12ND        ; Token $56: _RUN2CHK12ND
            DW      _RUN2CHK            ; Token $57: _RUN2CHK
            DW      _RUN1CHK2ND         ; Token $58: _RUN1CHK2ND
            DW      _2slash             ; Token $59: 2/
            DW      _RUN1CHK1ST         ; Token $5A: _RUN1CHK1ST
            DW      _RND                ; Token $5B: RND
            DW      _less_than          ; Token $5C: <
            DW      _greater_than       ; Token $5D: >
            DW      _HRBY2              ; Token $5E: _HRBY2
            DW      _2ROT               ; Token $5F: _2ROT
            DW      $1DC6               ; Token $60: native entry $1DC6
            DW      _VM_1CC8            ; Token $61: _VM_1CC8
            DW      $1DBC               ; Token $62: native entry $1DBC
            DW      _1plusBat           ; Token $63: 1+B!
            DW      _VM_0CE7            ; Token $64: _VM_0CE7
            DW      _SSTORE             ; Token $65: _SSTORE
            DW      _VM_1D0E            ; Token $66: _VM_1D0E
            DW      _VM_1DF2            ; Token $67: _VM_1DF2
            DW      _VM_1D4E            ; Token $68: _VM_1D4E
            DW      _SWALK              ; Token $69: _SWALK
            DW      _WHBODDS            ; Token $6A: _WHBODDS
            DW      $1C86               ; Token $6B: native entry $1C86
            DW      _WUPGO              ; Token $6C: _WUPGO
            DW      _VM_1D7B            ; Token $6D: _VM_1D7B
            DW      _SFOUL              ; Token $6E: _SFOUL
            DW      _SSAFE              ; Token $6F: _SSAFE
            DW      _ARRAY              ; Token $70: word-array index
            DW      _VM_1F3A            ; Token $71: _VM_1F3A
            DW      $21B6               ; Token $72: native entry $21B6
            DW      _2star              ; Token $73: 2*
            DW      _RETPA              ; Token $74: _RETPA
            DW      _VM_2919            ; Token $75: _VM_2919
            DW      _STFLD              ; Token $76: _STFLD
            DW      _SETTFPA            ; Token $77: _SETTFPA
            DW      _INTSTART           ; Token $78: _INTSTART
            DW      _DP1CN              ; Token $79: _DP1CN
            DW      _VM_11C4            ; Token $7A: _VM_11C4
            DW      _DP12CN             ; Token $7B: _DP12CN
            DW      _FL                 ; Token $7C: _FL
            DW      _VM_2F78            ; Token $7D: _VM_2F78
            DW      _INP                ; Token $7E: INP
            DW      _not_equal          ; Token $7F: <>
            DW      _VM_3073            ; Token $80: _VM_3073
            DW      $329D               ; Token $81: native entry $329D
            DW      $341E               ; Token $82: native entry $341E
            DW      $3426               ; Token $83: native entry $3426
            DW      _VM_1441            ; Token $84: _VM_1441
            DW      _VM_3501            ; Token $85: _VM_3501
            DW      _VM_351A            ; Token $86: _VM_351A
            DW      $367E               ; Token $87: native entry $367E
            DW      $3717               ; Token $88: native entry $3717
            DW      $37D9               ; Token $89: native entry $37D9
            DW      _SGO                ; Token $8A: _SGO
            DW      _DP1                ; Token $8B: _DP1
            DW      _SPLR12             ; Token $8C: _SPLR12
            DW      _ZERO               ; Token $8D: ZERO
            DW      _VM_384C            ; Token $8E: _VM_384C
            DW      _VM_3ABF            ; Token $8F: _VM_3ABF
            DW      _CONGR              ; Token $90: _CONGR
            DW      _VM_3967            ; Token $91: _VM_3967
            DW      _VM_12F5            ; Token $92: _VM_12F5
            DW      _DPCN               ; Token $93: _DPCN
            DW      _VM_3050            ; Token $94: _VM_3050
            DW      _TCNT               ; Token $95: _TCNT
            DW      _WUPWRT             ; Token $96: _WUPWRT
            DW      _VM_2887            ; Token $97: _VM_2887
            DW      _VM_2A7E            ; Token $98: _VM_2A7E
            DW      _INNODDS            ; Token $99: _INNODDS
            DW      _VM_183A            ; Token $9A: _VM_183A
            DW      _VM_30F5            ; Token $9B: _VM_30F5
            DW      _VM_3A56            ; Token $9C: _VM_3A56
            DW      _VM_3559            ; Token $9D: _VM_3559
            DW      _VM_30A0            ; Token $9E: _VM_30A0
            DW      _VM_3B34            ; Token $9F: _VM_3B34
            DW      _DI                 ; Token $A0: DI
            DW      _EMUSIC             ; Token $A1: _EMUSIC
            DW      _VM_3D5B            ; Token $A2: _VM_3D5B
            DW      _VM_3D0B            ; Token $A3: _VM_3D0B
            DW      _VM_3CE1            ; Token $A4: _VM_3CE1
            DW      _VM_3DC9            ; Token $A5: _VM_3DC9
            DW      _VM_3D8C            ; Token $A6: _VM_3D8C
            DW      _STRINGPRC          ; Token $A7: _STRINGPRC
            DW      _VM_3725            ; Token $A8: _VM_3725
            DW      sentry_resume       ; Token $A9: sentry_resume
            DW      _SENTRY             ; Token $AA: _SENTRY
            DW      $0102               ; Token $AB: native entry $0102
            DB      $80                 ; Final ROM byte at $3FFF
            END
