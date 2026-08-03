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

;=========================================================================================
; COLD START ENTRY POINT ($0000 - $0007)
;=========================================================================================
            nop
            nop
            di                              ; Disable interrupts
            jp      L0015                   ; Jump over RST $08 vector
            nop
            nop

;=========================================================================================
; TERSE INNER INTERPRETER ENTRY: _ENTER / RST $08 ($0008 - $0014)
;=========================================================================================
_ENTER:
            dec     ix
            ld      (ix+$00),b              ; Save current Instruction Pointer (BC)
            dec     ix                      ; onto Return Stack (IX)
            ld      (ix+$00),c
            pop     bc                      ; Fetch next Thread Pointer into BC
            jp      (iy)                    ; Dispatch TERSE word

;=========================================================================================
; HARDWARE & TERSE STACK INITIALIZATION ($0015 - $002A)
;=========================================================================================
L0015:
            ld      a,$01
            out     ($08),a                 ; Set High Resolution mode

            ld      b,$00                   ; Loop 256 times to clear/init stacks
L001B:
            ld      ix,$8000                ; Set Return Stack Pointer (RSP)
            ld      sp,$7F80                ; Set Parameter Stack Pointer (PSP)
            djnz    L001B

            ld      bc,L3E96                ; Set initial TERSE Instruction Pointer
            ld      iy,$002B                ; Set TERSE Dispatcher address

;=========================================================================================
; ----> NEXT           TERSE INNER INTERPRETER DISPATCHER  ($002B - $0039)
;   Inner interpreter dispatcher loop. Fetches the next opcode byte from
;   the Instruction Pointer (BC), indexes the primitive jump table at $3EA7,
;   and branches to the target execution routine.
;=========================================================================================
_NEXT:
            ld      a,(bc)
            inc     bc
            ld      de,$3EA7
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
            ld      c,(ix+$00)              ; Pop LSB of saved IP from Return Stack
            inc     ix
            ld      b,(ix+$00)              ; Pop MSB of saved IP from Return Stack
            inc     ix
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> LITERAL        16-BIT INLINE LITERAL  ($0046 - $004E)
;   Reads a 16-bit word from the TERSE instruction stream and pushes it
;   onto the parameter stack. (Opcode: $1B)
;=========================================================================================
_LITERAL:
            ld      a,(bc)                  ; Read low byte from instruction pointer
            inc     bc                      ; Advance instruction pointer
            ld      l,a
            ld      a,(bc)                  ; Read high byte from instruction pointer
            inc     bc                      ; Advance instruction pointer
            ld      h,a
            push    hl                      ; Push 16-bit word onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> LITbyte        8-BIT INLINE LITERAL  ($004F - $0056)
;   Reads an 8-bit byte from the TERSE instruction stream, zero-extends
;   it to 16 bits, and pushes it onto the parameter stack. (Opcode: $19)
;=========================================================================================
_LITbyte:
            ld      a,(bc)                  ; Read literal byte from instruction pointer
            inc     bc                      ; Advance instruction pointer
            ld      l,a
            ld      h,$00                   ; Zero-extend high byte
            push    hl                      ; Push 16-bit value onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;===================================================================================================
; ----> DLIT           PUSH TWO INLINE 16-BIT LITERALS  ($0057 - $0060)
;   Fetches two consecutive 16-bit words from the instruction stream (BC)
;   and pushes both onto the Parameter Stack.
;===================================================================================================
            ld      a,(bc)                  ; Read low byte of first literal word
            inc     bc                      ; Advance instruction pointer
            ld      l,a
            ld      a,(bc)                  ; Read high byte of first literal word
            inc     bc                      ; Advance instruction pointer
            ld      h,a
            push    hl                      ; Push first 16-bit word onto parameter stack
            jp      $0046                   ; Jump to _LITERAL to fetch/push second word

;===================================================================================================
; ----> +!             ADD INLINE OFFSET TO STACK WORD  ($0061 - $006B)
;   Pops a value from the Parameter Stack, reads a 16-bit inline offset from
;   the instruction stream, adds them together, and pushes the sum. (Opcode: $0E)
;===================================================================================================
            pop     hl                      ; Pop target value from parameter stack
            ld      a,(bc)                  ; Read low byte of inline offset
            inc     bc                      ; Advance instruction pointer
            ld      e,a
            ld      a,(bc)                  ; Read high byte of inline offset
            inc     bc                      ; Advance instruction pointer
            ld      d,a
            add     hl,de                   ; Add inline offset to popped value
            push    hl                      ; Push sum onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;===================================================================================================
; ----> ARRAY          CALCULATE WORD ARRAY ELEMENT ADDRESS  ($006C - $0070)
;   Pops an index from the Parameter Stack, doubles it for 16-bit word alignment,
;   and jumps to $0062 to add the inline base address and push the result.
;===================================================================================================
            pop     hl                      ; Pop array index from parameter stack
            add     hl,hl                   ; Double index for 16-bit word offset
            jp      $0062                   ; Jump to add inline base address and push

;===================================================================================================
; ----> 0              PUSH CONSTANT ZERO  ($0071 - $0076)
;   Pushes a 16-bit constant value of 0 onto the Parameter Stack. (Opcode: $0D)
;===================================================================================================
            ld      hl,$0000                ; Load 16-bit constant 0
            push    hl                      ; Push 0 onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;===================================================================================================
; ----> 1              PUSH CONSTANT ONE  ($0077 - $007C)
;   Pushes a 16-bit constant value of 1 onto the Parameter Stack. (Opcode: $22)
;===================================================================================================
            ld      hl,$0001                ; Load 16-bit constant 1
            push    hl                      ; Push 1 onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;===================================================================================================
; ----> DUP            DUPLICATE TOP STACK ITEM  ($007D - $0081)
;   Duplicates the top 16-bit value on the Parameter Stack. (Opcode: $08)
;===================================================================================================
            pop     hl                      ; Pop top value from parameter stack
            push    hl                      ; Push first copy back onto stack
            push    hl                      ; Push second copy onto stack
            jp      (iy)                    ; Return to TERSE inner interpreter
;===================================================================================================
; ----> 2DUP           DUPLICATE TOP TWO STACK ITEMS  ($0082 - $0089)
;   Duplicates the top two 16-bit values on the Parameter Stack. (Opcode: $06)
;===================================================================================================
            pop     hl                      ; Pop top value from parameter stack
            pop     de                      ; Pop second value from parameter stack
            push    de                      ; Push second value back
            push    hl                      ; Push top value back
            push    de                      ; Push duplicate of second value
            push    hl                      ; Push duplicate of top value
            jp      (iy)                    ; Return to TERSE inner interpreter

;===================================================================================================
; ----> DROP           DISCARD TOP STACK ITEM  ($008A - $008C)
;   Discards the top 16-bit value from the Parameter Stack. (Opcode: $07)
;===================================================================================================
            pop     hl                      ; Pop and discard top value from stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;===================================================================================================
; ----> SWAP           EXCHANGE TOP TWO STACK ITEMS  ($008D - $0092)
;   Exchanges the positions of the top two 16-bit values on the Parameter Stack. (Opcode: $01)
;===================================================================================================
            pop     hl                      ; Pop top value from parameter stack
            pop     de                      ; Pop second value from parameter stack
            push    hl                      ; Push top value into second position
            push    de                      ; Push second value into top position
            jp      (iy)                    ; Return to TERSE inner interpreter

;===================================================================================================
; ----> @              FETCH 16-BIT WORD FROM MEMORY  ($0093 - $0099)
;   Fetches the 16-bit word stored at the memory address on the Parameter Stack
;   and pushes the fetched value back onto the stack. (Opcode: $24)
;===================================================================================================
            pop     hl                      ; Pop target memory address from stack
            ld      e,(hl)                  ; Read low byte from memory address
            inc     hl                      ; Advance memory pointer
            ld      d,(hl)                  ; Read high byte from memory address
            push    de                      ; Push 16-bit fetched word onto stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> B@             FETCH BYTE FROM MEMORY  ($009A - $00A0)
;   Fetches the 8-bit byte stored at the memory address on the Parameter Stack,
;   zero-extends it to 16 bits, and pushes the result back onto the stack. (Opcode: $17)
;=========================================================================================
_Bat:
            pop     hl                      ; Pop memory address from parameter stack
            ld      e,(hl)                  ; Fetch byte from memory address
            ld      d,$00                   ; Zero-extend high byte
            push    de                      ; Push 16-bit zero-extended value
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> !              STORE 16-BIT WORD TO MEMORY  ($00A1 - $00A7)
;   Pops a 16-bit memory address and a 16-bit word value from the Parameter
;   Stack and stores the word into memory. (Opcode: $02)
;=========================================================================================
_bang:
            pop     hl                      ; Pop target memory address
            pop     de                      ; Pop 16-bit word value
            ld      (hl),e                  ; Write LSB to memory address
            inc     hl                      ; Advance memory pointer
            ld      (hl),d                  ; Write MSB to memory address
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> B!             STORE BYTE TO MEMORY  ($00A8 - $00AC)
;   Pops an 8-bit byte-address and a value from the Parameter Stack and stores
;   the low-order byte into memory. (Opcode: $04)
;=========================================================================================
_Bbang:
            pop     hl                      ; Pop target byte-address
            pop     de                      ; Pop byte value
            ld      (hl),e                  ; Store low-order byte to memory
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> ZERO           CLEAR 16-BIT WORD IN MEMORY  ($00AD - $00B4)
;   Pops a memory address from the Parameter Stack and clears the 16-bit word
;   at that location to zero. (Opcode: $73)
;=========================================================================================
_ZERO:
            pop     hl                      ; Pop target memory address
            ld      (hl),$00                ; Clear LSB in memory to zero
            inc     hl                      ; Advance memory pointer
            ld      (hl),$00                ; Clear MSB in memory to zero
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> +              16-BIT INTEGER ADDITION  ($00B5 - $00BA)
;   Pops two 16-bit values from the Parameter Stack, adds them together,
;   and pushes the 16-bit sum back onto the stack. (Opcode: $14)
;=========================================================================================
_plus:
            pop     de                      ; Pop second operand from parameter stack
            pop     hl                      ; Pop first operand from parameter stack
            add     hl,de                   ; Calculate 16-bit sum
            push    hl                      ; Push sum onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> -              16-BIT INTEGER SUBTRACTION  ($00BB - $00C2)
;   Pops two 16-bit values from the Parameter Stack, subtracts the top value
;   from the second value, and pushes the result. (Opcode: $1F)
;=========================================================================================
_minus:
            pop     de                      ; Pop subtrahend from parameter stack
            pop     hl                      ; Pop minuend from parameter stack
            xor     a                       ; Clear carry flag
            sbc     hl,de                   ; Subtract subtrahend from minuend
            push    hl                      ; Push difference onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 1-             DECREMENT TOP STACK ITEM  ($00C3 - $00C7)
;   Pops the top 16-bit value from the Parameter Stack, decrements it by 1,
;   and pushes the result back onto the stack. (Opcode: $0A)
;=========================================================================================
_1minus:
            pop     hl                      ; Pop target value from parameter stack
            dec     hl                      ; Decrement value by 1
            push    hl                      ; Push decremented result onto stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 1+             INCREMENT TOP STACK ITEM  ($00C8 - $00CC)
;   Pops the top 16-bit value from the Parameter Stack, increments it by 1,
;   and pushes the result back onto the stack. (Opcode: $09)
;=========================================================================================
_1plus:
            pop     hl                      ; Pop target value from parameter stack
            inc     hl                      ; Increment value by 1
            push    hl                      ; Push result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 2+             ADD TWO TO TOP STACK ITEM  ($00CD - $00D2)
;   Pops the top 16-bit value from the Parameter Stack, increments it by 2,
;   and pushes the result back onto the stack. (Opcode: $2A)
;=========================================================================================
_2plus:
            pop     hl                      ; Pop target value from parameter stack
            inc     hl                      ; Increment value by 1
            inc     hl                      ; Increment value by 1
            push    hl                      ; Push result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 2-             SUBTRACT TWO FROM TOP STACK ITEM  ($00D3 - $00D8)
;   Pops the top 16-bit value from the Parameter Stack, decrements it by 2,
;   and pushes the result back onto the stack. (Opcode: $2B)
;=========================================================================================
_2minus:
            pop     hl                      ; Pop target value from parameter stack
            dec     hl                      ; Decrement value by 1
            dec     hl                      ; Decrement value by 1
            push    hl                      ; Push result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 2*             MULTIPLY TOP STACK ITEM BY TWO  ($00D9 - $00DD)
;   Pops the top 16-bit value from the Parameter Stack, shifts it left by 1 bit,
;   and pushes the doubled value back onto the stack. (Opcode: $18)
;=========================================================================================
_2star:
            pop     hl                      ; Pop target value from parameter stack
            add     hl,hl                   ; Shift left 1 bit (multiply by 2)
            push    hl                      ; Push result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 2/             DIVIDE TOP STACK ITEM BY TWO  ($00DE - $00E5)
;   Pops the top 16-bit signed integer from the Parameter Stack, shifts it right
;   arithmetically by 1 bit, and pushes the quotient back onto the stack. (Opcode: $1A)
;=========================================================================================
_2slash:
            pop     hl                      ; Pop target value from parameter stack
            sra     h                       ; Arithmetic shift right high byte
            rr      l                       ; Rotate right low byte with carry
            push    hl                      ; Push result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> B@+7           FETCH CHARACTER AND STRIP HIGH BIT  ($00E6 - $00F1)
;   Fetches byte at address, advances pointer, strips bit 7 end-of-string flag,
;   and pushes the zero-extended character code and updated pointer.
;=========================================================================================
_Bat_inc7:
            pop     hl                      ; Pop string address from parameter stack
            ld      a,(hl)                  ; Read character byte
            inc     hl                      ; Advance string pointer
            push    hl                      ; Push updated string pointer
            ld      l,a                     ; Move character code to low byte
            res     7,l                     ; Strip bit 7 string-end flag
            ld      h,$00                   ; Zero-extend high byte
            push    hl                      ; Push character code onto stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 1+B!           INCREMENT BYTE IN MEMORY  ($00F2 - $00F5)
;   Pops a byte address from the Parameter Stack and increments the byte value
;   stored at that memory location by 1.
;=========================================================================================

_1plusBbang:
            pop     hl                      ; Pop target byte address
            inc     (hl)                    ; Increment byte value in memory
            jp      (iy)                    ; Return to TERSE inner interpreter
;=========================================================================================
; ----> =              EQUAL COMPARISON  ($00F6 - $00F7)
;   Pops two 16-bit values from the Parameter Stack, compares them, and pushes
;   1 (true) if they are equal or 0 (false) if they are not. (Opcode: $27)
;=========================================================================================
_equal:
            pop     de                      ; Pop second operand from parameter stack
            pop     hl                      ; Pop first operand from parameter stack
            xor     a                       ; Clear carry flag
            sbc     hl,de                   ; Compare operands via subtraction
            ld      hl,$0000                ; Default result to 0 (false)
            jp      nz,$0102                ; If not equal, skip to push false
            inc     hl                      ; Set result to 1 (true)
            push    hl                      ; Push boolean result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> <>             NOT EQUAL COMPARISON  ($0105 - $0113)
;   Pops two 16-bit values from the Parameter Stack, compares them, and pushes
;   1 (true) if they are not equal or 0 (false) if they are equal.
;=========================================================================================
_not_equal:
            pop     de                      ; Pop second operand from parameter stack
            pop     hl                      ; Pop first operand from parameter stack
            xor     a                       ; Clear carry flag
            sbc     hl,de                   ; Compare operands via subtraction
            ld      hl,$0000                ; Default result to 0 (false)
            jp      z,$0111                 ; If equal, skip to push false
            inc     hl                      ; Set result to 1 (true)
            push    hl                      ; Push boolean result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> <              SIGNED LESS THAN COMPARISON  ($0114 - $0127)
;   Pops two signed 16-bit integers from the Parameter Stack and pushes 1 (true)
;   if the first is strictly less than the second, otherwise 0 (false).
;=========================================================================================
_less:
            pop     de                      ; Pop second operand (n) from parameter stack
            pop     hl                      ; Pop first operand (m) from parameter stack
            xor     a                       ; Clear carry flag
            sbc     hl,de                   ; Compute m - n
            ld      de,$0000                ; Default result to 0 (false)
            push    af                      ; Save flags resulting from subtraction
            pop     hl                      ; Move flags into HL
            ld      a,l                     ; Extract Z80 status flags byte
            and     $84                     ; Mask Sign (bit 7) and Overflow (bit 2) flags
            jp      pe,$0125                ; If sign matches overflow flag, m >= n
            inc     de                      ; Set result to 1 (true, m < n)
            push    de                      ; Push boolean result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> >=             SIGNED GREATER OR EQUAL COMPARISON  ($0128 - $013B)
;   Pops two signed 16-bit integers from the Parameter Stack and pushes 1 (true)
;   if the first is greater than or equal to the second, otherwise 0 (false).
;=========================================================================================
_gt_equal:
            pop     de                      ; Pop second operand (n) from parameter stack
            pop     hl                      ; Pop first operand (m) from parameter stack
            xor     a                       ; Clear carry flag
            sbc     hl,de                   ; Compute m - n
            ld      de,$0000                ; Default result to 0 (false)
            push    af                      ; Save flags resulting from subtraction
            pop     hl                      ; Move flags into HL
            ld      a,l                     ; Extract Z80 status flags byte
            and     $84                     ; Mask Sign (bit 7) and Overflow (bit 2) flags
            jp      po,$0139                ; If sign differs from overflow flag, m < n
            inc     de                      ; Set result to 1 (true, m >= n)
            push    de                      ; Push boolean result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> >              SIGNED GREATER THAN COMPARISON  ($013C - $0140)
;   Pops two signed 16-bit integers from the Parameter Stack in reverse order
;   and branches to the signed less-than handler to evaluate m > n.
;=========================================================================================
_gt:
            pop     hl                      ; Pop first operand (m)
            pop     de                      ; Pop second operand (n)
            jp      $0116                   ; Jump into signed less-than evaluation

;=========================================================================================
; ----> 0=             TEST IF EQUAL TO ZERO  ($0141 - $0146)
;   Pops a 16-bit value from the Parameter Stack, sets second operand to 0,
;   and jumps into the equal comparison primitive. (Opcode: $28)
;=========================================================================================
_zeroequal:
            ld      de,$0000                ; Load 0 as second operand
            jp      $00F7                   ; Jump into equal comparison routine

;=========================================================================================
; ----> AND            BITWISE LOGICAL AND  ($0147 - $0151)
;   Pops two 16-bit words from the Parameter Stack, performs a bitwise AND,
;   and pushes the 16-bit logical result back onto the stack. (Opcode: $1A)
;=========================================================================================
_AND:
            pop     de                      ; Pop second 16-bit operand
            pop     hl                      ; Pop first 16-bit operand
            ld      a,l                     ; Perform bitwise AND on LSB
            and     e
            ld      l,a
            ld      a,h                     ; Perform bitwise AND on MSB
            and     d
            ld      h,a
            push    hl                      ; Push bitwise result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter
;=========================================================================================
; ----> OR             BITWISE LOGICAL INCLUSIVE OR  ($0152 - $015C)
;   Pops two 16-bit values from the Parameter Stack, performs a bitwise inclusive
;   OR operation, and pushes the result back onto the stack. (Opcode: $1D)
;=========================================================================================
_OR:
            pop     de                      ; Pop second 16-bit operand
            pop     hl                      ; Pop first 16-bit operand
            ld      a,l                     ; Perform bitwise OR on LSB
            or      e
            ld      l,a
            ld      a,h                     ; Perform bitwise OR on MSB
            or      d
            ld      h,a
            push    hl                      ; Push bitwise result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> XOR            BITWISE LOGICAL EXCLUSIVE OR  ($015D - $0167)
;   Pops two 16-bit words from the Parameter Stack, performs a bitwise Exclusive-OR,
;   and pushes the result back onto the stack. (Opcode: $1C)
;=========================================================================================
_XOR:
            pop     de                      ; Pop second 16-bit operand
            pop     hl                      ; Pop first 16-bit operand
            ld      a,l                     ; Perform bitwise XOR on LSB
            xor     e
            ld      l,a
            ld      a,h                     ; Perform bitwise XOR on MSB
            xor     d
            ld      h,a
            push    hl                      ; Push bitwise result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> FILL           BLOCK MEMORY COPY  ($0168 - $0175)
;   Block-transfers BC bytes from source address (HL) to destination address (DE).
;   Takes count, destination, and source from the Parameter Stack. (Opcode: $0B)
;=========================================================================================
_FILL:
            exx                             ; Save TERSE VM registers in alternate set
            pop     bc                      ; Pop byte count (u)
            pop     de                      ; Pop destination memory address
            pop     hl                      ; Pop source memory address
            ld      a,b                     ; Test if byte count is zero
            or      c
            jp      z,$0173                 ; If count is zero, skip block transfer
            ldir                            ; Block copy BC bytes from (HL) to (DE)
            exx                             ; Restore TERSE VM registers
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> DO             INITIALIZE COUNTED DO-LOOP  ($0176 - $0190)
;   Allocates a 3-word frame on the Return Stack (IX), pops initial index and limit
;   from the Parameter Stack, and stores loop state and calling IP. (Opcode: $15)
;=========================================================================================
_DO:
            ld      de,$FFFA                ; Offset to allocate 3 words on Return Stack
            add     ix,de                   ; Move Return Stack Pointer (IX) down 6 bytes
            pop     hl                      ; Pop loop initial index (x1)
            pop     de                      ; Pop loop limit value (x2)
            ld      (ix+$00),l              ; Store loop index LSB on Return Stack
            ld      (ix+$01),h              ; Store loop index MSB on Return Stack
            ld      (ix+$02),e              ; Store loop limit LSB on Return Stack
            ld      (ix+$03),d              ; Store loop limit MSB on Return Stack
            ld      (ix+$04),c              ; Store current IP LSB (loop body start)
            ld      (ix+$05),b              ; Store current IP MSB (loop body start)
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> LOOP           INCREMENT AND TEST DO-LOOP  ($0191 - $01BE)
;   Increments the innermost DO-loop index on the Return Stack by 1 and checks
;   against the limit. Branches back to loop start or deallocates frame. (Opcode: $18)
;=========================================================================================
_LOOP:
            ld      l,(ix+$00)              ; Read current loop index from Return Stack
            ld      h,(ix+$01)
            inc     hl                      ; Increment loop index by 1
            ld      (ix+$00),l              ; Store updated index back to Return Stack
            ld      (ix+$01),h
            ld      e,(ix+$02)              ; Read loop limit value from Return Stack
            ld      d,(ix+$03)
            xor     a                       ; Clear carry flag
            sbc     hl,de                   ; Compare index against limit (index - limit)
            push    af                      ; Save comparison flags
            pop     hl                      ; Move flags into HL
            ld      a,l                     ; Extract status flags byte
            and     $84                     ; Mask Sign (bit 7) and Overflow (bit 2) flags
            jp      po,$01B7                ; If sign matches overflow, loop continues
            ld      de,$0006                ; Loop complete: deallocate 3-word loop frame
            add     ix,de                   ; Advance Return Stack Pointer (IX)
            jp      $01BD                   ; Jump to exit loop and return to interpreter
            ld      c,(ix+$04)              ; Loop continues: reload loop start IP into BC
            ld      b,(ix+$05)
            jp      (iy)                    ; Return to TERSE inner interpreter
;=========================================================================================
; ----> R@             FETCH FROM RETURN STACK  ($01BF - $01C7)
;   Copies the top 16-bit word from the Return Stack (IX) without popping it
;   and pushes the value onto the Parameter Stack. (Opcode: $16)
;=========================================================================================
_Rgt:
            ld      l,(ix+$00)              ; Read Return Stack top LSB
            ld      h,(ix+$01)              ; Read Return Stack top MSB
            push    hl                      ; Push copied word onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> OVER           DUPLICATE SECOND STACK ITEM  ($01C8 - $01CE)
;   Copies the second 16-bit word on the Parameter Stack to the top of the stack.
;   (Opcode: $13)
;=========================================================================================
_OVER:
            pop     hl                      ; Pop top value from parameter stack
            pop     de                      ; Pop second value from parameter stack
            push    de                      ; Push second value back
            push    hl                      ; Push top value back
            push    de                      ; Push copy of second value onto stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> SWAB           SWAP HIGH AND LOW BYTES  ($01CF - $01D5)
;   Pops a 16-bit word from the Parameter Stack, exchanges its high and low bytes,
;   and pushes the byte-swapped word back onto the stack.
;=========================================================================================
_SWAB:
            pop     hl                      ; Pop target word from parameter stack
            ld      e,l                     ; Swap high and low bytes via DE register
            ld      l,h
            ld      h,e
            push    hl                      ; Push byte-swapped word onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> OUTP           OUTPUT BYTE TO HARDWARE PORT  ($01D6 - $01DD)
;   Pops 16-bit port number (BC) and 8-bit data value (L) from Parameter Stack
;   and writes data to the specified hardware output port. (Opcode: $4B)
;=========================================================================================
_OUTP:
            exx                             ; Save TERSE VM registers in alternate set
            pop     bc                      ; Pop 16-bit port address (C=port, B=sub-port)
            pop     hl                      ; Pop 16-bit value (L = 8-bit data byte)
            out     (c),l                   ; Output byte L to hardware port C
            exx                             ; Restore TERSE VM registers
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> INP            INPUT BYTE FROM HARDWARE PORT  ($01DE - $01E7)
;   Pops 16-bit port number (BC) from Parameter Stack, reads an 8-bit byte from
;   the hardware port, zero-extends it, and pushes the result. (Opcode: $7E)
;=========================================================================================
_INP:
            exx                             ; Save TERSE VM registers in alternate set
            pop     bc                      ; Pop 16-bit port address (C=port, B=sub-port)
            in      l,(c)                   ; Read byte from hardware port C into L
            ld      h,$00                   ; Zero-extend high byte
            push    hl                      ; Push 16-bit input value onto parameter stack
            exx                             ; Restore TERSE VM registers
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> ROT            ROTATE TOP THREE STACK ITEMS  ($01E8 - $01EE)
;   Rotates the top three 16-bit items on the Parameter Stack, bringing the
;   third item (deepest) to the top position. (Opcode: $05)
;=========================================================================================
_ROT:
            pop     de                      ; Pop top value (first item)
            pop     hl                      ; Pop second value
            ex      (sp),hl                 ; Swap second value with third value on stack
            push    de                      ; Push top value into second position
            push    hl                      ; Push third value into top position
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> PICK           FETCH N-TH STACK ITEM  ($01EF - $01F8)
;   Pops 1-based index (n) from Parameter Stack, calculates stack frame offset
;   relative to SP, fetches the 16-bit word, and pushes it onto the stack.
;=========================================================================================
_PICK:
            pop     hl                      ; Pop 1-based stack index (n)
            dec     hl                      ; Convert to 0-based offset
            add     hl,hl                   ; Convert word index to byte offset
            add     hl,sp                   ; Calculate stack memory address
            ld      e,(hl)                  ; Read low byte from target stack location
            inc     hl                      ; Advance pointer
            ld      d,(hl)                  ; Read high byte from target stack location
            push    de                      ; Push indexed word onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> BRANCH         UNCONDITIONAL INSTRUCTION BRANCH  ($01F9 - $0200)
;   Reads a 16-bit destination address from the instruction stream (BC)
;   and updates the Instruction Pointer to branch unconditionally. (Opcode: $1F)
;=========================================================================================
_BRANCH:
            ld      a,(bc)                  ; Fetch destination LSB from instruction stream
            ld      e,a
            inc     bc                      ; Advance instruction pointer
            ld      a,(bc)                  ; Fetch destination MSB from instruction stream
            ld      b,a                     ; Load new IP high byte
            ld      c,e                     ; Load new IP low byte
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> 0BRANCH        BRANCH IF ZERO / FALSE  ($0201 - $020A)
;   Pops a boolean flag from Parameter Stack. If 0 (false), branches to inline
;   destination address; if non-zero (true), skips destination word. (Opcode: $1E)
;=========================================================================================
_0BRANCH:
            pop     hl                      ; Pop boolean test flag from parameter stack
            ld      a,h                     ; Test if 16-bit flag is zero
            or      l
            jp      z,$020B                 ; If zero (false), branch to load jump address
            inc     bc                      ; If non-zero (true), skip inline jump address
            inc     bc
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> A"             INLINE STRING ADDRESS / SKIP  ($020B - $0218)
;   Pushes current Instruction Pointer (string base address) onto stack and skips
;   IP past the length-prefixed inline string data.
;=========================================================================================
_Aquote:
            jp      $01F9                   ; Jump to branch handler
            push    bc                      ; Push string address onto parameter stack
            ld      a,(bc)                  ; Read string length byte from stream
            inc     bc                      ; Advance pointer past length byte
            ld      l,a                     ; Load length into L
            ld      h,$00                   ; Zero-extend length
            add     hl,bc                   ; Calculate address past string data
            ld      b,h                     ; Update Instruction Pointer (BC)
            ld      c,l
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> TERSE_EXEC     EXECUTE HIGH-LEVEL TERSE DEFINITION  ($0219 - $021C)
;   Enters TERSE execution mode via RST $08 and sets the instruction thread
;   pointer to $0302.
;=========================================================================================
            rst     $08                     ; Enter TERSE inner interpreter
            ld      bc,$0302                ; Load instruction thread address into IP

;=========================================================================================
; ----> ENDINT         RESTORE CONTEXT & EXIT INTERRUPT  ($021D - $022C)
;   Restores CPU register context from stack, re-enables interrupts, and returns
;   from hardware interrupt processing to background context. (Opcode: $23)
;=========================================================================================
_ENDINT:
            rst     $08                     ; Enter TERSE inner interpreter
            ld      bc,$0304                ; Load continuation thread address
            pop     af                      ; Restore primary accumulator & flags
            pop     bc                      ; Restore primary BC registers
            pop     de                      ; Restore primary DE registers
            pop     hl                      ; Restore primary HL registers
            exx                             ; Switch to alternate register set
            ex      af,af'                  ; Switch to alternate AF flags
            pop     af                      ; Restore alternate accumulator & flags
            pop     bc                      ; Restore alternate BC registers
            pop     de                      ; Restore alternate DE registers
            pop     hl                      ; Restore alternate HL registers
            ei                              ; Enable hardware interrupts
            ret                             ; Return from interrupt service routine

;=========================================================================================
; ----> INTSTART       INITIALIZE IM2 INTERRUPT VECTOR  ($022D - $0241)
;   Pops vector address from Parameter Stack, stores it at $7C00, configures Z80
;   Interrupt Page Register I=$7C, and enables Interrupt Mode 2. (Opcode: $78)
;=========================================================================================
_INTSTART:
            di                              ; Disable interrupts during vector setup
            pop     hl                      ; Pop interrupt handler address from stack
            ld      ($7C00),hl              ; Store handler address in vector table
            ld      a,$08                   ; Set interrupt mode control
            out     ($0E),a
            ld      a,$7C                   ; Load vector table high page byte
            ld      i,a                     ; Set Z80 Interrupt Vector Register
            ld      a,$00
            out     ($0D),a                 ; Clear interrupt vector register
            im      2                       ; Set Z80 Interrupt Mode 2
            ei                              ; Enable interrupts
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> DI             DISABLE INTERRUPTS  ($0242 - $0244)
;   Disables hardware interrupts and returns to inner interpreter. (Opcode: $A0)
;=========================================================================================
_DI:
            di                              ; Disable hardware interrupts
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> EI             ENABLE INTERRUPTS  ($0245 - $0247)
;   Enables hardware interrupts and returns to inner interpreter. (Opcode: $25)
;=========================================================================================
_EI:
            ei                              ; Enable hardware interrupts
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> SWABN          SWAP LOW BYTE NIBBLES  ($0248 - $0252)
;   Pops 16-bit word from Parameter Stack, rotates low byte nibbles 4 bits left,
;   and pushes the result back onto the stack. (Opcode: $20)
;=========================================================================================
_SWABN:
            pop     hl                      ; Pop target word from parameter stack
            ld      a,l                     ; Extract low byte
            rlca                            ; Rotate nibbles left 4 bits
            rlca
            rlca
            rlca
            ld      l,a                     ; Store swapped nibble byte back into L
            push    hl                      ; Push result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> FILLSUB        FILL MEMORY SUBROUTINE  ($0253 - $025F)
;   High-level TERSE thread executed via Opcode $44. Reorders stack arguments
;   (fill, addr, count) and calls the core FILL primitive ($0168).
;=========================================================================================
_FILLSUB:
            rst     $08                     ; Enter TERSE inner interpreter
            DB      $05                     ; ROT
            DB      $05                     ; ROT
            DB      $06                     ; 2DUP
            DB      $02                     ; !
            DB      $01                     ; SWAP
            DB      $07                     ; DROP
            DB      $08                     ; DUP
            DB      $09                     ; 1+
            DB      $05                     ; ROT
            DB      $0A                     ; 1-
            DB      $0B                     ; FILL
            DB      $03                     ; NEXT

;=========================================================================================
; ----> NPICK          PUSH COPIES OF NTH STACK ITEM  ($0260 - $0274)
;   Pops item count from stack, iterates through parameter stack frame, and pushes
;   copied 16-bit words back onto the Parameter Stack.
;=========================================================================================
_NPICK:
            exx                             ; Save TERSE VM registers in alternate set
            pop     bc                      ; Pop item count from parameter stack
            dec     c                       ; Decrement loop count
            ld      hl,$0001                ; Offset to target stack frame
            add     hl,sp                   ; Add stack pointer
            add     hl,bc                   ; Multiply count by 2 for word offset
            add     hl,bc
L0269:
            ld      d,(hl)                  ; Read high byte from stack
            dec     hl                      ; Decrement stack pointer
            ld      e,(hl)                  ; Read low byte from stack
            push    de                      ; Push copied word onto stack
            dec     hl                      ; Decrement stack pointer
            dec     c                       ; Decrement loop counter
            jp      p,L0269                 ; Loop until all requested items copied
            exx                             ; Restore TERSE VM registers
            jp      (iy)                    ; Return to TERSE inner interpreter

;=========================================================================================
; ----> D*             32-BIT RANDOM / DOUBLE MULTIPLY  ($0275 - $02D0)
;   Advances 32-bit LCG random seed at $7C02/$7C04 and performs a 32-bit unsigned
;   multiplication, pushing the product onto the Parameter Stack.
;=========================================================================================
_Dstar:
            exx                             ; Save TERSE VM registers in alternate set
            ld      bc,($7C02)              ; Load low 16 bits of 32-bit random seed
            ld      hl,$1321                ; Low word of 32-bit LCG multiplier
            add     hl,bc                   ; Accumulate low word
            push    hl                      ; Save intermediate low result on stack
            ld      hl,$2776                ; High word of 32-bit LCG multiplier
            adc     hl,bc                   ; Accumulate high word
            ld      de,($7C04)              ; Load high 16 bits of 32-bit random seed
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
            ld      ($7C02),hl              ; Store updated low word of random seed
            pop     hl
            adc     hl,de
            ld      ($7C04),hl              ; Store updated high word of random seed
            exx                             ; Switch to primary register set
            ld      hl,$0000                ; Clear 32-bit accumulator low word
            ld      d,h                     ; Clear 32-bit accumulator high word
            ld      e,l
            exx                             ; Switch to alternate register set
            ex      de,hl                   ; Move multiplicand into DE
            pop     bc                      ; Pop multiplier operand from stack
            ld      hl,$0000                ; Clear product low word
L02AF:
            srl     b                       ; Shift multiplier right 1 bit
            rr      c
            jp      nc,L02BB                ; If bit 0 clear, skip addition
            add     hl,de                   ; Add multiplicand to product low word
            exx                             ; Switch to primary set for high word add
            adc     hl,de                   ; Add multiplicand to product high word
            exx                             ; Switch back to alternate set
L02BB:
            ld      a,b                     ; Test if multiplier is zero
            or      c
            jp      z,L02CD                 ; If zero, multiplication complete
            sla     e                       ; Shift multiplicand left 1 bit
            rl      d
            exx                             ; Switch to primary set for high word shift
            rl      e
            rl      d
            exx                             ; Switch back to alternate set
            jp      L02AF                   ; Continue multiplication loop
L02CD:
            exx                             ; Switch to primary set
            push    hl                      ; Push result onto parameter stack
            jp      (iy)                    ; Return to TERSE inner interpreter
;******************************************************************************

L02D3:
            DB      $00, $00, $00, $00, $00     ; $02D3 - $02DA:
            DB      $00, $00, $00, $00, $00

CHRTBL:
            DB      $3C, $7E, $66, $66, $66  ; $02DB: Character '0' (bytes 1-5)
            DB      $66, $66, $66, $7E, $3C  ; $02E0: Character '0' (bytes 6-10)

            DB      $18, $38, $18, $18, $18  ; $02E5: Character '1' (bytes 1-5)
            DB      $18, $18, $18, $3C, $3C  ; $02EA: Character '1' (bytes 6-10)

            DB      $3C, $7E, $66, $06, $3E  ; $02EF: Character '2' (bytes 1-5)
            DB      $7C, $60, $60, $7E, $7E  ; $02F4: Character '2' (bytes 6-10)

            DB      $3C, $7E, $66, $06, $1C  ; $02F9: Character '3' (bytes 1-5)
            DB      $1E, $06, $66, $7E, $3C  ; $02FE: Character '3' (bytes 6-10)
            DB      $66, $66, $66, $66, $7E  ; $0303: Character '4' (bytes 1-5)
            DB      $7E, $06, $06, $06, $06  ; $0308: Character '4' (bytes 6-10)
            DB      $7C, $7C, $60, $60, $7C  ; $030D: Character '5' (bytes 1-5)
            DB      $7E, $06, $66, $7E, $3C  ; $0312: Character '5' (bytes 6-10)
            DB      $3C, $7C, $60, $60, $7C  ; $0317: Character '6' (bytes 1-5)
            DB      $7E, $66, $66, $7E, $3C  ; $031C: Character '6' (bytes 6-10)

            DB      $7E, $7E, $06, $0E, $0C  ; $0321: Character '7' (bytes 1-5)
            DB      $1C, $18, $38, $30, $30  ; $0326: Character '7' (bytes 6-10)
            DB      $3C, $7E, $66, $66, $3C  ; $032B: Character '8' (bytes 1-5)
            DB      $7E, $66, $66, $7E, $3C  ; $0330: Character '8' (bytes 6-10)
            DB      $3C, $7E, $66, $66, $7E  ; $0335: Character '9' (bytes 1-5)
            DB      $3E, $06, $06, $3E, $3C  ; $033A: Character '9' (bytes 6-10)
            DB      $18, $3C, $7E, $66, $66  ; $033F: Character 'A' (bytes 1-5)
            DB      $66, $7E, $7E, $66, $66  ; $0344: Character 'A' (bytes 6-10)
            DB      $7C, $7E, $66, $66, $7C  ; $0349: Character 'B' (bytes 1-5)
            DB      $7E, $66, $66, $7E, $7C  ; $034E: Character 'B' (bytes 6-10)
            DB      $3C, $7E, $66, $60, $60  ; $0353: Character 'C' (bytes 1-5)
            DB      $60, $60, $66, $7E, $3C  ; $0358: Character 'C' (bytes 6-10)
            DB      $7C, $7E, $66, $66, $66  ; $035D: Character 'D' (bytes 1-5)
            DB      $66, $66, $66, $7E, $7C  ; $0362: Character 'D' (bytes 6-10)
            DB      $7E, $7E, $60, $60, $7C  ; $0367: Character 'E' (bytes 1-5)
            DB      $7C, $60, $60, $7E, $7E  ; $036C: Character 'E' (bytes 6-10)


            DB      $7E, $7E, $60, $60, $7C  ; $0371: Character 'F' (bytes 1-5)
            DB      $7C, $60, $60, $60, $60  ; $0376: Character 'F' (bytes 6-10)
            DB      $3C, $7E, $60, $60, $60  ; $037B: Character 'G' (bytes 1-5)
            DB      $6E, $6E, $66, $7E, $3C  ; $0380: Character 'G' (bytes 6-10)
            DB      $66, $66, $66, $66, $7E  ; $0385: Character 'H' (bytes 1-5)
            DB      $7E, $66, $66, $66, $66  ; $038A: Character 'H' (bytes 6-10)
            DB      $3C, $3C, $18, $18, $18  ; $038F: Character 'I' (bytes 1-5)
            DB      $18, $18, $18, $3C, $3C  ; $0394: Character 'I' (bytes 6-10)
            DB      $06, $06, $06, $06, $06  ; $0399: Character 'J' (bytes 1-5)
            DB      $06, $66, $66, $7E, $3C  ; $039E: Character 'J' (bytes 6-10)
            DB      $66, $66, $6E, $7C, $78  ; $03A3: Character 'K' (bytes 1-5)
            DB      $78, $6C, $6E, $66, $66  ; $03A8: Character 'K' (bytes 6-10)
            DB      $60, $60, $60, $60, $60  ; $03AD: Character 'L' (bytes 1-5)
            DB      $60, $60, $60, $7E, $7E  ; $03B2: Character 'L' (bytes 6-10)
            DB      $C3, $E7, $E7, $DB, $DB  ; $03B7: Character 'M' (bytes 1-5)
            DB      $C3, $C3, $C3, $C3, $C3  ; $03BC: Character 'M' (bytes 6-10)
            DB      $66, $66, $76, $7E, $7E  ; $03C1: Character 'N' (bytes 1-5)
            DB      $6E, $66, $66, $66, $66  ; $03C6: Character 'N' (bytes 6-10)
            DB      $3C, $7E, $66, $66, $66  ; $03CB: Character 'O' (bytes 1-5)
            DB      $66, $66, $66, $7E, $3C  ; $03D0: Character 'O' (bytes 6-10)
            DB      $7C, $7E, $66, $66, $7E  ; $03D5: Character 'P' (bytes 1-5)
            DB      $7C, $60, $60, $60, $60  ; $03DA: Character 'P' (bytes 6-10)
            DB      $3C, $7E, $66, $66, $66  ; $03DF: Character 'Q' (bytes 1-5)
            DB      $66, $66, $6E, $64, $3A  ; $03E4: Character 'Q' (bytes 6-10)
            DB      $7C, $7E, $66, $66, $7E  ; $03E9: Character 'R' (bytes 1-5)
            DB      $7C, $6E, $66, $66, $66  ; $03EE: Character 'R' (bytes 6-10)
            DB      $3C, $7E, $66, $60, $7C  ; $03F3: Character 'S' (bytes 1-5)
            DB      $3E, $06, $66, $7E, $3C  ; $03F8: Character 'S' (bytes 6-10)
            DB      $7E, $7E, $18, $18, $18  ; $03FD: Character 'T' (bytes 1-5)
            DB      $18, $18, $18, $18, $18  ; $0402: Character 'T' (bytes 6-10)
            DB      $66, $66, $66, $66, $66  ; $0407: Character 'U' (bytes 1-5)
            DB      $66, $66, $66, $7E, $3C  ; $040C: Character 'U' (bytes 6-10)


			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			inc  a
			jr   $0433
			jp   $C3C3
			in   a,($DB)
			in   a,($FF)
			rst  $20
			jp   $66C3
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			jr   $0443
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			jr   $044D
			jr   $044F
			jr   $0451
			call pe,$EEEC
			ret  po
			adc  a,d
			adc  a,d
			ld   b,h
			add  a,b
			adc  a,h
			jp   z,$E044
			adc  a,d
			adc  a,d
			ld   b,h
			jr   nz,$0434
			call pe,$E0E4
			xor  $EE
			call pe,$4448
			xor  d
			ld   c,(hl)
			ld   b,h
			xor  h
			ld   b,d
			ld   b,h
			xor  d
			xor  $E4
			jp   pe,$E0EA
			xor  (hl)
			add  a,b
			xor  (hl)
			ret  nz
			xor  d
			add  a,b
			jp   pe,$40E0
			ret  po
			ret  po
			and  b
			ret  po
			ret  po
			ret  po
			ret  po
			ret  po
			ld   b,b
			jr   nz,$0492
			and  b
			add  a,b
			add  a,b
			jr   nz,$0417
			and  b
			ld   b,b
			ret  po
			ld   h,b
			ret  po
			ret  nz
			ret  po
			ld   b,b
			ret  po
			ret  po
			ld   b,b
			add  a,b
			jr   nz,$04A5
			jr   nz,$0427
			ld   b,b
			and  b
			jr   nz,$04CB
			ret  po
			ret  po
			jr   nz,$044F
			ret  po
			ld   b,b
			ret  po
			ret  po
			xor  (hl)
			xor  d
			xor  (hl)
			xor  b
			ret  pe
			xor  (hl)
			and  b
			call pe,$AAE0
			and  b
			xor  d
			add  a,b
			ld   c,d
			and  b
			call pe,$4AC0
			and  b
			xor  d
			add  a,b
			ld   c,(hl)
			ret  po
			xor  d
			ret  po
			nop
			nop
			ld   bc,$0002
			nop
			nop
			nop
			ld   (bc),a
			ld   (bc),a
			ret  nz
			nop
			ret  nz
			nop
			ret  m
			ret  p
			ret  po
			ret  nz
			add  a,b
			ex   af,af'
			jr   $04FA
			ld   a,b
			ret  m
			ret  m
			ld   (hl),b
			jr   nz,$04CF
			ld   b,$02
			inc  c
			rlca
			nop
			rlca
			nop
			rrca
			add  a,b
			rst  $38
			add  a,b
			rrca
			ret  nz
			rrca
			and  b
			rrca
			sub  b
			rrca
			add  a,b
			dec  c
			add  a,b
			dec  c
			add  a,b
			dec  e
			add  a,b
			ld   bc,$06C0
			dec  b
			ld   (bc),a
			ld   a,(bc)
			inc  c
			nop
			inc  c
			nop
			ld   e,$00
			cp   $00
			rra
			nop
			ld   e,$80
			ld   e,$00
			ld   (de),a
			nop
			ld   ($0300),a
			nop
			dec  b
			inc  b
			ld   (bc),a
			ex   af,af'
			ex   af,af'
			nop
			inc  e
			nop
			cp   $00
			dec  de
			nop
			inc  e
			nop
			inc  e
			nop
			inc  (hl)
			nop
			ld   b,$00
			inc  b
			inc  bc
			ld   (bc),a
			ld   b,$10
			nop
			jr   c,$0517
			call m,$3800
			nop
			jr   c,$051D
			ld   l,h
			nop
			ld   bc,$0207
			ld   c,$80
			nop
			add  a,b
			nop
			or   b
			nop
			or   b
			nop
			ld   a,b
			nop
			ld   a,h
			nop
			ld   a,d
			nop
			ld   a,c
			nop
			ld   a,b
			nop
			ld   a,b
			nop
			ret  m
			nop
			ret  c
			nop
			sbc  a,b
			nop
			inc  e
			nop
			ld   bc,$0205
			dec  bc
			add  a,b
			nop
			or   b
			nop
			or   b
			nop
			ld   (hl),b
			nop
			ld   a,b
			nop
			ld   (hl),h
			nop
			ld   (hl),b
			nop
			ld   (hl),b
			nop
			ret  nc
			nop
			sub  b
			nop
			jr   $0559
			ld   bc,$0204
			add  hl,bc
			add  a,b
			nop
			and  b
			nop
			ret  p
			nop
			ld   l,b
			nop
			ld   h,b
			nop
			ld   h,b
			nop
			ret  po
			nop
			and  b
			nop
			jr   nc,$056F
			ld   bc,$0203
			rlca
			add  a,b
			nop
			and  b
			nop
			ret  p
			nop
			ld   b,$00
			ret  po
			nop
			and  b
			nop
			jr   nc,$0581
			inc  bc
			inc  b
			ld   (bc),a
			ex   af,af'
			djnz $0587
			jr   nc,$0589
			ld   a,b
			nop
			inc  (hl)
			nop
			jr   nc,$058F
			jr   nc,$0591
			jr   nz,$0593
			jr   nc,$0595
			inc  bc
			inc  bc
			ld   (bc),a
			ld   b,$10
			nop
			jr   c,$059D
			ld   (hl),b
			nop
			cp   b
			nop
			jr   nz,$05A3
			jr   nc,$05A5
			ld   b,$07
			ld   (bc),a
			ld   c,$06
			nop
			ld   b,$00
			ld   c,$00
			rra
			nop
			rra
			nop
			ld   e,$80
			ld   e,$80
			ld   c,$00
			ld   c,$00
			ld   c,$00
			ld   c,$00
			rrca
			nop
			inc  c
			nop
			ld   c,$00
			inc  b
			ld   b,$02
			inc  c
			inc  c
			nop
			inc  c
			nop
			ld   e,$00
			ccf
			nop
			dec  a
			nop
			inc  a
			nop
			inc  e
			nop
			inc  e
			nop
			inc  e
			nop
			ld   e,$00
			jr   $05DF
			inc  e
			nop
			inc  b
			dec  b
			ld   (bc),a
			ld   a,(bc)
			inc  c
			nop
			inc  c
			nop
			ld   e,$00
			ccf
			nop
			dec  a
			nop
			inc  e
			nop
			inc  e
			nop
			ld   e,$00
			jr   $05F7
			inc  e
			nop
			ld   b,$07
			ld   (bc),a
			dec  c
			ld   b,$00
			ld   b,$00
			ld   e,$00
			cpl
			ret  po
			ld   c,(hl)
			nop
			adc  a,(hl)
			nop
			ld   c,$00
			rrca
			nop
			rra
			add  a,b
			add  hl,de
			add  a,b
			ld   sp,hl
			add  a,b
			ld   sp,hl
			add  a,b
			add  a,b
			ret  nz
			ld   a,(bc)
			dec  b
			ld   (bc),a
			ld   a,(bc)
			inc  c
			nop
			inc  c
			nop
			ld   e,$00
			ccf
			nop
			ld   e,a
			add  a,b
			adc  a,a
			ld   b,b
			rlca
			nop
			rrca
			nop
			add  hl,de
			nop
			inc  sp
			nop
			inc  b
			ld   b,$02
			dec  bc
			inc  c
			nop
			inc  c
			nop
			inc  e
			nop
			ccf
			add  a,b
			ld   e,h
			nop
			sbc  a,h
			nop
			ld   e,$00
			rra
			nop
			di
			nop
			di
			nop
			add  a,e
			add  a,b
			inc  b
			dec  b
			ld   (bc),a
			add  hl,bc
			inc  c
			nop
			inc  c
			nop
			ccf
			add  a,b
			ld   e,h
			nop
			sbc  a,h
			nop
			ld   e,$00
			rst  $38
			nop
			di
			nop
			add  a,e
			add  a,b
			inc  bc
			inc  b
			ld   (bc),a
			rlca
			djnz $0665
			ld   a,h
			nop
			or   b
			nop
			jr   nc,$066B
			jr   c,$066D
			ret  pe
			nop
			adc  a,h
			nop
			inc  bc
			inc  bc
			ld   (bc),a
			ld   b,$10
			nop
			ld   a,h
			nop
			or   b
			nop
			jr   c,$067D
			ld   l,b
			nop
			ld   c,h
			nop
			ld   bc,$0205
			inc  c
			ld   h,b
			nop
			ld   h,b
			nop
			ret  po
			nop
			call po,$E400
			nop
			ret  m
			nop
			ret  po
			nop
			ret  po
			nop
			ret  po
			nop
			ret  po
			nop
			ret  po
			nop
			ld   (hl),b
			nop
			ld   bc,$0205
			dec  bc
			ld   h,b
			nop
			ld   h,b
			nop
			ret  po
			nop
			call po,$E400
			nop
			ret  m
			nop
			ret  po
			nop
			ret  po
			nop
			ret  po
			nop
			ret  po
			nop
			ld   (hl),b
			nop
			ld   b,$06
			ld   (bc),a
			inc  c
			ld   b,$00
			ld   b,$00
			ld   a,a
			nop
			adc  a,a
			nop
			ld   a,a
			nop
			rrca
			nop
			ld   c,a
			nop
			ld   a,a
			nop
			ld   a,a
			nop
			ld   b,$00
			ld   b,$00
			ld   c,$00
			rlca
			ld   b,$02
			dec  bc
			inc  c
			nop
			inc  c
			nop
			rra
			nop
			ccf
			ret  nz
			ld   e,a
			and  b
			adc  a,a
			add  a,b
			rlca
			add  a,b
			rlca
			add  a,b
			inc  c
			add  a,b
			jr   $066B
			ld   sp,$0680
			dec  b
			ld   (bc),a
			dec  bc
			ld   bc,$0180
			add  a,b
			inc  bc
			add  a,b
			rlca
			ret  nz
			rrca
			and  b
			rra
			djnz $06FC
			nop
			cp   $00
			add  a,(hl)
			nop
			ld   b,$00
			rlca
			nop
			dec  b
			inc  b
			ld   (bc),a
			add  hl,bc
			inc  bc
			nop
			inc  bc
			nop
			rlca
			nop
			rrca
			add  a,b
			ld   e,$40
			call m,$FC20
			nop
			adc  a,h
			nop
			ld   c,$00
			inc  bc
			dec  b
			ld   (bc),a
			dec  bc
			inc  bc
			nop
			inc  bc
			nop
			rlca
			nop
			rrca
			add  a,b
			rra
			ld   b,b
			ld   a,$20
			inc  a
			nop
			jr   c,$0731
			inc  a
			nop
			jr   nc,$0735
			jr   c,$0737
			inc  bc
			inc  b
			ld   (bc),a
			add  hl,bc
			inc  bc
			nop
			inc  bc
			nop
			rlca
			nop
			rrca
			add  a,b
			ld   e,$40
			inc  a
			jr   nz,$0780
			nop
			jr   nc,$074B
			jr   c,$074D
			nop
			nop
			ld   (bc),a
			ld   (bc),a
			rst  $38
			rst  $38
			rst  $38
			rst  $38
			nop
			inc  c
			ld   (bc),a
			dec  c
			nop
			jr   $075C
			jr   c,$075E
			ld   (hl),b
			nop
			ret  po
			ld   bc,$03C0
			add  a,b
			rlca
			nop
			ld   c,$00
			inc  e
			nop
			jr   c,$076D
			ld   (hl),b
			nop
			ret  po
			nop
			ret  nz
			nop
			nop
			ex   af,af'
			ld   (bc),a
			add  hl,bc
			nop
			ld   b,$00
			ld   e,$00
			ld   a,h
			ld   bc,$07F0
			ret  nz
			rra
			nop
			ld   a,h
			nop
			ret  p
			nop
			ret  nz
			nop
			nop
			dec  c
			ld   (bc),a
			dec  bc
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			nop
			nop
			ld   (bc),a
			add  hl,bc
			ret  nz
			nop
			ret  p
			nop
			ld   a,h
			nop
			rra
			nop
			rlca
			ret  nz
			ld   bc,$00F0
			ld   a,h
			nop
			ld   e,$00
			ld   b,$00
			nop
			ld   (bc),a
			dec  c
			ret  nz
			nop
			ret  po
			nop
			ld   (hl),b
			nop
			jr   c,$07C5
			inc  e
			nop
			ld   c,$00
			rlca
			nop
			inc  bc
			add  a,b
			ld   bc,$00C0
			ret  po
			nop
			ld   (hl),b
			nop
			jr   c,$07D6
			jr   $07D8
			nop
			ld   (bc),a
			dec  bc
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			ret  nz
			nop
			inc  b
			nop
			ld   (bc),a
			rlca
			cp   $00
			cp   $00
			cp   $00
			cp   $00
			ld   a,h
			nop
			jr   c,$0801
			djnz $0803
			inc  b
			nop
			ld   (bc),a
			inc  b
			ret  m
			nop
			ret  m
			nop
			ret  m
			nop
			ret  m
			nop
			inc  b
			nop
			ld   (bc),a
			inc  bc
			ret  p
			nop
			ret  p
			nop
			ret  p
			nop
			inc  b
			ld   b,$02
			inc  c
			inc  c
			nop
			inc  c
			nop
			ccf
			nop
			ld   a,a
			add  a,b
			sbc  a,(hl)
			ld   b,b
			sbc  a,(hl)
			ld   b,b
			sbc  a,(hl)
			ld   b,b
			ld   e,$00
			ld   (de),a
			nop
			ld   (de),a
			nop
			ld   (de),a
			nop
			inc  sp
			nop
			inc  b
			dec  b
			ld   (bc),a
			ld   a,(bc)
			inc  c
			nop
			inc  c
			nop
			ccf
			nop
			ld   a,a
			add  a,b
			sbc  a,(hl)
			ld   b,b
			sbc  a,(hl)
			ld   b,b
			ld   e,$00
			ld   (de),a
			nop
			ld   (de),a
			nop
			inc  sp
			nop
			inc  bc
			inc  b
			ld   (bc),a
			ex   af,af'
			djnz $0853
			ld   a,h
			nop
			cp   d
			nop
			cp   d
			nop
			jr   c,$085B
			jr   z,$085D
			jr   z,$085F
			ld   l,h
			nop
			inc  bc
			inc  bc
			ld   (bc),a
			ld   b,$10
			nop
			ld   a,h
			nop
			cp   d
			nop
			cp   d
			nop
			jr   z,$086F
			ld   l,h
			nop
			ld   b,$06
			ld   (bc),a
			inc  c
			rlca
			nop
			rlca
			nop
			rra
			ret  nz
			ccf
			ret  po
			ld   c,a
			sub  b
			ld   c,a
			sub  b
			ld   c,a
			sub  b
			rrca
			add  a,b
			dec  c
			add  a,b
			dec  c
			add  a,b
			dec  c
			add  a,b
			dec  e
			ret  nz
			ld   sp,hl
			dec  b
			and  l
			dec  b
			cpl
			ld   b,$C5
			dec  b
			ld   c,c
			ld   b,$E1
			dec  b
			ld   e,a
			ld   b,$81
			dec  b
			ld   (hl),c
			ld   b,$95
			dec  b
			db   $ed,$06
			dec  e
			rlca
			rlca
			rlca
			scf
			rlca
			xor  h
			inc  b
			xor  h
			inc  b
			or   d
			inc  b
			or   d
			inc  b
			out  ($06),a
			out  ($06),a
			rla
			ld   b,$17
			ld   b,$C7
			inc  b
			rra
			dec  b
			ex   (sp),hl
			inc  b
			ccf
			dec  b
			ei
			inc  b
			ld   e,c
			dec  b
			rrca
			dec  b
			ld   l,a
			dec  b
			or   a
			ld   b,$1F
			dec  b
			rst  $00
			inc  b
			rst  $00
			inc  b
			ex   (sp),hl
			inc  b
			ex   (sp),hl
			inc  b
			add  hl,de
			ex   af,af'
			add  hl,de
			ex   af,af'
			dec  (hl)
			ex   af,af'
			dec  (hl)
			ex   af,af'
			ld   c,l
			ex   af,af'
			ld   c,l
			ex   af,af'
			ld   h,c
			ex   af,af'
			ld   h,c
			ex   af,af'
			ld   (hl),c
			ex   af,af'
			ld   (hl),c
			ex   af,af'
			add  a,c
			ld   b,$81
			ld   b,$9D
			ld   b,$9D
			ld   b,$AD
			ex   af,af'
			xor  l
			ex   af,af'
			xor  l
			ex   af,af'
			xor  l
			ex   af,af'
			xor  l
			ex   af,af'
			call $CD08
			ex   af,af'
			pop  de
			ex   af,af'
			push hl
			ex   af,af'
			push hl
			ex   af,af'
			ret
			ex   af,af'
			ret
			ex   af,af'
			or   c
			ex   af,af'
			or   c
			ex   af,af'
			or   l
			ex   af,af'
			jp   (hl)
			ex   af,af'
			jp   (hl)
			ex   af,af'
			db   $ed,$08
			cp   c
			ex   af,af'
			cp   c
			ex   af,af'
			cp   l
			ex   af,af'
			pop  bc
			ex   af,af'
			push bc
			ex   af,af'
			xor  c
			ex   af,af'
			xor  c
			ex   af,af'
			xor  c
			ex   af,af'
			xor  c
			ex   af,af'
			xor  c
			ex   af,af'
			adc  a,l
			ex   af,af'
			sub  c
			ex   af,af'
			sub  l
			ex   af,af'
			sbc  a,c
			ex   af,af'
			sbc  a,l
			ex   af,af'
			and  c
			ex   af,af'
			and  c
			ex   af,af'
			and  l
			ex   af,af'
			push de
			ex   af,af'
			push de
			ex   af,af'
			exx
			ex   af,af'
			db   $dd,$08
;=========================================================================================
; ----> VECT_TBL0941   ADDRESS VECTOR TABLE  ($0941 - $0966)
;   Table of 19 16-bit address pointers ($08E1 - $0964). Disassembled as Z80 opcodes
;   in legacy listings, but structured as 16-bit data words (DW).
;=========================================================================================
L0941:
            DW      $08E1, $0929, $0933, $0915
            DW      $090F, $0939, $091F, $08F1
            DW      $08FB, $0901, $0905, $0909
            DW      $0016, $0015, $0011, $0012
            DW      $0013, $0304, $0964

;=========================================================================================
; ----> FETCH_7C1C     FETCH BYTE FROM RAM POINTER 7C1C  ($0967 - $096B)
;   Loads the memory pointer stored at $7C1C into HL and fetches the byte at
;   that address into register A.
;=========================================================================================
_FETCH_7C1C:
            ld      hl,($7C1C)              ; Load RAM script/stream pointer into HL
            ld      a,(hl)                  ; Fetch byte from target address
            ret                             ; Return

;=========================================================================================
; ----> INC_7C1C       INCREMENT RAM POINTER 7C1C  ($096C - $0973)
;   Loads the memory pointer stored at $7C1C into HL, increments it by 1,
;   and writes the updated 16-bit address back to $7C1C.
;=========================================================================================
_INC_7C1C:
            ld      hl,($7C1C)              ; Load RAM script/stream pointer into HL
            inc     hl                      ; Advance pointer by 1 byte
            ld      ($7C1C),hl              ; Store updated pointer back to RAM
            ret
;============================================================
call $0967
call $096C
ld   h,$00
ld   l,a
ret
;============================================================
ld   hl,($7C1C)
ld   e,(hl)
inc  hl
ld   d,(hl)
ld   ($7C1C),de
ret
;============================================================
push bc
ld   a,($7C23)
or   a
jp   z,$0998
dec  a
ld   ($7C23),a
jp   nz,$0A12
call $0967
call $096C
or   a
jp   nz,$09C0
call $0974
push hl
call $0974
push hl
call $0974
push hl
ld   bc,$09B4
jp   $0275
inc  c
nop
pop  hl
pop  de
add  hl,de
pop  bc
out  (c),l
xor  a
jp   $0A12
dec  a
jp   nz,$09D2
call $0967
ld   ($7C23),a
call $096C
or   $01
jp   $0A12
dec  a
jp   nz,$09DD
call $097E
xor  a
jp   $0A12
dec  a
jp   nz,$09E9
call $097E
or   $01
jp   $0A12
dec  a
jp   nz,$0A06
ld   a,($7C20)
dec  a
ld   ($7C20),a
jp   z,$0A00
ld   hl,($7C21)
ld   ($7C1C),hl
jp   $0A12
ld   ($7C24),a
jp   $0A12
add  a,$04
ld   c,a
call $0967
out  (c),a
call $096C
xor  a
or   a
jp   z,$0998
pop  bc
ret
;============================================================
ld   ($7C1C),hl
ld   ($7C21),hl
ret
;============================================================
ld   a,($7C19)
and  a
ret  nz
call $0A18
xor  a
ld   ($7C23),a
inc  a
ld   ($7C20),a
ret
;============================================================



;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

pop  hl
call $0A1F
jp   (iy)

;******************************************************************************
; Opcode:	$A1
;
; Description:	???
;
;******************************************************************************


ld   hl,$0959
call $0A18
ld   a,$01
ld   ($7C23),a
ld   ($7C20),a
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


djnz $0A6B
ld   d,$AB
dec  d
dec  bc
inc  d
nop
inc  de
ld   c,d
ld   bc,$1201
ld   b,(hl)
ld   de,$135E
ld   a,$01
ld   bc,$4212
inc  de
scf
ld   bc,$1201
inc  (hl)
inc  de
ld   l,$01
ld   bc,$2C12
inc  de
daa
ld   bc,$1201
dec  h
inc  de
ld   ($0101),hl
ld   (de),a
jr   nz,$0A88
ld   a,$01
ld   bc,$1D12
inc  de
jr   $0A7E
ex   af,af'
ld   (de),a
rla
ld   d,$00
dec  d
nop
ld   de,$1200
nop
inc  de
nop
inc  b
inc  bc
adc  a,e
ld   a,(bc)
djnz $0AB8
ld   d,$AB
dec  d
ld   a,(bc)
inc  d
nop
ld   de,$1254
ld   b,(hl)
inc  de
ld   a,$01
ld   (bc),a
ld   de,$125E
ld   c,d
inc  de
ld   a,$01
ld   (bc),a
ld   de,$1264
ld   d,h
inc  de
ld   a,$01
ld   (bc),a
ld   de,$1270
ld   e,(hl)
inc  de
ld   a,$01
dec  b
ld   d,$00
dec  d
nop
ld   de,$1200
nop
inc  de
nop
inc  b
inc  bc
pop  bc
ld   a,(bc)
djnz $0AE9
ld   d,$FF
dec  d
cpl
rla
ret  pe
inc  d
ld   d,d
ld   de,$124A
ld   d,h
inc  de
ld   e,(hl)
ld   bc,$1612
nop
dec  d
nop
ld   de,$1200
nop
inc  de
nop
inc  b
inc  bc
pop  hl
ld   a,(bc)
inc  d
nop
djnz $0B2E
ld   d,$0F
dec  d
nop
ld   de,$0137
inc  b
ld   de,$013E
dec  b
ld   de,$0146
dec  b
ld   de,$014A
ld   b,$11
ld   d,h
ld   bc,$1106
ld   e,(hl)
ld   bc,$1107
ld   h,h
ld   bc,$1107
ld   (hl),b
ld   bc,$1108
ld   a,(hl)
ld   bc,$1108
adc  a,l
ld   bc,$1109
sub  (hl)
ld   bc,$110A
xor  b
ld   bc,$160B
nop
dec  d
nop
ld   de,$1200
nop
inc  de
nop
inc  b
inc  bc
daa
dec  bc
djnz $0B61
rla
inc  sp
inc  d
nop
ld   d,$AA
dec  d
ld   a,($2E11)
ld   (de),a
ld   b,b
inc  de
ld   d,b
ld   bc,$117C
cpl
ld   (de),a
ld   b,d
inc  de
ld   d,e
ld   bc,$1604
adc  a,b
dec  d
jr   c,$0B5A
jr   nc,$0B5D
ld   b,h
inc  de
ld   d,(hl)
ld   bc,$1604
ld   h,(hl)
dec  d
ld   (hl),$11
ld   sp,$4612
inc  de
ld   e,c
ld   bc,$1604
ld   b,h
dec  d
inc  (hl)
ld   bc,$1605
ld   ($3215),hl
ld   bc,$1607
nop
dec  d
nop
ld   de,$1200
nop
inc  de
nop
inc  b
inc  bc
ld   (hl),e
dec  bc
djnz $0BC8
rla
dec  a
ld   d,$FF
dec  d
rra
ld   (de),a
ld   de,$1211
inc  de
rrca
ld   bc,$1606
nop
dec  d
nop
ld   de,$1200
nop
inc  de
nop
inc  b
inc  bc
sub  c
dec  bc
djnz $0BDE
rla
jr   c,$0B9B
ld   a,d
dec  bc
djnz $0BB9
rla
nop
ld   d,$EF
dec  d
rrca
inc  d
nop
ld   de,$125E
sub  (hl)
inc  de
cp   l
ld   bc,$1114
ld   l,$12
ld   a,(hl)
inc  de
sub  (hl)
ld   bc,$110A
scf
ld   (de),a
adc  a,l
inc  de
cp   l
ld   bc,$110A
ld   a,$12
sub  (hl)
inc  de
cp   l
ld   bc,$110A
ld   c,d
ld   (de),a
ld   a,(hl)
inc  de
cp   l
ld   bc,$110A
ld   a,$12
xor  b
inc  de
ret  z
ld   bc,$111E
ld   d,h
ld   (de),a
adc  a,l
inc  de
db   $fd,$01
ld   e,$11
ld   e,(hl)
ld   (de),a
sub  (hl)
inc  de
cp   l
ld   bc,$1114
ld   l,$12
ld   a,(hl)
inc  de
sub  (hl)
ld   bc,$110A
scf
ld   (de),a
ld   e,(hl)
inc  de
adc  a,l
ld   bc,$110A
ld   a,$12
ld   e,(hl)
inc  de
sub  (hl)
ld   bc,$110A
ld   c,d
ld   (de),a
ld   a,(hl)
inc  de
cp   l
ld   bc,$110A
ld   a,$12
xor  b
inc  de
ret  z
ld   bc,$113C
ld   l,$12
ld   c,d
inc  de
cp   l
ld   bc,$023C
ld   hl,($160B)
xor  e
dec  d
dec  bc
nop
ld   de,$905E
nop
inc  de
ld   e,(hl)
add  a,b
nop
ld   (de),a
ld   e,(hl)
ld   (hl),b
djnz $0C3A
ld   bc,$1001
ld   c,$01
ld   bc,$0C10
ld   bc,$1001
ld   a,(bc)
ld   bc,$1001
ex   af,af'
ld   bc,$1001
ld   b,$01
ld   bc,$0410
ld   bc,$1001
ld   (bc),a
ld   bc,$0201
ld   hl,($160C)
rst  $38
dec  d
rra
djnz $0C53
rla
ex   af,af'
inc  de
ld   d,h
ld   (de),a
ld   b,d
ld   de,$013B
ld   b,$13
ld   e,(hl)
ld   de,$014A
ld   b,$13
ld   h,h
ld   (de),a
ld   d,h
ld   bc,$1606
db   $dd,$15
ld   a,(de)
inc  de
ld   (hl),b
ld   de,$015E
ld   b,$16
xor  d
dec  d
rla
inc  de
ld   a,(hl)
ld   (de),a
ld   h,h
ld   bc,$0206
jr   $0C8A
djnz $0CB4
ld   d,$AB
dec  d
dec  bc
inc  d
nop
ld   de,$123E
ld   c,d
inc  de
ld   e,(hl)
ld   bc,$1105
ld   sp,$2912
inc  de
ld   a,$01
dec  b
ld   de,$122E
ld   d,h
inc  de
scf
ld   bc,$1105
rra
ld   (de),a
add  hl,hl
inc  de
ld   sp,$1201
ld   (bc),a
ld   hl,($100B)
inc  hl
ld   d,$AB
dec  d
dec  bc
inc  d
nop
ld   de,$1246
ld   d,h
inc  de
ld   a,$01
dec  b
ld   de,$1254
ld   h,h
inc  de
ld   c,d
ld   bc,$1105
adc  a,l
ld   (de),a
ld   (hl),a
inc  de
ld   h,h
ld   bc,$1105
ret  z
ld   (de),a
adc  a,l
inc  de
sub  (hl)
ld   bc,$1105
ld   (hl),b
ld   (de),a
adc  a,l
inc  de
db   $fd,$01
ld   (de),a
ld   d,$00
dec  d
nop
ld   de,$1200
nop
inc  de
nop
inc  b
inc  bc
call po,$CF0C
dec  c
ld   c,$2A
dec  bc
rrca
inc  bc
ld   a,h
ld   h,$00
ld   l,a
add  hl,hl
add  hl,hl
add  hl,hl
add  hl,hl
push de
ld   e,l
ld   d,h
add  hl,hl
add  hl,hl
add  hl,de
ex   de,hl
pop  hl
ld   a,l
ld   l,h
ld   h,$00
add  hl,de
rlca
rlca
and  $03
ret
ld   a,($7C0A)
and  a
jr   z,$0D2F
ld   a,$60
sub  h
add  a,$60
ld   h,a
ld   a,$27
sub  d
add  a,$27
inc  a
ld   d,a
ld   a,c
or   $80
xor  $40
ld   c,a
call $0CEE
bit  6,c
jr   nz,$0D2D
neg
jr   nz,$0D2D
inc  hl
jr   $0D3B
call $0CEE
bit  6,c
jr   z,$0D3B
neg
jr   nz,$0D3B
dec  hl
and  $03
ld   e,a
ld   a,c
and  $FC
or   e
ld   c,a
ret
push hl
ex   de,hl
ld   d,(iy+$00)
ld   e,$00
sra  d
rr   e
sra  d
rr   e
bit  6,c
jr   z,$0D5A
add  hl,de
jr   $0D5D
or   a
sbc  hl,de
ex   (sp),hl
ld   d,(iy+$01)
ld   e,$00
bit  7,c
jr   z,$0D6A
add  hl,de
jr   $0D6E
scf
ccf
sbc  hl,de
pop  de
inc  iy
inc  iy
ret
push bc
ld   a,($7C1B)
and  a
ld   a,b
jr   nz,$0D82
cp   $08
jr   nz,$0D82
ld   a,$0C
out  ($19),a
ld   a,c
out  ($0C),a
push iy
pop  bc
bit  7,a
jr   nz,$0DBE
bit  6,a
jr   z,$0DA8
push de
push hl
ld   a,(bc)
ld   (hl),a
dec  hl
ld   (hl),a
dec  hl
inc  bc
dec  e
jr   nz,$0D94
pop  hl
ld   de,$0050
add  hl,de
pop  de
dec  d
jr   nz,$0D92
jr   $0DBC
push de
push hl
ld   a,(bc)
ld   (hl),a
inc  hl
ld   (hl),a
inc  hl
inc  bc
dec  e
jr   nz,$0DAA
pop  hl
ld   de,$0050
add  hl,de
pop  de
dec  d
jr   nz,$0DA8
jr   $0DF2
bit  6,a
jr   z,$0DDB
push de
push hl
ld   a,(bc)
ld   (hl),a
dec  hl
ld   (hl),a
dec  hl
inc  bc
dec  e
jr   nz,$0DC4
pop  hl
ld   de,$0050
scf
ccf
sbc  hl,de
pop  de
dec  d
jr   nz,$0DC2
jr   $0DF2
push de
push hl
ld   a,(bc)
ld   (hl),a
inc  hl
ld   (hl),a
inc  hl
inc  bc
dec  e
jr   nz,$0DDD
pop  hl
ld   de,$0050
scf
ccf
sbc  hl,de
pop  de
dec  d
jr   nz,$0DDB
pop  bc
ret
ld   e,(iy+$00)
inc  iy
ld   d,(iy+$00)
inc  iy
jp   $0D74
push iy
pop  hl
exx
pop  bc
pop  hl
pop  iy
pop  de
ex   (sp),hl
ex   de,hl
call $0D08
pop  de
call $0D74
exx
push hl
pop  iy
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


push iy
pop  hl
exx
pop  bc
pop  iy
pop  hl
pop  de
call $0D44
call $0D08
call $0DF4
exx
push hl
pop  iy
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


push iy
pop  hl
exx
pop  hl
ld   a,l
pop  bc
cp   $41
jr   c,$0E40
sub  $36
jr   $0E4A
cp   $30
jr   c,$0E48
sub  $2F
jr   $0E4A
sub  $20
ld   l,a
ld   h,$00
sla  l
rl   h
ld   d,h
ld   e,l
sla  l
rl   h
sla  l
rl   h
add  hl,de
ld   de,$02D1
add  hl,de
push hl
pop  iy
pop  hl
pop  de
push de
push hl
push bc
call $0D08
ld   de,$0A01
ld   a,$02
push af
call $0D74
pop  af
pop  bc
pop  hl
ex   (sp),hl
ld   d,a
ld   l,$00
add  hl,de
ex   (sp),hl
push hl
push bc
exx
push hl
pop  iy
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$11
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



rst  $08
rlca
rlca
rlca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
djnz $0E9E
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   (de),a
inc  de
inc  d
ld   bc,$1615
rla
djnz $0EB0
ld   de,$CF03
add  hl,de
rrca
ld   a,(de)
inc  de
dec  de
nop
ld   b,b
ld   a,(de)
dec  de
nop
ld   b,b
inc  e
inc  de
dec  e
ld   e,$B8
ld   c,$19
jr   nc,$0EC3
ld   bc,$FF1B
cp   a
ld   a,(de)
ld   bc,$BB1F
ld   c,$07
add  hl,de
jr   nz,$0ECC
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
inc  de
inc  d
ld   bc,$1615
rla
jr   nz,$0EE7
ld   d,$17
ld   hl,$1118
inc  bc
ld   b,$08
ld   c,(ix+$00)
ld   d,(ix+$0c)
ld   e,(ix+$0b)
ld   h,(ix+$14)
ld   l,(ix+$13)
push hl
pop  iy
ld   h,(ix+$10)
ld   l,(ix+$0f)
call $0D44
call $0D08
ld   (ix+$17),h
ld   (ix+$16),l
call $0DF4
ld   (ix+$00),c
ret
ld   b,$08
ld   c,(ix+$00)
ld   h,(ix+$14)
ld   l,(ix+$13)
inc  hl
inc  hl
push hl
pop  iy
ld   h,(ix+$17)
ld   l,(ix+$16)
call $0DF4
ld   a,($7C0A)
and  a
ret  z
ld   a,c
and  $7F
xor  $40
ld   (ix+$00),a
ret
ex   af,af'
add  hl,bc
rlca
dec  b
jr   z,$0F2B
djnz $0F28
nop
nop
nop
rlca
jr   z,$0F33
jr   nz,$0F30
nop
nop
nop
rlca
ld   a,(bc)
ld   b,$28
inc  b
nop
nop
nop
nop
nop
inc  c
jr   z,$0F40
ld   c,$60
nop
nop
ld   (bc),a
ld   (bc),a
ld   l,b
inc  bc
nop
nop
nop
nop
nop
inc  c
ld   l,b
nop
ld   a,(bc)
nop
nop
nop
db   $fd,$03
ld   l,b
inc  bc
nop
nop
nop
nop
nop
inc  c
jr   z,$0F60
dec  c
ret  po
rst  $38
nop
inc  bc
inc  bc
jr   z,$0F6B
nop
nop
nop
nop
nop
inc  c
ld   l,b
nop
ld   a,(bc)
or   b
nop
nop
cp   $04
jr   z,$0F7B
nop
nop
nop
nop
nop
inc  c
ld   l,b
nop
ld   (de),a
nop
nop
nop
rst  $38
jr   z,$0F8F
nop
nop
nop
nop
nop
inc  c
jr   z,$0F8F
ld   (de),a
nop
nop
nop
ld   bc,$0828
nop
nop
nop
nop
nop
inc  c
jr   z,$0FA7
ld   (de),a
nop
nop
nop
nop
jr   z,$0FAD
nop
nop
nop
nop
nop
inc  c
jr   z,$0FAF
dec  b
nop
nop
nop
nop
ld   c,$68
ld   (bc),a
dec  b
nop
nop
nop
nop
ld   c,$28
nop
ld   d,$60
nop
jr   nz,$0FC4
jr   z,$0FC5
ld   (bc),a
ld   b,b
nop
nop
ld   bc,$0E0B
ld   l,b
nop
ld   (de),a
add  a,b
nop
djnz $0FD0
ld   l,b
ld   bc,$4002
nop
add  a,b
rst  $38
dec  bc
ld   c,$68
ld   bc,$0012
nop
nop
rst  $38
ld   l,b
nop
dec  b
nop
ld   bc,$0000
inc  b
jr   z,$0FEF
nop
nop
nop
nop
nop
inc  c
ld   l,b
ld   bc,$400A
nop
ret  nc
rst  $38
dec  bc
jr   z,$0FFD
ld   a,(bc)
ld   b,b
nop
add  a,b
nop
dec  bc
ld   l,b
nop
ld   (de),a
ld   b,b
nop
nop
rst  $38
ld   c,$28
ld   bc,$C012
rst  $38
add  a,b
nop
ld   l,b
nop
ld   c,$C0
nop
nop
cp   $04
jr   z,$101E
nop
nop
nop
nop
nop
inc  c
ld   l,b
ld   bc,$0010
nop
add  a,b
rst  $38
ld   c,$68
ld   bc,$800C
nop
add  a,b
rst  $38
dec  bc
jr   z,$1034
inc  c
add  a,b
nop
add  a,b
ld   bc,$280B
nop
inc  c
ret  nz
rst  $38
nop
ld   bc,$680E
ld   bc,$A00B
nop
jr   nz,$1047
dec  bc
jr   z,$104C
inc  c
nop
nop
add  a,b
nop
dec  bc
jr   z,$1054
ld   (de),a
nop
nop
add  a,b
nop
ld   c,$68
ld   bc,$C012
rst  $38
add  a,b
rst  $38
jr   z,$1062
inc  de
sub  b
nop
nop
ld   (bc),a
ld   (bc),a
ld   l,b
inc  bc
nop
nop
nop
nop
nop
inc  c
ld   l,b
ld   bc,$300A
nop
ret  nz
rst  $38
dec  c
jr   z,$107B
dec  bc
ret  nz
rst  $38
ld   b,b
ld   bc,$280D
ld   bc,$0018
nop
nop
ld   bc,$280E
nop
dec  d
nop
nop
add  a,b
inc  b
ld   (bc),a
ld   l,b
inc  bc
nop
nop
nop
nop
nop
inc  c
ld   l,b
nop
djnz $101C
rst  $38
ret  po
rst  $38
ld   c,$28
nop
djnz $1024
nop
jr   nz,$10A7
ld   c,$28
ld   b,$50
nop
inc  bc
nop
nop
jr   z,$10B7
add  a,b
nop
ld   bc,$0000
jr   z,$10BE
dec  (hl)
nop
ld   bc,$0000
jr   z,$10C5
ld   d,b
nop
inc  bc
nop
nop
jr   z,$10CC
ld   (de),a
nop
inc  bc
nop
nop
jr   z,$10D3
ld   d,b
nop
ld   bc,$0000
jr   z,$10DA
ld   (de),a
nop
inc  bc
nop
nop
jr   z,$10E1
add  hl,bc
nop
ld   (bc),a
nop
ld   bc,$0628
ld   d,b
nop
ld   (bc),a
nop
nop
jr   z,$10EF
ld   a,(de)
nop
ld   (bc),a
ret  p
rst  $38
jr   z,$10F6
add  hl,bc
nop
ld   (bc),a
nop
rst  $38
jr   z,$10FD
ld   d,b
nop
ld   (bc),a
nop
nop
jr   z,$1104
ld   a,(de)
nop
ld   (bc),a
ret  po
rst  $38
jr   z,$110B
add  hl,bc
nop
ld   (bc),a
ld   h,b
nop
jr   z,$1112
ld   d,b
nop
ld   (bc),a
nop
nop
ld   a,h
cpl
ld   h,a
ld   a,l
cpl
ld   l,a
inc  hl
ret
push hl
ex   de,hl
call $1111
ex   de,hl
pop  hl
ret
ld   a,(hl)
and  a
ret  z
dec  a
ld   (hl),a
and  a
jr   nz,$112C
inc  a
jr   $112D
xor  a
ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$30
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08			; Bread crumb trail
ld   ($0323),hl		; ???

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08		; Put a pin on the map
dec  c
inc  hl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   c,e
ld   a,h
inc  h
ex   af,af'
add  hl,de
ld   de,$1914
add  a,c
inc  hl
add  hl,de
ld   e,$14
add  hl,de
inc  bc
inc  hl
inc  bc
ret
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


push af
sla  a
add  a,l
ld   l,a
ld   a,$00
adc  a,h
ld   h,a
ld   e,(hl)
inc  hl
ld   d,(hl)
dec  hl
pop  af
ret
ld   a,$03
ld   ($7CF8),a
ld   a,$81
ld   ($7CEB),a
ret
ld   a,$03
ld   ($7D17),a
ld   a,$81
ld   ($7D0A),a
ret
ld   a,$03
ld   ($7D36),a
ld   a,$81
ld   ($7D29),a
ret
ld   ($7CF8),a
ld   ($7D17),a
ld   ($7D36),a
ld   ($7D55),a
ret
ld   a,$01
ld   ($7CD4),a
ld   ($7C3F),a
ret
bit  7,h
push af
call nz,$1111
sla  l
rl   h
sla  l
rl   h
pop  af
call nz,$1111
ret
ld   hl,$0000
ld   ($7C77),hl
ld   ($7C75),hl
ld   hl,$0428
ld   ($7C72),hl
xor  a
ld   ($7C47),a
ret
push af
ld   a,$FF
dec  a
jr   nz,$11BC
pop  af
dec  a
jr   nz,$11B9
ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************
rst  $08		; Remember where we parked
db $25			; EI
db $19			; $00FF
db $FF
db $0D			; $0000
db $15			;
db $18, $1B
db $11, $7C, $17
db $08
db $1E, $EC
db $11, $22, $26
db $1E, $E7
db $11, $1B, $1A
db $7C
db $17
db $1E, $E2
db $11, $1F, $E4
db $11, $07, $22
db $1F
db $E9
db $11, $07, $22
db $1F
db $ED, $11
db $07
db $19
db $50
db $0D
db $15
db $18, $22
db $27
db $08
db $28, $1E
db $C6, $11
db $07
db $03
db $21, $02, $7E
db $3E, $03
db $11, $1F, $00
db $CB, $FE
db $19
db $3D
db $20, $FA
db $C9

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************
rst  $08
dec  de
nop
ld   b,d
dec  de
nop
ld   a,d
dec  de
jr   z,$121C
add  hl,de
ld   c,b
add  hl,hl
dec  de
nop
ld   b,h
dec  de
nop
ld   a,a
dec  de
ld   e,h
inc  b
dec  de
ld   (bc),a
dec  b
dec  de
jr   z,$122E
ld   hl,($CF03)
dec  de
nop
rlca
dec  de
nop
ld   a,d
dec  de
jr   z,$123A
add  hl,de
ld   d,(hl)
add  hl,hl
dec  de
nop
add  hl,bc
dec  de
nop
ld   a,a
dec  de
ld   c,l
inc  b
dec  de
inc  bc
dec  b
dec  de
jr   z,$124C
ld   hl,($DD03)
push hl
ld   ix,$7E4E
call $0EF9
res  7,(ix+$11)
pop  ix
ld   hl,$04AC
ld   ($7E61),hl
ret
ld   hl,$7CB7
ld   a,($7CA6)
and  a
call z,$1121
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



rst  $08
dec  hl
dec  de
dec  bc
ld   a,h
rla
ld   e,$75
ld   (de),a
inc  l
rra
halt
ld   (de),a
dec  l
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
dec  de
nop
inc  e
dec  de
nop
jr   nz,$129A
jr   z,$1289
ld   l,$0C
ld   b,e
ld   c,b
ld   b,c
ld   c,(hl)
ld   b,a
ld   b,l
jr   nz,$12DE
ld   c,c
ld   b,h
ld   b,l
ld   d,e
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
dec  c
dec  d
add  hl,de
rst  $38
dec  c
dec  d
jr   $12B2
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
dec  de
xor  b
ld   a,h
ld   (bc),a
dec  de
or   c
ld   a,h
jr   nc,$12C0
or   d
ld   a,h
jr   nc,$12AC

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
xor  b
ld   a,h
inc  h
ld   sp,$DD03
push hl
push iy
ld   hl,$7CB0
ld   a,($7CB1)
and  a
ld   a,(hl)
jr   z,$12D8
and  a
jr   nz,$12C7
ld   (hl),$01
ld   a,$28
jr   $12CB
ld   (hl),$00
ld   a,$08
ld   ($7CB2),a
ld   bc,$12D4
jp   $12A9
ld   ($1800),a
dec  c
and  a
jr   z,$12E5
ld   (hl),$00
ld   bc,$12E3
jp   $12A9
inc  sp
nop
pop  iy
pop  ix
ret
push bc
xor  a
ld   ($7CB1),a
call $12B0
pop  bc
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



rst  $08
dec  de
dec  de
ld   a,h
rla
ld   e,$00
inc  de
rra
djnz $1313
dec  de
ld   e,$7C
inc  (hl)
dec  de
ld   (hl),a
ld   (de),a
dec  (hl)
add  hl,de
dec  h
ld   (hl),$1B
ld   e,$7C
jr   nc,$1347
dec  de
djnz $138F
inc  (hl)
inc  bc
ex   af,af'
ld   b,(ix+$0c)
ld   c,(ix+$0b)
sbc  hl,bc
push af
call c,$1111
sla  l
rl   h
sla  l
rl   h
ex   de,hl
ld   b,(ix+$10)
ld   c,(ix+$0f)
sbc  hl,bc
push af
call c,$1111
ex   af,af'
push af
ex   af,af'
pop  af
inc  a
inc  a
cp   h
jr   c,$1360
cp   d
jr   c,$1360
xor  a
cp   h
jr   nz,$1396
cp   d
jr   nz,$1396
ld   hl,$0000
ld   de,$0000
pop  af
pop  af
ld   a,$FF
ld   ($7CBF),a
res  7,(ix+$11)
res  3,(ix+$11)
ret
bit  3,(ix+$11)
jr   z,$136F
pop  af
pop  af
ld   a,$05
ld   ($7CA5),a
jr   $13B6
ld   a,h
cp   d
push af
jr   nc,$1377
ex   de,hl
jr   $1381
jr   nz,$1381
ld   a,l
cp   e
jr   nc,$1381
ex   de,hl
pop  af
scf
push af
ex   af,af'
ld   b,$00
inc  b
srl  h
rr   l
cp   h
jr   c,$1384
srl  d
rr   e
djnz $138C
pop  af
jr   nc,$1396
ex   de,hl
pop  af
jr   nc,$139C
call $1111
pop  af
push af
jr   nc,$13A3
call $1119
pop  af
jr   nc,$13AB
ld   bc,$0068
jr   $13AE
ld   bc,$0028
xor  a
ld   ($7CBF),a
set  3,(ix+$11)
ret
ld   h,(ix+$1a)
ld   l,(ix+$19)
ld   d,(ix+$1c)
ld   e,(ix+$1b)
ret
di
ld   a,($7C47)
and  a
ret  z
ei
ld   ($7C1E),a
push ix
ld   a,($7E68)
cp   $1C
jr   c,$13E7
cp   $34
jr   c,$13E1
ld   ix,$7E2F
jr   $13E5
ld   ix,$7E10
jr   $13EB
ld   ix,$7DF1
ld   ($7C99),ix
ld   hl,($7E67)
ld   de,($7E69)
ld   a,$02
res  3,(ix+$11)
call $1315
ld   ($7C77),de
ld   ($7C75),hl
ld   ($7C72),bc
call $11FB
xor  a
ld   ($7C1E),a
pop  ix
ret
ld   hl,$7C55
dec  (hl)
jr   z,$1421
ld   a,$FF
ld   ($7C53),a
jr   $142A
call $13C4
ei
ld   a,$01
ld   ($7C54),a
ret
nop
nop
nop
nop
add  a,b
jr   nz,$143A
ld   (bc),a
ret  nz
jr   nc,$1442
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$4A
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  c
ld   c,$33
inc  d
dec  de
ld   l,l
ld   a,(hl)
ld   (bc),a
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
dec  c
ld   c,$2B
inc  d
dec  de
ld   l,l
ld   a,(hl)
ld   (bc),a
inc  bc
ccf

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
di
call m,$0BCB
rrc  e
rrc  d
rrc  d
exx
jr   c,$1461
ld   hl,($7E79)
inc  hl
ld   ($7E79),hl
ld   hl,($7E75)
inc  hl
ld   ($7E75),hl
exx
jp   $1516
rlc  e
rlc  e
rlc  d
rlc  d
exx
jr   c,$147E
ld   hl,($7E79)
dec  hl
ld   ($7E79),hl
ld   hl,($7E75)
dec  hl
ld   ($7E75),hl
exx
jp   $1516
ld   hl,$7E73
inc  (hl)
push de
ld   de,$0050
ld   hl,($7E79)
add  hl,de
ld   ($7E79),hl
pop  de
ret
ld   hl,$7E73
dec  (hl)
push de
ld   de,$FFB0
ld   hl,($7E79)
add  hl,de
ld   ($7E79),hl
pop  de
ret
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


ld   de,($7E75)
ld   hl,($7E6F)
xor  a
sbc  hl,de
jr   c,$14BF
ld   ix,$144F
jr   $14CA
ld   ix,$146C
ex   de,hl
xor  a
ld   hl,$0000
sbc  hl,de
ld   de,($7E73)
ld   a,($7E71)
sub  e
jr   c,$14DA
ld   iy,$1489
jr   $14E0
ld   iy,$149A
cpl
inc  a
exx
ld   l,a
ld   h,$00
exx
ld   e,l
ld   d,h
or   l
ld   l,a
or   h
ret  z
add  hl,hl
jr   c,$14F6
ex   de,hl
add  hl,hl
ex   de,hl
exx
add  hl,hl
exx
jr   $14EB
push de
exx
push hl
exx
pop  bc
ld   e,c
ld   d,b
exx
ld   bc,($7E77)
ld   hl,($7E6D)
add  hl,bc
ld   e,(hl)
ld   hl,$144B
add  hl,bc
ld   d,(hl)
pop  hl
ld   b,h
ld   c,l
exx
exx
add  hl,bc
jr   nc,$1523
jp   (ix)
exx
ex   de,hl
add  hl,bc
ex   de,hl
jr   nc,$151F
call $14AB
jr   $1530
jr   $152E
exx
ex   de,hl
add  hl,bc
ex   de,hl
jr   nc,$152E
call $14AB
jr   $1530
jr   $1510
exx
push de
exx
pop  hl
ex   de,hl
push hl
ld   hl,($7E79)
ld   a,($7E7B)
or   a
jr   z,$1542
ld   (hl),e
jr   $1546
ld   a,(hl)
and  d
or   e
ld   (hl),a
pop  de
ld   a,($7E71)
ld   h,a
ld   a,($7E73)
cp   h
jr   nz,$1510
push de
xor  a
ld   de,($7E6F)
ld   hl,($7E75)
sbc  hl,de
pop  de
jr   nz,$1510
ld   a,($7E75)
and  $03
ld   ($7E77),a
ret
push bc
ld   c,h
ld   b,e
ld   h,a
in   a,(c)
xor  l
and  h
jr   nz,$157A
dec  e
jr   nz,$1578
inc  a
pop  bc
ret
jr   $156C
dec  d
jr   nz,$1580
xor  a
pop  bc
ret
ld   e,b
jr   $156C
ld   hl,$0AC4
call $0A24
xor  a
ld   ($7CA3),a
inc  a
out  ($20),a
ld   ($7C14),a
ld   a,$07
ld   ($7C26),a
ld   hl,$7C25
inc  (hl)
ld   hl,$7C11
inc  (hl)
ret
ld   a,($7C16)
and  a
jr   nz,$15BF
ld   a,$01
ld   de,$1020
ld   hl,$11FE
call $1568
and  a
jr   z,$15D0
ld   ($7C16),a
call $1583
jr   $15D0
jr   $15D0
ld   a,$01
ld   de,$0520
ld   hl,$11FE
call $1568
and  a
jr   nz,$15D0
ld   ($7C16),a
ld   a,($7C17)
and  a
jr   nz,$15FE
ld   a,$02
ld   de,$1020
ld   hl,$11FD
call $1568
and  a
jr   z,$160F
ld   ($7C17),a
call $1583
in   a,($12)
bit  1,a
jr   nz,$15FA
inc  (hl)
inc  (hl)
inc  (hl)
inc  (hl)
ld   hl,$7C25
inc  (hl)
inc  (hl)
inc  (hl)
jr   $160F
jr   $160F
ld   a,$02
ld   de,$0520
ld   hl,$11FD
call $1568
and  a
jr   nz,$160F
ld   ($7C17),a
in   a,($11)
and  $04
ret  nz
inc  a
ld   ($7C1F),a
ret
ld   l,a
ld   b,e
ld   d,b
and  b
ld   l,(hl)
ld   b,d
ld   c,a
and  b
ld   l,(hl)
ld   b,c
ld   c,(hl)
and  b
ld   l,l
ld   b,b
ld   c,l
and  b
ld   l,h
ccf
ld   c,h
and  b
ld   l,h
ld   a,$4B
and  b
ld   l,e
dec  a
ld   c,d
and  b
ld   l,d
inc  a
ld   c,c
and  b
ld   l,d
dec  sp
ld   c,b
and  b
ld   l,c
ld   a,($9E48)
ld   l,b
ld   a,($9C48)
ld   l,b
add  hl,sp
ld   c,b
sbc  a,d
ld   l,b
add  hl,sp
ld   c,b
sub  a
ld   h,a
jr   c,$1698
sub  h
ld   h,a
jr   c,$169C
sub  c
ld   h,(hl)
scf
ld   c,c
adc  a,a
ld   h,(hl)
ld   (hl),$49
adc  a,l
ld   h,l
dec  (hl)
ld   c,c
adc  a,c
ld   h,l
inc  (hl)
ld   c,c
add  a,(hl)
ld   h,h
inc  (hl)
ld   c,d
add  a,d
ld   h,h
inc  sp
ld   c,d
ld   a,(hl)
ld   h,e
ld   ($7B4A),a
ld   h,e
ld   sp,$784B
ld   h,d
jr   nc,$16C3
ld   (hl),h
ld   h,d
jr   nc,$16C8
ld   l,(hl)
ld   h,d
cpl
ld   c,l
ld   l,b
ld   e,a
scf
ld   d,b
ld   e,(hl)
ld   h,c
cpl
ld   d,b
ld   e,d
ld   h,c
ld   l,$53
ld   d,b
ld   h,b
ld   l,$55
ld   c,e
ld   e,a
dec  l
ld   d,(hl)
ld   b,(hl)
ld   e,a
dec  l
ld   d,a
ld   b,d
ld   l,a
and  b
ld   h,h
and  b
ld   l,a
sbc  a,a
ld   h,h
sbc  a,a
ld   l,a
sbc  a,(hl)
ld   h,h
sbc  a,(hl)
ld   l,a
sbc  a,l
ld   h,h
sbc  a,l
ld   l,(hl)
sbc  a,h
ld   h,l
sbc  a,h
ld   l,(hl)
sbc  a,e
ld   h,l
sbc  a,e
ld   l,l
sbc  a,d
ld   h,(hl)
sbc  a,d
ld   l,l
sbc  a,c
ld   h,(hl)
sbc  a,c
ld   l,h
sbc  a,b
ld   h,a
sbc  a,b
ld   l,e
sub  a
ld   l,b
sub  a
rst  $38
nop
nop
inc  b
ld   (de),a
nop
nop
djnz $16CA
nop
nop
ld   a,b
nop
nop
nop
cp   $00
nop
nop
ld   a,a
nop
nop
nop
rra
add  a,b
nop
nop
rra
add  a,b
nop
nop
ccf
nop
nop
nop
ld   a,(hl)
nop
nop
ld   bc,$00F8
nop
inc  bc
ret  p
nop
nop
rrca
ret  nz
nop
djnz $1713
add  a,b
nop
ld   a,b
ld   a,(hl)
nop
nop
cp   $FC
nop
nop
ld   a,a
ret  p
nop
nop
rra
ret  po
nop
nop
rrca
add  a,b
nop
nop
inc  bc
nop
nop
nop

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
dec  de
ld   a,(bc)
ld   a,h
rla
ld   e,$27
rla
add  hl,de
ld   h,b
ld   bc,$1927
ld   h,b
inc  d
ld   bc,$9F19
ld   bc,$1927
sbc  a,a
inc  d
add  hl,bc
ld   bc,$C503
push iy
push ix
call $14AD
pop  ix
pop  iy
pop  bc
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


pop  hl
pop  de
sla  e
rl   d
sla  e
rl   d
sla  e
rl   d
sla  e
rl   d
sla  e
rl   d
sla  e
rl   d
push bc
ld   c,$00
call $0D2F
and  $03
ld   ($7E77),a
ld   de,$4000
add  hl,de
ld   ($7E79),hl
pop  bc
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



rst  $08
jr   c,$1784
ld   (hl),c
ld   a,(hl)
ld   (bc),a
dec  de
ld   l,a
ld   a,(hl)
ld   (bc),a
add  hl,sp
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
jr   c,$1790
ld   (hl),c
ld   a,(hl)
ld   (bc),a
dec  de
ld   l,a
ld   a,(hl)
ld   (bc),a
jr   c,$1784
dec  de
ld   (hl),e
ld   a,(hl)
ld   (bc),a
dec  de
ld   (hl),l
ld   a,(hl)
ld   (bc),a
ld   a,($393B)
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
ex   af,af'
rla
ld   bc,$0309

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
dec  de
add  hl,de
ld   d,$08
inc  a
inc  a
rlca
ld   bc,$193D
inc  bc
ld   a,$3F
inc  a
inc  a
rlca
ld   bc,$063D
add  hl,de
ld   b,$3E
add  hl,de
ld   b,$3E
ld   b,b
ld   b,b
add  hl,de
inc  b
inc  d
ex   af,af'
rla
add  hl,de
rst  $38
ld   h,$1E
sub  h
rla
rlca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
add  hl,de
inc  b
ld   a,$19
inc  b
ld   a,$06
ld   bc,$0619
ld   a,$14
ld   bc,$0540
add  hl,bc
dec  b
dec  b
ld   a,(bc)
ex   af,af'
jr   z,$17EE
cp   d
rla
rlca
rlca
rlca
rlca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
add  hl,de
inc  b
ld   b,c
rlca
add  hl,de
inc  bc
ld   a,$14
inc  de
add  hl,de
inc  b
ld   b,c
ld   b,b
add  hl,de
dec  b
ld   a,$14
ld   b,d
add  hl,de
inc  bc
ld   a,$14
ld   b,d
rlca
rlca
ld   b,d
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
dec  de
dec  de
ld   a,h
rla
ld   e,$01
jr   $1817
ex   af,af'
ld   b,$1F
inc  b
jr   $181D
ex   af,af'
inc  bc
ex   af,af'
ex   af,af'
dec  de
nop
scf
dec  de
nop
or   b
dec  b
dec  de
sub  (hl)
ld   a,h
rla
add  hl,hl
dec  de
nop
ccf
dec  de
nop
or   b
dec  b
dec  de
sub  l
ld   a,h
rla
add  hl,hl
dec  de
nop
ld   b,a
dec  de
nop
or   b
dec  b
dec  de
ld   c,c
ld   a,h
rla
add  hl,hl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08

dec  de
nop
adc  a,h
dec  de
sub  e
inc  b
dec  de
ld   bc,$1B05
jr   z,$1840
ld   hl,($CF03)
dec  de
nop
rrca
ld   b,e
dec  de
nop
ccf
ld   b,e
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08
dec  c
dec  de
nop
ld   b,b
dec  de
nop
inc  a
ld   b,h
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


rst  $08			; Map to get back
dec  c
dec  de
jr   nc,$18CF
dec  de
ld   (hl),b
ld   (bc),a
ld   b,h
add  hl,de
inc  bc
dec  de
dec  a
ld   a,h
inc  b
inc  bc
push bc
ld   a,$0C
out  ($19),a
ld   a,$50
out  ($0C),a
ld   de,$C050
ld   bc,$4000
ld   hl,$004F
push de
push hl
ld   a,(bc)
ld   (hl),a
dec  hl
inc  bc
dec  e
jr   nz,$1872
pop  hl
ld   de,$0050
add  hl,de
pop  de
dec  d
jr   nz,$1870
pop  bc
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
dec  de
ld   a,h
rla
ex   af,af'
ld   e,$94
jr   $18AA
ex   af,af'
ld   b,$1F
sub  a
jr   $18B0
ex   af,af'
inc  bc
ex   af,af'
dec  de
dec  c
ld   a,h
rla
ld   e,$B2
jr   $18BB
nop
ld   b,e
dec  de
nop
adc  a,h
dec  b
dec  de
nop
ld   b,b
dec  e
dec  de
dec  c
ld   a,h
ld   ($1F45),hl
cp   h
jr   $18CE
nop
ld   b,l
dec  de
nop
adc  a,h
dec  b
add  hl,de
jr   nc,$18E5
ld   bc,$C41E
jr   $18DC
nop
ex   af,af'
dec  e
dec  de
ld   c,$7C
rla
ld   e,$DE
jr   $18E7
nop
add  hl,bc
dec  de
nop
adc  a,h
dec  b
dec  de
nop
ld   b,b
dec  e
dec  de
ld   c,$7C
ld   ($1F45),hl
ret  pe
jr   $18FA
nop
dec  bc
dec  de
nop
adc  a,h
dec  b
add  hl,de
jr   nc,$1911
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
or   (hl)
dec  de
cp   d
inc  b
dec  de
ld   bc,$1B05
jr   z,$18FE
ld   hl,($CF03)
dec  de
nop
or   a
dec  de
cp   a
inc  b
dec  de
ld   bc,$1B05
jr   z,$190D
ld   hl,($CF03)
dec  de
ret  nz
ld   a,(bc)
ld   bc,$1E08
ld   e,$19
dec  c
dec  d
ex   af,af'
ex   af,af'
ld   b,(hl)
ld   b,a
dec  de
nop
ld   (bc),a
inc  d
jr   $193B
rra
add  hl,de
rlca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$7C
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   c,b
ld   c,c
ld   c,d
dec  de
dec  de
ld   a,h
rla
ld   e,$44
add  hl,de
dec  de
adc  a,e
ld   a,h
jr   nc,$1949
or   c
ex   af,af'
ex   af,af'
ld   ($194B),hl
ld   (bc),a
ld   c,e
add  hl,de
inc  bc
ld   c,e
ld   c,h
dec  c
ld   c,$2F
inc  d
dec  de
ld   l,l
ld   a,(hl)
ld   (bc),a
add  hl,de
rra
add  hl,de
adc  a,d
add  hl,de
jr   $1964
ld   c,$4D
add  hl,de
sbc  a,l
add  hl,de
xor  h
dec  c
add  hl,de
ld   a,$40
ld   ($2D19),hl
ld   b,d
add  hl,de
inc  b
add  hl,de
inc  h
ld   b,d
add  hl,de
ex   af,af'
add  hl,de
dec  e
ld   b,d
add  hl,de
dec  c
add  hl,de
ld   d,$42
add  hl,de
inc  d
add  hl,de
dec  c

ld   b,d
add  hl,de
rra
add  hl,de
ld   b,$42
add  hl,de
jr   z,$198E
inc  bc
ld   b,d
add  hl,de
and  b
add  hl,de
inc  bc
ld   b,d
dec  de
nop
dec  e
dec  de
nop
adc  a,l
dec  de
jp   nz,$1B16
ld   l,b
ex   af,af'
ld   c,(hl)
dec  de
ret  nz
djnz $19A8
nop
ld   h,(hl)
dec  de
inc  bc
ex   af,af'
dec  de
jr   z,$1999
ld   c,(hl)
ld   c,a
dec  de
add  a,b
jr   z,$19B6
nop
ld   c,h
dec  de
rrca
ex   af,af'
dec  de
jr   z,$19A7
ld   c,(hl)
dec  de
nop
jr   z,$19C3
nop
xor  h
dec  de
pop  af
rlca
dec  de
ex   af,af'
ex   af,af'
ld   c,(hl)
dec  de
nop
ld   h,$1B
nop
xor  a
dec  de
rst  $10
rlca
dec  de
jr   z,$19C5
ld   c,(hl)
add  hl,de
inc  c
add  hl,de
xor  d
add  hl,de
ld   l,(hl)
add  hl,de
dec  d
ld   d,b
dec  de
nop
inc  b
dec  de
nop
or   b
dec  de
jr   z,$19D8
ld   l,$03
ld   c,c
ld   c,(hl)
ld   c,(hl)
cpl
dec  de
nop
dec  bc
dec  de
nop
xor  a
dec  de
ld   h,(hl)
inc  b
dec  de
add  hl,bc
dec  b
dec  de
jr   z,$19ED
ld   hl,($C419)
add  hl,de
xor  d
add  hl,de
ld   l,h
add  hl,de
dec  d
ld   d,b
dec  de
nop
inc  sp
dec  de
nop
or   b
dec  de
jr   z,$1A00
add  hl,de
ld   b,d
add  hl,hl
add  hl,de
rst  $10
add  hl,de
xor  (hl)
add  hl,de
djnz $1A1B
ld   c,$4D
dec  de
nop
dec  sp
dec  de
nop
or   b
dec  de
jr   z,$1A15
add  hl,de
ld   d,e
add  hl,hl
add  hl,de
rst  $30
add  hl,de
xor  (hl)
add  hl,de
djnz $1A30
ld   c,$4D
dec  de
nop
ld   b,e
dec  de
nop
or   b
dec  de
jr   z,$1A2A
add  hl,de
ld   c,a
add  hl,hl
dec  de
rla
ld   bc,$AE19
add  hl,de
djnz $1A46
ld   c,$4D
inc  l
dec  l
ld   d,c
add  hl,de
jr   nc,$1A3D
ex   af,af'
dec  de
sub  (hl)
ld   a,h
inc  b
dec  de
sub  l
ld   a,h
inc  b
dec  de
ld   c,c
ld   a,h
inc  b
ld   d,d
dec  de
ld   a,(bc)
ld   a,h
rla
ld   e,$50
ld   a,(de)
dec  de
nop
ccf
rra
ld   d,e
ld   a,(de)
dec  de
nop
rrca
ld   b,e
dec  de
nop
inc  bc
dec  de
nop
and  e
dec  de
add  hl,sp
inc  b
dec  de
inc  b
dec  b
dec  de
jr   z,$1A6B
ld   hl,($1B1B)
ld   a,h
rla
ld   e,$86
ld   a,(de)
dec  de
inc  c
ld   a,h
rla
ex   af,af'
ld   e,$85
ld   a,(de)
dec  de
dec  bc
ld   a,h
rla
ld   e,$80
ld   a,(de)
ld   a,(bc)
ld   d,e
ld   b,(hl)
rra
add  a,d
ld   a,(de)
ld   d,e
rlca
rra
add  a,(hl)
ld   a,(de)
rlca
dec  de
adc  a,e
ld   a,h
inc  (hl)
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
ld   (de),a
ld   c,$18
ld   a,l
rla
dec  c
ld   h,$1E
and  c
ld   a,(de)
add  hl,de
rlca
add  hl,de
nop
ld   c,$18
ld   a,l
rra
xor  b
ld   a,(de)
add  hl,de
dec  b
add  hl,de
nop
ld   c,$37
ld   a,l
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
ld   (de),a
ld   c,$F9
ld   a,h
rla
ld   ($1E26),hl
cp   a
ld   a,(de)
add  hl,de
ld   b,$19
nop
ld   c,$18
ld   a,l
rra
ret  nz
ld   a,(de)
ld   d,h
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
ld   (de),a
ld   c,$F9
ld   a,h
rla
dec  c
ld   h,$1E
rst  $10
ld   a,(de)
add  hl,de
inc  bc
add  hl,de
nop
ld   c,$F9
ld   a,h
rra
ret  c
ld   a,(de)
ld   d,l
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
ld   (de),a
ld   c,$F9
ld   a,h
rla
dec  c
ld   h,$1E
rst  $28
ld   a,(de)
add  hl,de
ld   (bc),a
add  hl,de
nop
ld   c,$F9
ld   a,h
rra
or   $1A
add  hl,de
inc  b
add  hl,de
nop
ld   c,$18
ld   a,l
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
ld   (de),a
ld   c,$DA
ld   a,h
rla
add  hl,de
ld   (bc),a
ld   h,$1E
ex   af,af'
dec  de
ld   d,(hl)
rra
add  hl,bc
dec  de
ld   d,a
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
ld   (de),a
ld   c,$DA
ld   a,h
rla
ld   ($1E26),hl
rra
dec  de
ld   ($0019),hl
ld   c,$F9
ld   a,h
rra
jr   nz,$1B3A
ld   e,b
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
rrca
ld   a,h
rla
ld   e,c
dec  de
rrca
ld   a,h
inc  b
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$6A
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
ld   (de),a
ld   c,$DA
ld   a,h
rla
dec  c
ld   h,$1E
ld   b,c
dec  de
dec  c
add  hl,de
nop
ld   c,$DA
ld   a,h
rra
ld   b,d
dec  de
ld   e,d
dec  de
ld   c,e
ld   a,h
ld   (bc),a
dec  de
inc  a
ld   a,h
inc  b
add  hl,de
inc  h
ld   e,e
dec  de
rlca
ld   a,h
inc  b
add  hl,de
ld   a,(bc)
ld   e,e
dec  de
ld   d,(hl)
ld   a,h
inc  b
dec  de
xor  d
ld   a,h
rla
dec  de
rrca
ld   a,h
inc  b
dec  de
ld   c,$7C
rla
dec  de
dec  c
ld   a,h
rla
dec  de
dec  bc
ld   a,h
rla
ld   e,$70
dec  de
ld   bc,$0827
dec  c
ld   e,h
ld   e,$8C
dec  de
dec  de
db   $fd,$ff
ld   e,l
ld   e,$83
dec  de
add  hl,de
rlca
rra
add  a,l
dec  de
add  hl,de
ex   af,af'
dec  de
rrca
ld   a,h
inc  b
rra
and  l
dec  de
ex   af,af'
add  hl,de
ld   (bc),a
ld   e,l
ld   e,$A4
dec  de
ld   e,(hl)
ex   af,af'
add  hl,de
inc  b
ld   e,l
ld   e,$A4
dec  de
ld   e,(hl)
ex   af,af'
add  hl,de
ld   b,$5D
ld   e,$A4
dec  de
ld   e,(hl)
rlca
inc  bc
ret
call $115B
ret
ld   ($7CEB),a
ret
ld   ($7CEB),a
ret
call $115B
call $1166
ret
ld   ($7CEB),a
ld   ($7D0A),a
ret
call $115B
call $1166
call $1171
ret
ld   ($7CEB),a
call $1166
ret
and  (hl)
dec  de
and  a
dec  de
xor  e
dec  de
xor  a
dec  de
or   e
dec  de
pop  bc
dec  de
rr   e
cp   d
dec  de
ld   a,($7C3C)
ld   hl,$1BD2
call $114C
ld   hl,$1BF3
ld   a,$81
push hl
ex   de,hl
jp   (hl)
ret
ld   a,$01
ld   ($7C46),a
ret
ret
call $115B
ld   a,($7CCF)
and  a
jp   nz,$1BF4
ld   bc,$7CF9
ret
ld   a,($7CD0)
and  a
jr   nz,$1C12
call $115B
ld   bc,$7CF9
ret
ld   bc,$7CF9
ld   a,($7CCF)
and  a
call nz,$115B
ret
call $115B
call $1166
ld   bc,$7CF9
ld   a,($7CCF)
and  a
jp   nz,$1BF4
ld   bc,$7D18
ret
ld   bc,$7D18
ld   a,($7CCF)
and  a
jr   z,$1C48
call $115B
ld   a,($7CD0)
and  a
call z,$1166
ret
call $115B
call $1166
call $1171
ld   bc,$7D18
ld   a,($7CCF)
and  a
jp   nz,$1BF4
ld   bc,$7CDA
ret
call $1166
ld   a,($7CCF)
and  a
ld   bc,$7CF9
jr   z,$1C72
call $115B
jp   $1BF4
ld   bc,$7D18
ret
jp   m,$FB1B
dec  de
add  hl,bc
inc  e
ld   d,$1C
ld   hl,$491C
inc  e
ld   h,b
inc  e
dec  (hl)
inc  e
xor  a
ld   ($7C47),a
push bc
ld   a,($7C3C)
ld   bc,$7CDA
ld   hl,$1C76
call $114C
ld   hl,$1CA0
ld   a,($7C39)
push hl
ex   de,hl
jp   (hl)
ld   ($7C43),bc
pop  bc
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



rst  $08
dec  b
dec  b
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
inc  h
ld   e,a
ld   l,$05
ld   d,e
ld   b,c
ld   b,(hl)
ld   b,l
jr   nz,$1CE7
ld   d,d
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
inc  h
ld   e,a
ld   l,$05
ld   b,(hl)
ld   c,a
ld   d,l
ld   c,h
jr   nz,$1CF6
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ret  nz
ld   a,h
rla
ld   e,$EF
inc  e
dec  de
nop
inc  hl
ld   e,a
ld   l,$05
ld   b,a
ld   d,d
ld   b,c
ld   c,(hl)
ld   b,h
cpl
dec  de
nop
inc  h
dec  de
nop
adc  a,b
dec  de
jr   z,$1CED
ld   l,$04
ld   d,e
ld   c,h
ld   b,c
ld   c,l
cpl
rra
nop
dec  e
add  hl,de
adc  a,b
add  hl,de
inc  d
ld   c,e
dec  de
nop
inc  hl
ld   e,a
ld   l,$05
ld   c,b
ld   c,a
ld   c,l
ld   b,l
ld   d,d
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
inc  h
ld   e,a
ld   l,$04
ld   d,a
ld   b,c
ld   c,h
ld   c,e
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   c,c
ld   a,h
rla
ex   af,af'
add  hl,de
ld   sp,$1E26
ld   hl,($071D)
dec  de
nop
inc  hl
ld   e,a
ld   l,$05
ld   sp,$4F20
ld   d,l
ld   d,h
cpl
rra
ld   c,l
dec  e
add  hl,de
ld   ($1E26),a
ld   b,b
dec  e
dec  de
nop
ld   ($2E5F),hl
ld   b,$32
jr   nz,$1D88
ld   d,l
ld   d,h
ld   d,e
cpl
rra
ld   c,l
dec  e
dec  de
nop
ld   ($2E5F),hl
ld   b,$33
jr   nz,$1D98
ld   d,l
ld   d,h
ld   d,e
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
sub  l
ld   a,h
rla
add  hl,de
ld   sp,$1E26
ld   l,e
dec  e
dec  de
nop
jr   nz,$1DBC
ld   l,$08
ld   d,e
ld   d,h
ld   d,d
ld   c,c
ld   c,e
ld   b,l
jr   nz,$1D98
cpl
rra
ld   a,d
dec  e
dec  de
nop
ld   hl,$2E5F
ex   af,af'
ld   d,e
ld   d,h
ld   d,d
ld   c,c
ld   c,e
ld   b,l
jr   nz,$1DAB
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
sub  (hl)
ld   a,h
rla
ex   af,af'
add  hl,de
ld   sp,$1E26
sbc  a,b
dec  e
rlca
dec  de
nop
ld   ($2E5F),hl
ld   b,$42
ld   b,c
ld   c,h
ld   c,h
jr   nz,$1DC5
cpl
rra
cp   e
dec  e
add  hl,de
ld   ($1E26),a
xor  (hl)
dec  e
dec  de
nop
ld   ($2E5F),hl
ld   b,$42
ld   b,c
ld   c,h
ld   c,h
jr   nz,$1DDC
cpl
rra
cp   e
dec  e
dec  de
nop
ld   ($2E5F),hl
ld   b,$42
ld   b,c
ld   c,h
ld   c,h
jr   nz,$1DED
cpl
inc  bc
ld   a,$30
ld   ($7C96),a
ld   ($7C95),a
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


push bc
push iy
call $1246
pop  iy
pop  bc
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   h,b
ld   h,c
ld   h,d
ld   d,d
dec  de
and  b
ld   a,h
inc  (hl)
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
jr   nz,$1DFB
nop
dec  l
dec  de
jr   z,$1DED
ld   l,$09
ld   b,a
ld   b,c
ld   c,l
ld   b,l
jr   nz,$1E3C
ld   d,(hl)
ld   b,l
ld   d,d
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   c,c
ld   a,h
ex   af,af'
ld   h,e
rla
add  hl,de
inc  sp
ld   h,$1E
add  a,e
ld   e,$64
add  hl,de
nop
ld   c,$56
ld   a,l
add  hl,de
ex   af,af'
dec  c
dec  d
ex   af,af'
ex   af,af'
add  hl,de
ld   b,$14
dec  de
ld   hl,$650F
add  hl,de
ld   de,$0814
rla
add  hl,de
add  a,b
dec  e
add  hl,de
rst  $30
ld   a,(de)
inc  hl
add  hl,de
rra
inc  d
jr   $1E2A
dec  de
ld   c,d
ld   a,h
jr   nc,$1E43
sub  l
ld   a,h
rla
add  hl,de
inc  sp
ld   h,$1E
ld   ($601E),a
add  hl,de
nop
ld   c,$DA
ld   a,h
add  hl,de
inc  b
dec  c
dec  d
ex   af,af'
ex   af,af'
ex   af,af'
add  hl,de
ld   b,$14
dec  de
ld   hl,$650F
add  hl,de
ld   de,$0814
rla
add  hl,de
rst  $30
ld   a,(de)
inc  hl
add  hl,de
ld   (de),a
inc  d
rla
ld   e,$5F
ld   e,$08
add  hl,de
ld   de,$0814
rla
add  hl,de
add  a,b
dec  e
inc  hl
add  hl,de
rra
inc  d
jr   $1E6B
dec  de
dec  bc
ld   a,h
rla
ld   e,$80
ld   e,$1B
inc  c
ld   a,h
rla
dec  de
ex   af,af'
ld   a,h
rla
ld   h,$1E
add  a,b
ld   e,$1B
djnz $1EF6
jr   nc,$1E97
ld   a,l
ld   a,(hl)
jr   nc,$1EB7
rra
adc  a,b
ld   e,$0D
ld   c,$A9
inc  c
rrca
ld   h,d
ld   d,d
ld   h,(hl)
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
sub  l
ld   a,h
ex   af,af'
ld   h,e
rla
add  hl,de
inc  sp
ld   h,$1E
and  e
ld   e,$67
add  hl,de
ld   (bc),a
dec  de
ld   b,b
ld   a,h
inc  b
rra
xor  c
ld   e,$0D
ld   c,$46
ld   a,(bc)
rrca
ld   l,b
ld   d,d
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
sub  (hl)
ld   a,h
ex   af,af'
ld   h,e
rla
add  hl,de
inc  (hl)
ld   h,$1E
exx
ld   e,$69
ld   h,h
dec  de
and  d
ld   a,h
ld   h,e
add  hl,de
rlca
dec  de
ld   b,b
ld   a,h
inc  b
dec  de
ld   (hl),$7C
jr   nc,$1EE2
ld   b,b
dec  de
scf
ld   a,h
inc  b
dec  de
ret  nc
ld   a,h
jr   nc,$1F3D
ld   l,e
ld   l,h
ld   h,d
rra
rst  $18
ld   e,$0D
ld   c,$8E
ld   a,(bc)
rrca
ld   l,l
ld   d,d
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   l,(hl)
dec  de
sub  l
ld   a,h
ex   af,af'
rla
add  hl,de
ld   ($1E26),a
jp   p,$071E
rra
call p,$631E
ld   d,d
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  c
ld   c,$7E
inc  c
rrca
ld   l,a
inc  bc
xor  e
inc  e
cp   d
inc  e
ld   c,$1D
ld   c,(hl)
dec  e
ld   a,e
dec  e
ret  z
inc  e
xor  e
inc  e
ld   bc,$AB1D
inc  e
pop  hl
ld   e,$F2
dec  e
adc  a,h
ld   e,$AB
ld   e,$D1
dec  e
push af
ld   e,$CF
dec  de
sbc  a,b
ld   a,h
inc  (hl)
dec  de
ld   e,$7C
jr   nc,$1F76
dec  de
ld   e,$7C
inc  (hl)
dec  de
sub  a
ld   a,h
rla
ld   e,$38
rra
dec  c
ld   c,$4B
inc  c
rrca
rra
add  hl,sp
rra
ld   h,h
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
ld   a,d
dec  de
jr   z,$1F49
add  hl,de
inc  b
ld   a,$19
inc  b
ld   a,$1E
ld   d,b
rra
ld   (hl),b
db   $fd,$1e
rra
ld   e,c
rra
ld   (hl),b
dec  c
rra
add  hl,de
ld   d,b
dec  de
and  b
ld   a,h
inc  b
inc  h
dec  de
ld   e,$7C
jr   nc,$1F90
dec  de
ld   e,$7C
inc  (hl)
rlca
rlca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
sbc  a,a
ld   a,h
rla
ex   af,af'
dec  de
sbc  a,a
ld   a,h
inc  (hl)
dec  de
and  b
ld   a,h
rla
ld   e,$86
rra
dec  de
ld   b,b
ld   a,h
rla
ld   ($1B71),hl
ld   b,b
ld   a,h
inc  b
dec  c
ld   (hl),c
rra
adc  a,a
rra
dec  de
ld   b,b
ld   a,h
inc  b
dec  de
ld   b,l
ld   a,h
rla
ld   (hl),c
dec  de
ld   b,l
ld   a,h
inc  (hl)
inc  bc
ld   a,(hl)
ld   hl,$0000
and  a
ret  z
ld   hl,$01B0
bit  7,a
jr   z,$1FA4
call nz,$1111
ret
ld   hl,$7E7E
ld   a,($7C0A)
and  a
jr   z,$1FCC
ld   a,(hl)
and  a
jr   nz,$1FBF
in   a,($13)
neg
ld   ($7C59),a
ld   a,$03
out  ($28),a
jr   $1FCA
in   a,($13)
neg
ld   ($7C57),a
ld   a,$02
out  ($28),a
jr   $1FEF
ld   a,($7C1B)
and  a
jr   z,$1FF1
ld   a,($7C35)
and  a
jr   nz,$1FF1
ld   a,(hl)
and  a
jr   nz,$1FE7
in   a,($13)
ld   ($7C59),a
ld   a,$01
out  ($28),a
jr   $1FEF
in   a,($13)
ld   ($7C57),a
xor  a
out  ($28),a
jr   $2009
ld   a,(hl)
and  a
jr   nz,$2000
in   a,($13)
ld   ($7C59),a
ld   a,$03
out  ($28),a
jr   $2009
in   a,($13)
ld   ($7C57),a
ld   a,$02
out  ($28),a
ld   a,(hl)
xor  $01
ld   (hl),a
ld   a,($7C34)
and  a
ret  nz
ld   a,($7C47)
and  a
ret  z
ld   a,($7C54)
and  a
ret  nz
ld   hl,$7C57
call $1F94
ld   ($7C75),hl
push hl
ld   hl,$7C59
call $1F94
ld   ($7C77),hl
pop  de
bit  7,h
jr   nz,$204B
xor  a
cp   h
jr   nz,$2046
cp   d
jr   nz,$2046
cp   e
jr   nz,$2046
cp   l
jr   nz,$2046
ld   hl,$0428
jr   $2053
ld   hl,$0028
jr   $204E
ld   hl,$0068
push hl
call $11FB
pop  hl
ld   ($7C72),hl
ret
ld   hl,$7C58
ld   a,($7C57)
bit  7,a
push af
sub  (hl)
ex   af,af'
pop  af
jp   m,$2077
ex   af,af'
jp   m,$2074
add  a,(hl)
ld   (hl),a
cp   $03
jp   c,$2073
ld   a,$03
ld   (hl),a
jp   $207E
ld   a,(hl)
cp   $02
jp   c,$207E
dec  (hl)
ld   a,(hl)
ld   h,a
ld   l,$00
di
ld   ($7C7D),hl
ld   hl,$7C59
ld   de,$0000
ld   a,($7CA2)
cp   $02
jp   nc,$20A7
ld   a,(hl)
and  a
jp   z,$20A7
bit  7,a
jp   nz,$20A4
ld   de,$00C0
jp   $20A7
ld   de,$FF40
ld   ($7C7F),de
ei
ret
nop
ld   (bc),a
nop
djnz $20B2
jr   nz,$20B4
jr   nc,$20B6
ld   b,b
nop
ld   (bc),a
nop
ex   af,af'
nop
djnz $20BE
ld   d,$00
jr   $20C2
inc  h
nop
jr   z,$20C6
ld   l,$00
scf
nop
ld   a,($3F00)
nop
ld   b,a
nop
ld   c,(hl)
nop
jr   z,$20D4
jr   nz,$20D6
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
jp   c,$1B0F
rrc  a
dec  de
ccf
ld   a,h
jr   nc,$20FE
pop  de
ld   a,h
jr   nc,$20EA

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   b,d
ld   a,h
jr   nc,$2108
jp   c,$1B0F
in   a,($0F)
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
jp   c,$1B0F
jp   p,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   (bc),a
djnz $211B
jp   m,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   b,d
ld   a,h
jr   nc,$2124
ld   hl,$1B10
ld   a,(bc)
djnz $2112

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   a,h
jr   nc,$2130
add  hl,hl
djnz $2133
ld   l,(hl)
rrca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   a,h
jr   nc,$213C
ld   sp,$1B10
ld   l,(hl)
rrca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   b,d
ld   a,h
jr   nc,$2148
add  hl,sp
djnz $214B
ld   l,(hl)
rrca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   a,h
jr   nc,$2154
adc  a,l
rrca
dec  de
ld   a,$0F
dec  de
ld   b,c
djnz $2145

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   a,h
jr   nc,$2163
adc  a,l
rrca
dec  de
ld   a,$0F
dec  de
ld   c,c
djnz $2154

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   b,d
ld   a,h
jr   nc,$2172
adc  a,l
rrca
dec  de
ld   e,c
djnz $2178
ld   d,c
djnz $2163

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
adc  a,b
djnz $2180
ld   (hl),b
djnz $2183
jp   c,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
adc  a,b
djnz $218B
ld   a,b
djnz $218E
jp   c,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   b,d
ld   a,h
jr   nc,$2197
adc  a,l
rrca
dec  de
add  a,b
djnz $219D
jp   c,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
pop  de
ld   a,h
jr   nc,$21A6
ccf
ld   a,h
jr   nc,$21AA
jp   c,$1B0F
cp   e
rrca
dec  de
jp   c,$030F
rst  $10
jr   nz,$2182
jr   nz,$2190
jr   nz,$219A
jr   nz,$21A4
ld   hl,$210F
dec  de
ld   hl,$2127
inc  sp
ld   hl,$2142
ld   d,c
ld   hl,$2160
ld   l,e
ld   hl,$2176
add  a,l
ld   hl,$F1D9
add  a,$05
ld   ($7C92),a
pop  af
add  a,$04
ld   b,a
pop  hl
ld   a,l
pop  hl
pop  de
and  a
jr   z,$21DA
cp   $01
jr   nz,$21D4
ld   ($7C4E),a
ld   de,$0500
jr   $21DA
ld   ($7C4D),a
ld   de,$0100
ld   c,a
ld   a,d
cp   $28
jr   nc,$2227
ld   a,h
cp   $0A
jr   nc,$21F5
ld   hl,$20D1
ld   a,c
call $114C
ld   h,b
ld   ($7C8F),hl
ld   hl,$01C0
jr   $2227
cp   $46
jr   c,$220B
ld   hl,$20D1
ld   a,c
call $114C
ld   a,b
neg
ld   ($7C90),a
ld   hl,$4E00
jr   $2227
ld   a,($7C15)
dec  a
jr   nz,$2214
ld   a,b
jr   $2224
cp   $04
jr   nz,$221D
ld   a,b
neg
jr   $2224
ld   a,b
bit  0,l
jr   nz,$2224
neg
ld   ($7C90),a
ld   ($7E67),hl
ld   ($7E69),de
exx
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
sbc  a,l
ld   a,h
inc  (hl)
dec  de
ld   (hl),$7C
inc  (hl)
dec  de
and  d
ld   a,h
inc  (hl)
dec  de
xor  e
ld   a,h
inc  (hl)
dec  c
ld   c,$76
dec  bc
rrca
dec  de
ld   c,l
ld   a,h
inc  (hl)
add  hl,de
nop
ld   c,$DA
ld   a,h
dec  de
ld   b,e
ld   a,h
ld   (bc),a
dec  de
call $347C
dec  de
xor  a
ld   a,h
inc  (hl)
dec  de
ret  nz
ld   a,h
inc  (hl)
dec  de
ld   a,($347C)
dec  de
ld   c,(hl)
ld   a,h
inc  (hl)
dec  de
push bc
ld   a,h
inc  (hl)
dec  de
dec  d
ld   a,h
rla
ex   af,af'
ld   e,$8A
ld   ($1B07),hl
rrca
ld   a,h
rla
add  hl,de
ld   a,(bc)
ld   e,e
ld   e,h
ld   e,$84
ld   ($1F0D),hl
add  a,l
ld   ($0822),hl
dec  de
jr   c,$2305
inc  b
ld   e,$1D
inc  hl
dec  de
ld   b,a
ld   a,h
jr   nc,$22AB
jr   $22AF
ld   d,d
ld   a,h
inc  b
dec  de
ld   b,d
ld   a,h
jr   nc,$22B5
inc  bc
ex   af,af'
add  hl,de
dec  e
ld   c,$4E
ld   a,(hl)
inc  b
dec  de
ld   d,l
ld   a,h
inc  b
dec  de
ld   d,e
ld   a,h
jr   nc,$22C8
push bc
ld   a,h
jr   nc,$22CC
nop
jr   nc,$230F
dec  de
nop
rlca
inc  d
dec  de
dec  d
ld   a,h
rla
ld   a,(bc)
ld   (hl),b
xor  l
jr   nz,$22E5
dec  de
nop
rrca
ld   e,e
inc  d
add  hl,de
ld   a,(bc)
ld   e,e
ex   af,af'
ld   e,$DB
ld   ($0519),hl
ld   e,h
ld   e,$D7
ld   ($1F0D),hl
ret  c
ld   ($1F22),hl
sbc  a,$22
add  hl,de
ld   (bc),a
inc  d
dec  de
rst  $38
dec  b
ld   e,e
dec  de
rst  $38
dec  b
ld   e,e
ld   (hl),d
ld   l,h
dec  de
adc  a,l
rrca
dec  de
ld   a,$0F
add  hl,de
add  hl,de
ld   c,$4E
ld   a,(hl)
inc  h
dec  de
nop
jr   z,$2354
ld   e,$04
inc  hl
dec  de
ld   c,(hl)
rrca
dec  de
sbc  a,b
djnz $2321
ld   a,(bc)
inc  hl
dec  de
and  b
djnz $2323
ld   e,(hl)
rrca
dec  de
ld   l,(hl)
rrca
dec  de
inc  (hl)
ld   a,h
rla
ld   e,$1A
inc  hl
add  hl,de
jr   nc,$2332
cp   d
ld   a,h
inc  b
rra
inc  b
inc  h
dec  de
call $307C
add  hl,de
ld   (bc),a
add  hl,de
dec  e
ld   c,$4E
ld   a,(hl)
inc  b
dec  de
ld   b,d
ld   a,h
inc  (hl)
dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   a,h
inc  (hl)
dec  de
pop  de
ld   a,h
inc  (hl)
dec  de
dec  d
ld   a,h
rla
ex   af,af'
ld   e,$45
inc  hl
ld   a,(bc)
ex   af,af'
ld   (hl),e
inc  d
add  hl,de
inc  bc
ld   e,e
inc  d
ex   af,af'
dec  de
add  hl,sp
ld   a,h
inc  b
ld   (hl),b
sbc  a,b
ld   hl,$3124
dec  de
add  hl,sp
ld   a,h
rla
add  hl,de
ex   af,af'
ld   e,h
ld   e,$6C
inc  hl
dec  de
ret  nc
ld   a,h
jr   nc,$2379
ld   a,(hl)
rrca
ld   e,a
dec  de
ld   a,$0F
ld   e,a
dec  de
ld   c,(hl)
rrca
ld   e,a
rra
halt
inc  hl
dec  de
ret  nc
ld   a,h
inc  (hl)
dec  de
ld   e,(hl)
rrca
dec  de
ld   l,(hl)
rrca
dec  de
pop  de
ld   a,h
rla
ld   e,$AE
inc  hl
dec  c
ld   c,$E4
ld   a,(bc)
rrca
dec  de
ccf
ld   a,h
jr   nc,$23A0
ld   bc,$9F1B
ld   a,h
inc  b
dec  de
ret  nc
ld   a,h
rla
ld   e,$99
inc  hl
dec  de
nop
ex   af,af'
rra
sbc  a,h
inc  hl
dec  de
nop
ld   c,b
add  hl,de
add  hl,de
ld   c,$4E
ld   a,(hl)
ld   (bc),a
dec  de
nop
ld   h,h
add  hl,de
dec  de
ld   c,$4E
ld   a,(hl)
ld   (bc),a
rra
inc  b
inc  h
ld   l,h
dec  de
ld   b,d
ld   a,h
rla
ld   e,$DA
inc  hl
add  hl,de
djnz $23D4
ld   d,d
ld   a,h
inc  b
dec  de
ld   b,a
ld   a,h
jr   nc,$23DC
ld   d,e
ld   a,h
jr   nc,$23DE
inc  bc
dec  de
ld   d,l
ld   a,h
inc  b
dec  de
inc  (hl)
ld   a,h
rla
ld   e,$D7
inc  hl
add  hl,de
dec  (hl)
dec  de
cp   d
ld   a,h
inc  b
rra
rst  $18
inc  hl
ld   l,e
dec  de
ld   (hl),$7C
jr   nc,$23FB
add  hl,sp
ld   a,h
rla
ld   a,(bc)
ex   af,af'
ld   (hl),b
or   a
jr   nz,$240D
add  hl,de
add  hl,de
ld   c,$4E
ld   a,(hl)
ld   (bc),a
add  hl,de
ex   af,af'
ld   h,$1E
ei
inc  hl
dec  de
nop
inc  l
rra
cp   $23
dec  de
nop
inc  a
add  hl,de
dec  de
ld   c,$4E
ld   a,(hl)
ld   (bc),a
add  hl,de
ld   b,$0E
jp   nc,$027D
add  hl,de
ld   b,$0E
or   e
ld   a,l
ld   (bc),a
add  hl,de
ld   b,$0E
sub  h
ld   a,l
ld   (bc),a
add  hl,de
ld   b,$0E
ld   (hl),l
ld   a,l
ld   (bc),a
add  hl,de
ld   b,$0E
ld   d,(hl)
ld   a,l
ld   (bc),a
add  hl,de
ex   af,af'
ld   c,$4E
ld   a,(hl)
inc  (hl)
dec  de
inc  (hl)
rrca
add  hl,de
ld   b,$0E
ld   c,(hl)
ld   a,(hl)
ld   (bc),a
dec  de
jr   z,$243A
dec  de
ld   e,d
ld   a,h
ld   (bc),a
dec  de
nop
jr   z,$2455
dec  bc
ld   c,$4E
ld   a,(hl)
ld   (bc),a
dec  de
nop
xor  l
add  hl,de
rrca
ld   c,$4E
ld   a,(hl)
ld   (bc),a
add  hl,de
ld   de,$560E
ld   a,l
add  hl,de
add  hl,bc
dec  c
dec  d
ex   af,af'
ex   af,af'
rla
add  hl,de
add  a,b
dec  e
inc  hl
add  hl,de
rra
inc  d
jr   $2466
inc  bc
add  a,b
ld   a,$00
ld   h,c
nop
jr   z,$2467
ld   b,a
ret  nz
ld   de,$6300
nop
jr   z,$246F
and  (hl)
res  7,(ix+$11)
ld   a,$01
ld   ($7CA5),a
ret
ld   hl,$0F36
ld   ($7C8C),hl
ret
push ix
pop  hl
ld   ($7C4F),hl
call $1246
ld   a,$01
ld   ($7CC5),a
ld   ($7C51),a
jr   $247A
push ix
pop  hl
ld   ($7CC6),hl
ret
push ix
pop  hl
ld   ($7CC8),hl
ret
push ix
pop  hl
ld   ($7CCA),hl
ret
ld   a,($7E6B)
call $13B7
call $1315
cp   $05
jp   z,$254F
and  a
jp   z,$2548
xor  a
ld   ($7CCD),a
ld   ($7CC5),a
ld   a,($7C3E)
and  a
jr   z,$24D3
ld   hl,$0528
ld   ($7C5A),hl
ld   ($7CD4),a
jr   $2548
push hl
push de
ld   a,($7C42)
and  a
jr   z,$2546
ld   a,($7C34)
and  a
call nz,$13C4
ld   a,($7C4D)
and  a
jr   z,$251A
ld   ($7CB4),a
ld   ($7C97),a
push hl
ld   hl,$0C4B
call $0A1F
pop  hl
ld   hl,$7D37
ld   a,($7C4B)
cp   l
jr   nz,$2504
ld   a,$01
ld   ($7CC0),a
ld   a,$05
ld   ($7C9F),a
ld   a,$10
ld   ($7CB9),a
ld   a,$05
ld   ($7CB8),a
xor  a
ld   ($7C4D),a
call $11A5
ld   a,($7C4E)
and  a
jr   z,$2546
ld   hl,($7C8F)
ld   de,($7E59)
add  hl,de
ld   ($7E67),hl
ld   hl,($7E5D)
ld   de,($7C91)
add  hl,de
ld   ($7E69),hl
push hl
ld   hl,$0B94
call $0A1F
pop  hl
xor  a
ld   ($7C4E),a
set  7,(ix+$11)
pop  de
pop  hl
ld   ($7C5D),hl
ld   ($7C5F),de
ld   hl,$7C5A
ld   ($7C8C),hl
ret
ld   a,$04
call $13B7
call $1315
cp   $05
jr   z,$25AE
and  a
jr   z,$25A3
bit  4,(ix+$11)
jr   z,$2585
ld   bc,$0828
ld   ($7CD8),a
ld   a,($7C34)
and  a
jr   z,$257B
ld   a,$04
jr   $257D
ld   a,$1C
ld   ($7CB7),a
ld   ($7C47),a
jr   $2588
ld   bc,$0428
bit  5,(ix+$11)
jr   z,$25A3
ld   a,($7C3D)
dec  a
ld   ($7C3D),a
and  a
jr   nz,$25A3
ld   ($7C4A),a
ld   a,$03
ld   ($7CA4),a
ld   ($7C3D),a
ld   ($7C6A),bc
ld   ($7C6D),hl
ld   ($7C6F),de
ld   hl,$7C6A
ld   ($7C8C),hl
ret
bit  5,(ix+$11)
jr   z,$25C0
ld   a,$20
ld   ($7C8E),a
ld   a,($7C0B)
bit  0,(ix+$11)
jr   z,$25CB
xor  $01
and  a
jr   nz,$25D3
ld   hl,$3600
jr   $25D6
ld   hl,$1B00
ld   de,$9300
ld   a,$05
call $1315
cp   $05
jr   z,$2628
and  a
jr   z,$261D
ld   bc,$0528
bit  0,(ix+$11)
jr   z,$261D
ld   a,($7CA6)
dec  a
ld   ($7CA6),a
jr   nz,$261D
ld   a,($7C97)
and  a
jr   z,$261D
push hl
push ix
pop  hl
ld   a,($7C4B)
cp   l
pop  hl
jr   nz,$261D
ld   a,$01
ld   ($7CD4),a
ld   ($7C3F),a
ld   ($7CB4),a
ld   ($7CB5),a
ld   ($7CA0),a
xor  a
ld   ($7C97),a
ld   ($7C82),bc
ld   ($7C87),de
ld   ($7C85),hl
ld   hl,$7C82
ld   ($7C8C),hl
ret
ld   b,(ix+$12)
ld   a,($7CAB)
and  a
jr   z,$265C
push ix
pop  hl
ld   a,($7CDA)
cp   l
jr   z,$265C
ld   de,$001F
and  a
sbc  hl,de
push hl
pop  iy
ld   a,(iy+$12)
dec  a
cp   b
jr   nz,$265C
bit  6,(iy+$11)
jr   z,$265C
ld   a,$02
ld   (ix+$1e),a
ld   d,(ix+$1e)
ld   c,(ix+$1d)
ld   a,($7C97)
and  a
jr   nz,$2691
bit  1,d
jr   z,$2681
bit  0,d
jr   z,$2676
ld   a,c
and  a
jr   nz,$26C7
jr   $2698
ld   a,c
and  a
jr   z,$26B4
xor  a
ld   (ix+$1d),a
dec  b
jr   $269D
ld   a,($7CD7)
and  a
jr   z,$26A3
ld   a,c
and  a
jr   z,$2698
bit  2,(ix+$11)
jr   z,$26C7
ld   a,$03
call $117C
jr   $26C7
ld   a,$01
ld   (ix+$1d),a
res  3,(ix+$11)
jr   $26C7
ld   a,($7C3A)
and  a
jr   z,$26B0
ld   a,$02
ld   (ix+$1e),a
jr   $2676
ld   a,c
and  a
jr   nz,$267A
dec  b
bit  6,(ix+$11)
jr   z,$26C7
ld   a,($7CAB)
and  a
jr   z,$2735
res  7,(ix+$11)
jr   $2735
ld   a,b
push bc
ld   hl,$2460
sla  a
call $114C
push de
inc  hl
inc  hl
ld   e,(hl)
inc  hl
ld   d,(hl)
ld   a,$04
pop  hl
call $1315
cp   $05
jr   z,$2759
and  a
jr   z,$274A
set  6,(ix+$11)
res  2,(ix+$11)
res  1,(ix+$1e)
pop  bc
push bc
xor  a
ld   (ix+$1d),a
ld   a,(ix+$12)
cp   b
jr   nz,$2719
inc  a
cp   $04
jr   nz,$2716
ld   ($7CCC),a
pop  af
ld   a,($7CA6)
inc  a
ld   ($7CA6),a
set  7,(ix+$11)
ld   bc,$0428
jp   $261D
ld   (ix+$12),a
ld   a,($7C97)
and  a
jr   nz,$2731
ld   a,($7C47)
and  a
jr   z,$2735
ld   a,($7C36)
and  a
jr   nz,$2735
ld   a,($7CAB)
and  a
jr   nz,$2735
set  7,(ix+$11)
ld   bc,$0A28
ld   a,(ix+$0c)
cp   $19
jr   nc,$2742
ld   bc,$0A68
ld   hl,$0000
ld   de,$0000
jr   $274E
res  6,(ix+$11)
ld   ($7C62),bc
ld   ($7C65),hl
ld   ($7C67),de
pop  af
ld   hl,$7C62
ld   ($7C8C),hl
ret
ld   a,($7C73)
cp   $04
jr   nz,$276C
res  7,(ix+$11)
ld   hl,$7C72
ld   ($7C8C),hl
ret
call $2481
ld   a,($7C3C)
cp   $05
ret  z
xor  a
ld   ($7C51),a
ld   a,$20
ld   ($7C9E),a
jp   $247A
ld   hl,$7C7A
ld   ($7C8C),hl
ret
sub  h
inc  h
sbc  a,e
inc  h
and  d
inc  h
ld   h,c
daa
adc  a,b
daa
ld   d,(hl)
dec  h
cpl
ld   h,$B5
dec  h
xor  c
inc  h
add  a,c
inc  h
ld   (hl),b
inc  h
ld   (hl),e
daa
ld   a,d
inc  h
ld   a,(hl)
cp   $28
jr   nc,$27C3
dec  a
dec  a
inc  hl
ld   ($7C8C),hl
ld   hl,$278F
call $114C
ld   hl,$27C0
push hl
ex   de,hl
jp   (hl)
ld   hl,($7C8C)
ret
ld   a,(hl)
ld   (ix+$00),a
inc  hl
ld   a,(hl)
push hl
ld   hl,$0943
call $114C
ld   (ix+$03),d
ld   (ix+$02),e
pop  hl
inc  hl
ret
ld   h,(ix+$03)
ld   l,(ix+$02)
ld   a,(ix+$15)
call $114C
ld   (ix+$05),d
ld   (ix+$04),e
ret
ld   h,(ix+$07)
ld   l,(ix+$06)
call $27A9
ld   a,($7CA5)
and  a
jr   z,$2809
inc  hl
inc  hl
xor  a
ld   ($7CA5),a
inc  hl
inc  hl
inc  hl
inc  hl
inc  hl
jr   $2825
call $27C4
ld   a,(hl)
ld   (ix+$08),a
inc  hl
ld   a,(hl)
ld   (ix+$0d),a
inc  hl
ld   a,(hl)
ld   (ix+$0e),a
inc  hl
ld   a,(hl)
ld   (ix+$09),a
inc  hl
ld   a,(hl)
ld   (ix+$0a),a
inc  hl
ld   (ix+$07),h
ld   (ix+$06),l
ret
ld   hl,$0503
ld   a,($7CD3)
and  a
jr   nz,$283E
bit  4,(ix+$11)
jr   z,$283E
ld   hl,$1812
ld   a,(ix+$01)
inc  a
cp   h
jr   c,$2846
xor  a
ld   (ix+$01),a
cp   l
jr   nc,$284F
xor  a
jr   $2851
ld   a,$01
ld   h,(ix+$05)
ld   l,(ix+$04)
call $114C
ld   (ix+$14),d
ld   (ix+$13),e
ret
push bc
push ix
ld   ix,($7C93)
ld   a,(ix+$08)
and  a
jr   nz,$2873
call $27ED
jr   $287D
cp   $FF
jr   nz,$2879
jr   $287D
dec  a
ld   (ix+$08),a
call $27DA
call $282C
pop  ix
pop  bc
ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
ld   e,$19
add  hl,de
ld   c,$B3
ld   a,l
ld   (bc),a
dec  de
nop
ld   c,b
add  hl,de
dec  de
ld   c,$B3
ld   a,l
ld   (bc),a
dec  de
nop
ld   a,($1919)
ld   c,$75
ld   a,l
ld   (bc),a
dec  de
nop
ld   e,e
add  hl,de
dec  de
ld   c,$75
ld   a,l
ld   (bc),a
dec  de
nop
inc  d
add  hl,de
add  hl,de
ld   c,$D2
ld   a,l
ld   (bc),a
dec  de
nop
ld   e,e
add  hl,de
dec  de
ld   c,$D2
ld   a,l
ld   (bc),a
dec  de
nop
ld   ($1919),a
ld   c,$94
ld   a,l
ld   (bc),a
dec  de
nop
ld   c,b
add  hl,de
dec  de
ld   c,$94
ld   a,l
ld   (bc),a
dec  de
nop
jr   z,$28ED
add  hl,de
ld   c,$56
ld   a,l
ld   (bc),a
dec  de
nop
ld   h,c
add  hl,de
dec  de
ld   c,$56
ld   a,l
ld   (bc),a
dec  de
nop
inc  d
add  hl,de
add  hl,de
ld   c,$F1
ld   a,l
ld   (bc),a
dec  de
nop
ld   hl,($1B19)
ld   c,$F1
ld   a,l
ld   (bc),a
dec  de
nop
inc  a
add  hl,de
add  hl,de
ld   c,$2F
ld   a,(hl)
ld   (bc),a
dec  de
nop
ld   hl,($1B19)
ld   c,$2F
ld   a,(hl)
ld   (bc),a
dec  de
nop
jr   z,$2923
add  hl,de
ld   c,$10
ld   a,(hl)
ld   (bc),a
dec  de
nop
ld   d,$19
dec  de
ld   c,$10
ld   a,(hl)
ld   (bc),a
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
nop
ld   c,$DA
ld   a,h
add  hl,de
inc  b
dec  c
dec  d
ex   af,af'
ex   af,af'
ex   af,af'
ex   af,af'
ex   af,af'
add  hl,de
jr   z,$294E
add  hl,de
inc  c
inc  d
add  hl,de
dec  h
inc  hl
add  hl,de
djnz $2948
add  hl,de
xor  b
inc  hl
add  hl,de
ld   de,$2214
inc  hl
add  hl,de
inc  de
inc  d
dec  de
xor  h
inc  b
ld   h,l
add  hl,de
rra
inc  d
jr   $2961
ex   af,af'
dec  c
dec  d
ex   af,af'
ex   af,af'
ex   af,af'
ex   af,af'
add  hl,de
jr   z,$2975
add  hl,de
inc  c
inc  d
dec  de
dec  bc
ld   a,h
rla
ld   e,$61
add  hl,hl
add  hl,de
dec  de
rra
ld   h,e
add  hl,hl
add  hl,de
ld   (hl),$23
add  hl,de
djnz $297B
add  hl,de
sub  e
inc  hl
add  hl,de
inc  de
inc  d
dec  de
xor  h
inc  b
ld   h,l
add  hl,de
rra
inc  d
jr   $297D
add  hl,de
jr   z,$2992
nop
ld   c,$4E
ld   a,(hl)
ld   (bc),a
dec  de
xor  h
inc  b
add  hl,de
inc  de
ld   c,$4E
ld   a,(hl)
ld   (bc),a
add  hl,de
ld   (bc),a
add  hl,de
ld   de,$4E0E
ld   a,(hl)
inc  b
add  hl,de
djnz $29AB
ld   de,$560E
ld   a,l
inc  b
add  hl,de
jr   nz,$29B3
ld   de,$2F0E
ld   a,(hl)
inc  b
add  hl,de
jr   nz,$29BB
ld   de,$F10E
ld   a,l
inc  b
add  hl,de
jr   nz,$29C3
ld   de,$100E
ld   a,(hl)
inc  b
add  hl,de
inc  bc
dec  de
dec  a
ld   a,h
inc  b
add  hl,de
rlca
dec  de
ld   (hl),c
ld   a,h
inc  b
add  hl,de
ld   b,$1B
add  a,c
ld   a,h
inc  b
add  hl,de
dec  b
dec  de
ld   a,c
ld   a,h
inc  b
add  hl,de
add  hl,bc
dec  de
adc  a,c
ld   a,h
inc  b
add  hl,de
ex   af,af'
dec  de
ld   l,c
ld   a,h
inc  b
add  hl,de
ld   a,(bc)
dec  de
ld   h,c
ld   a,h
inc  b
dec  de
jr   z,$29E1
dec  de
ld   h,d
ld   a,h
ld   (bc),a
dec  de
jr   z,$29E7
dec  de
ld   (hl),d
ld   a,h
ld   (bc),a
dec  de
jr   z,$29EF
dec  de
ld   a,d
ld   a,h
ld   (bc),a
dec  de
jr   z,$29F7
dec  de
ld   e,d
ld   a,h
ld   (bc),a
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
nop
ld   c,$56
ld   a,l
add  hl,de
ex   af,af'
dec  c
dec  d
ex   af,af'
ex   af,af'
add  hl,de
ld   b,$14
dec  de
ld   ($650F),hl
add  hl,de
ld   de,$0814
rla
add  hl,de
add  a,b
dec  e
add  hl,de
rst  $30
ld   a,(de)
inc  hl
add  hl,de
rra
inc  d
jr   $2A21
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
inc  l
rrca
add  hl,de
ld   b,$0E
ld   d,(hl)
ld   a,l
ld   (bc),a
dec  de
inc  h
rrca
add  hl,de
ld   b,$0E
ld   (hl),l
ld   a,l
ld   (bc),a
dec  de
inc  h
rrca
add  hl,de
ld   b,$0E
sub  h
ld   a,l
ld   (bc),a
dec  de
inc  h
rrca
add  hl,de
ld   b,$0E
jp   nc,$027D
dec  de
inc  h
rrca
add  hl,de
ld   b,$0E
or   e
ld   a,l
ld   (bc),a
dec  de
jr   nz,$2A5B
add  hl,de
ld   b,$0E
jp   c,$027C
dec  de
jr   nz,$2A64
add  hl,de
ld   b,$0E
ld   sp,hl
ld   a,h
ld   (bc),a
dec  de
jr   nz,$2A6D
add  hl,de
ld   b,$0E
jr   $2AE0
ld   (bc),a
dec  de
jr   nz,$2A76
add  hl,de
ld   b,$0E
scf
ld   a,l
ld   (bc),a
dec  de
ld   a,d
ld   a,h
add  hl,de
ld   b,$0E
ld   c,(hl)
ld   a,(hl)
ld   (bc),a
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   (hl),h
dec  de
ld   c,d
ld   a,h
jr   nc,$2A81

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   (hl),l
halt
ld   (hl),a
inc  bc
nop
nop
ld   b,b
nop
ld   b,b
nop
ld   b,b
nop
nop
nop
nop
nop
nop
nop
nop
nop
ret  nz
rst  $38
ret  nz
rst  $38
ret  nz
rst  $38
nop
nop
nop
nop
ld   a,($7CCD)
and  a
ret  z
ld   a,($7CCE)
inc  a
cp   $0D
jr   c,$2AAB
xor  a
ld   ($7CCE),a
push hl
ld   hl,$2A83
call $114C
ld   a,(ix+$0c)
cp   $A0
call c,$1119
pop  hl
add  hl,de
ret
ld   hl,$7CC1
call $1121
and  a
jr   z,$2ACC
ld   ($7CC3),a
ld   hl,$7CA0
call $1121
and  a
jr   z,$2ADE
ld   ($7C45),a
ld   a,($7C40)
ld   ($7C9F),a
ld   hl,$7C8E
call $1121
and  a
jr   z,$2AEA
ld   ($7CA7),a
ld   hl,$7C9E
call $1121
and  a
jr   z,$2AF6
ld   ($7C51),a
ld   hl,$7CBA
call $1121
and  a
call nz,$13C4
ei
ld   hl,$7CB2
call $1121
and  a
call nz,$12B0
ld   hl,$7C52
call $1121
and  a
call nz,$1BE2
ld   hl,$7C37
call $1121
and  a
call nz,$1189
ld   hl,$7C53
call $1121
and  a
call nz,$1414
ret
ld   e,$00
ld   h,(ix+$10)
ld   a,$54
cp   h
jr   nc,$2B41
ld   a,$84
cp   h
jr   nc,$2B3D
ld   d,$00
jr   $2B3F
ld   d,$01
jr   $2B55
ld   a,$3A
cp   h
jr   nc,$2B4A
ld   d,$02
jr   $2B55
ld   a,$1F
cp   h
jr   nc,$2B53
ld   d,$03
jr   $2B55
ld   d,$04
ld   a,(ix+$15)
cp   d
ld   (ix+$15),d
jr   z,$2B62
set  2,(ix+$11)
ret
ld   bc,$C001
ld   de,$4E01
ld   a,($7C4A)
and  a
jr   nz,$2B7B
bit  5,(ix+$11)
jr   z,$2B7B
ld   bc,$4009
ld   de,$4D02
push de
ld   d,(ix+$0c)
ld   e,(ix+$0b)
ld   h,(ix+$0a)
ld   l,(ix+$09)
bit  7,h
push af
call nz,$1111
srl  h
rr   l
srl  h
rr   l
pop  af
call nz,$1111
add  hl,de
bit  1,(ix+$11)
call nz,$2A9D
pop  de
ld   a,e
cp   h
jr   c,$2BAA
ld   h,a
jr   $2BAF
ld   a,d
cp   h
jr   nc,$2BAF
ld   h,a
ld   (ix+$0c),h
ld   (ix+$0b),l
ld   h,(ix+$10)
ld   l,(ix+$0f)
ld   d,(ix+$0e)
ld   e,(ix+$0d)
add  hl,de
ld   a,c
cp   h
jr   c,$2BC9
ld   h,a
jr   $2BCE
ld   a,b
cp   h
jr   nc,$2BCE
ld   h,a
ld   (ix+$10),h
ld   (ix+$0f),l
ret
and  d
ld   c,$96
ld   b,$A3
dec  c
sbc  a,b
dec  c
and  a
add  hl,bc
sbc  a,b
rrca
xor  h
ex   af,af'
sbc  a,b
djnz $2B95
add  hl,bc
sbc  a,b
rrca
xor  a
dec  c
sbc  a,b
dec  c
ld   a,(hl)
sla  a
ld   hl,$2BD5
call $114C
ld   a,($7E5E)
sub  e
cp   d
ret  nc
inc  hl
inc  hl
push hl
ld   hl,($7E59)
call $1192
ld   a,h
pop  hl
sub  (hl)
inc  hl
cp   (hl)
ret  nc
ld   a,($7CD3)
and  a
ret  nz
inc  a
ld   ($7CD2),a
ld   ($7C3B),a
call $1246
ret
adc  a,c
rlca
ld   d,l
rlca
ld   (hl),e
rlca
ld   c,l
rlca
and  e
rlca
cp   c
rlca
rst  $10
rlca
push hl
ld   a,(hl)
ld   hl,$2C1B
call $114C
push de
pop  iy
ld   de,$2600
ld   hl,$AF00
ld   bc,$0828
call $0D44
call $0D08
call $0DF4
pop  hl
ret
ld   hl,$7C15
ld   a,($7CD5)
and  a
jr   z,$2C73
ld   ($7CA1),a
ld   a,(hl)
and  a
jr   z,$2C68
call $2C29
dec  (hl)
call $2C29
ld   a,($7C3B)
and  a
call z,$2BED
jr   $2C71
xor  a
ld   ($7CD5),a
ld   a,$18
ld   ($7CD6),a
jr   $2C8F
ld   a,(hl)
and  a
jr   nz,$2C8F
xor  a
ld   ($7C3B),a
ld   a,($7CD6)
and  a
jr   nz,$2C8B
call $2C29
ld   (hl),$06
call $2C29
jr   $2C8F
dec  a
ld   ($7CD6),a
ret
ld   bc,$001F
ld   hl,($7E59)
ld   iy,$7DF1
ld   a,($7E5E)
inc  a
ld   e,a
ld   a,$03
push hl
ex   af,af'
ld   a,(iy+$10)
sub  e
jr   nc,$2CAB
neg
cp   d
jr   nc,$2CCC
push de
ld   d,(iy+$0c)
ld   e,(iy+$0b)
and  a
sbc  hl,de
call c,$1111
pop  de
ld   a,$10
cp   h
jr   c,$2CCC
call $1192
ld   a,h
cp   d
jr   nc,$2CCC
ld   a,$01
pop  hl
ret
add  iy,bc
ex   af,af'
dec  a
pop  hl
jr   nz,$2CA1
ret
ld   a,($7CD3)
and  a
jr   nz,$2D4B
ld   a,(ix+$10)
cp   $BC
jr   c,$2D37
ld   a,($7CD2)
and  a
ret  nz
ld   a,($7CD3)
and  a
ret  nz
ld   hl,($7D61)
ld   ($7E67),hl
ld   hl,($7D65)
ld   ($7E69),hl
ld   hl,$0F34
ld   ($7E54),hl
xor  a
ld   ($7E56),a
ld   a,$04
ld   ($7E6B),a
ld   a,$81
ld   ($7E5F),a
ld   hl,$0628
ld   ($7C5A),hl
ld   a,($7CA1)
and  a
jr   z,$2D1B
ld   a,$03
jr   $2D1D
ld   a,$04
ld   ($7C9F),a
xor  a
ld   ($7CD9),a
ld   ($7CA1),a
ld   ($7CB3),a
ld   a,$01
ld   ($7CD3),a
ld   ($7C3E),a
ld   ($7C3F),a
jr   $2D49
sbc  a,$A9
cp   $05
ret  nc
ld   a,(ix+$0c)
sbc  a,$26
cp   $02
ret  nc
ld   a,$01
ld   ($7CA1),a
jr   $2D96
ld   d,(ix+$10)
ld   a,$3C
cp   d
ret  c
ld   a,($7C9D)
and  a
ret  nz
ld   d,$05
call $2C90
and  a
ret  z
ld   a,($7CC5)
and  a
jr   z,$2D78
ld   a,$02
call $117C
ld   ($7CAD),a
ld   ($7CD4),a
ld   hl,($7C4B)
ld   ($7C43),hl
xor  a
jr   $2D7C
inc  a
ld   ($7C3A),a
ld   ($7C51),a
inc  a
ld   ($7C9D),a
push iy
pop  hl
ld   ($7C4F),hl
call $1246
xor  a
ld   ($7C53),a
ld   ($7C47),a
call $11A5
ret
ld   (hl),l
ld   a,l
ld   sp,hl
ld   a,h
scf
ld   a,l
sub  h
ld   a,l
jr   $2E1E
ld   d,(hl)
ld   a,l
jp   nc,$DA7D
ld   a,h
or   e
ld   a,l
djnz $2E29
cpl
ld   a,(hl)
pop  af
ld   a,l
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


ex   (sp),hl
push de
push bc
push af
ld   a,(hl)
out  ($0F),a
inc  hl
ld   ($7C00),hl
exx
ex   af,af'
push hl
push de
push bc
push af
ei
ld   a,($7C1B)
and  a
jr   z,$2DD7
ld   a,($7C8B)
and  a
jr   nz,$2DD7
ld   a,$F0
out  ($03),a
ld   a,$52
out  ($01),a
ld   a,($7C1E)
and  a
jp   nz,$2E82
ld   a,($7C48)
inc  a
ld   ($7C48),a
cp   $02
jp   nc,$2E82
push iy
push ix
ld   a,($7CBD)
add  a,$03
cp   $0C
jr   nz,$2DF8
xor  a
ld   ($7CBD),a
ld   hl,$2D97
call $114C
push de
pop  ix
inc  hl
ld   a,$03
push af
push hl
bit  7,(ix+$11)
jr   z,$2E26
xor  a
ld   ($7CBE),a
call $0EF9
ld   ($7C93),ix
call $2861
call $2B63
call $2B2A
call $0ECC
pop  hl
inc  hl
ld   e,(hl)
inc  hl
ld   d,(hl)
push de
pop  ix
pop  af
dec  a
jr   nz,$2E07
call $2C48
ld   ix,$7E4E
bit  7,(ix+$11)
jr   z,$2E5F
ld   a,($7CBE)
and  a
jr   z,$2E4A
call $11B9
jr   $2E4F
ld   a,$02
ld   ($7CBE),a
call $0EF9
ld   ($7C93),ix
call $2861
call $2B63
call $0ECC
call $2CD4
pop  ix
pop  iy
push iy
push ix
call $2AC0
ld   a,($7C4A)
and  a
call z,$1FA5
pop  ix
pop  iy
ld   a,($7C48)
dec  a
ld   ($7C48),a
jp   nz,$2DEA
di
call $0989
ei
di
call $15A1
ei
ld   hl,$7C26
call $1121
and  a
jr   z,$2EBB
ld   a,($7C27)
and  a
jr   z,$2EAA
ld   a,$01
out  ($20),a
ld   a,$07
ld   ($7C26),a
xor  a
ld   ($7C27),a
jr   $2EBB
xor  a
out  ($20),a
ld   hl,$7C25
dec  (hl)
jr   z,$2EBB
ld   a,$07
ld   ($7C26),a
ld   ($7C27),a
jp   $0221
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


ex   (sp),hl
push de
push bc
push af
ld   a,(hl)
out  ($0F),a
inc  hl
ld   ($7C00),hl
exx
ex   af,af'
push hl
push de
push bc
push af
ld   a,($7C8B)
and  a
jr   nz,$2EDF
ld   a,$6C
out  ($03),a
ld   a,$07
out  ($01),a
jp   $0221
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


ex   (sp),hl
push de
push bc
push af
ld   a,(hl)
out  ($0F),a
inc  hl
ld   ($7C00),hl
exx
ex   af,af'
push hl
push de
push bc
push af
ld   hl,$7CB9
ld   a,(hl)
and  a
jr   nz,$2F2E
ld   a,($7CB6)
xor  $01
ld   ($7CB6),a
ld   (hl),$20
push af
ld   a,($7C1B)
and  a
jr   nz,$2F21
pop  af
jr   z,$2F16
ld   a,$07
ld   d,$00
jr   $2F18
ld   d,$07
out  ($00),a
out  ($02),a
ld   a,d
out  ($03),a
jr   $2F2E
pop  af
jr   z,$2F28
ld   a,$F5
jr   $2F2A
ld   a,$B2
out  ($00),a
out  ($04),a
dec  (hl)
jp   $0221
call $2DB1
ld   (hl),e
jp   $2F32
call $2EE4
ld   (hl),e
call $2DB1
ret  nz
jp   $2F39
call $2EC0
ld   (hl),e
call $2DB1
nop
jp   $2F44
call $2EC0
ld   (hl),e
call $2DB1
ret  nz
call $2EE4
nop
jp   $2F4F
call $2DB1
inc  (hl)
call $2EC0
ld   a,a
jp   $2F5E
call $2EC0
ld   a,a
call $2DB1
ret  nz
call $2EE4
inc  (hl)
jp   $2F69

;******************************************************************************
; Command ----> ???
;
; Opcode:	$7D
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
dec  de
ld   a,h
rla
ld   e,$A0
cpl
add  hl,de
or   c
ex   af,af'
dec  c
ld   c,e
add  hl,de
inc  b
ld   c,e
add  hl,de
rlca
add  hl,de
ld   (bc),a
ld   c,e
dec  de
ld   a,(bc)
ld   a,h
rla
ld   e,$9A
cpl
dec  de
ld   e,(hl)
cpl
rra
sbc  a,l
cpl
dec  de
ld   b,h
cpl
rra
or   (hl)
cpl
add  hl,de
rlca
ex   af,af'
ld   ($194B),hl
inc  bc
ld   c,e
dec  c
ex   af,af'
ex   af,af'
ex   af,af'
ld   c,e
add  hl,de
ld   (bc),a
ld   c,e
add  hl,de
inc  b
ld   c,e
dec  de
ld   ($782F),a
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
inc  b
dec  de
nop
jr   z,$2FDB
jr   z,$2FCA
ld   l,$24
ld   b,h
ld   b,l
ld   d,b
ld   c,a
ld   d,e
ld   c,c
ld   d,h
jr   nz,$2FFE
jr   nz,$3012
ld   c,a
ld   c,c
ld   c,(hl)
jr   nz,$3028
ld   c,a
jr   nz,$301A
ld   c,a
ld   c,(hl)
ld   d,h
ld   c,c
ld   c,(hl)
ld   d,l
ld   b,l
jr   nz,$3034
ld   c,b
ld   c,c
ld   d,e
jr   nz,$302C
ld   b,c
ld   c,l
ld   b,l
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
add  hl,bc
ld   a,h
rla
ld   e,$26
jr   nc,$300E
nop
inc  bc
dec  de
nop
jr   z,$3014
jr   z,$3003
ld   l,$25
ld   b,h
ld   b,l
ld   d,b
ld   c,a
ld   d,e
ld   c,c
ld   d,h
jr   nz,$3038
jr   nz,$304B
ld   c,a
ld   c,c
ld   c,(hl)
ld   d,e
jr   nz,$3062
ld   c,a
jr   nz,$3054
ld   c,a
ld   c,(hl)
ld   d,h
ld   c,c
ld   c,(hl)
ld   d,l
ld   b,l
jr   nz,$306E
ld   c,b
ld   c,c
ld   d,e
jr   nz,$3066
ld   b,c
ld   c,l
ld   b,l
cpl
rra
daa
jr   nc,$30A0
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   a,c
dec  de
ld   de,$347C
add  hl,de
rst  $38
ld   a,d
add  hl,de
rst  $38
ld   a,d
ld   a,c
dec  de
ld   de,$177C
ld   e,$43
jr   nc,$3058
djnz $30BB
inc  (hl)
rra
ld   c,e
jr   nc,$305F
ex   af,af'
ld   a,h
inc  (hl)
dec  de
inc  d
ld   a,h
jr   nc,$3067
ld   de,$637C
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
ld   a,e
add  hl,de
and  b
ld   a,d
ld   a,e
dec  de
ld   de,$177C
ex   af,af'
ld   e,$65
jr   nc,$307A
djnz $30DD
inc  (hl)
rra
ld   (hl),d
jr   nc,$3081
ld   a,(bc)
ld   a,h
rla
ld   e,$72
jr   nc,$3088
ld   a,(bc)
ld   a,h
inc  (hl)
ld   a,h
ld   a,l
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
rst  $38
dec  c
dec  d
jr   $3093
djnz $30FA
add  hl,de
inc  bc
ld   a,(de)
add  hl,de
inc  bc
ld   a,a
ld   e,$8B
jr   nc,$308D
ld   ($AC1B),hl
ld   a,h
jr   nc,$30A7
rra
ld   a,h
rla
ld   e,$98
jr   nc,$309A
ld   ($AC1B),hl
ld   a,h
jr   nc,$30A3
ex   af,af'
jr   z,$30BA
ld   (hl),h
jr   nc,$30A6
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
ld   a,(de)
dec  de
nop
djnz $30C3
jr   z,$30B2
ld   l,$0E
ld   e,c
ld   c,a
ld   d,l
jr   nz,$30F2
ld   d,d
ld   b,l
jr   nz,$310A
ld   d,b
jr   nz,$30E9
ld   d,e
ld   d,h
cpl
dec  de
nop
rrca
dec  de
nop
inc  h
dec  de
jr   z,$30CC
ld   l,$18
ld   b,d
ld   b,l
ld   b,c
ld   d,h
jr   nz,$3119
ld   b,l
jr   nz,$3115
ld   c,a
ld   d,d
jr   nz,$3118
ld   e,b
ld   d,h
ld   d,d
ld   b,c
jr   nz,$3122
ld   c,(hl)
ld   c,(hl)
ld   c,c
ld   c,(hl)
ld   b,a
cpl
dec  de
nop
rra
dec  de
nop
jr   c,$3101
jr   z,$30F0
ld   l,$09
ld   b,a
ld   c,a
ld   c,a
ld   b,h
jr   nz,$313C
ld   d,l
ld   b,e
ld   c,e
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
xor  h
ld   a,h
inc  (hl)
ld   c,c
dec  de
nop
inc  hl
dec  de
nop
djnz $311D
jr   z,$310C
ld   l,$05
ld   d,b
ld   c,c
ld   d,h
ld   b,e
ld   c,b
cpl
dec  de
nop
rlca
dec  de
nop
ld   b,b
dec  de
jr   z,$311D
ld   l,$21
ld   d,b
ld   d,d
ld   b,l
ld   d,e
ld   d,e
jr   nz,$316E
ld   c,c
ld   d,h
ld   b,e
ld   c,b
jr   nz,$3166
ld   d,l
ld   d,h
ld   d,h
ld   c,a
ld   c,(hl)
jr   nz,$317F
ld   c,a
jr   nz,$3181
ld   d,h
ld   b,c
ld   d,d
ld   d,h
jr   nz,$3184
ld   c,c
ld   d,h
ld   b,e
ld   c,b
cpl
dec  de
nop
rrca
dec  de
nop
ld   h,b
dec  de
jr   z,$314A
ld   l,$19
ld   d,d
ld   c,a
ld   c,h
ld   c,h
ld   b,l
ld   d,d
ld   b,d
ld   b,c
ld   c,h
ld   c,h
jr   nz,$3193
ld   c,a
ld   c,(hl)
ld   d,h
ld   d,d
ld   c,a
ld   c,h
ld   d,e
jr   nz,$31A9
ld   c,c
ld   d,h
ld   b,e
ld   c,b
cpl
dec  de
nop
inc  c
dec  de
nop
add  a,b
dec  de
jr   z,$316F
ld   l,$1C
ld   d,d
ld   c,a
ld   c,h
ld   c,h
ld   b,l
ld   d,d
ld   b,d
ld   b,c
ld   c,h
ld   c,h
jr   nz,$31C2
ld   c,a
ld   d,(hl)
ld   b,l
ld   d,e
jr   nz,$31CA
ld   d,l
ld   d,h
ld   b,(hl)
ld   c,c
ld   b,l
ld   c,h
ld   b,h
ld   b,l
ld   d,d
ld   d,e
cpl
add  hl,de
add  a,b
add  a,b
dec  de
xor  h
ld   a,h
rla
ld   e,$93
ld   sp,$361F
ld   ($1B49),a
nop
dec  h
dec  de
nop
djnz $31B6
jr   z,$31A5
ld   l,$03
ld   b,d
ld   b,c
ld   d,h
cpl
dec  de
nop
dec  bc
dec  de
nop
ld   b,b
dec  de
jr   z,$31B4
ld   l,$1D
ld   d,b
ld   d,d
ld   b,l
ld   d,e
ld   d,e
jr   nz,$31F7
ld   b,c
ld   d,h
jr   nz,$31FB
ld   d,l
ld   d,h
ld   d,h
ld   c,a
ld   c,(hl)
jr   nz,$3214
ld   c,a
jr   nz,$3216
ld   d,a
ld   c,c
ld   c,(hl)
ld   b,a
jr   nz,$320B
ld   b,c
ld   d,h
cpl
dec  de
nop
dec  b
dec  de
nop
ld   h,b
dec  de
jr   z,$31DD
ld   l,$23
ld   c,b
ld   c,a
ld   c,h
ld   b,h
jr   nz,$321F
ld   d,l
ld   d,h
ld   d,h
ld   c,a
ld   c,(hl)
jr   nz,$3228
ld   c,a
ld   d,a
ld   c,(hl)
jr   nz,$323D
ld   c,a
jr   nz,$322D
ld   b,h
ld   d,(hl)
ld   b,c
ld   c,(hl)
ld   b,e
ld   b,l
jr   nz,$3246
ld   d,l
ld   c,(hl)
ld   c,(hl)
ld   b,l
ld   d,d
ld   d,e
cpl
add  hl,de
ld   h,b
add  a,b
dec  de
xor  h
ld   a,h
rla
ld   e,$08
ld   ($361F),a
ld   ($1B49),a
nop
ld   a,(bc)
dec  de
nop
jr   z,$322B
jr   z,$321A
ld   l,$1E
ld   d,b
ld   d,d
ld   b,l
ld   d,e
ld   d,e
jr   nz,$325C
ld   c,(hl)
ld   e,c
jr   nz,$3261
ld   d,l
ld   d,h
ld   d,h
ld   c,a
ld   c,(hl)
jr   nz,$327A
ld   c,a
jr   nz,$327C
ld   d,h
ld   b,c
ld   d,d
ld   d,h
jr   nz,$3276
ld   b,c
ld   c,l
ld   b,l
cpl
add  hl,de
jr   nc,$31B6
dec  de
xor  h
ld   a,h
rla
ld   e,$FA
jr   nc,$3241
nop
ld   h,b
nop
ld   b,b
nop
ld   b,h
nop
jr   z,$3247
ld   h,b
nop
djnz $324B
xor  d
nop
jr   z,$3242
push ix
ld   a,($7C42)
and  a
jr   z,$3273
ld   hl,($7C43)
push hl
pop  ix
ld   de,$7D37
ld   a,e
cp   l
jr   z,$3271
ld   a,($7CAF)
and  a
jr   nz,$3271
ld   de,$001F
add  hl,de
ld   ($7C43),hl
jr   $3277
ld   ix,$7CDA
xor  a
ld   (ix+$12),a
ld   ($7CCC),a
pop  ix
ei
ld   a,($7C0B)
and  a
jr   z,$328C
ld   hl,$7C0D
jr   $328F
ld   hl,$7C0E
ld   a,(hl)
add  a,$01
daa
ld   (hl),a
push bc
ld   bc,$329B
jp   $1F1B
add  a,c
nop
pop  bc
ret
ld   a,$04
push af
ld   a,($7CEC)
and  a
jr   z,$32B9
ld   a,($7D0B)
and  a
jp   z,$32C4
ld   a,($7D2A)
and  a
jp   z,$32CF
jp   $32DA
ld   de,$7CDA
ld   hl,$7CF9
ld   bc,$001F
ldir
ld   de,$7CF9
ld   hl,$7D18
ld   bc,$001F
ldir
ld   de,$7D18
ld   hl,$7D37
ld   bc,$001F
ldir
xor  a
ld   ($7D49),a
ld   ($7D54),a
ld   hl,$2800
ld   ($7D42),hl
ld   h,a
ld   l,a
ld   ($7D40),hl
ld   ($7D44),hl
ld   hl,$AC00
ld   ($7D46),hl
ld   hl,$04AC
ld   ($7D4A),hl
ld   a,$01
ld   ($7CEB),a
ld   ($7D29),a
ld   ($7D29),a
ld   ($7D48),a
ld   hl,$0F20
ld   ($7D3D),hl
pop  af
dec  a
jr   nz,$32A1
ret
ld   a,($7C37)
and  a
ret  nz
push iy
push ix
di
ld   ($7C3E),a
ld   ($7CD4),a
ld   ($7C54),a
ld   ($7C53),a
ld   a,$01
ld   ($7CAB),a
ld   a,($7C3F)
and  a
jp   nz,$3408
ld   a,$30
ld   ($7C95),a
ld   ($7C96),a
ld   a,($7CAD)
and  a
di
jr   z,$334E
ld   ($7C51),a
ld   iy,($7C4B)
jr   $3386
ld   iy,($7C43)
ld   a,($7CAE)
and  a
jr   z,$335E
xor  a
ld   ($7CAE),a
jr   $3363
ld   a,$06
ld   ($7C9F),a
ld   a,($7C41)
ld   c,a
bit  6,(iy+$11)
jr   nz,$33B1
ld   a,(iy+$1d)
and  a
jr   z,$33B1
bit  2,(iy+$1e)
jr   z,$3380
ld   a,$02
call $117C
jr   $33B1
ld   a,(iy+$12)
cp   c
jr   nz,$33B1
ld   hl,$0F21
xor  a
ld   (iy+$12),a
ld   (iy+$07),h
ld   (iy+$06),l
ld   hl,$7CA6
inc  (hl)
ld   a,$02
ld   ($7C9F),a
res  3,(iy+$11)
ld   a,($7C49)
cp   $32
jr   nz,$33B1
xor  a
ld   ($7C51),a
pop  ix
pop  iy
ei
ret
ld   a,($7CAD)
and  a
jr   z,$33BC
ld   ($7CAE),a
jr   $33FE
ld   a,c
cp   $03
jr   z,$3408
ld   hl,$7CC6
call $114C
push de
pop  ix
bit  4,(ix+$11)
jr   nz,$3408
push ix
pop  hl
ld   ($7C4F),hl
ld   a,$01
ld   ($7C51),a
ld   ($7CC5),a
ld   a,($7C46)
and  a
jr   z,$33F9
xor  a
ld   ($7C46),a
ld   de,$001F
push iy
pop  hl
add  hl,de
ld   ($7C43),hl
ld   a,$01
ld   ($7CAF),a
jr   $33FE
ld   a,$01
ld   ($7C3F),a
xor  a
ld   ($7CAD),a
pop  ix
pop  iy
ei
ret
ei
xor  a
ld   ($7C3F),a
pop  ix
pop  iy
ld   a,$01
ld   ($7C1E),a
ld   bc,$341C
jp   $2A77
add  a,d
nop
ld   bc,$3424
jp   $1268
add  a,e
nop
ld   hl,$1268
ld   ($7CA8),hl
ld   a,$01
ld   ($7CB1),a
ld   ($7CB2),a
xor  a
ld   ($7C1E),a
ret
bit  7,a
ret  z
bit  6,a
ret  nz
inc  e
ret
push ix
push iy
di
xor  a
ld   ix,($7C4F)
ld   ($7CCD),a
ld   ($7C51),a
ld   (ix+$01),a
ld   (ix+$09),a
ld   (ix+$0a),a
ld   (ix+$0d),a
ld   (ix+$0e),a
ld   h,(ix+$0c)
inc  hl
inc  hl
ld   ($7E59),hl
ld   h,(ix+$10)
ld   ($7E5D),hl
ld   a,($7C3F)
and  a
jr   z,$3482
ld   hl,($7D65)
ld   ($7E69),hl
ld   de,($7D61)
ld   b,$04
jr   $34CF
ld   iy,($7C43)
ld   a,($7C42)
and  a
ld   a,(iy+$12)
jr   z,$34B9
and  a
jr   nz,$3493
inc  a
ld   d,a
ld   e,$00
ld   a,($7CEB)
call $3439
ld   a,($7D0A)
call $3439
ld   a,($7D29)
call $3439
ld   a,($7D48)
call $3439
xor  a
or   e
jr   nz,$34B4
ld   d,$01
ld   a,d
ld   b,$02
jr   $34BB
ld   b,$05
ld   ($7C41),a
sla  a
ld   hl,$323E
call $114C
ld   ($7E69),de
inc  hl
inc  hl
ld   e,(hl)
inc  hl
ld   d,(hl)
ld   a,b
ld   ($7E6B),a
ld   ($7E67),de
ld   a,(ix+$0c)
cp   d
jr   nc,$34E2
ld   hl,$0FAB
jr   $34E5
ld   hl,$0FB3
ld   (ix+$07),h
ld   (ix+$06),l
set  7,(ix+$11)
res  3,(ix+$11)
ld   a,$10
ld   ($7CC1),a
ld   ($7C3E),a
pop  iy
pop  ix
ei
ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
inc  c
ld   a,h
rla
add  hl,de
ld   a,(bc)
ld   h,$1E
add  hl,de
dec  (hl)
dec  de
inc  c
ld   a,h
jr   nc,$352C
ex   af,af'
ld   a,h
ex   af,af'
rla
add  hl,de
add  hl,bc
daa
inc  hl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  a,h
add  hl,de
ld   hl,($A519)
add  hl,de
ld   c,l
add  hl,de
inc  bc
ld   c,l
dec  de
ex   af,af'
ld   a,h
rla
ex   af,af'
ex   af,af'
ld   e,$56
dec  (hl)
add  hl,de
ld   a,(bc)
ld   e,h
ld   e,$42
dec  (hl)
dec  de
ret  p
ex   af,af'
ld   bc,$150D
dec  de
nop
ld   (bc),a
inc  d
jr   $355F
ld   b,(hl)
dec  (hl)
rlca
dec  de
ret  p
inc  e
dec  de
nop
and  l
dec  de
call nz,$1B04
ld   bc,$1B03
jr   z,$355A
ld   hl,($581F)
dec  (hl)
rlca
rlca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
inc  d
ld   a,h
inc  (hl)
dec  de
adc  a,d
ld   a,h
rla
ld   e,$6C
dec  (hl)
dec  de
cp   h
ld   a,h
jr   nc,$3589
daa
ld   (hl),$1B
ld   de,$177C
dec  de
ld   de,$347C
ex   af,af'
ld   e,$26
ld   (hl),$1B
add  hl,bc
ld   a,h
rla
ld   e,$FE
dec  (hl)
dec  de
djnz $35FE
rla
ld   e,$C6
dec  (hl)
dec  de
ld   a,l
ld   a,(hl)
rla
ld   e,$B0
dec  (hl)
ex   af,af'
ld   ($1E26),hl
xor  c
dec  (hl)
dec  de
ld   b,$7C
rla
ld   e,$9D
dec  (hl)
rra
and  (hl)
dec  (hl)
dec  de
ld   a,a
ld   a,(hl)
jr   nc,$35BD
ld   de,$047C
dec  c
rra
xor  l
dec  (hl)
dec  de
ld   a,a
ld   a,(hl)
inc  (hl)
rra
jp   $1B35
ld   de,$047C
dec  de
cp   e
ld   a,h
rla
ld   e,$BE
dec  (hl)
rra
jp   nz,$1B35
cp   h
ld   a,h
jr   nc,$35D0
rra
ei
dec  (hl)
dec  de
ld   b,$7C
rla
ld   e,$E2
dec  (hl)
dec  de
ex   af,af'
ld   a,h
rla
ld   e,$D8
dec  (hl)
ld   (hl),e
rra
rst  $18
dec  (hl)
dec  de
cp   h
ld   a,h
jr   nc,$35E7
ld   (hl),e
add  hl,bc
rra
ei
dec  (hl)
ex   af,af'
ld   ($1B1A),hl
ld   de,$047C
add  hl,de
cp   $1A
dec  de
ex   af,af'
ld   a,h
rla
ld   e,$F6
dec  (hl)
rra
ei
dec  (hl)
dec  de
cp   h
ld   a,h
jr   nc,$3605
rra
djnz $3634
dec  de
ex   af,af'
ld   a,h
rla
ld   e,$09
ld   (hl),$73
rra
djnz $363F
dec  de
cp   h
ld   a,h
jr   nc,$3618
ld   (hl),e
add  hl,bc
dec  de
ex   af,af'
ld   a,h
rla
inc  d
dec  de
ex   af,af'
ld   a,h
inc  b
add  a,l
dec  de
ld   e,$7C
jr   nc,$35A5
dec  de
ld   e,$7C
inc  (hl)
rra
daa
ld   (hl),$07
dec  de
ld   a,a
ld   a,(hl)
rla
ld   e,$31
ld   (hl),$1F
dec  (hl)
ld   (hl),$1B
djnz $36B0
inc  (hl)
inc  bc
xor  a
djnz $360B
djnz $3637
djnz $35E5
djnz $35E7
djnz $3613
djnz $35F9
djnz $3609
djnz $362E
djnz $35FF
djnz $35FA
ld   ($7CC3),a
ld   hl,$0628
ld   a,($7CD9)
and  a
jr   z,$369C
ld   ($7C7A),hl
di
ld   hl,($7D61)
dec  hl
dec  hl
dec  hl
dec  hl
ld   ($7E59),hl
ld   hl,($7D65)
dec  hl
dec  hl
dec  hl
dec  hl
dec  hl
dec  hl
dec  hl
ld   ($7E5D),hl
ei
call $329F
ld   bc,$367C
jp   $1B2C
add  a,a
nop
di
ld   hl,$0F35
ld   a,$01
ld   ($7C58),a
ld   ($7CB3),a
ld   a,($7C34)
and  a
jr   z,$369A
ld   a,($7C56)
ld   hl,$3636
call $114C
ex   de,hl
jr   $36A2
ld   ($7C5A),hl
ld   hl,$0F34
ld   ($7E54),hl
ld   hl,$7E5F
set  7,(hl)
res  3,(hl)
ei
ret
dec  b
inc  bc
inc  bc
inc  bc
inc  bc
ld   (bc),a
ld   (bc),a
ld   bc,$CF01
dec  de
inc  c
ld   a,h
rla
dec  de
dec  (hl)
ld   a,h
rla
ld   e,$E8
ld   (hl),$08
add  hl,de
ld   b,$5D
ld   e,$CF
ld   (hl),$07
ld   ($DB1F),hl
ld   (hl),$22
ld   e,l
ld   e,$D9
ld   (hl),$19
ld   (bc),a
rra
in   a,($36)
add  hl,de
inc  bc
dec  de
and  e
ld   a,h
rla
ld   e,$E5
ld   (hl),$07
add  hl,de
inc  b
rra
inc  b
scf
dec  de
and  e
ld   a,h
rla
ld   e,$FE
ld   (hl),$19
inc  bc
ld   e,l
ld   e,$F9
ld   (hl),$22
rra
ei
ld   (hl),$19
ld   (bc),a
rra
inc  b
scf
ld   ($0E27),hl
xor  (hl)
ld   (hl),$17
dec  de
xor  d
ld   a,h
inc  b
inc  bc
ld   ($7CD3),a
ld   ($7C1E),a
ld   bc,$3715
jp   $2231
adc  a,b
nop
xor  a
ld   ($7CD2),a
ld   ($7CD9),a
ld   ($7CB3),a
ld   ($7C1E),a
ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
or   h
ld   a,h
inc  (hl)
dec  de
or   l
ld   a,h
rla
ld   e,$3A
scf
ld   h,h
dec  de
or   l
ld   a,h
inc  (hl)
ld   a,l
rra
ld   e,b
scf
dec  de
dec  de
ld   a,h
rla
ld   e,$54
scf
dec  de
ld   a,(bc)
ld   a,h
rla
ld   e,$4E
scf
dec  de
ld   l,c
cpl
rra
ld   d,c
scf
dec  de
ld   c,a
cpl
rra
ld   d,a
scf
dec  de
add  hl,sp
cpl
ld   a,b
inc  bc
ld   hl,$0F23
xor  a
ld   ($7CA4),a
di
ld   ($7E35),hl
ld   ($7E16),hl
ld   ($7DF7),hl
call $11FB
ei
ret
ld   de,$0201
ld   a,($7C0A)
and  a
jr   z,$377B
ld   de,$0102
ld   a,($7CD3)
and  a
jp   z,$380A
ld   a,($7C35)
and  a
jr   z,$37A5
ld   a,($7C1B)
and  a
jr   z,$3790
ld   e,$02
push de
di
push ix
push iy
ld   d,$0A
call $2C90
pop  iy
pop  ix
ei
pop  de
xor  $01
jr   $37A9
in   a,($10)
and  d
xor  d
ld   ($7CD7),a
ld   a,($7CD8)
and  a
ret  z
ld   a,($7CA6)
and  a
ret  nz
ld   a,($7CB7)
and  a
jr   z,$37C0
in   a,($10)
and  e
ret  nz
inc  a
ld   ($7C1E),a
xor  a
ld   ($7CA1),a
ld   ($7CD3),a
ld   a,($7CB0)
and  a
jr   nz,$37D9
ld   bc,$37D7
jp   $1268
adc  a,c
nop
xor  a
ld   ($7CB1),a
ld   ($7CB2),a
ld   ($7CB0),a
ld   hl,$0F9C
ld   ($7D5C),hl
ld   ($7CD8),a
ld   ($7D5E),a
ld   a,$4A
ld   ($7CC1),a
ld   ($7CD9),a
ld   hl,$7D56
ld   ($7C4F),hl
ld   hl,$7D67
set  7,(hl)
call $11A5
xor  a
ld   ($7C1E),a
ret
ld   a,($7C35)
and  a
jr   z,$3825
ld   a,($7C07)
add  a,$98
ld   d,a
ld   a,($7E5E)
cp   d
ret  c
ld   a,($7E5A)
sbc  a,$26
cp   $04
ret  nc
jr   $3829
in   a,($10)
and  d
ret  nz
ld   a,($7CB3)
and  a
ret  z
ld   ($7CD5),a
ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
inc  e
dec  de
nop
ld   a,(bc)
dec  de
jr   z,$3844
ld   l,$0C
ld   c,c
ld   c,(hl)
ld   d,e
ld   b,l
ld   d,d
ld   d,h
jr   nz,$3889
ld   c,a
ld   c,c
ld   c,(hl)
ld   d,e
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
adc  a,d
dec  de
ld   ($3538),a
dec  de
add  hl,bc
ld   a,h
rla
ld   e,$C6
jr   c,$3875
nop
inc  c
dec  de
nop
ld   a,(de)
dec  de
jr   z,$386A
ld   l,$1C
ld   sp,$4320
ld   c,a
ld   c,c
ld   c,(hl)
jr   nz,$38BC
ld   b,l
ld   d,d
jr   nz,$38C0
ld   c,h
ld   b,c
ld   e,c
ld   b,l
ld   d,d
jr   nz,$38A8
ld   d,e
ld   d,h
jr   nz,$38C4
ld   c,(hl)
ld   c,(hl)
ld   c,c
ld   c,(hl)
ld   b,a
cpl
dec  de
nop
rla
dec  de
nop
ld   hl,($281B)
ex   af,af'
ld   l,$11
ld   sp,$4320
ld   c,a
ld   c,c
ld   c,(hl)
jr   nz,$38E4
ld   b,l
ld   d,d
jr   nz,$38E8
ld   c,h
ld   b,c
ld   e,c
ld   b,l
ld   d,d
cpl
dec  de
nop
rrca
dec  de
nop
ld   a,($281B)
ex   af,af'
ld   l,$19
ld   b,l
ld   b,c
ld   b,e
ld   c,b
jr   nz,$38F0
ld   b,h
ld   b,h
ld   c,c
ld   d,h
ld   c,c
ld   c,a
ld   c,(hl)
ld   b,c
ld   c,h
jr   nz,$38EC
jr   nz,$3905
ld   c,(hl)
ld   c,(hl)
ld   c,c
ld   c,(hl)
ld   b,a
ld   d,e
cpl
rra
ld   de,$1B39
nop
jr   $38E5
nop
dec  e
dec  de
jr   z,$38D7
ld   l,$12
ld   sp,$4320
ld   c,a
ld   c,c
ld   c,(hl)
jr   nz,$390A
ld   d,e
ld   d,h
jr   nz,$3926
ld   c,(hl)
ld   c,(hl)
ld   c,c
ld   c,(hl)
ld   b,a
jr   nz,$3913
dec  de
nop
ex   af,af'
dec  de
nop
jr   nc,$3906
jr   z,$38F5
ld   l,$21
ld   sp,$4320
ld   c,a
ld   c,c
ld   c,(hl)
jr   nz,$393C
ld   b,c
ld   b,e
ld   c,b
jr   nz,$393D
ld   b,h
ld   b,h
ld   c,c
ld   d,h
ld   c,c
ld   c,a
ld   c,(hl)
ld   b,c
ld   c,h
jr   nz,$3939
jr   nz,$3952
ld   c,(hl)
ld   c,(hl)
ld   c,c
ld   c,(hl)
ld   b,a
ld   d,e
jr   nz,$3940
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
rlca
dec  de
nop
djnz $3935
jr   z,$3924
ld   l,$21
ld   b,e
ld   c,a
ld   c,(hl)
ld   b,a
ld   d,d
ld   b,c
ld   d,h
ld   d,l
ld   c,h
ld   b,c
ld   d,h
ld   c,c
ld   c,a
ld   c,(hl)
ld   d,e
jr   nz,$3988
ld   c,a
ld   d,l
jr   nz,$3974
ld   d,d
ld   b,l
jr   nz,$398D
ld   b,l
ld   d,d
ld   e,c
jr   nz,$3983
ld   c,a
ld   c,a
ld   b,h
cpl
dec  de
nop
ld   c,$1B
nop
jr   z,$3962
jr   z,$3951
ld   l,$1A
ld   c,h
ld   b,l
ld   d,h
ld   d,e
jr   nz,$39A1
ld   c,h
ld   b,c
ld   e,c
jr   nz,$3997
ld   b,a
ld   b,c
ld   c,c
ld   c,(hl)
jr   nz,$39A5
jr   nz,$39B5
ld   c,c
ld   c,h
ld   c,h
jr   nz,$39A5
ld   d,l
ld   e,c
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
dec  c
ld   a,h
rla
dec  de
ld   c,$7C
rla
ld   h,$1E
sub  d
add  hl,sp
dec  de
nop
add  hl,de
dec  de
nop
djnz $3996
jr   z,$3985
ld   l,$0F
ld   d,h
ld   c,a
ld   c,a
jr   nz,$39C6
ld   b,c
ld   b,h
jr   nz,$39DF
ld   b,l
jr   nz,$39DF
ld   c,c
ld   b,l
ld   b,h
cpl
rra
xor  e
add  hl,sp
dec  de
nop
dec  de
dec  de
nop
djnz $39B4
jr   z,$39A3
ld   l,$0D
ld   d,h
ld   c,a
ld   c,a
jr   nz,$39E4
ld   b,c
ld   b,h
jr   nz,$39EF
jr   nz,$39FF
ld   c,a
ld   c,(hl)
cpl
ld   a,c
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
ld   a,(de)
dec  de
nop
inc  l
dec  de
jr   z,$39BF
ld   l,$0E
ld   b,h
ld   b,l
ld   d,b
ld   c,a
ld   d,e
ld   c,c
ld   d,h
jr   nz,$39F3
jr   nz,$3A07
ld   c,a
ld   c,c
ld   c,(hl)
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
rlca
dec  de
nop
jr   $39EC
jr   z,$39DB
ld   l,$21
ld   d,h
ld   c,a
jr   nz,$3A1C
ld   c,a
ld   c,(hl)
ld   d,h
ld   c,c
ld   c,(hl)
ld   d,l
ld   b,l
jr   nz,$3A29
ld   b,c
ld   c,l
ld   b,l
jr   nz,$3A28
ld   d,h
jr   nz,$3A2F
ld   c,(hl)
ld   b,h
jr   nz,$3A3D
ld   b,(hl)
jr   nz,$3A3A
ld   c,(hl)
ld   c,(hl)
ld   c,c
ld   c,(hl)
ld   b,a
cpl
dec  de
ld   a,(de)
ld   a,h
rla
ld   e,$31
ld   a,($111B)
ld   a,h
rla
ld   e,$09
ld   a,($1F8B)
ld   l,$3A
dec  de
nop
rrca
dec  de
nop
inc  l
dec  de
jr   z,$3A1A
ld   l,$19
ld   b,h
ld   b,l
ld   d,b
ld   c,a
ld   d,e
ld   c,c
ld   d,h
jr   nz,$3A4E
jr   nz,$3A62
ld   c,a
ld   c,c
ld   c,(hl)
jr   nz,$3A74
ld   b,l
ld   d,d
jr   nz,$3A78
ld   c,h
ld   b,c
ld   e,c
ld   b,l
ld   d,d
cpl
rra
ld   ($8B3A),a
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
nop
inc  d
dec  de
nop
jr   nz,$3A56
jr   z,$3A45
ld   l,$15
ld   d,e
ld   b,l
ld   c,h
ld   b,l
ld   b,e
ld   d,h
jr   nz,$3A78
jr   nz,$3A98
ld   d,d
jr   nz,$3A7E
jr   nz,$3A9E
ld   c,h
ld   b,c
ld   e,c
ld   b,l
ld   d,d
ld   d,e
cpl
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
add  hl,bc
ld   a,h
rla
ld   e,$BD
ld   a,($111B)
ld   a,h
rla
ld   ($1E7F),hl
ld   l,e
ld   a,($1F8C)
cp   d
ld   a,($001B)
ld   c,$1B
nop
ld   a,(de)
dec  de
jr   z,$3A7C
ld   l,$1A
ld   d,e
ld   b,l
ld   c,h
ld   b,l
ld   b,e
ld   d,h
jr   nz,$3AAF
jr   nz,$3AD0
ld   c,h
ld   b,c
ld   e,c
ld   b,l
ld   d,d
jr   nz,$3AD6
ld   d,d
jr   nz,$3ACE
ld   b,l
ld   d,b
ld   c,a
ld   d,e
ld   c,c
ld   d,h
cpl
dec  de
nop
rrca
dec  de
nop
jr   nc,$3AB3
jr   z,$3AA2
ld   l,$19
ld   sp,$4D20
ld   c,a
ld   d,d
ld   b,l
jr   nz,$3AE7
ld   c,a
ld   c,c
ld   c,(hl)
jr   nz,$3AEF
ld   c,a
ld   d,d
jr   nz,$3ADF
jr   nz,$3AFF
ld   c,h
ld   b,c
ld   e,c
ld   b,l
ld   d,d
ld   d,e
cpl
dec  de
adc  a,d
ld   a,h
jr   nc,$3ADA
cp   (hl)
ld   a,($038C)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
adc  a,d
add  hl,de
ld   ($491B),a
ld   a,h
inc  b
dec  de
dec  (hl)
ld   a,h
jr   nc,$3AE7
inc  (hl)
ld   a,h
jr   nc,$3A54
add  hl,de
ld   hl,($B619)
add  hl,de
ld   c,l
add  hl,de
ex   af,af'
ld   c,l
dec  de
ret  nz
ex   af,af'
dec  de
ld   (de),a
ld   a,h
ld   (bc),a
dec  de
inc  c
ld   a,h
inc  (hl)
dec  de
djnz $3B63
inc  (hl)
add  hl,de
add  hl,bc
dec  de
ex   af,af'
ld   a,h
inc  b
add  a,(hl)
dec  de
djnz $3B6E
jr   nc,$3B0F
ex   af,af'
ld   a,h
inc  (hl)
dec  de
dec  c
ld   a,h
adc  a,l
ld   d,c
dec  de
ld   b,$7C
inc  (hl)
dec  de
sbc  a,e
ld   a,h
rla
ld   e,$0C
dec  sp
dec  de
sbc  a,e
ld   a,h
inc  (hl)
scf
add  hl,de
djnz $3B89
adc  a,(hl)
dec  de
ld   e,$7C
inc  (hl)
add  hl,de
ld   h,b
ld   a,d
dec  de
ld   e,$7C
jr   nc,$3AAA
dec  de
ld   de,$177C
ld   e,$24
dec  sp
adc  a,d
dec  de
add  hl,de
ld   a,h
jr   nc,$3B44
ld   a,(bc)
ld   a,h
inc  (hl)
scf
rlca
dec  c
dec  de
dec  bc
ld   a,h
inc  (hl)
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08		; Twine to find our way back
db	$1B, $28, $7C	; -- $7C28
db	$34		; dec c, inc hl, inc de set up for loop?
db	$1B, $1E, $7C	; -- $7C1E
db	$30		; Save to $0323
		db	$48		; Call long ass routine ???
db	$19, $30	; -- $0030
		db	$08		; DUP
db	$08		; DUP
db	$1B, $49,$7C	; -- $7C49
db	$04		; c!
db	$1B, $96, $7C	; -- $7C96
db	$04		; c!
db	$1B, $95, $7C	; -- $7C96
db	$04		; c!
db	$19, $12      	; -- $0012
db	$7E        	; Read from port
db	$22		; -- $0001
		db	$1A		;
		db	$22  		; -- $0001
db	$1C		; XOR
db	$1B        	; -- $7C09
db	$09
db	$7C
db	$04        	; c!
db	$1B        	; -- $7C0B
db	$0B
db	$7C
db	$08		; DUP
db	$17        	;
db	$22, $1C, $08
db	$05
db	$04
db	$1B
db	$06, $7C
db	$17
db	$1E, $79
db	$3B
db	$08
db	$1E, $75
db	$3B
db	$1B
db	$35
db	$7C
db	$30, $1F
db	$79
db	$3B
db	$1B
db	$34
db	$7C
db	$30, $1B
db	$19
db	$7C
db	$17
db	$1E, $85
db	$3B
db	$8A
db	$8F
db	$1F
db	$12
db	$3C
db	$1B
db	$10, $7C
db	$17
db	$1E, $07
db	$3C
db	$1B
db	$06, $7C
db	$17
db	$1E, $C8
db	$3B
db	$1B
db	$0D
db	$7C
db	$17
db	$1B
db	$0E, $7C
db	$17
db	$5C
db	$1E, $B4
db	$3B
db	$90
db	$19
db	$50
db	$7A
db	$1B
db	$08
db	$7C
db	$63
db	$86
db	$90
db	$1B
db	$10, $7C
db	$34
db	$1B
db	$A3
db	$7C
db	$30, $1F
db	$C5
db	$3B
db	$91
db	$19
db	$A0
db	$7A
db	$91
db	$1B
db	$11, $7C, $17
db	$1E, $C4
db	$3B
db	$92
db	$1F
db	$C5
db	$3B
db	$8F
db	$1F
db	$04
db	$3C
db	$1B
db	$09
db	$7C
db	$17
db	$1E, $FB
db	$3B
db	$1B
db	$1A
db	$7C
db	$34
db	$1B
db	$11, $7C, $17
db	$22, $26, $1E
db	$E0
db	$3B
db	$93
db	$1F
db	$F4, $3B, $94
db	$08
db	$1E, $F2
db	$3B
db	$22, $26, $1E
db	$EE, $3B
db	$93
db	$1F
db	$EF
db	$3B
db	$92
db	$1F
db	$F4, $3B, $07
db	$8F
db	$1B
db	$1A
db	$7C
db	$30, $1F
db	$04
db	$3C
db	$94
db	$1E, $03
db	$3C
db	$92
db	$1F
db	$04
db	$3C
db	$8F
db	$1F
db	$12
db	$3C
db	$1B
db	$18, $7C
db	$17
db	$1E, $11
db	$3C
db	$1F
db	$12
db	$3C
db	$92
db	$1B
db	$1B
db	$7C
db	$17
db	$1E, $3C
db	$3C
db	$1B
db	$19
db	$7C
db	$17
db	$1E, $23
db	$3C
db	$1F
db	$3C
db	$3C
db	$1B
db	$06, $7C
db	$17
db	$1E, $2D
db	$3C
db	$1F
db	$3C
db	$3C
db	$08
db	$1B
db	$0A
db	$7C
db	$04
db	$1B
db	$0C
db	$7C
db	$17
db	$1E, $3C
db	$3C
db	$7C
db	$7D
db	$86
db	$1E, $5D
db	$3C
db	$1B
db	$12
db	$7C
db	$24
db	$1B
db	$00
db	$B7
db	$1B
db	$BF
db	$04
db	$1B
db	$0C
db	$7C
db	$17
db	$1B
db	$08
db	$7C
db	$17
db	$26, $1E
db	$5A
db	$3C
db	$95
db	$19
db	$30, $7A
db	$95
db	$1F
db	$98
db	$3C
db	$1B
db	$0C
db	$7C
db	$08
db	$63
db	$17
db	$19
db	$0A
db	$26, $1E
db	$86
db	$3C
db	$1B
db	$14
db	$7C
db	$17
db	$1E, $73
db	$3C
db	$1F
db	$75
db	$3C
db	$85
db	$86
db	$84
db	$19
db	$2A, $19, $B6
db	$19
db	$4D
db	$19
db	$08
db	$4D
db	$1B
db	$C0
db	$08
db	$1B
db	$12
db	$7C
db	$02
db	$1B
db	$12
db	$7C
db	$08
db	$24
db	$1B
db	$00
db	$02
db	$14
db	$08
db	$05
db	$02
db	$1B
db	$00
db	$B6
db	$1B
db	$BA
db	$04
db	$1B
db	$01, $05, $1B
db	$28, $08
db	$2A, $1B, $9B
db	$7C
db	$17
db	$1E, $AD
db	$3C
db	$1B
db	$9C
db	$7C
db	$30, $1F
db	$B2
db	$3C
db	$1B
db	$68
db	$12
db	$96
db	$35
db	$97
db	$98
db	$52
db	$1B
db	$B6
db	$7C
db	$34
db	$19
db	$03
db	$1B
db	$3D
db	$7C
db	$04
db	$99
db	$1B
db	$06, $7C
db	$17
db	$1E, $CB
db	$3C
db	$9A
db	$1F
db	$D6, $3C
db	$1B
db	$1B
db	$7C
db	$17
db	$1E, $D5
db	$3C
db	$1F
db	$D6, $3C
db	$9A
db	$1B
db	$D3, $7C
db	$30, $64
db	$7D
db	$1B
db	$1E, $7C
db	$34
db	$03

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ld   e,$7C
jr   nc,$3D2F
dec  de
inc  c
ld   a,h
inc  (hl)
dec  de
dec  c
ld   a,h
adc  a,l
dec  de
jr   z,$3D6E
rla
ld   e,$F9
inc  a
rra
jp   m,$9B3C
ld   a,h
ld   a,l
dec  de
jr   z,$3D7B
jr   nc,$3D1C
cp   e
ld   a,h
jr   nc,$3CA1
dec  de
cp   h
ld   a,h
inc  (hl)
add  a,(hl)
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
sbc  a,h
add  a,(hl)
dec  de
dec  bc
ld   a,h
jr   nc,$3D2E
adc  a,d
ld   a,h
inc  (hl)
dec  de
djnz $3D95
inc  (hl)
dec  de
add  hl,bc
ld   a,h
rla
ld   e,$25
dec  a
sbc  a,l
rra
ld   h,$3D
add  a,(hl)
dec  de
add  hl,de
ld   a,h
inc  (hl)
dec  de
ld   b,$7C
rla
ld   e,$3A
dec  a
sbc  a,(hl)
add  hl,de
ld   d,b
ld   (hl),$9E
sbc  a,d
rra
ld   b,l
dec  a
dec  de
dec  de
ld   a,h
rla
ld   e,$44
dec  a
rra
ld   b,l
dec  a
sbc  a,d
dec  de
ret  nz
ex   af,af'
dec  de
ld   (de),a
ld   a,h
ld   (bc),a
dec  de
jr   $3DCB
jr   nc,$3CF0
dec  de
jr   $3DD0
inc  (hl)
dec  c
ld   c,$9B
dec  bc
rrca
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$A2
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08			;Save where we came from
db  $A0		; DI

db  $0D		; $0000 to PS
db  $1B,$00,$7C	; $7C00 to PS
db  $1B,$00,$03	; $0300 to PS
db  $44		; FILL $7C00-$7F00 with $00

db  $A1		; Save some variables
db  $19,$11		; $11 to PS
 			db  $7E		; Read Port to PS
			db  $19,$10		; $10 to PS
			db  $1A
db  $19
db  $10,$1C
db  $1B
db  $1B
db  $7C
db  $04
db  $19
db  $06,$1B
db  $15
db  $7C
db  $04
db  $19
db  $06,$1B
db  $15
db  $7C
db  $04
db  $1B
db  $19
db  $7C
db  $30,$1B
db  $1E,$7C
db  $30,$7D
db  $7C
db  $7D
db  $8A
db  $03

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  de
ex   af,af'
ld   a,h
rla
ex   af,af'
ld   e,$A9
dec  a
dec  de
inc  c
ld   a,h
rla
daa
dec  de
ld   a,(de)
ld   a,h
rla
ld   e,$A4
dec  a
rra
xor  c
dec  a
ex   af,af'
ld   e,$A9
dec  a
ld   e,c
dec  de
ld   de,$177C
inc  d
and  d
ex   af,af'
ld   e,$BE
dec  a
dec  de
ld   de,$047C
dec  de
inc  d
ld   a,h
jr   nc,$3DDB
cp   a
dec  a
rlca
dec  de
djnz $3E3E
jr   nc,$3D63
dec  de
rra
ld   a,h
inc  (hl)
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
add  hl,de
djnz $3E4B
ex   af,af'
add  hl,de
djnz $3DEB
add  hl,de
djnz $3DF0
ld   e,$F0
dec  a
rlca
dec  de
ld   b,$7C
jr   nc,$3D80
dec  de
nop
ex   af,af'
dec  de
nop
ld   (hl),b
dec  de
sbc  a,b
inc  b
dec  de
inc  b
dec  b
dec  de
jr   z,$3DF4
ld   hl,($101F)
ld   a,$1B
adc  a,d
ld   a,h
rla
ld   e,$FB
dec  a
rlca
rra
djnz $3E39
add  hl,de
jr   nz,$3E18
add  hl,de
jr   nz,$3E1D
ld   e,$10
ld   a,$1B
add  hl,bc
ld   a,h
rla
ld   e,$0F
ld   a,$1B
ld   a,(de)
ld   a,h
jr   nc,$3DB3
inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08
dec  c
ld   e,e
rlca
dec  de
and  a
ld   a,h
rla
ld   e,$1D
ld   a,$9F
dec  de
cp   h
ld   a,h
rla
ld   e,$25
ld   a,$A4
dec  de
cp   e
ld   a,h
rla
ld   e,$2D
ld   a,$A5
dec  de
inc  d
ld   a,h
rla
ld   e,$35
ld   a,$9D
dec  de
rra
ld   a,h
rla
ld   e,$3D
ld   a,$A6
dec  de
sbc  a,a
ld   a,h
rla
ld   e,$45
ld   a,$A7
dec  de
or   h
ld   a,h
rla
ld   e,$4D
ld   a,$A8
inc  bc
push bc
ld   a,($7C4A)
and  a
call z,$376F
ld   a,($7CD9)
and  a
call nz,$2057
ld   a,($7CA4)
and  a
call nz,$3759
ld   a,($7CC3)
and  a
call nz,$364A
ld   a,($7C51)
and  a
call nz,$3441
ld   a,($7CD2)
and  a
call nz,$3709
ld   a,($7CD4)
and  a
call nz,$3314
ld   a,($7CCC)
and  a
call nz,$324E
ld   bc,$3E8D
jp   $3E11
xor  c
nop
pop  bc
jp   $3E4E
jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

rst  $08		; Mark our spot on the map
L3E96:			db	$19, $C0	; $C0
 			db	$19, $0A	; $0A
			db	$4B		; Out ($0A),$C0 --> Vertical Blank = 192
			db	$0D		; $00
			db	$19, $09	; $09
			db	$4B		; Out ($09),$00 --> Background color $00, L/R pallete $00
 			db	$A2		; Call to subroutine?

			db	$1B, $10, $7C	; $7C10
			db	$30		; Save to $0323
			db	$9F		;
			db	$AA
			db	$03		; NEXT

;********************************************************************
; This is the base of the Terse op-code look up table.
; Takes the op code and translates it to subroutine address
;********************************************************************

db	$00, $00	; $00	Reset game? Is this ever used???
db	$8D, $00	; $01	SWAP
db	$A1, $00	; $02	!	STORE 16b in memory address
db	$3A, $00	; $03	NEXT
db	$A8, $00	; $04	C!	Store 8b in memory address
db	$E8, $01	; $05	ROT
db	$82, $00	; $06	TUCK
db	$8A, $00	; $07	DROP
db	$7D, $00	; $08	DUP
db	$C8, $00	; $09	1+
db	$C3, $00	; $0A	1-
db	$68, $01	; $0B	FILL
db	$B6, $09	; $0C
db	$71, $00	; $0D	Push zero to PS
db	$61, $00	; $0E	+!
db	$30, $0A	; $0F
db	$31, $0E	; $10
db	$85, $0E	; $11
db	$E6, $00	; $12
db	$C8, $01	; $13	OVER
db	$B5, $00	; $14	+
db	$76, $01	; $15
db	$BF, $01	; $16	R@
db	$9A, $00	; $17	c@
db	$91, $01	; $18
db	$4F, $00	; $19	8b to PS
db	$47, $01	; $1A
db	$46, $00	; $1B	LIT
db	$5D, $01	; $1C	XOR
db	$52, $01	; $1D
db	$01, $02	; $1E
db	$F9, $01	; $1F
db	$49, $02	; $20
db	$9A, $0E	; $21
db	$77, $00	; $22	Push a one to PS
db	$1D, $02	; $23
db	$93, $00	; $24
db	$46, $02	; $25	EI
db	$F6, $00	; $26
db	$BB, $00	; $27
db	$41, $01	; $28
db	$8A, $0E	; $29
db	$01, $0E	; $2A
db	$5C, $12	; $2B
db	$0A, $12	; $2C
db	$28, $12	; $2D
db	$0E, $02	; $2E
db	$8E, $0E	; $2F
db	$2E, $11	; $30
db	$49, $11	; $31
db	$D6, $12	; $32
db	$E5, $12	; $33
db	$32, $11	; $34
db	$9B, $12	; $35
db	$91, $12	; $36
db	$EA, $12	; $37
db	$0E, $17	; $38
db	$28, $17	; $39
db	$CF, $01	; $3A
db	$37, $17	; $3B
db	$8A, $17	; $3C
db	$D3, $00	; $3D
db	$EF, $01	; $3E
db	$CD, $00	; $3F
db	$72, $17	; $40
db	$60, $02	; $41
db	$66, $17	; $42
db	$2B, $18	; $43
db	$53, $02	; $44
db	$BD, $0E	; $45
db	$E9, $18	; $46
db	$F8, $18	; $47
db	$4E, $18	; $48
db	$44, $18	; $49
db	$37, $14	; $4A
db	$D6, $01	; $4B	Out (x2),x1  -->  (x1 x2 -- )
db	$90, $17	; $4C
db	$B9, $17	; $4D
db	$19, $0E	; $4E
db	$5E, $18	; $4F
db	$D7, $17	; $50
db	$85, $18	; $51
db	$F3, $17	; $52
db	$07, $19	; $53
db	$8B, $1A	; $54
db	$A9, $1A	; $55
db	$D9, $1A	; $56
db	$C1, $1A	; $57
db	$F7, $1A	; $58
db	$DE, $00	; $59
db	$0A, $1B	; $5A
db	$75, $02	; $5B
db	$14, $01	; $5C
db	$3C, $01	; $5D
db	$21, $1B	; $5E
db	$A7, $1C	; $5F
db	$C6, $1D	; $60
db	$C8, $1C	; $61
db	$BC, $1D	; $62
db	$F2, $00	; $63
db	$E7, $0C	; $64
db	$19, $02	; $65
db	$0E, $1D	; $66
db	$F2, $1D	; $67
db	$4E, $1D	; $68
db	$01, $1D	; $69
db	$2C, $1B	; $6A
db	$86, $1C	; $6B
db	$36, $11	; $6C
db	$7B, $1D	; $6D
db	$BA, $1C	; $6E
db	$AB, $1C	; $6F
db	$6C, $00	; $70
db	$3A, $1F	; $71
db	$B6, $21	; $72
db	$D9, $00	; $73
db	$F6, $29	; $74
db	$19, $29	; $75
db	$77, $2A	; $76
db	$1B, $2A	; $77
db	$2D, $02	; $78
db	$B8, $2F	; $79
db	$C4, $11	; $7A
db	$EA, $2F	; $7B
db	$20, $19	; $7C
db	$78, $2F	; $7D
db	$DE, $01	; $7E	Read from port
db	$05, $01	; $7F
db	$73, $30	; $80
db	$9D, $32	; $81
db	$1E, $34	; $82
db	$26, $34	; $83
db	$41, $14	; $84
db	$01, $35	; $85
db	$1A, $35	; $86
db	$7E, $36	; $87
db	$17, $37	; $88
db	$D9, $37	; $89
db	$DB, $1D	; $8A
db	$AD, $39	; $8B
db	$33, $3A	; $8C
db	$AD, $00	; $8D
db	$4C, $38	; $8E
db	$BF, $3A	; $8F
db	$12, $39	; $90
db	$67, $39	; $91
db	$F5, $12	; $92
db	$28, $30	; $93
db	$50, $30	; $94
db	$C9, $39	; $95
db	$68, $12	; $96
db	$87, $28	; $97
db	$7E, $2A	; $98
db	$B7, $36	; $99
db	$3A, $18	; $9A
db	$F5, $30	; $9B
db	$56, $3A	; $9C
db	$59, $35	; $9D
db	$A0, $30	; $9E
db	$34, $3B	; $9F
db	$43, $02	; $A0	DI
db	$36, $0A	; $A1
db	$5B, $3D	; $A2
db	$0B, $3D	; $A3
db	$E1, $3C	; $A4
db	$C9, $3D	; $A5
db	$8C, $3D	; $A6
db	$66, $1F	; $A7
db	$25, $37	; $A8
db	$8F, $3E	; $A9
db	$4E, $3E	; $AA
db	$02, $01	; $AB
db	$80		; $AC


; $0323 --> ???
; $7C11 --> Counts up with each coin inserted at least at beginning. ???

; $7C20 --> ???
; $7C21 --> ???

; $7C23 --> ???

; $7C1C --> ???



		end
