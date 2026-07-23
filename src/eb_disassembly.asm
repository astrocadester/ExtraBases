; Extra Bases Dissassembly
; David E. Turner (Commander Dave)
; usisolutions13@gmail.com
;
; ??? Checksum:
;
; Major Changes:
; 20161124 - Created disassembly from MAME
; 20161208 - Moved comments on TERSE to its own file so it can be
;	     shared with other Astrocade game disassemblies.

; Comment format for copy / paste
;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

;	Main registers so far:
;
;	Unassigned Registers so far:
;	?? =	Forth TOS (top Param Stack item)
;	?? =	working register
;	?? =	User area Pointer

;	Assigned Registers:
;	BC =	IP   Interpreter Pointer
;       HL =
;       DE =
;       SP =	PSP  Param Stack Pointer
;       IX =	RSP  Return Stack Pointer
;       IY =
;

 			.ORG	$0000

;******************************************************************************
;
; Entry point of code. This section just jumps over the RST $08 location.
;
;******************************************************************************

Start:			nop
  			nop
  			di
  			jp   L0015
  			nop
  			nop

;******************************************************************************
; Command ----> NEXT
; SPECIAL ----> RST $08
;
; Opcode:	$??
; Diagram:	addr --
; Short code	???
; Description:	???
;
;******************************************************************************

L0008: 			dec  ix			; Push the old IP to the Return Stack
L000A: 			ld   (ix+$00),b
L000D: 			dec  ix
L000F: 			ld   (ix+$00),c
L0012: 			pop  bc			; Param field address to IP
L0013: 			jp   (iy)

;******************************************************************************
;
; Some setup code to get things started
;
;******************************************************************************

L0015:			ld   a,$01
L0017: 			out  ($08),a		; Set Hi Resolution (Commercial Mode)

L0019: 			ld   b,$00		; Loop $FF times just loading ix and sp
L001B: 			ld   ix,$8000		;	not sure why.
L001F: 			ld   sp,$7F80
L0022: 			djnz L001B

L0024: 			ld   bc,L3E96		; Point to Terse code
L0027: 			ld   iy,$002B		;	and go execute it.

;******************************************************************************
; This routine takes the Terse token pointed to in BC, looks up the
; token's subroutine in a jump table and jumps to that address to
; execute the token's subroutine.
;******************************************************************************
L002B: 			ld   a,(bc)		; Get Terse token
L002C: 			inc  bc			;
L002D: 			ld   de,$3EA7		; Base of Terse jump table
L0030: 			ld   l,a		;	take token and make it point
L0031: 			ld   h,$00		;	to the correct entry in the jump
L0033: 			add  hl,hl		;	table, load the address from the
L0034: 			add  hl,de		;	jump table and jump to it.
L0035: 			ld   e,(hl)
L0036: 			inc  hl
L0037: 			ld   d,(hl)
L0038: 			ex   de,hl
L0039: 			jp   (hl)		; Address of correct execution code in HL
						;	and we are off to see the wizard.

;******************************************************************************
; Command ----> EXIT
;
; Diagram:	--
; Opcode:	$03
; Short code:	(RSP) --> IP
; Description:	Return from Subroutine
;
;******************************************************************************

L003A: 			ld   c,(ix+$00)
L003D: 			inc  ix
L003F: 			ld   b,(ix+$00)
L0042: 			inc  ix
L0044: 			jp   (iy)

;******************************************************************************
; Command ----> LITERAL
;
; Diagram:	-- 16b
; Opcode:	$1B
; Description:	16b will be left on the stack
;
;******************************************************************************

L0046: 			ld   a,(bc)
L0047: 			inc  bc
L0048: 			ld   l,a
L0049: 			ld   a,(bc)
L004A: 			inc  bc
L004B: 			ld   h,a
L004C: 			push hl
L004D: 			jp   (iy)

;******************************************************************************
; Command ----> CLITERAL
;
; Opcode:	$19
; Diagram:	-- 8b
; Short code	HL = $00(BC), PUSH HL, BC=BC+1
; Description:
;
;******************************************************************************

L004F: 			ld   a,(bc)
L0050: 			inc  bc
L0051: 			ld   l,a
L0052: 			ld   h,$00
L0054: 			push hl
L0055: 			jp   (iy)

;******************************************************************************
; Command ----> 2LIT
;
; Opcode:	$xx
; Diagram:	???
; Short code	HL = (BC+1)(BC), PUSH HL, BC=BC+2 --> TWICE
; Description:	Take the next two words from the IP and push to PS.
;
;******************************************************************************

L0057: 			ld   a,(bc)
L0058: 			inc  bc
L0059: 			ld   l,a
L005A: 			ld   a,(bc)
L005B: 			inc  bc
L005C: 			ld   h,a
L005D: 			push hl
L005E: 			jp   $0046

;******************************************************************************
; Command ----> +!
;
; Opcode:	$0E
; Diagram:	w1 addr --
; Short code	POP HL, DE=(BC+1)(BC), BC=BC+2, HL=HL+DE, PUSH HL
; Description:	w1 is added to the w value at addr
;		This sum replaces the original value at addr.
;
;******************************************************************************

L0061: 			pop  hl
L0062: 			ld   a,(bc)
L0063: 			inc  bc
L0064: 			ld   e,a
L0065: 			ld   a,(bc)
L0066: 			inc  bc
L0067: 			ld   d,a
L0068: 			add  hl,de
L0069: 			push hl
L006A: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	POP HL, HL=HL*2, jump to L0062
; Description:	Get word from PS, double it, add it to IP and put it back on PS
;
;******************************************************************************


L006C: 			pop  hl
L006D: 			add  hl,hl
L006E: 			jp   $0062

;******************************************************************************
; Command ----> ???
;
; Opcode:	$0D
; Diagram:	???
; Short code	HL = $0000, Push HL
; Description:	Push a 0 to the PS
;
;******************************************************************************

L0071: 			ld   hl,$0000
L0074: 			push hl
L0075: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$22
; Diagram:	???
; Short code	HL = $0001, Push HL
; Description:	Push 1 to the PS
;
;******************************************************************************

L0077: 			ld   hl,$0001
L007A: 			push hl
L007B: 			jp   (iy)

;******************************************************************************
; Command ----> DUP
;
; Opcode:	$08
; Diagram:	???
; Short code	Pop HL, Push HL, Push HL
; Description:	Duplicates word on the PS
;
;******************************************************************************

L007D: 			pop  hl
L007E: 			push hl
L007F: 			push hl
L0080: 			jp   (iy)

;******************************************************************************
; Command ----> 2DUP ???
;
; Opcode:	$06
; Diagram:	x1 x2 -- x1 x2 x1 x2
; Short code	See code
; Description:	Copy second item from PS to top of PS
;
;******************************************************************************

L0082: 			pop  hl
L0083: 			pop  de
L0084: 			push de
L0085: 			push hl
L0086: 			push de
L0087: 			push hl
L0088: 			jp   (iy)

;******************************************************************************
; Command ----> DROP
;
; Opcode:	$07
; Diagram:	???
; Short code	See code
; Description:	Throws away top entry on PS
;
;******************************************************************************

L008A: 			pop  hl
L008B: 			jp   (iy)

;******************************************************************************
; Command ----> SWAP
;
; Opcode:	$01
; Diagram:	???
; Short code	See code
; Description:	Swaps the top two entries on the PS
;
;******************************************************************************

L008D: 			pop  hl
L008E: 			pop  de
L008F: 			push hl
L0090: 			push de
L0091: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	pop hl, de = (hl+1)(hl), push de
; Description:	Get word value from address in PS and save it to PS
;
;******************************************************************************

L0093: 			pop  hl
L0094: 			ld   e,(hl)
L0095: 			inc  hl
L0096: 			ld   d,(hl)
L0097: 			push de
L0098: 			jp   (iy)

;******************************************************************************
; Command ----> C@
;
; Opcode:	$17
; Diagram:	addr -- 8b
; Short code	pop hl, de = ($00)(hl), push de
; Description:	8b is the contents of the byte at addr
;
;******************************************************************************

L009A: 			pop  hl
L009B: 			ld   e,(hl)
L009C: 			ld   d,$00
L009E: 			push de
L009F: 			jp   (iy)

;******************************************************************************
; Command ----> !		"store"
;
; Opcode:	$02
; Diagram:	16b addr --
; Short code	pop hl, pop de, (hl)(hl+1)=de
; Description:	16b is stored at addr.
;
;******************************************************************************

L00A1: 			pop  hl
L00A2: 			pop  de
L00A3: 			ld   (hl),e
L00A4: 			inc  hl
L00A5: 			ld   (hl),d
L00A6: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$04
; Diagram:	???
; Short code	pop hl, pop de, (HL)=e
; Description:	Get address and byte value from PS, save byte value to address.
;
;******************************************************************************

L00A8: 			pop  hl
L00A9: 			pop  de
L00AA: 			ld   (hl),e
L00AB: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	pop hl, (HL)(hl+1)=$0000
; Description:	Get address from PS and save $0000 to address.
;
;******************************************************************************

L00AD: 			pop  hl
L00AE: 			ld   (hl),$00
L00B0: 			inc  hl
L00B1: 			ld   (hl),$00
L00B3: 			jp   (iy)


;******************************************************************************
; Command ----> +	'PLUS'
;
; Opcode:	$14
; Diagram:	w1 w2 -- w3
; Short code	???
; Description:	w3 is the arithmetic sum of w1 plus w2
;
;******************************************************************************

L00B5: 			pop  de
L00B6: 			pop  hl
L00B7: 			add  hl,de
L00B8: 			push hl
L00B9: 			jp   (iy)

;******************************************************************************
; Command ----> -	'MINUS'
;
; Opcode:	$xx
; Diagram:	w1 w2 -- w3
; Short code	???
; Description:	???
;
;******************************************************************************

L00BB: 			pop  de
L00BC: 			pop  hl
L00BD: 			xor  a
L00BE: 			sbc  hl,de
L00C0: 			push hl
L00C1: 			jp   (iy)

;******************************************************************************
; Command ----> 1-	"one-minus"
;
; Opcode:	$0A
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L00C3: 			pop  hl
L00C4: 			dec  hl
L00C5: 			push hl
L00C6: 			jp   (iy)

;******************************************************************************
; Command ----> 1+	"one-plus"
;
; Opcode:	$09
; Diagram:	w1 -- w2
; Short code	???
; Description:	w2 is the result of adding one to w1
;
;******************************************************************************

L00C8: 			pop  hl
L00C9: 			inc  hl
L00CA: 			push hl
L00CB: 			jp   (iy)

;******************************************************************************
; Command ----> 2+		"two-plus"
;
; Opcode:	$xx
; Diagram:	w1 -- w2
; Short code	???
; Description:	w2 is the result of adding two to w1
;
;******************************************************************************

L00CD: 			pop  hl
L00CE: 			inc  hl
L00CF: 			inc  hl
L00D0: 			push hl
L00D1: 			jp   (iy)

;******************************************************************************
; Command ----> 2-		"two-minus"
;
; Opcode:	$xx
; Diagram:	w1 -- w2
; Short code	???
; Description:	w2 is the result of subtracting two from w1
;
;******************************************************************************

L00D3: 			pop  hl
L00D4: 			dec  hl
L00D5: 			dec  hl
L00D6: 			push hl
L00D7: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L00D9: 			pop  hl
L00DA: 			add  hl,hl
L00DB: 			push hl
L00DC: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L00DE: 			pop  hl
L00DF: 			sra  h
L00E1: 			rr   l
L00E3: 			push hl
L00E4: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L00E6: 			pop  hl
L00E7: 			ld   a,(hl)
L00E8: 			inc  hl
L00E9: 			push hl
L00EA: 			ld   l,a
L00EB: 			res  7,l
L00ED: 			ld   h,$00
L00EF: 			push hl
L00F0: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L00F2: 			pop  hl
L00F3: 			inc  (hl)
L00F4: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L00F6: 			pop  de
L00F7: 			pop  hl
L00F8: 			xor  a
L00F9: 			sbc  hl,de
L00FB: 			ld   hl,$0000
L00FE: 			jp   nz,$0102
L0101: 			inc  hl
L0102: 			push hl
L0103: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0105: 			pop  de
L0106: 			pop  hl
L0107: 			xor  a
L0108: 			sbc  hl,de
L010A: 			ld   hl,$0000
L010D: 			jp   z,$0111
L0110: 			inc  hl
L0111: 			push hl
L0112: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0114: 			pop  de
L0115: 			pop  hl
L0116: 			xor  a
L0117: 			sbc  hl,de
L0119: 			ld   de,$0000
L011C: 			push af
L011D: 			pop  hl
L011E: 			ld   a,l
L011F: 			and  $84
L0121: 			jp   pe,$0125
L0124: 			inc  de
L0125: 			push de
L0126: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0128: 			pop  de
L0129: 			pop  hl
L012A: 			xor  a
L012B: 			sbc  hl,de
L012D: 			ld   de,$0000
L0130: 			push af
L0131: 			pop  hl
L0132: 			ld   a,l
L0133: 			and  $84
L0135: 			jp   po,$0139
L0138: 			inc  de
L0139: 			push de
L013A: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L013C: 			pop  hl
L013D: 			pop  de
L013E: 			jp   $0116

;******************************************************************************
; Command ----> ???
;
; Opcode:	$28
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************
L0141: 			ld   de,$0000
L0144: 			jp   $00F7

;******************************************************************************
; Command ----> ???
;
; Opcode:	$1A
; Diagram:	???
; Short code	???
; Description:	Check if bits are set in HL according to DE
;
;******************************************************************************

L0147: 			pop  de		; Bits to check for
L0148: 			pop  hl		; Value to check against
L0149: 			ld   a,l
L014A: 			and  e
L014B: 			ld   l,a
L014C: 			ld   a,h
L014D: 			and  d
L014E: 			ld   h,a
L014F: 			push hl		; Put result on PS
L0150: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$1D
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0152: 			pop  de
L0153: 			pop  hl
L0154: 			ld   a,l
L0155: 			or   e
L0156: 			ld   l,a
L0157: 			ld   a,h
L0158: 			or   d
L0159: 			ld   h,a
L015A: 			push hl
L015B: 			jp   (iy)

;******************************************************************************
; Command ----> XOR
;
; Opcode:	$1C
; Diagram:	16b1 16b2 -- 16b3
; Description:	16b3 is the bit-by-bit exclusive-or of 16b1 with 16b2
;
;******************************************************************************

L015D: 			pop  de
L015E: 			pop  hl
L015F: 			ld   a,l
L0160: 			xor  e
L0161: 			ld   l,a
L0162: 			ld   a,h
L0163: 			xor  d
L0164: 			ld   h,a
L0165: 			push hl
L0166: 			jp   (iy)

;******************************************************************************
; Command ----> FILL
;
; Opcode:	$0B
; Diagram:	addr u 8b --
; Short code	???
; Description:	u bytes of memory beginning at addr are set to 8b.
;		No action is taken if u is zero.
;
;******************************************************************************


L0168: 			exx
L0169: 			pop  bc
L016A: 			pop  de
L016B: 			pop  hl
L016C: 			ld   a,b
L016D: 			or   c
L016E: 			jp   z,$0173
L0171: 			ldir
L0173: 			exx
L0174: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$15
; Diagram:	x1, x2 -- R: x2, x1, IP
; Description:	x1 is counter, x2 is limit for count
;		Looks like this sets up for a count from x1 to x2
;		So far code $18 follows. Not sure why... timer?
;
;******************************************************************************


L0176: 			ld   de,$FFFA		;
L0179: 			add  ix,de		; Move RSP down three words
L017B: 			pop  hl
L017C: 			pop  de
L017D: 			ld   (ix+$00),l		; ???
L0180: 			ld   (ix+$01),h
L0183: 			ld   (ix+$02),e		; ???
L0186: 			ld   (ix+$03),d
L0189: 			ld   (ix+$04),c		; Calling IP
L018C: 			ld   (ix+$05),b
L018F: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$18
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0191: 			ld   l,(ix+$00)
L0194: 			ld   h,(ix+$01)
L0197: 			inc  hl
L0198: 			ld   (ix+$00),l
L019B: 			ld   (ix+$01),h
L019E: 			ld   e,(ix+$02)
L01A1: 			ld   d,(ix+$03)
L01A4: 			xor  a
L01A5: 			sbc  hl,de
L01A7: 			push af
L01A8: 			pop  hl
L01A9: 			ld   a,l
L01AA: 			and  $84
L01AC: 			jp   po,$01B7
L01AF: 			ld   de,$0006
L01B2: 			add  ix,de
L01B4: 			jp   $01BD
L01B7: 			ld   c,(ix+$04)
L01BA: 			ld   b,(ix+$05)
L01BD: 			jp   (iy)

;******************************************************************************
; Command ----> R@		"r-fetch"
;
; Opcode:	$16
; Diagram:	-- 16b
; Short code	???
; Description:	16b is a copy of the top of the return stack
;
;******************************************************************************

L01BF: 			ld   l,(ix+$00)
L01C2: 			ld   h,(ix+$01)
L01C5: 			push hl
L01C6: 			jp   (iy)

;******************************************************************************
; Command ----> OVER
;
; Opcode:	$13
; Diagram:	16b1 16b2 -- 16b1 16b2 16b3
; Short code	???
; Description:	16b3 is a copy of 16b1
;
;******************************************************************************

L01C8: 			pop  hl
L01C9: 			pop  de
L01CA: 			push de
L01CB: 			push hl
L01CC: 			push de
L01CD: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L01CF: 			pop  hl
L01D0: 			ld   e,l
L01D1: 			ld   l,h
L01D2: 			ld   h,e
L01D3: 			push hl
L01D4: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$4B
; Diagram:	???
; Short code	???
; Description:	Write to data to output port
;		The port and data values are on the PS popped into
;		c for the port and l for the value and then it writes to the port.
;
;******************************************************************************

L01D6: 			exx
L01D7: 			pop  bc
L01D8: 			pop  hl
L01D9: 			out  (c),l
L01DB: 			exx
L01DC: 			jp   (iy)

;******************************************************************************
; Command ----> PC@ ??? (The difference is that this gets the port off
;			the parm stack)
;
; Opcode:	$7E
; Diagram:	???
; Short code	???
; Description:	Read port given in C into register L. Save result on stack.
;		Note: Register B is put on upper half of data bus during read
;
;******************************************************************************

L01DE: 			exx
L01DF: 			pop  bc
L01E0: 			in   l,(c)
L01E2: 			ld   h,$00
L01E4: 			push hl
L01E5: 			exx
L01E6: 			jp   (iy)

;******************************************************************************
; Command ----> ROT		"ROTE"
;
; Opcode:	$05
; Diagram:	16b1 16b2 16b3 -- 16b2 16b3 16b1
; Short code	???
; Description:	The top three stack entries are rotated, bringing the
;		deepest to the top.
;
;******************************************************************************

L01E8: 			pop  de
L01E9: 			pop  hl
L01EA: 			ex   (sp),hl
L01EB: 			push de
L01EC: 			push hl
L01ED: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L01EF: 			pop  hl
L01F0: 			dec  hl
L01F1: 			add  hl,hl
L01F2: 			add  hl,sp
L01F3: 			ld   e,(hl)
L01F4: 			inc  hl
L01F5: 			ld   d,(hl)
L01F6: 			push de
L01F7: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$1F
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L01F9: 			ld   a,(bc)
L01FA: 			ld   e,a
L01FB: 			inc  bc
L01FC: 			ld   a,(bc)
L01FD: 			ld   b,a
L01FE: 			ld   c,e
L01FF: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$1E
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0201: 			pop  hl
L0202: 			ld   a,h
L0203: 			or   l
L0204: 			jp   z,$020B
L0207: 			inc  bc
L0208: 			inc  bc
L0209: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L020B: 			jp   $01F9
L020E: 			push bc
L020F: 			ld   a,(bc)
L0210: 			inc  bc
L0211: 			ld   l,a
L0212: 			ld   h,$00
L0214: 			add  hl,bc
L0215: 			ld   b,h
L0216: 			ld   c,l
L0217: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************




L0219: 			rst  08
L021A: 			ld   bc,$0302

;******************************************************************************
; Command ----> ???
;
; Opcode:	$23
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L021D: 			rst  08
L021E: 			ld   bc,$0304
L0221: 			pop  af
L0222: 			pop  bc
L0223: 			pop  de
L0224: 			pop  hl
L0225: 			exx
L0226: 			ex   af,af'
L0227: 			pop  af
L0228: 			pop  bc
L0229: 			pop  de
L022A: 			pop  hl
L022B: 			ei
L022C: 			ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$78
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************
L022D: 			di
L022E: 			pop  hl
L022F: 			ld   ($7C00),hl
L0232: 			ld   a,$08
L0234: 			out  ($0E),a
L0236: 			ld   a,$7C
L0238: 			ld   i,a
L023A: 			ld   a,$00
L023C: 			out  ($0D),a
L023E: 			im   2
L0240: 			ei
L0241: 			jp   (iy)

;********************************************************************
; Command -----> ???
;
; Opcode: $A0
; Disable Interrupts
;
;********************************************************************

L0243: 			di
L0244: 			jp   (iy)

;********************************************************************
;
; Command -----> EI
;
; Opcode: $25
; Enable Interrupts
;
;********************************************************************

L0246: 			ei
L0247: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$20
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L0249: 			pop  hl
L024A: 			ld   a,l
L024B: 			rlca
L024C: 			rlca
L024D: 			rlca
L024E: 			rlca
L024F: 			ld   l,a
L0250: 			push hl
L0251: 			jp   (iy)

;********************************************************************
; Opcode: $44 - Fill Subroutine
; Input: [fill] [addr] [count] --
;
; Description:  Given the input on the stack it will fill memory
;		from [addr] to [addr+count] with [fill]
;
;********************************************************************

L0253: 			rst  08		; Save where we were
L0254: 			.DB  $05	; ROT
L0255: 			.DB  $05	; ROT
L0256: 			.DB  $06	; 2DUP
			.DB  $02	; !
L0258: 			.DB  $01	; SWAP
			.DB  $07	; DROP
			.DB  $08	; DUP
L025B: 			.DB  $09      	; 1+
L025C: 			.DB  $05      	; ROT
L025D: 			.DB  $0A      	; 1-
L025E: 			.DB  $0B      	; FILL
L025F: 			.DB  $03      	; NEXT

;**************************************

L0260: 			exx
L0261: 			pop  bc
L0262: 			dec  c
L0263: 			ld   hl,$0001
L0266: 			add  hl,sp
L0267: 			add  hl,bc
L0268: 			add  hl,bc
L0269: 			ld   d,(hl)
L026A: 			dec  hl
L026B: 			ld   e,(hl)
L026C: 			push de
L026D: 			dec  hl
L026E: 			dec  c
L026F: 			jp   p,$0269
L0272: 			exx
L0273: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L0275: 			exx
L0276: 			ld   bc,($7C02)
L027A: 			ld   hl,$1321
L027D: 			add  hl,bc
L027E: 			push hl
L027F: 			ld   hl,$2776
L0282: 			adc  hl,bc
L0284: 			ld   de,($7C04)
L0288: 			add  hl,de
L0289: 			ex   (sp),hl
L028A: 			add  hl,bc
L028B: 			ex   (sp),hl
L028C: 			adc  hl,de
L028E: 			ex   (sp),hl
L028F: 			add  hl,bc
L0290: 			ex   (sp),hl
L0291: 			adc  hl,de
L0293: 			ex   (sp),hl
L0294: 			ld   d,e
L0295: 			ld   e,b
L0296: 			ld   b,c
L0297: 			ld   c,$00
L0299: 			add  hl,bc
L029A: 			ld   ($7C02),hl
L029D: 			pop  hl
L029E: 			adc  hl,de
L02A0: 			ld   ($7C04),hl
L02A3: 			exx
L02A4: 			ld   hl,$0000
L02A7: 			ld   d,h
L02A8: 			ld   e,l
L02A9: 			exx
L02AA: 			ex   de,hl
L02AB: 			pop  bc
L02AC: 			ld   hl,$0000
L02AF: 			srl  b
L02B1: 			rr   c
L02B3: 			jp   nc,$02BB
L02B6: 			add  hl,de
L02B7: 			exx
L02B8: 			adc  hl,de
L02BA: 			exx
L02BB: 			ld   a,b
L02BC: 			or   c
L02BD: 			jp   z,$02CD
L02C0: 			sla  e
L02C2: 			rl   d
L02C4: 			exx
L02C5: 			rl   e
L02C7: 			rl   d
L02C9: 			exx
L02CA: 			jp   $02AF
L02CD: 			exx
L02CE: 			push hl
L02CF: 			jp   (iy)

;******************************************************************************

			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			jr   $031F
			jr   $0301
			jr   $0303
			jr   $0305
			inc  a
			inc  a
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   b,$3E
			ld   a,h
			ld   h,b
			ld   h,b
			ld   a,(hl)
			ld   a,(hl)
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   b,$1C
			ld   e,$06
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			ld   a,(hl)
			ld   b,$06
			ld   b,$06
			ld   a,h
			ld   a,h
			ld   h,b
			ld   h,b
			ld   a,h
			ld   a,(hl)
			ld   b,$66
			ld   a,(hl)
			inc  a
			inc  a
			ld   a,h
			ld   h,b
			ld   h,b
			ld   a,h
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			ld   a,(hl)
			ld   a,(hl)
			ld   b,$0E
			inc  c
			inc  e
			jr   $0361
			jr   nc,$035B
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			ld   a,$06
			ld   b,$3E
			inc  a
			jr   $037D
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,h
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,h
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			ld   a,h
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			ld   a,h
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			ld   a,h
			ld   a,(hl)
			ld   a,(hl)
			ld   h,b
			ld   h,b
			ld   a,h
			ld   a,h
			ld   h,b
			ld   h,b
			ld   a,(hl)
			ld   a,(hl)
			ld   a,(hl)
			ld   a,(hl)
			ld   h,b
			ld   h,b
			ld   a,h
			ld   a,h
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,b
			inc  a
			ld   a,(hl)
			ld   h,b
			ld   h,b
			ld   h,b
			ld   l,(hl)
			ld   l,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			inc  a
			inc  a
			jr   $03AB
			jr   $03AD
			jr   $03AF
			inc  a
			inc  a
			ld   b,$06
			ld   b,$06
			ld   b,$06
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			ld   h,(hl)
			ld   h,(hl)
			ld   l,(hl)
			ld   a,h
			ld   a,b
			ld   a,b
			ld   l,h
			ld   l,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,b
			ld   a,(hl)
			ld   a,(hl)
			jp   $E7E7
			in   a,($DB)
			jp   $C3C3
			jp   $66C3
			ld   h,(hl)
			halt
			ld   a,(hl)
			ld   a,(hl)
			ld   l,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			ld   a,h
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			ld   a,h
			ld   h,b
			ld   h,b
			ld   h,b
			ld   h,b
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   l,(hl)
			ld   h,h
			ld   a,($7E7C)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			ld   a,h
			ld   l,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			inc  a
			ld   a,(hl)
			ld   h,(hl)
			ld   h,b
			ld   a,h
			ld   a,$06
			ld   h,(hl)
			ld   a,(hl)
			inc  a
			ld   a,(hl)
			ld   a,(hl)
			jr   $0419
			jr   $041B
			jr   $041D
			jr   $041F
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   h,(hl)
			ld   a,(hl)
			inc  a
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
			rst  20
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
			rst  38
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
			rst  38
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
			rst  38
			rst  38
			rst  38
			rst  38
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
			.DB   $ed,$06
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
			rst  00
			inc  b
			rst  00
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
			.DB   $ed,$08
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
			.DB   $dd,$08
;============================================================
L0941: 			pop  hl			;E1
L0942: 			ex   af,af'		;08
L0943: 			add  hl,hl		;29
L0944: 			add  hl,bc		;09
L0945: 			inc  sp			;33
L0946: 			add  hl,bc		;09
L0947: 			dec  d			;15
L0948: 			add  hl,bc		;09
L0949: 			rrca			;0F
L094A: 			add  hl,bc		;09
L094B: 			add  hl,sp		;39
L094C: 			add  hl,bc		;09
L094D: 			rra			;1F
L094E: 			add  hl,bc		;09
L094F: 			pop  af			;F1
L0950: 			ex   af,af'		;08
L0951: 			ei			;FB
L0952: 			ex   af,af'		;08
L0953: 			ld   bc,$0509		;01 09 05
L0956: 			add  hl,bc		;09
L0957: 			add  hl,bc		;09
L0958: 			add  hl,bc		;09
L0959: 			ld   d,$00		;16 00
L095B: 			dec  d			;15
L095C: 			nop			;00
L095D: 			ld   de,$1200		;11 00 12
L0960: 			nop			;00
L0961: 			inc  de			;13
L0962: 			nop			;00
L0963: 			inc  b			;04
L0964: 			inc  bc			;03
L0965: 			ld   h,h		;64
L0966: 			add  hl,bc		;09
;============================================================
L0967: 			ld   hl,($7C1C)
L096A: 			ld   a,(hl)
L096B: 			ret
;============================================================
L096C: 			ld   hl,($7C1C)
L096F: 			inc  hl
L0970: 			ld   ($7C1C),hl
L0973: 			ret
;============================================================
L0974: 			call $0967
L0977: 			call $096C
L097A: 			ld   h,$00
L097C: 			ld   l,a
L097D: 			ret
;============================================================
L097E: 			ld   hl,($7C1C)
L0981: 			ld   e,(hl)
L0982: 			inc  hl
L0983: 			ld   d,(hl)
L0984: 			ld   ($7C1C),de
L0988: 			ret
;============================================================
L0989: 			push bc
L098A: 			ld   a,($7C23)
L098D: 			or   a
L098E: 			jp   z,$0998
L0991: 			dec  a
L0992: 			ld   ($7C23),a
L0995: 			jp   nz,$0A12
L0998: 			call $0967
L099B: 			call $096C
L099E: 			or   a
L099F: 			jp   nz,$09C0
L09A2: 			call $0974
L09A5: 			push hl
L09A6: 			call $0974
L09A9: 			push hl
L09AA: 			call $0974
L09AD: 			push hl
L09AE: 			ld   bc,$09B4
L09B1: 			jp   $0275
L09B4: 			inc  c
L09B5: 			nop
L09B6: 			pop  hl
L09B7: 			pop  de
L09B8: 			add  hl,de
L09B9: 			pop  bc
L09BA: 			out  (c),l
L09BC: 			xor  a
L09BD: 			jp   $0A12
L09C0: 			dec  a
L09C1: 			jp   nz,$09D2
L09C4: 			call $0967
L09C7: 			ld   ($7C23),a
L09CA: 			call $096C
L09CD: 			or   $01
L09CF: 			jp   $0A12
L09D2: 			dec  a
L09D3: 			jp   nz,$09DD
L09D6: 			call $097E
L09D9: 			xor  a
L09DA: 			jp   $0A12
L09DD: 			dec  a
L09DE: 			jp   nz,$09E9
L09E1: 			call $097E
L09E4: 			or   $01
L09E6: 			jp   $0A12
L09E9: 			dec  a
L09EA: 			jp   nz,$0A06
L09ED: 			ld   a,($7C20)
L09F0: 			dec  a
L09F1: 			ld   ($7C20),a
L09F4: 			jp   z,$0A00
L09F7: 			ld   hl,($7C21)
L09FA: 			ld   ($7C1C),hl
L09FD: 			jp   $0A12
L0A00: 			ld   ($7C24),a
L0A03: 			jp   $0A12
L0A06: 			add  a,$04
L0A08: 			ld   c,a
L0A09: 			call $0967
L0A0C: 			out  (c),a
L0A0E: 			call $096C
L0A11: 			xor  a
L0A12: 			or   a
L0A13: 			jp   z,$0998
L0A16: 			pop  bc
L0A17: 			ret
;============================================================
L0A18: 			ld   ($7C1C),hl
L0A1B: 			ld   ($7C21),hl
L0A1E: 			ret
;============================================================
L0A1F: 			ld   a,($7C19)
L0A22: 			and  a
L0A23: 			ret  nz
L0A24: 			call $0A18
L0A27: 			xor  a
L0A28: 			ld   ($7C23),a
L0A2B: 			inc  a
L0A2C: 			ld   ($7C20),a
L0A2F: 			ret
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

L0A30: 			pop  hl
L0A31: 			call $0A1F
L0A34: 			jp   (iy)

;******************************************************************************
; Opcode:	$A1
;
; Description:	???
;
;******************************************************************************


L0A36: 			ld   hl,$0959
L0A39: 			call $0A18
L0A3C: 			ld   a,$01
L0A3E: 			ld   ($7C23),a
L0A41: 			ld   ($7C20),a
L0A44: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0A46: 			djnz $0A6B
L0A48: 			ld   d,$AB
L0A4A: 			dec  d
L0A4B: 			dec  bc
L0A4C: 			inc  d
L0A4D: 			nop
L0A4E: 			inc  de
L0A4F: 			ld   c,d
L0A50: 			ld   bc,$1201
L0A53: 			ld   b,(hl)
L0A54: 			ld   de,$135E
L0A57: 			ld   a,$01
L0A59: 			ld   bc,$4212
L0A5C: 			inc  de
L0A5D: 			scf
L0A5E: 			ld   bc,$1201
L0A61: 			inc  (hl)
L0A62: 			inc  de
L0A63: 			ld   l,$01
L0A65: 			ld   bc,$2C12
L0A68: 			inc  de
L0A69: 			daa
L0A6A: 			ld   bc,$1201
L0A6D: 			dec  h
L0A6E: 			inc  de
L0A6F: 			ld   ($0101),hl
L0A72: 			ld   (de),a
L0A73: 			jr   nz,$0A88
L0A75: 			ld   a,$01
L0A77: 			ld   bc,$1D12
L0A7A: 			inc  de
L0A7B: 			jr   $0A7E
L0A7D: 			ex   af,af'
L0A7E: 			ld   (de),a
L0A7F: 			rla
L0A80: 			ld   d,$00
L0A82: 			dec  d
L0A83: 			nop
L0A84: 			ld   de,$1200
L0A87: 			nop
L0A88: 			inc  de
L0A89: 			nop
L0A8A: 			inc  b
L0A8B: 			inc  bc
L0A8C: 			adc  a,e
L0A8D: 			ld   a,(bc)
L0A8E: 			djnz $0AB8
L0A90: 			ld   d,$AB
L0A92: 			dec  d
L0A93: 			ld   a,(bc)
L0A94: 			inc  d
L0A95: 			nop
L0A96: 			ld   de,$1254
L0A99: 			ld   b,(hl)
L0A9A: 			inc  de
L0A9B: 			ld   a,$01
L0A9D: 			ld   (bc),a
L0A9E: 			ld   de,$125E
L0AA1: 			ld   c,d
L0AA2: 			inc  de
L0AA3: 			ld   a,$01
L0AA5: 			ld   (bc),a
L0AA6: 			ld   de,$1264
L0AA9: 			ld   d,h
L0AAA: 			inc  de
L0AAB: 			ld   a,$01
L0AAD: 			ld   (bc),a
L0AAE: 			ld   de,$1270
L0AB1: 			ld   e,(hl)
L0AB2: 			inc  de
L0AB3: 			ld   a,$01
L0AB5: 			dec  b
L0AB6: 			ld   d,$00
L0AB8: 			dec  d
L0AB9: 			nop
L0ABA: 			ld   de,$1200
L0ABD: 			nop
L0ABE: 			inc  de
L0ABF: 			nop
L0AC0: 			inc  b
L0AC1: 			inc  bc
L0AC2: 			pop  bc
L0AC3: 			ld   a,(bc)
L0AC4: 			djnz $0AE9
L0AC6: 			ld   d,$FF
L0AC8: 			dec  d
L0AC9: 			cpl
L0ACA: 			rla
L0ACB: 			ret  pe
L0ACC: 			inc  d
L0ACD: 			ld   d,d
L0ACE: 			ld   de,$124A
L0AD1: 			ld   d,h
L0AD2: 			inc  de
L0AD3: 			ld   e,(hl)
L0AD4: 			ld   bc,$1612
L0AD7: 			nop
L0AD8: 			dec  d
L0AD9: 			nop
L0ADA: 			ld   de,$1200
L0ADD: 			nop
L0ADE: 			inc  de
L0ADF: 			nop
L0AE0: 			inc  b
L0AE1: 			inc  bc
L0AE2: 			pop  hl
L0AE3: 			ld   a,(bc)
L0AE4: 			inc  d
L0AE5: 			nop
L0AE6: 			djnz $0B2E
L0AE8: 			ld   d,$0F
L0AEA: 			dec  d
L0AEB: 			nop
L0AEC: 			ld   de,$0137
L0AEF: 			inc  b
L0AF0: 			ld   de,$013E
L0AF3: 			dec  b
L0AF4: 			ld   de,$0146
L0AF7: 			dec  b
L0AF8: 			ld   de,$014A
L0AFB: 			ld   b,$11
L0AFD: 			ld   d,h
L0AFE: 			ld   bc,$1106
L0B01: 			ld   e,(hl)
L0B02: 			ld   bc,$1107
L0B05: 			ld   h,h
L0B06: 			ld   bc,$1107
L0B09: 			ld   (hl),b
L0B0A: 			ld   bc,$1108
L0B0D: 			ld   a,(hl)
L0B0E: 			ld   bc,$1108
L0B11: 			adc  a,l
L0B12: 			ld   bc,$1109
L0B15: 			sub  (hl)
L0B16: 			ld   bc,$110A
L0B19: 			xor  b
L0B1A: 			ld   bc,$160B
L0B1D: 			nop
L0B1E: 			dec  d
L0B1F: 			nop
L0B20: 			ld   de,$1200
L0B23: 			nop
L0B24: 			inc  de
L0B25: 			nop
L0B26: 			inc  b
L0B27: 			inc  bc
L0B28: 			daa
L0B29: 			dec  bc
L0B2A: 			djnz $0B61
L0B2C: 			rla
L0B2D: 			inc  sp
L0B2E: 			inc  d
L0B2F: 			nop
L0B30: 			ld   d,$AA
L0B32: 			dec  d
L0B33: 			ld   a,($2E11)
L0B36: 			ld   (de),a
L0B37: 			ld   b,b
L0B38: 			inc  de
L0B39: 			ld   d,b
L0B3A: 			ld   bc,$117C
L0B3D: 			cpl
L0B3E: 			ld   (de),a
L0B3F: 			ld   b,d
L0B40: 			inc  de
L0B41: 			ld   d,e
L0B42: 			ld   bc,$1604
L0B45: 			adc  a,b
L0B46: 			dec  d
L0B47: 			jr   c,$0B5A
L0B49: 			jr   nc,$0B5D
L0B4B: 			ld   b,h
L0B4C: 			inc  de
L0B4D: 			ld   d,(hl)
L0B4E: 			ld   bc,$1604
L0B51: 			ld   h,(hl)
L0B52: 			dec  d
L0B53: 			ld   (hl),$11
L0B55: 			ld   sp,$4612
L0B58: 			inc  de
L0B59: 			ld   e,c
L0B5A: 			ld   bc,$1604
L0B5D: 			ld   b,h
L0B5E: 			dec  d
L0B5F: 			inc  (hl)
L0B60: 			ld   bc,$1605
L0B63: 			ld   ($3215),hl
L0B66: 			ld   bc,$1607
L0B69: 			nop
L0B6A: 			dec  d
L0B6B: 			nop
L0B6C: 			ld   de,$1200
L0B6F: 			nop
L0B70: 			inc  de
L0B71: 			nop
L0B72: 			inc  b
L0B73: 			inc  bc
L0B74: 			ld   (hl),e
L0B75: 			dec  bc
L0B76: 			djnz $0BC8
L0B78: 			rla
L0B79: 			dec  a
L0B7A: 			ld   d,$FF
L0B7C: 			dec  d
L0B7D: 			rra
L0B7E: 			ld   (de),a
L0B7F: 			ld   de,$1211
L0B82: 			inc  de
L0B83: 			rrca
L0B84: 			ld   bc,$1606
L0B87: 			nop
L0B88: 			dec  d
L0B89: 			nop
L0B8A: 			ld   de,$1200
L0B8D: 			nop
L0B8E: 			inc  de
L0B8F: 			nop
L0B90: 			inc  b
L0B91: 			inc  bc
L0B92: 			sub  c
L0B93: 			dec  bc
L0B94: 			djnz $0BDE
L0B96: 			rla
L0B97: 			jr   c,$0B9B
L0B99: 			ld   a,d
L0B9A: 			dec  bc
L0B9B: 			djnz $0BB9
L0B9D: 			rla
L0B9E: 			nop
L0B9F: 			ld   d,$EF
L0BA1: 			dec  d
L0BA2: 			rrca
L0BA3: 			inc  d
L0BA4: 			nop
L0BA5: 			ld   de,$125E
L0BA8: 			sub  (hl)
L0BA9: 			inc  de
L0BAA: 			cp   l
L0BAB: 			ld   bc,$1114
L0BAE: 			ld   l,$12
L0BB0: 			ld   a,(hl)
L0BB1: 			inc  de
L0BB2: 			sub  (hl)
L0BB3: 			ld   bc,$110A
L0BB6: 			scf
L0BB7: 			ld   (de),a
L0BB8: 			adc  a,l
L0BB9: 			inc  de
L0BBA: 			cp   l
L0BBB: 			ld   bc,$110A
L0BBE: 			ld   a,$12
L0BC0: 			sub  (hl)
L0BC1: 			inc  de
L0BC2: 			cp   l
L0BC3: 			ld   bc,$110A
L0BC6: 			ld   c,d
L0BC7: 			ld   (de),a
L0BC8: 			ld   a,(hl)
L0BC9: 			inc  de
L0BCA: 			cp   l
L0BCB: 			ld   bc,$110A
L0BCE: 			ld   a,$12
L0BD0: 			xor  b
L0BD1: 			inc  de
L0BD2: 			ret  z
L0BD3: 			ld   bc,$111E
L0BD6: 			ld   d,h
L0BD7: 			ld   (de),a
L0BD8: 			adc  a,l
L0BD9: 			inc  de
L0BDA: 			.DB   $fd,$01
L0BDC: 			ld   e,$11
L0BDE: 			ld   e,(hl)
L0BDF: 			ld   (de),a
L0BE0: 			sub  (hl)
L0BE1: 			inc  de
L0BE2: 			cp   l
L0BE3: 			ld   bc,$1114
L0BE6: 			ld   l,$12
L0BE8: 			ld   a,(hl)
L0BE9: 			inc  de
L0BEA: 			sub  (hl)
L0BEB: 			ld   bc,$110A
L0BEE: 			scf
L0BEF: 			ld   (de),a
L0BF0: 			ld   e,(hl)
L0BF1: 			inc  de
L0BF2: 			adc  a,l
L0BF3: 			ld   bc,$110A
L0BF6: 			ld   a,$12
L0BF8: 			ld   e,(hl)
L0BF9: 			inc  de
L0BFA: 			sub  (hl)
L0BFB: 			ld   bc,$110A
L0BFE: 			ld   c,d
L0BFF: 			ld   (de),a
L0C00: 			ld   a,(hl)
L0C01: 			inc  de
L0C02: 			cp   l
L0C03: 			ld   bc,$110A
L0C06: 			ld   a,$12
L0C08: 			xor  b
L0C09: 			inc  de
L0C0A: 			ret  z
L0C0B: 			ld   bc,$113C
L0C0E: 			ld   l,$12
L0C10: 			ld   c,d
L0C11: 			inc  de
L0C12: 			cp   l
L0C13: 			ld   bc,$023C
L0C16: 			ld   hl,($160B)
L0C19: 			xor  e
L0C1A: 			dec  d
L0C1B: 			dec  bc
L0C1C: 			nop
L0C1D: 			ld   de,$905E
L0C20: 			nop
L0C21: 			inc  de
L0C22: 			ld   e,(hl)
L0C23: 			add  a,b
L0C24: 			nop
L0C25: 			ld   (de),a
L0C26: 			ld   e,(hl)
L0C27: 			ld   (hl),b
L0C28: 			djnz $0C3A
L0C2A: 			ld   bc,$1001
L0C2D: 			ld   c,$01
L0C2F: 			ld   bc,$0C10
L0C32: 			ld   bc,$1001
L0C35: 			ld   a,(bc)
L0C36: 			ld   bc,$1001
L0C39: 			ex   af,af'
L0C3A: 			ld   bc,$1001
L0C3D: 			ld   b,$01
L0C3F: 			ld   bc,$0410
L0C42: 			ld   bc,$1001
L0C45: 			ld   (bc),a
L0C46: 			ld   bc,$0201
L0C49: 			ld   hl,($160C)
L0C4C: 			rst  38
L0C4D: 			dec  d
L0C4E: 			rra
L0C4F: 			djnz $0C53
L0C51: 			rla
L0C52: 			ex   af,af'
L0C53: 			inc  de
L0C54: 			ld   d,h
L0C55: 			ld   (de),a
L0C56: 			ld   b,d
L0C57: 			ld   de,$013B
L0C5A: 			ld   b,$13
L0C5C: 			ld   e,(hl)
L0C5D: 			ld   de,$014A
L0C60: 			ld   b,$13
L0C62: 			ld   h,h
L0C63: 			ld   (de),a
L0C64: 			ld   d,h
L0C65: 			ld   bc,$1606
L0C68: 			.DB   $dd,$15
L0C6A: 			ld   a,(de)
L0C6B: 			inc  de
L0C6C: 			ld   (hl),b
L0C6D: 			ld   de,$015E
L0C70: 			ld   b,$16
L0C72: 			xor  d
L0C73: 			dec  d
L0C74: 			rla
L0C75: 			inc  de
L0C76: 			ld   a,(hl)
L0C77: 			ld   (de),a
L0C78: 			ld   h,h
L0C79: 			ld   bc,$0206
L0C7C: 			jr   $0C8A
L0C7E: 			djnz $0CB4
L0C80: 			ld   d,$AB
L0C82: 			dec  d
L0C83: 			dec  bc
L0C84: 			inc  d
L0C85: 			nop
L0C86: 			ld   de,$123E
L0C89: 			ld   c,d
L0C8A: 			inc  de
L0C8B: 			ld   e,(hl)
L0C8C: 			ld   bc,$1105
L0C8F: 			ld   sp,$2912
L0C92: 			inc  de
L0C93: 			ld   a,$01
L0C95: 			dec  b
L0C96: 			ld   de,$122E
L0C99: 			ld   d,h
L0C9A: 			inc  de
L0C9B: 			scf
L0C9C: 			ld   bc,$1105
L0C9F: 			rra
L0CA0: 			ld   (de),a
L0CA1: 			add  hl,hl
L0CA2: 			inc  de
L0CA3: 			ld   sp,$1201
L0CA6: 			ld   (bc),a
L0CA7: 			ld   hl,($100B)
L0CAA: 			inc  hl
L0CAB: 			ld   d,$AB
L0CAD: 			dec  d
L0CAE: 			dec  bc
L0CAF: 			inc  d
L0CB0: 			nop
L0CB1: 			ld   de,$1246
L0CB4: 			ld   d,h
L0CB5: 			inc  de
L0CB6: 			ld   a,$01
L0CB8: 			dec  b
L0CB9: 			ld   de,$1254
L0CBC: 			ld   h,h
L0CBD: 			inc  de
L0CBE: 			ld   c,d
L0CBF: 			ld   bc,$1105
L0CC2: 			adc  a,l
L0CC3: 			ld   (de),a
L0CC4: 			ld   (hl),a
L0CC5: 			inc  de
L0CC6: 			ld   h,h
L0CC7: 			ld   bc,$1105
L0CCA: 			ret  z
L0CCB: 			ld   (de),a
L0CCC: 			adc  a,l
L0CCD: 			inc  de
L0CCE: 			sub  (hl)
L0CCF: 			ld   bc,$1105
L0CD2: 			ld   (hl),b
L0CD3: 			ld   (de),a
L0CD4: 			adc  a,l
L0CD5: 			inc  de
L0CD6: 			.DB   $fd,$01
L0CD8: 			ld   (de),a
L0CD9: 			ld   d,$00
L0CDB: 			dec  d
L0CDC: 			nop
L0CDD: 			ld   de,$1200
L0CE0: 			nop
L0CE1: 			inc  de
L0CE2: 			nop
L0CE3: 			inc  b
L0CE4: 			inc  bc
L0CE5: 			call po,$CF0C
L0CE8: 			dec  c
L0CE9: 			ld   c,$2A
L0CEB: 			dec  bc
L0CEC: 			rrca
L0CED: 			inc  bc
L0CEE: 			ld   a,h
L0CEF: 			ld   h,$00
L0CF1: 			ld   l,a
L0CF2: 			add  hl,hl
L0CF3: 			add  hl,hl
L0CF4: 			add  hl,hl
L0CF5: 			add  hl,hl
L0CF6: 			push de
L0CF7: 			ld   e,l
L0CF8: 			ld   d,h
L0CF9: 			add  hl,hl
L0CFA: 			add  hl,hl
L0CFB: 			add  hl,de
L0CFC: 			ex   de,hl
L0CFD: 			pop  hl
L0CFE: 			ld   a,l
L0CFF: 			ld   l,h
L0D00: 			ld   h,$00
L0D02: 			add  hl,de
L0D03: 			rlca
L0D04: 			rlca
L0D05: 			and  $03
L0D07: 			ret
L0D08: 			ld   a,($7C0A)
L0D0B: 			and  a
L0D0C: 			jr   z,$0D2F
L0D0E: 			ld   a,$60
L0D10: 			sub  h
L0D11: 			add  a,$60
L0D13: 			ld   h,a
L0D14: 			ld   a,$27
L0D16: 			sub  d
L0D17: 			add  a,$27
L0D19: 			inc  a
L0D1A: 			ld   d,a
L0D1B: 			ld   a,c
L0D1C: 			or   $80
L0D1E: 			xor  $40
L0D20: 			ld   c,a
L0D21: 			call $0CEE
L0D24: 			bit  6,c
L0D26: 			jr   nz,$0D2D
L0D28: 			neg
L0D2A: 			jr   nz,$0D2D
L0D2C: 			inc  hl
L0D2D: 			jr   $0D3B
L0D2F: 			call $0CEE
L0D32: 			bit  6,c
L0D34: 			jr   z,$0D3B
L0D36: 			neg
L0D38: 			jr   nz,$0D3B
L0D3A: 			dec  hl
L0D3B: 			and  $03
L0D3D: 			ld   e,a
L0D3E: 			ld   a,c
L0D3F: 			and  $FC
L0D41: 			or   e
L0D42: 			ld   c,a
L0D43: 			ret
L0D44: 			push hl
L0D45: 			ex   de,hl
L0D46: 			ld   d,(iy+$00)
L0D49: 			ld   e,$00
L0D4B: 			sra  d
L0D4D: 			rr   e
L0D4F: 			sra  d
L0D51: 			rr   e
L0D53: 			bit  6,c
L0D55: 			jr   z,$0D5A
L0D57: 			add  hl,de
L0D58: 			jr   $0D5D
L0D5A: 			or   a
L0D5B: 			sbc  hl,de
L0D5D: 			ex   (sp),hl
L0D5E: 			ld   d,(iy+$01)
L0D61: 			ld   e,$00
L0D63: 			bit  7,c
L0D65: 			jr   z,$0D6A
L0D67: 			add  hl,de
L0D68: 			jr   $0D6E
L0D6A: 			scf
L0D6B: 			ccf
L0D6C: 			sbc  hl,de
L0D6E: 			pop  de
L0D6F: 			inc  iy
L0D71: 			inc  iy
L0D73: 			ret
L0D74: 			push bc
L0D75: 			ld   a,($7C1B)
L0D78: 			and  a
L0D79: 			ld   a,b
L0D7A: 			jr   nz,$0D82
L0D7C: 			cp   $08
L0D7E: 			jr   nz,$0D82
L0D80: 			ld   a,$0C
L0D82: 			out  ($19),a
L0D84: 			ld   a,c
L0D85: 			out  ($0C),a
L0D87: 			push iy
L0D89: 			pop  bc
L0D8A: 			bit  7,a
L0D8C: 			jr   nz,$0DBE
L0D8E: 			bit  6,a
L0D90: 			jr   z,$0DA8
L0D92: 			push de
L0D93: 			push hl
L0D94: 			ld   a,(bc)
L0D95: 			ld   (hl),a
L0D96: 			dec  hl
L0D97: 			ld   (hl),a
L0D98: 			dec  hl
L0D99: 			inc  bc
L0D9A: 			dec  e
L0D9B: 			jr   nz,$0D94
L0D9D: 			pop  hl
L0D9E: 			ld   de,$0050
L0DA1: 			add  hl,de
L0DA2: 			pop  de
L0DA3: 			dec  d
L0DA4: 			jr   nz,$0D92
L0DA6: 			jr   $0DBC
L0DA8: 			push de
L0DA9: 			push hl
L0DAA: 			ld   a,(bc)
L0DAB: 			ld   (hl),a
L0DAC: 			inc  hl
L0DAD: 			ld   (hl),a
L0DAE: 			inc  hl
L0DAF: 			inc  bc
L0DB0: 			dec  e
L0DB1: 			jr   nz,$0DAA
L0DB3: 			pop  hl
L0DB4: 			ld   de,$0050
L0DB7: 			add  hl,de
L0DB8: 			pop  de
L0DB9: 			dec  d
L0DBA: 			jr   nz,$0DA8
L0DBC: 			jr   $0DF2
L0DBE: 			bit  6,a
L0DC0: 			jr   z,$0DDB
L0DC2: 			push de
L0DC3: 			push hl
L0DC4: 			ld   a,(bc)
L0DC5: 			ld   (hl),a
L0DC6: 			dec  hl
L0DC7: 			ld   (hl),a
L0DC8: 			dec  hl
L0DC9: 			inc  bc
L0DCA: 			dec  e
L0DCB: 			jr   nz,$0DC4
L0DCD: 			pop  hl
L0DCE: 			ld   de,$0050
L0DD1: 			scf
L0DD2: 			ccf
L0DD3: 			sbc  hl,de
L0DD5: 			pop  de
L0DD6: 			dec  d
L0DD7: 			jr   nz,$0DC2
L0DD9: 			jr   $0DF2
L0DDB: 			push de
L0DDC: 			push hl
L0DDD: 			ld   a,(bc)
L0DDE: 			ld   (hl),a
L0DDF: 			inc  hl
L0DE0: 			ld   (hl),a
L0DE1: 			inc  hl
L0DE2: 			inc  bc
L0DE3: 			dec  e
L0DE4: 			jr   nz,$0DDD
L0DE6: 			pop  hl
L0DE7: 			ld   de,$0050
L0DEA: 			scf
L0DEB: 			ccf
L0DEC: 			sbc  hl,de
L0DEE: 			pop  de
L0DEF: 			dec  d
L0DF0: 			jr   nz,$0DDB
L0DF2: 			pop  bc
L0DF3: 			ret
L0DF4: 			ld   e,(iy+$00)
L0DF7: 			inc  iy
L0DF9: 			ld   d,(iy+$00)
L0DFC: 			inc  iy
L0DFE: 			jp   $0D74
L0E01: 			push iy
L0E03: 			pop  hl
L0E04: 			exx
L0E05: 			pop  bc
L0E06: 			pop  hl
L0E07: 			pop  iy
L0E09: 			pop  de
L0E0A: 			ex   (sp),hl
L0E0B: 			ex   de,hl
L0E0C: 			call $0D08
L0E0F: 			pop  de
L0E10: 			call $0D74
L0E13: 			exx
L0E14: 			push hl
L0E15: 			pop  iy
L0E17: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0E19: 			push iy
L0E1B: 			pop  hl
L0E1C: 			exx
L0E1D: 			pop  bc
L0E1E: 			pop  iy
L0E20: 			pop  hl
L0E21: 			pop  de
L0E22: 			call $0D44
L0E25: 			call $0D08
L0E28: 			call $0DF4
L0E2B: 			exx
L0E2C: 			push hl
L0E2D: 			pop  iy
L0E2F: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L0E31: 			push iy
L0E33: 			pop  hl
L0E34: 			exx
L0E35: 			pop  hl
L0E36: 			ld   a,l
L0E37: 			pop  bc
L0E38: 			cp   $41
L0E3A: 			jr   c,$0E40
L0E3C: 			sub  $36
L0E3E: 			jr   $0E4A
L0E40: 			cp   $30
L0E42: 			jr   c,$0E48
L0E44: 			sub  $2F
L0E46: 			jr   $0E4A
L0E48: 			sub  $20
L0E4A: 			ld   l,a
L0E4B: 			ld   h,$00
L0E4D: 			sla  l
L0E4F: 			rl   h
L0E51: 			ld   d,h
L0E52: 			ld   e,l
L0E53: 			sla  l
L0E55: 			rl   h
L0E57: 			sla  l
L0E59: 			rl   h
L0E5B: 			add  hl,de
L0E5C: 			ld   de,$02D1
L0E5F: 			add  hl,de
L0E60: 			push hl
L0E61: 			pop  iy
L0E63: 			pop  hl
L0E64: 			pop  de
L0E65: 			push de
L0E66: 			push hl
L0E67: 			push bc
L0E68: 			call $0D08
L0E6B: 			ld   de,$0A01
L0E6E: 			ld   a,$02
L0E70: 			push af
L0E71: 			call $0D74
L0E74: 			pop  af
L0E75: 			pop  bc
L0E76: 			pop  hl
L0E77: 			ex   (sp),hl
L0E78: 			ld   d,a
L0E79: 			ld   l,$00
L0E7B: 			add  hl,de
L0E7C: 			ex   (sp),hl
L0E7D: 			push hl
L0E7E: 			push bc
L0E7F: 			exx
L0E80: 			push hl
L0E81: 			pop  iy
L0E83: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$11
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



L0E85: 			rst  08
L0E86: 			rlca
L0E87: 			rlca
L0E88: 			rlca
L0E89: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L0E8A: 			rst  08
L0E8B: 			djnz $0E9E
L0E8D: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L0E8E: 			rst  08
L0E8F: 			ld   (de),a
L0E90: 			inc  de
L0E91: 			inc  d
L0E92: 			ld   bc,$1615
L0E95: 			rla
L0E96: 			djnz $0EB0
L0E98: 			ld   de,$CF03
L0E9B: 			add  hl,de
L0E9C: 			rrca
L0E9D: 			ld   a,(de)
L0E9E: 			inc  de
L0E9F: 			dec  de
L0EA0: 			nop
L0EA1: 			ld   b,b
L0EA2: 			ld   a,(de)
L0EA3: 			dec  de
L0EA4: 			nop
L0EA5: 			ld   b,b
L0EA6: 			inc  e
L0EA7: 			inc  de
L0EA8: 			dec  e
L0EA9: 			ld   e,$B8
L0EAB: 			ld   c,$19
L0EAD: 			jr   nc,$0EC3
L0EAF: 			ld   bc,$FF1B
L0EB2: 			cp   a
L0EB3: 			ld   a,(de)
L0EB4: 			ld   bc,$BB1F
L0EB7: 			ld   c,$07
L0EB9: 			add  hl,de
L0EBA: 			jr   nz,$0ECC
L0EBC: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L0EBD: 			rst  08
L0EBE: 			inc  de
L0EBF: 			inc  d
L0EC0: 			ld   bc,$1615
L0EC3: 			rla
L0EC4: 			jr   nz,$0EE7
L0EC6: 			ld   d,$17
L0EC8: 			ld   hl,$1118
L0ECB: 			inc  bc
L0ECC: 			ld   b,$08
L0ECE: 			ld   c,(ix+$00)
L0ED1: 			ld   d,(ix+$0c)
L0ED4: 			ld   e,(ix+$0b)
L0ED7: 			ld   h,(ix+$14)
L0EDA: 			ld   l,(ix+$13)
L0EDD: 			push hl
L0EDE: 			pop  iy
L0EE0: 			ld   h,(ix+$10)
L0EE3: 			ld   l,(ix+$0f)
L0EE6: 			call $0D44
L0EE9: 			call $0D08
L0EEC: 			ld   (ix+$17),h
L0EEF: 			ld   (ix+$16),l
L0EF2: 			call $0DF4
L0EF5: 			ld   (ix+$00),c
L0EF8: 			ret
L0EF9: 			ld   b,$08
L0EFB: 			ld   c,(ix+$00)
L0EFE: 			ld   h,(ix+$14)
L0F01: 			ld   l,(ix+$13)
L0F04: 			inc  hl
L0F05: 			inc  hl
L0F06: 			push hl
L0F07: 			pop  iy
L0F09: 			ld   h,(ix+$17)
L0F0C: 			ld   l,(ix+$16)
L0F0F: 			call $0DF4
L0F12: 			ld   a,($7C0A)
L0F15: 			and  a
L0F16: 			ret  z
L0F17: 			ld   a,c
L0F18: 			and  $7F
L0F1A: 			xor  $40
L0F1C: 			ld   (ix+$00),a
L0F1F: 			ret
L0F20: 			ex   af,af'
L0F21: 			add  hl,bc
L0F22: 			rlca
L0F23: 			dec  b
L0F24: 			jr   z,$0F2B
L0F26: 			djnz $0F28
L0F28: 			nop
L0F29: 			nop
L0F2A: 			nop
L0F2B: 			rlca
L0F2C: 			jr   z,$0F33
L0F2E: 			jr   nz,$0F30
L0F30: 			nop
L0F31: 			nop
L0F32: 			nop
L0F33: 			rlca
L0F34: 			ld   a,(bc)
L0F35: 			ld   b,$28
L0F37: 			inc  b
L0F38: 			nop
L0F39: 			nop
L0F3A: 			nop
L0F3B: 			nop
L0F3C: 			nop
L0F3D: 			inc  c
L0F3E: 			jr   z,$0F40
L0F40: 			ld   c,$60
L0F42: 			nop
L0F43: 			nop
L0F44: 			ld   (bc),a
L0F45: 			ld   (bc),a
L0F46: 			ld   l,b
L0F47: 			inc  bc
L0F48: 			nop
L0F49: 			nop
L0F4A: 			nop
L0F4B: 			nop
L0F4C: 			nop
L0F4D: 			inc  c
L0F4E: 			ld   l,b
L0F4F: 			nop
L0F50: 			ld   a,(bc)
L0F51: 			nop
L0F52: 			nop
L0F53: 			nop
L0F54: 			.DB   $fd,$03
L0F56: 			ld   l,b
L0F57: 			inc  bc
L0F58: 			nop
L0F59: 			nop
L0F5A: 			nop
L0F5B: 			nop
L0F5C: 			nop
L0F5D: 			inc  c
L0F5E: 			jr   z,$0F60
L0F60: 			dec  c
L0F61: 			ret  po
L0F62: 			rst  38
L0F63: 			nop
L0F64: 			inc  bc
L0F65: 			inc  bc
L0F66: 			jr   z,$0F6B
L0F68: 			nop
L0F69: 			nop
L0F6A: 			nop
L0F6B: 			nop
L0F6C: 			nop
L0F6D: 			inc  c
L0F6E: 			ld   l,b
L0F6F: 			nop
L0F70: 			ld   a,(bc)
L0F71: 			or   b
L0F72: 			nop
L0F73: 			nop
L0F74: 			cp   $04
L0F76: 			jr   z,$0F7B
L0F78: 			nop
L0F79: 			nop
L0F7A: 			nop
L0F7B: 			nop
L0F7C: 			nop
L0F7D: 			inc  c
L0F7E: 			ld   l,b
L0F7F: 			nop
L0F80: 			ld   (de),a
L0F81: 			nop
L0F82: 			nop
L0F83: 			nop
L0F84: 			rst  38
L0F85: 			jr   z,$0F8F
L0F87: 			nop
L0F88: 			nop
L0F89: 			nop
L0F8A: 			nop
L0F8B: 			nop
L0F8C: 			inc  c
L0F8D: 			jr   z,$0F8F
L0F8F: 			ld   (de),a
L0F90: 			nop
L0F91: 			nop
L0F92: 			nop
L0F93: 			ld   bc,$0828
L0F96: 			nop
L0F97: 			nop
L0F98: 			nop
L0F99: 			nop
L0F9A: 			nop
L0F9B: 			inc  c
L0F9C: 			jr   z,$0FA7
L0F9E: 			ld   (de),a
L0F9F: 			nop
L0FA0: 			nop
L0FA1: 			nop
L0FA2: 			nop
L0FA3: 			jr   z,$0FAD
L0FA5: 			nop
L0FA6: 			nop
L0FA7: 			nop
L0FA8: 			nop
L0FA9: 			nop
L0FAA: 			inc  c
L0FAB: 			jr   z,$0FAF
L0FAD: 			dec  b
L0FAE: 			nop
L0FAF: 			nop
L0FB0: 			nop
L0FB1: 			nop
L0FB2: 			ld   c,$68
L0FB4: 			ld   (bc),a
L0FB5: 			dec  b
L0FB6: 			nop
L0FB7: 			nop
L0FB8: 			nop
L0FB9: 			nop
L0FBA: 			ld   c,$28
L0FBC: 			nop
L0FBD: 			ld   d,$60
L0FBF: 			nop
L0FC0: 			jr   nz,$0FC4
L0FC2: 			jr   z,$0FC5
L0FC4: 			ld   (bc),a
L0FC5: 			ld   b,b
L0FC6: 			nop
L0FC7: 			nop
L0FC8: 			ld   bc,$0E0B
L0FCB: 			ld   l,b
L0FCC: 			nop
L0FCD: 			ld   (de),a
L0FCE: 			add  a,b
L0FCF: 			nop
L0FD0: 			djnz $0FD0
L0FD2: 			ld   l,b
L0FD3: 			ld   bc,$4002
L0FD6: 			nop
L0FD7: 			add  a,b
L0FD8: 			rst  38
L0FD9: 			dec  bc
L0FDA: 			ld   c,$68
L0FDC: 			ld   bc,$0012
L0FDF: 			nop
L0FE0: 			nop
L0FE1: 			rst  38
L0FE2: 			ld   l,b
L0FE3: 			nop
L0FE4: 			dec  b
L0FE5: 			nop
L0FE6: 			ld   bc,$0000
L0FE9: 			inc  b
L0FEA: 			jr   z,$0FEF
L0FEC: 			nop
L0FED: 			nop
L0FEE: 			nop
L0FEF: 			nop
L0FF0: 			nop
L0FF1: 			inc  c
L0FF2: 			ld   l,b
L0FF3: 			ld   bc,$400A
L0FF6: 			nop
L0FF7: 			ret  nc
L0FF8: 			rst  38
L0FF9: 			dec  bc
L0FFA: 			jr   z,$0FFD
L0FFC: 			ld   a,(bc)
L0FFD: 			ld   b,b
L0FFE: 			nop
L0FFF: 			add  a,b
L1000: 			nop
L1001: 			dec  bc
L1002: 			ld   l,b
L1003: 			nop
L1004: 			ld   (de),a
L1005: 			ld   b,b
L1006: 			nop
L1007: 			nop
L1008: 			rst  38
L1009: 			ld   c,$28
L100B: 			ld   bc,$C012
L100E: 			rst  38
L100F: 			add  a,b
L1010: 			nop
L1011: 			ld   l,b
L1012: 			nop
L1013: 			ld   c,$C0
L1015: 			nop
L1016: 			nop
L1017: 			cp   $04
L1019: 			jr   z,$101E
L101B: 			nop
L101C: 			nop
L101D: 			nop
L101E: 			nop
L101F: 			nop
L1020: 			inc  c
L1021: 			ld   l,b
L1022: 			ld   bc,$0010
L1025: 			nop
L1026: 			add  a,b
L1027: 			rst  38
L1028: 			ld   c,$68
L102A: 			ld   bc,$800C
L102D: 			nop
L102E: 			add  a,b
L102F: 			rst  38
L1030: 			dec  bc
L1031: 			jr   z,$1034
L1033: 			inc  c
L1034: 			add  a,b
L1035: 			nop
L1036: 			add  a,b
L1037: 			ld   bc,$280B
L103A: 			nop
L103B: 			inc  c
L103C: 			ret  nz
L103D: 			rst  38
L103E: 			nop
L103F: 			ld   bc,$680E
L1042: 			ld   bc,$A00B
L1045: 			nop
L1046: 			jr   nz,$1047
L1048: 			dec  bc
L1049: 			jr   z,$104C
L104B: 			inc  c
L104C: 			nop
L104D: 			nop
L104E: 			add  a,b
L104F: 			nop
L1050: 			dec  bc
L1051: 			jr   z,$1054
L1053: 			ld   (de),a
L1054: 			nop
L1055: 			nop
L1056: 			add  a,b
L1057: 			nop
L1058: 			ld   c,$68
L105A: 			ld   bc,$C012
L105D: 			rst  38
L105E: 			add  a,b
L105F: 			rst  38
L1060: 			jr   z,$1062
L1062: 			inc  de
L1063: 			sub  b
L1064: 			nop
L1065: 			nop
L1066: 			ld   (bc),a
L1067: 			ld   (bc),a
L1068: 			ld   l,b
L1069: 			inc  bc
L106A: 			nop
L106B: 			nop
L106C: 			nop
L106D: 			nop
L106E: 			nop
L106F: 			inc  c
L1070: 			ld   l,b
L1071: 			ld   bc,$300A
L1074: 			nop
L1075: 			ret  nz
L1076: 			rst  38
L1077: 			dec  c
L1078: 			jr   z,$107B
L107A: 			dec  bc
L107B: 			ret  nz
L107C: 			rst  38
L107D: 			ld   b,b
L107E: 			ld   bc,$280D
L1081: 			ld   bc,$0018
L1084: 			nop
L1085: 			nop
L1086: 			ld   bc,$280E
L1089: 			nop
L108A: 			dec  d
L108B: 			nop
L108C: 			nop
L108D: 			add  a,b
L108E: 			inc  b
L108F: 			ld   (bc),a
L1090: 			ld   l,b
L1091: 			inc  bc
L1092: 			nop
L1093: 			nop
L1094: 			nop
L1095: 			nop
L1096: 			nop
L1097: 			inc  c
L1098: 			ld   l,b
L1099: 			nop
L109A: 			djnz $101C
L109C: 			rst  38
L109D: 			ret  po
L109E: 			rst  38
L109F: 			ld   c,$28
L10A1: 			nop
L10A2: 			djnz $1024
L10A4: 			nop
L10A5: 			jr   nz,$10A7
L10A7: 			ld   c,$28
L10A9: 			ld   b,$50
L10AB: 			nop
L10AC: 			inc  bc
L10AD: 			nop
L10AE: 			nop
L10AF: 			jr   z,$10B7
L10B1: 			add  a,b
L10B2: 			nop
L10B3: 			ld   bc,$0000
L10B6: 			jr   z,$10BE
L10B8: 			dec  (hl)
L10B9: 			nop
L10BA: 			ld   bc,$0000
L10BD: 			jr   z,$10C5
L10BF: 			ld   d,b
L10C0: 			nop
L10C1: 			inc  bc
L10C2: 			nop
L10C3: 			nop
L10C4: 			jr   z,$10CC
L10C6: 			ld   (de),a
L10C7: 			nop
L10C8: 			inc  bc
L10C9: 			nop
L10CA: 			nop
L10CB: 			jr   z,$10D3
L10CD: 			ld   d,b
L10CE: 			nop
L10CF: 			ld   bc,$0000
L10D2: 			jr   z,$10DA
L10D4: 			ld   (de),a
L10D5: 			nop
L10D6: 			inc  bc
L10D7: 			nop
L10D8: 			nop
L10D9: 			jr   z,$10E1
L10DB: 			add  hl,bc
L10DC: 			nop
L10DD: 			ld   (bc),a
L10DE: 			nop
L10DF: 			ld   bc,$0628
L10E2: 			ld   d,b
L10E3: 			nop
L10E4: 			ld   (bc),a
L10E5: 			nop
L10E6: 			nop
L10E7: 			jr   z,$10EF
L10E9: 			ld   a,(de)
L10EA: 			nop
L10EB: 			ld   (bc),a
L10EC: 			ret  p
L10ED: 			rst  38
L10EE: 			jr   z,$10F6
L10F0: 			add  hl,bc
L10F1: 			nop
L10F2: 			ld   (bc),a
L10F3: 			nop
L10F4: 			rst  38
L10F5: 			jr   z,$10FD
L10F7: 			ld   d,b
L10F8: 			nop
L10F9: 			ld   (bc),a
L10FA: 			nop
L10FB: 			nop
L10FC: 			jr   z,$1104
L10FE: 			ld   a,(de)
L10FF: 			nop
L1100: 			ld   (bc),a
L1101: 			ret  po
L1102: 			rst  38
L1103: 			jr   z,$110B
L1105: 			add  hl,bc
L1106: 			nop
L1107: 			ld   (bc),a
L1108: 			ld   h,b
L1109: 			nop
L110A: 			jr   z,$1112
L110C: 			ld   d,b
L110D: 			nop
L110E: 			ld   (bc),a
L110F: 			nop
L1110: 			nop
L1111: 			ld   a,h
L1112: 			cpl
L1113: 			ld   h,a
L1114: 			ld   a,l
L1115: 			cpl
L1116: 			ld   l,a
L1117: 			inc  hl
L1118: 			ret
L1119: 			push hl
L111A: 			ex   de,hl
L111B: 			call $1111
L111E: 			ex   de,hl
L111F: 			pop  hl
L1120: 			ret
L1121: 			ld   a,(hl)
L1122: 			and  a
L1123: 			ret  z
L1124: 			dec  a
L1125: 			ld   (hl),a
L1126: 			and  a
L1127: 			jr   nz,$112C
L1129: 			inc  a
L112A: 			jr   $112D
L112C: 			xor  a
L112D: 			ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$30
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L112E: 			rst  08			; Bread crumb trail
L112F: 			ld   ($0323),hl		; ???

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1132: 			rst  08		; Put a pin on the map
L1133: 			dec  c
L1134: 			inc  hl
L1135: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1136: 			rst  08
L1137: 			dec  de
L1138: 			ld   c,e
L1139: 			ld   a,h
L113A: 			inc  h
L113B: 			ex   af,af'
L113C: 			add  hl,de
L113D: 			ld   de,$1914
L1140: 			add  a,c
L1141: 			inc  hl
L1142: 			add  hl,de
L1143: 			ld   e,$14
L1145: 			add  hl,de
L1146: 			inc  bc
L1147: 			inc  hl
L1148: 			inc  bc
L1149: 			ret
L114A: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L114C: 			push af
L114D: 			sla  a
L114F: 			add  a,l
L1150: 			ld   l,a
L1151: 			ld   a,$00
L1153: 			adc  a,h
L1154: 			ld   h,a
L1155: 			ld   e,(hl)
L1156: 			inc  hl
L1157: 			ld   d,(hl)
L1158: 			dec  hl
L1159: 			pop  af
L115A: 			ret
L115B: 			ld   a,$03
L115D: 			ld   ($7CF8),a
L1160: 			ld   a,$81
L1162: 			ld   ($7CEB),a
L1165: 			ret
L1166: 			ld   a,$03
L1168: 			ld   ($7D17),a
L116B: 			ld   a,$81
L116D: 			ld   ($7D0A),a
L1170: 			ret
L1171: 			ld   a,$03
L1173: 			ld   ($7D36),a
L1176: 			ld   a,$81
L1178: 			ld   ($7D29),a
L117B: 			ret
L117C: 			ld   ($7CF8),a
L117F: 			ld   ($7D17),a
L1182: 			ld   ($7D36),a
L1185: 			ld   ($7D55),a
L1188: 			ret
L1189: 			ld   a,$01
L118B: 			ld   ($7CD4),a
L118E: 			ld   ($7C3F),a
L1191: 			ret
L1192: 			bit  7,h
L1194: 			push af
L1195: 			call nz,$1111
L1198: 			sla  l
L119A: 			rl   h
L119C: 			sla  l
L119E: 			rl   h
L11A0: 			pop  af
L11A1: 			call nz,$1111
L11A4: 			ret
L11A5: 			ld   hl,$0000
L11A8: 			ld   ($7C77),hl
L11AB: 			ld   ($7C75),hl
L11AE: 			ld   hl,$0428
L11B1: 			ld   ($7C72),hl
L11B4: 			xor  a
L11B5: 			ld   ($7C47),a
L11B8: 			ret
L11B9: 			push af
L11BA: 			ld   a,$FF
L11BC: 			dec  a
L11BD: 			jr   nz,$11BC
L11BF: 			pop  af
L11C0: 			dec  a
L11C1: 			jr   nz,$11B9
L11C3: 			ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************
L11C4: 					rst  08		; Remember where we parked
L11C5: 		.DB $25			; EI
L11C6: 		.DB $19			; $00FF
L11C7: 		.DB $FF
L11C8: 		.DB $0D			; $0000
L11C9: 		.DB $15			;
L11CA: 		.DB $18, $1B
L11CC: 		.DB $11, $7C, $17
L11CF: 		.DB $08
L11D0: 		.DB $1E, $EC
L11D2: 		.DB $11, $22, $26
L11D5: 		.DB $1E, $E7
L11D7: 		.DB $11, $1B, $1A
L11DA: 		.DB $7C
L11DB: 		.DB $17
L11DC: 		.DB $1E, $E2
L11DE: 		.DB $11, $1F, $E4
L11E1: 		.DB $11, $07, $22
L11E4: 		.DB $1F
L11E5: 		.DB $E9
L11E6: 		.DB $11, $07, $22
L11E9: 		.DB $1F
L11EA: 		.DB $ED, $11
L11EC: 		.DB $07
L11ED: 		.DB $19
L11EE: 		.DB $50
L11EF: 		.DB $0D
L11F0: 		.DB $15
L11F1: 		.DB $18, $22
L11F3: 		.DB $27
L11F4: 		.DB $08
L11F5: 		.DB $28, $1E
L11F7: 		.DB $C6, $11
L11F9: 		.DB $07
L11FA: 		.DB $03
L11FB: 		.DB $21, $02, $7E
L11FE: 		.DB $3E, $03
L1200: 		.DB $11, $1F, $00
L1203: 		.DB $CB, $FE
L1205: 		.DB $19
L1206: 		.DB $3D
L1207: 		.DB $20, $FA
L1209: 		.DB $C9

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************
L120A: 			rst  08
L120B: 			dec  de
L120C: 			nop
L120D: 			ld   b,d
L120E: 			dec  de
L120F: 			nop
L1210: 			ld   a,d
L1211: 			dec  de
L1212: 			jr   z,$121C
L1214: 			add  hl,de
L1215: 			ld   c,b
L1216: 			add  hl,hl
L1217: 			dec  de
L1218: 			nop
L1219: 			ld   b,h
L121A: 			dec  de
L121B: 			nop
L121C: 			ld   a,a
L121D: 			dec  de
L121E: 			ld   e,h
L121F: 			inc  b
L1220: 			dec  de
L1221: 			ld   (bc),a
L1222: 			dec  b
L1223: 			dec  de
L1224: 			jr   z,$122E
L1226: 			ld   hl,($CF03)
L1229: 			dec  de
L122A: 			nop
L122B: 			rlca
L122C: 			dec  de
L122D: 			nop
L122E: 			ld   a,d
L122F: 			dec  de
L1230: 			jr   z,$123A
L1232: 			add  hl,de
L1233: 			ld   d,(hl)
L1234: 			add  hl,hl
L1235: 			dec  de
L1236: 			nop
L1237: 			add  hl,bc
L1238: 			dec  de
L1239: 			nop
L123A: 			ld   a,a
L123B: 			dec  de
L123C: 			ld   c,l
L123D: 			inc  b
L123E: 			dec  de
L123F: 			inc  bc
L1240: 			dec  b
L1241: 			dec  de
L1242: 			jr   z,$124C
L1244: 			ld   hl,($DD03)
L1247: 			push hl
L1248: 			ld   ix,$7E4E
L124C: 			call $0EF9
L124F: 			res  7,(ix+$11)
L1253: 			pop  ix
L1255: 			ld   hl,$04AC
L1258: 			ld   ($7E61),hl
L125B: 			ret
L125C: 			ld   hl,$7CB7
L125F: 			ld   a,($7CA6)
L1262: 			and  a
L1263: 			call z,$1121
L1266: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



L1268: 			rst  08
L1269: 			dec  hl
L126A: 			dec  de
L126B: 			dec  bc
L126C: 			ld   a,h
L126D: 			rla
L126E: 			ld   e,$75
L1270: 			ld   (de),a
L1271: 			inc  l
L1272: 			rra
L1273: 			halt
L1274: 			ld   (de),a
L1275: 			dec  l
L1276: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L1277: 			rst  08
L1278: 			dec  de
L1279: 			nop
L127A: 			inc  e
L127B: 			dec  de
L127C: 			nop
L127D: 			jr   nz,$129A
L127F: 			jr   z,$1289
L1281: 			ld   l,$0C
L1283: 			ld   b,e
L1284: 			ld   c,b
L1285: 			ld   b,c
L1286: 			ld   c,(hl)
L1287: 			ld   b,a
L1288: 			ld   b,l
L1289: 			jr   nz,$12DE
L128B: 			ld   c,c
L128C: 			ld   b,h
L128D: 			ld   b,l
L128E: 			ld   d,e
L128F: 			cpl
L1290: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L1291: 			rst  08
L1292: 			dec  c
L1293: 			dec  d
L1294: 			add  hl,de
L1295: 			rst  38
L1296: 			dec  c
L1297: 			dec  d
L1298: 			jr   $12B2
L129A: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L129B: 			rst  08
L129C: 			dec  de
L129D: 			xor  b
L129E: 			ld   a,h
L129F: 			ld   (bc),a
L12A0: 			dec  de
L12A1: 			or   c
L12A2: 			ld   a,h
L12A3: 			jr   nc,$12C0
L12A5: 			or   d
L12A6: 			ld   a,h
L12A7: 			jr   nc,$12AC

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L12A9: 			rst  08
L12AA: 			dec  de
L12AB: 			xor  b
L12AC: 			ld   a,h
L12AD: 			inc  h
L12AE: 			ld   sp,$DD03
L12B1: 			push hl
L12B2: 			push iy
L12B4: 			ld   hl,$7CB0
L12B7: 			ld   a,($7CB1)
L12BA: 			and  a
L12BB: 			ld   a,(hl)
L12BC: 			jr   z,$12D8
L12BE: 			and  a
L12BF: 			jr   nz,$12C7
L12C1: 			ld   (hl),$01
L12C3: 			ld   a,$28
L12C5: 			jr   $12CB
L12C7: 			ld   (hl),$00
L12C9: 			ld   a,$08
L12CB: 			ld   ($7CB2),a
L12CE: 			ld   bc,$12D4
L12D1: 			jp   $12A9
L12D4: 			ld   ($1800),a
L12D7: 			dec  c
L12D8: 			and  a
L12D9: 			jr   z,$12E5
L12DB: 			ld   (hl),$00
L12DD: 			ld   bc,$12E3
L12E0: 			jp   $12A9
L12E3: 			inc  sp
L12E4: 			nop
L12E5: 			pop  iy
L12E7: 			pop  ix
L12E9: 			ret
L12EA: 			push bc
L12EB: 			xor  a
L12EC: 			ld   ($7CB1),a
L12EF: 			call $12B0
L12F2: 			pop  bc
L12F3: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



L12F5: 			rst  08
L12F6: 			dec  de
L12F7: 			dec  de
L12F8: 			ld   a,h
L12F9: 			rla
L12FA: 			ld   e,$00
L12FC: 			inc  de
L12FD: 			rra
L12FE: 			djnz $1313
L1300: 			dec  de
L1301: 			ld   e,$7C
L1303: 			inc  (hl)
L1304: 			dec  de
L1305: 			ld   (hl),a
L1306: 			ld   (de),a
L1307: 			dec  (hl)
L1308: 			add  hl,de
L1309: 			dec  h
L130A: 			ld   (hl),$1B
L130C: 			ld   e,$7C
L130E: 			jr   nc,$1347
L1310: 			dec  de
L1311: 			djnz $138F
L1313: 			inc  (hl)
L1314: 			inc  bc
L1315: 			ex   af,af'
L1316: 			ld   b,(ix+$0c)
L1319: 			ld   c,(ix+$0b)
L131C: 			sbc  hl,bc
L131E: 			push af
L131F: 			call c,$1111
L1322: 			sla  l
L1324: 			rl   h
L1326: 			sla  l
L1328: 			rl   h
L132A: 			ex   de,hl
L132B: 			ld   b,(ix+$10)
L132E: 			ld   c,(ix+$0f)
L1331: 			sbc  hl,bc
L1333: 			push af
L1334: 			call c,$1111
L1337: 			ex   af,af'
L1338: 			push af
L1339: 			ex   af,af'
L133A: 			pop  af
L133B: 			inc  a
L133C: 			inc  a
L133D: 			cp   h
L133E: 			jr   c,$1360
L1340: 			cp   d
L1341: 			jr   c,$1360
L1343: 			xor  a
L1344: 			cp   h
L1345: 			jr   nz,$1396
L1347: 			cp   d
L1348: 			jr   nz,$1396
L134A: 			ld   hl,$0000
L134D: 			ld   de,$0000
L1350: 			pop  af
L1351: 			pop  af
L1352: 			ld   a,$FF
L1354: 			ld   ($7CBF),a
L1357: 			res  7,(ix+$11)
L135B: 			res  3,(ix+$11)
L135F: 			ret
L1360: 			bit  3,(ix+$11)
L1364: 			jr   z,$136F
L1366: 			pop  af
L1367: 			pop  af
L1368: 			ld   a,$05
L136A: 			ld   ($7CA5),a
L136D: 			jr   $13B6
L136F: 			ld   a,h
L1370: 			cp   d
L1371: 			push af
L1372: 			jr   nc,$1377
L1374: 			ex   de,hl
L1375: 			jr   $1381
L1377: 			jr   nz,$1381
L1379: 			ld   a,l
L137A: 			cp   e
L137B: 			jr   nc,$1381
L137D: 			ex   de,hl
L137E: 			pop  af
L137F: 			scf
L1380: 			push af
L1381: 			ex   af,af'
L1382: 			ld   b,$00
L1384: 			inc  b
L1385: 			srl  h
L1387: 			rr   l
L1389: 			cp   h
L138A: 			jr   c,$1384
L138C: 			srl  d
L138E: 			rr   e
L1390: 			djnz $138C
L1392: 			pop  af
L1393: 			jr   nc,$1396
L1395: 			ex   de,hl
L1396: 			pop  af
L1397: 			jr   nc,$139C
L1399: 			call $1111
L139C: 			pop  af
L139D: 			push af
L139E: 			jr   nc,$13A3
L13A0: 			call $1119
L13A3: 			pop  af
L13A4: 			jr   nc,$13AB
L13A6: 			ld   bc,$0068
L13A9: 			jr   $13AE
L13AB: 			ld   bc,$0028
L13AE: 			xor  a
L13AF: 			ld   ($7CBF),a
L13B2: 			set  3,(ix+$11)
L13B6: 			ret
L13B7: 			ld   h,(ix+$1a)
L13BA: 			ld   l,(ix+$19)
L13BD: 			ld   d,(ix+$1c)
L13C0: 			ld   e,(ix+$1b)
L13C3: 			ret
L13C4: 			di
L13C5: 			ld   a,($7C47)
L13C8: 			and  a
L13C9: 			ret  z
L13CA: 			ei
L13CB: 			ld   ($7C1E),a
L13CE: 			push ix
L13D0: 			ld   a,($7E68)
L13D3: 			cp   $1C
L13D5: 			jr   c,$13E7
L13D7: 			cp   $34
L13D9: 			jr   c,$13E1
L13DB: 			ld   ix,$7E2F
L13DF: 			jr   $13E5
L13E1: 			ld   ix,$7E10
L13E5: 			jr   $13EB
L13E7: 			ld   ix,$7DF1
L13EB: 			ld   ($7C99),ix
L13EF: 			ld   hl,($7E67)
L13F2: 			ld   de,($7E69)
L13F6: 			ld   a,$02
L13F8: 			res  3,(ix+$11)
L13FC: 			call $1315
L13FF: 			ld   ($7C77),de
L1403: 			ld   ($7C75),hl
L1406: 			ld   ($7C72),bc
L140A: 			call $11FB
L140D: 			xor  a
L140E: 			ld   ($7C1E),a
L1411: 			pop  ix
L1413: 			ret
L1414: 			ld   hl,$7C55
L1417: 			dec  (hl)
L1418: 			jr   z,$1421
L141A: 			ld   a,$FF
L141C: 			ld   ($7C53),a
L141F: 			jr   $142A
L1421: 			call $13C4
L1424: 			ei
L1425: 			ld   a,$01
L1427: 			ld   ($7C54),a
L142A: 			ret
L142B: 			nop
L142C: 			nop
L142D: 			nop
L142E: 			nop
L142F: 			add  a,b
L1430: 			jr   nz,$143A
L1432: 			ld   (bc),a
L1433: 			ret  nz
L1434: 			jr   nc,$1442
L1436: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$4A
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1437: 			rst  08
L1438: 			dec  c
L1439: 			ld   c,$33
L143B: 			inc  d
L143C: 			dec  de
L143D: 			ld   l,l
L143E: 			ld   a,(hl)
L143F: 			ld   (bc),a
L1440: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L1441: 			rst  08
L1442: 			dec  c
L1443: 			ld   c,$2B
L1445: 			inc  d
L1446: 			dec  de
L1447: 			ld   l,l
L1448: 			ld   a,(hl)
L1449: 			ld   (bc),a
L144A: 			inc  bc
L144B: 			ccf

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L144C: 			rst  08
L144D: 			di
L144E: 			call m,$0BCB
L1451: 			rrc  e
L1453: 			rrc  d
L1455: 			rrc  d
L1457: 			exx
L1458: 			jr   c,$1461
L145A: 			ld   hl,($7E79)
L145D: 			inc  hl
L145E: 			ld   ($7E79),hl
L1461: 			ld   hl,($7E75)
L1464: 			inc  hl
L1465: 			ld   ($7E75),hl
L1468: 			exx
L1469: 			jp   $1516
L146C: 			rlc  e
L146E: 			rlc  e
L1470: 			rlc  d
L1472: 			rlc  d
L1474: 			exx
L1475: 			jr   c,$147E
L1477: 			ld   hl,($7E79)
L147A: 			dec  hl
L147B: 			ld   ($7E79),hl
L147E: 			ld   hl,($7E75)
L1481: 			dec  hl
L1482: 			ld   ($7E75),hl
L1485: 			exx
L1486: 			jp   $1516
L1489: 			ld   hl,$7E73
L148C: 			inc  (hl)
L148D: 			push de
L148E: 			ld   de,$0050
L1491: 			ld   hl,($7E79)
L1494: 			add  hl,de
L1495: 			ld   ($7E79),hl
L1498: 			pop  de
L1499: 			ret
L149A: 			ld   hl,$7E73
L149D: 			dec  (hl)
L149E: 			push de
L149F: 			ld   de,$FFB0
L14A2: 			ld   hl,($7E79)
L14A5: 			add  hl,de
L14A6: 			ld   ($7E79),hl
L14A9: 			pop  de
L14AA: 			ret
L14AB: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L14AD: 			ld   de,($7E75)
L14B1: 			ld   hl,($7E6F)
L14B4: 			xor  a
L14B5: 			sbc  hl,de
L14B7: 			jr   c,$14BF
L14B9: 			ld   ix,$144F
L14BD: 			jr   $14CA
L14BF: 			ld   ix,$146C
L14C3: 			ex   de,hl
L14C4: 			xor  a
L14C5: 			ld   hl,$0000
L14C8: 			sbc  hl,de
L14CA: 			ld   de,($7E73)
L14CE: 			ld   a,($7E71)
L14D1: 			sub  e
L14D2: 			jr   c,$14DA
L14D4: 			ld   iy,$1489
L14D8: 			jr   $14E0
L14DA: 			ld   iy,$149A
L14DE: 			cpl
L14DF: 			inc  a
L14E0: 			exx
L14E1: 			ld   l,a
L14E2: 			ld   h,$00
L14E4: 			exx
L14E5: 			ld   e,l
L14E6: 			ld   d,h
L14E7: 			or   l
L14E8: 			ld   l,a
L14E9: 			or   h
L14EA: 			ret  z
L14EB: 			add  hl,hl
L14EC: 			jr   c,$14F6
L14EE: 			ex   de,hl
L14EF: 			add  hl,hl
L14F0: 			ex   de,hl
L14F1: 			exx
L14F2: 			add  hl,hl
L14F3: 			exx
L14F4: 			jr   $14EB
L14F6: 			push de
L14F7: 			exx
L14F8: 			push hl
L14F9: 			exx
L14FA: 			pop  bc
L14FB: 			ld   e,c
L14FC: 			ld   d,b
L14FD: 			exx
L14FE: 			ld   bc,($7E77)
L1502: 			ld   hl,($7E6D)
L1505: 			add  hl,bc
L1506: 			ld   e,(hl)
L1507: 			ld   hl,$144B
L150A: 			add  hl,bc
L150B: 			ld   d,(hl)
L150C: 			pop  hl
L150D: 			ld   b,h
L150E: 			ld   c,l
L150F: 			exx
L1510: 			exx
L1511: 			add  hl,bc
L1512: 			jr   nc,$1523
L1514: 			jp   (ix)
L1516: 			exx
L1517: 			ex   de,hl
L1518: 			add  hl,bc
L1519: 			ex   de,hl
L151A: 			jr   nc,$151F
L151C: 			call $14AB
L151F: 			jr   $1530
L1521: 			jr   $152E
L1523: 			exx
L1524: 			ex   de,hl
L1525: 			add  hl,bc
L1526: 			ex   de,hl
L1527: 			jr   nc,$152E
L1529: 			call $14AB
L152C: 			jr   $1530
L152E: 			jr   $1510
L1530: 			exx
L1531: 			push de
L1532: 			exx
L1533: 			pop  hl
L1534: 			ex   de,hl
L1535: 			push hl
L1536: 			ld   hl,($7E79)
L1539: 			ld   a,($7E7B)
L153C: 			or   a
L153D: 			jr   z,$1542
L153F: 			ld   (hl),e
L1540: 			jr   $1546
L1542: 			ld   a,(hl)
L1543: 			and  d
L1544: 			or   e
L1545: 			ld   (hl),a
L1546: 			pop  de
L1547: 			ld   a,($7E71)
L154A: 			ld   h,a
L154B: 			ld   a,($7E73)
L154E: 			cp   h
L154F: 			jr   nz,$1510
L1551: 			push de
L1552: 			xor  a
L1553: 			ld   de,($7E6F)
L1557: 			ld   hl,($7E75)
L155A: 			sbc  hl,de
L155C: 			pop  de
L155D: 			jr   nz,$1510
L155F: 			ld   a,($7E75)
L1562: 			and  $03
L1564: 			ld   ($7E77),a
L1567: 			ret
L1568: 			push bc
L1569: 			ld   c,h
L156A: 			ld   b,e
L156B: 			ld   h,a
L156C: 			in   a,(c)
L156E: 			xor  l
L156F: 			and  h
L1570: 			jr   nz,$157A
L1572: 			dec  e
L1573: 			jr   nz,$1578
L1575: 			inc  a
L1576: 			pop  bc
L1577: 			ret
L1578: 			jr   $156C
L157A: 			dec  d
L157B: 			jr   nz,$1580
L157D: 			xor  a
L157E: 			pop  bc
L157F: 			ret
L1580: 			ld   e,b
L1581: 			jr   $156C
L1583: 			ld   hl,$0AC4
L1586: 			call $0A24
L1589: 			xor  a
L158A: 			ld   ($7CA3),a
L158D: 			inc  a
L158E: 			out  ($20),a
L1590: 			ld   ($7C14),a
L1593: 			ld   a,$07
L1595: 			ld   ($7C26),a
L1598: 			ld   hl,$7C25
L159B: 			inc  (hl)
L159C: 			ld   hl,$7C11
L159F: 			inc  (hl)
L15A0: 			ret
L15A1: 			ld   a,($7C16)
L15A4: 			and  a
L15A5: 			jr   nz,$15BF
L15A7: 			ld   a,$01
L15A9: 			ld   de,$1020
L15AC: 			ld   hl,$11FE
L15AF: 			call $1568
L15B2: 			and  a
L15B3: 			jr   z,$15D0
L15B5: 			ld   ($7C16),a
L15B8: 			call $1583
L15BB: 			jr   $15D0
L15BD: 			jr   $15D0
L15BF: 			ld   a,$01
L15C1: 			ld   de,$0520
L15C4: 			ld   hl,$11FE
L15C7: 			call $1568
L15CA: 			and  a
L15CB: 			jr   nz,$15D0
L15CD: 			ld   ($7C16),a
L15D0: 			ld   a,($7C17)
L15D3: 			and  a
L15D4: 			jr   nz,$15FE
L15D6: 			ld   a,$02
L15D8: 			ld   de,$1020
L15DB: 			ld   hl,$11FD
L15DE: 			call $1568
L15E1: 			and  a
L15E2: 			jr   z,$160F
L15E4: 			ld   ($7C17),a
L15E7: 			call $1583
L15EA: 			in   a,($12)
L15EC: 			bit  1,a
L15EE: 			jr   nz,$15FA
L15F0: 			inc  (hl)
L15F1: 			inc  (hl)
L15F2: 			inc  (hl)
L15F3: 			inc  (hl)
L15F4: 			ld   hl,$7C25
L15F7: 			inc  (hl)
L15F8: 			inc  (hl)
L15F9: 			inc  (hl)
L15FA: 			jr   $160F
L15FC: 			jr   $160F
L15FE: 			ld   a,$02
L1600: 			ld   de,$0520
L1603: 			ld   hl,$11FD
L1606: 			call $1568
L1609: 			and  a
L160A: 			jr   nz,$160F
L160C: 			ld   ($7C17),a
L160F: 			in   a,($11)
L1611: 			and  $04
L1613: 			ret  nz
L1614: 			inc  a
L1615: 			ld   ($7C1F),a
L1618: 			ret
L1619: 			ld   l,a
L161A: 			ld   b,e
L161B: 			ld   d,b
L161C: 			and  b
L161D: 			ld   l,(hl)
L161E: 			ld   b,d
L161F: 			ld   c,a
L1620: 			and  b
L1621: 			ld   l,(hl)
L1622: 			ld   b,c
L1623: 			ld   c,(hl)
L1624: 			and  b
L1625: 			ld   l,l
L1626: 			ld   b,b
L1627: 			ld   c,l
L1628: 			and  b
L1629: 			ld   l,h
L162A: 			ccf
L162B: 			ld   c,h
L162C: 			and  b
L162D: 			ld   l,h
L162E: 			ld   a,$4B
L1630: 			and  b
L1631: 			ld   l,e
L1632: 			dec  a
L1633: 			ld   c,d
L1634: 			and  b
L1635: 			ld   l,d
L1636: 			inc  a
L1637: 			ld   c,c
L1638: 			and  b
L1639: 			ld   l,d
L163A: 			dec  sp
L163B: 			ld   c,b
L163C: 			and  b
L163D: 			ld   l,c
L163E: 			ld   a,($9E48)
L1641: 			ld   l,b
L1642: 			ld   a,($9C48)
L1645: 			ld   l,b
L1646: 			add  hl,sp
L1647: 			ld   c,b
L1648: 			sbc  a,d
L1649: 			ld   l,b
L164A: 			add  hl,sp
L164B: 			ld   c,b
L164C: 			sub  a
L164D: 			ld   h,a
L164E: 			jr   c,$1698
L1650: 			sub  h
L1651: 			ld   h,a
L1652: 			jr   c,$169C
L1654: 			sub  c
L1655: 			ld   h,(hl)
L1656: 			scf
L1657: 			ld   c,c
L1658: 			adc  a,a
L1659: 			ld   h,(hl)
L165A: 			ld   (hl),$49
L165C: 			adc  a,l
L165D: 			ld   h,l
L165E: 			dec  (hl)
L165F: 			ld   c,c
L1660: 			adc  a,c
L1661: 			ld   h,l
L1662: 			inc  (hl)
L1663: 			ld   c,c
L1664: 			add  a,(hl)
L1665: 			ld   h,h
L1666: 			inc  (hl)
L1667: 			ld   c,d
L1668: 			add  a,d
L1669: 			ld   h,h
L166A: 			inc  sp
L166B: 			ld   c,d
L166C: 			ld   a,(hl)
L166D: 			ld   h,e
L166E: 			ld   ($7B4A),a
L1671: 			ld   h,e
L1672: 			ld   sp,$784B
L1675: 			ld   h,d
L1676: 			jr   nc,$16C3
L1678: 			ld   (hl),h
L1679: 			ld   h,d
L167A: 			jr   nc,$16C8
L167C: 			ld   l,(hl)
L167D: 			ld   h,d
L167E: 			cpl
L167F: 			ld   c,l
L1680: 			ld   l,b
L1681: 			ld   e,a
L1682: 			scf
L1683: 			ld   d,b
L1684: 			ld   e,(hl)
L1685: 			ld   h,c
L1686: 			cpl
L1687: 			ld   d,b
L1688: 			ld   e,d
L1689: 			ld   h,c
L168A: 			ld   l,$53
L168C: 			ld   d,b
L168D: 			ld   h,b
L168E: 			ld   l,$55
L1690: 			ld   c,e
L1691: 			ld   e,a
L1692: 			dec  l
L1693: 			ld   d,(hl)
L1694: 			ld   b,(hl)
L1695: 			ld   e,a
L1696: 			dec  l
L1697: 			ld   d,a
L1698: 			ld   b,d
L1699: 			ld   l,a
L169A: 			and  b
L169B: 			ld   h,h
L169C: 			and  b
L169D: 			ld   l,a
L169E: 			sbc  a,a
L169F: 			ld   h,h
L16A0: 			sbc  a,a
L16A1: 			ld   l,a
L16A2: 			sbc  a,(hl)
L16A3: 			ld   h,h
L16A4: 			sbc  a,(hl)
L16A5: 			ld   l,a
L16A6: 			sbc  a,l
L16A7: 			ld   h,h
L16A8: 			sbc  a,l
L16A9: 			ld   l,(hl)
L16AA: 			sbc  a,h
L16AB: 			ld   h,l
L16AC: 			sbc  a,h
L16AD: 			ld   l,(hl)
L16AE: 			sbc  a,e
L16AF: 			ld   h,l
L16B0: 			sbc  a,e
L16B1: 			ld   l,l
L16B2: 			sbc  a,d
L16B3: 			ld   h,(hl)
L16B4: 			sbc  a,d
L16B5: 			ld   l,l
L16B6: 			sbc  a,c
L16B7: 			ld   h,(hl)
L16B8: 			sbc  a,c
L16B9: 			ld   l,h
L16BA: 			sbc  a,b
L16BB: 			ld   h,a
L16BC: 			sbc  a,b
L16BD: 			ld   l,e
L16BE: 			sub  a
L16BF: 			ld   l,b
L16C0: 			sub  a
L16C1: 			rst  38
L16C2: 			nop
L16C3: 			nop
L16C4: 			inc  b
L16C5: 			ld   (de),a
L16C6: 			nop
L16C7: 			nop
L16C8: 			djnz $16CA
L16CA: 			nop
L16CB: 			nop
L16CC: 			ld   a,b
L16CD: 			nop
L16CE: 			nop
L16CF: 			nop
L16D0: 			cp   $00
L16D2: 			nop
L16D3: 			nop
L16D4: 			ld   a,a
L16D5: 			nop
L16D6: 			nop
L16D7: 			nop
L16D8: 			rra
L16D9: 			add  a,b
L16DA: 			nop
L16DB: 			nop
L16DC: 			rra
L16DD: 			add  a,b
L16DE: 			nop
L16DF: 			nop
L16E0: 			ccf
L16E1: 			nop
L16E2: 			nop
L16E3: 			nop
L16E4: 			ld   a,(hl)
L16E5: 			nop
L16E6: 			nop
L16E7: 			ld   bc,$00F8
L16EA: 			nop
L16EB: 			inc  bc
L16EC: 			ret  p
L16ED: 			nop
L16EE: 			nop
L16EF: 			rrca
L16F0: 			ret  nz
L16F1: 			nop
L16F2: 			djnz $1713
L16F4: 			add  a,b
L16F5: 			nop
L16F6: 			ld   a,b
L16F7: 			ld   a,(hl)
L16F8: 			nop
L16F9: 			nop
L16FA: 			cp   $FC
L16FC: 			nop
L16FD: 			nop
L16FE: 			ld   a,a
L16FF: 			ret  p
L1700: 			nop
L1701: 			nop
L1702: 			rra
L1703: 			ret  po
L1704: 			nop
L1705: 			nop
L1706: 			rrca
L1707: 			add  a,b
L1708: 			nop
L1709: 			nop
L170A: 			inc  bc
L170B: 			nop
L170C: 			nop
L170D: 			nop

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L170E: 			rst  08
L170F: 			dec  de
L1710: 			ld   a,(bc)
L1711: 			ld   a,h
L1712: 			rla
L1713: 			ld   e,$27
L1715: 			rla
L1716: 			add  hl,de
L1717: 			ld   h,b
L1718: 			ld   bc,$1927
L171B: 			ld   h,b
L171C: 			inc  d
L171D: 			ld   bc,$9F19
L1720: 			ld   bc,$1927
L1723: 			sbc  a,a
L1724: 			inc  d
L1725: 			add  hl,bc
L1726: 			ld   bc,$C503
L1729: 			push iy
L172B: 			push ix
L172D: 			call $14AD
L1730: 			pop  ix
L1732: 			pop  iy
L1734: 			pop  bc
L1735: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L1737: 			pop  hl
L1738: 			pop  de
L1739: 			sla  e
L173B: 			rl   d
L173D: 			sla  e
L173F: 			rl   d
L1741: 			sla  e
L1743: 			rl   d
L1745: 			sla  e
L1747: 			rl   d
L1749: 			sla  e
L174B: 			rl   d
L174D: 			sla  e
L174F: 			rl   d
L1751: 			push bc
L1752: 			ld   c,$00
L1754: 			call $0D2F
L1757: 			and  $03
L1759: 			ld   ($7E77),a
L175C: 			ld   de,$4000
L175F: 			add  hl,de
L1760: 			ld   ($7E79),hl
L1763: 			pop  bc
L1764: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



L1766: 			rst  08
L1767: 			jr   c,$1784
L1769: 			ld   (hl),c
L176A: 			ld   a,(hl)
L176B: 			ld   (bc),a
L176C: 			dec  de
L176D: 			ld   l,a
L176E: 			ld   a,(hl)
L176F: 			ld   (bc),a
L1770: 			add  hl,sp
L1771: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L1772: 			rst  08
L1773: 			jr   c,$1790
L1775: 			ld   (hl),c
L1776: 			ld   a,(hl)
L1777: 			ld   (bc),a
L1778: 			dec  de
L1779: 			ld   l,a
L177A: 			ld   a,(hl)
L177B: 			ld   (bc),a
L177C: 			jr   c,$1784
L177E: 			dec  de
L177F: 			ld   (hl),e
L1780: 			ld   a,(hl)
L1781: 			ld   (bc),a
L1782: 			dec  de
L1783: 			ld   (hl),l
L1784: 			ld   a,(hl)
L1785: 			ld   (bc),a
L1786: 			ld   a,($393B)
L1789: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L178A: 			rst  08
L178B: 			ex   af,af'
L178C: 			rla
L178D: 			ld   bc,$0309

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L1790: 			rst  08
L1791: 			dec  de
L1792: 			add  hl,de
L1793: 			ld   d,$08
L1795: 			inc  a
L1796: 			inc  a
L1797: 			rlca
L1798: 			ld   bc,$193D
L179B: 			inc  bc
L179C: 			ld   a,$3F
L179E: 			inc  a
L179F: 			inc  a
L17A0: 			rlca
L17A1: 			ld   bc,$063D
L17A4: 			add  hl,de
L17A5: 			ld   b,$3E
L17A7: 			add  hl,de
L17A8: 			ld   b,$3E
L17AA: 			ld   b,b
L17AB: 			ld   b,b
L17AC: 			add  hl,de
L17AD: 			inc  b
L17AE: 			inc  d
L17AF: 			ex   af,af'
L17B0: 			rla
L17B1: 			add  hl,de
L17B2: 			rst  38
L17B3: 			ld   h,$1E
L17B5: 			sub  h
L17B6: 			rla
L17B7: 			rlca
L17B8: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L17B9: 			rst  08
L17BA: 			add  hl,de
L17BB: 			inc  b
L17BC: 			ld   a,$19
L17BE: 			inc  b
L17BF: 			ld   a,$06
L17C1: 			ld   bc,$0619
L17C4: 			ld   a,$14
L17C6: 			ld   bc,$0540
L17C9: 			add  hl,bc
L17CA: 			dec  b
L17CB: 			dec  b
L17CC: 			ld   a,(bc)
L17CD: 			ex   af,af'
L17CE: 			jr   z,$17EE
L17D0: 			cp   d
L17D1: 			rla
L17D2: 			rlca
L17D3: 			rlca
L17D4: 			rlca
L17D5: 			rlca
L17D6: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L17D7: 			rst  08
L17D8: 			add  hl,de
L17D9: 			inc  b
L17DA: 			ld   b,c
L17DB: 			rlca
L17DC: 			add  hl,de
L17DD: 			inc  bc
L17DE: 			ld   a,$14
L17E0: 			inc  de
L17E1: 			add  hl,de
L17E2: 			inc  b
L17E3: 			ld   b,c
L17E4: 			ld   b,b
L17E5: 			add  hl,de
L17E6: 			dec  b
L17E7: 			ld   a,$14
L17E9: 			ld   b,d
L17EA: 			add  hl,de
L17EB: 			inc  bc
L17EC: 			ld   a,$14
L17EE: 			ld   b,d
L17EF: 			rlca
L17F0: 			rlca
L17F1: 			ld   b,d
L17F2: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L17F3: 			rst  08
L17F4: 			dec  de
L17F5: 			dec  de
L17F6: 			ld   a,h
L17F7: 			rla
L17F8: 			ld   e,$01
L17FA: 			jr   $1817
L17FC: 			ex   af,af'
L17FD: 			ld   b,$1F
L17FF: 			inc  b
L1800: 			jr   $181D
L1802: 			ex   af,af'
L1803: 			inc  bc
L1804: 			ex   af,af'
L1805: 			ex   af,af'
L1806: 			dec  de
L1807: 			nop
L1808: 			scf
L1809: 			dec  de
L180A: 			nop
L180B: 			or   b
L180C: 			dec  b
L180D: 			dec  de
L180E: 			sub  (hl)
L180F: 			ld   a,h
L1810: 			rla
L1811: 			add  hl,hl
L1812: 			dec  de
L1813: 			nop
L1814: 			ccf
L1815: 			dec  de
L1816: 			nop
L1817: 			or   b
L1818: 			dec  b
L1819: 			dec  de
L181A: 			sub  l
L181B: 			ld   a,h
L181C: 			rla
L181D: 			add  hl,hl
L181E: 			dec  de
L181F: 			nop
L1820: 			ld   b,a
L1821: 			dec  de
L1822: 			nop
L1823: 			or   b
L1824: 			dec  b
L1825: 			dec  de
L1826: 			ld   c,c
L1827: 			ld   a,h
L1828: 			rla
L1829: 			add  hl,hl
L182A: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L182B: 			rst  08

L182C: 			dec  de
L182D: 			nop
L182E: 			adc  a,h
L182F: 			dec  de
L1830: 			sub  e
L1831: 			inc  b
L1832: 			dec  de
L1833: 			ld   bc,$1B05
L1836: 			jr   z,$1840
L1838: 			ld   hl,($CF03)
L183B: 			dec  de
L183C: 			nop
L183D: 			rrca
L183E: 			ld   b,e
L183F: 			dec  de
L1840: 			nop
L1841: 			ccf
L1842: 			ld   b,e
L1843: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L1844: 			rst  08
L1845: 			dec  c
L1846: 			dec  de
L1847: 			nop
L1848: 			ld   b,b
L1849: 			dec  de
L184A: 			nop
L184B: 			inc  a
L184C: 			ld   b,h
L184D: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L184E: 			rst  08			; Map to get back
L184F: 			dec  c
L1850: 			dec  de
L1851: 			jr   nc,$18CF
L1853: 			dec  de
L1854: 			ld   (hl),b
L1855: 			ld   (bc),a
L1856: 			ld   b,h
L1857: 			add  hl,de
L1858: 			inc  bc
L1859: 			dec  de
L185A: 			dec  a
L185B: 			ld   a,h
L185C: 			inc  b
L185D: 			inc  bc
L185E: 			push bc
L185F: 			ld   a,$0C
L1861: 			out  ($19),a
L1863: 			ld   a,$50
L1865: 			out  ($0C),a
L1867: 			ld   de,$C050
L186A: 			ld   bc,$4000
L186D: 			ld   hl,$004F
L1870: 			push de
L1871: 			push hl
L1872: 			ld   a,(bc)
L1873: 			ld   (hl),a
L1874: 			dec  hl
L1875: 			inc  bc
L1876: 			dec  e
L1877: 			jr   nz,$1872
L1879: 			pop  hl
L187A: 			ld   de,$0050
L187D: 			add  hl,de
L187E: 			pop  de
L187F: 			dec  d
L1880: 			jr   nz,$1870
L1882: 			pop  bc
L1883: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1885: 			rst  08
L1886: 			dec  de
L1887: 			dec  de
L1888: 			ld   a,h
L1889: 			rla
L188A: 			ex   af,af'
L188B: 			ld   e,$94
L188D: 			jr   $18AA
L188F: 			ex   af,af'
L1890: 			ld   b,$1F
L1892: 			sub  a
L1893: 			jr   $18B0
L1895: 			ex   af,af'
L1896: 			inc  bc
L1897: 			ex   af,af'
L1898: 			dec  de
L1899: 			dec  c
L189A: 			ld   a,h
L189B: 			rla
L189C: 			ld   e,$B2
L189E: 			jr   $18BB
L18A0: 			nop
L18A1: 			ld   b,e
L18A2: 			dec  de
L18A3: 			nop
L18A4: 			adc  a,h
L18A5: 			dec  b
L18A6: 			dec  de
L18A7: 			nop
L18A8: 			ld   b,b
L18A9: 			dec  e
L18AA: 			dec  de
L18AB: 			dec  c
L18AC: 			ld   a,h
L18AD: 			ld   ($1F45),hl
L18B0: 			cp   h
L18B1: 			jr   $18CE
L18B3: 			nop
L18B4: 			ld   b,l
L18B5: 			dec  de
L18B6: 			nop
L18B7: 			adc  a,h
L18B8: 			dec  b
L18B9: 			add  hl,de
L18BA: 			jr   nc,$18E5
L18BC: 			ld   bc,$C41E
L18BF: 			jr   $18DC
L18C1: 			nop
L18C2: 			ex   af,af'
L18C3: 			dec  e
L18C4: 			dec  de
L18C5: 			ld   c,$7C
L18C7: 			rla
L18C8: 			ld   e,$DE
L18CA: 			jr   $18E7
L18CC: 			nop
L18CD: 			add  hl,bc
L18CE: 			dec  de
L18CF: 			nop
L18D0: 			adc  a,h
L18D1: 			dec  b
L18D2: 			dec  de
L18D3: 			nop
L18D4: 			ld   b,b
L18D5: 			dec  e
L18D6: 			dec  de
L18D7: 			ld   c,$7C
L18D9: 			ld   ($1F45),hl
L18DC: 			ret  pe
L18DD: 			jr   $18FA
L18DF: 			nop
L18E0: 			dec  bc
L18E1: 			dec  de
L18E2: 			nop
L18E3: 			adc  a,h
L18E4: 			dec  b
L18E5: 			add  hl,de
L18E6: 			jr   nc,$1911
L18E8: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L18E9: 			rst  08
L18EA: 			dec  de
L18EB: 			nop
L18EC: 			or   (hl)
L18ED: 			dec  de
L18EE: 			cp   d
L18EF: 			inc  b
L18F0: 			dec  de
L18F1: 			ld   bc,$1B05
L18F4: 			jr   z,$18FE
L18F6: 			ld   hl,($CF03)
L18F9: 			dec  de
L18FA: 			nop
L18FB: 			or   a
L18FC: 			dec  de
L18FD: 			cp   a
L18FE: 			inc  b
L18FF: 			dec  de
L1900: 			ld   bc,$1B05
L1903: 			jr   z,$190D
L1905: 			ld   hl,($CF03)
L1908: 			dec  de
L1909: 			ret  nz
L190A: 			ld   a,(bc)
L190B: 			ld   bc,$1E08
L190E: 			ld   e,$19
L1910: 			dec  c
L1911: 			dec  d
L1912: 			ex   af,af'
L1913: 			ex   af,af'
L1914: 			ld   b,(hl)
L1915: 			ld   b,a
L1916: 			dec  de
L1917: 			nop
L1918: 			ld   (bc),a
L1919: 			inc  d
L191A: 			jr   $193B
L191C: 			rra
L191D: 			add  hl,de
L191E: 			rlca
L191F: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$7C
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1920: 			rst  08
L1921: 			ld   c,b
L1922: 			ld   c,c
L1923: 			ld   c,d
L1924: 			dec  de
L1925: 			dec  de
L1926: 			ld   a,h
L1927: 			rla
L1928: 			ld   e,$44
L192A: 			add  hl,de
L192B: 			dec  de
L192C: 			adc  a,e
L192D: 			ld   a,h
L192E: 			jr   nc,$1949
L1930: 			or   c
L1931: 			ex   af,af'
L1932: 			ex   af,af'
L1933: 			ld   ($194B),hl
L1936: 			ld   (bc),a
L1937: 			ld   c,e
L1938: 			add  hl,de
L1939: 			inc  bc
L193A: 			ld   c,e
L193B: 			ld   c,h
L193C: 			dec  c
L193D: 			ld   c,$2F
L193F: 			inc  d
L1940: 			dec  de
L1941: 			ld   l,l
L1942: 			ld   a,(hl)
L1943: 			ld   (bc),a
L1944: 			add  hl,de
L1945: 			rra
L1946: 			add  hl,de
L1947: 			adc  a,d
L1948: 			add  hl,de
L1949: 			jr   $1964
L194B: 			ld   c,$4D
L194D: 			add  hl,de
L194E: 			sbc  a,l
L194F: 			add  hl,de
L1950: 			xor  h
L1951: 			dec  c
L1952: 			add  hl,de
L1953: 			ld   a,$40
L1955: 			ld   ($2D19),hl
L1958: 			ld   b,d
L1959: 			add  hl,de
L195A: 			inc  b
L195B: 			add  hl,de
L195C: 			inc  h
L195D: 			ld   b,d
L195E: 			add  hl,de
L195F: 			ex   af,af'
L1960: 			add  hl,de
L1961: 			dec  e
L1962: 			ld   b,d
L1963: 			add  hl,de
L1964: 			dec  c
L1965: 			add  hl,de
L1966: 			ld   d,$42
L1968: 			add  hl,de
L1969: 			inc  d
L196A: 			add  hl,de
L196B: 			dec  c

L196C: 			ld   b,d
L196D: 			add  hl,de
L196E: 			rra
L196F: 			add  hl,de
L1970: 			ld   b,$42
L1972: 			add  hl,de
L1973: 			jr   z,$198E
L1975: 			inc  bc
L1976: 			ld   b,d
L1977: 			add  hl,de
L1978: 			and  b
L1979: 			add  hl,de
L197A: 			inc  bc
L197B: 			ld   b,d
L197C: 			dec  de
L197D: 			nop
L197E: 			dec  e
L197F: 			dec  de
L1980: 			nop
L1981: 			adc  a,l
L1982: 			dec  de
L1983: 			jp   nz,$1B16
L1986: 			ld   l,b
L1987: 			ex   af,af'
L1988: 			ld   c,(hl)
L1989: 			dec  de
L198A: 			ret  nz
L198B: 			djnz $19A8
L198D: 			nop
L198E: 			ld   h,(hl)
L198F: 			dec  de
L1990: 			inc  bc
L1991: 			ex   af,af'
L1992: 			dec  de
L1993: 			jr   z,$1999
L1995: 			ld   c,(hl)
L1996: 			ld   c,a
L1997: 			dec  de
L1998: 			add  a,b
L1999: 			jr   z,$19B6
L199B: 			nop
L199C: 			ld   c,h
L199D: 			dec  de
L199E: 			rrca
L199F: 			ex   af,af'
L19A0: 			dec  de
L19A1: 			jr   z,$19A7
L19A3: 			ld   c,(hl)
L19A4: 			dec  de
L19A5: 			nop
L19A6: 			jr   z,$19C3
L19A8: 			nop
L19A9: 			xor  h
L19AA: 			dec  de
L19AB: 			pop  af
L19AC: 			rlca
L19AD: 			dec  de
L19AE: 			ex   af,af'
L19AF: 			ex   af,af'
L19B0: 			ld   c,(hl)
L19B1: 			dec  de
L19B2: 			nop
L19B3: 			ld   h,$1B
L19B5: 			nop
L19B6: 			xor  a
L19B7: 			dec  de
L19B8: 			rst  10
L19B9: 			rlca
L19BA: 			dec  de
L19BB: 			jr   z,$19C5
L19BD: 			ld   c,(hl)
L19BE: 			add  hl,de
L19BF: 			inc  c
L19C0: 			add  hl,de
L19C1: 			xor  d
L19C2: 			add  hl,de
L19C3: 			ld   l,(hl)
L19C4: 			add  hl,de
L19C5: 			dec  d
L19C6: 			ld   d,b
L19C7: 			dec  de
L19C8: 			nop
L19C9: 			inc  b
L19CA: 			dec  de
L19CB: 			nop
L19CC: 			or   b
L19CD: 			dec  de
L19CE: 			jr   z,$19D8
L19D0: 			ld   l,$03
L19D2: 			ld   c,c
L19D3: 			ld   c,(hl)
L19D4: 			ld   c,(hl)
L19D5: 			cpl
L19D6: 			dec  de
L19D7: 			nop
L19D8: 			dec  bc
L19D9: 			dec  de
L19DA: 			nop
L19DB: 			xor  a
L19DC: 			dec  de
L19DD: 			ld   h,(hl)
L19DE: 			inc  b
L19DF: 			dec  de
L19E0: 			add  hl,bc
L19E1: 			dec  b
L19E2: 			dec  de
L19E3: 			jr   z,$19ED
L19E5: 			ld   hl,($C419)
L19E8: 			add  hl,de
L19E9: 			xor  d
L19EA: 			add  hl,de
L19EB: 			ld   l,h
L19EC: 			add  hl,de
L19ED: 			dec  d
L19EE: 			ld   d,b
L19EF: 			dec  de
L19F0: 			nop
L19F1: 			inc  sp
L19F2: 			dec  de
L19F3: 			nop
L19F4: 			or   b
L19F5: 			dec  de
L19F6: 			jr   z,$1A00
L19F8: 			add  hl,de
L19F9: 			ld   b,d
L19FA: 			add  hl,hl
L19FB: 			add  hl,de
L19FC: 			rst  10
L19FD: 			add  hl,de
L19FE: 			xor  (hl)
L19FF: 			add  hl,de
L1A00: 			djnz $1A1B
L1A02: 			ld   c,$4D
L1A04: 			dec  de
L1A05: 			nop
L1A06: 			dec  sp
L1A07: 			dec  de
L1A08: 			nop
L1A09: 			or   b
L1A0A: 			dec  de
L1A0B: 			jr   z,$1A15
L1A0D: 			add  hl,de
L1A0E: 			ld   d,e
L1A0F: 			add  hl,hl
L1A10: 			add  hl,de
L1A11: 			rst  30
L1A12: 			add  hl,de
L1A13: 			xor  (hl)
L1A14: 			add  hl,de
L1A15: 			djnz $1A30
L1A17: 			ld   c,$4D
L1A19: 			dec  de
L1A1A: 			nop
L1A1B: 			ld   b,e
L1A1C: 			dec  de
L1A1D: 			nop
L1A1E: 			or   b
L1A1F: 			dec  de
L1A20: 			jr   z,$1A2A
L1A22: 			add  hl,de
L1A23: 			ld   c,a
L1A24: 			add  hl,hl
L1A25: 			dec  de
L1A26: 			rla
L1A27: 			ld   bc,$AE19
L1A2A: 			add  hl,de
L1A2B: 			djnz $1A46
L1A2D: 			ld   c,$4D
L1A2F: 			inc  l
L1A30: 			dec  l
L1A31: 			ld   d,c
L1A32: 			add  hl,de
L1A33: 			jr   nc,$1A3D
L1A35: 			ex   af,af'
L1A36: 			dec  de
L1A37: 			sub  (hl)
L1A38: 			ld   a,h
L1A39: 			inc  b
L1A3A: 			dec  de
L1A3B: 			sub  l
L1A3C: 			ld   a,h
L1A3D: 			inc  b
L1A3E: 			dec  de
L1A3F: 			ld   c,c
L1A40: 			ld   a,h
L1A41: 			inc  b
L1A42: 			ld   d,d
L1A43: 			dec  de
L1A44: 			ld   a,(bc)
L1A45: 			ld   a,h
L1A46: 			rla
L1A47: 			ld   e,$50
L1A49: 			ld   a,(de)
L1A4A: 			dec  de
L1A4B: 			nop
L1A4C: 			ccf
L1A4D: 			rra
L1A4E: 			ld   d,e
L1A4F: 			ld   a,(de)
L1A50: 			dec  de
L1A51: 			nop
L1A52: 			rrca
L1A53: 			ld   b,e
L1A54: 			dec  de
L1A55: 			nop
L1A56: 			inc  bc
L1A57: 			dec  de
L1A58: 			nop
L1A59: 			and  e
L1A5A: 			dec  de
L1A5B: 			add  hl,sp
L1A5C: 			inc  b
L1A5D: 			dec  de
L1A5E: 			inc  b
L1A5F: 			dec  b
L1A60: 			dec  de
L1A61: 			jr   z,$1A6B
L1A63: 			ld   hl,($1B1B)
L1A66: 			ld   a,h
L1A67: 			rla
L1A68: 			ld   e,$86
L1A6A: 			ld   a,(de)
L1A6B: 			dec  de
L1A6C: 			inc  c
L1A6D: 			ld   a,h
L1A6E: 			rla
L1A6F: 			ex   af,af'
L1A70: 			ld   e,$85
L1A72: 			ld   a,(de)
L1A73: 			dec  de
L1A74: 			dec  bc
L1A75: 			ld   a,h
L1A76: 			rla
L1A77: 			ld   e,$80
L1A79: 			ld   a,(de)
L1A7A: 			ld   a,(bc)
L1A7B: 			ld   d,e
L1A7C: 			ld   b,(hl)
L1A7D: 			rra
L1A7E: 			add  a,d
L1A7F: 			ld   a,(de)
L1A80: 			ld   d,e
L1A81: 			rlca
L1A82: 			rra
L1A83: 			add  a,(hl)
L1A84: 			ld   a,(de)
L1A85: 			rlca
L1A86: 			dec  de
L1A87: 			adc  a,e
L1A88: 			ld   a,h
L1A89: 			inc  (hl)
L1A8A: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1A8B: 			rst  08
L1A8C: 			add  hl,de
L1A8D: 			ld   (de),a
L1A8E: 			ld   c,$18
L1A90: 			ld   a,l
L1A91: 			rla
L1A92: 			dec  c
L1A93: 			ld   h,$1E
L1A95: 			and  c
L1A96: 			ld   a,(de)
L1A97: 			add  hl,de
L1A98: 			rlca
L1A99: 			add  hl,de
L1A9A: 			nop
L1A9B: 			ld   c,$18
L1A9D: 			ld   a,l
L1A9E: 			rra
L1A9F: 			xor  b
L1AA0: 			ld   a,(de)
L1AA1: 			add  hl,de
L1AA2: 			dec  b
L1AA3: 			add  hl,de
L1AA4: 			nop
L1AA5: 			ld   c,$37
L1AA7: 			ld   a,l
L1AA8: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1AA9: 			rst  08
L1AAA: 			add  hl,de
L1AAB: 			ld   (de),a
L1AAC: 			ld   c,$F9
L1AAE: 			ld   a,h
L1AAF: 			rla
L1AB0: 			ld   ($1E26),hl
L1AB3: 			cp   a
L1AB4: 			ld   a,(de)
L1AB5: 			add  hl,de
L1AB6: 			ld   b,$19
L1AB8: 			nop
L1AB9: 			ld   c,$18
L1ABB: 			ld   a,l
L1ABC: 			rra
L1ABD: 			ret  nz
L1ABE: 			ld   a,(de)
L1ABF: 			ld   d,h
L1AC0: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1AC1: 			rst  08
L1AC2: 			add  hl,de
L1AC3: 			ld   (de),a
L1AC4: 			ld   c,$F9
L1AC6: 			ld   a,h
L1AC7: 			rla
L1AC8: 			dec  c
L1AC9: 			ld   h,$1E
L1ACB: 			rst  10
L1ACC: 			ld   a,(de)
L1ACD: 			add  hl,de
L1ACE: 			inc  bc
L1ACF: 			add  hl,de
L1AD0: 			nop
L1AD1: 			ld   c,$F9
L1AD3: 			ld   a,h
L1AD4: 			rra
L1AD5: 			ret  c
L1AD6: 			ld   a,(de)
L1AD7: 			ld   d,l
L1AD8: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1AD9: 			rst  08
L1ADA: 			add  hl,de
L1ADB: 			ld   (de),a
L1ADC: 			ld   c,$F9
L1ADE: 			ld   a,h
L1ADF: 			rla
L1AE0: 			dec  c
L1AE1: 			ld   h,$1E
L1AE3: 			rst  28
L1AE4: 			ld   a,(de)
L1AE5: 			add  hl,de
L1AE6: 			ld   (bc),a
L1AE7: 			add  hl,de
L1AE8: 			nop
L1AE9: 			ld   c,$F9
L1AEB: 			ld   a,h
L1AEC: 			rra
L1AED: 			or   $1A
L1AEF: 			add  hl,de
L1AF0: 			inc  b
L1AF1: 			add  hl,de
L1AF2: 			nop
L1AF3: 			ld   c,$18
L1AF5: 			ld   a,l
L1AF6: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1AF7: 			rst  08
L1AF8: 			add  hl,de
L1AF9: 			ld   (de),a
L1AFA: 			ld   c,$DA
L1AFC: 			ld   a,h
L1AFD: 			rla
L1AFE: 			add  hl,de
L1AFF: 			ld   (bc),a
L1B00: 			ld   h,$1E
L1B02: 			ex   af,af'
L1B03: 			dec  de
L1B04: 			ld   d,(hl)
L1B05: 			rra
L1B06: 			add  hl,bc
L1B07: 			dec  de
L1B08: 			ld   d,a
L1B09: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1B0A: 			rst  08
L1B0B: 			add  hl,de
L1B0C: 			ld   (de),a
L1B0D: 			ld   c,$DA
L1B0F: 			ld   a,h
L1B10: 			rla
L1B11: 			ld   ($1E26),hl
L1B14: 			rra
L1B15: 			dec  de
L1B16: 			ld   ($0019),hl
L1B19: 			ld   c,$F9
L1B1B: 			ld   a,h
L1B1C: 			rra
L1B1D: 			jr   nz,$1B3A
L1B1F: 			ld   e,b
L1B20: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1B21: 			rst  08
L1B22: 			dec  de
L1B23: 			rrca
L1B24: 			ld   a,h
L1B25: 			rla
L1B26: 			ld   e,c
L1B27: 			dec  de
L1B28: 			rrca
L1B29: 			ld   a,h
L1B2A: 			inc  b
L1B2B: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$6A
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1B2C: 			rst  08
L1B2D: 			add  hl,de
L1B2E: 			ld   (de),a
L1B2F: 			ld   c,$DA
L1B31: 			ld   a,h
L1B32: 			rla
L1B33: 			dec  c
L1B34: 			ld   h,$1E
L1B36: 			ld   b,c
L1B37: 			dec  de
L1B38: 			dec  c
L1B39: 			add  hl,de
L1B3A: 			nop
L1B3B: 			ld   c,$DA
L1B3D: 			ld   a,h
L1B3E: 			rra
L1B3F: 			ld   b,d
L1B40: 			dec  de
L1B41: 			ld   e,d
L1B42: 			dec  de
L1B43: 			ld   c,e
L1B44: 			ld   a,h
L1B45: 			ld   (bc),a
L1B46: 			dec  de
L1B47: 			inc  a
L1B48: 			ld   a,h
L1B49: 			inc  b
L1B4A: 			add  hl,de
L1B4B: 			inc  h
L1B4C: 			ld   e,e
L1B4D: 			dec  de
L1B4E: 			rlca
L1B4F: 			ld   a,h
L1B50: 			inc  b
L1B51: 			add  hl,de
L1B52: 			ld   a,(bc)
L1B53: 			ld   e,e
L1B54: 			dec  de
L1B55: 			ld   d,(hl)
L1B56: 			ld   a,h
L1B57: 			inc  b
L1B58: 			dec  de
L1B59: 			xor  d
L1B5A: 			ld   a,h
L1B5B: 			rla
L1B5C: 			dec  de
L1B5D: 			rrca
L1B5E: 			ld   a,h
L1B5F: 			inc  b
L1B60: 			dec  de
L1B61: 			ld   c,$7C
L1B63: 			rla
L1B64: 			dec  de
L1B65: 			dec  c
L1B66: 			ld   a,h
L1B67: 			rla
L1B68: 			dec  de
L1B69: 			dec  bc
L1B6A: 			ld   a,h
L1B6B: 			rla
L1B6C: 			ld   e,$70
L1B6E: 			dec  de
L1B6F: 			ld   bc,$0827
L1B72: 			dec  c
L1B73: 			ld   e,h
L1B74: 			ld   e,$8C
L1B76: 			dec  de
L1B77: 			dec  de
L1B78: 			.DB   $fd,$ff
L1B7A: 			ld   e,l
L1B7B: 			ld   e,$83
L1B7D: 			dec  de
L1B7E: 			add  hl,de
L1B7F: 			rlca
L1B80: 			rra
L1B81: 			add  a,l
L1B82: 			dec  de
L1B83: 			add  hl,de
L1B84: 			ex   af,af'
L1B85: 			dec  de
L1B86: 			rrca
L1B87: 			ld   a,h
L1B88: 			inc  b
L1B89: 			rra
L1B8A: 			and  l
L1B8B: 			dec  de
L1B8C: 			ex   af,af'
L1B8D: 			add  hl,de
L1B8E: 			ld   (bc),a
L1B8F: 			ld   e,l
L1B90: 			ld   e,$A4
L1B92: 			dec  de
L1B93: 			ld   e,(hl)
L1B94: 			ex   af,af'
L1B95: 			add  hl,de
L1B96: 			inc  b
L1B97: 			ld   e,l
L1B98: 			ld   e,$A4
L1B9A: 			dec  de
L1B9B: 			ld   e,(hl)
L1B9C: 			ex   af,af'
L1B9D: 			add  hl,de
L1B9E: 			ld   b,$5D
L1BA0: 			ld   e,$A4
L1BA2: 			dec  de
L1BA3: 			ld   e,(hl)
L1BA4: 			rlca
L1BA5: 			inc  bc
L1BA6: 			ret
L1BA7: 			call $115B
L1BAA: 			ret
L1BAB: 			ld   ($7CEB),a
L1BAE: 			ret
L1BAF: 			ld   ($7CEB),a
L1BB2: 			ret
L1BB3: 			call $115B
L1BB6: 			call $1166
L1BB9: 			ret
L1BBA: 			ld   ($7CEB),a
L1BBD: 			ld   ($7D0A),a
L1BC0: 			ret
L1BC1: 			call $115B
L1BC4: 			call $1166
L1BC7: 			call $1171
L1BCA: 			ret
L1BCB: 			ld   ($7CEB),a
L1BCE: 			call $1166
L1BD1: 			ret
L1BD2: 			and  (hl)
L1BD3: 			dec  de
L1BD4: 			and  a
L1BD5: 			dec  de
L1BD6: 			xor  e
L1BD7: 			dec  de
L1BD8: 			xor  a
L1BD9: 			dec  de
L1BDA: 			or   e
L1BDB: 			dec  de
L1BDC: 			pop  bc
L1BDD: 			dec  de
L1BDE: 			rr   e
L1BE0: 			cp   d
L1BE1: 			dec  de
L1BE2: 			ld   a,($7C3C)
L1BE5: 			ld   hl,$1BD2
L1BE8: 			call $114C
L1BEB: 			ld   hl,$1BF3
L1BEE: 			ld   a,$81
L1BF0: 			push hl
L1BF1: 			ex   de,hl
L1BF2: 			jp   (hl)
L1BF3: 			ret
L1BF4: 			ld   a,$01
L1BF6: 			ld   ($7C46),a
L1BF9: 			ret
L1BFA: 			ret
L1BFB: 			call $115B
L1BFE: 			ld   a,($7CCF)
L1C01: 			and  a
L1C02: 			jp   nz,$1BF4
L1C05: 			ld   bc,$7CF9
L1C08: 			ret
L1C09: 			ld   a,($7CD0)
L1C0C: 			and  a
L1C0D: 			jr   nz,$1C12
L1C0F: 			call $115B
L1C12: 			ld   bc,$7CF9
L1C15: 			ret
L1C16: 			ld   bc,$7CF9
L1C19: 			ld   a,($7CCF)
L1C1C: 			and  a
L1C1D: 			call nz,$115B
L1C20: 			ret
L1C21: 			call $115B
L1C24: 			call $1166
L1C27: 			ld   bc,$7CF9
L1C2A: 			ld   a,($7CCF)
L1C2D: 			and  a
L1C2E: 			jp   nz,$1BF4
L1C31: 			ld   bc,$7D18
L1C34: 			ret
L1C35: 			ld   bc,$7D18
L1C38: 			ld   a,($7CCF)
L1C3B: 			and  a
L1C3C: 			jr   z,$1C48
L1C3E: 			call $115B
L1C41: 			ld   a,($7CD0)
L1C44: 			and  a
L1C45: 			call z,$1166
L1C48: 			ret
L1C49: 			call $115B
L1C4C: 			call $1166
L1C4F: 			call $1171
L1C52: 			ld   bc,$7D18
L1C55: 			ld   a,($7CCF)
L1C58: 			and  a
L1C59: 			jp   nz,$1BF4
L1C5C: 			ld   bc,$7CDA
L1C5F: 			ret
L1C60: 			call $1166
L1C63: 			ld   a,($7CCF)
L1C66: 			and  a
L1C67: 			ld   bc,$7CF9
L1C6A: 			jr   z,$1C72
L1C6C: 			call $115B
L1C6F: 			jp   $1BF4
L1C72: 			ld   bc,$7D18
L1C75: 			ret
L1C76: 			jp   m,$FB1B
L1C79: 			dec  de
L1C7A: 			add  hl,bc
L1C7B: 			inc  e
L1C7C: 			ld   d,$1C
L1C7E: 			ld   hl,$491C
L1C81: 			inc  e
L1C82: 			ld   h,b
L1C83: 			inc  e
L1C84: 			dec  (hl)
L1C85: 			inc  e
L1C86: 			xor  a
L1C87: 			ld   ($7C47),a
L1C8A: 			push bc
L1C8B: 			ld   a,($7C3C)
L1C8E: 			ld   bc,$7CDA
L1C91: 			ld   hl,$1C76
L1C94: 			call $114C
L1C97: 			ld   hl,$1CA0
L1C9A: 			ld   a,($7C39)
L1C9D: 			push hl
L1C9E: 			ex   de,hl
L1C9F: 			jp   (hl)
L1CA0: 			ld   ($7C43),bc
L1CA4: 			pop  bc
L1CA5: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************



L1CA7: 			rst  08
L1CA8: 			dec  b
L1CA9: 			dec  b
L1CAA: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1CAB: 			rst  08
L1CAC: 			dec  de
L1CAD: 			nop
L1CAE: 			inc  h
L1CAF: 			ld   e,a
L1CB0: 			ld   l,$05
L1CB2: 			ld   d,e
L1CB3: 			ld   b,c
L1CB4: 			ld   b,(hl)
L1CB5: 			ld   b,l
L1CB6: 			jr   nz,$1CE7
L1CB8: 			ld   d,d
L1CB9: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1CBA: 			rst  08
L1CBB: 			dec  de
L1CBC: 			nop
L1CBD: 			inc  h
L1CBE: 			ld   e,a
L1CBF: 			ld   l,$05
L1CC1: 			ld   b,(hl)
L1CC2: 			ld   c,a
L1CC3: 			ld   d,l
L1CC4: 			ld   c,h
L1CC5: 			jr   nz,$1CF6
L1CC7: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1CC8: 			rst  08
L1CC9: 			dec  de
L1CCA: 			ret  nz
L1CCB: 			ld   a,h
L1CCC: 			rla
L1CCD: 			ld   e,$EF
L1CCF: 			inc  e
L1CD0: 			dec  de
L1CD1: 			nop
L1CD2: 			inc  hl
L1CD3: 			ld   e,a
L1CD4: 			ld   l,$05
L1CD6: 			ld   b,a
L1CD7: 			ld   d,d
L1CD8: 			ld   b,c
L1CD9: 			ld   c,(hl)
L1CDA: 			ld   b,h
L1CDB: 			cpl
L1CDC: 			dec  de
L1CDD: 			nop
L1CDE: 			inc  h
L1CDF: 			dec  de
L1CE0: 			nop
L1CE1: 			adc  a,b
L1CE2: 			dec  de
L1CE3: 			jr   z,$1CED
L1CE5: 			ld   l,$04
L1CE7: 			ld   d,e
L1CE8: 			ld   c,h
L1CE9: 			ld   b,c
L1CEA: 			ld   c,l
L1CEB: 			cpl
L1CEC: 			rra
L1CED: 			nop
L1CEE: 			dec  e
L1CEF: 			add  hl,de
L1CF0: 			adc  a,b
L1CF1: 			add  hl,de
L1CF2: 			inc  d
L1CF3: 			ld   c,e
L1CF4: 			dec  de
L1CF5: 			nop
L1CF6: 			inc  hl
L1CF7: 			ld   e,a
L1CF8: 			ld   l,$05
L1CFA: 			ld   c,b
L1CFB: 			ld   c,a
L1CFC: 			ld   c,l
L1CFD: 			ld   b,l
L1CFE: 			ld   d,d
L1CFF: 			cpl
L1D00: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1D01: 			rst  08
L1D02: 			dec  de
L1D03: 			nop
L1D04: 			inc  h
L1D05: 			ld   e,a
L1D06: 			ld   l,$04
L1D08: 			ld   d,a
L1D09: 			ld   b,c
L1D0A: 			ld   c,h
L1D0B: 			ld   c,e
L1D0C: 			cpl
L1D0D: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1D0E: 			rst  08
L1D0F: 			dec  de
L1D10: 			ld   c,c
L1D11: 			ld   a,h
L1D12: 			rla
L1D13: 			ex   af,af'
L1D14: 			add  hl,de
L1D15: 			ld   sp,$1E26
L1D18: 			ld   hl,($071D)
L1D1B: 			dec  de
L1D1C: 			nop
L1D1D: 			inc  hl
L1D1E: 			ld   e,a
L1D1F: 			ld   l,$05
L1D21: 			ld   sp,$4F20
L1D24: 			ld   d,l
L1D25: 			ld   d,h
L1D26: 			cpl
L1D27: 			rra
L1D28: 			ld   c,l
L1D29: 			dec  e
L1D2A: 			add  hl,de
L1D2B: 			ld   ($1E26),a
L1D2E: 			ld   b,b
L1D2F: 			dec  e
L1D30: 			dec  de
L1D31: 			nop
L1D32: 			ld   ($2E5F),hl
L1D35: 			ld   b,$32
L1D37: 			jr   nz,$1D88
L1D39: 			ld   d,l
L1D3A: 			ld   d,h
L1D3B: 			ld   d,e
L1D3C: 			cpl
L1D3D: 			rra
L1D3E: 			ld   c,l
L1D3F: 			dec  e
L1D40: 			dec  de
L1D41: 			nop
L1D42: 			ld   ($2E5F),hl
L1D45: 			ld   b,$33
L1D47: 			jr   nz,$1D98
L1D49: 			ld   d,l
L1D4A: 			ld   d,h
L1D4B: 			ld   d,e
L1D4C: 			cpl
L1D4D: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1D4E: 			rst  08
L1D4F: 			dec  de
L1D50: 			sub  l
L1D51: 			ld   a,h
L1D52: 			rla
L1D53: 			add  hl,de
L1D54: 			ld   sp,$1E26
L1D57: 			ld   l,e
L1D58: 			dec  e
L1D59: 			dec  de
L1D5A: 			nop
L1D5B: 			jr   nz,$1DBC
L1D5D: 			ld   l,$08
L1D5F: 			ld   d,e
L1D60: 			ld   d,h
L1D61: 			ld   d,d
L1D62: 			ld   c,c
L1D63: 			ld   c,e
L1D64: 			ld   b,l
L1D65: 			jr   nz,$1D98
L1D67: 			cpl
L1D68: 			rra
L1D69: 			ld   a,d
L1D6A: 			dec  e
L1D6B: 			dec  de
L1D6C: 			nop
L1D6D: 			ld   hl,$2E5F
L1D70: 			ex   af,af'
L1D71: 			ld   d,e
L1D72: 			ld   d,h
L1D73: 			ld   d,d
L1D74: 			ld   c,c
L1D75: 			ld   c,e
L1D76: 			ld   b,l
L1D77: 			jr   nz,$1DAB
L1D79: 			cpl
L1D7A: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1D7B: 			rst  08
L1D7C: 			dec  de
L1D7D: 			sub  (hl)
L1D7E: 			ld   a,h
L1D7F: 			rla
L1D80: 			ex   af,af'
L1D81: 			add  hl,de
L1D82: 			ld   sp,$1E26
L1D85: 			sbc  a,b
L1D86: 			dec  e
L1D87: 			rlca
L1D88: 			dec  de
L1D89: 			nop
L1D8A: 			ld   ($2E5F),hl
L1D8D: 			ld   b,$42
L1D8F: 			ld   b,c
L1D90: 			ld   c,h
L1D91: 			ld   c,h
L1D92: 			jr   nz,$1DC5
L1D94: 			cpl
L1D95: 			rra
L1D96: 			cp   e
L1D97: 			dec  e
L1D98: 			add  hl,de
L1D99: 			ld   ($1E26),a
L1D9C: 			xor  (hl)
L1D9D: 			dec  e
L1D9E: 			dec  de
L1D9F: 			nop
L1DA0: 			ld   ($2E5F),hl
L1DA3: 			ld   b,$42
L1DA5: 			ld   b,c
L1DA6: 			ld   c,h
L1DA7: 			ld   c,h
L1DA8: 			jr   nz,$1DDC
L1DAA: 			cpl
L1DAB: 			rra
L1DAC: 			cp   e
L1DAD: 			dec  e
L1DAE: 			dec  de
L1DAF: 			nop
L1DB0: 			ld   ($2E5F),hl
L1DB3: 			ld   b,$42
L1DB5: 			ld   b,c
L1DB6: 			ld   c,h
L1DB7: 			ld   c,h
L1DB8: 			jr   nz,$1DED
L1DBA: 			cpl
L1DBB: 			inc  bc
L1DBC: 			ld   a,$30
L1DBE: 			ld   ($7C96),a
L1DC1: 			ld   ($7C95),a
L1DC4: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L1DC6: 			push bc
L1DC7: 			push iy
L1DC9: 			call $1246
L1DCC: 			pop  iy
L1DCE: 			pop  bc
L1DCF: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1DD1: 			rst  08
L1DD2: 			ld   h,b
L1DD3: 			ld   h,c
L1DD4: 			ld   h,d
L1DD5: 			ld   d,d
L1DD6: 			dec  de
L1DD7: 			and  b
L1DD8: 			ld   a,h
L1DD9: 			inc  (hl)
L1DDA: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1DDB: 			rst  08
L1DDC: 			dec  de
L1DDD: 			nop
L1DDE: 			jr   nz,$1DFB
L1DE0: 			nop
L1DE1: 			dec  l
L1DE2: 			dec  de
L1DE3: 			jr   z,$1DED
L1DE5: 			ld   l,$09
L1DE7: 			ld   b,a
L1DE8: 			ld   b,c
L1DE9: 			ld   c,l
L1DEA: 			ld   b,l
L1DEB: 			jr   nz,$1E3C
L1DED: 			ld   d,(hl)
L1DEE: 			ld   b,l
L1DEF: 			ld   d,d
L1DF0: 			cpl
L1DF1: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1DF2: 			rst  08
L1DF3: 			dec  de
L1DF4: 			ld   c,c
L1DF5: 			ld   a,h
L1DF6: 			ex   af,af'
L1DF7: 			ld   h,e
L1DF8: 			rla
L1DF9: 			add  hl,de
L1DFA: 			inc  sp
L1DFB: 			ld   h,$1E
L1DFD: 			add  a,e
L1DFE: 			ld   e,$64
L1E00: 			add  hl,de
L1E01: 			nop
L1E02: 			ld   c,$56
L1E04: 			ld   a,l
L1E05: 			add  hl,de
L1E06: 			ex   af,af'
L1E07: 			dec  c
L1E08: 			dec  d
L1E09: 			ex   af,af'
L1E0A: 			ex   af,af'
L1E0B: 			add  hl,de
L1E0C: 			ld   b,$14
L1E0E: 			dec  de
L1E0F: 			ld   hl,$650F
L1E12: 			add  hl,de
L1E13: 			ld   de,$0814
L1E16: 			rla
L1E17: 			add  hl,de
L1E18: 			add  a,b
L1E19: 			dec  e
L1E1A: 			add  hl,de
L1E1B: 			rst  30
L1E1C: 			ld   a,(de)
L1E1D: 			inc  hl
L1E1E: 			add  hl,de
L1E1F: 			rra
L1E20: 			inc  d
L1E21: 			jr   $1E2A
L1E23: 			dec  de
L1E24: 			ld   c,d
L1E25: 			ld   a,h
L1E26: 			jr   nc,$1E43
L1E28: 			sub  l
L1E29: 			ld   a,h
L1E2A: 			rla
L1E2B: 			add  hl,de
L1E2C: 			inc  sp
L1E2D: 			ld   h,$1E
L1E2F: 			ld   ($601E),a
L1E32: 			add  hl,de
L1E33: 			nop
L1E34: 			ld   c,$DA
L1E36: 			ld   a,h
L1E37: 			add  hl,de
L1E38: 			inc  b
L1E39: 			dec  c
L1E3A: 			dec  d
L1E3B: 			ex   af,af'
L1E3C: 			ex   af,af'
L1E3D: 			ex   af,af'
L1E3E: 			add  hl,de
L1E3F: 			ld   b,$14
L1E41: 			dec  de
L1E42: 			ld   hl,$650F
L1E45: 			add  hl,de
L1E46: 			ld   de,$0814
L1E49: 			rla
L1E4A: 			add  hl,de
L1E4B: 			rst  30
L1E4C: 			ld   a,(de)
L1E4D: 			inc  hl
L1E4E: 			add  hl,de
L1E4F: 			ld   (de),a
L1E50: 			inc  d
L1E51: 			rla
L1E52: 			ld   e,$5F
L1E54: 			ld   e,$08
L1E56: 			add  hl,de
L1E57: 			ld   de,$0814
L1E5A: 			rla
L1E5B: 			add  hl,de
L1E5C: 			add  a,b
L1E5D: 			dec  e
L1E5E: 			inc  hl
L1E5F: 			add  hl,de
L1E60: 			rra
L1E61: 			inc  d
L1E62: 			jr   $1E6B
L1E64: 			dec  de
L1E65: 			dec  bc
L1E66: 			ld   a,h
L1E67: 			rla
L1E68: 			ld   e,$80
L1E6A: 			ld   e,$1B
L1E6C: 			inc  c
L1E6D: 			ld   a,h
L1E6E: 			rla
L1E6F: 			dec  de
L1E70: 			ex   af,af'
L1E71: 			ld   a,h
L1E72: 			rla
L1E73: 			ld   h,$1E
L1E75: 			add  a,b
L1E76: 			ld   e,$1B
L1E78: 			djnz $1EF6
L1E7A: 			jr   nc,$1E97
L1E7C: 			ld   a,l
L1E7D: 			ld   a,(hl)
L1E7E: 			jr   nc,$1EB7
L1E80: 			rra
L1E81: 			adc  a,b
L1E82: 			ld   e,$0D
L1E84: 			ld   c,$A9
L1E86: 			inc  c
L1E87: 			rrca
L1E88: 			ld   h,d
L1E89: 			ld   d,d
L1E8A: 			ld   h,(hl)
L1E8B: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1E8C: 			rst  08
L1E8D: 			dec  de
L1E8E: 			sub  l
L1E8F: 			ld   a,h
L1E90: 			ex   af,af'
L1E91: 			ld   h,e
L1E92: 			rla
L1E93: 			add  hl,de
L1E94: 			inc  sp
L1E95: 			ld   h,$1E
L1E97: 			and  e
L1E98: 			ld   e,$67
L1E9A: 			add  hl,de
L1E9B: 			ld   (bc),a
L1E9C: 			dec  de
L1E9D: 			ld   b,b
L1E9E: 			ld   a,h
L1E9F: 			inc  b
L1EA0: 			rra
L1EA1: 			xor  c
L1EA2: 			ld   e,$0D
L1EA4: 			ld   c,$46
L1EA6: 			ld   a,(bc)
L1EA7: 			rrca
L1EA8: 			ld   l,b
L1EA9: 			ld   d,d
L1EAA: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1EAB: 			rst  08
L1EAC: 			dec  de
L1EAD: 			sub  (hl)
L1EAE: 			ld   a,h
L1EAF: 			ex   af,af'
L1EB0: 			ld   h,e
L1EB1: 			rla
L1EB2: 			add  hl,de
L1EB3: 			inc  (hl)
L1EB4: 			ld   h,$1E
L1EB6: 			exx
L1EB7: 			ld   e,$69
L1EB9: 			ld   h,h
L1EBA: 			dec  de
L1EBB: 			and  d
L1EBC: 			ld   a,h
L1EBD: 			ld   h,e
L1EBE: 			add  hl,de
L1EBF: 			rlca
L1EC0: 			dec  de
L1EC1: 			ld   b,b
L1EC2: 			ld   a,h
L1EC3: 			inc  b
L1EC4: 			dec  de
L1EC5: 			ld   (hl),$7C
L1EC7: 			jr   nc,$1EE2
L1EC9: 			ld   b,b
L1ECA: 			dec  de
L1ECB: 			scf
L1ECC: 			ld   a,h
L1ECD: 			inc  b
L1ECE: 			dec  de
L1ECF: 			ret  nc
L1ED0: 			ld   a,h
L1ED1: 			jr   nc,$1F3D
L1ED3: 			ld   l,e
L1ED4: 			ld   l,h
L1ED5: 			ld   h,d
L1ED6: 			rra
L1ED7: 			rst  18
L1ED8: 			ld   e,$0D
L1EDA: 			ld   c,$8E
L1EDC: 			ld   a,(bc)
L1EDD: 			rrca
L1EDE: 			ld   l,l
L1EDF: 			ld   d,d
L1EE0: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1EE1: 			rst  08
L1EE2: 			ld   l,(hl)
L1EE3: 			dec  de
L1EE4: 			sub  l
L1EE5: 			ld   a,h
L1EE6: 			ex   af,af'
L1EE7: 			rla
L1EE8: 			add  hl,de
L1EE9: 			ld   ($1E26),a
L1EEC: 			jp   p,$071E
L1EEF: 			rra
L1EF0: 			call p,$631E
L1EF3: 			ld   d,d
L1EF4: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1EF5: 			rst  08
L1EF6: 			dec  c
L1EF7: 			ld   c,$7E
L1EF9: 			inc  c
L1EFA: 			rrca
L1EFB: 			ld   l,a
L1EFC: 			inc  bc
L1EFD: 			xor  e
L1EFE: 			inc  e
L1EFF: 			cp   d
L1F00: 			inc  e
L1F01: 			ld   c,$1D
L1F03: 			ld   c,(hl)
L1F04: 			dec  e
L1F05: 			ld   a,e
L1F06: 			dec  e
L1F07: 			ret  z
L1F08: 			inc  e
L1F09: 			xor  e
L1F0A: 			inc  e
L1F0B: 			ld   bc,$AB1D
L1F0E: 			inc  e
L1F0F: 			pop  hl
L1F10: 			ld   e,$F2
L1F12: 			dec  e
L1F13: 			adc  a,h
L1F14: 			ld   e,$AB
L1F16: 			ld   e,$D1
L1F18: 			dec  e
L1F19: 			push af
L1F1A: 			ld   e,$CF
L1F1C: 			dec  de
L1F1D: 			sbc  a,b
L1F1E: 			ld   a,h
L1F1F: 			inc  (hl)
L1F20: 			dec  de
L1F21: 			ld   e,$7C
L1F23: 			jr   nc,$1F76
L1F25: 			dec  de
L1F26: 			ld   e,$7C
L1F28: 			inc  (hl)
L1F29: 			dec  de
L1F2A: 			sub  a
L1F2B: 			ld   a,h
L1F2C: 			rla
L1F2D: 			ld   e,$38
L1F2F: 			rra
L1F30: 			dec  c
L1F31: 			ld   c,$4B
L1F33: 			inc  c
L1F34: 			rrca
L1F35: 			rra
L1F36: 			add  hl,sp
L1F37: 			rra
L1F38: 			ld   h,h
L1F39: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1F3A: 			rst  08
L1F3B: 			dec  de
L1F3C: 			nop
L1F3D: 			ld   a,d
L1F3E: 			dec  de
L1F3F: 			jr   z,$1F49
L1F41: 			add  hl,de
L1F42: 			inc  b
L1F43: 			ld   a,$19
L1F45: 			inc  b
L1F46: 			ld   a,$1E
L1F48: 			ld   d,b
L1F49: 			rra
L1F4A: 			ld   (hl),b
L1F4B: 			.DB   $fd,$1e
L1F4D: 			rra
L1F4E: 			ld   e,c
L1F4F: 			rra
L1F50: 			ld   (hl),b
L1F51: 			dec  c
L1F52: 			rra
L1F53: 			add  hl,de
L1F54: 			ld   d,b
L1F55: 			dec  de
L1F56: 			and  b
L1F57: 			ld   a,h
L1F58: 			inc  b
L1F59: 			inc  h
L1F5A: 			dec  de
L1F5B: 			ld   e,$7C
L1F5D: 			jr   nc,$1F90
L1F5F: 			dec  de
L1F60: 			ld   e,$7C
L1F62: 			inc  (hl)
L1F63: 			rlca
L1F64: 			rlca
L1F65: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L1F66: 			rst  08
L1F67: 			dec  de
L1F68: 			sbc  a,a
L1F69: 			ld   a,h
L1F6A: 			rla
L1F6B: 			ex   af,af'
L1F6C: 			dec  de
L1F6D: 			sbc  a,a
L1F6E: 			ld   a,h
L1F6F: 			inc  (hl)
L1F70: 			dec  de
L1F71: 			and  b
L1F72: 			ld   a,h
L1F73: 			rla
L1F74: 			ld   e,$86
L1F76: 			rra
L1F77: 			dec  de
L1F78: 			ld   b,b
L1F79: 			ld   a,h
L1F7A: 			rla
L1F7B: 			ld   ($1B71),hl
L1F7E: 			ld   b,b
L1F7F: 			ld   a,h
L1F80: 			inc  b
L1F81: 			dec  c
L1F82: 			ld   (hl),c
L1F83: 			rra
L1F84: 			adc  a,a
L1F85: 			rra
L1F86: 			dec  de
L1F87: 			ld   b,b
L1F88: 			ld   a,h
L1F89: 			inc  b
L1F8A: 			dec  de
L1F8B: 			ld   b,l
L1F8C: 			ld   a,h
L1F8D: 			rla
L1F8E: 			ld   (hl),c
L1F8F: 			dec  de
L1F90: 			ld   b,l
L1F91: 			ld   a,h
L1F92: 			inc  (hl)
L1F93: 			inc  bc
L1F94: 			ld   a,(hl)
L1F95: 			ld   hl,$0000
L1F98: 			and  a
L1F99: 			ret  z
L1F9A: 			ld   hl,$01B0
L1F9D: 			bit  7,a
L1F9F: 			jr   z,$1FA4
L1FA1: 			call nz,$1111
L1FA4: 			ret
L1FA5: 			ld   hl,$7E7E
L1FA8: 			ld   a,($7C0A)
L1FAB: 			and  a
L1FAC: 			jr   z,$1FCC
L1FAE: 			ld   a,(hl)
L1FAF: 			and  a
L1FB0: 			jr   nz,$1FBF
L1FB2: 			in   a,($13)
L1FB4: 			neg
L1FB6: 			ld   ($7C59),a
L1FB9: 			ld   a,$03
L1FBB: 			out  ($28),a
L1FBD: 			jr   $1FCA
L1FBF: 			in   a,($13)
L1FC1: 			neg
L1FC3: 			ld   ($7C57),a
L1FC6: 			ld   a,$02
L1FC8: 			out  ($28),a
L1FCA: 			jr   $1FEF
L1FCC: 			ld   a,($7C1B)
L1FCF: 			and  a
L1FD0: 			jr   z,$1FF1
L1FD2: 			ld   a,($7C35)
L1FD5: 			and  a
L1FD6: 			jr   nz,$1FF1
L1FD8: 			ld   a,(hl)
L1FD9: 			and  a
L1FDA: 			jr   nz,$1FE7
L1FDC: 			in   a,($13)
L1FDE: 			ld   ($7C59),a
L1FE1: 			ld   a,$01
L1FE3: 			out  ($28),a
L1FE5: 			jr   $1FEF
L1FE7: 			in   a,($13)
L1FE9: 			ld   ($7C57),a
L1FEC: 			xor  a
L1FED: 			out  ($28),a
L1FEF: 			jr   $2009
L1FF1: 			ld   a,(hl)
L1FF2: 			and  a
L1FF3: 			jr   nz,$2000
L1FF5: 			in   a,($13)
L1FF7: 			ld   ($7C59),a
L1FFA: 			ld   a,$03
L1FFC: 			out  ($28),a
L1FFE: 			jr   $2009
L2000: 			in   a,($13)
L2002: 			ld   ($7C57),a
L2005: 			ld   a,$02
L2007: 			out  ($28),a
L2009: 			ld   a,(hl)
L200A: 			xor  $01
L200C: 			ld   (hl),a
L200D: 			ld   a,($7C34)
L2010: 			and  a
L2011: 			ret  nz
L2012: 			ld   a,($7C47)
L2015: 			and  a
L2016: 			ret  z
L2017: 			ld   a,($7C54)
L201A: 			and  a
L201B: 			ret  nz
L201C: 			ld   hl,$7C57
L201F: 			call $1F94
L2022: 			ld   ($7C75),hl
L2025: 			push hl
L2026: 			ld   hl,$7C59
L2029: 			call $1F94
L202C: 			ld   ($7C77),hl
L202F: 			pop  de
L2030: 			bit  7,h
L2032: 			jr   nz,$204B
L2034: 			xor  a
L2035: 			cp   h
L2036: 			jr   nz,$2046
L2038: 			cp   d
L2039: 			jr   nz,$2046
L203B: 			cp   e
L203C: 			jr   nz,$2046
L203E: 			cp   l
L203F: 			jr   nz,$2046
L2041: 			ld   hl,$0428
L2044: 			jr   $2053
L2046: 			ld   hl,$0028
L2049: 			jr   $204E
L204B: 			ld   hl,$0068
L204E: 			push hl
L204F: 			call $11FB
L2052: 			pop  hl
L2053: 			ld   ($7C72),hl
L2056: 			ret
L2057: 			ld   hl,$7C58
L205A: 			ld   a,($7C57)
L205D: 			bit  7,a
L205F: 			push af
L2060: 			sub  (hl)
L2061: 			ex   af,af'
L2062: 			pop  af
L2063: 			jp   m,$2077
L2066: 			ex   af,af'
L2067: 			jp   m,$2074
L206A: 			add  a,(hl)
L206B: 			ld   (hl),a
L206C: 			cp   $03
L206E: 			jp   c,$2073
L2071: 			ld   a,$03
L2073: 			ld   (hl),a
L2074: 			jp   $207E
L2077: 			ld   a,(hl)
L2078: 			cp   $02
L207A: 			jp   c,$207E
L207D: 			dec  (hl)
L207E: 			ld   a,(hl)
L207F: 			ld   h,a
L2080: 			ld   l,$00
L2082: 			di
L2083: 			ld   ($7C7D),hl
L2086: 			ld   hl,$7C59
L2089: 			ld   de,$0000
L208C: 			ld   a,($7CA2)
L208F: 			cp   $02
L2091: 			jp   nc,$20A7
L2094: 			ld   a,(hl)
L2095: 			and  a
L2096: 			jp   z,$20A7
L2099: 			bit  7,a
L209B: 			jp   nz,$20A4
L209E: 			ld   de,$00C0
L20A1: 			jp   $20A7
L20A4: 			ld   de,$FF40
L20A7: 			ld   ($7C7F),de
L20AB: 			ei
L20AC: 			ret
L20AD: 			nop
L20AE: 			ld   (bc),a
L20AF: 			nop
L20B0: 			djnz $20B2
L20B2: 			jr   nz,$20B4
L20B4: 			jr   nc,$20B6
L20B6: 			ld   b,b
L20B7: 			nop
L20B8: 			ld   (bc),a
L20B9: 			nop
L20BA: 			ex   af,af'
L20BB: 			nop
L20BC: 			djnz $20BE
L20BE: 			ld   d,$00
L20C0: 			jr   $20C2
L20C2: 			inc  h
L20C3: 			nop
L20C4: 			jr   z,$20C6
L20C6: 			ld   l,$00
L20C8: 			scf
L20C9: 			nop
L20CA: 			ld   a,($3F00)
L20CD: 			nop
L20CE: 			ld   b,a
L20CF: 			nop
L20D0: 			ld   c,(hl)
L20D1: 			nop
L20D2: 			jr   z,$20D4
L20D4: 			jr   nz,$20D6
L20D6: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L20D7: 			rst  08
L20D8: 			dec  de
L20D9: 			jp   c,$1B0F
L20DC: 			rrc  a
L20DE: 			dec  de
L20DF: 			ccf
L20E0: 			ld   a,h
L20E1: 			jr   nc,$20FE
L20E3: 			pop  de
L20E4: 			ld   a,h
L20E5: 			jr   nc,$20EA

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L20E7: 			rst  08
L20E8: 			dec  de
L20E9: 			ld   b,d
L20EA: 			ld   a,h
L20EB: 			jr   nc,$2108
L20ED: 			jp   c,$1B0F
L20F0: 			in   a,($0F)
L20F2: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L20F3: 			rst  08
L20F4: 			dec  de
L20F5: 			jp   c,$1B0F
L20F8: 			jp   p,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L20FB: 			rst  08
L20FC: 			dec  de
L20FD: 			ld   (bc),a
L20FE: 			djnz $211B
L2100: 			jp   m,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2103: 			rst  08
L2104: 			dec  de
L2105: 			ld   b,d
L2106: 			ld   a,h
L2107: 			jr   nc,$2124
L2109: 			ld   hl,$1B10
L210C: 			ld   a,(bc)
L210D: 			djnz $2112

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L210F: 			rst  08
L2110: 			dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2111: 			rst  08
L2112: 			ld   a,h
L2113: 			jr   nc,$2130
L2115: 			add  hl,hl
L2116: 			djnz $2133
L2118: 			ld   l,(hl)
L2119: 			rrca
L211A: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L211B: 			rst  08
L211C: 			dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L211D: 			rst  08
L211E: 			ld   a,h
L211F: 			jr   nc,$213C
L2121: 			ld   sp,$1B10
L2124: 			ld   l,(hl)
L2125: 			rrca
L2126: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2127: 			rst  08
L2128: 			dec  de
L2129: 			ld   b,d
L212A: 			ld   a,h
L212B: 			jr   nc,$2148
L212D: 			add  hl,sp
L212E: 			djnz $214B
L2130: 			ld   l,(hl)
L2131: 			rrca
L2132: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2133: 			rst  08
L2134: 			dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2135: 			rst  08
L2136: 			ld   a,h
L2137: 			jr   nc,$2154
L2139: 			adc  a,l
L213A: 			rrca
L213B: 			dec  de
L213C: 			ld   a,$0F
L213E: 			dec  de
L213F: 			ld   b,c
L2140: 			djnz $2145

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2142: 			rst  08
L2143: 			dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2144: 			rst  08
L2145: 			ld   a,h
L2146: 			jr   nc,$2163
L2148: 			adc  a,l
L2149: 			rrca
L214A: 			dec  de
L214B: 			ld   a,$0F
L214D: 			dec  de
L214E: 			ld   c,c
L214F: 			djnz $2154

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2151: 			rst  08
L2152: 			dec  de
L2153: 			ld   b,d
L2154: 			ld   a,h
L2155: 			jr   nc,$2172
L2157: 			adc  a,l
L2158: 			rrca
L2159: 			dec  de
L215A: 			ld   e,c
L215B: 			djnz $2178
L215D: 			ld   d,c
L215E: 			djnz $2163

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2160: 			rst  08
L2161: 			dec  de
L2162: 			adc  a,b
L2163: 			djnz $2180
L2165: 			ld   (hl),b
L2166: 			djnz $2183
L2168: 			jp   c,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L216B: 			rst  08
L216C: 			dec  de
L216D: 			adc  a,b
L216E: 			djnz $218B
L2170: 			ld   a,b
L2171: 			djnz $218E
L2173: 			jp   c,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2176: 			rst  08
L2177: 			dec  de
L2178: 			ld   b,d
L2179: 			ld   a,h
L217A: 			jr   nc,$2197
L217C: 			adc  a,l
L217D: 			rrca
L217E: 			dec  de
L217F: 			add  a,b
L2180: 			djnz $219D
L2182: 			jp   c,$030F

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2185: 			rst  08
L2186: 			dec  de
L2187: 			pop  de
L2188: 			ld   a,h
L2189: 			jr   nc,$21A6
L218B: 			ccf
L218C: 			ld   a,h
L218D: 			jr   nc,$21AA
L218F: 			jp   c,$1B0F
L2192: 			cp   e
L2193: 			rrca
L2194: 			dec  de
L2195: 			jp   c,$030F
L2198: 			rst  10
L2199: 			jr   nz,$2182
L219B: 			jr   nz,$2190
L219D: 			jr   nz,$219A
L219F: 			jr   nz,$21A4
L21A1: 			ld   hl,$210F
L21A4: 			dec  de
L21A5: 			ld   hl,$2127
L21A8: 			inc  sp
L21A9: 			ld   hl,$2142
L21AC: 			ld   d,c
L21AD: 			ld   hl,$2160
L21B0: 			ld   l,e
L21B1: 			ld   hl,$2176
L21B4: 			add  a,l
L21B5: 			ld   hl,$F1D9
L21B8: 			add  a,$05
L21BA: 			ld   ($7C92),a
L21BD: 			pop  af
L21BE: 			add  a,$04
L21C0: 			ld   b,a
L21C1: 			pop  hl
L21C2: 			ld   a,l
L21C3: 			pop  hl
L21C4: 			pop  de
L21C5: 			and  a
L21C6: 			jr   z,$21DA
L21C8: 			cp   $01
L21CA: 			jr   nz,$21D4
L21CC: 			ld   ($7C4E),a
L21CF: 			ld   de,$0500
L21D2: 			jr   $21DA
L21D4: 			ld   ($7C4D),a
L21D7: 			ld   de,$0100
L21DA: 			ld   c,a
L21DB: 			ld   a,d
L21DC: 			cp   $28
L21DE: 			jr   nc,$2227
L21E0: 			ld   a,h
L21E1: 			cp   $0A
L21E3: 			jr   nc,$21F5
L21E5: 			ld   hl,$20D1
L21E8: 			ld   a,c
L21E9: 			call $114C
L21EC: 			ld   h,b
L21ED: 			ld   ($7C8F),hl
L21F0: 			ld   hl,$01C0
L21F3: 			jr   $2227
L21F5: 			cp   $46
L21F7: 			jr   c,$220B
L21F9: 			ld   hl,$20D1
L21FC: 			ld   a,c
L21FD: 			call $114C
L2200: 			ld   a,b
L2201: 			neg
L2203: 			ld   ($7C90),a
L2206: 			ld   hl,$4E00
L2209: 			jr   $2227
L220B: 			ld   a,($7C15)
L220E: 			dec  a
L220F: 			jr   nz,$2214
L2211: 			ld   a,b
L2212: 			jr   $2224
L2214: 			cp   $04
L2216: 			jr   nz,$221D
L2218: 			ld   a,b
L2219: 			neg
L221B: 			jr   $2224
L221D: 			ld   a,b
L221E: 			bit  0,l
L2220: 			jr   nz,$2224
L2222: 			neg
L2224: 			ld   ($7C90),a
L2227: 			ld   ($7E67),hl
L222A: 			ld   ($7E69),de
L222E: 			exx
L222F: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2231: 			rst  08
L2232: 			dec  de
L2233: 			sbc  a,l
L2234: 			ld   a,h
L2235: 			inc  (hl)
L2236: 			dec  de
L2237: 			ld   (hl),$7C
L2239: 			inc  (hl)
L223A: 			dec  de
L223B: 			and  d
L223C: 			ld   a,h
L223D: 			inc  (hl)
L223E: 			dec  de
L223F: 			xor  e
L2240: 			ld   a,h
L2241: 			inc  (hl)
L2242: 			dec  c
L2243: 			ld   c,$76
L2245: 			dec  bc
L2246: 			rrca
L2247: 			dec  de
L2248: 			ld   c,l
L2249: 			ld   a,h
L224A: 			inc  (hl)
L224B: 			add  hl,de
L224C: 			nop
L224D: 			ld   c,$DA
L224F: 			ld   a,h
L2250: 			dec  de
L2251: 			ld   b,e
L2252: 			ld   a,h
L2253: 			ld   (bc),a
L2254: 			dec  de
L2255: 			call $347C
L2258: 			dec  de
L2259: 			xor  a
L225A: 			ld   a,h
L225B: 			inc  (hl)
L225C: 			dec  de
L225D: 			ret  nz
L225E: 			ld   a,h
L225F: 			inc  (hl)
L2260: 			dec  de
L2261: 			ld   a,($347C)
L2264: 			dec  de
L2265: 			ld   c,(hl)
L2266: 			ld   a,h
L2267: 			inc  (hl)
L2268: 			dec  de
L2269: 			push bc
L226A: 			ld   a,h
L226B: 			inc  (hl)
L226C: 			dec  de
L226D: 			dec  d
L226E: 			ld   a,h
L226F: 			rla
L2270: 			ex   af,af'
L2271: 			ld   e,$8A
L2273: 			ld   ($1B07),hl
L2276: 			rrca
L2277: 			ld   a,h
L2278: 			rla
L2279: 			add  hl,de
L227A: 			ld   a,(bc)
L227B: 			ld   e,e
L227C: 			ld   e,h
L227D: 			ld   e,$84
L227F: 			ld   ($1F0D),hl
L2282: 			add  a,l
L2283: 			ld   ($0822),hl
L2286: 			dec  de
L2287: 			jr   c,$2305
L2289: 			inc  b
L228A: 			ld   e,$1D
L228C: 			inc  hl
L228D: 			dec  de
L228E: 			ld   b,a
L228F: 			ld   a,h
L2290: 			jr   nc,$22AB
L2292: 			jr   $22AF
L2294: 			ld   d,d
L2295: 			ld   a,h
L2296: 			inc  b
L2297: 			dec  de
L2298: 			ld   b,d
L2299: 			ld   a,h
L229A: 			jr   nc,$22B5
L229C: 			inc  bc
L229D: 			ex   af,af'
L229E: 			add  hl,de
L229F: 			dec  e
L22A0: 			ld   c,$4E
L22A2: 			ld   a,(hl)
L22A3: 			inc  b
L22A4: 			dec  de
L22A5: 			ld   d,l
L22A6: 			ld   a,h
L22A7: 			inc  b
L22A8: 			dec  de
L22A9: 			ld   d,e
L22AA: 			ld   a,h
L22AB: 			jr   nc,$22C8
L22AD: 			push bc
L22AE: 			ld   a,h
L22AF: 			jr   nc,$22CC
L22B1: 			nop
L22B2: 			jr   nc,$230F
L22B4: 			dec  de
L22B5: 			nop
L22B6: 			rlca
L22B7: 			inc  d
L22B8: 			dec  de
L22B9: 			dec  d
L22BA: 			ld   a,h
L22BB: 			rla
L22BC: 			ld   a,(bc)
L22BD: 			ld   (hl),b
L22BE: 			xor  l
L22BF: 			jr   nz,$22E5
L22C1: 			dec  de
L22C2: 			nop
L22C3: 			rrca
L22C4: 			ld   e,e
L22C5: 			inc  d
L22C6: 			add  hl,de
L22C7: 			ld   a,(bc)
L22C8: 			ld   e,e
L22C9: 			ex   af,af'
L22CA: 			ld   e,$DB
L22CC: 			ld   ($0519),hl
L22CF: 			ld   e,h
L22D0: 			ld   e,$D7
L22D2: 			ld   ($1F0D),hl
L22D5: 			ret  c
L22D6: 			ld   ($1F22),hl
L22D9: 			sbc  a,$22
L22DB: 			add  hl,de
L22DC: 			ld   (bc),a
L22DD: 			inc  d
L22DE: 			dec  de
L22DF: 			rst  38
L22E0: 			dec  b
L22E1: 			ld   e,e
L22E2: 			dec  de
L22E3: 			rst  38
L22E4: 			dec  b
L22E5: 			ld   e,e
L22E6: 			ld   (hl),d
L22E7: 			ld   l,h
L22E8: 			dec  de
L22E9: 			adc  a,l
L22EA: 			rrca
L22EB: 			dec  de
L22EC: 			ld   a,$0F
L22EE: 			add  hl,de
L22EF: 			add  hl,de
L22F0: 			ld   c,$4E
L22F2: 			ld   a,(hl)
L22F3: 			inc  h
L22F4: 			dec  de
L22F5: 			nop
L22F6: 			jr   z,$2354
L22F8: 			ld   e,$04
L22FA: 			inc  hl
L22FB: 			dec  de
L22FC: 			ld   c,(hl)
L22FD: 			rrca
L22FE: 			dec  de
L22FF: 			sbc  a,b
L2300: 			djnz $2321
L2302: 			ld   a,(bc)
L2303: 			inc  hl
L2304: 			dec  de
L2305: 			and  b
L2306: 			djnz $2323
L2308: 			ld   e,(hl)
L2309: 			rrca
L230A: 			dec  de
L230B: 			ld   l,(hl)
L230C: 			rrca
L230D: 			dec  de
L230E: 			inc  (hl)
L230F: 			ld   a,h
L2310: 			rla
L2311: 			ld   e,$1A
L2313: 			inc  hl
L2314: 			add  hl,de
L2315: 			jr   nc,$2332
L2317: 			cp   d
L2318: 			ld   a,h
L2319: 			inc  b
L231A: 			rra
L231B: 			inc  b
L231C: 			inc  h
L231D: 			dec  de
L231E: 			call $307C
L2321: 			add  hl,de
L2322: 			ld   (bc),a
L2323: 			add  hl,de
L2324: 			dec  e
L2325: 			ld   c,$4E
L2327: 			ld   a,(hl)
L2328: 			inc  b
L2329: 			dec  de
L232A: 			ld   b,d
L232B: 			ld   a,h
L232C: 			inc  (hl)
L232D: 			dec  de

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L232E: 			rst  08
L232F: 			ld   a,h
L2330: 			inc  (hl)
L2331: 			dec  de
L2332: 			pop  de
L2333: 			ld   a,h
L2334: 			inc  (hl)
L2335: 			dec  de
L2336: 			dec  d
L2337: 			ld   a,h
L2338: 			rla
L2339: 			ex   af,af'
L233A: 			ld   e,$45
L233C: 			inc  hl
L233D: 			ld   a,(bc)
L233E: 			ex   af,af'
L233F: 			ld   (hl),e
L2340: 			inc  d
L2341: 			add  hl,de
L2342: 			inc  bc
L2343: 			ld   e,e
L2344: 			inc  d
L2345: 			ex   af,af'
L2346: 			dec  de
L2347: 			add  hl,sp
L2348: 			ld   a,h
L2349: 			inc  b
L234A: 			ld   (hl),b
L234B: 			sbc  a,b
L234C: 			ld   hl,$3124
L234F: 			dec  de
L2350: 			add  hl,sp
L2351: 			ld   a,h
L2352: 			rla
L2353: 			add  hl,de
L2354: 			ex   af,af'
L2355: 			ld   e,h
L2356: 			ld   e,$6C
L2358: 			inc  hl
L2359: 			dec  de
L235A: 			ret  nc
L235B: 			ld   a,h
L235C: 			jr   nc,$2379
L235E: 			ld   a,(hl)
L235F: 			rrca
L2360: 			ld   e,a
L2361: 			dec  de
L2362: 			ld   a,$0F
L2364: 			ld   e,a
L2365: 			dec  de
L2366: 			ld   c,(hl)
L2367: 			rrca
L2368: 			ld   e,a
L2369: 			rra
L236A: 			halt
L236B: 			inc  hl
L236C: 			dec  de
L236D: 			ret  nc
L236E: 			ld   a,h
L236F: 			inc  (hl)
L2370: 			dec  de
L2371: 			ld   e,(hl)
L2372: 			rrca
L2373: 			dec  de
L2374: 			ld   l,(hl)
L2375: 			rrca
L2376: 			dec  de
L2377: 			pop  de
L2378: 			ld   a,h
L2379: 			rla
L237A: 			ld   e,$AE
L237C: 			inc  hl
L237D: 			dec  c
L237E: 			ld   c,$E4
L2380: 			ld   a,(bc)
L2381: 			rrca
L2382: 			dec  de
L2383: 			ccf
L2384: 			ld   a,h
L2385: 			jr   nc,$23A0
L2387: 			ld   bc,$9F1B
L238A: 			ld   a,h
L238B: 			inc  b
L238C: 			dec  de
L238D: 			ret  nc
L238E: 			ld   a,h
L238F: 			rla
L2390: 			ld   e,$99
L2392: 			inc  hl
L2393: 			dec  de
L2394: 			nop
L2395: 			ex   af,af'
L2396: 			rra
L2397: 			sbc  a,h
L2398: 			inc  hl
L2399: 			dec  de
L239A: 			nop
L239B: 			ld   c,b
L239C: 			add  hl,de
L239D: 			add  hl,de
L239E: 			ld   c,$4E
L23A0: 			ld   a,(hl)
L23A1: 			ld   (bc),a
L23A2: 			dec  de
L23A3: 			nop
L23A4: 			ld   h,h
L23A5: 			add  hl,de
L23A6: 			dec  de
L23A7: 			ld   c,$4E
L23A9: 			ld   a,(hl)
L23AA: 			ld   (bc),a
L23AB: 			rra
L23AC: 			inc  b
L23AD: 			inc  h
L23AE: 			ld   l,h
L23AF: 			dec  de
L23B0: 			ld   b,d
L23B1: 			ld   a,h
L23B2: 			rla
L23B3: 			ld   e,$DA
L23B5: 			inc  hl
L23B6: 			add  hl,de
L23B7: 			djnz $23D4
L23B9: 			ld   d,d
L23BA: 			ld   a,h
L23BB: 			inc  b
L23BC: 			dec  de
L23BD: 			ld   b,a
L23BE: 			ld   a,h
L23BF: 			jr   nc,$23DC
L23C1: 			ld   d,e
L23C2: 			ld   a,h
L23C3: 			jr   nc,$23DE
L23C5: 			inc  bc
L23C6: 			dec  de
L23C7: 			ld   d,l
L23C8: 			ld   a,h
L23C9: 			inc  b
L23CA: 			dec  de
L23CB: 			inc  (hl)
L23CC: 			ld   a,h
L23CD: 			rla
L23CE: 			ld   e,$D7
L23D0: 			inc  hl
L23D1: 			add  hl,de
L23D2: 			dec  (hl)
L23D3: 			dec  de
L23D4: 			cp   d
L23D5: 			ld   a,h
L23D6: 			inc  b
L23D7: 			rra
L23D8: 			rst  18
L23D9: 			inc  hl
L23DA: 			ld   l,e
L23DB: 			dec  de
L23DC: 			ld   (hl),$7C
L23DE: 			jr   nc,$23FB
L23E0: 			add  hl,sp
L23E1: 			ld   a,h
L23E2: 			rla
L23E3: 			ld   a,(bc)
L23E4: 			ex   af,af'
L23E5: 			ld   (hl),b
L23E6: 			or   a
L23E7: 			jr   nz,$240D
L23E9: 			add  hl,de
L23EA: 			add  hl,de
L23EB: 			ld   c,$4E
L23ED: 			ld   a,(hl)
L23EE: 			ld   (bc),a
L23EF: 			add  hl,de
L23F0: 			ex   af,af'
L23F1: 			ld   h,$1E
L23F3: 			ei
L23F4: 			inc  hl
L23F5: 			dec  de
L23F6: 			nop
L23F7: 			inc  l
L23F8: 			rra
L23F9: 			cp   $23
L23FB: 			dec  de
L23FC: 			nop
L23FD: 			inc  a
L23FE: 			add  hl,de
L23FF: 			dec  de
L2400: 			ld   c,$4E
L2402: 			ld   a,(hl)
L2403: 			ld   (bc),a
L2404: 			add  hl,de
L2405: 			ld   b,$0E
L2407: 			jp   nc,$027D
L240A: 			add  hl,de
L240B: 			ld   b,$0E
L240D: 			or   e
L240E: 			ld   a,l
L240F: 			ld   (bc),a
L2410: 			add  hl,de
L2411: 			ld   b,$0E
L2413: 			sub  h
L2414: 			ld   a,l
L2415: 			ld   (bc),a
L2416: 			add  hl,de
L2417: 			ld   b,$0E
L2419: 			ld   (hl),l
L241A: 			ld   a,l
L241B: 			ld   (bc),a
L241C: 			add  hl,de
L241D: 			ld   b,$0E
L241F: 			ld   d,(hl)
L2420: 			ld   a,l
L2421: 			ld   (bc),a
L2422: 			add  hl,de
L2423: 			ex   af,af'
L2424: 			ld   c,$4E
L2426: 			ld   a,(hl)
L2427: 			inc  (hl)
L2428: 			dec  de
L2429: 			inc  (hl)
L242A: 			rrca
L242B: 			add  hl,de
L242C: 			ld   b,$0E
L242E: 			ld   c,(hl)
L242F: 			ld   a,(hl)
L2430: 			ld   (bc),a
L2431: 			dec  de
L2432: 			jr   z,$243A
L2434: 			dec  de
L2435: 			ld   e,d
L2436: 			ld   a,h
L2437: 			ld   (bc),a
L2438: 			dec  de
L2439: 			nop
L243A: 			jr   z,$2455
L243C: 			dec  bc
L243D: 			ld   c,$4E
L243F: 			ld   a,(hl)
L2440: 			ld   (bc),a
L2441: 			dec  de
L2442: 			nop
L2443: 			xor  l
L2444: 			add  hl,de
L2445: 			rrca
L2446: 			ld   c,$4E
L2448: 			ld   a,(hl)
L2449: 			ld   (bc),a
L244A: 			add  hl,de
L244B: 			ld   de,$560E
L244E: 			ld   a,l
L244F: 			add  hl,de
L2450: 			add  hl,bc
L2451: 			dec  c
L2452: 			dec  d
L2453: 			ex   af,af'
L2454: 			ex   af,af'
L2455: 			rla
L2456: 			add  hl,de
L2457: 			add  a,b
L2458: 			dec  e
L2459: 			inc  hl
L245A: 			add  hl,de
L245B: 			rra
L245C: 			inc  d
L245D: 			jr   $2466
L245F: 			inc  bc
L2460: 			add  a,b
L2461: 			ld   a,$00
L2463: 			ld   h,c
L2464: 			nop
L2465: 			jr   z,$2467
L2467: 			ld   b,a
L2468: 			ret  nz
L2469: 			ld   de,$6300
L246C: 			nop
L246D: 			jr   z,$246F
L246F: 			and  (hl)
L2470: 			res  7,(ix+$11)
L2474: 			ld   a,$01
L2476: 			ld   ($7CA5),a
L2479: 			ret
L247A: 			ld   hl,$0F36
L247D: 			ld   ($7C8C),hl
L2480: 			ret
L2481: 			push ix
L2483: 			pop  hl
L2484: 			ld   ($7C4F),hl
L2487: 			call $1246
L248A: 			ld   a,$01
L248C: 			ld   ($7CC5),a
L248F: 			ld   ($7C51),a
L2492: 			jr   $247A
L2494: 			push ix
L2496: 			pop  hl
L2497: 			ld   ($7CC6),hl
L249A: 			ret
L249B: 			push ix
L249D: 			pop  hl
L249E: 			ld   ($7CC8),hl
L24A1: 			ret
L24A2: 			push ix
L24A4: 			pop  hl
L24A5: 			ld   ($7CCA),hl
L24A8: 			ret
L24A9: 			ld   a,($7E6B)
L24AC: 			call $13B7
L24AF: 			call $1315
L24B2: 			cp   $05
L24B4: 			jp   z,$254F
L24B7: 			and  a
L24B8: 			jp   z,$2548
L24BB: 			xor  a
L24BC: 			ld   ($7CCD),a
L24BF: 			ld   ($7CC5),a
L24C2: 			ld   a,($7C3E)
L24C5: 			and  a
L24C6: 			jr   z,$24D3
L24C8: 			ld   hl,$0528
L24CB: 			ld   ($7C5A),hl
L24CE: 			ld   ($7CD4),a
L24D1: 			jr   $2548
L24D3: 			push hl
L24D4: 			push de
L24D5: 			ld   a,($7C42)
L24D8: 			and  a
L24D9: 			jr   z,$2546
L24DB: 			ld   a,($7C34)
L24DE: 			and  a
L24DF: 			call nz,$13C4
L24E2: 			ld   a,($7C4D)
L24E5: 			and  a
L24E6: 			jr   z,$251A
L24E8: 			ld   ($7CB4),a
L24EB: 			ld   ($7C97),a
L24EE: 			push hl
L24EF: 			ld   hl,$0C4B
L24F2: 			call $0A1F
L24F5: 			pop  hl
L24F6: 			ld   hl,$7D37
L24F9: 			ld   a,($7C4B)
L24FC: 			cp   l
L24FD: 			jr   nz,$2504
L24FF: 			ld   a,$01
L2501: 			ld   ($7CC0),a
L2504: 			ld   a,$05
L2506: 			ld   ($7C9F),a
L2509: 			ld   a,$10
L250B: 			ld   ($7CB9),a
L250E: 			ld   a,$05
L2510: 			ld   ($7CB8),a
L2513: 			xor  a
L2514: 			ld   ($7C4D),a
L2517: 			call $11A5
L251A: 			ld   a,($7C4E)
L251D: 			and  a
L251E: 			jr   z,$2546
L2520: 			ld   hl,($7C8F)
L2523: 			ld   de,($7E59)
L2527: 			add  hl,de
L2528: 			ld   ($7E67),hl
L252B: 			ld   hl,($7E5D)
L252E: 			ld   de,($7C91)
L2532: 			add  hl,de
L2533: 			ld   ($7E69),hl
L2536: 			push hl
L2537: 			ld   hl,$0B94
L253A: 			call $0A1F
L253D: 			pop  hl
L253E: 			xor  a
L253F: 			ld   ($7C4E),a
L2542: 			set  7,(ix+$11)
L2546: 			pop  de
L2547: 			pop  hl
L2548: 			ld   ($7C5D),hl
L254B: 			ld   ($7C5F),de
L254F: 			ld   hl,$7C5A
L2552: 			ld   ($7C8C),hl
L2555: 			ret
L2556: 			ld   a,$04
L2558: 			call $13B7
L255B: 			call $1315
L255E: 			cp   $05
L2560: 			jr   z,$25AE
L2562: 			and  a
L2563: 			jr   z,$25A3
L2565: 			bit  4,(ix+$11)
L2569: 			jr   z,$2585
L256B: 			ld   bc,$0828
L256E: 			ld   ($7CD8),a
L2571: 			ld   a,($7C34)
L2574: 			and  a
L2575: 			jr   z,$257B
L2577: 			ld   a,$04
L2579: 			jr   $257D
L257B: 			ld   a,$1C
L257D: 			ld   ($7CB7),a
L2580: 			ld   ($7C47),a
L2583: 			jr   $2588
L2585: 			ld   bc,$0428
L2588: 			bit  5,(ix+$11)
L258C: 			jr   z,$25A3
L258E: 			ld   a,($7C3D)
L2591: 			dec  a
L2592: 			ld   ($7C3D),a
L2595: 			and  a
L2596: 			jr   nz,$25A3
L2598: 			ld   ($7C4A),a
L259B: 			ld   a,$03
L259D: 			ld   ($7CA4),a
L25A0: 			ld   ($7C3D),a
L25A3: 			ld   ($7C6A),bc
L25A7: 			ld   ($7C6D),hl
L25AA: 			ld   ($7C6F),de
L25AE: 			ld   hl,$7C6A
L25B1: 			ld   ($7C8C),hl
L25B4: 			ret
L25B5: 			bit  5,(ix+$11)
L25B9: 			jr   z,$25C0
L25BB: 			ld   a,$20
L25BD: 			ld   ($7C8E),a
L25C0: 			ld   a,($7C0B)
L25C3: 			bit  0,(ix+$11)
L25C7: 			jr   z,$25CB
L25C9: 			xor  $01
L25CB: 			and  a
L25CC: 			jr   nz,$25D3
L25CE: 			ld   hl,$3600
L25D1: 			jr   $25D6
L25D3: 			ld   hl,$1B00
L25D6: 			ld   de,$9300
L25D9: 			ld   a,$05
L25DB: 			call $1315
L25DE: 			cp   $05
L25E0: 			jr   z,$2628
L25E2: 			and  a
L25E3: 			jr   z,$261D
L25E5: 			ld   bc,$0528
L25E8: 			bit  0,(ix+$11)
L25EC: 			jr   z,$261D
L25EE: 			ld   a,($7CA6)
L25F1: 			dec  a
L25F2: 			ld   ($7CA6),a
L25F5: 			jr   nz,$261D
L25F7: 			ld   a,($7C97)
L25FA: 			and  a
L25FB: 			jr   z,$261D
L25FD: 			push hl
L25FE: 			push ix
L2600: 			pop  hl
L2601: 			ld   a,($7C4B)
L2604: 			cp   l
L2605: 			pop  hl
L2606: 			jr   nz,$261D
L2608: 			ld   a,$01
L260A: 			ld   ($7CD4),a
L260D: 			ld   ($7C3F),a
L2610: 			ld   ($7CB4),a
L2613: 			ld   ($7CB5),a
L2616: 			ld   ($7CA0),a
L2619: 			xor  a
L261A: 			ld   ($7C97),a
L261D: 			ld   ($7C82),bc
L2621: 			ld   ($7C87),de
L2625: 			ld   ($7C85),hl
L2628: 			ld   hl,$7C82
L262B: 			ld   ($7C8C),hl
L262E: 			ret
L262F: 			ld   b,(ix+$12)
L2632: 			ld   a,($7CAB)
L2635: 			and  a
L2636: 			jr   z,$265C
L2638: 			push ix
L263A: 			pop  hl
L263B: 			ld   a,($7CDA)
L263E: 			cp   l
L263F: 			jr   z,$265C
L2641: 			ld   de,$001F
L2644: 			and  a
L2645: 			sbc  hl,de
L2647: 			push hl
L2648: 			pop  iy
L264A: 			ld   a,(iy+$12)
L264D: 			dec  a
L264E: 			cp   b
L264F: 			jr   nz,$265C
L2651: 			bit  6,(iy+$11)
L2655: 			jr   z,$265C
L2657: 			ld   a,$02
L2659: 			ld   (ix+$1e),a
L265C: 			ld   d,(ix+$1e)
L265F: 			ld   c,(ix+$1d)
L2662: 			ld   a,($7C97)
L2665: 			and  a
L2666: 			jr   nz,$2691
L2668: 			bit  1,d
L266A: 			jr   z,$2681
L266C: 			bit  0,d
L266E: 			jr   z,$2676
L2670: 			ld   a,c
L2671: 			and  a
L2672: 			jr   nz,$26C7
L2674: 			jr   $2698
L2676: 			ld   a,c
L2677: 			and  a
L2678: 			jr   z,$26B4
L267A: 			xor  a
L267B: 			ld   (ix+$1d),a
L267E: 			dec  b
L267F: 			jr   $269D
L2681: 			ld   a,($7CD7)
L2684: 			and  a
L2685: 			jr   z,$26A3
L2687: 			ld   a,c
L2688: 			and  a
L2689: 			jr   z,$2698
L268B: 			bit  2,(ix+$11)
L268F: 			jr   z,$26C7
L2691: 			ld   a,$03
L2693: 			call $117C
L2696: 			jr   $26C7
L2698: 			ld   a,$01
L269A: 			ld   (ix+$1d),a
L269D: 			res  3,(ix+$11)
L26A1: 			jr   $26C7
L26A3: 			ld   a,($7C3A)
L26A6: 			and  a
L26A7: 			jr   z,$26B0
L26A9: 			ld   a,$02
L26AB: 			ld   (ix+$1e),a
L26AE: 			jr   $2676
L26B0: 			ld   a,c
L26B1: 			and  a
L26B2: 			jr   nz,$267A
L26B4: 			dec  b
L26B5: 			bit  6,(ix+$11)
L26B9: 			jr   z,$26C7
L26BB: 			ld   a,($7CAB)
L26BE: 			and  a
L26BF: 			jr   z,$2735
L26C1: 			res  7,(ix+$11)
L26C5: 			jr   $2735
L26C7: 			ld   a,b
L26C8: 			push bc
L26C9: 			ld   hl,$2460
L26CC: 			sla  a
L26CE: 			call $114C
L26D1: 			push de
L26D2: 			inc  hl
L26D3: 			inc  hl
L26D4: 			ld   e,(hl)
L26D5: 			inc  hl
L26D6: 			ld   d,(hl)
L26D7: 			ld   a,$04
L26D9: 			pop  hl
L26DA: 			call $1315
L26DD: 			cp   $05
L26DF: 			jr   z,$2759
L26E1: 			and  a
L26E2: 			jr   z,$274A
L26E4: 			set  6,(ix+$11)
L26E8: 			res  2,(ix+$11)
L26EC: 			res  1,(ix+$1e)
L26F0: 			pop  bc
L26F1: 			push bc
L26F2: 			xor  a
L26F3: 			ld   (ix+$1d),a
L26F6: 			ld   a,(ix+$12)
L26F9: 			cp   b
L26FA: 			jr   nz,$2719
L26FC: 			inc  a
L26FD: 			cp   $04
L26FF: 			jr   nz,$2716
L2701: 			ld   ($7CCC),a
L2704: 			pop  af
L2705: 			ld   a,($7CA6)
L2708: 			inc  a
L2709: 			ld   ($7CA6),a
L270C: 			set  7,(ix+$11)
L2710: 			ld   bc,$0428
L2713: 			jp   $261D
L2716: 			ld   (ix+$12),a
L2719: 			ld   a,($7C97)
L271C: 			and  a
L271D: 			jr   nz,$2731
L271F: 			ld   a,($7C47)
L2722: 			and  a
L2723: 			jr   z,$2735
L2725: 			ld   a,($7C36)
L2728: 			and  a
L2729: 			jr   nz,$2735
L272B: 			ld   a,($7CAB)
L272E: 			and  a
L272F: 			jr   nz,$2735
L2731: 			set  7,(ix+$11)
L2735: 			ld   bc,$0A28
L2738: 			ld   a,(ix+$0c)
L273B: 			cp   $19
L273D: 			jr   nc,$2742
L273F: 			ld   bc,$0A68
L2742: 			ld   hl,$0000
L2745: 			ld   de,$0000
L2748: 			jr   $274E
L274A: 			res  6,(ix+$11)
L274E: 			ld   ($7C62),bc
L2752: 			ld   ($7C65),hl
L2755: 			ld   ($7C67),de
L2759: 			pop  af
L275A: 			ld   hl,$7C62
L275D: 			ld   ($7C8C),hl
L2760: 			ret
L2761: 			ld   a,($7C73)
L2764: 			cp   $04
L2766: 			jr   nz,$276C
L2768: 			res  7,(ix+$11)
L276C: 			ld   hl,$7C72
L276F: 			ld   ($7C8C),hl
L2772: 			ret
L2773: 			call $2481
L2776: 			ld   a,($7C3C)
L2779: 			cp   $05
L277B: 			ret  z
L277C: 			xor  a
L277D: 			ld   ($7C51),a
L2780: 			ld   a,$20
L2782: 			ld   ($7C9E),a
L2785: 			jp   $247A
L2788: 			ld   hl,$7C7A
L278B: 			ld   ($7C8C),hl
L278E: 			ret
L278F: 			sub  h
L2790: 			inc  h
L2791: 			sbc  a,e
L2792: 			inc  h
L2793: 			and  d
L2794: 			inc  h
L2795: 			ld   h,c
L2796: 			daa
L2797: 			adc  a,b
L2798: 			daa
L2799: 			ld   d,(hl)
L279A: 			dec  h
L279B: 			cpl
L279C: 			ld   h,$B5
L279E: 			dec  h
L279F: 			xor  c
L27A0: 			inc  h
L27A1: 			add  a,c
L27A2: 			inc  h
L27A3: 			ld   (hl),b
L27A4: 			inc  h
L27A5: 			ld   (hl),e
L27A6: 			daa
L27A7: 			ld   a,d
L27A8: 			inc  h
L27A9: 			ld   a,(hl)
L27AA: 			cp   $28
L27AC: 			jr   nc,$27C3
L27AE: 			dec  a
L27AF: 			dec  a
L27B0: 			inc  hl
L27B1: 			ld   ($7C8C),hl
L27B4: 			ld   hl,$278F
L27B7: 			call $114C
L27BA: 			ld   hl,$27C0
L27BD: 			push hl
L27BE: 			ex   de,hl
L27BF: 			jp   (hl)
L27C0: 			ld   hl,($7C8C)
L27C3: 			ret
L27C4: 			ld   a,(hl)
L27C5: 			ld   (ix+$00),a
L27C8: 			inc  hl
L27C9: 			ld   a,(hl)
L27CA: 			push hl
L27CB: 			ld   hl,$0943
L27CE: 			call $114C
L27D1: 			ld   (ix+$03),d
L27D4: 			ld   (ix+$02),e
L27D7: 			pop  hl
L27D8: 			inc  hl
L27D9: 			ret
L27DA: 			ld   h,(ix+$03)
L27DD: 			ld   l,(ix+$02)
L27E0: 			ld   a,(ix+$15)
L27E3: 			call $114C
L27E6: 			ld   (ix+$05),d
L27E9: 			ld   (ix+$04),e
L27EC: 			ret
L27ED: 			ld   h,(ix+$07)
L27F0: 			ld   l,(ix+$06)
L27F3: 			call $27A9
L27F6: 			ld   a,($7CA5)
L27F9: 			and  a
L27FA: 			jr   z,$2809
L27FC: 			inc  hl
L27FD: 			inc  hl
L27FE: 			xor  a
L27FF: 			ld   ($7CA5),a
L2802: 			inc  hl
L2803: 			inc  hl
L2804: 			inc  hl
L2805: 			inc  hl
L2806: 			inc  hl
L2807: 			jr   $2825
L2809: 			call $27C4
L280C: 			ld   a,(hl)
L280D: 			ld   (ix+$08),a
L2810: 			inc  hl
L2811: 			ld   a,(hl)
L2812: 			ld   (ix+$0d),a
L2815: 			inc  hl
L2816: 			ld   a,(hl)
L2817: 			ld   (ix+$0e),a
L281A: 			inc  hl
L281B: 			ld   a,(hl)
L281C: 			ld   (ix+$09),a
L281F: 			inc  hl
L2820: 			ld   a,(hl)
L2821: 			ld   (ix+$0a),a
L2824: 			inc  hl
L2825: 			ld   (ix+$07),h
L2828: 			ld   (ix+$06),l
L282B: 			ret
L282C: 			ld   hl,$0503
L282F: 			ld   a,($7CD3)
L2832: 			and  a
L2833: 			jr   nz,$283E
L2835: 			bit  4,(ix+$11)
L2839: 			jr   z,$283E
L283B: 			ld   hl,$1812
L283E: 			ld   a,(ix+$01)
L2841: 			inc  a
L2842: 			cp   h
L2843: 			jr   c,$2846
L2845: 			xor  a
L2846: 			ld   (ix+$01),a
L2849: 			cp   l
L284A: 			jr   nc,$284F
L284C: 			xor  a
L284D: 			jr   $2851
L284F: 			ld   a,$01
L2851: 			ld   h,(ix+$05)
L2854: 			ld   l,(ix+$04)
L2857: 			call $114C
L285A: 			ld   (ix+$14),d
L285D: 			ld   (ix+$13),e
L2860: 			ret
L2861: 			push bc
L2862: 			push ix
L2864: 			ld   ix,($7C93)
L2868: 			ld   a,(ix+$08)
L286B: 			and  a
L286C: 			jr   nz,$2873
L286E: 			call $27ED
L2871: 			jr   $287D
L2873: 			cp   $FF
L2875: 			jr   nz,$2879
L2877: 			jr   $287D
L2879: 			dec  a
L287A: 			ld   (ix+$08),a
L287D: 			call $27DA
L2880: 			call $282C
L2883: 			pop  ix
L2885: 			pop  bc
L2886: 			ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2887: 			rst  08
L2888: 			dec  de
L2889: 			nop
L288A: 			ld   e,$19
L288C: 			add  hl,de
L288D: 			ld   c,$B3
L288F: 			ld   a,l
L2890: 			ld   (bc),a
L2891: 			dec  de
L2892: 			nop
L2893: 			ld   c,b
L2894: 			add  hl,de
L2895: 			dec  de
L2896: 			ld   c,$B3
L2898: 			ld   a,l
L2899: 			ld   (bc),a
L289A: 			dec  de
L289B: 			nop
L289C: 			ld   a,($1919)
L289F: 			ld   c,$75
L28A1: 			ld   a,l
L28A2: 			ld   (bc),a
L28A3: 			dec  de
L28A4: 			nop
L28A5: 			ld   e,e
L28A6: 			add  hl,de
L28A7: 			dec  de
L28A8: 			ld   c,$75
L28AA: 			ld   a,l
L28AB: 			ld   (bc),a
L28AC: 			dec  de
L28AD: 			nop
L28AE: 			inc  d
L28AF: 			add  hl,de
L28B0: 			add  hl,de
L28B1: 			ld   c,$D2
L28B3: 			ld   a,l
L28B4: 			ld   (bc),a
L28B5: 			dec  de
L28B6: 			nop
L28B7: 			ld   e,e
L28B8: 			add  hl,de
L28B9: 			dec  de
L28BA: 			ld   c,$D2
L28BC: 			ld   a,l
L28BD: 			ld   (bc),a
L28BE: 			dec  de
L28BF: 			nop
L28C0: 			ld   ($1919),a
L28C3: 			ld   c,$94
L28C5: 			ld   a,l
L28C6: 			ld   (bc),a
L28C7: 			dec  de
L28C8: 			nop
L28C9: 			ld   c,b
L28CA: 			add  hl,de
L28CB: 			dec  de
L28CC: 			ld   c,$94
L28CE: 			ld   a,l
L28CF: 			ld   (bc),a
L28D0: 			dec  de
L28D1: 			nop
L28D2: 			jr   z,$28ED
L28D4: 			add  hl,de
L28D5: 			ld   c,$56
L28D7: 			ld   a,l
L28D8: 			ld   (bc),a
L28D9: 			dec  de
L28DA: 			nop
L28DB: 			ld   h,c
L28DC: 			add  hl,de
L28DD: 			dec  de
L28DE: 			ld   c,$56
L28E0: 			ld   a,l
L28E1: 			ld   (bc),a
L28E2: 			dec  de
L28E3: 			nop
L28E4: 			inc  d
L28E5: 			add  hl,de
L28E6: 			add  hl,de
L28E7: 			ld   c,$F1
L28E9: 			ld   a,l
L28EA: 			ld   (bc),a
L28EB: 			dec  de
L28EC: 			nop
L28ED: 			ld   hl,($1B19)
L28F0: 			ld   c,$F1
L28F2: 			ld   a,l
L28F3: 			ld   (bc),a
L28F4: 			dec  de
L28F5: 			nop
L28F6: 			inc  a
L28F7: 			add  hl,de
L28F8: 			add  hl,de
L28F9: 			ld   c,$2F
L28FB: 			ld   a,(hl)
L28FC: 			ld   (bc),a
L28FD: 			dec  de
L28FE: 			nop
L28FF: 			ld   hl,($1B19)
L2902: 			ld   c,$2F
L2904: 			ld   a,(hl)
L2905: 			ld   (bc),a
L2906: 			dec  de
L2907: 			nop
L2908: 			jr   z,$2923
L290A: 			add  hl,de
L290B: 			ld   c,$10
L290D: 			ld   a,(hl)
L290E: 			ld   (bc),a
L290F: 			dec  de
L2910: 			nop
L2911: 			ld   d,$19
L2913: 			dec  de
L2914: 			ld   c,$10
L2916: 			ld   a,(hl)
L2917: 			ld   (bc),a
L2918: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2919: 			rst  08
L291A: 			add  hl,de
L291B: 			nop
L291C: 			ld   c,$DA
L291E: 			ld   a,h
L291F: 			add  hl,de
L2920: 			inc  b
L2921: 			dec  c
L2922: 			dec  d
L2923: 			ex   af,af'
L2924: 			ex   af,af'
L2925: 			ex   af,af'
L2926: 			ex   af,af'
L2927: 			ex   af,af'
L2928: 			add  hl,de
L2929: 			jr   z,$294E
L292B: 			add  hl,de
L292C: 			inc  c
L292D: 			inc  d
L292E: 			add  hl,de
L292F: 			dec  h
L2930: 			inc  hl
L2931: 			add  hl,de
L2932: 			djnz $2948
L2934: 			add  hl,de
L2935: 			xor  b
L2936: 			inc  hl
L2937: 			add  hl,de
L2938: 			ld   de,$2214
L293B: 			inc  hl
L293C: 			add  hl,de
L293D: 			inc  de
L293E: 			inc  d
L293F: 			dec  de
L2940: 			xor  h
L2941: 			inc  b
L2942: 			ld   h,l
L2943: 			add  hl,de
L2944: 			rra
L2945: 			inc  d
L2946: 			jr   $2961
L2948: 			ex   af,af'
L2949: 			dec  c
L294A: 			dec  d
L294B: 			ex   af,af'
L294C: 			ex   af,af'
L294D: 			ex   af,af'
L294E: 			ex   af,af'
L294F: 			add  hl,de
L2950: 			jr   z,$2975
L2952: 			add  hl,de
L2953: 			inc  c
L2954: 			inc  d
L2955: 			dec  de
L2956: 			dec  bc
L2957: 			ld   a,h
L2958: 			rla
L2959: 			ld   e,$61
L295B: 			add  hl,hl
L295C: 			add  hl,de
L295D: 			dec  de
L295E: 			rra
L295F: 			ld   h,e
L2960: 			add  hl,hl
L2961: 			add  hl,de
L2962: 			ld   (hl),$23
L2964: 			add  hl,de
L2965: 			djnz $297B
L2967: 			add  hl,de
L2968: 			sub  e
L2969: 			inc  hl
L296A: 			add  hl,de
L296B: 			inc  de
L296C: 			inc  d
L296D: 			dec  de
L296E: 			xor  h
L296F: 			inc  b
L2970: 			ld   h,l
L2971: 			add  hl,de
L2972: 			rra
L2973: 			inc  d
L2974: 			jr   $297D
L2976: 			add  hl,de
L2977: 			jr   z,$2992
L2979: 			nop
L297A: 			ld   c,$4E
L297C: 			ld   a,(hl)
L297D: 			ld   (bc),a
L297E: 			dec  de
L297F: 			xor  h
L2980: 			inc  b
L2981: 			add  hl,de
L2982: 			inc  de
L2983: 			ld   c,$4E
L2985: 			ld   a,(hl)
L2986: 			ld   (bc),a
L2987: 			add  hl,de
L2988: 			ld   (bc),a
L2989: 			add  hl,de
L298A: 			ld   de,$4E0E
L298D: 			ld   a,(hl)
L298E: 			inc  b
L298F: 			add  hl,de
L2990: 			djnz $29AB
L2992: 			ld   de,$560E
L2995: 			ld   a,l
L2996: 			inc  b
L2997: 			add  hl,de
L2998: 			jr   nz,$29B3
L299A: 			ld   de,$2F0E
L299D: 			ld   a,(hl)
L299E: 			inc  b
L299F: 			add  hl,de
L29A0: 			jr   nz,$29BB
L29A2: 			ld   de,$F10E
L29A5: 			ld   a,l
L29A6: 			inc  b
L29A7: 			add  hl,de
L29A8: 			jr   nz,$29C3
L29AA: 			ld   de,$100E
L29AD: 			ld   a,(hl)
L29AE: 			inc  b
L29AF: 			add  hl,de
L29B0: 			inc  bc
L29B1: 			dec  de
L29B2: 			dec  a
L29B3: 			ld   a,h
L29B4: 			inc  b
L29B5: 			add  hl,de
L29B6: 			rlca
L29B7: 			dec  de
L29B8: 			ld   (hl),c
L29B9: 			ld   a,h
L29BA: 			inc  b
L29BB: 			add  hl,de
L29BC: 			ld   b,$1B
L29BE: 			add  a,c
L29BF: 			ld   a,h
L29C0: 			inc  b
L29C1: 			add  hl,de
L29C2: 			dec  b
L29C3: 			dec  de
L29C4: 			ld   a,c
L29C5: 			ld   a,h
L29C6: 			inc  b
L29C7: 			add  hl,de
L29C8: 			add  hl,bc
L29C9: 			dec  de
L29CA: 			adc  a,c
L29CB: 			ld   a,h
L29CC: 			inc  b
L29CD: 			add  hl,de
L29CE: 			ex   af,af'
L29CF: 			dec  de
L29D0: 			ld   l,c
L29D1: 			ld   a,h
L29D2: 			inc  b
L29D3: 			add  hl,de
L29D4: 			ld   a,(bc)
L29D5: 			dec  de
L29D6: 			ld   h,c
L29D7: 			ld   a,h
L29D8: 			inc  b
L29D9: 			dec  de
L29DA: 			jr   z,$29E1
L29DC: 			dec  de
L29DD: 			ld   h,d
L29DE: 			ld   a,h
L29DF: 			ld   (bc),a
L29E0: 			dec  de
L29E1: 			jr   z,$29E7
L29E3: 			dec  de
L29E4: 			ld   (hl),d
L29E5: 			ld   a,h
L29E6: 			ld   (bc),a
L29E7: 			dec  de
L29E8: 			jr   z,$29EF
L29EA: 			dec  de
L29EB: 			ld   a,d
L29EC: 			ld   a,h
L29ED: 			ld   (bc),a
L29EE: 			dec  de
L29EF: 			jr   z,$29F7
L29F1: 			dec  de
L29F2: 			ld   e,d
L29F3: 			ld   a,h
L29F4: 			ld   (bc),a
L29F5: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L29F6: 			rst  08
L29F7: 			add  hl,de
L29F8: 			nop
L29F9: 			ld   c,$56
L29FB: 			ld   a,l
L29FC: 			add  hl,de
L29FD: 			ex   af,af'
L29FE: 			dec  c
L29FF: 			dec  d
L2A00: 			ex   af,af'
L2A01: 			ex   af,af'
L2A02: 			add  hl,de
L2A03: 			ld   b,$14
L2A05: 			dec  de
L2A06: 			ld   ($650F),hl
L2A09: 			add  hl,de
L2A0A: 			ld   de,$0814
L2A0D: 			rla
L2A0E: 			add  hl,de
L2A0F: 			add  a,b
L2A10: 			dec  e
L2A11: 			add  hl,de
L2A12: 			rst  30
L2A13: 			ld   a,(de)
L2A14: 			inc  hl
L2A15: 			add  hl,de
L2A16: 			rra
L2A17: 			inc  d
L2A18: 			jr   $2A21
L2A1A: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2A1B: 			rst  08
L2A1C: 			dec  de
L2A1D: 			inc  l
L2A1E: 			rrca
L2A1F: 			add  hl,de
L2A20: 			ld   b,$0E
L2A22: 			ld   d,(hl)
L2A23: 			ld   a,l
L2A24: 			ld   (bc),a
L2A25: 			dec  de
L2A26: 			inc  h
L2A27: 			rrca
L2A28: 			add  hl,de
L2A29: 			ld   b,$0E
L2A2B: 			ld   (hl),l
L2A2C: 			ld   a,l
L2A2D: 			ld   (bc),a
L2A2E: 			dec  de
L2A2F: 			inc  h
L2A30: 			rrca
L2A31: 			add  hl,de
L2A32: 			ld   b,$0E
L2A34: 			sub  h
L2A35: 			ld   a,l
L2A36: 			ld   (bc),a
L2A37: 			dec  de
L2A38: 			inc  h
L2A39: 			rrca
L2A3A: 			add  hl,de
L2A3B: 			ld   b,$0E
L2A3D: 			jp   nc,$027D
L2A40: 			dec  de
L2A41: 			inc  h
L2A42: 			rrca
L2A43: 			add  hl,de
L2A44: 			ld   b,$0E
L2A46: 			or   e
L2A47: 			ld   a,l
L2A48: 			ld   (bc),a
L2A49: 			dec  de
L2A4A: 			jr   nz,$2A5B
L2A4C: 			add  hl,de
L2A4D: 			ld   b,$0E
L2A4F: 			jp   c,$027C
L2A52: 			dec  de
L2A53: 			jr   nz,$2A64
L2A55: 			add  hl,de
L2A56: 			ld   b,$0E
L2A58: 			ld   sp,hl
L2A59: 			ld   a,h
L2A5A: 			ld   (bc),a
L2A5B: 			dec  de
L2A5C: 			jr   nz,$2A6D
L2A5E: 			add  hl,de
L2A5F: 			ld   b,$0E
L2A61: 			jr   $2AE0
L2A63: 			ld   (bc),a
L2A64: 			dec  de
L2A65: 			jr   nz,$2A76
L2A67: 			add  hl,de
L2A68: 			ld   b,$0E
L2A6A: 			scf
L2A6B: 			ld   a,l
L2A6C: 			ld   (bc),a
L2A6D: 			dec  de
L2A6E: 			ld   a,d
L2A6F: 			ld   a,h
L2A70: 			add  hl,de
L2A71: 			ld   b,$0E
L2A73: 			ld   c,(hl)
L2A74: 			ld   a,(hl)
L2A75: 			ld   (bc),a
L2A76: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2A77: 			rst  08
L2A78: 			ld   (hl),h
L2A79: 			dec  de
L2A7A: 			ld   c,d
L2A7B: 			ld   a,h
L2A7C: 			jr   nc,$2A81

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2A7E: 			rst  08
L2A7F: 			ld   (hl),l
L2A80: 			halt
L2A81: 			ld   (hl),a
L2A82: 			inc  bc
L2A83: 			nop
L2A84: 			nop
L2A85: 			ld   b,b
L2A86: 			nop
L2A87: 			ld   b,b
L2A88: 			nop
L2A89: 			ld   b,b
L2A8A: 			nop
L2A8B: 			nop
L2A8C: 			nop
L2A8D: 			nop
L2A8E: 			nop
L2A8F: 			nop
L2A90: 			nop
L2A91: 			nop
L2A92: 			nop
L2A93: 			ret  nz
L2A94: 			rst  38
L2A95: 			ret  nz
L2A96: 			rst  38
L2A97: 			ret  nz
L2A98: 			rst  38
L2A99: 			nop
L2A9A: 			nop
L2A9B: 			nop
L2A9C: 			nop
L2A9D: 			ld   a,($7CCD)
L2AA0: 			and  a
L2AA1: 			ret  z
L2AA2: 			ld   a,($7CCE)
L2AA5: 			inc  a
L2AA6: 			cp   $0D
L2AA8: 			jr   c,$2AAB
L2AAA: 			xor  a
L2AAB: 			ld   ($7CCE),a
L2AAE: 			push hl
L2AAF: 			ld   hl,$2A83
L2AB2: 			call $114C
L2AB5: 			ld   a,(ix+$0c)
L2AB8: 			cp   $A0
L2ABA: 			call c,$1119
L2ABD: 			pop  hl
L2ABE: 			add  hl,de
L2ABF: 			ret
L2AC0: 			ld   hl,$7CC1
L2AC3: 			call $1121
L2AC6: 			and  a
L2AC7: 			jr   z,$2ACC
L2AC9: 			ld   ($7CC3),a
L2ACC: 			ld   hl,$7CA0
L2ACF: 			call $1121
L2AD2: 			and  a
L2AD3: 			jr   z,$2ADE
L2AD5: 			ld   ($7C45),a
L2AD8: 			ld   a,($7C40)
L2ADB: 			ld   ($7C9F),a
L2ADE: 			ld   hl,$7C8E
L2AE1: 			call $1121
L2AE4: 			and  a
L2AE5: 			jr   z,$2AEA
L2AE7: 			ld   ($7CA7),a
L2AEA: 			ld   hl,$7C9E
L2AED: 			call $1121
L2AF0: 			and  a
L2AF1: 			jr   z,$2AF6
L2AF3: 			ld   ($7C51),a
L2AF6: 			ld   hl,$7CBA
L2AF9: 			call $1121
L2AFC: 			and  a
L2AFD: 			call nz,$13C4
L2B00: 			ei
L2B01: 			ld   hl,$7CB2
L2B04: 			call $1121
L2B07: 			and  a
L2B08: 			call nz,$12B0
L2B0B: 			ld   hl,$7C52
L2B0E: 			call $1121
L2B11: 			and  a
L2B12: 			call nz,$1BE2
L2B15: 			ld   hl,$7C37
L2B18: 			call $1121
L2B1B: 			and  a
L2B1C: 			call nz,$1189
L2B1F: 			ld   hl,$7C53
L2B22: 			call $1121
L2B25: 			and  a
L2B26: 			call nz,$1414
L2B29: 			ret
L2B2A: 			ld   e,$00
L2B2C: 			ld   h,(ix+$10)
L2B2F: 			ld   a,$54
L2B31: 			cp   h
L2B32: 			jr   nc,$2B41
L2B34: 			ld   a,$84
L2B36: 			cp   h
L2B37: 			jr   nc,$2B3D
L2B39: 			ld   d,$00
L2B3B: 			jr   $2B3F
L2B3D: 			ld   d,$01
L2B3F: 			jr   $2B55
L2B41: 			ld   a,$3A
L2B43: 			cp   h
L2B44: 			jr   nc,$2B4A
L2B46: 			ld   d,$02
L2B48: 			jr   $2B55
L2B4A: 			ld   a,$1F
L2B4C: 			cp   h
L2B4D: 			jr   nc,$2B53
L2B4F: 			ld   d,$03
L2B51: 			jr   $2B55
L2B53: 			ld   d,$04
L2B55: 			ld   a,(ix+$15)
L2B58: 			cp   d
L2B59: 			ld   (ix+$15),d
L2B5C: 			jr   z,$2B62
L2B5E: 			set  2,(ix+$11)
L2B62: 			ret
L2B63: 			ld   bc,$C001
L2B66: 			ld   de,$4E01
L2B69: 			ld   a,($7C4A)
L2B6C: 			and  a
L2B6D: 			jr   nz,$2B7B
L2B6F: 			bit  5,(ix+$11)
L2B73: 			jr   z,$2B7B
L2B75: 			ld   bc,$4009
L2B78: 			ld   de,$4D02
L2B7B: 			push de
L2B7C: 			ld   d,(ix+$0c)
L2B7F: 			ld   e,(ix+$0b)
L2B82: 			ld   h,(ix+$0a)
L2B85: 			ld   l,(ix+$09)
L2B88: 			bit  7,h
L2B8A: 			push af
L2B8B: 			call nz,$1111
L2B8E: 			srl  h
L2B90: 			rr   l
L2B92: 			srl  h
L2B94: 			rr   l
L2B96: 			pop  af
L2B97: 			call nz,$1111
L2B9A: 			add  hl,de
L2B9B: 			bit  1,(ix+$11)
L2B9F: 			call nz,$2A9D
L2BA2: 			pop  de
L2BA3: 			ld   a,e
L2BA4: 			cp   h
L2BA5: 			jr   c,$2BAA
L2BA7: 			ld   h,a
L2BA8: 			jr   $2BAF
L2BAA: 			ld   a,d
L2BAB: 			cp   h
L2BAC: 			jr   nc,$2BAF
L2BAE: 			ld   h,a
L2BAF: 			ld   (ix+$0c),h
L2BB2: 			ld   (ix+$0b),l
L2BB5: 			ld   h,(ix+$10)
L2BB8: 			ld   l,(ix+$0f)
L2BBB: 			ld   d,(ix+$0e)
L2BBE: 			ld   e,(ix+$0d)
L2BC1: 			add  hl,de
L2BC2: 			ld   a,c
L2BC3: 			cp   h
L2BC4: 			jr   c,$2BC9
L2BC6: 			ld   h,a
L2BC7: 			jr   $2BCE
L2BC9: 			ld   a,b
L2BCA: 			cp   h
L2BCB: 			jr   nc,$2BCE
L2BCD: 			ld   h,a
L2BCE: 			ld   (ix+$10),h
L2BD1: 			ld   (ix+$0f),l
L2BD4: 			ret
L2BD5: 			and  d
L2BD6: 			ld   c,$96
L2BD8: 			ld   b,$A3
L2BDA: 			dec  c
L2BDB: 			sbc  a,b
L2BDC: 			dec  c
L2BDD: 			and  a
L2BDE: 			add  hl,bc
L2BDF: 			sbc  a,b
L2BE0: 			rrca
L2BE1: 			xor  h
L2BE2: 			ex   af,af'
L2BE3: 			sbc  a,b
L2BE4: 			djnz $2B95
L2BE6: 			add  hl,bc
L2BE7: 			sbc  a,b
L2BE8: 			rrca
L2BE9: 			xor  a
L2BEA: 			dec  c
L2BEB: 			sbc  a,b
L2BEC: 			dec  c
L2BED: 			ld   a,(hl)
L2BEE: 			sla  a
L2BF0: 			ld   hl,$2BD5
L2BF3: 			call $114C
L2BF6: 			ld   a,($7E5E)
L2BF9: 			sub  e
L2BFA: 			cp   d
L2BFB: 			ret  nc
L2BFC: 			inc  hl
L2BFD: 			inc  hl
L2BFE: 			push hl
L2BFF: 			ld   hl,($7E59)
L2C02: 			call $1192
L2C05: 			ld   a,h
L2C06: 			pop  hl
L2C07: 			sub  (hl)
L2C08: 			inc  hl
L2C09: 			cp   (hl)
L2C0A: 			ret  nc
L2C0B: 			ld   a,($7CD3)
L2C0E: 			and  a
L2C0F: 			ret  nz
L2C10: 			inc  a
L2C11: 			ld   ($7CD2),a
L2C14: 			ld   ($7C3B),a
L2C17: 			call $1246
L2C1A: 			ret
L2C1B: 			adc  a,c
L2C1C: 			rlca
L2C1D: 			ld   d,l
L2C1E: 			rlca
L2C1F: 			ld   (hl),e
L2C20: 			rlca
L2C21: 			ld   c,l
L2C22: 			rlca
L2C23: 			and  e
L2C24: 			rlca
L2C25: 			cp   c
L2C26: 			rlca
L2C27: 			rst  10
L2C28: 			rlca
L2C29: 			push hl
L2C2A: 			ld   a,(hl)
L2C2B: 			ld   hl,$2C1B
L2C2E: 			call $114C
L2C31: 			push de
L2C32: 			pop  iy
L2C34: 			ld   de,$2600
L2C37: 			ld   hl,$AF00
L2C3A: 			ld   bc,$0828
L2C3D: 			call $0D44
L2C40: 			call $0D08
L2C43: 			call $0DF4
L2C46: 			pop  hl
L2C47: 			ret
L2C48: 			ld   hl,$7C15
L2C4B: 			ld   a,($7CD5)
L2C4E: 			and  a
L2C4F: 			jr   z,$2C73
L2C51: 			ld   ($7CA1),a
L2C54: 			ld   a,(hl)
L2C55: 			and  a
L2C56: 			jr   z,$2C68
L2C58: 			call $2C29
L2C5B: 			dec  (hl)
L2C5C: 			call $2C29
L2C5F: 			ld   a,($7C3B)
L2C62: 			and  a
L2C63: 			call z,$2BED
L2C66: 			jr   $2C71
L2C68: 			xor  a
L2C69: 			ld   ($7CD5),a
L2C6C: 			ld   a,$18
L2C6E: 			ld   ($7CD6),a
L2C71: 			jr   $2C8F
L2C73: 			ld   a,(hl)
L2C74: 			and  a
L2C75: 			jr   nz,$2C8F
L2C77: 			xor  a
L2C78: 			ld   ($7C3B),a
L2C7B: 			ld   a,($7CD6)
L2C7E: 			and  a
L2C7F: 			jr   nz,$2C8B
L2C81: 			call $2C29
L2C84: 			ld   (hl),$06
L2C86: 			call $2C29
L2C89: 			jr   $2C8F
L2C8B: 			dec  a
L2C8C: 			ld   ($7CD6),a
L2C8F: 			ret
L2C90: 			ld   bc,$001F
L2C93: 			ld   hl,($7E59)
L2C96: 			ld   iy,$7DF1
L2C9A: 			ld   a,($7E5E)
L2C9D: 			inc  a
L2C9E: 			ld   e,a
L2C9F: 			ld   a,$03
L2CA1: 			push hl
L2CA2: 			ex   af,af'
L2CA3: 			ld   a,(iy+$10)
L2CA6: 			sub  e
L2CA7: 			jr   nc,$2CAB
L2CA9: 			neg
L2CAB: 			cp   d
L2CAC: 			jr   nc,$2CCC
L2CAE: 			push de
L2CAF: 			ld   d,(iy+$0c)
L2CB2: 			ld   e,(iy+$0b)
L2CB5: 			and  a
L2CB6: 			sbc  hl,de
L2CB8: 			call c,$1111
L2CBB: 			pop  de
L2CBC: 			ld   a,$10
L2CBE: 			cp   h
L2CBF: 			jr   c,$2CCC
L2CC1: 			call $1192
L2CC4: 			ld   a,h
L2CC5: 			cp   d
L2CC6: 			jr   nc,$2CCC
L2CC8: 			ld   a,$01
L2CCA: 			pop  hl
L2CCB: 			ret
L2CCC: 			add  iy,bc
L2CCE: 			ex   af,af'
L2CCF: 			dec  a
L2CD0: 			pop  hl
L2CD1: 			jr   nz,$2CA1
L2CD3: 			ret
L2CD4: 			ld   a,($7CD3)
L2CD7: 			and  a
L2CD8: 			jr   nz,$2D4B
L2CDA: 			ld   a,(ix+$10)
L2CDD: 			cp   $BC
L2CDF: 			jr   c,$2D37
L2CE1: 			ld   a,($7CD2)
L2CE4: 			and  a
L2CE5: 			ret  nz
L2CE6: 			ld   a,($7CD3)
L2CE9: 			and  a
L2CEA: 			ret  nz
L2CEB: 			ld   hl,($7D61)
L2CEE: 			ld   ($7E67),hl
L2CF1: 			ld   hl,($7D65)
L2CF4: 			ld   ($7E69),hl
L2CF7: 			ld   hl,$0F34
L2CFA: 			ld   ($7E54),hl
L2CFD: 			xor  a
L2CFE: 			ld   ($7E56),a
L2D01: 			ld   a,$04
L2D03: 			ld   ($7E6B),a
L2D06: 			ld   a,$81
L2D08: 			ld   ($7E5F),a
L2D0B: 			ld   hl,$0628
L2D0E: 			ld   ($7C5A),hl
L2D11: 			ld   a,($7CA1)
L2D14: 			and  a
L2D15: 			jr   z,$2D1B
L2D17: 			ld   a,$03
L2D19: 			jr   $2D1D
L2D1B: 			ld   a,$04
L2D1D: 			ld   ($7C9F),a
L2D20: 			xor  a
L2D21: 			ld   ($7CD9),a
L2D24: 			ld   ($7CA1),a
L2D27: 			ld   ($7CB3),a
L2D2A: 			ld   a,$01
L2D2C: 			ld   ($7CD3),a
L2D2F: 			ld   ($7C3E),a
L2D32: 			ld   ($7C3F),a
L2D35: 			jr   $2D49
L2D37: 			sbc  a,$A9
L2D39: 			cp   $05
L2D3B: 			ret  nc
L2D3C: 			ld   a,(ix+$0c)
L2D3F: 			sbc  a,$26
L2D41: 			cp   $02
L2D43: 			ret  nc
L2D44: 			ld   a,$01
L2D46: 			ld   ($7CA1),a
L2D49: 			jr   $2D96
L2D4B: 			ld   d,(ix+$10)
L2D4E: 			ld   a,$3C
L2D50: 			cp   d
L2D51: 			ret  c
L2D52: 			ld   a,($7C9D)
L2D55: 			and  a
L2D56: 			ret  nz
L2D57: 			ld   d,$05
L2D59: 			call $2C90
L2D5C: 			and  a
L2D5D: 			ret  z
L2D5E: 			ld   a,($7CC5)
L2D61: 			and  a
L2D62: 			jr   z,$2D78
L2D64: 			ld   a,$02
L2D66: 			call $117C
L2D69: 			ld   ($7CAD),a
L2D6C: 			ld   ($7CD4),a
L2D6F: 			ld   hl,($7C4B)
L2D72: 			ld   ($7C43),hl
L2D75: 			xor  a
L2D76: 			jr   $2D7C
L2D78: 			inc  a
L2D79: 			ld   ($7C3A),a
L2D7C: 			ld   ($7C51),a
L2D7F: 			inc  a
L2D80: 			ld   ($7C9D),a
L2D83: 			push iy
L2D85: 			pop  hl
L2D86: 			ld   ($7C4F),hl
L2D89: 			call $1246
L2D8C: 			xor  a
L2D8D: 			ld   ($7C53),a
L2D90: 			ld   ($7C47),a
L2D93: 			call $11A5
L2D96: 			ret
L2D97: 			ld   (hl),l
L2D98: 			ld   a,l
L2D99: 			ld   sp,hl
L2D9A: 			ld   a,h
L2D9B: 			scf
L2D9C: 			ld   a,l
L2D9D: 			sub  h
L2D9E: 			ld   a,l
L2D9F: 			jr   $2E1E
L2DA1: 			ld   d,(hl)
L2DA2: 			ld   a,l
L2DA3: 			jp   nc,$DA7D
L2DA6: 			ld   a,h
L2DA7: 			or   e
L2DA8: 			ld   a,l
L2DA9: 			djnz $2E29
L2DAB: 			cpl
L2DAC: 			ld   a,(hl)
L2DAD: 			pop  af
L2DAE: 			ld   a,l
L2DAF: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L2DB1: 			ex   (sp),hl
L2DB2: 			push de
L2DB3: 			push bc
L2DB4: 			push af
L2DB5: 			ld   a,(hl)
L2DB6: 			out  ($0F),a
L2DB8: 			inc  hl
L2DB9: 			ld   ($7C00),hl
L2DBC: 			exx
L2DBD: 			ex   af,af'
L2DBE: 			push hl
L2DBF: 			push de
L2DC0: 			push bc
L2DC1: 			push af
L2DC2: 			ei
L2DC3: 			ld   a,($7C1B)
L2DC6: 			and  a
L2DC7: 			jr   z,$2DD7
L2DC9: 			ld   a,($7C8B)
L2DCC: 			and  a
L2DCD: 			jr   nz,$2DD7
L2DCF: 			ld   a,$F0
L2DD1: 			out  ($03),a
L2DD3: 			ld   a,$52
L2DD5: 			out  ($01),a
L2DD7: 			ld   a,($7C1E)
L2DDA: 			and  a
L2DDB: 			jp   nz,$2E82
L2DDE: 			ld   a,($7C48)
L2DE1: 			inc  a
L2DE2: 			ld   ($7C48),a
L2DE5: 			cp   $02
L2DE7: 			jp   nc,$2E82
L2DEA: 			push iy
L2DEC: 			push ix
L2DEE: 			ld   a,($7CBD)
L2DF1: 			add  a,$03
L2DF3: 			cp   $0C
L2DF5: 			jr   nz,$2DF8
L2DF7: 			xor  a
L2DF8: 			ld   ($7CBD),a
L2DFB: 			ld   hl,$2D97
L2DFE: 			call $114C
L2E01: 			push de
L2E02: 			pop  ix
L2E04: 			inc  hl
L2E05: 			ld   a,$03
L2E07: 			push af
L2E08: 			push hl
L2E09: 			bit  7,(ix+$11)
L2E0D: 			jr   z,$2E26
L2E0F: 			xor  a
L2E10: 			ld   ($7CBE),a
L2E13: 			call $0EF9
L2E16: 			ld   ($7C93),ix
L2E1A: 			call $2861
L2E1D: 			call $2B63
L2E20: 			call $2B2A
L2E23: 			call $0ECC
L2E26: 			pop  hl
L2E27: 			inc  hl
L2E28: 			ld   e,(hl)
L2E29: 			inc  hl
L2E2A: 			ld   d,(hl)
L2E2B: 			push de
L2E2C: 			pop  ix
L2E2E: 			pop  af
L2E2F: 			dec  a
L2E30: 			jr   nz,$2E07
L2E32: 			call $2C48
L2E35: 			ld   ix,$7E4E
L2E39: 			bit  7,(ix+$11)
L2E3D: 			jr   z,$2E5F
L2E3F: 			ld   a,($7CBE)
L2E42: 			and  a
L2E43: 			jr   z,$2E4A
L2E45: 			call $11B9
L2E48: 			jr   $2E4F
L2E4A: 			ld   a,$02
L2E4C: 			ld   ($7CBE),a
L2E4F: 			call $0EF9
L2E52: 			ld   ($7C93),ix
L2E56: 			call $2861
L2E59: 			call $2B63
L2E5C: 			call $0ECC
L2E5F: 			call $2CD4
L2E62: 			pop  ix
L2E64: 			pop  iy
L2E66: 			push iy
L2E68: 			push ix
L2E6A: 			call $2AC0
L2E6D: 			ld   a,($7C4A)
L2E70: 			and  a
L2E71: 			call z,$1FA5
L2E74: 			pop  ix
L2E76: 			pop  iy
L2E78: 			ld   a,($7C48)
L2E7B: 			dec  a
L2E7C: 			ld   ($7C48),a
L2E7F: 			jp   nz,$2DEA
L2E82: 			di
L2E83: 			call $0989
L2E86: 			ei
L2E87: 			di
L2E88: 			call $15A1
L2E8B: 			ei
L2E8C: 			ld   hl,$7C26
L2E8F: 			call $1121
L2E92: 			and  a
L2E93: 			jr   z,$2EBB
L2E95: 			ld   a,($7C27)
L2E98: 			and  a
L2E99: 			jr   z,$2EAA
L2E9B: 			ld   a,$01
L2E9D: 			out  ($20),a
L2E9F: 			ld   a,$07
L2EA1: 			ld   ($7C26),a
L2EA4: 			xor  a
L2EA5: 			ld   ($7C27),a
L2EA8: 			jr   $2EBB
L2EAA: 			xor  a
L2EAB: 			out  ($20),a
L2EAD: 			ld   hl,$7C25
L2EB0: 			dec  (hl)
L2EB1: 			jr   z,$2EBB
L2EB3: 			ld   a,$07
L2EB5: 			ld   ($7C26),a
L2EB8: 			ld   ($7C27),a
L2EBB: 			jp   $0221
L2EBE: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L2EC0: 			ex   (sp),hl
L2EC1: 			push de
L2EC2: 			push bc
L2EC3: 			push af
L2EC4: 			ld   a,(hl)
L2EC5: 			out  ($0F),a
L2EC7: 			inc  hl
L2EC8: 			ld   ($7C00),hl
L2ECB: 			exx
L2ECC: 			ex   af,af'
L2ECD: 			push hl
L2ECE: 			push de
L2ECF: 			push bc
L2ED0: 			push af
L2ED1: 			ld   a,($7C8B)
L2ED4: 			and  a
L2ED5: 			jr   nz,$2EDF
L2ED7: 			ld   a,$6C
L2ED9: 			out  ($03),a
L2EDB: 			ld   a,$07
L2EDD: 			out  ($01),a
L2EDF: 			jp   $0221
L2EE2: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************


L2EE4: 			ex   (sp),hl
L2EE5: 			push de
L2EE6: 			push bc
L2EE7: 			push af
L2EE8: 			ld   a,(hl)
L2EE9: 			out  ($0F),a
L2EEB: 			inc  hl
L2EEC: 			ld   ($7C00),hl
L2EEF: 			exx
L2EF0: 			ex   af,af'
L2EF1: 			push hl
L2EF2: 			push de
L2EF3: 			push bc
L2EF4: 			push af
L2EF5: 			ld   hl,$7CB9
L2EF8: 			ld   a,(hl)
L2EF9: 			and  a
L2EFA: 			jr   nz,$2F2E
L2EFC: 			ld   a,($7CB6)
L2EFF: 			xor  $01
L2F01: 			ld   ($7CB6),a
L2F04: 			ld   (hl),$20
L2F06: 			push af
L2F07: 			ld   a,($7C1B)
L2F0A: 			and  a
L2F0B: 			jr   nz,$2F21
L2F0D: 			pop  af
L2F0E: 			jr   z,$2F16
L2F10: 			ld   a,$07
L2F12: 			ld   d,$00
L2F14: 			jr   $2F18
L2F16: 			ld   d,$07
L2F18: 			out  ($00),a
L2F1A: 			out  ($02),a
L2F1C: 			ld   a,d
L2F1D: 			out  ($03),a
L2F1F: 			jr   $2F2E
L2F21: 			pop  af
L2F22: 			jr   z,$2F28
L2F24: 			ld   a,$F5
L2F26: 			jr   $2F2A
L2F28: 			ld   a,$B2
L2F2A: 			out  ($00),a
L2F2C: 			out  ($04),a
L2F2E: 			dec  (hl)
L2F2F: 			jp   $0221
L2F32: 			call $2DB1
L2F35: 			ld   (hl),e
L2F36: 			jp   $2F32
L2F39: 			call $2EE4
L2F3C: 			ld   (hl),e
L2F3D: 			call $2DB1
L2F40: 			ret  nz
L2F41: 			jp   $2F39
L2F44: 			call $2EC0
L2F47: 			ld   (hl),e
L2F48: 			call $2DB1
L2F4B: 			nop
L2F4C: 			jp   $2F44
L2F4F: 			call $2EC0
L2F52: 			ld   (hl),e
L2F53: 			call $2DB1
L2F56: 			ret  nz
L2F57: 			call $2EE4
L2F5A: 			nop
L2F5B: 			jp   $2F4F
L2F5E: 			call $2DB1
L2F61: 			inc  (hl)
L2F62: 			call $2EC0
L2F65: 			ld   a,a
L2F66: 			jp   $2F5E
L2F69: 			call $2EC0
L2F6C: 			ld   a,a
L2F6D: 			call $2DB1
L2F70: 			ret  nz
L2F71: 			call $2EE4
L2F74: 			inc  (hl)
L2F75: 			jp   $2F69

;******************************************************************************
; Command ----> ???
;
; Opcode:	$7D
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2F78: 			rst  08
L2F79: 			dec  de
L2F7A: 			dec  de
L2F7B: 			ld   a,h
L2F7C: 			rla
L2F7D: 			ld   e,$A0
L2F7F: 			cpl
L2F80: 			add  hl,de
L2F81: 			or   c
L2F82: 			ex   af,af'
L2F83: 			dec  c
L2F84: 			ld   c,e
L2F85: 			add  hl,de
L2F86: 			inc  b
L2F87: 			ld   c,e
L2F88: 			add  hl,de
L2F89: 			rlca
L2F8A: 			add  hl,de
L2F8B: 			ld   (bc),a
L2F8C: 			ld   c,e
L2F8D: 			dec  de
L2F8E: 			ld   a,(bc)
L2F8F: 			ld   a,h
L2F90: 			rla
L2F91: 			ld   e,$9A
L2F93: 			cpl
L2F94: 			dec  de
L2F95: 			ld   e,(hl)
L2F96: 			cpl
L2F97: 			rra
L2F98: 			sbc  a,l
L2F99: 			cpl
L2F9A: 			dec  de
L2F9B: 			ld   b,h
L2F9C: 			cpl
L2F9D: 			rra
L2F9E: 			or   (hl)
L2F9F: 			cpl
L2FA0: 			add  hl,de
L2FA1: 			rlca
L2FA2: 			ex   af,af'
L2FA3: 			ld   ($194B),hl
L2FA6: 			inc  bc
L2FA7: 			ld   c,e
L2FA8: 			dec  c
L2FA9: 			ex   af,af'
L2FAA: 			ex   af,af'
L2FAB: 			ex   af,af'
L2FAC: 			ld   c,e
L2FAD: 			add  hl,de
L2FAE: 			ld   (bc),a
L2FAF: 			ld   c,e
L2FB0: 			add  hl,de
L2FB1: 			inc  b
L2FB2: 			ld   c,e
L2FB3: 			dec  de
L2FB4: 			ld   ($782F),a
L2FB7: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2FB8: 			rst  08
L2FB9: 			dec  de
L2FBA: 			nop
L2FBB: 			inc  b
L2FBC: 			dec  de
L2FBD: 			nop
L2FBE: 			jr   z,$2FDB
L2FC0: 			jr   z,$2FCA
L2FC2: 			ld   l,$24
L2FC4: 			ld   b,h
L2FC5: 			ld   b,l
L2FC6: 			ld   d,b
L2FC7: 			ld   c,a
L2FC8: 			ld   d,e
L2FC9: 			ld   c,c
L2FCA: 			ld   d,h
L2FCB: 			jr   nz,$2FFE
L2FCD: 			jr   nz,$3012
L2FCF: 			ld   c,a
L2FD0: 			ld   c,c
L2FD1: 			ld   c,(hl)
L2FD2: 			jr   nz,$3028
L2FD4: 			ld   c,a
L2FD5: 			jr   nz,$301A
L2FD7: 			ld   c,a
L2FD8: 			ld   c,(hl)
L2FD9: 			ld   d,h
L2FDA: 			ld   c,c
L2FDB: 			ld   c,(hl)
L2FDC: 			ld   d,l
L2FDD: 			ld   b,l
L2FDE: 			jr   nz,$3034
L2FE0: 			ld   c,b
L2FE1: 			ld   c,c
L2FE2: 			ld   d,e
L2FE3: 			jr   nz,$302C
L2FE5: 			ld   b,c
L2FE6: 			ld   c,l
L2FE7: 			ld   b,l
L2FE8: 			cpl
L2FE9: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L2FEA: 			rst  08
L2FEB: 			dec  de
L2FEC: 			add  hl,bc
L2FED: 			ld   a,h
L2FEE: 			rla
L2FEF: 			ld   e,$26
L2FF1: 			jr   nc,$300E
L2FF3: 			nop
L2FF4: 			inc  bc
L2FF5: 			dec  de
L2FF6: 			nop
L2FF7: 			jr   z,$3014
L2FF9: 			jr   z,$3003
L2FFB: 			ld   l,$25
L2FFD: 			ld   b,h
L2FFE: 			ld   b,l
L2FFF: 			ld   d,b
L3000: 			ld   c,a
L3001: 			ld   d,e
L3002: 			ld   c,c
L3003: 			ld   d,h
L3004: 			jr   nz,$3038
L3006: 			jr   nz,$304B
L3008: 			ld   c,a
L3009: 			ld   c,c
L300A: 			ld   c,(hl)
L300B: 			ld   d,e
L300C: 			jr   nz,$3062
L300E: 			ld   c,a
L300F: 			jr   nz,$3054
L3011: 			ld   c,a
L3012: 			ld   c,(hl)
L3013: 			ld   d,h
L3014: 			ld   c,c
L3015: 			ld   c,(hl)
L3016: 			ld   d,l
L3017: 			ld   b,l
L3018: 			jr   nz,$306E
L301A: 			ld   c,b
L301B: 			ld   c,c
L301C: 			ld   d,e
L301D: 			jr   nz,$3066
L301F: 			ld   b,c
L3020: 			ld   c,l
L3021: 			ld   b,l
L3022: 			cpl
L3023: 			rra
L3024: 			daa
L3025: 			jr   nc,$30A0
L3027: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3028: 			rst  08
L3029: 			ld   a,c
L302A: 			dec  de
L302B: 			ld   de,$347C
L302E: 			add  hl,de
L302F: 			rst  38
L3030: 			ld   a,d
L3031: 			add  hl,de
L3032: 			rst  38
L3033: 			ld   a,d
L3034: 			ld   a,c
L3035: 			dec  de
L3036: 			ld   de,$177C
L3039: 			ld   e,$43
L303B: 			jr   nc,$3058
L303D: 			djnz $30BB
L303F: 			inc  (hl)
L3040: 			rra
L3041: 			ld   c,e
L3042: 			jr   nc,$305F
L3044: 			ex   af,af'
L3045: 			ld   a,h
L3046: 			inc  (hl)
L3047: 			dec  de
L3048: 			inc  d
L3049: 			ld   a,h
L304A: 			jr   nc,$3067
L304C: 			ld   de,$637C
L304F: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3050: 			rst  08
L3051: 			ld   a,e
L3052: 			add  hl,de
L3053: 			and  b
L3054: 			ld   a,d
L3055: 			ld   a,e
L3056: 			dec  de
L3057: 			ld   de,$177C
L305A: 			ex   af,af'
L305B: 			ld   e,$65
L305D: 			jr   nc,$307A
L305F: 			djnz $30DD
L3061: 			inc  (hl)
L3062: 			rra
L3063: 			ld   (hl),d
L3064: 			jr   nc,$3081
L3066: 			ld   a,(bc)
L3067: 			ld   a,h
L3068: 			rla
L3069: 			ld   e,$72
L306B: 			jr   nc,$3088
L306D: 			ld   a,(bc)
L306E: 			ld   a,h
L306F: 			inc  (hl)
L3070: 			ld   a,h
L3071: 			ld   a,l
L3072: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3073: 			rst  08
L3074: 			add  hl,de
L3075: 			rst  38
L3076: 			dec  c
L3077: 			dec  d
L3078: 			jr   $3093
L307A: 			djnz $30FA
L307C: 			add  hl,de
L307D: 			inc  bc
L307E: 			ld   a,(de)
L307F: 			add  hl,de
L3080: 			inc  bc
L3081: 			ld   a,a
L3082: 			ld   e,$8B
L3084: 			jr   nc,$308D
L3086: 			ld   ($AC1B),hl
L3089: 			ld   a,h
L308A: 			jr   nc,$30A7
L308C: 			rra
L308D: 			ld   a,h
L308E: 			rla
L308F: 			ld   e,$98
L3091: 			jr   nc,$309A
L3093: 			ld   ($AC1B),hl
L3096: 			ld   a,h
L3097: 			jr   nc,$30A3
L3099: 			ex   af,af'
L309A: 			jr   z,$30BA
L309C: 			ld   (hl),h
L309D: 			jr   nc,$30A6
L309F: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L30A0: 			rst  08
L30A1: 			dec  de
L30A2: 			nop
L30A3: 			ld   a,(de)
L30A4: 			dec  de
L30A5: 			nop
L30A6: 			djnz $30C3
L30A8: 			jr   z,$30B2
L30AA: 			ld   l,$0E
L30AC: 			ld   e,c
L30AD: 			ld   c,a
L30AE: 			ld   d,l
L30AF: 			jr   nz,$30F2
L30B1: 			ld   d,d
L30B2: 			ld   b,l
L30B3: 			jr   nz,$310A
L30B5: 			ld   d,b
L30B6: 			jr   nz,$30E9
L30B8: 			ld   d,e
L30B9: 			ld   d,h
L30BA: 			cpl
L30BB: 			dec  de
L30BC: 			nop
L30BD: 			rrca
L30BE: 			dec  de
L30BF: 			nop
L30C0: 			inc  h
L30C1: 			dec  de
L30C2: 			jr   z,$30CC
L30C4: 			ld   l,$18
L30C6: 			ld   b,d
L30C7: 			ld   b,l
L30C8: 			ld   b,c
L30C9: 			ld   d,h
L30CA: 			jr   nz,$3119
L30CC: 			ld   b,l
L30CD: 			jr   nz,$3115
L30CF: 			ld   c,a
L30D0: 			ld   d,d
L30D1: 			jr   nz,$3118
L30D3: 			ld   e,b
L30D4: 			ld   d,h
L30D5: 			ld   d,d
L30D6: 			ld   b,c
L30D7: 			jr   nz,$3122
L30D9: 			ld   c,(hl)
L30DA: 			ld   c,(hl)
L30DB: 			ld   c,c
L30DC: 			ld   c,(hl)
L30DD: 			ld   b,a
L30DE: 			cpl
L30DF: 			dec  de
L30E0: 			nop
L30E1: 			rra
L30E2: 			dec  de
L30E3: 			nop
L30E4: 			jr   c,$3101
L30E6: 			jr   z,$30F0
L30E8: 			ld   l,$09
L30EA: 			ld   b,a
L30EB: 			ld   c,a
L30EC: 			ld   c,a
L30ED: 			ld   b,h
L30EE: 			jr   nz,$313C
L30F0: 			ld   d,l
L30F1: 			ld   b,e
L30F2: 			ld   c,e
L30F3: 			cpl
L30F4: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L30F5: 			rst  08
L30F6: 			dec  de
L30F7: 			xor  h
L30F8: 			ld   a,h
L30F9: 			inc  (hl)
L30FA: 			ld   c,c
L30FB: 			dec  de
L30FC: 			nop
L30FD: 			inc  hl
L30FE: 			dec  de
L30FF: 			nop
L3100: 			djnz $311D
L3102: 			jr   z,$310C
L3104: 			ld   l,$05
L3106: 			ld   d,b
L3107: 			ld   c,c
L3108: 			ld   d,h
L3109: 			ld   b,e
L310A: 			ld   c,b
L310B: 			cpl
L310C: 			dec  de
L310D: 			nop
L310E: 			rlca
L310F: 			dec  de
L3110: 			nop
L3111: 			ld   b,b
L3112: 			dec  de
L3113: 			jr   z,$311D
L3115: 			ld   l,$21
L3117: 			ld   d,b
L3118: 			ld   d,d
L3119: 			ld   b,l
L311A: 			ld   d,e
L311B: 			ld   d,e
L311C: 			jr   nz,$316E
L311E: 			ld   c,c
L311F: 			ld   d,h
L3120: 			ld   b,e
L3121: 			ld   c,b
L3122: 			jr   nz,$3166
L3124: 			ld   d,l
L3125: 			ld   d,h
L3126: 			ld   d,h
L3127: 			ld   c,a
L3128: 			ld   c,(hl)
L3129: 			jr   nz,$317F
L312B: 			ld   c,a
L312C: 			jr   nz,$3181
L312E: 			ld   d,h
L312F: 			ld   b,c
L3130: 			ld   d,d
L3131: 			ld   d,h
L3132: 			jr   nz,$3184
L3134: 			ld   c,c
L3135: 			ld   d,h
L3136: 			ld   b,e
L3137: 			ld   c,b
L3138: 			cpl
L3139: 			dec  de
L313A: 			nop
L313B: 			rrca
L313C: 			dec  de
L313D: 			nop
L313E: 			ld   h,b
L313F: 			dec  de
L3140: 			jr   z,$314A
L3142: 			ld   l,$19
L3144: 			ld   d,d
L3145: 			ld   c,a
L3146: 			ld   c,h
L3147: 			ld   c,h
L3148: 			ld   b,l
L3149: 			ld   d,d
L314A: 			ld   b,d
L314B: 			ld   b,c
L314C: 			ld   c,h
L314D: 			ld   c,h
L314E: 			jr   nz,$3193
L3150: 			ld   c,a
L3151: 			ld   c,(hl)
L3152: 			ld   d,h
L3153: 			ld   d,d
L3154: 			ld   c,a
L3155: 			ld   c,h
L3156: 			ld   d,e
L3157: 			jr   nz,$31A9
L3159: 			ld   c,c
L315A: 			ld   d,h
L315B: 			ld   b,e
L315C: 			ld   c,b
L315D: 			cpl
L315E: 			dec  de
L315F: 			nop
L3160: 			inc  c
L3161: 			dec  de
L3162: 			nop
L3163: 			add  a,b
L3164: 			dec  de
L3165: 			jr   z,$316F
L3167: 			ld   l,$1C
L3169: 			ld   d,d
L316A: 			ld   c,a
L316B: 			ld   c,h
L316C: 			ld   c,h
L316D: 			ld   b,l
L316E: 			ld   d,d
L316F: 			ld   b,d
L3170: 			ld   b,c
L3171: 			ld   c,h
L3172: 			ld   c,h
L3173: 			jr   nz,$31C2
L3175: 			ld   c,a
L3176: 			ld   d,(hl)
L3177: 			ld   b,l
L3178: 			ld   d,e
L3179: 			jr   nz,$31CA
L317B: 			ld   d,l
L317C: 			ld   d,h
L317D: 			ld   b,(hl)
L317E: 			ld   c,c
L317F: 			ld   b,l
L3180: 			ld   c,h
L3181: 			ld   b,h
L3182: 			ld   b,l
L3183: 			ld   d,d
L3184: 			ld   d,e
L3185: 			cpl
L3186: 			add  hl,de
L3187: 			add  a,b
L3188: 			add  a,b
L3189: 			dec  de
L318A: 			xor  h
L318B: 			ld   a,h
L318C: 			rla
L318D: 			ld   e,$93
L318F: 			ld   sp,$361F
L3192: 			ld   ($1B49),a
L3195: 			nop
L3196: 			dec  h
L3197: 			dec  de
L3198: 			nop
L3199: 			djnz $31B6
L319B: 			jr   z,$31A5
L319D: 			ld   l,$03
L319F: 			ld   b,d
L31A0: 			ld   b,c
L31A1: 			ld   d,h
L31A2: 			cpl
L31A3: 			dec  de
L31A4: 			nop
L31A5: 			dec  bc
L31A6: 			dec  de
L31A7: 			nop
L31A8: 			ld   b,b
L31A9: 			dec  de
L31AA: 			jr   z,$31B4
L31AC: 			ld   l,$1D
L31AE: 			ld   d,b
L31AF: 			ld   d,d
L31B0: 			ld   b,l
L31B1: 			ld   d,e
L31B2: 			ld   d,e
L31B3: 			jr   nz,$31F7
L31B5: 			ld   b,c
L31B6: 			ld   d,h
L31B7: 			jr   nz,$31FB
L31B9: 			ld   d,l
L31BA: 			ld   d,h
L31BB: 			ld   d,h
L31BC: 			ld   c,a
L31BD: 			ld   c,(hl)
L31BE: 			jr   nz,$3214
L31C0: 			ld   c,a
L31C1: 			jr   nz,$3216
L31C3: 			ld   d,a
L31C4: 			ld   c,c
L31C5: 			ld   c,(hl)
L31C6: 			ld   b,a
L31C7: 			jr   nz,$320B
L31C9: 			ld   b,c
L31CA: 			ld   d,h
L31CB: 			cpl
L31CC: 			dec  de
L31CD: 			nop
L31CE: 			dec  b
L31CF: 			dec  de
L31D0: 			nop
L31D1: 			ld   h,b
L31D2: 			dec  de
L31D3: 			jr   z,$31DD
L31D5: 			ld   l,$23
L31D7: 			ld   c,b
L31D8: 			ld   c,a
L31D9: 			ld   c,h
L31DA: 			ld   b,h
L31DB: 			jr   nz,$321F
L31DD: 			ld   d,l
L31DE: 			ld   d,h
L31DF: 			ld   d,h
L31E0: 			ld   c,a
L31E1: 			ld   c,(hl)
L31E2: 			jr   nz,$3228
L31E4: 			ld   c,a
L31E5: 			ld   d,a
L31E6: 			ld   c,(hl)
L31E7: 			jr   nz,$323D
L31E9: 			ld   c,a
L31EA: 			jr   nz,$322D
L31EC: 			ld   b,h
L31ED: 			ld   d,(hl)
L31EE: 			ld   b,c
L31EF: 			ld   c,(hl)
L31F0: 			ld   b,e
L31F1: 			ld   b,l
L31F2: 			jr   nz,$3246
L31F4: 			ld   d,l
L31F5: 			ld   c,(hl)
L31F6: 			ld   c,(hl)
L31F7: 			ld   b,l
L31F8: 			ld   d,d
L31F9: 			ld   d,e
L31FA: 			cpl
L31FB: 			add  hl,de
L31FC: 			ld   h,b
L31FD: 			add  a,b
L31FE: 			dec  de
L31FF: 			xor  h
L3200: 			ld   a,h
L3201: 			rla
L3202: 			ld   e,$08
L3204: 			ld   ($361F),a
L3207: 			ld   ($1B49),a
L320A: 			nop
L320B: 			ld   a,(bc)
L320C: 			dec  de
L320D: 			nop
L320E: 			jr   z,$322B
L3210: 			jr   z,$321A
L3212: 			ld   l,$1E
L3214: 			ld   d,b
L3215: 			ld   d,d
L3216: 			ld   b,l
L3217: 			ld   d,e
L3218: 			ld   d,e
L3219: 			jr   nz,$325C
L321B: 			ld   c,(hl)
L321C: 			ld   e,c
L321D: 			jr   nz,$3261
L321F: 			ld   d,l
L3220: 			ld   d,h
L3221: 			ld   d,h
L3222: 			ld   c,a
L3223: 			ld   c,(hl)
L3224: 			jr   nz,$327A
L3226: 			ld   c,a
L3227: 			jr   nz,$327C
L3229: 			ld   d,h
L322A: 			ld   b,c
L322B: 			ld   d,d
L322C: 			ld   d,h
L322D: 			jr   nz,$3276
L322F: 			ld   b,c
L3230: 			ld   c,l
L3231: 			ld   b,l
L3232: 			cpl
L3233: 			add  hl,de
L3234: 			jr   nc,$31B6
L3236: 			dec  de
L3237: 			xor  h
L3238: 			ld   a,h
L3239: 			rla
L323A: 			ld   e,$FA
L323C: 			jr   nc,$3241
L323E: 			nop
L323F: 			ld   h,b
L3240: 			nop
L3241: 			ld   b,b
L3242: 			nop
L3243: 			ld   b,h
L3244: 			nop
L3245: 			jr   z,$3247
L3247: 			ld   h,b
L3248: 			nop
L3249: 			djnz $324B
L324B: 			xor  d
L324C: 			nop
L324D: 			jr   z,$3242
L324F: 			push ix
L3251: 			ld   a,($7C42)
L3254: 			and  a
L3255: 			jr   z,$3273
L3257: 			ld   hl,($7C43)
L325A: 			push hl
L325B: 			pop  ix
L325D: 			ld   de,$7D37
L3260: 			ld   a,e
L3261: 			cp   l
L3262: 			jr   z,$3271
L3264: 			ld   a,($7CAF)
L3267: 			and  a
L3268: 			jr   nz,$3271
L326A: 			ld   de,$001F
L326D: 			add  hl,de
L326E: 			ld   ($7C43),hl
L3271: 			jr   $3277
L3273: 			ld   ix,$7CDA
L3277: 			xor  a
L3278: 			ld   (ix+$12),a
L327B: 			ld   ($7CCC),a
L327E: 			pop  ix
L3280: 			ei
L3281: 			ld   a,($7C0B)
L3284: 			and  a
L3285: 			jr   z,$328C
L3287: 			ld   hl,$7C0D
L328A: 			jr   $328F
L328C: 			ld   hl,$7C0E
L328F: 			ld   a,(hl)
L3290: 			add  a,$01
L3292: 			daa
L3293: 			ld   (hl),a
L3294: 			push bc
L3295: 			ld   bc,$329B
L3298: 			jp   $1F1B
L329B: 			add  a,c
L329C: 			nop
L329D: 			pop  bc
L329E: 			ret
L329F: 			ld   a,$04
L32A1: 			push af
L32A2: 			ld   a,($7CEC)
L32A5: 			and  a
L32A6: 			jr   z,$32B9
L32A8: 			ld   a,($7D0B)
L32AB: 			and  a
L32AC: 			jp   z,$32C4
L32AF: 			ld   a,($7D2A)
L32B2: 			and  a
L32B3: 			jp   z,$32CF
L32B6: 			jp   $32DA
L32B9: 			ld   de,$7CDA
L32BC: 			ld   hl,$7CF9
L32BF: 			ld   bc,$001F
L32C2: 			ldir
L32C4: 			ld   de,$7CF9
L32C7: 			ld   hl,$7D18
L32CA: 			ld   bc,$001F
L32CD: 			ldir
L32CF: 			ld   de,$7D18
L32D2: 			ld   hl,$7D37
L32D5: 			ld   bc,$001F
L32D8: 			ldir
L32DA: 			xor  a
L32DB: 			ld   ($7D49),a
L32DE: 			ld   ($7D54),a
L32E1: 			ld   hl,$2800
L32E4: 			ld   ($7D42),hl
L32E7: 			ld   h,a
L32E8: 			ld   l,a
L32E9: 			ld   ($7D40),hl
L32EC: 			ld   ($7D44),hl
L32EF: 			ld   hl,$AC00
L32F2: 			ld   ($7D46),hl
L32F5: 			ld   hl,$04AC
L32F8: 			ld   ($7D4A),hl
L32FB: 			ld   a,$01
L32FD: 			ld   ($7CEB),a
L3300: 			ld   ($7D29),a
L3303: 			ld   ($7D29),a
L3306: 			ld   ($7D48),a
L3309: 			ld   hl,$0F20
L330C: 			ld   ($7D3D),hl
L330F: 			pop  af
L3310: 			dec  a
L3311: 			jr   nz,$32A1
L3313: 			ret
L3314: 			ld   a,($7C37)
L3317: 			and  a
L3318: 			ret  nz
L3319: 			push iy
L331B: 			push ix
L331D: 			di
L331E: 			ld   ($7C3E),a
L3321: 			ld   ($7CD4),a
L3324: 			ld   ($7C54),a
L3327: 			ld   ($7C53),a
L332A: 			ld   a,$01
L332C: 			ld   ($7CAB),a
L332F: 			ld   a,($7C3F)
L3332: 			and  a
L3333: 			jp   nz,$3408
L3336: 			ld   a,$30
L3338: 			ld   ($7C95),a
L333B: 			ld   ($7C96),a
L333E: 			ld   a,($7CAD)
L3341: 			and  a
L3342: 			di
L3343: 			jr   z,$334E
L3345: 			ld   ($7C51),a
L3348: 			ld   iy,($7C4B)
L334C: 			jr   $3386
L334E: 			ld   iy,($7C43)
L3352: 			ld   a,($7CAE)
L3355: 			and  a
L3356: 			jr   z,$335E
L3358: 			xor  a
L3359: 			ld   ($7CAE),a
L335C: 			jr   $3363
L335E: 			ld   a,$06
L3360: 			ld   ($7C9F),a
L3363: 			ld   a,($7C41)
L3366: 			ld   c,a
L3367: 			bit  6,(iy+$11)
L336B: 			jr   nz,$33B1
L336D: 			ld   a,(iy+$1d)
L3370: 			and  a
L3371: 			jr   z,$33B1
L3373: 			bit  2,(iy+$1e)
L3377: 			jr   z,$3380
L3379: 			ld   a,$02
L337B: 			call $117C
L337E: 			jr   $33B1
L3380: 			ld   a,(iy+$12)
L3383: 			cp   c
L3384: 			jr   nz,$33B1
L3386: 			ld   hl,$0F21
L3389: 			xor  a
L338A: 			ld   (iy+$12),a
L338D: 			ld   (iy+$07),h
L3390: 			ld   (iy+$06),l
L3393: 			ld   hl,$7CA6
L3396: 			inc  (hl)
L3397: 			ld   a,$02
L3399: 			ld   ($7C9F),a
L339C: 			res  3,(iy+$11)
L33A0: 			ld   a,($7C49)
L33A3: 			cp   $32
L33A5: 			jr   nz,$33B1
L33A7: 			xor  a
L33A8: 			ld   ($7C51),a
L33AB: 			pop  ix
L33AD: 			pop  iy
L33AF: 			ei
L33B0: 			ret
L33B1: 			ld   a,($7CAD)
L33B4: 			and  a
L33B5: 			jr   z,$33BC
L33B7: 			ld   ($7CAE),a
L33BA: 			jr   $33FE
L33BC: 			ld   a,c
L33BD: 			cp   $03
L33BF: 			jr   z,$3408
L33C1: 			ld   hl,$7CC6
L33C4: 			call $114C
L33C7: 			push de
L33C8: 			pop  ix
L33CA: 			bit  4,(ix+$11)
L33CE: 			jr   nz,$3408
L33D0: 			push ix
L33D2: 			pop  hl
L33D3: 			ld   ($7C4F),hl
L33D6: 			ld   a,$01
L33D8: 			ld   ($7C51),a
L33DB: 			ld   ($7CC5),a
L33DE: 			ld   a,($7C46)
L33E1: 			and  a
L33E2: 			jr   z,$33F9
L33E4: 			xor  a
L33E5: 			ld   ($7C46),a
L33E8: 			ld   de,$001F
L33EB: 			push iy
L33ED: 			pop  hl
L33EE: 			add  hl,de
L33EF: 			ld   ($7C43),hl
L33F2: 			ld   a,$01
L33F4: 			ld   ($7CAF),a
L33F7: 			jr   $33FE
L33F9: 			ld   a,$01
L33FB: 			ld   ($7C3F),a
L33FE: 			xor  a
L33FF: 			ld   ($7CAD),a
L3402: 			pop  ix
L3404: 			pop  iy
L3406: 			ei
L3407: 			ret
L3408: 			ei
L3409: 			xor  a
L340A: 			ld   ($7C3F),a
L340D: 			pop  ix
L340F: 			pop  iy
L3411: 			ld   a,$01
L3413: 			ld   ($7C1E),a
L3416: 			ld   bc,$341C
L3419: 			jp   $2A77
L341C: 			add  a,d
L341D: 			nop
L341E: 			ld   bc,$3424
L3421: 			jp   $1268
L3424: 			add  a,e
L3425: 			nop
L3426: 			ld   hl,$1268
L3429: 			ld   ($7CA8),hl
L342C: 			ld   a,$01
L342E: 			ld   ($7CB1),a
L3431: 			ld   ($7CB2),a
L3434: 			xor  a
L3435: 			ld   ($7C1E),a
L3438: 			ret
L3439: 			bit  7,a
L343B: 			ret  z
L343C: 			bit  6,a
L343E: 			ret  nz
L343F: 			inc  e
L3440: 			ret
L3441: 			push ix
L3443: 			push iy
L3445: 			di
L3446: 			xor  a
L3447: 			ld   ix,($7C4F)
L344B: 			ld   ($7CCD),a
L344E: 			ld   ($7C51),a
L3451: 			ld   (ix+$01),a
L3454: 			ld   (ix+$09),a
L3457: 			ld   (ix+$0a),a
L345A: 			ld   (ix+$0d),a
L345D: 			ld   (ix+$0e),a
L3460: 			ld   h,(ix+$0c)
L3463: 			inc  hl
L3464: 			inc  hl
L3465: 			ld   ($7E59),hl
L3468: 			ld   h,(ix+$10)
L346B: 			ld   ($7E5D),hl
L346E: 			ld   a,($7C3F)
L3471: 			and  a
L3472: 			jr   z,$3482
L3474: 			ld   hl,($7D65)
L3477: 			ld   ($7E69),hl
L347A: 			ld   de,($7D61)
L347E: 			ld   b,$04
L3480: 			jr   $34CF
L3482: 			ld   iy,($7C43)
L3486: 			ld   a,($7C42)
L3489: 			and  a
L348A: 			ld   a,(iy+$12)
L348D: 			jr   z,$34B9
L348F: 			and  a
L3490: 			jr   nz,$3493
L3492: 			inc  a
L3493: 			ld   d,a
L3494: 			ld   e,$00
L3496: 			ld   a,($7CEB)
L3499: 			call $3439
L349C: 			ld   a,($7D0A)
L349F: 			call $3439
L34A2: 			ld   a,($7D29)
L34A5: 			call $3439
L34A8: 			ld   a,($7D48)
L34AB: 			call $3439
L34AE: 			xor  a
L34AF: 			or   e
L34B0: 			jr   nz,$34B4
L34B2: 			ld   d,$01
L34B4: 			ld   a,d
L34B5: 			ld   b,$02
L34B7: 			jr   $34BB
L34B9: 			ld   b,$05
L34BB: 			ld   ($7C41),a
L34BE: 			sla  a
L34C0: 			ld   hl,$323E
L34C3: 			call $114C
L34C6: 			ld   ($7E69),de
L34CA: 			inc  hl
L34CB: 			inc  hl
L34CC: 			ld   e,(hl)
L34CD: 			inc  hl
L34CE: 			ld   d,(hl)
L34CF: 			ld   a,b
L34D0: 			ld   ($7E6B),a
L34D3: 			ld   ($7E67),de
L34D7: 			ld   a,(ix+$0c)
L34DA: 			cp   d
L34DB: 			jr   nc,$34E2
L34DD: 			ld   hl,$0FAB
L34E0: 			jr   $34E5
L34E2: 			ld   hl,$0FB3
L34E5: 			ld   (ix+$07),h
L34E8: 			ld   (ix+$06),l
L34EB: 			set  7,(ix+$11)
L34EF: 			res  3,(ix+$11)
L34F3: 			ld   a,$10
L34F5: 			ld   ($7CC1),a
L34F8: 			ld   ($7C3E),a
L34FB: 			pop  iy
L34FD: 			pop  ix
L34FF: 			ei
L3500: 			ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3501: 			rst  08
L3502: 			dec  de
L3503: 			inc  c
L3504: 			ld   a,h
L3505: 			rla
L3506: 			add  hl,de
L3507: 			ld   a,(bc)
L3508: 			ld   h,$1E
L350A: 			add  hl,de
L350B: 			dec  (hl)
L350C: 			dec  de
L350D: 			inc  c
L350E: 			ld   a,h
L350F: 			jr   nc,$352C
L3511: 			ex   af,af'
L3512: 			ld   a,h
L3513: 			ex   af,af'
L3514: 			rla
L3515: 			add  hl,de
L3516: 			add  hl,bc
L3517: 			daa
L3518: 			inc  hl
L3519: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L351A: 			rst  08
L351B: 			add  a,h
L351C: 			add  hl,de
L351D: 			ld   hl,($A519)
L3520: 			add  hl,de
L3521: 			ld   c,l
L3522: 			add  hl,de
L3523: 			inc  bc
L3524: 			ld   c,l
L3525: 			dec  de
L3526: 			ex   af,af'
L3527: 			ld   a,h
L3528: 			rla
L3529: 			ex   af,af'
L352A: 			ex   af,af'
L352B: 			ld   e,$56
L352D: 			dec  (hl)
L352E: 			add  hl,de
L352F: 			ld   a,(bc)
L3530: 			ld   e,h
L3531: 			ld   e,$42
L3533: 			dec  (hl)
L3534: 			dec  de
L3535: 			ret  p
L3536: 			ex   af,af'
L3537: 			ld   bc,$150D
L353A: 			dec  de
L353B: 			nop
L353C: 			ld   (bc),a
L353D: 			inc  d
L353E: 			jr   $355F
L3540: 			ld   b,(hl)
L3541: 			dec  (hl)
L3542: 			rlca
L3543: 			dec  de
L3544: 			ret  p
L3545: 			inc  e
L3546: 			dec  de
L3547: 			nop
L3548: 			and  l
L3549: 			dec  de
L354A: 			call nz,$1B04
L354D: 			ld   bc,$1B03
L3550: 			jr   z,$355A
L3552: 			ld   hl,($581F)
L3555: 			dec  (hl)
L3556: 			rlca
L3557: 			rlca
L3558: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3559: 			rst  08
L355A: 			dec  de
L355B: 			inc  d
L355C: 			ld   a,h
L355D: 			inc  (hl)
L355E: 			dec  de
L355F: 			adc  a,d
L3560: 			ld   a,h
L3561: 			rla
L3562: 			ld   e,$6C
L3564: 			dec  (hl)
L3565: 			dec  de
L3566: 			cp   h
L3567: 			ld   a,h
L3568: 			jr   nc,$3589
L356A: 			daa
L356B: 			ld   (hl),$1B
L356D: 			ld   de,$177C
L3570: 			dec  de
L3571: 			ld   de,$347C
L3574: 			ex   af,af'
L3575: 			ld   e,$26
L3577: 			ld   (hl),$1B
L3579: 			add  hl,bc
L357A: 			ld   a,h
L357B: 			rla
L357C: 			ld   e,$FE
L357E: 			dec  (hl)
L357F: 			dec  de
L3580: 			djnz $35FE
L3582: 			rla
L3583: 			ld   e,$C6
L3585: 			dec  (hl)
L3586: 			dec  de
L3587: 			ld   a,l
L3588: 			ld   a,(hl)
L3589: 			rla
L358A: 			ld   e,$B0
L358C: 			dec  (hl)
L358D: 			ex   af,af'
L358E: 			ld   ($1E26),hl
L3591: 			xor  c
L3592: 			dec  (hl)
L3593: 			dec  de
L3594: 			ld   b,$7C
L3596: 			rla
L3597: 			ld   e,$9D
L3599: 			dec  (hl)
L359A: 			rra
L359B: 			and  (hl)
L359C: 			dec  (hl)
L359D: 			dec  de
L359E: 			ld   a,a
L359F: 			ld   a,(hl)
L35A0: 			jr   nc,$35BD
L35A2: 			ld   de,$047C
L35A5: 			dec  c
L35A6: 			rra
L35A7: 			xor  l
L35A8: 			dec  (hl)
L35A9: 			dec  de
L35AA: 			ld   a,a
L35AB: 			ld   a,(hl)
L35AC: 			inc  (hl)
L35AD: 			rra
L35AE: 			jp   $1B35
L35B1: 			ld   de,$047C
L35B4: 			dec  de
L35B5: 			cp   e
L35B6: 			ld   a,h
L35B7: 			rla
L35B8: 			ld   e,$BE
L35BA: 			dec  (hl)
L35BB: 			rra
L35BC: 			jp   nz,$1B35
L35BF: 			cp   h
L35C0: 			ld   a,h
L35C1: 			jr   nc,$35D0
L35C3: 			rra
L35C4: 			ei
L35C5: 			dec  (hl)
L35C6: 			dec  de
L35C7: 			ld   b,$7C
L35C9: 			rla
L35CA: 			ld   e,$E2
L35CC: 			dec  (hl)
L35CD: 			dec  de
L35CE: 			ex   af,af'
L35CF: 			ld   a,h
L35D0: 			rla
L35D1: 			ld   e,$D8
L35D3: 			dec  (hl)
L35D4: 			ld   (hl),e
L35D5: 			rra
L35D6: 			rst  18
L35D7: 			dec  (hl)
L35D8: 			dec  de
L35D9: 			cp   h
L35DA: 			ld   a,h
L35DB: 			jr   nc,$35E7
L35DD: 			ld   (hl),e
L35DE: 			add  hl,bc
L35DF: 			rra
L35E0: 			ei
L35E1: 			dec  (hl)
L35E2: 			ex   af,af'
L35E3: 			ld   ($1B1A),hl
L35E6: 			ld   de,$047C
L35E9: 			add  hl,de
L35EA: 			cp   $1A
L35EC: 			dec  de
L35ED: 			ex   af,af'
L35EE: 			ld   a,h
L35EF: 			rla
L35F0: 			ld   e,$F6
L35F2: 			dec  (hl)
L35F3: 			rra
L35F4: 			ei
L35F5: 			dec  (hl)
L35F6: 			dec  de
L35F7: 			cp   h
L35F8: 			ld   a,h
L35F9: 			jr   nc,$3605
L35FB: 			rra
L35FC: 			djnz $3634
L35FE: 			dec  de
L35FF: 			ex   af,af'
L3600: 			ld   a,h
L3601: 			rla
L3602: 			ld   e,$09
L3604: 			ld   (hl),$73
L3606: 			rra
L3607: 			djnz $363F
L3609: 			dec  de
L360A: 			cp   h
L360B: 			ld   a,h
L360C: 			jr   nc,$3618
L360E: 			ld   (hl),e
L360F: 			add  hl,bc
L3610: 			dec  de
L3611: 			ex   af,af'
L3612: 			ld   a,h
L3613: 			rla
L3614: 			inc  d
L3615: 			dec  de
L3616: 			ex   af,af'
L3617: 			ld   a,h
L3618: 			inc  b
L3619: 			add  a,l
L361A: 			dec  de
L361B: 			ld   e,$7C
L361D: 			jr   nc,$35A5
L361F: 			dec  de
L3620: 			ld   e,$7C
L3622: 			inc  (hl)
L3623: 			rra
L3624: 			daa
L3625: 			ld   (hl),$07
L3627: 			dec  de
L3628: 			ld   a,a
L3629: 			ld   a,(hl)
L362A: 			rla
L362B: 			ld   e,$31
L362D: 			ld   (hl),$1F
L362F: 			dec  (hl)
L3630: 			ld   (hl),$1B
L3632: 			djnz $36B0
L3634: 			inc  (hl)
L3635: 			inc  bc
L3636: 			xor  a
L3637: 			djnz $360B
L3639: 			djnz $3637
L363B: 			djnz $35E5
L363D: 			djnz $35E7
L363F: 			djnz $3613
L3641: 			djnz $35F9
L3643: 			djnz $3609
L3645: 			djnz $362E
L3647: 			djnz $35FF
L3649: 			djnz $35FA
L364B: 			ld   ($7CC3),a
L364E: 			ld   hl,$0628
L3651: 			ld   a,($7CD9)
L3654: 			and  a
L3655: 			jr   z,$369C
L3657: 			ld   ($7C7A),hl
L365A: 			di
L365B: 			ld   hl,($7D61)
L365E: 			dec  hl
L365F: 			dec  hl
L3660: 			dec  hl
L3661: 			dec  hl
L3662: 			ld   ($7E59),hl
L3665: 			ld   hl,($7D65)
L3668: 			dec  hl
L3669: 			dec  hl
L366A: 			dec  hl
L366B: 			dec  hl
L366C: 			dec  hl
L366D: 			dec  hl
L366E: 			dec  hl
L366F: 			ld   ($7E5D),hl
L3672: 			ei
L3673: 			call $329F
L3676: 			ld   bc,$367C
L3679: 			jp   $1B2C
L367C: 			add  a,a
L367D: 			nop
L367E: 			di
L367F: 			ld   hl,$0F35
L3682: 			ld   a,$01
L3684: 			ld   ($7C58),a
L3687: 			ld   ($7CB3),a
L368A: 			ld   a,($7C34)
L368D: 			and  a
L368E: 			jr   z,$369A
L3690: 			ld   a,($7C56)
L3693: 			ld   hl,$3636
L3696: 			call $114C
L3699: 			ex   de,hl
L369A: 			jr   $36A2
L369C: 			ld   ($7C5A),hl
L369F: 			ld   hl,$0F34
L36A2: 			ld   ($7E54),hl
L36A5: 			ld   hl,$7E5F
L36A8: 			set  7,(hl)
L36AA: 			res  3,(hl)
L36AC: 			ei
L36AD: 			ret
L36AE: 			dec  b
L36AF: 			inc  bc
L36B0: 			inc  bc
L36B1: 			inc  bc
L36B2: 			inc  bc
L36B3: 			ld   (bc),a
L36B4: 			ld   (bc),a
L36B5: 			ld   bc,$CF01
L36B8: 			dec  de
L36B9: 			inc  c
L36BA: 			ld   a,h
L36BB: 			rla
L36BC: 			dec  de
L36BD: 			dec  (hl)
L36BE: 			ld   a,h
L36BF: 			rla
L36C0: 			ld   e,$E8
L36C2: 			ld   (hl),$08
L36C4: 			add  hl,de
L36C5: 			ld   b,$5D
L36C7: 			ld   e,$CF
L36C9: 			ld   (hl),$07
L36CB: 			ld   ($DB1F),hl
L36CE: 			ld   (hl),$22
L36D0: 			ld   e,l
L36D1: 			ld   e,$D9
L36D3: 			ld   (hl),$19
L36D5: 			ld   (bc),a
L36D6: 			rra
L36D7: 			in   a,($36)
L36D9: 			add  hl,de
L36DA: 			inc  bc
L36DB: 			dec  de
L36DC: 			and  e
L36DD: 			ld   a,h
L36DE: 			rla
L36DF: 			ld   e,$E5
L36E1: 			ld   (hl),$07
L36E3: 			add  hl,de
L36E4: 			inc  b
L36E5: 			rra
L36E6: 			inc  b
L36E7: 			scf
L36E8: 			dec  de
L36E9: 			and  e
L36EA: 			ld   a,h
L36EB: 			rla
L36EC: 			ld   e,$FE
L36EE: 			ld   (hl),$19
L36F0: 			inc  bc
L36F1: 			ld   e,l
L36F2: 			ld   e,$F9
L36F4: 			ld   (hl),$22
L36F6: 			rra
L36F7: 			ei
L36F8: 			ld   (hl),$19
L36FA: 			ld   (bc),a
L36FB: 			rra
L36FC: 			inc  b
L36FD: 			scf
L36FE: 			ld   ($0E27),hl
L3701: 			xor  (hl)
L3702: 			ld   (hl),$17
L3704: 			dec  de
L3705: 			xor  d
L3706: 			ld   a,h
L3707: 			inc  b
L3708: 			inc  bc
L3709: 			ld   ($7CD3),a
L370C: 			ld   ($7C1E),a
L370F: 			ld   bc,$3715
L3712: 			jp   $2231
L3715: 			adc  a,b
L3716: 			nop
L3717: 			xor  a
L3718: 			ld   ($7CD2),a
L371B: 			ld   ($7CD9),a
L371E: 			ld   ($7CB3),a
L3721: 			ld   ($7C1E),a
L3724: 			ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3725: 			rst  08
L3726: 			dec  de
L3727: 			or   h
L3728: 			ld   a,h
L3729: 			inc  (hl)
L372A: 			dec  de
L372B: 			or   l
L372C: 			ld   a,h
L372D: 			rla
L372E: 			ld   e,$3A
L3730: 			scf
L3731: 			ld   h,h
L3732: 			dec  de
L3733: 			or   l
L3734: 			ld   a,h
L3735: 			inc  (hl)
L3736: 			ld   a,l
L3737: 			rra
L3738: 			ld   e,b
L3739: 			scf
L373A: 			dec  de
L373B: 			dec  de
L373C: 			ld   a,h
L373D: 			rla
L373E: 			ld   e,$54
L3740: 			scf
L3741: 			dec  de
L3742: 			ld   a,(bc)
L3743: 			ld   a,h
L3744: 			rla
L3745: 			ld   e,$4E
L3747: 			scf
L3748: 			dec  de
L3749: 			ld   l,c
L374A: 			cpl
L374B: 			rra
L374C: 			ld   d,c
L374D: 			scf
L374E: 			dec  de
L374F: 			ld   c,a
L3750: 			cpl
L3751: 			rra
L3752: 			ld   d,a
L3753: 			scf
L3754: 			dec  de
L3755: 			add  hl,sp
L3756: 			cpl
L3757: 			ld   a,b
L3758: 			inc  bc
L3759: 			ld   hl,$0F23
L375C: 			xor  a
L375D: 			ld   ($7CA4),a
L3760: 			di
L3761: 			ld   ($7E35),hl
L3764: 			ld   ($7E16),hl
L3767: 			ld   ($7DF7),hl
L376A: 			call $11FB
L376D: 			ei
L376E: 			ret
L376F: 			ld   de,$0201
L3772: 			ld   a,($7C0A)
L3775: 			and  a
L3776: 			jr   z,$377B
L3778: 			ld   de,$0102
L377B: 			ld   a,($7CD3)
L377E: 			and  a
L377F: 			jp   z,$380A
L3782: 			ld   a,($7C35)
L3785: 			and  a
L3786: 			jr   z,$37A5
L3788: 			ld   a,($7C1B)
L378B: 			and  a
L378C: 			jr   z,$3790
L378E: 			ld   e,$02
L3790: 			push de
L3791: 			di
L3792: 			push ix
L3794: 			push iy
L3796: 			ld   d,$0A
L3798: 			call $2C90
L379B: 			pop  iy
L379D: 			pop  ix
L379F: 			ei
L37A0: 			pop  de
L37A1: 			xor  $01
L37A3: 			jr   $37A9
L37A5: 			in   a,($10)
L37A7: 			and  d
L37A8: 			xor  d
L37A9: 			ld   ($7CD7),a
L37AC: 			ld   a,($7CD8)
L37AF: 			and  a
L37B0: 			ret  z
L37B1: 			ld   a,($7CA6)
L37B4: 			and  a
L37B5: 			ret  nz
L37B6: 			ld   a,($7CB7)
L37B9: 			and  a
L37BA: 			jr   z,$37C0
L37BC: 			in   a,($10)
L37BE: 			and  e
L37BF: 			ret  nz
L37C0: 			inc  a
L37C1: 			ld   ($7C1E),a
L37C4: 			xor  a
L37C5: 			ld   ($7CA1),a
L37C8: 			ld   ($7CD3),a
L37CB: 			ld   a,($7CB0)
L37CE: 			and  a
L37CF: 			jr   nz,$37D9
L37D1: 			ld   bc,$37D7
L37D4: 			jp   $1268
L37D7: 			adc  a,c
L37D8: 			nop
L37D9: 			xor  a
L37DA: 			ld   ($7CB1),a
L37DD: 			ld   ($7CB2),a
L37E0: 			ld   ($7CB0),a
L37E3: 			ld   hl,$0F9C
L37E6: 			ld   ($7D5C),hl
L37E9: 			ld   ($7CD8),a
L37EC: 			ld   ($7D5E),a
L37EF: 			ld   a,$4A
L37F1: 			ld   ($7CC1),a
L37F4: 			ld   ($7CD9),a
L37F7: 			ld   hl,$7D56
L37FA: 			ld   ($7C4F),hl
L37FD: 			ld   hl,$7D67
L3800: 			set  7,(hl)
L3802: 			call $11A5
L3805: 			xor  a
L3806: 			ld   ($7C1E),a
L3809: 			ret
L380A: 			ld   a,($7C35)
L380D: 			and  a
L380E: 			jr   z,$3825
L3810: 			ld   a,($7C07)
L3813: 			add  a,$98
L3815: 			ld   d,a
L3816: 			ld   a,($7E5E)
L3819: 			cp   d
L381A: 			ret  c
L381B: 			ld   a,($7E5A)
L381E: 			sbc  a,$26
L3820: 			cp   $04
L3822: 			ret  nc
L3823: 			jr   $3829
L3825: 			in   a,($10)
L3827: 			and  d
L3828: 			ret  nz
L3829: 			ld   a,($7CB3)
L382C: 			and  a
L382D: 			ret  z
L382E: 			ld   ($7CD5),a
L3831: 			ret

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3832: 			rst  08
L3833: 			dec  de
L3834: 			nop
L3835: 			inc  e
L3836: 			dec  de
L3837: 			nop
L3838: 			ld   a,(bc)
L3839: 			dec  de
L383A: 			jr   z,$3844
L383C: 			ld   l,$0C
L383E: 			ld   c,c
L383F: 			ld   c,(hl)
L3840: 			ld   d,e
L3841: 			ld   b,l
L3842: 			ld   d,d
L3843: 			ld   d,h
L3844: 			jr   nz,$3889
L3846: 			ld   c,a
L3847: 			ld   c,c
L3848: 			ld   c,(hl)
L3849: 			ld   d,e
L384A: 			cpl
L384B: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L384C: 			rst  08
L384D: 			adc  a,d
L384E: 			dec  de
L384F: 			ld   ($3538),a
L3852: 			dec  de
L3853: 			add  hl,bc
L3854: 			ld   a,h
L3855: 			rla
L3856: 			ld   e,$C6
L3858: 			jr   c,$3875
L385A: 			nop
L385B: 			inc  c
L385C: 			dec  de
L385D: 			nop
L385E: 			ld   a,(de)
L385F: 			dec  de
L3860: 			jr   z,$386A
L3862: 			ld   l,$1C
L3864: 			ld   sp,$4320
L3867: 			ld   c,a
L3868: 			ld   c,c
L3869: 			ld   c,(hl)
L386A: 			jr   nz,$38BC
L386C: 			ld   b,l
L386D: 			ld   d,d
L386E: 			jr   nz,$38C0
L3870: 			ld   c,h
L3871: 			ld   b,c
L3872: 			ld   e,c
L3873: 			ld   b,l
L3874: 			ld   d,d
L3875: 			jr   nz,$38A8
L3877: 			ld   d,e
L3878: 			ld   d,h
L3879: 			jr   nz,$38C4
L387B: 			ld   c,(hl)
L387C: 			ld   c,(hl)
L387D: 			ld   c,c
L387E: 			ld   c,(hl)
L387F: 			ld   b,a
L3880: 			cpl
L3881: 			dec  de
L3882: 			nop
L3883: 			rla
L3884: 			dec  de
L3885: 			nop
L3886: 			ld   hl,($281B)
L3889: 			ex   af,af'
L388A: 			ld   l,$11
L388C: 			ld   sp,$4320
L388F: 			ld   c,a
L3890: 			ld   c,c
L3891: 			ld   c,(hl)
L3892: 			jr   nz,$38E4
L3894: 			ld   b,l
L3895: 			ld   d,d
L3896: 			jr   nz,$38E8
L3898: 			ld   c,h
L3899: 			ld   b,c
L389A: 			ld   e,c
L389B: 			ld   b,l
L389C: 			ld   d,d
L389D: 			cpl
L389E: 			dec  de
L389F: 			nop
L38A0: 			rrca
L38A1: 			dec  de
L38A2: 			nop
L38A3: 			ld   a,($281B)
L38A6: 			ex   af,af'
L38A7: 			ld   l,$19
L38A9: 			ld   b,l
L38AA: 			ld   b,c
L38AB: 			ld   b,e
L38AC: 			ld   c,b
L38AD: 			jr   nz,$38F0
L38AF: 			ld   b,h
L38B0: 			ld   b,h
L38B1: 			ld   c,c
L38B2: 			ld   d,h
L38B3: 			ld   c,c
L38B4: 			ld   c,a
L38B5: 			ld   c,(hl)
L38B6: 			ld   b,c
L38B7: 			ld   c,h
L38B8: 			jr   nz,$38EC
L38BA: 			jr   nz,$3905
L38BC: 			ld   c,(hl)
L38BD: 			ld   c,(hl)
L38BE: 			ld   c,c
L38BF: 			ld   c,(hl)
L38C0: 			ld   b,a
L38C1: 			ld   d,e
L38C2: 			cpl
L38C3: 			rra
L38C4: 			ld   de,$1B39
L38C7: 			nop
L38C8: 			jr   $38E5
L38CA: 			nop
L38CB: 			dec  e
L38CC: 			dec  de
L38CD: 			jr   z,$38D7
L38CF: 			ld   l,$12
L38D1: 			ld   sp,$4320
L38D4: 			ld   c,a
L38D5: 			ld   c,c
L38D6: 			ld   c,(hl)
L38D7: 			jr   nz,$390A
L38D9: 			ld   d,e
L38DA: 			ld   d,h
L38DB: 			jr   nz,$3926
L38DD: 			ld   c,(hl)
L38DE: 			ld   c,(hl)
L38DF: 			ld   c,c
L38E0: 			ld   c,(hl)
L38E1: 			ld   b,a
L38E2: 			jr   nz,$3913
L38E4: 			dec  de
L38E5: 			nop
L38E6: 			ex   af,af'
L38E7: 			dec  de
L38E8: 			nop
L38E9: 			jr   nc,$3906
L38EB: 			jr   z,$38F5
L38ED: 			ld   l,$21
L38EF: 			ld   sp,$4320
L38F2: 			ld   c,a
L38F3: 			ld   c,c
L38F4: 			ld   c,(hl)
L38F5: 			jr   nz,$393C
L38F7: 			ld   b,c
L38F8: 			ld   b,e
L38F9: 			ld   c,b
L38FA: 			jr   nz,$393D
L38FC: 			ld   b,h
L38FD: 			ld   b,h
L38FE: 			ld   c,c
L38FF: 			ld   d,h
L3900: 			ld   c,c
L3901: 			ld   c,a
L3902: 			ld   c,(hl)
L3903: 			ld   b,c
L3904: 			ld   c,h
L3905: 			jr   nz,$3939
L3907: 			jr   nz,$3952
L3909: 			ld   c,(hl)
L390A: 			ld   c,(hl)
L390B: 			ld   c,c
L390C: 			ld   c,(hl)
L390D: 			ld   b,a
L390E: 			ld   d,e
L390F: 			jr   nz,$3940
L3911: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3912: 			rst  08
L3913: 			dec  de
L3914: 			nop
L3915: 			rlca
L3916: 			dec  de
L3917: 			nop
L3918: 			djnz $3935
L391A: 			jr   z,$3924
L391C: 			ld   l,$21
L391E: 			ld   b,e
L391F: 			ld   c,a
L3920: 			ld   c,(hl)
L3921: 			ld   b,a
L3922: 			ld   d,d
L3923: 			ld   b,c
L3924: 			ld   d,h
L3925: 			ld   d,l
L3926: 			ld   c,h
L3927: 			ld   b,c
L3928: 			ld   d,h
L3929: 			ld   c,c
L392A: 			ld   c,a
L392B: 			ld   c,(hl)
L392C: 			ld   d,e
L392D: 			jr   nz,$3988
L392F: 			ld   c,a
L3930: 			ld   d,l
L3931: 			jr   nz,$3974
L3933: 			ld   d,d
L3934: 			ld   b,l
L3935: 			jr   nz,$398D
L3937: 			ld   b,l
L3938: 			ld   d,d
L3939: 			ld   e,c
L393A: 			jr   nz,$3983
L393C: 			ld   c,a
L393D: 			ld   c,a
L393E: 			ld   b,h
L393F: 			cpl
L3940: 			dec  de
L3941: 			nop
L3942: 			ld   c,$1B
L3944: 			nop
L3945: 			jr   z,$3962
L3947: 			jr   z,$3951
L3949: 			ld   l,$1A
L394B: 			ld   c,h
L394C: 			ld   b,l
L394D: 			ld   d,h
L394E: 			ld   d,e
L394F: 			jr   nz,$39A1
L3951: 			ld   c,h
L3952: 			ld   b,c
L3953: 			ld   e,c
L3954: 			jr   nz,$3997
L3956: 			ld   b,a
L3957: 			ld   b,c
L3958: 			ld   c,c
L3959: 			ld   c,(hl)
L395A: 			jr   nz,$39A5
L395C: 			jr   nz,$39B5
L395E: 			ld   c,c
L395F: 			ld   c,h
L3960: 			ld   c,h
L3961: 			jr   nz,$39A5
L3963: 			ld   d,l
L3964: 			ld   e,c
L3965: 			cpl
L3966: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3967: 			rst  08
L3968: 			dec  de
L3969: 			dec  c
L396A: 			ld   a,h
L396B: 			rla
L396C: 			dec  de
L396D: 			ld   c,$7C
L396F: 			rla
L3970: 			ld   h,$1E
L3972: 			sub  d
L3973: 			add  hl,sp
L3974: 			dec  de
L3975: 			nop
L3976: 			add  hl,de
L3977: 			dec  de
L3978: 			nop
L3979: 			djnz $3996
L397B: 			jr   z,$3985
L397D: 			ld   l,$0F
L397F: 			ld   d,h
L3980: 			ld   c,a
L3981: 			ld   c,a
L3982: 			jr   nz,$39C6
L3984: 			ld   b,c
L3985: 			ld   b,h
L3986: 			jr   nz,$39DF
L3988: 			ld   b,l
L3989: 			jr   nz,$39DF
L398B: 			ld   c,c
L398C: 			ld   b,l
L398D: 			ld   b,h
L398E: 			cpl
L398F: 			rra
L3990: 			xor  e
L3991: 			add  hl,sp
L3992: 			dec  de
L3993: 			nop
L3994: 			dec  de
L3995: 			dec  de
L3996: 			nop
L3997: 			djnz $39B4
L3999: 			jr   z,$39A3
L399B: 			ld   l,$0D
L399D: 			ld   d,h
L399E: 			ld   c,a
L399F: 			ld   c,a
L39A0: 			jr   nz,$39E4
L39A2: 			ld   b,c
L39A3: 			ld   b,h
L39A4: 			jr   nz,$39EF
L39A6: 			jr   nz,$39FF
L39A8: 			ld   c,a
L39A9: 			ld   c,(hl)
L39AA: 			cpl
L39AB: 			ld   a,c
L39AC: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L39AD: 			rst  08
L39AE: 			dec  de
L39AF: 			nop
L39B0: 			ld   a,(de)
L39B1: 			dec  de
L39B2: 			nop
L39B3: 			inc  l
L39B4: 			dec  de
L39B5: 			jr   z,$39BF
L39B7: 			ld   l,$0E
L39B9: 			ld   b,h
L39BA: 			ld   b,l
L39BB: 			ld   d,b
L39BC: 			ld   c,a
L39BD: 			ld   d,e
L39BE: 			ld   c,c
L39BF: 			ld   d,h
L39C0: 			jr   nz,$39F3
L39C2: 			jr   nz,$3A07
L39C4: 			ld   c,a
L39C5: 			ld   c,c
L39C6: 			ld   c,(hl)
L39C7: 			cpl
L39C8: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L39C9: 			rst  08
L39CA: 			dec  de
L39CB: 			nop
L39CC: 			rlca
L39CD: 			dec  de
L39CE: 			nop
L39CF: 			jr   $39EC
L39D1: 			jr   z,$39DB
L39D3: 			ld   l,$21
L39D5: 			ld   d,h
L39D6: 			ld   c,a
L39D7: 			jr   nz,$3A1C
L39D9: 			ld   c,a
L39DA: 			ld   c,(hl)
L39DB: 			ld   d,h
L39DC: 			ld   c,c
L39DD: 			ld   c,(hl)
L39DE: 			ld   d,l
L39DF: 			ld   b,l
L39E0: 			jr   nz,$3A29
L39E2: 			ld   b,c
L39E3: 			ld   c,l
L39E4: 			ld   b,l
L39E5: 			jr   nz,$3A28
L39E7: 			ld   d,h
L39E8: 			jr   nz,$3A2F
L39EA: 			ld   c,(hl)
L39EB: 			ld   b,h
L39EC: 			jr   nz,$3A3D
L39EE: 			ld   b,(hl)
L39EF: 			jr   nz,$3A3A
L39F1: 			ld   c,(hl)
L39F2: 			ld   c,(hl)
L39F3: 			ld   c,c
L39F4: 			ld   c,(hl)
L39F5: 			ld   b,a
L39F6: 			cpl
L39F7: 			dec  de
L39F8: 			ld   a,(de)
L39F9: 			ld   a,h
L39FA: 			rla
L39FB: 			ld   e,$31
L39FD: 			ld   a,($111B)
L3A00: 			ld   a,h
L3A01: 			rla
L3A02: 			ld   e,$09
L3A04: 			ld   a,($1F8B)
L3A07: 			ld   l,$3A
L3A09: 			dec  de
L3A0A: 			nop
L3A0B: 			rrca
L3A0C: 			dec  de
L3A0D: 			nop
L3A0E: 			inc  l
L3A0F: 			dec  de
L3A10: 			jr   z,$3A1A
L3A12: 			ld   l,$19
L3A14: 			ld   b,h
L3A15: 			ld   b,l
L3A16: 			ld   d,b
L3A17: 			ld   c,a
L3A18: 			ld   d,e
L3A19: 			ld   c,c
L3A1A: 			ld   d,h
L3A1B: 			jr   nz,$3A4E
L3A1D: 			jr   nz,$3A62
L3A1F: 			ld   c,a
L3A20: 			ld   c,c
L3A21: 			ld   c,(hl)
L3A22: 			jr   nz,$3A74
L3A24: 			ld   b,l
L3A25: 			ld   d,d
L3A26: 			jr   nz,$3A78
L3A28: 			ld   c,h
L3A29: 			ld   b,c
L3A2A: 			ld   e,c
L3A2B: 			ld   b,l
L3A2C: 			ld   d,d
L3A2D: 			cpl
L3A2E: 			rra
L3A2F: 			ld   ($8B3A),a
L3A32: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3A33: 			rst  08
L3A34: 			dec  de
L3A35: 			nop
L3A36: 			inc  d
L3A37: 			dec  de
L3A38: 			nop
L3A39: 			jr   nz,$3A56
L3A3B: 			jr   z,$3A45
L3A3D: 			ld   l,$15
L3A3F: 			ld   d,e
L3A40: 			ld   b,l
L3A41: 			ld   c,h
L3A42: 			ld   b,l
L3A43: 			ld   b,e
L3A44: 			ld   d,h
L3A45: 			jr   nz,$3A78
L3A47: 			jr   nz,$3A98
L3A49: 			ld   d,d
L3A4A: 			jr   nz,$3A7E
L3A4C: 			jr   nz,$3A9E
L3A4E: 			ld   c,h
L3A4F: 			ld   b,c
L3A50: 			ld   e,c
L3A51: 			ld   b,l
L3A52: 			ld   d,d
L3A53: 			ld   d,e
L3A54: 			cpl
L3A55: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3A56: 			rst  08
L3A57: 			dec  de
L3A58: 			add  hl,bc
L3A59: 			ld   a,h
L3A5A: 			rla
L3A5B: 			ld   e,$BD
L3A5D: 			ld   a,($111B)
L3A60: 			ld   a,h
L3A61: 			rla
L3A62: 			ld   ($1E7F),hl
L3A65: 			ld   l,e
L3A66: 			ld   a,($1F8C)
L3A69: 			cp   d
L3A6A: 			ld   a,($001B)
L3A6D: 			ld   c,$1B
L3A6F: 			nop
L3A70: 			ld   a,(de)
L3A71: 			dec  de
L3A72: 			jr   z,$3A7C
L3A74: 			ld   l,$1A
L3A76: 			ld   d,e
L3A77: 			ld   b,l
L3A78: 			ld   c,h
L3A79: 			ld   b,l
L3A7A: 			ld   b,e
L3A7B: 			ld   d,h
L3A7C: 			jr   nz,$3AAF
L3A7E: 			jr   nz,$3AD0
L3A80: 			ld   c,h
L3A81: 			ld   b,c
L3A82: 			ld   e,c
L3A83: 			ld   b,l
L3A84: 			ld   d,d
L3A85: 			jr   nz,$3AD6
L3A87: 			ld   d,d
L3A88: 			jr   nz,$3ACE
L3A8A: 			ld   b,l
L3A8B: 			ld   d,b
L3A8C: 			ld   c,a
L3A8D: 			ld   d,e
L3A8E: 			ld   c,c
L3A8F: 			ld   d,h
L3A90: 			cpl
L3A91: 			dec  de
L3A92: 			nop
L3A93: 			rrca
L3A94: 			dec  de
L3A95: 			nop
L3A96: 			jr   nc,$3AB3
L3A98: 			jr   z,$3AA2
L3A9A: 			ld   l,$19
L3A9C: 			ld   sp,$4D20
L3A9F: 			ld   c,a
L3AA0: 			ld   d,d
L3AA1: 			ld   b,l
L3AA2: 			jr   nz,$3AE7
L3AA4: 			ld   c,a
L3AA5: 			ld   c,c
L3AA6: 			ld   c,(hl)
L3AA7: 			jr   nz,$3AEF
L3AA9: 			ld   c,a
L3AAA: 			ld   d,d
L3AAB: 			jr   nz,$3ADF
L3AAD: 			jr   nz,$3AFF
L3AAF: 			ld   c,h
L3AB0: 			ld   b,c
L3AB1: 			ld   e,c
L3AB2: 			ld   b,l
L3AB3: 			ld   d,d
L3AB4: 			ld   d,e
L3AB5: 			cpl
L3AB6: 			dec  de
L3AB7: 			adc  a,d
L3AB8: 			ld   a,h
L3AB9: 			jr   nc,$3ADA
L3ABB: 			cp   (hl)
L3ABC: 			ld   a,($038C)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3ABF: 			rst  08
L3AC0: 			adc  a,d
L3AC1: 			add  hl,de
L3AC2: 			ld   ($491B),a
L3AC5: 			ld   a,h
L3AC6: 			inc  b
L3AC7: 			dec  de
L3AC8: 			dec  (hl)
L3AC9: 			ld   a,h
L3ACA: 			jr   nc,$3AE7
L3ACC: 			inc  (hl)
L3ACD: 			ld   a,h
L3ACE: 			jr   nc,$3A54
L3AD0: 			add  hl,de
L3AD1: 			ld   hl,($B619)
L3AD4: 			add  hl,de
L3AD5: 			ld   c,l
L3AD6: 			add  hl,de
L3AD7: 			ex   af,af'
L3AD8: 			ld   c,l
L3AD9: 			dec  de
L3ADA: 			ret  nz
L3ADB: 			ex   af,af'
L3ADC: 			dec  de
L3ADD: 			ld   (de),a
L3ADE: 			ld   a,h
L3ADF: 			ld   (bc),a
L3AE0: 			dec  de
L3AE1: 			inc  c
L3AE2: 			ld   a,h
L3AE3: 			inc  (hl)
L3AE4: 			dec  de
L3AE5: 			djnz $3B63
L3AE7: 			inc  (hl)
L3AE8: 			add  hl,de
L3AE9: 			add  hl,bc
L3AEA: 			dec  de
L3AEB: 			ex   af,af'
L3AEC: 			ld   a,h
L3AED: 			inc  b
L3AEE: 			add  a,(hl)
L3AEF: 			dec  de
L3AF0: 			djnz $3B6E
L3AF2: 			jr   nc,$3B0F
L3AF4: 			ex   af,af'
L3AF5: 			ld   a,h
L3AF6: 			inc  (hl)
L3AF7: 			dec  de
L3AF8: 			dec  c
L3AF9: 			ld   a,h
L3AFA: 			adc  a,l
L3AFB: 			ld   d,c
L3AFC: 			dec  de
L3AFD: 			ld   b,$7C
L3AFF: 			inc  (hl)
L3B00: 			dec  de
L3B01: 			sbc  a,e
L3B02: 			ld   a,h
L3B03: 			rla
L3B04: 			ld   e,$0C
L3B06: 			dec  sp
L3B07: 			dec  de
L3B08: 			sbc  a,e
L3B09: 			ld   a,h
L3B0A: 			inc  (hl)
L3B0B: 			scf
L3B0C: 			add  hl,de
L3B0D: 			djnz $3B89
L3B0F: 			adc  a,(hl)
L3B10: 			dec  de
L3B11: 			ld   e,$7C
L3B13: 			inc  (hl)
L3B14: 			add  hl,de
L3B15: 			ld   h,b
L3B16: 			ld   a,d
L3B17: 			dec  de
L3B18: 			ld   e,$7C
L3B1A: 			jr   nc,$3AAA
L3B1C: 			dec  de
L3B1D: 			ld   de,$177C
L3B20: 			ld   e,$24
L3B22: 			dec  sp
L3B23: 			adc  a,d
L3B24: 			dec  de
L3B25: 			add  hl,de
L3B26: 			ld   a,h
L3B27: 			jr   nc,$3B44
L3B29: 			ld   a,(bc)
L3B2A: 			ld   a,h
L3B2B: 			inc  (hl)
L3B2C: 			scf
L3B2D: 			rlca
L3B2E: 			dec  c
L3B2F: 			dec  de
L3B30: 			dec  bc
L3B31: 			ld   a,h
L3B32: 			inc  (hl)
L3B33: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3B34: 			rst  08		; Twine to find our way back
L3B35:		.DB	$1B, $28, $7C	; -- $7C28
L3B38:		.DB	$34		; dec c, inc hl, inc de set up for loop?
L3B39:		.DB	$1B, $1E, $7C	; -- $7C1E
L3B3C:		.DB	$30		; Save to $0323
		.DB	$48		; Call long ass routine ???
L3B3E:		.DB	$19, $30	; -- $0030
		.DB	$08		; DUP
L3B41:		.DB	$08		; DUP
L3B42:		.DB	$1B, $49,$7C	; -- $7C49
L3B45:		.DB	$04		; c!
L3B46:		.DB	$1B, $96, $7C	; -- $7C96
L3B49:		.DB	$04		; c!
L3B4A:		.DB	$1B, $95, $7C	; -- $7C96
L3B4D:		.DB	$04		; c!
L3B4E:		.DB	$19, $12      	; -- $0012
L3B50:		.DB	$7E        	; Read from port
L3B51:		.DB	$22		; -- $0001
		.DB	$1A		;
		.DB	$22  		; -- $0001
L3B54:		.DB	$1C		; XOR
L3B55:		.DB	$1B        	; -- $7C09
L3B56:		.DB	$09
L3B57:		.DB	$7C
L3B58:		.DB	$04        	; c!
L3B59:		.DB	$1B        	; -- $7C0B
L3B5A:		.DB	$0B
L3B5B:		.DB	$7C
L3B5C:		.DB	$08		; DUP
L3B5D:		.DB	$17        	;
L3B5E:		.DB	$22, $1C, $08
L3B61:		.DB	$05
L3B62:		.DB	$04
L3B63:		.DB	$1B
L3B64:		.DB	$06, $7C
L3B66:		.DB	$17
L3B67:		.DB	$1E, $79
L3B69:		.DB	$3B
L3B6A:		.DB	$08
L3B6B:		.DB	$1E, $75
L3B6D:		.DB	$3B
L3B6E:		.DB	$1B
L3B6F:		.DB	$35
L3B70:		.DB	$7C
L3B71:		.DB	$30, $1F
L3B73:		.DB	$79
L3B74:		.DB	$3B
L3B75:		.DB	$1B
L3B76:		.DB	$34
L3B77:		.DB	$7C
L3B78:		.DB	$30, $1B
L3B7A:		.DB	$19
L3B7B:		.DB	$7C
L3B7C:		.DB	$17
L3B7D:		.DB	$1E, $85
L3B7F:		.DB	$3B
L3B80:		.DB	$8A
L3B81:		.DB	$8F
L3B82:		.DB	$1F
L3B83:		.DB	$12
L3B84:		.DB	$3C
L3B85:		.DB	$1B
L3B86:		.DB	$10, $7C
L3B88:		.DB	$17
L3B89:		.DB	$1E, $07
L3B8B:		.DB	$3C
L3B8C:		.DB	$1B
L3B8D:		.DB	$06, $7C
L3B8F:		.DB	$17
L3B90:		.DB	$1E, $C8
L3B92:		.DB	$3B
L3B93:		.DB	$1B
L3B94:		.DB	$0D
L3B95:		.DB	$7C
L3B96:		.DB	$17
L3B97:		.DB	$1B
L3B98:		.DB	$0E, $7C
L3B9A:		.DB	$17
L3B9B:		.DB	$5C
L3B9C:		.DB	$1E, $B4
L3B9E:		.DB	$3B
L3B9F:		.DB	$90
L3BA0:		.DB	$19
L3BA1:		.DB	$50
L3BA2:		.DB	$7A
L3BA3:		.DB	$1B
L3BA4:		.DB	$08
L3BA5:		.DB	$7C
L3BA6:		.DB	$63
L3BA7:		.DB	$86
L3BA8:		.DB	$90
L3BA9:		.DB	$1B
L3BAA:		.DB	$10, $7C
L3BAC:		.DB	$34
L3BAD:		.DB	$1B
L3BAE:		.DB	$A3
L3BAF:		.DB	$7C
L3BB0:		.DB	$30, $1F
L3BB2:		.DB	$C5
L3BB3:		.DB	$3B
L3BB4:		.DB	$91
L3BB5:		.DB	$19
L3BB6:		.DB	$A0
L3BB7:		.DB	$7A
L3BB8:		.DB	$91
L3BB9:		.DB	$1B
L3BBA:		.DB	$11, $7C, $17
L3BBD:		.DB	$1E, $C4
L3BBF:		.DB	$3B
L3BC0:		.DB	$92
L3BC1:		.DB	$1F
L3BC2:		.DB	$C5
L3BC3:		.DB	$3B
L3BC4:		.DB	$8F
L3BC5:		.DB	$1F
L3BC6:		.DB	$04
L3BC7:		.DB	$3C
L3BC8:		.DB	$1B
L3BC9:		.DB	$09
L3BCA:		.DB	$7C
L3BCB:		.DB	$17
L3BCC:		.DB	$1E, $FB
L3BCE:		.DB	$3B
L3BCF:		.DB	$1B
L3BD0:		.DB	$1A
L3BD1:		.DB	$7C
L3BD2:		.DB	$34
L3BD3:		.DB	$1B
L3BD4:		.DB	$11, $7C, $17
L3BD7:		.DB	$22, $26, $1E
L3BDA:		.DB	$E0
L3BDB:		.DB	$3B
L3BDC:		.DB	$93
L3BDD:		.DB	$1F
L3BDE:		.DB	$F4, $3B, $94
L3BE1:		.DB	$08
L3BE2:		.DB	$1E, $F2
L3BE4:		.DB	$3B
L3BE5:		.DB	$22, $26, $1E
L3BE8:		.DB	$EE, $3B
L3BEA:		.DB	$93
L3BEB:		.DB	$1F
L3BEC:		.DB	$EF
L3BED:		.DB	$3B
L3BEE:		.DB	$92
L3BEF:		.DB	$1F
L3BF0:		.DB	$F4, $3B, $07
L3BF3:		.DB	$8F
L3BF4:		.DB	$1B
L3BF5:		.DB	$1A
L3BF6:		.DB	$7C
L3BF7:		.DB	$30, $1F
L3BF9:		.DB	$04
L3BFA:		.DB	$3C
L3BFB:		.DB	$94
L3BFC:		.DB	$1E, $03
L3BFE:		.DB	$3C
L3BFF:		.DB	$92
L3C00:		.DB	$1F
L3C01:		.DB	$04
L3C02:		.DB	$3C
L3C03:		.DB	$8F
L3C04:		.DB	$1F
L3C05:		.DB	$12
L3C06:		.DB	$3C
L3C07:		.DB	$1B
L3C08:		.DB	$18, $7C
L3C0A:		.DB	$17
L3C0B:		.DB	$1E, $11
L3C0D:		.DB	$3C
L3C0E:		.DB	$1F
L3C0F:		.DB	$12
L3C10:		.DB	$3C
L3C11:		.DB	$92
L3C12:		.DB	$1B
L3C13:		.DB	$1B
L3C14:		.DB	$7C
L3C15:		.DB	$17
L3C16:		.DB	$1E, $3C
L3C18:		.DB	$3C
L3C19:		.DB	$1B
L3C1A:		.DB	$19
L3C1B:		.DB	$7C
L3C1C:		.DB	$17
L3C1D:		.DB	$1E, $23
L3C1F:		.DB	$3C
L3C20:		.DB	$1F
L3C21:		.DB	$3C
L3C22:		.DB	$3C
L3C23:		.DB	$1B
L3C24:		.DB	$06, $7C
L3C26:		.DB	$17
L3C27:		.DB	$1E, $2D
L3C29:		.DB	$3C
L3C2A:		.DB	$1F
L3C2B:		.DB	$3C
L3C2C:		.DB	$3C
L3C2D:		.DB	$08
L3C2E:		.DB	$1B
L3C2F:		.DB	$0A
L3C30:		.DB	$7C
L3C31:		.DB	$04
L3C32:		.DB	$1B
L3C33:		.DB	$0C
L3C34:		.DB	$7C
L3C35:		.DB	$17
L3C36:		.DB	$1E, $3C
L3C38:		.DB	$3C
L3C39:		.DB	$7C
L3C3A:		.DB	$7D
L3C3B:		.DB	$86
L3C3C:		.DB	$1E, $5D
L3C3E:		.DB	$3C
L3C3F:		.DB	$1B
L3C40:		.DB	$12
L3C41:		.DB	$7C
L3C42:		.DB	$24
L3C43:		.DB	$1B
L3C44:		.DB	$00
L3C45:		.DB	$B7
L3C46:		.DB	$1B
L3C47:		.DB	$BF
L3C48:		.DB	$04
L3C49:		.DB	$1B
L3C4A:		.DB	$0C
L3C4B:		.DB	$7C
L3C4C:		.DB	$17
L3C4D:		.DB	$1B
L3C4E:		.DB	$08
L3C4F:		.DB	$7C
L3C50:		.DB	$17
L3C51:		.DB	$26, $1E
L3C53:		.DB	$5A
L3C54:		.DB	$3C
L3C55:		.DB	$95
L3C56:		.DB	$19
L3C57:		.DB	$30, $7A
L3C59:		.DB	$95
L3C5A:		.DB	$1F
L3C5B:		.DB	$98
L3C5C:		.DB	$3C
L3C5D:		.DB	$1B
L3C5E:		.DB	$0C
L3C5F:		.DB	$7C
L3C60:		.DB	$08
L3C61:		.DB	$63
L3C62:		.DB	$17
L3C63:		.DB	$19
L3C64:		.DB	$0A
L3C65:		.DB	$26, $1E
L3C67:		.DB	$86
L3C68:		.DB	$3C
L3C69:		.DB	$1B
L3C6A:		.DB	$14
L3C6B:		.DB	$7C
L3C6C:		.DB	$17
L3C6D:		.DB	$1E, $73
L3C6F:		.DB	$3C
L3C70:		.DB	$1F
L3C71:		.DB	$75
L3C72:		.DB	$3C
L3C73:		.DB	$85
L3C74:		.DB	$86
L3C75:		.DB	$84
L3C76:		.DB	$19
L3C77:		.DB	$2A, $19, $B6
L3C7A:		.DB	$19
L3C7B:		.DB	$4D
L3C7C:		.DB	$19
L3C7D:		.DB	$08
L3C7E:		.DB	$4D
L3C7F:		.DB	$1B
L3C80:		.DB	$C0
L3C81:		.DB	$08
L3C82:		.DB	$1B
L3C83:		.DB	$12
L3C84:		.DB	$7C
L3C85:		.DB	$02
L3C86:		.DB	$1B
L3C87:		.DB	$12
L3C88:		.DB	$7C
L3C89:		.DB	$08
L3C8A:		.DB	$24
L3C8B:		.DB	$1B
L3C8C:		.DB	$00
L3C8D:		.DB	$02
L3C8E:		.DB	$14
L3C8F:		.DB	$08
L3C90:		.DB	$05
L3C91:		.DB	$02
L3C92:		.DB	$1B
L3C93:		.DB	$00
L3C94:		.DB	$B6
L3C95:		.DB	$1B
L3C96:		.DB	$BA
L3C97:		.DB	$04
L3C98:		.DB	$1B
L3C99:		.DB	$01, $05, $1B
L3C9C:		.DB	$28, $08
L3C9E:		.DB	$2A, $1B, $9B
L3CA1:		.DB	$7C
L3CA2:		.DB	$17
L3CA3:		.DB	$1E, $AD
L3CA5:		.DB	$3C
L3CA6:		.DB	$1B
L3CA7:		.DB	$9C
L3CA8:		.DB	$7C
L3CA9:		.DB	$30, $1F
L3CAB:		.DB	$B2
L3CAC:		.DB	$3C
L3CAD:		.DB	$1B
L3CAE:		.DB	$68
L3CAF:		.DB	$12
L3CB0:		.DB	$96
L3CB1:		.DB	$35
L3CB2:		.DB	$97
L3CB3:		.DB	$98
L3CB4:		.DB	$52
L3CB5:		.DB	$1B
L3CB6:		.DB	$B6
L3CB7:		.DB	$7C
L3CB8:		.DB	$34
L3CB9:		.DB	$19
L3CBA:		.DB	$03
L3CBB:		.DB	$1B
L3CBC:		.DB	$3D
L3CBD:		.DB	$7C
L3CBE:		.DB	$04
L3CBF:		.DB	$99
L3CC0:		.DB	$1B
L3CC1:		.DB	$06, $7C
L3CC3:		.DB	$17
L3CC4:		.DB	$1E, $CB
L3CC6:		.DB	$3C
L3CC7:		.DB	$9A
L3CC8:		.DB	$1F
L3CC9:		.DB	$D6, $3C
L3CCB:		.DB	$1B
L3CCC:		.DB	$1B
L3CCD:		.DB	$7C
L3CCE:		.DB	$17
L3CCF:		.DB	$1E, $D5
L3CD1:		.DB	$3C
L3CD2:		.DB	$1F
L3CD3:		.DB	$D6, $3C
L3CD5:		.DB	$9A
L3CD6:		.DB	$1B
L3CD7:		.DB	$D3, $7C
L3CD9:		.DB	$30, $64
L3CDB:		.DB	$7D
L3CDC:		.DB	$1B
L3CDD:		.DB	$1E, $7C
L3CDF:		.DB	$34
L3CE0:		.DB	$03

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3CE1: 			rst  08
L3CE2: 			dec  de
L3CE3: 			ld   e,$7C
L3CE5: 			jr   nc,$3D2F
L3CE7: 			dec  de
L3CE8: 			inc  c
L3CE9: 			ld   a,h
L3CEA: 			inc  (hl)
L3CEB: 			dec  de
L3CEC: 			dec  c
L3CED: 			ld   a,h
L3CEE: 			adc  a,l
L3CEF: 			dec  de
L3CF0: 			jr   z,$3D6E
L3CF2: 			rla
L3CF3: 			ld   e,$F9
L3CF5: 			inc  a
L3CF6: 			rra
L3CF7: 			jp   m,$9B3C
L3CFA: 			ld   a,h
L3CFB: 			ld   a,l
L3CFC: 			dec  de
L3CFD: 			jr   z,$3D7B
L3CFF: 			jr   nc,$3D1C
L3D01: 			cp   e
L3D02: 			ld   a,h
L3D03: 			jr   nc,$3CA1
L3D05: 			dec  de
L3D06: 			cp   h
L3D07: 			ld   a,h
L3D08: 			inc  (hl)
L3D09: 			add  a,(hl)
L3D0A: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3D0B: 			rst  08
L3D0C: 			sbc  a,h
L3D0D: 			add  a,(hl)
L3D0E: 			dec  de
L3D0F: 			dec  bc
L3D10: 			ld   a,h
L3D11: 			jr   nc,$3D2E
L3D13: 			adc  a,d
L3D14: 			ld   a,h
L3D15: 			inc  (hl)
L3D16: 			dec  de
L3D17: 			djnz $3D95
L3D19: 			inc  (hl)
L3D1A: 			dec  de
L3D1B: 			add  hl,bc
L3D1C: 			ld   a,h
L3D1D: 			rla
L3D1E: 			ld   e,$25
L3D20: 			dec  a
L3D21: 			sbc  a,l
L3D22: 			rra
L3D23: 			ld   h,$3D
L3D25: 			add  a,(hl)
L3D26: 			dec  de
L3D27: 			add  hl,de
L3D28: 			ld   a,h
L3D29: 			inc  (hl)
L3D2A: 			dec  de
L3D2B: 			ld   b,$7C
L3D2D: 			rla
L3D2E: 			ld   e,$3A
L3D30: 			dec  a
L3D31: 			sbc  a,(hl)
L3D32: 			add  hl,de
L3D33: 			ld   d,b
L3D34: 			ld   (hl),$9E
L3D36: 			sbc  a,d
L3D37: 			rra
L3D38: 			ld   b,l
L3D39: 			dec  a
L3D3A: 			dec  de
L3D3B: 			dec  de
L3D3C: 			ld   a,h
L3D3D: 			rla
L3D3E: 			ld   e,$44
L3D40: 			dec  a
L3D41: 			rra
L3D42: 			ld   b,l
L3D43: 			dec  a
L3D44: 			sbc  a,d
L3D45: 			dec  de
L3D46: 			ret  nz
L3D47: 			ex   af,af'
L3D48: 			dec  de
L3D49: 			ld   (de),a
L3D4A: 			ld   a,h
L3D4B: 			ld   (bc),a
L3D4C: 			dec  de
L3D4D: 			jr   $3DCB
L3D4F: 			jr   nc,$3CF0
L3D51: 			dec  de
L3D52: 			jr   $3DD0
L3D54: 			inc  (hl)
L3D55: 			dec  c
L3D56: 			ld   c,$9B
L3D58: 			dec  bc
L3D59: 			rrca
L3D5A: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$A2
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3D5B: 			rst  08			;Save where we came from
L3D5C: 			.DB  $A0		; DI

L3D5D: 			.DB  $0D		; $0000 to PS
L3D5E: 			.DB  $1B,$00,$7C	; $7C00 to PS
L3D61: 			.DB  $1B,$00,$03	; $0300 to PS
L3D64: 			.DB  $44		; FILL $7C00-$7F00 with $00

L3D65: 			.DB  $A1		; Save some variables
L3D66: 			.DB  $19,$11		; $11 to PS
 			.DB  $7E		; Read Port to PS
			.DB  $19,$10		; $10 to PS
			.DB  $1A
L3D6C: 			.DB  $19
L3D6D: 			.DB  $10,$1C
L3D6F: 			.DB  $1B
L3D70: 			.DB  $1B
L3D71: 			.DB  $7C
L3D72: 			.DB  $04
L3D73: 			.DB  $19
L3D74: 			.DB  $06,$1B
L3D76: 			.DB  $15
L3D77: 			.DB  $7C
L3D78: 			.DB  $04
L3D79: 			.DB  $19
L3D7A: 			.DB  $06,$1B
L3D7C: 			.DB  $15
L3D7D: 			.DB  $7C
L3D7E: 			.DB  $04
L3D7F: 			.DB  $1B
L3D80: 			.DB  $19
L3D81: 			.DB  $7C
L3D82: 			.DB  $30,$1B
L3D84: 			.DB  $1E,$7C
L3D86: 			.DB  $30,$7D
L3D88: 			.DB  $7C
L3D89: 			.DB  $7D
L3D8A: 			.DB  $8A
L3D8B: 			.DB  $03

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3D8C: 			rst  08
L3D8D: 			dec  de
L3D8E: 			ex   af,af'
L3D8F: 			ld   a,h
L3D90: 			rla
L3D91: 			ex   af,af'
L3D92: 			ld   e,$A9
L3D94: 			dec  a
L3D95: 			dec  de
L3D96: 			inc  c
L3D97: 			ld   a,h
L3D98: 			rla
L3D99: 			daa
L3D9A: 			dec  de
L3D9B: 			ld   a,(de)
L3D9C: 			ld   a,h
L3D9D: 			rla
L3D9E: 			ld   e,$A4
L3DA0: 			dec  a
L3DA1: 			rra
L3DA2: 			xor  c
L3DA3: 			dec  a
L3DA4: 			ex   af,af'
L3DA5: 			ld   e,$A9
L3DA7: 			dec  a
L3DA8: 			ld   e,c
L3DA9: 			dec  de
L3DAA: 			ld   de,$177C
L3DAD: 			inc  d
L3DAE: 			and  d
L3DAF: 			ex   af,af'
L3DB0: 			ld   e,$BE
L3DB2: 			dec  a
L3DB3: 			dec  de
L3DB4: 			ld   de,$047C
L3DB7: 			dec  de
L3DB8: 			inc  d
L3DB9: 			ld   a,h
L3DBA: 			jr   nc,$3DDB
L3DBC: 			cp   a
L3DBD: 			dec  a
L3DBE: 			rlca
L3DBF: 			dec  de
L3DC0: 			djnz $3E3E
L3DC2: 			jr   nc,$3D63
L3DC4: 			dec  de
L3DC5: 			rra
L3DC6: 			ld   a,h
L3DC7: 			inc  (hl)
L3DC8: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3DC9: 			rst  08
L3DCA: 			add  hl,de
L3DCB: 			djnz $3E4B
L3DCD: 			ex   af,af'
L3DCE: 			add  hl,de
L3DCF: 			djnz $3DEB
L3DD1: 			add  hl,de
L3DD2: 			djnz $3DF0
L3DD4: 			ld   e,$F0
L3DD6: 			dec  a
L3DD7: 			rlca
L3DD8: 			dec  de
L3DD9: 			ld   b,$7C
L3DDB: 			jr   nc,$3D80
L3DDD: 			dec  de
L3DDE: 			nop
L3DDF: 			ex   af,af'
L3DE0: 			dec  de
L3DE1: 			nop
L3DE2: 			ld   (hl),b
L3DE3: 			dec  de
L3DE4: 			sbc  a,b
L3DE5: 			inc  b
L3DE6: 			dec  de
L3DE7: 			inc  b
L3DE8: 			dec  b
L3DE9: 			dec  de
L3DEA: 			jr   z,$3DF4
L3DEC: 			ld   hl,($101F)
L3DEF: 			ld   a,$1B
L3DF1: 			adc  a,d
L3DF2: 			ld   a,h
L3DF3: 			rla
L3DF4: 			ld   e,$FB
L3DF6: 			dec  a
L3DF7: 			rlca
L3DF8: 			rra
L3DF9: 			djnz $3E39
L3DFB: 			add  hl,de
L3DFC: 			jr   nz,$3E18
L3DFE: 			add  hl,de
L3DFF: 			jr   nz,$3E1D
L3E01: 			ld   e,$10
L3E03: 			ld   a,$1B
L3E05: 			add  hl,bc
L3E06: 			ld   a,h
L3E07: 			rla
L3E08: 			ld   e,$0F
L3E0A: 			ld   a,$1B
L3E0C: 			ld   a,(de)
L3E0D: 			ld   a,h
L3E0E: 			jr   nc,$3DB3
L3E10: 			inc  bc

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3E11: 			rst  08
L3E12: 			dec  c
L3E13: 			ld   e,e
L3E14: 			rlca
L3E15: 			dec  de
L3E16: 			and  a
L3E17: 			ld   a,h
L3E18: 			rla
L3E19: 			ld   e,$1D
L3E1B: 			ld   a,$9F
L3E1D: 			dec  de
L3E1E: 			cp   h
L3E1F: 			ld   a,h
L3E20: 			rla
L3E21: 			ld   e,$25
L3E23: 			ld   a,$A4
L3E25: 			dec  de
L3E26: 			cp   e
L3E27: 			ld   a,h
L3E28: 			rla
L3E29: 			ld   e,$2D
L3E2B: 			ld   a,$A5
L3E2D: 			dec  de
L3E2E: 			inc  d
L3E2F: 			ld   a,h
L3E30: 			rla
L3E31: 			ld   e,$35
L3E33: 			ld   a,$9D
L3E35: 			dec  de
L3E36: 			rra
L3E37: 			ld   a,h
L3E38: 			rla
L3E39: 			ld   e,$3D
L3E3B: 			ld   a,$A6
L3E3D: 			dec  de
L3E3E: 			sbc  a,a
L3E3F: 			ld   a,h
L3E40: 			rla
L3E41: 			ld   e,$45
L3E43: 			ld   a,$A7
L3E45: 			dec  de
L3E46: 			or   h
L3E47: 			ld   a,h
L3E48: 			rla
L3E49: 			ld   e,$4D
L3E4B: 			ld   a,$A8
L3E4D: 			inc  bc
L3E4E: 			push bc
L3E4F: 			ld   a,($7C4A)
L3E52: 			and  a
L3E53: 			call z,$376F
L3E56: 			ld   a,($7CD9)
L3E59: 			and  a
L3E5A: 			call nz,$2057
L3E5D: 			ld   a,($7CA4)
L3E60: 			and  a
L3E61: 			call nz,$3759
L3E64: 			ld   a,($7CC3)
L3E67: 			and  a
L3E68: 			call nz,$364A
L3E6B: 			ld   a,($7C51)
L3E6E: 			and  a
L3E6F: 			call nz,$3441
L3E72: 			ld   a,($7CD2)
L3E75: 			and  a
L3E76: 			call nz,$3709
L3E79: 			ld   a,($7CD4)
L3E7C: 			and  a
L3E7D: 			call nz,$3314
L3E80: 			ld   a,($7CCC)
L3E83: 			and  a
L3E84: 			call nz,$324E
L3E87: 			ld   bc,$3E8D
L3E8A: 			jp   $3E11
L3E8D: 			xor  c
L3E8E: 			nop
L3E8F: 			pop  bc
L3E90: 			jp   $3E4E
L3E93: 			jp   (iy)

;******************************************************************************
; Command ----> ???
;
; Opcode:	$xx
; Diagram:	???
; Short code	???
; Description:	???
;
;******************************************************************************

L3E95: 			rst	08		; Mark our spot on the map
L3E96:			.DB	$19, $C0	; $C0
 			.DB	$19, $0A	; $0A
			.DB	$4B		; Out ($0A),$C0 --> Vertical Blank = 192
			.DB	$0D		; $00
			.DB	$19, $09	; $09
			.DB	$4B		; Out ($09),$00 --> Background color $00, L/R pallete $00
 			.DB	$A2		; Call to subroutine?

			.DB	$1B, $10, $7C	; $7C10
			.DB	$30		; Save to $0323
			.DB	$9F		;
			.DB	$AA
			.DB	$03		; NEXT

;********************************************************************
; This is the base of the Terse op-code look up table.
; Takes the op code and translates it to subroutine address
;********************************************************************

L3EA7: 		.DB	$00, $00	; $00	Reset game? Is this ever used???
L3EA9: 		.DB	$8D, $00	; $01	SWAP
L3EAB: 		.DB	$A1, $00	; $02	!	STORE 16b in memory address
L3EAD: 		.DB	$3A, $00	; $03	NEXT
L3EAF:		.DB	$A8, $00	; $04	C!	Store 8b in memory address
L3EB1: 		.DB	$E8, $01	; $05	ROT
L3EB3:		.DB	$82, $00	; $06	TUCK
L3EB5:		.DB	$8A, $00	; $07	DROP
L3EB7: 		.DB	$7D, $00	; $08	DUP
L3EB9: 		.DB	$C8, $00	; $09	1+
L3EBB: 		.DB	$C3, $00	; $0A	1-
L3EBD: 		.DB	$68, $01	; $0B	FILL
L3EBF: 		.DB	$B6, $09	; $0C
L3EC1:		.DB	$71, $00	; $0D	Push zero to PS
L3EC3: 		.DB	$61, $00	; $0E	+!
L3EC5: 		.DB	$30, $0A	; $0F
L3EC7: 		.DB	$31, $0E	; $10
L3EC9:		.DB	$85, $0E	; $11
L3ECB: 		.DB	$E6, $00	; $12
L3ECD: 		.DB	$C8, $01	; $13	OVER
L3ECF: 		.DB	$B5, $00	; $14	+
L3ED1: 		.DB	$76, $01	; $15
L3ED3: 		.DB	$BF, $01	; $16	R@
L3ED5: 		.DB	$9A, $00	; $17	c@
L3ED7: 		.DB	$91, $01	; $18
L3ED9: 		.DB	$4F, $00	; $19	8b to PS
L3EDB: 		.DB	$47, $01	; $1A
L3EDD: 		.DB	$46, $00	; $1B	LIT
L3EDF: 		.DB	$5D, $01	; $1C	XOR
L3EE1: 		.DB	$52, $01	; $1D
L3EE3: 		.DB	$01, $02	; $1E
L3EE5: 		.DB	$F9, $01	; $1F
L3EE7: 		.DB	$49, $02	; $20
L3EE9: 		.DB	$9A, $0E	; $21
L3EEB: 		.DB	$77, $00	; $22	Push a one to PS
L3EED: 		.DB	$1D, $02	; $23
L3EEF: 		.DB	$93, $00	; $24
L3EF1: 		.DB	$46, $02	; $25	EI
L3EF3: 		.DB	$F6, $00	; $26
L3EF5: 		.DB	$BB, $00	; $27
L3EF7: 		.DB	$41, $01	; $28
L3EF9: 		.DB	$8A, $0E	; $29
L3EFB: 		.DB	$01, $0E	; $2A
L3EFD: 		.DB	$5C, $12	; $2B
L3EFF: 		.DB	$0A, $12	; $2C
L3F01: 		.DB	$28, $12	; $2D
L3F03: 		.DB	$0E, $02	; $2E
L3F05: 		.DB	$8E, $0E	; $2F
L3F07: 		.DB	$2E, $11	; $30
L3F09: 		.DB	$49, $11	; $31
L3F0B: 		.DB	$D6, $12	; $32
L3F0D: 		.DB	$E5, $12	; $33
L3F0F: 		.DB	$32, $11	; $34
L3F11: 		.DB	$9B, $12	; $35
L3F13: 		.DB	$91, $12	; $36
L3F15: 		.DB	$EA, $12	; $37
L3F17: 		.DB	$0E, $17	; $38
L3F19: 		.DB	$28, $17	; $39
L3F1B: 		.DB	$CF, $01	; $3A
L3F1D: 		.DB	$37, $17	; $3B
L3F1F: 		.DB	$8A, $17	; $3C
L3F21: 		.DB	$D3, $00	; $3D
L3F23: 		.DB	$EF, $01	; $3E
L3F25: 		.DB	$CD, $00	; $3F
L3F27: 		.DB	$72, $17	; $40
L3F29: 		.DB	$60, $02	; $41
L3F2B: 		.DB	$66, $17	; $42
L3F2D: 		.DB	$2B, $18	; $43
L3F2F: 		.DB	$53, $02	; $44
L3F31: 		.DB	$BD, $0E	; $45
L3F33: 		.DB	$E9, $18	; $46
L3F35: 		.DB	$F8, $18	; $47
L3F37: 		.DB	$4E, $18	; $48
L3F39: 		.DB	$44, $18	; $49
L3F3B: 		.DB	$37, $14	; $4A
L3F3D: 		.DB	$D6, $01	; $4B	Out (x2),x1  -->  (x1 x2 -- )
L3F3F: 		.DB	$90, $17	; $4C
L3F41: 		.DB	$B9, $17	; $4D
L3F43: 		.DB	$19, $0E	; $4E
L3F45: 		.DB	$5E, $18	; $4F
L3F47: 		.DB	$D7, $17	; $50
L3F49: 		.DB	$85, $18	; $51
L3F4B: 		.DB	$F3, $17	; $52
L3F4D: 		.DB	$07, $19	; $53
L3F4F: 		.DB	$8B, $1A	; $54
L3F51: 		.DB	$A9, $1A	; $55
L3F53: 		.DB	$D9, $1A	; $56
L3F55: 		.DB	$C1, $1A	; $57
L3F57: 		.DB	$F7, $1A	; $58
L3F59: 		.DB	$DE, $00	; $59
L3F5B: 		.DB	$0A, $1B	; $5A
L3F5D: 		.DB	$75, $02	; $5B
L3F5F: 		.DB	$14, $01	; $5C
L3F61: 		.DB	$3C, $01	; $5D
L3F63: 		.DB	$21, $1B	; $5E
L3F65: 		.DB	$A7, $1C	; $5F
L3F67: 		.DB	$C6, $1D	; $60
L3F69: 		.DB	$C8, $1C	; $61
L3F6B: 		.DB	$BC, $1D	; $62
L3F6D: 		.DB	$F2, $00	; $63
L3F6F: 		.DB	$E7, $0C	; $64
L3F71: 		.DB	$19, $02	; $65
L3F73: 		.DB	$0E, $1D	; $66
L3F75: 		.DB	$F2, $1D	; $67
L3F77: 		.DB	$4E, $1D	; $68
L3F79: 		.DB	$01, $1D	; $69
L3F7B: 		.DB	$2C, $1B	; $6A
L3F7D: 		.DB	$86, $1C	; $6B
L3F7F: 		.DB	$36, $11	; $6C
L3F81: 		.DB	$7B, $1D	; $6D
L3F83: 		.DB	$BA, $1C	; $6E
L3F85: 		.DB	$AB, $1C	; $6F
L3F87: 		.DB	$6C, $00	; $70
L3F89: 		.DB	$3A, $1F	; $71
L3F8B: 		.DB	$B6, $21	; $72
L3F8D: 		.DB	$D9, $00	; $73
L3F8F: 		.DB	$F6, $29	; $74
L3F91: 		.DB	$19, $29	; $75
L3F93: 		.DB	$77, $2A	; $76
L3F95: 		.DB	$1B, $2A	; $77
L3F97: 		.DB	$2D, $02	; $78
L3F99: 		.DB	$B8, $2F	; $79
L3F9B: 		.DB	$C4, $11	; $7A
L3F9D: 		.DB	$EA, $2F	; $7B
L3F9F: 		.DB	$20, $19	; $7C
L3FA1: 		.DB	$78, $2F	; $7D
L3FA3: 		.DB	$DE, $01	; $7E	Read from port
L3FA5: 		.DB	$05, $01	; $7F
L3FA7: 		.DB	$73, $30	; $80
L3FA9: 		.DB	$9D, $32	; $81
L3FAB: 		.DB	$1E, $34	; $82
L3FAD: 		.DB	$26, $34	; $83
L3FAF: 		.DB	$41, $14	; $84
L3FB1: 		.DB	$01, $35	; $85
L3FB3: 		.DB	$1A, $35	; $86
L3FB5: 		.DB	$7E, $36	; $87
L3FB7: 		.DB	$17, $37	; $88
L3FB9: 		.DB	$D9, $37	; $89
L3FBB: 		.DB	$DB, $1D	; $8A
L3FBD: 		.DB	$AD, $39	; $8B
L3FBF: 		.DB	$33, $3A	; $8C
L3FC1: 		.DB	$AD, $00	; $8D
L3FC3: 		.DB	$4C, $38	; $8E
L3FC5: 		.DB	$BF, $3A	; $8F
L3FC7: 		.DB	$12, $39	; $90
L3FC9: 		.DB	$67, $39	; $91
L3FCB: 		.DB	$F5, $12	; $92
L3FCD: 		.DB	$28, $30	; $93
L3FCF: 		.DB	$50, $30	; $94
L3FD1: 		.DB	$C9, $39	; $95
L3FD3: 		.DB	$68, $12	; $96
L3FD5: 		.DB	$87, $28	; $97
L3FD7: 		.DB	$7E, $2A	; $98
L3FD9: 		.DB	$B7, $36	; $99
L3FDB: 		.DB	$3A, $18	; $9A
L3FDD: 		.DB	$F5, $30	; $9B
L3FDF: 		.DB	$56, $3A	; $9C
L3FE1: 		.DB	$59, $35	; $9D
L3FE3: 		.DB	$A0, $30	; $9E
L3FE5: 		.DB	$34, $3B	; $9F
L3FE7: 		.DB	$43, $02	; $A0	DI
L3FE9: 		.DB	$36, $0A	; $A1
L3FEB: 		.DB	$5B, $3D	; $A2
L3FED: 		.DB	$0B, $3D	; $A3
L3FEF: 		.DB	$E1, $3C	; $A4
L3FF1: 		.DB	$C9, $3D	; $A5
L3FF3: 		.DB	$8C, $3D	; $A6
L3FF5: 		.DB	$66, $1F	; $A7
L3FF7: 		.DB	$25, $37	; $A8
L3FF9: 		.DB	$8F, $3E	; $A9
L3FFB: 		.DB	$4E, $3E	; $AA
L3FFD: 		.DB	$02, $01	; $AB
L3FFF: 		.DB	$80		; $AC


; $0323 --> ???
; $7C11 --> Counts up with each coin inserted at least at beginning. ???

; $7C20 --> ???
; $7C21 --> ???

; $7C23 --> ???

; $7C1C --> ???



		.END
