# Extra Bases — annotated TERSE source

## Reading the source

Each block begins with an overview, followed by explanations and numbered source lines. Blank lines are omitted. Block and line numbers retain their source numbering.

Numbers follow the active `BASE`. `HEX` selects hexadecimal and `DECIMAL` selects decimal. Addresses in descriptions use `$` notation. `block:line` links point to the relevant block.

Host TERSE drives the build; target TERSE runs the game; postfix assembler emits Z80 instructions. Comma-suffixed words such as `DI,` are assembler emitters. Register moves place the source operand first: `M A MOV,` loads A from the memory byte addressed by HL.

`-->` continues loading at the next screen, and `;S` ends the current load. Brace notation marks host-side operations within the cross-compiler context.

Bitmaps appear as comment-style pixel grids beside the code: `#` marks a set bit and `.` marks a clear bit. Each row begins with `;` to distinguish the illustration from the source. Sprite grids follow byte-emission order after separating the hotspot and size headers. Large-font glyphs use ten 8-bit rows; packed small-font glyphs use five 3-bit rows. Drawing routines apply expansion, mirroring, shifting and palette selection at display time.

## Block index

| Block | Description |
| --- | --- |
| [9](#block-9) | --> |
| [10](#block-10) | ( BINARY LOAD AND BOOT ) 1 1+ BASE ! 10000 BASE ! ( HEX ) |
| [32](#block-32) | Binary/directory display |
| [33](#block-33) | ( BASEBALL CROSS COMPILER LOADER ) DECIMAL |
| [34](#block-34) | ( XC CHECK AND PHYSICAL SOURCE OBJECT WRITES ) |
| [35](#block-35) | HEX |
| [45](#block-45) | Binary/directory display |
| [62](#block-62) | Binary/directory display |
| [81](#block-81) | Binary/directory display |
| [82](#block-82) | Binary/directory display |
| [83](#block-83) | Binary/directory display |
| [84](#block-84) | Binary/directory display |
| [85](#block-85) | Binary/directory display |
| [86](#block-86) | HEX |
| [87](#block-87) | HEX |
| [88](#block-88) | HEX |
| [89](#block-89) | HEX |
| [90](#block-90) | HEX |
| [91](#block-91) | HEX |
| [92](#block-92) | HEX |
| [94](#block-94) | ( BASEBALL FINALIZED SOURCE BUILD ) DECIMAL |
| [95](#block-95) | Binary/directory display |
| [97](#block-97) | ( ASSEMBLER OBJECT FIXUPS ) |
| [98](#block-98) | ( SHARED NATIVE RETURN BRIDGE AND TARGET OBJECT WRITES ) |
| [99](#block-99) | ( XC TARGET INLINE STRINGS ) |
| [100](#block-100) | ( TARGET HIGH LEVEL CONTROL FLOW ) |
| [101](#block-101) | ( COMPACT TARGET NUMERIC AND RAM LITERALS ) |
| [102](#block-102) | ( BASEBALL MASTER LOADER SCREEN DATE 11/19/79 ) |
| [103](#block-103) | ( MASTER LOADER SCREEN #2 ) |
| [104](#block-104) | ( MASTER LOADER SCREEN #3 ) |
| [105](#block-105) | ( MASTER LOADER SCREEN #4 ) |
| [106](#block-106) | ( MASTER LOADER SCREEN #5 ) |
| [107](#block-107) | ( BB patterns ) |
| [108](#block-108) | ( BB patterns ) |
| [109](#block-109) | ( BB patterns ) |
| [110](#block-110) | ( BB patterns ) |
| [111](#block-111) | ( BB patterns ) |
| [112](#block-112) | ( BB, patterns ) |
| [113](#block-113) | ( BB pattern equates -pattern index # & magic- ) |
| [114](#block-114) | ( BB sentry definitions CHKSCRTIME , BASETABLE ) |
| [115](#block-115) | ( BB sentry definitions RESETRUNNERS ) |
| [116](#block-116) | ( BB sentry defined routines CHKCAUGHT ) |
| [117](#block-117) | ( BB sentry defined routines ) |
| [118](#block-118) | ( BB sentry defined routines ) |
| [119](#block-119) | ( BB sentry defined routines THROWANIM ) |
| [120](#block-120) | ( BB sentry defined routines ) |
| [121](#block-121) | ( BB sentry defined routines CREDARROW MLINN ) |
| [122](#block-122) | ( BB sentry defined routines THROWBALL , PTTBL ) |
| [123](#block-123) | ( BB sentry defined routines ) |
| [124](#block-124) | ( BB sentry defined routines BATHIT , STARTMUSIC , SETOFTBL ) |
| [125](#block-125) | ( BB sentry definitions BUTTONCHECK ) |
| [126](#block-126) | ( BB sentry definitions ) ( pitch control ) |
| [127](#block-127) | ( BB sentry definitions INSCN , PP ) |
| [128](#block-128) | ( BB sentry definitions DOGOVER ) |
| [129](#block-129) | ( BB sentry definitions TF ) |
| [130](#block-130) | ( BB sentry definitions TF ) |
| [131](#block-131) | ( BB sentry definitions TFIELD , STRTBALL , PLRSELECT ) |
| [132](#block-132) | ( BB sentry loop SENTRY , TERSECHK ) |
| [133](#block-133) | ( BB gamestart call GS ) |
| [134](#block-134) | ( BASEBALL SCORES 4-3, 10-6, 5-4, etc. ) BASE @ HEX |
| [135](#block-135) | ( FOUL,CHEERS,BAT CRACK ) HEX BTABLE FOULSCORE 0 VIBS |
| [136](#block-136) | ( CROWD CHEERS & TAKE ME O-T-T-B-G.) HEX |
| [137](#block-137) | ( BB music - reconstructed continuation bridge ) |
| [138](#block-138) | ( BASEBALL SOUNDS , SIREN CANNON ) HEX |
| [139](#block-139) | ( BB music - reconstructed continuation bridge ) |
| [140](#block-140) | ( SAFE , OUT , ) HEX |
| [141](#block-141) | ( MUSIC PROCESSOR COMMANDS ) BASE@ HEX |
| [142](#block-142) | ( NOTE CONSTANTS ) |
| [143](#block-143) | ( MUSIC PROCESSOR IN ASSEMBLY ) |
| [144](#block-144) | ( MUSIC PROCESSOR AS A CODED SUBROUTINE ) |
| [145](#block-145) | ( MUSIC PROCESSOR CALLS ) |
| [146](#block-146) | ( BB music calls ) |
| [147](#block-147) | ( BB hit sector constants ) |
| [148](#block-148) | ( BB constants ) |
| [149](#block-149) | ( BB variables) |
| [150](#block-150) | ( BB variables) |
| [151](#block-151) | ( BB variables ) |
| [152](#block-152) | ( BB variables) |
| [153](#block-153) | ( infield logic loop LDINFLDPA , ) |
| [154](#block-154) | ( BB infield logic HITDST , FHTBL , GHTBL , HTBL , HMHTBL ) |
| [155](#block-155) | ( BB infield action by sector ) |
| [156](#block-156) | ( BB infield action by sector GRNDRSTABLE ) |
| [157](#block-157) | ( BB infield action by sector GRNDRACTION ) |
| [158](#block-158) | ( BB infield action GRNDRHIT , CHKCN ) |
| [159](#block-159) | ( BB fence hit check does homer set up HOMERCHK ) |
| [160](#block-160) | ( BB infield action ) |
| [161](#block-161) | ( BB infield action OUTFLDHIT ) |
| [162](#block-162) | ( BB infield action INLOG ) |
| [163](#block-163) | ( BB hit run and throw for outfield fly ) |
| [164](#block-164) | ( BB hit run and throw for outfield fly TAKEOFF ) |
| [165](#block-165) | ( BB hit run and throw for infield grounder ) |
| [166](#block-166) | ( BB hit run and throw for infield grounder ) |
| [167](#block-167) | ( BB hit run and throw for infield grounder ) |
| [168](#block-168) | ( BB who's on which base WHONBASEODDS ) |
| [169](#block-169) | ( BB who's on which base WHBODDS ) |
| [170](#block-170) | ( BB hit logic ) |
| [171](#block-171) | ( BB hit logic SWINGTABLE ) |
| [173](#block-173) | ( BB outfield computer control CMPOF ) |
| [174](#block-174) | ( BB tractor ball logic TBALLPRC ) |
| [175](#block-175) | ( BB outfield tractor ball running algorithm ) |
| [176](#block-176) | ( BB out fielder animation logic ) |
| [177](#block-177) | ( BB pitching algorithm TBALLPITCH ) |
| [178](#block-178) | ( BB short subroutines string routines ) |
| [179](#block-179) | ( BB short subroutines string routines ) |
| [180](#block-180) | ( BB BALLERASE , DOHOMER , DOEHOMER ) |
| [181](#block-181) | ( BB string routines OUTTIME ) |
| [182](#block-182) | ( BB short subroutines STRIKETIME , BALLTIME , FOULTIME ) |
| [183](#block-183) | ( BB short subroutines SCOREME , STTBL , STETBL ) |
| [184](#block-184) | ( BB string routines STRINGGO , STRINGPRC ) |
| [186](#block-186) | ( BB pattern tables ) |
| [187](#block-187) | ( BB pattern tables ) |
| [188](#block-188) | ( BB pattern tables ) |
| [189](#block-189) | ( BB pattern table matrix PATTERNS ) |
| [190](#block-190) | ( BB op codes for playaction defined BSRTBL , DEACTIVATE ) |
| [191](#block-191) | ( BB op codes for playaction defined THWANMSET ) |
| [192](#block-192) | ( BB op codes for playaction defined BLDST ) |
| [193](#block-193) | ( BB op codes for playaction defined ) |
| [194](#block-194) | ( BB op codes for playaction defined FLDDST ) |
| [195](#block-195) | ( BB op codes for playaction defined OFFFDST ) |
| [196](#block-196) | ( BB op codes for playaction defined RUNDST ) |
| [197](#block-197) | ( BB op codes for playaction defined ) |
| [198](#block-198) | ( BB op codes for playaction defined ) |
| [199](#block-199) | ( BB playaction op code OFMOTION , WAITTHRW , BLMOTION , OPTBL ) |
| [200](#block-200) | ( BB playaction process OPCODECHK , LOADANM ) |
| [201](#block-201) | ( BB playaction process ANMSEQLOAD , PACTLOAD ) |
| [202](#block-202) | ( BB playaction process PATFETCH ) |
| [203](#block-203) | ( BB playaction process PLAYACT ) |
| [207](#block-207) | ( Packed small font and field mirror ) HEX |
| [208](#block-208) | ( Native RAM fill; palette interrupts remain enabled ) HEX |
| [211](#block-211) | ( BB inning player initialization SETFDST ) |
| [212](#block-212) | ( BB inning player initialization LSETTFCOOR ) |
| [213](#block-213) | ( BB inning player initialization RETPA , SETTFPA ) |
| [214](#block-214) | ( BB inning player initialization ZERORAM , SPEC0RAM , LSETTF ) |
| [215](#block-215) | ( BB playaction loader ) |
| [216](#block-216) | ( BB vectors ) |
| [225](#block-225) | ( BB playaction tables ) |
| [226](#block-226) | ( BB playaction tables -runners- ) |
| [227](#block-227) | ( BB playaction tables fieldlogic -infielders- ) |
| [228](#block-228) | ( BB playaction tables fieldlogic -infielders- ) |
| [229](#block-229) | ( BB play action tables single player pitches ) |
| [230](#block-230) | ( BB destination delta calculation DSTCALC ) |
| [231](#block-231) | ( BB destination delta calculation ) |
| [232](#block-232) | ( BB set destination registers from vector ) |
| [233](#block-233) | ( BB short subroutines COMPHL COMPDE TIMEDCR BONE BZERO WUPGO ) |
| [234](#block-234) | ( BB short subroutines DIVHLBY4 INDEXW EX ) |
| [235](#block-235) | ( BB short subroutines AUTOR1 ect. , LVRSTAT , WALKOVER ) |
| [236](#block-236) | ( BB short subroutines MULTHLBY4 , KILLOF , WAIT ) |
| [237](#block-237) | ( BB short subroutines INFLDACT OUTFLDACT ALLFLDACT CMTALL ) |
| [238](#block-238) | ( BB short subroutines BLERASE , WUPWRT , CHGS , DWAIT ) |
| [239](#block-239) | ( BB short subroutines FLSHTON FLSHTOFF FLSHWUP DOCHGS ) |
| [240](#block-240) | ( BB short subroutines CHKFLSHSTAY ) |
| [241](#block-241) | ( VGS write routines relabs , magic equates ) |
| [242](#block-242) | ( VGS write routines reloff ) |
| [243](#block-243) | ( VGS write routines write ) |
| [244](#block-244) | ( VGS write routines writep , WRITE ) |
| [245](#block-245) | ( VGS write routines WRITER ) |
| [246](#block-246) | ( VGS character routines cpost ) |
| [247](#block-247) | ( VGS character routines cpost con't. ) |
| [248](#block-248) | ( VGS character routines CPOST , SPOST , 3DROP ) |
| [249](#block-249) | ( VGS character routines NPOST ) |
| [250](#block-250) | ( VGS character routines BCD+ , BCD+! ) |
| [251](#block-251) | ( BB vector write VWRITE ) |
| [252](#block-252) | ( BB interrupt vector erase VERASE ) |
| [253](#block-253) | ( BB interrupt CHKGROUNDER ) |
| [254](#block-254) | ( BB interrupt TIMER ) |
| [255](#block-255) | ( BB interrupt PERSPECTIVE ) |
| [256](#block-256) | ( BB interrupt - reconstructed continuation bridge ) |
| [257](#block-257) | ( BB interrupt VECTOR ) |
| [258](#block-258) | ( BB interrupt BATHITCHK ) |
| [259](#block-259) | ( BB interrupt BATWRITE , BATSWING ) |
| [260](#block-260) | ( BB interrupt ) |
| [261](#block-261) | ( BB interrupt OFBLCHK ) |
| [262](#block-262) | ( BB interrupt BLPOSCHK ) |
| [263](#block-263) | ( BB interrupt ) |
| [264](#block-264) | ( BB interrupt main WINTBL , INTERRUPT ) |
| [265](#block-265) | ( BB interrupt main ) |
| [266](#block-266) | ( main vectoring, does 3 vectors given IX-starting vect ) |
| [267](#block-267) | ( BB interrupt ball and bat process ) |
| [268](#block-268) | ( BB interrupt ) |
| [269](#block-269) | ( BB released palette bands and homer flashing ) |
| [270](#block-270) | ( BB field table dugout pattern cnline ) |
| [271](#block-271) | ( BB line vector routines CNLINE , DLINE ) |
| [272](#block-272) | ( BB line vector routines RECTAN , OUTLINE ) |
| [273](#block-273) | ( BB field write main FIELDWRT , SUP ) |
| [274](#block-274) | ( BB field write main FL ) |
| [275](#block-275) | ( BB field write ) |
| [276](#block-276) | ( BB parameter control - reconstructed from Extra Bases ROM ) |
| [277](#block-277) | ( BB parameter control - reconstructed continuation ) |
| [278](#block-278) | ( Infield - exact released spans and mound ) HEX |
| [279](#block-279) | ( Native span painter; gaps preserve existing pixels ) HEX |
| [280](#block-280) | ( PIXEL TABLES ) BASE@ HEX |
| [281](#block-281) | ( VECTOR GENERATOR ) |
| [282](#block-282) | ( VECTOR GENERATOR ) BASE@ DECIMAL |
| [283](#block-283) | ( VECTOR GENERATOR ) |
| [284](#block-284) | ( VECTOR GEN ) |
| [285](#block-285) | ( VECTOR GEN - WRITE POINT AND TEST ) |
| [286](#block-286) | ( COIN READING ROUTINE ) HEX |
| [287](#block-287) | ( BB coin routine CHKCOIN1 ) |
| [288](#block-288) | ( BB coin routine CHKCOIN1 ) |
| [289](#block-289) | ( Released palette continuation ) HEX |
| [290](#block-290) | ( I/O PORT DEFINES ) BASE@ HEX |
| [291](#block-291) | ( INTERRUPT ROUTINES ) HEX |
| [292](#block-292) | ( Interrupt routines ) |
| [293](#block-293) | ( VGS screen handeling verbs INTCOMMERCIAL , FILL , SCRERASE ) |
| [294](#block-294) | ( VGS NDUP - native signed-loop binding ) |
| [295](#block-295) | ( HIGH SPEED RANDOM NUMBER - native kernel binding ) |
| [296](#block-296) | ( NUMBER TABLE FOR STRING DISPLAY ROUTINES ) |
| [297](#block-297) | ( CHARACTER PATTERN TABLE FOR DISPLAY ) |
| [298](#block-298) | ( CHARACTER PATTERN TABLE CONT. ) |
| [299](#block-299) | ( VGS-SMALL FONT CHARACTER SET 3 BY 5 ) |
| [300](#block-300) | ( VGS-SMALL FONT CHARACTER SET 3 BY 5 ) |
| [301](#block-301) | ( VGS-SMALL FONT CHARACTER SET 3 BY 5 ) |
| [302](#block-302) | ( VGS-SMALL FONT CHARACTER SET 3 BY 5 ) |
| [303](#block-303) | ( VGS-SMALL FONT CHARACTER SET 3 BY 5 ) |
| [304](#block-304) | ( system verbs ) |
| [305](#block-305) | ( BB sentry string routines DPCN CHKGMCNT ) HEX |
| [306](#block-306) | ( BB sentry string routines INSTRC ) |

## Annotated blocks

<a id="block-9"></a>

### Block 9

Continue loading at the next screen. 

**Line 0.** `-->` transfers source loading to the following screen.

```text
 0|-->
```


<a id="block-10"></a>

### Block 10

Reload a saved XC environment above the root interpreter, then restore its dictionary and variable pointers. The screen is host TERSE loader code.

**Line 0.** Select binary first (`1 1+ BASE !`), then parse binary `10000` as sixteen and store it in BASE. Subsequent numeric text is hexadecimal.

```text
 0|( BINARY LOAD  AND BOOT )   1 1+ BASE ! 10000 BASE ! ( HEX )
```

**Line 1.** Commented alternative machine-code definition of UNMAP.

```text
 1|( CODE UNMAP  0AF B, 0F8D3 , 0F9D3 , 0FF3E , 0FAD3 , NEXT ( )
```

**Line 2.** Define the GAS TERSE version of UNMAP by passing $F1 to MEMAP!. 

```text
 2|: UNMAP  0F1 MEMAP!  ;  ( for GAS TERSE )
```

**Lines 3–7.** Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

```text
 3|HERE CONSTANT .eot  ( end of root terse )
 4|0 VARIABLE .o ( #blks .eot-4000 ) 0 VARIABLE .t ( 4000-8000 )
 5|0 VARIABLE .h ( 8000-HERE )
 6|0 VARIABLE .dp  0 VARIABLE .vp  0 VARIABLE .la
 7|.o 03FE - CONSTANT .svars
```

**Lines 8–10.** Define bload `( from-blk to-addr #blks -- next-blk )`: fetch each BLOCK, copy $400 bytes to successive destination addresses with protection temporarily lifted, then return the following block number.

```text
 8|: bload ( from-blk to-addr #blks --- next-blk )
 9|  DUP >R 0 DO 2DUP DROP I + BLOCK 2DUP DROP
10|  I 0400 * + 0400 UNPROT BMOVE PROT LOOP DROP R> + ;
```

**Line 11.** Restore VPTR, DP and LAST from the saved values.

```text
11|: .rvdl  .vp @ VPTR !  .dp @ DP !  .la @ LAST !  ;
```

**Lines 12–13.** Define boot: enable disk access, reload saved system variables and the three image regions, restore dictionary pointers, discard the final disk-block index, and disable disk access.

```text
12|: boot DISKON  .svars 1 bload  .eot .o @ bload
13|  04000 .t @ bload  08000 .h @ bload  .rvdl  DROP DISKOFF  ;
```

**Line 14.** Unmap, start boot at the screen after the current SCR, patch the byte immediately before the ticked T address to $20 using UB!, and return to decimal. 

```text
14|UNMAP SCR @ 1+ boot 020 ' T 1- UB! DECIMAL
```

**Line 15.** Select directory block 32, print the XC banner and terminate this source load with ;S.

```text
15|32 DIR-BLOCK ! ." Xc System 1.0 July 82" ;S
```

<a id="block-32"></a>

### Block 32

Binary directory/data display. Middle dots mark nonprinting bytes.

**Lines 0–1.** Directory display containing the visible names FS.XC, EXTRABASES.ROM, XCLOAD, XC-CHECK, XC-RUNTIME (split across lines 0/1) and XCBUILD. The names are interleaved with binary directory fields.

```text
 0|···FS.XC-····EXTRABASES.ROMU····XCLOADT····XC-CHECKS····XC-RUNTI
 1|MER····XCBUILD_·················································
```

**Lines 2–15.** Nonprinting directory bytes are displayed as middle dots.

```text
 2|································································
 3|································································
 4|································································
 5|································································
 6|································································
 7|································································
 8|································································
 9|································································
10|································································
11|································································
12|································································
13|································································
14|································································
15|································································
```

<a id="block-33"></a>

### Block 33

Alternative XC loader configuration with ROMSTART=$4000 and high RAM/stack addresses. Compare the finalized build entry in block 94.

**Lines 0–5.** Select decimal, restore FS.XC, select the compiler/assembler vocabularies, choose the directory and extra buffers, and name EXTRABASES.ROM as the object file.

```text
 0|( BASEBALL CROSS COMPILER LOADER ) DECIMAL
 1|FSLD FS.XC
 2|xcsys xc ASM .OPS
 3|32 DIR-BLOCK !
 4|MORE-BUFFERS
 5|OBJECT-FILE EXTRABASES.ROM
```

**Lines 6–8.** Set ROMSTART, PSTACK, RAMSTART and RSTACK to the values shown, begin cross-compilation and reselect the XC assembler context.

```text
 6|HEX 4000 ROMSTART ! F000 PSTACK !
 7|F800 RAMSTART ! F400 RSTACK !
 8|XCBEG DECIMAL xcsys xc ASM .OPS
```

**Lines 9–10.** Load the XC validation and runtime-support files.

```text
 9|FLOAD XC-CHECK
10|FLOAD XC-RUNTIME
```

**Lines 11–13.** Load host compiler helpers 99–101 with file handling suspended, establish the native return bridge, disable assembler-opcode lookup through .NOPS, and compile the master source loader at 102.

```text
11|TERSE DECIMAL NOFILES 99 LOAD 100 LOAD 101 LOAD FILES
12|XC-RBRIDGE DROP
13|.NOPS NOFILES 102 LOAD FILES
```

**Lines 14–15.** Execute EX in the current vocabulary context, return to decimal and terminate loading. The game later defines another EX; vocabulary context matters.

```text
14|EX DECIMAL
15|;S
```

<a id="block-34"></a>

### Block 34

Install host-side runtime checks and object-output hooks into the saved compiler image. Absolute patch addresses refer to the saved XC/TERSE image.

**Lines 0–1.** Document the patch screen and select host TERSE definitions in hexadecimal.

```text
 0|( XC CHECK AND PHYSICAL SOURCE OBJECT WRITES )
 1|TERSE DEFINITIONS HEX
```

**Lines 2–6.** Define XC-CHECK: reject $FFFF placeholders at $854B and $8559 with messages naming .dbeg. and .dend.; otherwise leave $F3D7 on the stack.

```text
 2|: XC-CHECK 854B @ FFFF = IF
 3|A" Missing target runtime: .dbeg." ABORT THEN
 4|8559 @ FFFF = IF
 5|A" Missing target runtime: .dend." ABORT THEN
 6|F3D7 ;
```

**Lines 7–9.** Install XC-CHECK at the host hook and apply the two NOFILES-related image writes. 

```text
 7|' XC-CHECK 8BD8 !
 8|( Keep vocabulary on NOFILES; pair save with file restore )
 9|02E03 39E5 ! 0AF 39E7 !
```

**Lines 10–11.** Define XC-OBJECT by executing host entries $2DF2 and $81BF, then patch the two object-output hooks.

```text
10|: XC-OBJECT 02DF2 EXECUTE 081BF EXECUTE ;
11|' XC-OBJECT 829D ! 0347D 82AB !
```

**Lines 12–14.** Restore XC/assembler context, request `1 LOAD`, and terminate. LOAD's screen-number interpretation belongs to the external loader implementation.

```text
12|DECIMAL xcsys xc DEFINITIONS ASM .OPS
13|1 LOAD
14|;S
```


<a id="block-35"></a>

### Block 35

Supply the byte-TERSE target runtime addresses and the first part of the token-address table to XC.

**Lines 0–5.** Select hexadecimal and write the target runtime hook addresses into host compiler cells.

```text
 0|HEX
 1|( EXTRA BASES TARGET RUNTIME - BYTE TERSE )
 2|HEX
 3|8 854B ! 03A 8559 ! 02B 8522 !
 4|046 852F ! 04F 8567 ! 06C 853D !
 5|061 8576 ! 02D 8587 !
```

**Lines 6–14.** Populate bytarray indices $00–$1A with target runtime entry addresses. 

```text
 6|00 00 bytarray ! 08D 01 bytarray ! 0A1 02 bytarray !
 7|03A 03 bytarray ! 0A8 04 bytarray ! 01E8 05 bytarray !
 8|082 06 bytarray ! 08A 07 bytarray ! 07D 08 bytarray !
 9|0C8 09 bytarray ! 0C3 0A bytarray ! 0168 0B bytarray !
10|071 0C bytarray ! 061 0D bytarray ! 0E6 0E bytarray !
11|01C8 0F bytarray ! 0B5 010 bytarray ! 0176 011 bytarray !
12|01BF 012 bytarray ! 09A 013 bytarray ! 0191 014 bytarray !
13|04F 015 bytarray ! 0147 016 bytarray ! 046 017 bytarray !
14|015D 018 bytarray ! 0152 019 bytarray ! 0201 01A bytarray !
```

**Line 15.** Return to decimal, load screen 1 in the active file context, and stop this screen.

```text
15|DECIMAL 1 LOAD ;S
```

<a id="block-45"></a>

### Block 45

Binary directory/data display. Middle dots mark nonprinting bytes.

**Line 0.** Binary fields containing the printable characters shown on line 0.

```text
 0|··.·/·0·1·2·3·4·5·6·7·8·9·:·;·<·=·>·····························
```

**Lines 1–15.** Nonprinting bytes displayed as middle dots.

```text
 1|································································
 2|································································
 3|································································
 4|································································
 5|································································
 6|································································
 7|································································
 8|································································
 9|································································
10|································································
11|································································
12|································································
13|································································
14|································································
15|································································
```

<a id="block-62"></a>

### Block 62

Binary directory/data display. Middle dots mark nonprinting bytes.

**Line 0.** The rendered record includes FS.XC and EVENS among binary fields.

```text
 0|···;·······V·u······FS.XCVEVENS·9·9·9·9·9·9·9·9·9·9···9·9·9·9·9·
```

**Lines 1–15.** Repeated printable 9 characters and middle-dot placeholders are the rendered contents of this binary screen. 

```text
 1|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·
 2|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9···9·9·9·9·9·
 3|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·
 4|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9···9·9·9·9·9·
 5|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·
 6|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9···9·9·9·9·9·
 7|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·
 8|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9···9·9·9·9·9·
 9|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·
10|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9···9·9·9·9·9·
11|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·
12|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9···9·9·9·9·9·
13|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·
14|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9···9·9·9·9·9·
15|9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·9·
```

<a id="block-81"></a>

### Block 81

Binary directory/data display. Middle dots mark nonprinting bytes.

**Line 0.** Binary fields containing the printable characters shown on line 0.

```text
 0|··^·····························································
```

**Lines 1–15.** Nonprinting bytes displayed as middle dots.

```text
 1|································································
 2|································································
 3|································································
 4|································································
 5|································································
 6|································································
 7|································································
 8|································································
 9|································································
10|································································
11|································································
12|································································
13|································································
14|································································
15|································································
```

<a id="block-82"></a>

### Block 82

Binary directory/data display. Middle dots mark nonprinting bytes.

**Line 0.** Binary fields containing the printable characters shown on line 0.

```text
 0|··#·V·W·X·Y·Z·[·\···············································
```

**Lines 1–15.** Nonprinting bytes displayed as middle dots.

```text
 1|································································
 2|································································
 3|································································
 4|································································
 5|································································
 6|································································
 7|································································
 8|································································
 9|································································
10|································································
11|································································
12|································································
13|································································
14|································································
15|································································
```

<a id="block-83"></a>

### Block 83

Binary directory/data display. Middle dots mark nonprinting bytes.

**Line 0.** Binary fields containing the printable characters shown on line 0.

```text
 0|··"·b·a·························································
```

**Lines 1–15.** Nonprinting bytes displayed as middle dots.

```text
 1|································································
 2|································································
 3|································································
 4|································································
 5|································································
 6|································································
 7|································································
 8|································································
 9|································································
10|································································
11|································································
12|································································
13|································································
14|································································
15|································································
```

<a id="block-84"></a>

### Block 84

Binary directory/data display. Middle dots mark nonprinting bytes.

**Line 0.** Binary fields containing the printable characters shown on line 0.

```text
 0|··!·····························································
```

**Lines 1–15.** Nonprinting bytes displayed as middle dots.

```text
 1|································································
 2|································································
 3|································································
 4|································································
 5|································································
 6|································································
 7|································································
 8|································································
 9|································································
10|································································
11|································································
12|································································
13|································································
14|································································
15|································································
```

<a id="block-85"></a>

### Block 85

Binary directory/data display. Middle dots mark nonprinting bytes.

**Line 0.** Binary fields containing the printable characters shown on line 0.

```text
 0|··$·%·&·'·(·)·*·+·,·?·@·A·B·C·D·E·F·G·H·I·J·K·L·M·N·O·P·Q·······
```

**Lines 1–15.** Nonprinting bytes displayed as middle dots.

```text
 1|································································
 2|································································
 3|································································
 4|································································
 5|································································
 6|································································
 7|································································
 8|································································
 9|································································
10|································································
11|································································
12|································································
13|································································
14|································································
15|································································
```

<a id="block-86"></a>

### Block 86

Complete the byte-token table and begin binding target words to existing native kernel entry points.

**Lines 0–11.** Populate bytarray indices $1B–$39 with the shown target entry addresses.

```text
 0|HEX
 1|01F9 01B bytarray ! 0249 01C bytarray ! 077 01D bytarray !
 2|021D 01E bytarray ! 093 01F bytarray ! 0246 020 bytarray !
 3|0F6 021 bytarray ! 0BB 022 bytarray ! 0141 023 bytarray !
 4|020E 024 bytarray ! 01CF 025 bytarray ! 0D3 026 bytarray !
 5|01EF 027 bytarray ! 0CD 028 bytarray ! 0260 029 bytarray !
 6|0253 02A bytarray ! 01D6 02B bytarray ! 0DE 02C bytarray !
 7|0275 02D bytarray ! 0114 02E bytarray ! 013C 02F bytarray !
 8|0F2 030 bytarray ! 0219 031 bytarray ! 06C 032 bytarray !
 9|0D9 033 bytarray ! 022D 034 bytarray ! 01DE 035 bytarray !
10|0105 036 bytarray ! 0AD 037 bytarray ! 0243 038 bytarray !
11|0102 039 bytarray !
```

**Lines 12–14.** Set byterse to $3A and define target constants named 0 and 1.

```text
12|03A byterse !
13|0 C= 0
14|1 C= 1
```

**Line 15.** Return to decimal and continue with active-file screen 2.

```text
15|DECIMAL 2 LOAD ;S
```

<a id="block-87"></a>

### Block 87

Bind core stack, memory and arithmetic names to fixed native target addresses.

**Lines 0–14.** Move ROMHERE to each listed entry and register DUP through 2+ at those addresses. B@/B! are byte access; @/! are cell access.

```text
 0|HEX
 1|07D ROMHERE ! CODE DUP
 2|082 ROMHERE ! CODE 2DUP
 3|08A ROMHERE ! CODE DROP
 4|08D ROMHERE ! CODE SWAP
 5|093 ROMHERE ! CODE @
 6|09A ROMHERE ! CODE B@
 7|0A1 ROMHERE ! CODE !
 8|0A8 ROMHERE ! CODE B!
 9|0AD ROMHERE ! CODE ZERO
10|0B5 ROMHERE ! CODE +
11|0BB ROMHERE ! CODE -
12|0C3 ROMHERE ! CODE 1-
13|0C8 ROMHERE ! CODE 1+
14|0CD ROMHERE ! CODE 2+
```

**Line 15.** Return to decimal and continue at active-file screen 3.

```text
15|DECIMAL 3 LOAD ;S
```

<a id="block-88"></a>

### Block 88

Bind further arithmetic, comparisons and logical primitives to native target entry points.

**Lines 0–14.** Register the target names at the listed ROMHERE addresses. B@+7 and 1+B! are specialized kernel entries.

```text
 0|HEX
 1|0D3 ROMHERE ! CODE 2-
 2|0D9 ROMHERE ! CODE 2*
 3|0DE ROMHERE ! CODE 2/
 4|0E6 ROMHERE ! CODE B@+7
 5|0F2 ROMHERE ! CODE 1+B!
 6|0F6 ROMHERE ! CODE =
 7|0105 ROMHERE ! CODE <>
 8|0114 ROMHERE ! CODE <
 9|0128 ROMHERE ! CODE >=
10|013C ROMHERE ! CODE >
11|0141 ROMHERE ! CODE 0=
12|0147 ROMHERE ! CODE AND
13|0152 ROMHERE ! CODE OR
14|015D ROMHERE ! CODE XOR
```

**Line 15.** Return to decimal and continue at active-file screen 4.

```text
15|DECIMAL 4 LOAD ;S
```

<a id="block-89"></a>

### Block 89

Finish the native primitive bindings and restore the target object pointer to ROMSTART.

**Lines 0–12.** Bind block move, return-stack/parameter-stack operations, byte swap, port I/O, interrupt controls and indexed-pick helpers to the shown kernel entry points.

```text
 0|HEX
 1|0168 ROMHERE ! CODE BMOVE
 2|01BF ROMHERE ! CODE R@
 3|01C8 ROMHERE ! CODE OVER
 4|01CF ROMHERE ! CODE SWAB
 5|01D6 ROMHERE ! CODE OUTP
 6|01DE ROMHERE ! CODE INP
 7|01E8 ROMHERE ! CODE ROT
 8|01EF ROMHERE ! CODE PICK
 9|0243 ROMHERE ! CODE DI
10|0246 ROMHERE ! CODE EI
11|0249 ROMHERE ! CODE SWABN
12|0260 ROMHERE ! CODE NPICK
```

**Lines 13–14.** Restore ROMHERE from ROMSTART, select decimal and end loading.

```text
13|ROMSTART @ ROMHERE !
14|DECIMAL ;S
```


<a id="block-90"></a>

### Block 90

Select hexadecimal radix.

**Line 0.** Set hexadecimal. 

```text
 0|HEX
```


<a id="block-91"></a>

### Block 91

Select hexadecimal radix.

**Line 0.** Set hexadecimal. 

```text
 0|HEX
```


<a id="block-92"></a>

### Block 92

Select hexadecimal radix.

**Line 0.** Set hexadecimal. 

```text
 0|HEX
```


<a id="block-94"></a>

### Block 94

Finalized native Extra Bases build entry: target ROM starts at zero, variable allocation starts at $7C30, and the kernel is copied before compiling the game.

**Lines 0–2.** Restore FS.XC, select XC/assembler context and directory 32, obtain buffers and open EXTRABASES.ROM.

```text
 0|( BASEBALL FINALIZED SOURCE BUILD ) DECIMAL
 1|FSLD FS.XC xcsys xc ASM .OPS 32 DIR-BLOCK !
 2|MORE-BUFFERS OBJECT-FILE EXTRABASES.ROM
```

**Lines 3–5.** Set ROMSTART=$0000, PSTACK=$7F80, RAMSTART=$7C30 and RSTACK=$8000, then begin cross-compilation. 

```text
 3|HEX 0 ROMSTART ! 7F80 PSTACK !
 4|7C30 RAMSTART ! 8000 RSTACK !
 5|XCBEG DECIMAL xcsys xc ASM .OPS
```

**Lines 6–8.** Load validation/runtime support and compiler helpers, copy the native kernel using XC-KERNEL, and emit/obtain the return bridge.

```text
 6|FLOAD XC-CHECK FLOAD XC-RUNTIME
 7|TERSE DECIMAL NOFILES 99 LOAD 100 LOAD 101 LOAD FILES
 8|TERSE DEFINITIONS HEX XC-KERNEL XC-RBRIDGE DROP
```

**Line 9.** Compile the master loader at 102 with file handling suspended.

```text
 9|DECIMAL xcsys xc ASM .OPS .NOPS NOFILES 102 LOAD FILES
```

**Lines 10–11.** Patch host compiler cells $8514 and $8598, finish the object with XCEND, exit the compiler context and stop loading. 

```text
10|HEX 24 8514 ! 15 8598 ! XCEND
11|EX DECIMAL ;S
```


<a id="block-95"></a>

### Block 95

Binary directory/data display. Middle dots mark nonprinting bytes.

**Line 0.** Binary fields containing the printable characters shown on line 0.

```text
 0|··^·····························································
```

**Lines 1–15.** Nonprinting bytes displayed as middle dots.

```text
 1|································································
 2|································································
 3|································································
 4|································································
 5|································································
 6|································································
 7|································································
 8|································································
 9|································································
10|································································
11|································································
12|································································
13|································································
14|································································
15|································································
```

<a id="block-97"></a>

### Block 97

Repair assembler object-byte writes so fixups use the current object location without losing the saved object pointer.

**Lines 0–2.** Define OUB!: save OHERE, temporarily replace host pointer $F3DD, emit OB,, and restore that pointer.

```text
 0|( ASSEMBLER OBJECT FIXUPS )
 1|TERSE DEFINITIONS HEX
 2|: OUB! OHERE >R 0F3DD ! OB, R> 0F3DD ! ;
```

**Lines 3–4.** Install the OUB! execution address at two host locations and install $832A at two more fixup locations.

```text
 3|' OUB! DUP 5373 ! 7A94 !
 4|0832A 537F ! 0832A 7AA0 !
```

**Line 5.** Restore XC assembler context and end the screen.

```text
 5|DECIMAL xcsys xc DEFINITIONS ASM .OPS ;S
```


<a id="block-98"></a>

### Block 98

Provide host wrappers for object emission, a shared Z80-to-TERSE return bridge, and native kernel copying.

**Lines 0–3.** Wrap four saved-XC entry addresses as OB,, O,, OHERE and T,. Their implementations reside in the loaded XC image.

```text
 0|( SHARED NATIVE RETURN BRIDGE AND TARGET OBJECT WRITES )
 1|TERSE DEFINITIONS HEX
 2|: OB, 08257 EXECUTE ; : O, 08302 EXECUTE ;
 3|: OHERE 08314 EXECUTE ; : T, 08475 EXECUTE ;
```

**Lines 4–9.** Allocate a cached bridge address. On the first XC-RBRIDGE call, emit a jump over the bridge and its machine bytes; later calls reuse its address. The emitted sequence copies BC to HL, reads the next address through IX and jumps through HL.

```text
 4|HERE 0 , CONSTANT XC-RETURN
 5|: XC-RBRIDGE XC-RETURN @ 0= IF
 6|0C3 OB, OHERE 0F + O, OHERE XC-RETURN !
 7|060 OB, 069 OB, 0DD OB, 04E OB, 0 OB,
 8|0DD OB, 023 OB, 0DD OB, 046 OB, 0 OB,
 9|0DD OB, 023 OB, 0E9 OB, THEN XC-RETURN @ ;
```

**Line 10.** DOVERB emits $CF (RST $08), followed by the target call/return tokens obtained through the saved compiler and the shared bridge.

```text
10|: DOVERB XC-RBRIDGE 0CF OB, 0881D EXECUTE T, T, ;
```

**Line 11.** Define object emitters for immediate IN and subtract-with-borrow instructions.

```text
11|: IN, 0DB OB, OB, ; : SBI, 0DE OB, OB, ;
```

**Lines 12–13.** XC-KERNEL copies $300 bytes from source block $5D to the target object. 

```text
12|: XC-KERNEL NOFILES 05D BLOCK 0300 0 DO
13|DUP I + B@ OB, LOOP DROP FILES ;
```

**Line 14.** Return to decimal, continue with active-file screen 2 and stop.

```text
14|DECIMAL 2 LOAD ;S
```


<a id="block-99"></a>

### Block 99

Add target counted strings through a host-side string-emission helper and an immediate XC word.

**Lines 0–3.** XC-STRING emits the target string token $20E, parses through delimiter $22 (double quote), then copies the length byte plus the character bytes into the object.

```text
 0|( XC TARGET INLINE STRINGS )
 1|TERSE DEFINITIONS HEX
 2|: XC-STRING 020E T, 22 DELIM ! WORD
 3|HERE DUP B@ 1+ 0 DO DUP I + B@ OB, LOOP DROP ;
```

**Lines 4–5.** Switch back to XC definitions and expose A" as the immediate wrapper around XC-STRING.

```text
 4|DECIMAL xcsys xc DEFINITIONS ASM .OPS
 5|{ : A" } XC-STRING { ; } IMMED ;S
```


<a id="block-100"></a>

### Block 100

Implement target high-level conditional and loop compilation using object-address backpatching.

**Lines 0–3.** XC-IF emits conditional branch token $201 and a placeholder cell. XC-THEN patches a saved object address to the current OHERE using the host entry $832A.

```text
 0|( TARGET HIGH LEVEL CONTROL FLOW )
 1|TERSE DEFINITIONS HEX
 2|: XC-IF 0201 T, OHERE 0 O, ;
 3|: XC-THEN OHERE SWAP 0832A EXECUTE ;
```

**Line 4.** XC-ELSE emits unconditional branch token $1F9 and its placeholder, then resolves the preceding IF.

```text
 4|: XC-ELSE 01F9 T, OHERE 0 O, SWAP XC-THEN ;
```

**Line 5.** XC-BEGIN saves the object address; XC-END emits the conditional back-branch to that address.

```text
 5|: XC-BEGIN OHERE ; : XC-END 0201 T, O, ;
```

**Lines 6–11.** Publish immediate XC IF, THEN, ELSE, BEGIN and END wrappers. Target END repeats until its condition is true, as the game loops demonstrate.

```text
 6|DECIMAL xcsys xc DEFINITIONS ASM .OPS
 7|{ : IF } XC-IF { ; } IMMED
 8|{ : THEN } XC-THEN { ; } IMMED
 9|{ : ELSE } XC-ELSE { ; } IMMED
10|{ : BEGIN } XC-BEGIN { ; } IMMED
11|{ : END } XC-END { ; } IMMED ;S
```


<a id="block-101"></a>

### Block 101

Compile compact numeric and RAM-address literals and install the helper in the host XC image.

**Lines 0–3.** When the cell at $F3D7 is zero, handle a literal; special values 0 and 1 use the kernel entries $71 and $77 through T,.

```text
 0|( COMPACT TARGET NUMERIC AND RAM LITERALS )
 1|TERSE DEFINITIONS HEX
 2|: XC-LITERAL F3D7 @ 0= IF
 3|DUP 0= IF DROP 071 T, ELSE DUP 1 = IF DROP 077 T,
```

**Lines 4–5.** For unsigned values in [$7C00,$7F00), choose one of three page-specific kernel entries starting at $2D3, spaced nine bytes apart, and emit the low address byte.

```text
 4|ELSE DUP 07C00 U< NOT OVER 07F00 U< AND IF
 5|DUP SWAB 0FF AND 07C - 9 * 02D3 + T, OB,
```

**Line 6.** For other values below $100, emit kernel entry $4F plus one object byte; otherwise emit entry $46 plus a full object cell.

```text
 6|ELSE DUP 0100 U< IF 04F T, OB, ELSE 046 T, O, THEN
```

**Line 7.** Close the literal-selection branches and call host entry $6868 inside the outer condition. 

```text
 7|THEN THEN THEN 06868 EXECUTE THEN ;
```

**Lines 8–9.** Install a Z80 JP opcode and XC-LITERAL's address at the host hook, then restore XC context and stop loading.

```text
 8|0C3 085A6 B! ' XC-LITERAL 085A7 !
 9|DECIMAL xcsys xc DEFINITIONS ASM .OPS ;S
```


<a id="block-102"></a>

### Block 102

Begin the game's staged master loader. 

**Lines 0–1.** Define BASE! and BASE@ as host-side radix save/restore shorthands using the compiler's brace syntax.

```text
 0|( BASEBALL MASTER LOADER SCREEN DATE 11/19/79 )
 1|  { : BASE! } BASE ! { ; } { : BASE@ } BASE @ { ; }
```

**Lines 2–4.** Print progress labels and load system verbs, video/interrupt support and sprite patterns.

```text
 2|CR ." system verbs"        304 LOAD
 3|CR ." vgs "                290 LOAD
 4|CR ." patterns "           107 LOAD
```

**Line 5.** Continue into the next loader screen. 

```text
 5|-->
```

**Lines 6–8.** Retain historical interactive checkpoint diagnostics and a DP assignment. 

```text
 6|CR ." HERE-" HERE H. HEX 8241 DP ! DECIMAL
 7|CR ." BASE- " BASE? CR ." sysave at 310 load 103  " CR .
 8|;S
```


<a id="block-103"></a>

### Block 103

Compile the main collections of game variables, tables, rendering, movement and hit logic in dependency order.

**Lines 0–4.** Load music, constants/variables, vector records, the pattern matrix and reconstructed parameter-control support.

```text
 0|( MASTER LOADER SCREEN #2 )
 1|CR ." music "              146 LOAD
 2|CR ." variables " 147 LOAD 216 LOAD
 3|CR ." pattern matrix "     186 LOAD
 4|CR ." parameter control"   276 LOAD
```

**Lines 5–9.** Load packed-font/mirror support, VGS output, playaction tables, utility subroutines, destination calculations and computer outfield control.

```text
 5|CR ." vgs write routines" 207 LOAD 241 LOAD
 6|CR ." playaction tables "  225 LOAD
 7|CR ." short subroutines "  233 LOAD
 8|CR ." dest calculation "   230 LOAD
 9|CR ." cmp outfld control"  173 LOAD
```

**Lines 10–15.** Load line drawing, field generation, base-occupancy logic, runner logic and hit selection, then continue into 104.

```text
10|CR ." line vector "        280 LOAD
11|CR ." field generartor "   270 LOAD
12|CR ." who's on base "      168 LOAD
13|CR ." run throw logic "    163 LOAD
14|CR ." hit logic "          170 LOAD
15|-->
```

<a id="block-104"></a>

### Block 104

Load event-string processing and continue to the next stage.

**Lines 0–2.** Load 178 (whose chain supplies display/event routines), then continue into 105.

```text
 0|( MASTER LOADER SCREEN #3 )
 1|CR ." string process "     178 LOAD
 2|-->
```

**Line 3.** Historical interactive save/checkpoint text after the continuation directive.

```text
 3|CR ." BASE- " BASE? CR ." sysave at 400 load 105  " CR .
```


<a id="block-105"></a>

### Block 105

Compile trackball input, hit-to-field logic and playaction processing.

**Lines 0–4.** Load 174, 153 and 215 in that order, then continue into the final loader stage.

```text
 0|( MASTER LOADER SCREEN #4 )
 1|CR ." tractor ball logic"  174 LOAD
 2|CR ." infield action "     153 LOAD
 3|CR ." playaction process " 215 LOAD
 4|-->
```

**Lines 5–6.** Historical checkpoint output followed by end-of-load.

```text
 5|CR ." BASE- " BASE? CR ." sysave at 450 load 106  " CR .
 6|;S
```


<a id="block-106"></a>

### Block 106

Finish compilation with coin handling, game interrupts and the foreground sentry loop.

**Lines 0–5.** Load coin input at 286, interrupt/game-update code at 253, and sentry definitions at 114, then stop loading. The comment asks that object allocation remain contiguous.

```text
 0|( MASTER LOADER SCREEN #5 )
 1|CR ." coin routine"        286 LOAD
 2|CR ." interrupt "          253 LOAD
 3|( Keep object allocation contiguous through sentry )
 4|CR ." sentry "             114 LOAD
 5|;S
```

**Lines 6–9.** Historical completion/checkpoint messages retained after ;S.

```text
 6|CR ." BASE- " BASE? CR ." sysave at 500 "
 7|CR ."                    ***** all done *****   "
 8|CR ." HERE- " HERE H. CR . ;S
 9|;S
```


<a id="block-107"></a>

### Block 107

Define byte-emission helpers and the initial ball, marker and triangle patterns.


**Lines 0–10.** Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

```text
 0|( BB patterns )
 1|BASE@  HEX
 2|{ : 8STF } B, B, B, B, B, B, B, B, { ; }
 3|{ : 12STF } 8STF B, B, B, B, { ; }
 4|{ : 14STF } B, B, 12STF { ; }
 5|{ : 16STF } B, B, 14STF { ; }
 6|{ : 18STF } B, B, 16STF { ; }
 7|{ : 24STF } 12STF 12STF { ; }
 8|{ : 26STF } 12STF  14STF { ; }
 9|{ : 28STF } 14STF 14STF { ; }
10|{ : 32STF } 18STF 14STF { ; }
```

**Lines 11–12.** Label and emit the invisible placeholder NOBOD and the ball pattern BALLPAT, including their size/offset metadata.

```text
; NOBOD     BALLPAT
; 8x2       16x2
; ........  ##..............
; ........  ##..............
```

```text
11|LABLE NOBOD 0 0 2 1 0 0 B, B, B, B, B, B,
12|LABLE BALLPAT 0 C0 0 C0 2 2 0 0 B, B, B, B, B, B, B, B,
```

**Lines 13–15.** Emit up/down inning triangles and the inning marker, then continue to the next pattern screen.

```text
; UPTRI     DNTRI     IMRK
; 8x5       8x5       8x3
; #####...  ....#...  #####...
; ####....  ...##...  .###....
; ###.....  ..###...  ..#.....
; ##......  .####...
; #.......  #####...
```

```text
13|LABLE UPTRI 80 C0 E0 F0 F8 B, B, B, B, B,
14|LABLE DNTRI F8 78 38 18 8 B, B, B, B, B,
15|LABLE IMRK F8 B, 70 B, 20 B, -->
```

<a id="block-108"></a>

### Block 108

Store throwing-animation sprite records at several perspective sizes and orientations.


**Lines 0–7.** Emit TUP1M–TUP4M byte records. The fixed-count emitters also consume each record's trailing header/offset values.

```text
; TUP1M             TUP2M
; 16x12             16x10
; .....###........  ....##..........
; .....###........  ....##..........
; ....#####.......  ...####.........
; #########.......  #######.........
; ....######......  ...#####........
; ....#####.#.....  ...####.#.......
; ....#####..#....  ...####.........
; ....#####.......  ...#..#.........
; ....##.##.......  ..##..#.........
; ....##.##.......  ......##........
; ...###.##.......
; .......###......
;
; TUP3M             TUP4M
; 16x8              16x6
; ....#...........  ...#............
; ...###..........  ..###...........
; #######.........  ######..........
; ...##.##........  ..###...........
; ...###..........  ..###...........
; ...###..........  .##.##..........
; ..##.#..........
; .....##.........
```

```text
 0|( BB patterns )
 1|LABLE TUP1M C0 1 80 1D 80 0D 80 0D 80 0F 90 0F A0 0F C0 0F
 2|      80 FF 80 0F 0 7 0 7 0C 2 6 7 28STF
 3|LABLE TUP2M 0 3 0 32 0 12 0 1E 80 1E 0 1F 0 FE 0 1E
 4|      0 0C 0 0C 0A 2 5 6 24STF
 5|LABLE TUP3M 0 6 0 34 0 1C 0 1C 0 1B 0 FE 0 1C 0 8
 6|      8 2 4 5 18STF B, B,
 7|LABLE TUP4M 0 6C 0 38 0 38 0 FC 0 38 0 10 6 2 3 4 16STF
```

**Lines 8–15.** Emit TUP1F–TUP4F counterpart records and continue. 

```text
; TUP1F             TUP2F
; 16x14             16x11
; #...............  #...............
; #...............  #.##............
; #.##............  #.##............
; #.##............  .###............
; .####...........  .####...........
; .#####..........  .###.#..........
; .####.#.........  .###............
; .####..#........  .###............
; .####...........  ##.#............
; .####...........  #..#............
; #####...........  ...##...........
; ##.##...........
; #..##...........
; ...###..........
;
; TUP3F             TUP4F
; 16x9              16x7
; #...............  #...............
; #.#.............  #.#.............
; ####............  ####............
; .##.#...........  .....##.........
; .##.............  ###.............
; .##.............  #.#.............
; ###.............  ..##............
; #.#.............
; ..##............
```

```text
 8|LABLE TUP1F 0 1C 0 98 0 D8 0 F8 0 78 0 78 0 79 0 7A
 9|      0 7C 0 78 0 B0 0 B0 0 80 0 80 0E 2 7 1 32STF
10|LABLE TUP2F 0 18 0 90 0 D0 0 70 0 70 0 74 0 78 0 70
11|      0 B0 0 B0 0 80 0B 2 5 1 26STF
12|LABLE TUP3F 0 30 0 A0 0 E0 0 60 0 60 0 68 0 F0
13|      0 A0 0 80 9 2 4 1 18STF B, B, B, B,
14|LABLE TUP4F 0 30 0 A0 0 E0 0 6 0 F0 0 A0 0 80
15|      7 2 3 1 18STF -->
```

<a id="block-109"></a>

### Block 109

Store running sprites, a base-occupancy image and the extra 20-byte emitter.


**Lines 0–1.** Define 20STF by combining the existing emitter with two further byte writes; its unusual brace placement is preserved.

```text
 0|( BB patterns )
 1|{ : 20STF 18STF } B, B, { ; }
```

**Lines 2–10.** Emit RUP3M/RUP4M and RUP0M–RUP2M perspective records.

```text
; RUP3M             RUP4M
; 16x8              16x6
; ...#............  ...#............
; ..##............  ..###...........
; .####...........  .###............
; ..##.#..........  #.###...........
; ..##............  ..#.............
; ..##............  ..##............
; ..#.............
; ..##............
;
; RUP0M             RUP1M
; 16x14             16x12
; .....##.........  ....##..........
; .....##.........  ....##..........
; ....###.........  ...####.........
; ...#####........  ..######........
; ...#####........  ..####.#........
; ...####.#.......  ..####..........
; ...####.#.......  ...###..........
; ....###.........  ...###..........
; ....###.........  ...###..........
; ....###.........  ...####.........
; ....###.........  ...##...........
; ....####........  ...###..........
; ....##..........
; ....###.........
;
; RUP2M
; 16x10
; ....##..........
; ....##..........
; ...####.........
; ..######........
; ..####.#........
; ...###..........
; ...###..........
; ...####.........
; ...##...........
; ...###..........
```

```text
 2|LABLE RUP3M 0 30 0 20 0 30 0 30 0 34 0 78 0 30 0 10
 3|          8 2 4 3 20STF
 4|LABLE RUP4M 0 30 0 20 0 B8 0 70 0 38 0 10 6 2 3 3 16STF
 5|LABLE RUP0M 0 0E 0 0C 0 0F 0 0E 0 0E 0 0E 0 0E 80 1E 80 1E
 6|     0 1F 0 1F 0 0E 0 6 0 6 0E 2 7 6 32STF
 7|LABLE RUP1M 0 1C 0 18 0 1E 0 1C 0 1C 0 1C 0 3C 0 3D 0 3F
 8|    0 1E 0 0C 0 0C 0C 2 6 4 28STF
 9|LABLE RUP2M 0 1C 0 18 0 1E 0 1C 0 1C 0 3D 0 3F 0 1E
10|      0 0C 0 0C 0A 2 5 4 24STF
```

**Lines 11–15.** Emit RUP0B and ONBASE2, then continue with the pattern chain.

```text
; RUP0B             ONBASE2
; 16x13             16x10
; .....##.........  ....##..........
; .....##.........  ....##..........
; ...####.........  ...####.........
; ..#.#######.....  ..######........
; .#..###.........  .#.######.......
; #...###.........  #...####.#......
; ....###.........  .....###........
; ....####........  ....####........
; ...######.......  ...##..#........
; ...##..##.......  ..##..##........
; #####..##.......
; #####..##.......
; #.......##......
```

```text
11|LABLE RUP0B C0 80 80 F9 80 F9 80 19 80 1F 0 0F 0 0E
12|     0 8E 0 4E E0 2F 0 1E 0 6 0 6 0D 2 7 6 28STF B, B,
13|LABLE ONBASE2 0 33 0 19 0 0F 0 7 40 8F 80 5F 0 3F 0 1E
14|       0 0C 0 0C 0A 2 5 0A 24STF
15|-->
```

<a id="block-110"></a>

### Block 110

Store running, catching and pitcher sprite records.


**Lines 0–7.** Emit RUP1B–RUP4B, the second set of running records.

```text
; RUP1B             RUP2B
; 16x11             16x9
; ....##..........  ....##..........
; ....##..........  ....##..........
; ...###..........  ..#######.......
; ..#######.......  .#.###..........
; .#.###..........  #..###..........
; #..###..........  ...####.........
; ...####.........  ########........
; ...#####........  ####..##........
; ####..##........  #.....###.......
; ####..##........
; #.....###.......
;
; RUP3B             RUP4B
; 16x7              16x6
; ...#............  ...#............
; .#####..........  .#####..........
; #.##............  #.##............
; ..##............  ..###...........
; ..###...........  .##.#...........
; ###.#...........  .#..##..........
; #...##..........
```

```text
 0|( BB patterns )
 1|LABLE RUP1B 80 83 0 F3 0 F3 0 1F 0 1E 0 9C 0 5C 80 3F
 2|     0 1C 0 0C 0 0C 0B 2 6 4 24STF B, B,
 3|LABLE RUP2B 80 83 0 F3 0 FF 0 1E 0 9C 0 5C 80 3F
 4|     0 0C 0 0C 9 2 5 4 20STF B, B,
 5|LABLE RUP3B 0 8C 0 E8 0 38 0 30 0 B0 0 7C 0 10
 6|     7 2 4 3 18STF
 7|LABLE RUP4B 0 4C 0 68 0 38 0 B0 0 7C 0 10 6 2 3 3 16STF
```

**Lines 8–11.** Emit two catch/cover-base images CBUP1 and CBUP2.

```text
; CBUP1             CBUP2
; 16x12             16x11
; .##.............  .##.............
; .##.............  .##.............
; ###.............  ###.............
; ###..#..........  ###..#..........
; ###..#..........  ###..#..........
; #####...........  #####...........
; ###.............  ###.............
; ###.............  ###.............
; ###.............  ###.............
; ###.............  ###.............
; ###.............  .###............
; .###............
```

```text
 8|LABLE CBUP1 0 70 0 E0 0 E0 0 E0 0 E0 0 E0 0 F8 0 E4
 9|     0 E4 0 E0 0 60 0 60 0C 2 5 1 28STF
10|LABLE CBUP2 0 70 0 E0 0 E0 0 E0 0 E0 0 F8 0 E4
11|     0 E4 0 E0 0 60 0 60 0B 2 5 1 26STF
```

**Lines 12–15.** Emit the pitcher-middle image PTMID and ONBASE1, then continue.

```text
; PTMID             ONBASE1
; 16x12             16x11
; .....##.........  ....##..........
; .....##.........  ....##..........
; .#######........  ...#####........
; #...####........  ..########......
; .#######........  .#.######.#.....
; ....####........  #...#####.......
; .#..####........  .....####.......
; .#######........  .....####.......
; .#######........  ....##..#.......
; .....##.........  ...##...#.......
; .....##.........  ..##...##.......
; ....###.........
```

```text
12|LABLE PTMID 0 0E 0 6 0 6 0 7F 0 7F 0 4F 0 0F 0 7F 0 8F 0 7F
13|     0 6 0 6 0C 2 6 6 28STF
14|LABLE ONBASE1 80 31 80 18 80 0C 80 7 80 7 80 8F A0 5F C0 3F
15|     0 1F 0 0C 0 0C 0B 2 6 7 26STF -->
```

<a id="block-111"></a>

### Block 111

Store fielding images and the upward/middle bat orientations.


**Lines 0–8.** Emit paired fielding records FUP1B/FUP2B and FUP1M/FUP2M.

```text
; FUP1B             FUP2B
; 16x11             16x9
; .......##.......  ......##........
; .......##.......  ......##........
; ......###.......  .....###........
; .....#####......  ....#####.......
; ....#####.#.....  ...####..#......
; ...#####...#....  ######....#.....
; #######.........  ######..........
; #######.........  #...##..........
; #....##.........  ....###.........
; .....##.........
; .....###........
;
; FUP1M             FUP2M
; 16x11             16x9
; ......##........  ......##........
; ......##........  ......##........
; .....###........  .....###........
; ....#####.......  ....#####.......
; ...#####.#......  ...####..#......
; ..#####...#.....  ..####....#.....
; ..####..........  ..###...........
; ..###...........  ..##............
; ..####..........  ..###...........
; ..##............
; ..###...........
```

```text
 0|( BB patterns )
 1|LABLE FUP1B 0 7 0 6 0 86 0 FE 0 FE 10 1F A0 0F C0 7 80 3
 2|       80 1 80 1 0B 2 5 6 24STF B, B,
 3|LABLE FUP2B 0 0E 0 8C 0 FC 20 FC 40 1E 80 0F 0 7
 4|       0 3 0 3 9 2 4 5 18STF B, B, B, B,
 5|LABLE FUP1M 0 38 0 30 0 3C 0 38 0 3C 20 3E 40 1F
 6|       80 0F 0 7 0 3 0 3 0B 2 5 3 24STF B, B,
 7|LABLE FUP2M 0 38 0 30 0 38 20 3C 40 1E 80 0F
 8|       0 7 0 3 0 3 9 2 4 3 18STF B, B, B, B,
```

**Lines 9–15.** Emit BATMID, BATU45, BATU30 and BATU90 with their metadata, then continue.

```text
; BATMID            BATU45
; 16x2              16x13
; ################  ...........##...
; ################  ..........###...
;                   .........###....
;                   ........###.....
;                   .......###......
;                   ......###.......
;                   .....###........
;                   ....###.........
;                   ...###..........
;                   ..###...........
;                   .###............
;                   ###.............
;                   ##..............
;
; BATU30            BATU90
; 16x9              16x11
; .............##.  ##..............
; ...........####.  ##..............
; .........#####..  ##..............
; .......#####....  ##..............
; .....#####......  ##..............
; ...#####........  ##..............
; .#####..........  ##..............
; ####............  ##..............
; ##..............  ##..............
;                   ##..............
;                   ##..............
```

```text
 9|LABLE BATMID FF FF FF FF 2 2 0 0 8STF
10|LABLE BATU45 0 C0 0 E0 0 70 0 38 0 1C 0 0E 0 7 80 3 C0 1 E0 0
11|       70 0 38 0 18 0 0D 2 0C 0 28STF B, B,
12|LABLE BATU30 0 C0 0 F0 0 7C 0 1F C0 7 F0 1 7C 0 1E 0 6 0
13|       9 2 8 0 18STF B, B, B, B,
14|LABLE BATU90 0 C0 0 C0 0 C0 0 C0 0 C0 0 C0 0 C0 0 C0 0 C0 0 C0
15|       0 C0 0B 2 0D 0 24STF B, B, -->
```

<a id="block-112"></a>

### Block 112

Store downward bat images, bases and standing figures.


**Lines 0–6.** Emit BATD30, BATD45 and BATD90.

```text
; BATD30            BATD45
; 16x9              16x13
; ##..............  ##..............
; ####............  ###.............
; .#####..........  .###............
; ...#####........  ..###...........
; .....#####......  ...###..........
; .......#####....  ....###.........
; .........#####..  .....###........
; ...........####.  ......###.......
; .............##.  .......###......
;                   ........###.....
;                   .........###....
;                   ..........###...
;                   ...........##...
;
; BATD90
; 16x11
; ##..............
; ##..............
; ##..............
; ##..............
; ##..............
; ##..............
; ##..............
; ##..............
; ##..............
; ##..............
; ##..............
```

```text
 0|( BB, patterns )
 1|LABLE BATD30 6 0 1E 0 7C 0 F0 1 C0 7 0 1F 0 7C 0 F0 0 C0
 2|       9 2 0 0 18STF B, B, B, B,
 3|LABLE BATD45 18 0 38 0 70 0 E0 0 C0 1 80 3 0 7 0 0E 0 1C
 4|       0 38 0 70 0 E0 0 C0 0D 2 0 0 28STF B, B,
 5|LABLE BATD90 0 C0 0 C0 0 C0 0 C0 0 C0 0 C0 0 C0 0 C0
 6| 0 C0 0 C0 0 C0 0B 2 0 0 24STF B, B,
```

**Lines 7–10.** Emit HOMEPLATE, BASEPAT and BASE2PAT.

```text
; HOMEPLATE         BASEPAT
; 16x7              16x4
; #######.........  #####...........
; #######.........  #####...........
; #######.........  #####...........
; #######.........  #####...........
; .#####..........
; ..###...........
; ...#............
;
; BASE2PAT
; 16x3
; ####............
; ####............
; ####............
```

```text
 7|LABLE HOMEPLATE 0 10 0 38 0 7C 0 FE 0 FE 0 FE 0 FE
 8|       7 2 0 4 18STF
 9|LABLE BASEPAT 0 F8 0 F8 0 F8 0 F8 4 2 0 4 12STF
10|LABLE BASE2PAT 0 F0 0 F0 0 F0 3 2 0 4 8STF B, B,
```

**Lines 11–15.** Emit STN1/STN2 standing images and continue.

```text
; STN1              STN2
; 16x12             16x10
; ....##..........  ....##..........
; ....##..........  ....##..........
; ..######........  ..######........
; .########.......  .########.......
; #..####..#......  #..####..#......
; #..####..#......  #..####..#......
; #..####..#......  ...####.........
; ...####.........  ...#..#.........
; ...#..#.........  ...#..#.........
; ...#..#.........  ..##..##........
; ...#..#.........
; ..##..##........
```

```text
11|LABLE STN1 0 33 0 12 0 12 0 12 0 1E 40 9E 40 9E 40 9E
12|       80 7F 0 3F 0 0C 0 0C 0C 2 6 4 28STF
13|LABLE STN2 0 33 0 12 0 12 0 1E 40 9E 40 9E
14|       80 7F 0 3F 0 0C 0 0C 0A 2 5 4 24STF
15|-->
```

<a id="block-113"></a>

### Block 113

Finish standing sprites and assign packed animation/magic selectors used by playaction tables.


**Lines 0–5.** Emit STN3, STN4 and the standing pitcher STNPT.

```text
; STN3              STN4
; 16x8              16x6
; ...#............  ...#............
; .#####..........  .#####..........
; #.###.#.........  #.###.#.........
; #.###.#.........  #.###.#.........
; ..###...........  ..#.#...........
; ..#.#...........  .##.##..........
; ..#.#...........
; .##.##..........
;
; STNPT
; 16x12
; .....###........
; .....###........
; ...#######......
; ..#########.....
; .#..#####..#....
; .#..#####..#....
; .#..#####..#....
; ....#####.......
; ....##.##.......
; ....##.##.......
; ....##.##.......
; ...###.###......
```

```text
 0|( BB pattern equates -pattern index # & magic- )
 1|LABLE STN3 0 6C 0 28 0 28 0 38 0 BA 0 BA 0 7C 0 10
 2|       8 2 4 3 20STF
 3|LABLE STN4 0 6C 0 28 0 BA 0 BA 0 7C 0 10 6 2 3 3 16STF
 4|LABLE STNPT C0 1D 80 0D 80 0D 80 0D 80 0F 90 4F 90 4F 90 4F
 5|       E0 3F C0 1F 0 7 0 7 0C 2 6 6 28STF
```

**Lines 6–13.** Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```text
 6|28 CONSTANT RRUN 68 CONSTANT LRUN
 7|128 CONSTANT RFLD 168 CONSTANT LFLD
 8|228 CONSTANT RTRW 268 CONSTANT LTRW ( 2 )
 9|328 CONSTANT RCB 368 CONSTANT LCB ( 3 )
10|428 CONSTANT STND 528 CONSTANT NBD
11|628 CONSTANT BAL 728 CONSTANT SCR
12|828 CONSTANT STPT 928 C= PTTHW
13|0A28 C= RONBS 0A68 C= LONBS
```

**Lines 14–15.** Restore the saved radix and end the pattern load chain.

```text
14|BASE!
15|;S
```

<a id="block-114"></a>

### Block 114

Process a pending run: retire the scoring runner, advance the play pointer where required, increment the current team's BCD score and request its display.

**Lines 0–4.** Load continuation/instruction strings, save the radix, select hex and emit the base destination coordinate table.

```text
 0|( BB sentry definitions CHKSCRTIME , BASETABLE )
 1|305 LOAD ( stings )
 2|BASE@ HEX
 3|LABLE BASETABLE 6000 , 4000 , 4400 , 2800 , 6000 , 1000 ,
 4| AA00 , 2800 , ( base coor )
```

**Lines 5–10.** Disable interrupts and preserve IX. For outfield hits use PLAYON and advance it by VLENGTH unless already at R4 or in the double-play special case; for infield hits use R1.

```text
 5|CODE CHKSCRTIME ( score process ) DI,
 6| X PUSHX, HITOF LDA, A ANA, 0<>, IF, PLAYON LHLD, H PUSH,
 7| X POPX, ( player play is on ) VMAGIC R4 D LXI, E A MOV,
 8| L CMP, ( r4? ) <>, IF, DBLFLAG LDA, A ANA, 0=, IF,
 9| VLENGTH D LXI, D DAD, PLAYON SHLD, THEN, THEN,
10| ELSE, VMAGIC R1 X LXIX, ( infield hit ) THEN,
```

**Line 11.** Clear that runner's VWBASE and the pending SCRTIME flag, restore IX and re-enable interrupts.

```text
11| A XRA, A VWBASE X STX, SCRTIME STA, X POPX, EI,
```

**Lines 12–15.** Select SCORE1 or SCORE2 from PLYR1UP, add one with DAA for packed BCD, set SCORESHOW to the team number and return; continue source loading.

```text
12| PLYR1UP LDA, A ANA, 0<>, IF, SCORE1 H LXI, 1 D MVI,
13| ELSE, SCORE2 H LXI, 2 D MVI, THEN,
14| M A MOV, 1 ADI, DAA, A M MOV, D A MOV, SCORESHOW STA, RET,
15|-->
```

<a id="block-115"></a>

### Block 115

Compact the four runner records and reset the final slot. The routine uses native memory copies.

**Lines 0–3.** Declare copy-path labels, enter assembly, and set a four-pass loop while saving the loop accumulator/flags.

```text
 0|( BB sentry definitions RESETRUNNERS )
 1| FORWARD RSR2WB FORWARD RSR3WB FORWARD RSR4WB
 2|CODE RESETRUNNERS ( reset runners to order of on base )
 3| <ASSEMBLE 4 A MVI, BEGIN, PSW PUSH,
```

**Lines 4–5.** Inspect R1's base byte and choose the copy-entry label after testing R2 and R3; preserve the exact branch conditions shown.

```text
 4| VWBASE R1 LDA, A ANA, 0<>, IF, VWBASE R2 LDA, A ANA,
 5| RSR2WB JZ, VWBASE R3 LDA, A ANA, RSR3WB JZ, RSR4WB JMP, THEN,
```

**Lines 6–9.** Copy later runner records into earlier slots with LDIR, entering at the selected label; then clear R4's base byte.

```text
 6| VMAGIC R1 D LXI, VMAGIC R2 H LXI, VLENGTH B LXI, LDIR,
 7|LABEL RSR2WB VMAGIC R2 D LXI, VMAGIC R3 H LXI, VLENGTH B LXI,
 8| LDIR, LABEL RSR3WB VMAGIC R3 D LXI, VMAGIC R4 H LXI,
 9| VLENGTH B LXI, LDIR, LABEL RSR4WB A XRA, VWBASE R4 STA,
```

**Lines 10–12.** Clear R4's forward/movement state, set its X/Y positions to $2800/$AC00, point at NOBOD, and load status value 1.

```text
10| VOFW R4 STA, 2800 H LXI, VX R4 SHLD,
11| A H MOV, A L MOV, VDX R4 SHLD, VDY R4 SHLD,
12| AC00 H LXI, VY R4 SHLD, NOBOD H LXI, VPAT R4 SHLD, 1 A MVI,
```

**Line 13.** Write status 1 to R1, R3 and R3 again. The repeated R3 write leaves R2 unchanged on this line.

```text
13| VSTATUS R1 STA, VSTATUS R3 STA, VSTATUS R3 STA,
```

**Lines 14–15.** Set R4 status and RUNBPA, restore/decrement the pass counter, repeat until zero, and return from the assembled routine.

```text
14| VSTATUS R4 STA, RUNBPA H LXI, VPLAYACTPC R4 SHLD, PSW POP,
15| A DCR, 0=, END, ( do 4 tms ) RET, ASSEMBLE> -->
```

<a id="block-116"></a>

### Block 116

Begin catch processing: suppress it during a walk, clear pending throw/catch flags and decide whether a runner has been put out.

**Lines 0–5.** Declare cross-screen labels, return during WALK, preserve IY/IX, clear flags through the zero accumulator and set NORUN.

```text
 0|( BB sentry defined routines CHKCAUGHT )
 1| FORWARD OUTOFFF FORWARD CCLEAVE
 2|CODE CHKCAUGHT ( caught set in interrupt )
 3| <ASSEMBLE WALK LDA, A ANA, RNZ, Y PUSHX, X PUSHX,
 4| THROW STA, CAUGHT STA, TOOFF STA, TOOF STA,
 5| 1 A MVI, NORUN STA,
```

**Lines 6–10.** Distinguish ordinary play from throwaround; reset ball/strike characters, handle outfield catches and select PLAYON or the SAFE message.

```text
 6| THROWAROUND LDA, A ANA, 0=, IF, 30 A MVI, STRIKES STA,
 7| BALLS STA, OFCATCH LDA, A ANA, DI, 0<>, IF,
 8| THROWANM STA, WHOSUP LIYD, OUTOFFF JMP, THEN,
 9| PLAYON LIYD, OFOUT LDA, A ANA, 0<>, IF, A XRA, OFOUT STA,
10| ELSE, CSAFE A MVI, STRING STA, THEN, BASEBLAT LDA, A C MOV,
```

**Lines 11–14.** Test runner-at-base, forward motion and halfway status, possibly force runners back, compare base numbers and enter the out path at OUTOFFF.

```text
11| VATBS VSTATUS Y BITX, 0=, IF, VOFW Y A LDX, A ANA, 0<>, IF,
12| VHW VRSTAT Y BITX, 0<>, IF, 2 A MVI, LVRSTAT CALL, ELSE,
13| VWBASE Y A LDX, C CMP, ( runner at this base ) =, IF,
14|LABEL OUTOFFF ( out ) OFFFPA H LXI, A XRA,
```

**Line 15.** Continue the still-open assembled routine into 117.

```text
15|-->
```

<a id="block-117"></a>

### Block 117

Continue catch resolution, including outs, defensive throws and double plays.

**Lines 0–6.** Clear the runner's base, schedule OFFFPA, increment FLDCLR, request OUT text and return early on the third out; close the nested tests.

```text
 0|( BB sentry defined routines )
 1| A VWBASE Y STX, H VPLAYACTPCH Y STX, ( run off field )
 2| L VPLAYACTPCL Y STX, FLDCLR H LXI, M INR, COUT A MVI,
 3| STRING STA, VGO VSTATUS Y RESX, OUTS LDA, 32 CPI,
 4| =, IF, A XRA, THROWANM STA,
 5| X POPX, Y POPX, EI, RET, ( ret if 3rd out ) THEN,
 6| THEN, THEN, THEN, THEN,
```

**Lines 7–10.** For an outfield catch branch to cleanup. Otherwise use the reversed base index to look up a defender and avoid selecting the pitcher as a throw target.

```text
 7| OFCATCH LDA, A ANA, 0<>, IF, OFOUT STA,
 8| CCLEAVE JMP, THEN, C A MOV, ( baseblat ) 3 CPI, <>, IF,
 9| NEG, 2 ADI, FLDON3RD H LXI, ' INDEXW CALL, D PUSH, X POPX,
10| VPT VSTATUS X BITX, 0=, IF, X PUSHX, H POP, WHOTHROWS SHLD,
```

**Lines 11–15.** Record WHOTHROWS, schedule a throw, and either advance PLAYON for a double play or enter ordinary throwaround; continue.

```text
11| 1 A MVI, THROWANM STA, INAIR STA, DBLPLAY LDA, A ANA,
12| 0<>, IF, ( double play ) A XRA, DBLPLAY STA, VLENGTH D LXI,
13| Y PUSHX, H POP, D DAD, PLAYON SHLD, 1 A MVI, DBLFLAG STA,
14| ELSE, ( no dblplay ) 1 A MVI, THROWAROUND STA, THEN,
15|--> ( Reverse base index for downward fielder pointers )
```

<a id="block-118"></a>

### Block 118

Finish catch cleanup and reset fielders and the flashing team indicator after a throwaround.

**Lines 0–3.** At CCLEAVE clear OFCATCH, restore registers and return; the alternative path clears THROWAROUND.

```text
 0|( BB sentry defined routines )
 1|LABEL CCLEAVE A XRA, OFCATCH STA, X POPX, Y POPX,
 2|  EI, RET, THEN, THEN, THEN, ( throwaround catch )
 3|  A XRA, THROWAROUND STA,
```

**Lines 4–9.** Call high-level STFLD through DOVERB. If flashing is not reserved, redraw WUPWRT and set its callback/timer; otherwise request WUPFLSH. Restore registers and return from assembly.

```text
 4|  X POPX, Y POPX, DI, DOVERB STFLD ( reset fielders )
 5|  FLSHSTAY LDA, A ANA, 0=, IF,
 6|  DOVERB WUPWRT ' WUPWRT H LXI, FLSHWHO SHLD,
 7|  1 A MVI, FLSHON STA, FLSHTIME STA,
 8|  ELSE, WUPFLSH STA, THEN,
 9|  EI, RET, ASSEMBLE>
```

**Line 10.** Continue the sentry source chain.

```text
10|-->
```


<a id="block-119"></a>

### Block 119

Begin throw-animation setup by freezing the thrower and placing the ball at the throwing player's position.

**Lines 0–2.** CHKATBS tests active/at-base bits and increments E when a player is active away from base.

```text
 0|( BB sentry defined routines THROWANIM )
 1|SUBR CHKATBS ( check if active player at base in- A vstatus )
 2| VACT A BIT, RZ, VATBS A BIT, RNZ, E INR, RET,
```

**Lines 3–8.** Preserve IX/IY, disable interrupts, select WHOTHROWS, clear throw-animation state and velocity, and copy the thrower's coordinates into BL with the shown X adjustment.

```text
 3|CODE THROWANIM ( sets up BLDST and player anim )
 4| X PUSHX, Y PUSHX, DI, A XRA, WHOTHROWS LIXD, GRNDR STA,
 5| THROWANM STA, A VANM# X STX, ( zero plyr deltas )
 6| A VDXL X STX, A VDXH X STX, A VDYL X STX, A VDYH X STX,
 7| VXH X H LDX, H INX, H INX,
 8| VX BL SHLD, VYH X H LDX, VY BL SHLD, ( give ball plyr coor. )
```

**Lines 9–14.** For throwaround aim at the pitcher with velocity 4. Otherwise begin choosing a base from PLAYON and HITOF; continue the routine in 120.

```text
 9| THROWAROUND LDA, A ANA, 0<>, IF, ( thrown to pt after play )
10| VY PT LHLD, VDSTY BL SHLD, VX PT LDED, 4 B MVI, ( bl vel )
11| ELSE, ( base throw )
12| PLAYON LIYD, HITOF LDA, A ANA, VWBASE Y A LDX, 0<>, IF,
13| ( hit outfield ) A ANA, 0=, IF, ( run to 1st ) A INR, THEN,
14|-->
```


<a id="block-120"></a>

### Block 120

Finish selecting a throw destination, velocity and facing animation.

**Lines 0–5.** Count active off-base runners with CHKATBS and choose the base and velocity for outfield versus infield play.

```text
 0|( BB sentry defined routines )
 1|  A D MOV, 0 E MVI, VSTATUS R1 LDA, CHKATBS CALL,
 2|  VSTATUS R2 LDA, CHKATBS CALL, VSTATUS R3 LDA, CHKATBS CALL,
 3|  VSTATUS R4 LDA, CHKATBS CALL, A XRA, E ORA,
 4|  0=, IF, ( everybody on base ) 1 D MVI, THEN, D A MOV,
 5|  2 B MVI, ELSE, 5 B MVI, ( throw vel )
```

**Lines 6–9.** Save BASEBLAT, index the paired coordinate entries in BASETABLE, and store the ball destination and chosen speed.

```text
 6|  THEN, BASEBLAT STA, ( # of base to throw to ) A SLAR,
 7| BASETABLE H LXI, ' INDEXW CALL,
 8|  VDSTY BL SDED, H INX, H INX, M E MOV, H INX, M D MOV,
 9|  THEN, B A MOV, VVEL BL STA, ( set bl vel )
```

**Lines 10–14.** Compare thrower X with destination X, install right/left throwing playaction, activate the thrower, clear its motion flag, schedule the throw timer and restore registers/interrupts.

```text
10|  VDSTX BL SDED, VXH X A LDX, D CMP, <, IF, RTHWPA H LXI,
11|  ELSE, LTHWPA H LXI, THEN, H VPLAYACTPCH X STX,
12|  L VPLAYACTPCL X STX, VACT VSTATUS X SETX,
13|  VGO VSTATUS X RESX, 10 A MVI, THROWTIMER STA,
14|  THROW STA, Y POPX, X POPX, EI, RET, -->
```


<a id="block-121"></a>

### Block 121

Translate purchased credits into playable innings and draw the last-inning marker.

**Lines 0–3.** MLINN clears the marker region and, for a nonzero LINN, computes the arrow X coordinate with a cap before drawing IMRK.

```text
 0|( BB sentry defined routines    CREDARROW MLINN )
 1|: MLINN ( mark last inning ) DI PX0 2A A5 4D 3 RECTAN LINN B@
 2|  DUP DUP IF 0A < IF 8F0 SWAP 0 DO 200 + LOOP ELSE DROP 1CF0
 3|  THEN A500 IMRK 301 828 WRITE ELSE DROP DROP THEN EI ;
```

**Lines 4–10.** CREDARROW clears UPCRED and handles STRT1, the coin-mode switch, game-over/player-selection state and computer-player pricing. Some credits remain as a one-credit remainder in two-player mode.

```text
 4|: CREDARROW ( update last inning arrow ) DI UPCRED BZERO
 5|  STRT1 B@ IF SELECT BONE ELSE CREDITS B@ CREDITS BZERO
 6|    DUP IF CNSW1 B@ IF GAMEOVER B@ IF CREDITS B!
 7|    CHKPLRS B@ IF ELSE SELECT BONE THEN 0
 8| ELSE CMPLR B@ IF LINN B@ IF 2* ELSE SELECT BONE 1- 2* 1+ THEN
 9|    ELSE ( not cmplr ) DUP 1 AND CREDITS B! 0FE AND
10|      LINN B@ IF ELSE SELECT BONE 1- THEN THEN THEN
```

**Lines 11–14.** Complete the alternate pricing branch, add purchased innings to LINN, redraw MLINN, reconcile flashing state and enable interrupts; continue.

```text
11|  ELSE ( not cnsw1 ) LINN B@ IF 2* ELSE SELECT BONE 1- 2* 1+
12|  THEN THEN LINN B@ + LINN B! MLINN
13|  CHKFLSHSTAY ELSE DROP THEN THEN EI ;
14|-->
```


<a id="block-122"></a>

### Block 122

Select computer pitches and start a ball throw or pitch when its timer expires.

**Lines 0–3.** Emit PTTBL, an address table of supported computer pitch sequences, with intentional repeated entries affecting selection frequency.

```text
 0|( BB sentry defined routines    THROWBALL , PTTBL )
 1|LABLE PTTBL ( computer pitching table )
 2| PSB , PCO , PICO , PFB , PFB , PCO , PSU , PSD ,
 3| PICI , PSD ,
```

**Lines 5–10.** THROWBALL waits while scoring is clearing, resets THROWTIME, selects BAL and, for a pitch, copies pitcher coordinates into BL with offsets under DI.

```text
 5|CODE THROWBALL FLDCLR LDA, A ANA, RNZ, ( finish scoring first )
 6|  A XRA, THROWTIME STA,
 7|  BAL H LXI, PITCHTIME LDA, A ANA, 0<>, IF, TBLPA SHLD,
 8|  DI, ( pitch ) VX PT LHLD, H DCX, H DCX, H DCX,
 9| H DCX, VX BL SHLD, VY PT LHLD, -7 D LXI, D DAD,
10| VY BL SHLD, ( give bl pt coor.)
```

**Lines 11–13.** Recompact runners, recompute occupancy/odds and select PITCHBLPA; set trackball and swing state. The definition continues in 123.

```text
11|  EI, ' RESETRUNNERS CALL, DOVERB WHBODDS DI,
12|  ( reset runners ) PITCHBLPA H LXI, 1 A MVI, TBALLYSR STA,
13|  SWINGGO STA, -->
```


<a id="block-123"></a>

### Block 123

Finish throw setup and compute inning-dependent hit odds.

**Lines 0–5.** For computer pitching choose a PTTBL entry using PTRND#; otherwise use THWPA/THWBLPA. Install BL's playaction, activate it, clear VGO, enable interrupts and return.

```text
 0|( BB sentry defined routines )
 1|  CMPT LDA, A ANA, 0<>, IF, ( computer pitch )
 2|  PTRND# LDA, PTTBL H LXI, ' INDEXW CALL, XCHG, ( rnd pitch )
 3|  THEN, ELSE, ( hit or throw ) THWPA SHLD, THWBLPA H LXI, THEN,
 4|  VPLAYACTPC BL SHLD, VSTATUS BL H LXI, VACT M SET,
 5|  VGO M RES, EI, RET,
```

**Lines 7–8.** Emit nine inning-odds bytes. The target table accessor supplies the index addressing behavior.

```text
 7|BTABLE IODTBL ( inning odds table )
 8|  5 B, 3 B, 3 B, 3 B, 3 B, 2 B, 2 B, 1 B, 1 B,
```

**Lines 9–14.** INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state; continue loading.

```text
 9|: INNODDS
10|  INN# B@ CMSW B@ IF DUP 6 > IF DROP 1 ELSE 1 > IF 2 ELSE 3
11|  THEN THEN ( cmp player hit ratio ) SPBON B@ IF DROP 4 THEN
12|  ELSE ( player ) SPBON B@ ( bonous inning ) IF 3 > IF 1 ELSE 2
13|  THEN ELSE 1 - IODTBL B@ THEN THEN IODDS B! ;
14|-->
```


<a id="block-124"></a>

### Block 124

React to bat contact, select event music and move outfielders to their control table.

**Lines 0–4.** BATHIT marks HITYET, calls INLOG through DOVERB and clears hit/pitch/swing-go flags.

```text
 0|( BB sentry defined routines    BATHIT , STARTMUSIC , SETOFTBL )
 1| CODE BATHIT ( he hit it time to get em running )
 2|  HITYET STA, DI, DOVERB INLOG
 3|  A XRA, HITTIME STA, PITCHTIME STA, ( tractor ball utfld)
 4|  SWINGGO STA, EI, RET,
```

**Lines 6–10.** STARTMUSIC clears its request. CHEERME selects crowd cheer and normal palette setup; otherwise choose fence or homer cannon music, with the homer palette schedule when needed.

```text
 6|CODE STARTMUSIC A XRA, STMUSIC STA,
 7|  CHEERME LDA, A ANA, 0<>, IF, DOVERB MYAH A XRA, CHEERME STA,
 8|  DOVERB S10 7 A MVI, 1 OUT, 2 OUT, 3 OUT, A XRA, 0 OUT, 4 OUT,
 9|  ELSE, HOMERUN LDA, A ANA, 0=, IF, DOVERB MFENCE
10|  ELSE, DOVERB MCANNON DOVERB S11 THEN, THEN, RET,
```

**Lines 12–15.** OFLDTBL gives all three outfielders OFTBLPA, activates them and returns; continue.

```text
12|CODE OFLDTBL OFTBLPA H LXI, A XRA, OFTOTBL STA,
13|DI, VPLAYACTPC RF SHLD, VPLAYACTPC CF SHLD, VPLAYACTPC LF SHLD,
14|  ' OUTFLDACT CALL, EI, RET,
15|-->
```


<a id="block-125"></a>

### Block 125

Start button handling: use player input or computer proximity logic to decide whether runners advance.

**Lines 0–4.** BUTTONCHK branches on HITYET; after contact, CMSW selects computer control and enters a protected proximity test.

```text
 0|( BB sentry definitions    BUTTONCHECK )
 1|CODE BUTTONCHK ( reads buttons for swing run & pitch it )
 2|  HITYET LDA, A ANA, 0<>, IF,
 3|( runner control )
 4|  CMSW LDA, A ANA, 0<>, IF, ( computer control ) DI,
```

**Lines 5–8.** For the computer use OFBLCHK and invert its result; for the player read active-low bit 1 from port $14. Save FORW and continue into pitch/swing handling.

```text
 5|  X PUSHX, Y PUSHX, 0F D MVI, OFBLCHK CALL, ( chk if close )
 6|  Y POPX, X POPX, EI, 1 XRI,
 7|  ELSE, 14 IN, 2 ANI, 2 XRI, THEN, FORW STA,
 8|-->
```


<a id="block-126"></a>

### Block 126

Finish button processing for starting pitches and swings.

**Lines 0–6.** Reject pitching while clearing the field; honor pitch timeout/button conditions; clear hit/strike state and update the flashing team marker.

```text
 0|( BB sentry definitions ) ( pitch control )
 1|  PITCHIT LDA, A ANA, RZ, FLDCLR LDA, A ANA, RNZ,
 2|  TIMEOUT LDA, A ANA, 0<>, IF, 14 IN, 1 ANI, RNZ, THEN, DI,
 3|  A XRA, STRIKE STA, HITYET STA, FLSHCNT LDA, A ANA, 0=, IF,
 4|  DOVERB WUPWRT THEN, FLSHSTAY LDA, A ANA, 0=, IF,
 5|  FLSHON STA, FLSHTIME STA, FLSHCNT STA,
 6|  ELSE, A XRA, DOWUP STA, WUPFLSH STA, THEN,
```

**Lines 7–10.** Install the pitcher animation and timer, select the pitcher as WHOTHROWS, activate it and stop outfield control.

```text
 7|  PITCHPA H LXI, VPLAYACTPC PT SHLD, A XRA,
 8|  PITCHIT STA, VUPDATE# PT STA, 4A A MVI, THROWTIMER STA,
 9|  PITCHTIME STA, VMAGIC PT H LXI, WHOTHROWS SHLD,
10|  VSTATUS PT H LXI, VACT M SET, ' KILLOF CALL, EI,
```

**Lines 11–15.** In the swing path use the computer's timing/window tests or active-low player button input; set SWING only when SWINGGO permits it, then return and continue loading.

```text
11|  ELSE, ( swing control ) CMSW LDA, A ANA, 0<>, IF,
12|  SWRND# LDA, ( set up in whonbase ) 98 ADI, A D MOV,
13|  VYH BL LDA, D CMP, RC, VXH BL LDA, 26 SBI, 4 CPI, RNC,
14|  ELSE, 14 IN, 2 ANI, RNZ, THEN, SWINGGO LDA, A ANA, RZ,
15|  SWING STA, THEN, RET, -->
```

<a id="block-127"></a>

### Block 127

Display attract pricing, continuation and game-result messages. The attract headline is the test marker V15.

**Lines 0–1.** Define ISCN to post V15 at the given coordinates.

```text
 0|( BB sentry definitions    INSCN , PP )
 1|: ISCN 1C00 1000 828 A" V15" SPOST ;
```

**Lines 2–9.** INSCN shows GAME OVER, flashes ISCN and prints one of two pricing layouts according to CNSW1, then draws the second-base pattern.

```text
 2|: INSCN ( insert coin call )
 3|  SGO ' ISCN FLSHTON
 4|  CNSW1 B@ IF 0C00 2200 828 A" 1 COIN PER PLAYER 1ST INNING"
 5|  SPOST 1700 3400 828 A" 1 COIN PER PLAYER" SPOST 0F00 4600 828
 6|  A" EACH ADDITIONAL 2 INNINGS" SPOST
 7|  ELSE 1800 2600 828 A" 1 COIN 1ST INNING " SPOST
 8|  800 3C00 828 A" 1 COIN EACH ADDITIONAL 2 INNINGS " SPOST
 9|  THEN 2880 4C00 BASE2PAT 428 WRITR ;
```

**Lines 10–14.** Define congratulatory, loss and one-coin prompts and continue loading.

```text
10|: CONGR 700 1000 828 A" CONGRATULATIONS YOU ARE VERY GOOD"
11|  SPOST 0E00 2800 828 A" LETS PLAY AGAIN I WILL BUY" SPOST ;
12|: SORRY 1B00 1000 828 A" TOO BAD I WON" SPOST DP1CN ;
13|: DP1 1A00 2C00 828 A" DEPOSIT 1 COIN" SPOST ;
14|-->
```

**Line 15.** Source comment explaining the test headline.

```text
15|( Attract headline identifies the test ROM revision )
```

<a id="block-128"></a>

### Block 128

Display player-selection/continuation prompts and reset the attract/game-over state.

**Lines 0–3.** TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits.

```text
 0|( BB sentry definitions    DOGOVER )
 1|: TCNT 700 1800 828 A" TO CONTINUE GAME AT END OF INNING" SPOST
 2|  CNSW12 B@ IF CREDITS B@ IF DP1 ELSE 0F00 2C00 828
 3|  A" DEPOSIT 1 COIN PER PLAYER" SPOST THEN ELSE DP1 THEN ;
```

**Lines 4–8.** SPLR12/SPLR display available player choices; when one more credit is needed for two players, set STRT1.

```text
 4|: SPLR12 1400 2000 828 A" SELECT 1 OR 2 PLAYERS" SPOST ;
 5|: SPLR CNSW1 B@ IF CREDITS B@ 1 <> IF SPLR12 ELSE 0E00 2000 828
 6|  A" SELECT 1 PLAYER OR DEPOSIT" SPOST
 7|  0F00 3000 828 A" 1 MORE COIN FOR 2 PLAYERS"
 8|  SPOST STRT1 BONE THEN ELSE SPLR12 THEN ;
```

**Lines 9–15.** DOGOVER resets innings, scores, computer control, flashing and selection state; shows pricing with timed waits and returns to SHILL attract mode.

```text
 9|: DOGOVER ( do game over )
10|  SGO 32 OUTS B! CMSW BONE CMPT BONE PX0 2A B6 4D 8 RECTAN EIDI
11|  8C0 INNX ! INN# BZERO GAMEOVER BZERO 9 LINN B! MLINN DI
12|  GAMEOVER BONE LINN BZERO SCORE1 ZERO PX1 SCRS CMPLR BZERO
13|  FLSHSTAY B@ IF FLSHSTAY BZERO FLSHOFF THEN 10 TWAIT INSCN
14|  80 TWAIT INSCN CREDITS B@ IF SGO THEN SHILL BONE
15|  FLSHOFF DROP 0 PLYR1UP BZERO ( plyr1up 0 ) EIDI ; -->
```

<a id="block-129"></a>

### Block 129

Begin changing sides and taking the field, including credit/bonus-inning decisions.

**Lines 0–5.** TF clears transient RAM, initializes ball/strike/out character bytes to $30, reads and inverts the pricing DIP bit, switches PLYR1UP and adjusts computer control.

```text
 0|( BB sentry definitions    TF )
 1|: TF ( take the field )
 2|  DI ZERORAM EI 30 DUP DUP OUTS B! BALLS B! STRIKES B!
 3|  12 INP 1 AND 1 XOR CNSW1 B! ( released DIP polarity )
 4|  PLYR1UP DUP B@ 1 XOR DUP ROT B! CMPLR B@
 5|  IF DUP IF CMSW BONE ELSE CMPT BONE THEN THEN
```

**Lines 6–11.** Handle attract mode and game-over computer games: grant a bonus inning when the player beats the computer, otherwise offer continuation or return to DOGOVER.

```text
 6|  DI SHILL B@ IF SGO DOGOVER ELSE
 7|  GAMEOVER B@ IF SGO CMPLR B@ IF SCORE1 B@ SCORE2 B@ < IF
 8|  CONGR 50 TWAIT LINN 1+B! MLINN DI CONGR
 9|  GAMEOVER BZERO SPBON BONE
10|  ELSE SORRY C0 TWAIT SORRY CREDITS B@ IF DOCHGS
11|  ELSE DOGOVER THEN THEN
```

**Lines 12–14.** Begin the priced two-player continuation path; its nested conditionals continue in 130.

```text
12|  ELSE CNSW1 B@ IF CNSW12 BZERO CREDITS B@ 1 = IF DPCN ELSE
13|  CHKGMCNT DUP IF 1 = IF DPCN ELSE DOCHGS THEN
14|-->
```


<a id="block-130"></a>

### Block 130

Finish continuation decisions, update the inning indicator and prepare the field.

**Lines 0–4.** Finish the credit/game-over branches and change-sides handling inherited from 129.

```text
 0|( BB sentry definitions    TF )
 1|  ELSE DROP DOGOVER THEN THEN CNSW12 BONE
 2|  ELSE ( no cnsw1 ) CHKGMCNT IF DOCHGS
 3|  ELSE DOGOVER THEN THEN THEN ELSE 1STINN B@ IF ELSE
 4|  DOCHGS THEN THEN THEN
```

**Lines 5–10.** Select the up/down inning triangle for the current half. Advance INN#, wrap after nine, adjust LINN and update the indicator X coordinate.

```text
 5|  ( plyr1up ) IF INNX @ B700 DNTRI INN# B@ LINN B@ = IF
 6|  TCNT 30 TWAIT TCNT THEN ELSE
 7|  INN# DUP 1+B! B@ 0A = IF INN# BONE
 8|  LINN DUP B@ 9 - SB! ( new pointer ) MLINN DI
 9|  PX0 2A B6 4D 8 RECTAN 8C0 INNX ! THEN
10|  INNX DUP @ 200 + DUP ROT ! B600 UPTRI THEN 501 828 WRITE
```

**Lines 11–15.** Reconcile flashing, install destinations and take-field state, draw counts and UP labels, compute inning odds, mark HITYET and request crowd music; continue loading.

```text
11|  FLSHSTAY B@ IF WUPFLSH BONE ELSE WUPWRT WUPTON
12|  EIDI THEN SETFDST SETTF SBO HMRFLSH BZERO 3 OFTFCNT B! INNODDS
13|  GAMEOVER B@ IF ELSE F00 SUP 3F00 SUP ( sets "up" ) THEN
14|  HITYET BONE MYAH S10 ;
15|-->
```

<a id="block-131"></a>

### Block 131

Select player count and start a game after the instruction sequence.

**Lines 0–3.** PLRSELECT redraws the field, enables player-choice polling and resets SELECT while updating the inning marker.

```text
 0|( BB sentry definitions    TFIELD , STRTBALL , PLRSELECT )
 1|: PLRSELECT ( select singel player or 2 player )
 2|  DI FL CHKPLRS BONE
 3|  SPLR SELECT BZERO MLINN ;
```

**Lines 4–8.** STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music.

```text
 4|: STRTBALL DI INSTRC FL F00 SUP 3F00 SUP
 5|  PLYR1UP BONE SCORE1 ZERO INN# BZERO STRT1 BZERO GAMEOVER BZERO
 6|  CNSW1 B@ IF CREDARROW ELSE MLINN DI THEN SHILL BZERO
 7|  CMPLR B@ IF YOU1ST 50 DWAIT YOU1ST THEN
 8|  8C0 INNX ! 1STINN BONE TF 1STINN BZERO MOPENERS ;
```

**Lines 9–13.** PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL; continue.

```text
 9|: PLRCHK 14 INP DUP 10 AND 10 XOR IF DROP CMPLR BONE STRTBALL
10|  DI 800 7000 8828 A" YOU ARE" SPOST EI
11|  ELSE STRT1 B@ IF DROP ELSE 20 AND 20 XOR IF CNSW1 B@ IF
12|  CNSW12 BONE THEN STRTBALL THEN THEN THEN ;
13|-->
```


<a id="block-132"></a>

### Block 132

Run the foreground sentry dispatcher. Interrupt routines do frequent movement/rendering while this loop handles requested game actions.

**Lines 0–3.** TERSECHK advances the random generator and services pending take-field, player-selection, player-check and credit-update flags.

```text
 0|( BB sentry loop SENTRY , TERSECHK )
 1|: TERSECHK ( look at terse routine flags ) 0 RND DROP
 2| TFTIME B@ IF TF THEN SELECT B@ IF PLRSELECT THEN
 3| CHKPLRS B@ IF PLRCHK THEN UPCRED B@ IF CREDARROW THEN ;
```

**Lines 4–13.** SENTRY preserves BC, polls the request flags and conditionally calls button, pitch, outfield, throw, hit, catch, scoring and music routines.

```text
 4|CODE SENTRY ( game loop ) B PUSH,
 5| TAKEFIELD LDA, A ANA, ' BUTTONCHK CZ,
 6| PITCHTIME LDA, A ANA, ' TBALLPITCH CNZ,
 7| OFTOTBL LDA, A ANA, ' OFLDTBL CNZ,
 8| THROWTIME LDA, A ANA, ' THROWBALL CNZ,
 9| THROWANM LDA, A ANA, ' THROWANIM CNZ,
10| HITTIME LDA, A ANA, ' BATHIT CNZ,
11| CAUGHT LDA, A ANA, ' CHKCAUGHT CNZ,
12| SCRTIME LDA, A ANA, ' CHKSCRTIME CNZ,
13| STMUSIC LDA, A ANA, ' STARTMUSIC CNZ,
```

**Lines 14–15.** Invoke TERSECHK through the native/high-level bridge, restore BC and jump back to SENTRY indefinitely; continue loading definitions.

```text
14| DOVERB TERSECHK ( chk terse flags )
15| B POP, ' SENTRY JMP, -->
```

<a id="block-133"></a>

### Block 133

Define the game's high-level power-up path PUP.

**Lines 0–2.** Initialize high-resolution commercial video mode, select B1 and write the initial output values.

```text
 0|( BB gamestart call    GS )
 1|: PUP ( power up routine )
 2| INTHIGHRES B1 DUP 0 OUTP 4 OUTP 7 2 OUTP
```

**Lines 3–4.** Save both random-state cells across screen erase, restore them, initialize music and mark attract mode.

```text
 3|  DI 0 RND# @ 1 RND# @ SCRERASE 1 RND# ! 0 RND# ! EMUSIC S10
 4|  SHILL BONE
```

**Lines 5–7.** Draw the field, show GAME OVER, enable interrupts, take the field and enter SENTRY. Restore the compile-time radix and end the load; the last comment records palette-band intent.

```text
 5|  DI FL SGO EI GAMEOVER BONE TF SENTRY ;
 6|BASE! ;S
 7|( Released palette: scanline 0/115 color bands )
```


<a id="block-134"></a>

### Block 134

Emit music-command streams for strikes, balls and coin insertion. These words run while building tables; the music processor interprets the emitted bytes during play.

**Lines 0–5.** Save the radix, select hex and emit STRIKESCORE: master/voice volumes, vibrato and timed B/C voice tones ending in QUIET.

```text
 0|( BASEBALL SCORES 4-3, 10-6, 5-4, etc. ) BASE @ HEX
 1|BTABLE STRIKESCORE
 2|23 MASTER AB ABVOLS 0B MCVOLS 0 VIBS 1 #E2 CNOTE #F2 BTONE #C2
 3|ATONE 1 #G2 CNOTE #FS2 BTONE 1 #A2 CNOTE #AS2 BTONE 1 #C3 CNOTE
 4|#CS3 BTONE 1 #DS3 CNOTE #F3 BTONE 1 #F3 CNOTE #FS3 BTONE 1 #G2
 5|CNOTE #GS3 BTONE 08 #B3 CNOTE #C4 BTONE QUIET
```

**Lines 6–9.** Emit BALLSCORE as timed three-voice chords and a quiet ending.

```text
 6|BTABLE BALLSCORE
 7|28 MASTER AB ABVOLS 0A MCVOLS 0 VIBS 2 #G2 #F2 #D2 NOTES
 8|2 #G2 #E2 #C2 NOTES 2 #G2 #D2 #B1 NOTES 5 #G2 #C2 #A1 NOTES
 9|QUIET
```

**Lines 10–13.** Emit COINSCORE with volume/noise/vibrato setup and a short chord. The parenthesized alternative notes are comments; continue loading.

```text
10|BTABLE COINSCORE
11|23 MASTER FF ABVOLS 2F MCVOLS E8 NOISE 52 VIBS
12|12 #C2 #D2 #E2 NOTES ( 6 #B1 ANOTE 6 #A1 BNOTE ) QUIET
13|-->
```


<a id="block-135"></a>

### Block 135

Emit descending foul tones, a crowd-noise envelope, bat crack and fence-hit music.

**Lines 0–4.** Start FOULSCORE with no vibrato, then step the A voice down through timed notes before QUIET.

```text
 0|( FOUL,CHEERS,BAT CRACK ) HEX BTABLE FOULSCORE 0 VIBS
 1|46 MASTER 0F ABVOLS 0 MCVOLS 4 #A2 ANOTE
 2|5 #G2 ANOTE 5 #F2 ANOTE 6 #E2 ANOTE
 3|6 #D2 ANOTE 7 #C2 ANOTE 7 #B1 ANOTE 8 #A1 ANOTE
 4|8 #G1 ANOTE 9 #F1 ANOTE 0A #E1 ANOTE 0B #D1 ANOTE QUIET
```

**Lines 5–10.** Emit CHEERSSCORE: choose noise and progressively lower voice volumes, then stop sound.

```text
 5|( CROWD CHEER ) BTABLE CHEERSSCORE 35 MASTER 33 NOISE
 6|AA ABVOLS 3A MCVOLS 7C 50 40 2E NOTES 4 53 42 2F NOTES
 7|88 ABVOLS 38 MCVOLS 4 56 44 30 NOTES
 8|66 ABVOLS 36 MCVOLS 4 59 46 31 NOTES
 9|44 ABVOLS 34 MCVOLS 5 DURATION
10|22 ABVOLS 32 MCVOLS 7 DURATION QUIET
```

**Lines 11–15.** Emit CRACKSCORE and the FENCESCORE entry that chains into it using LDPCC; continue the score chain.

```text
11|BTABLE CRACKSCORE 50 MASTER 3D NOISE
12|FF ABVOLS 1F MCVOLS #F4 BTONE #E4 ATONE
13|6 #G4 CNOTE QUIET
14|BTABLE FENCESCORE 48 MASTER 38 NOISE 4 CRACKSCORE LDPCC
15|-->
```

<a id="block-136"></a>

### Block 136

Emit the opening tune and music-table helper macros.

**Lines 0–3.** Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato.

```text
 0|( CROWD CHEERS & TAKE ME O-T-T-B-G.) HEX
 1|{ : CMAJOR } 1C MASTER 0 NOISE EF ABVOLS 0F MCVOLS { ; }
 2|{ : REST } 0 ABVOLS 0 MCVOLS 0A DURATION { ; }
 3|{ : ^ } EF ABVOLS 0F MCVOLS { ; } BTABLE TAKE-ME CMAJOR 0 VIBS
```

**Lines 4–8.** Emit the timed three-voice note groups at the start of TAKE-ME.

```text
 4|14 #C1 #E1 #C2 NOTES 0A #E1 #G1 #C3 NOTES 0A #C1 #F1 #A2 NOTES
 5|0A #C1 #E1 #G2 NOTES 0A #C1 #G1 #E2 NOTES
 6|1E #B0 #D1 #G2 NOTES 1E #G0 #F1 #D2 NOTES 14 #C1 #E1 #C2 NOTES
 7|0A #E1 #G1 #C3 NOTES 0A #F1 #C2 #A2 NOTES 0A #E1 #C2 #G2 NOTES
 8|0A #C1 #G1 #E2 NOTES 3C #B0 #D1 #G2 NOTES 3C #C1 #E2 #C3 NOTES
```

**Line 9.** Chain the music stream into CHEERSSCORE, then continue source loading. This --> interrupts the source screen before the additional note text below.

```text
 9|0 CHEERSSCORE LDPCC -->
```

**Lines 10–14.** Retained additional tune phrases after the first -->. 

```text
10|0A #C1 #G1 #E2 NOTES 14 #B0 #D1 #G2 NOTES 0A #C1 #E1 #G2 NOTES
11|0A #D1 #F1 #G2 NOTES 0A #DS1 #C2 #FS2 NOTES 0A #E1 #C2 #G2 NOTES
12| 0A #F1 #C2 #A2 NOTES 0A #E1 #B1 3A NOTES 0A #F1 #C2 #A2 NOTES
13|0A #G1 #C2 #E2 NOTES 0A #A1 #C2 #F2 NOTES 0A #E1 #CS2 #G2 NOTES
14|0A #F1 #D2 #A2 NOTES REST 0A #D1 #A1 #F2 NOTES -->
```


<a id="block-137"></a>

### Block 137

Source-loading bridge between music screens.

**Lines 0–1.** The comment marks reconstruction and --> continues to 138.

```text
 0|( BB music - reconstructed continuation bridge )
 1|-->
```


<a id="block-138"></a>

### Block 138

Emit the siren and cannon music streams used for homer events.

**Lines 0–6.** SIRENSCORE uses randomized-note commands, a declining master setting and a counted LDPCC jump back to its beginning.

```text
 0|( BASEBALL SOUNDS , SIREN CANNON ) HEX
 1|BTABLE SIRENSCORE AB ABVOLS 0B MCVOLS
 2|90 5E 11 RDRNDNTE 80 5E 13 RDRNDNTE 70 5E 12 RDRNDNTE
 3|0 VIBS 10 MASTER 1 DURATION 0E MASTER 1 DURATION 0C MASTER
 4|1 DURATION 0A MASTER 1 DURATION 8 MASTER 1 DURATION 6 MASTER
 5|1 DURATION 4 MASTER 1 DURATION 2 MASTER 1 DURATION
 6|12 SIRENSCORE LDPCC
```

**Lines 7–14.** CANNONSCORE combines noise, timed tones and stepped volumes, then transfers into SIRENSCORE; continue loading.

```text
 7|( HOMER CONT. ) BTABLE CANNONSCORE
 8|FF ABVOLS 1F MCVOLS 2 MASTER 8 NOISE
 9|#D2 CTONE #FS2 BTONE 6 #GS2 ANOTE
10|#C2 CTONE 6 #E2 ANOTE #B1 CTONE 6 #D2 BNOTE
11|1D ABVOLS 1A MCVOLS #A1 CTONE 6 #C2 ANOTE
12|AA ABVOLS 17 MCVOLS #G1 CTONE 6 #B1 BNOTE
13|0 SIRENSCORE LDPCC
14|-->
```


<a id="block-139"></a>

### Block 139

Second reconstructed source-loading bridge in the music chain.

**Lines 0–1.** Identify the reconstruction and continue to 140 without adding sound commands.

```text
 0|( BB music - reconstructed continuation bridge )
 1|-->
```


<a id="block-140"></a>

### Block 140

Emit SAFE and OUT musical phrases and finish the score tables.

**Lines 0–4.** SAFESCORE sets volumes and plays timed chords, then transfers into the crowd cheer.

```text
 0|( SAFE , OUT , ) HEX
 1|BTABLE SAFESCORE
 2|34 MASTER AB ABVOLS 0B MCVOLS 0 VIBS 5 #C2 #E2 #G2
 3|NOTES 5 #G2 #D3 #B2 NOTES 5 #A2 #D2 #C3 NOTES
 4|12 #B2 #D3 #G3 NOTES 0 CHEERSSCORE LDPCC
```

**Lines 5–10.** OUTSCORE plays descending chords and ends quietly. Restore the saved radix and stop loading.

```text
 5|BTABLE OUTSCORE
 6|23 MASTER AB ABVOLS 0B MCVOLS 0 VIBS 5 #G2 #D2 #F2
 7|NOTES 5 #E2 #B1 #D2 NOTES 5 #B1 #GS1 #F1 NOTES
 8| 5 #E1 #F1 #B0 NOTES
 9|12 #G0 #F1 #A1 NOTES QUIET
10|BASE ! ;S
```


<a id="block-141"></a>

### Block 141

Define the bytecode format consumed by MUSCPU and start the silent termination stream.

**Lines 0–5.** Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```text
 0|( MUSIC PROCESSOR COMMANDS ) BASE@ HEX
 1|0 VARIABLE MUSPC { : MASTER } 10 B, B, { ; } { : ATONE } 11 B,
 2|B, { ; } { : BTONE } 12 B, B, { ; } { : CTONE } 13 B, B, { ; }
 3|{ : VIBS } 14 B, B, { ; } { : ABVOLS } 16 B, B, { ; }
 4|{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
 5|{ : DURATION } 1 B, B, { ; }
```

**Lines 6–8.** Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

```text
 6|{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
 7|{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
 8|0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
```

**Lines 9–14.** Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

```text
 9|{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
10|{ ; } { : CNOTE } CTONE DURATION { ; }
11|{ : RDRNDNTE } 0 B, B, B, B, { ; }
12|{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
13|{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
14|{ : NOTES } ATONE BTONE CNOTE { ; }
```

**Line 15.** Emit ENDMUSIC using QUIET and continue to note constants.

```text
15|BTABLE ENDMUSIC QUIET -->
```

<a id="block-142"></a>

### Block 142

Define sound-generator note-period constants and variable-allocation shorthands.

**Lines 0–13.** Map the named notes #G0 through #G8 to explicit period bytes. The values are sound-generator period bytes.

```text
 0|( NOTE CONSTANTS )
 1|FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
 2|BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
 3|8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
 4|6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
 5|4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
 6|3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
 7|2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
 8|20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
 9|18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
10|12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
11|0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
12|07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
13|02 C= #C7 01 C= #G7 00 C= #G8
```

**Lines 14–15.** Define V as VARIABLE and BV as BVARIABLE, then continue the music processor source.

```text
14|{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
15|-->
```

<a id="block-143"></a>

### Block 143

Start the native music-bytecode interpreter.

**Lines 0–1.** Allocate repeat count MULTIPLE, restart address STARTPC, NOTETIMER and PRIORITY.

```text
 0|( MUSIC PROCESSOR IN ASSEMBLY )
 1|0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Lines 2–6.** FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
 2|SUBR FETCH MUSPC LHLD, M A MOV, RET,
 3|SUBR INCPC MUSPC LHLD, H INX, MUSPC SHLD, RET,
 4|SUBR HLOAD FETCH CALL, INCPC CALL, 0 H MVI, A L MOV, RET,
 5|SUBR PCJUMP MUSPC LHLD, M E MOV, H INX, M D MOV,
 6|MUSPC SDED, RET,
```

**Lines 7–10.** Declare cross-screen dispatch labels and begin assembling MUSCPU.

```text
 7|( MUSIC PROCESSOR IN CODE )
 8|FORWARD PROCESS FORWARD M1CASE FORWARD M2CASE FORWARD M3CASE
 9|FORWARD M4CASE FORWARD PORTOUT FORWARD MULTDN FORWARD MUSEND
10|CODE MUSCPU <ASSEMBLE
```

**Lines 11–15.** Preserve BC, count down a pending note duration, then fetch a command. Opcode zero reads randomized-note parameters and calls RND through DOVERB; continue in 144.

```text
11|B PUSH, NOTETIMER LDA, A ORA, PROCESS JZ,
12|A DCR, NOTETIMER STA, MUSEND JNZ,
13|LABEL PROCESS FETCH CALL, INCPC CALL, A ORA,
14|M1CASE JNZ, HLOAD CALL, H PUSH, HLOAD CALL,
15|H PUSH, HLOAD CALL, H PUSH, DOVERB RND -->
```

<a id="block-144"></a>

### Block 144

Finish MUSCPU command dispatch, including timing, jumps, repeats and port output.

**Lines 0–3.** Finish randomized-note output, then handle opcode 1 by loading NOTETIMER and returning with a nonzero completion indication.

```text
 0|( MUSIC PROCESSOR AS A CODED SUBROUTINE )
 1|H POP, D POP, D DAD, B POP, L OUTP, A XRA, MUSEND JMP,
 2|LABEL M1CASE A DCR, M2CASE JNZ, FETCH CALL,
 3|NOTETIMER STA, INCPC CALL, 1 ORI, MUSEND JMP,
```

**Lines 4–7.** Handle opcodes 2 and 3 as address transfers; one continues command processing immediately while the other leaves a nonzero indication to end this pass.

```text
 4|LABEL M2CASE A DCR, M3CASE JNZ, PCJUMP CALL,
 5|A XRA, MUSEND JMP,
 6|LABEL M3CASE A DCR, M4CASE JNZ, PCJUMP CALL,
 7|1 ORI, MUSEND JMP,
```

**Lines 8–10.** Handle opcode 4: decrement MULTIPLE, restart at STARTPC if repetitions remain, otherwise clear PRIORITY.

```text
 8|LABEL M4CASE A DCR, PORTOUT JNZ, MULTIPLE LDA, A DCR,
 9|MULTIPLE STA, MULTDN JZ, STARTPC LHLD, MUSPC SHLD, MUSEND JMP,
10| LABEL MULTDN PRIORITY STA, MUSEND JMP,
```

**Lines 11–15.** For register commands, recover the port number and output the following byte. Continue processing while A is zero; otherwise restore BC, return and close assembly.

```text
11|LABEL PORTOUT 4 ADI, A C MOV, FETCH CALL, A OUTP,
12|INCPC CALL, A XRA,
13|LABEL MUSEND A ORA, PROCESS JZ, B POP, RET,
14|ASSEMBLE>
15|-->
```

<a id="block-145"></a>

### Block 145

Expose target words for initializing music and starting background or priority streams.

**Lines 0–3.** loadpc installs MUSPC and STARTPC. BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

```text
 0|( MUSIC PROCESSOR CALLS )
 1|  SUBR loadpc MUSPC SHLD, STARTPC SHLD, RET,
 2|CODE BMUSIC PRIORITY LDA, H POP, A ORA, 0=, IF, loadpc CALL,
 3|  NOTETIMER STA, A INR, MULTIPLE STA, THEN, NEXT
```

**Lines 4–5.** EMUSIC selects ENDMUSIC and initializes timing/repetition to one; it is intended for startup.

```text
 4|CODE EMUSIC 0 ENDMUSIC H LXI, loadpc CALL, 1 A MVI, NOTETIMER
 5|  STA, MULTIPLE STA, NEXT ( CALL EMUSIC AS AN INIT IN PROGRAM )
```

**Lines 6–8.** PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer. 

```text
 6|CODE PMUSIC H POP, loadpc CALL, 1 A MVI, MULTIPLE STA,
 7|  PRIORITY STA, NOTETIMER STA, NEXT
 8|( Unused MMUSIC/MPMUSIC wrappers omitted for ROM space )
```

**Line 13.** Restore the saved radix and finish the music processor load.

```text
13|BASE! ;S
```


<a id="block-146"></a>

### Block 146

Load the music system and define event-specific high-level entry words.

**Lines 0–1.** Select decimal, load command/interpreter support at 141 and the score chain beginning at 134.

```text
 0|( BB music calls )
 1|DECIMAL 141 LOAD 134 LOAD
```

**Lines 2–8.** Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```text
 2|: MCANNON 0 CANNONSCORE BMUSIC ;
 3|( Cheer/cannon aliases folded into their existing callers )
 4|: MYAH 0 CHEERSSCORE BMUSIC ;
 5|: MHIT 0 CRACKSCORE BMUSIC ; : MFENCE 0 FENCESCORE BMUSIC ;
 6|: MSTRIKE 0 STRIKESCORE BMUSIC ; : MBALL 0 BALLSCORE BMUSIC ;
 7|: MFOUL 0 FOULSCORE BMUSIC ;
 8|: MSAFE 0 SAFESCORE BMUSIC ; : MOUT 0 OUTSCORE BMUSIC ;
```

**Lines 9–11.** Use PMUSIC for the opening tune and BMUSIC for coin sound; stop loading.

```text
 9|: MOPENERS 0 TAKE-ME PMUSIC ;
10|: MCOIN 0 COINSCORE BMUSIC ;
11|;S
```


<a id="block-147"></a>

### Block 147

Define hit-sector numbers and bit positions used in vector status bytes.

**Lines 0–6.** Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

```text
 0|( BB hit sector constants )
 1|DECIMAL
 2|1 C= FLYB 0 C= FG
 3|0 C= FBL 1 C= HLL 2 C= F3RDR 3 C= F3RDL
 4|4 C= HL 5 C= FSSR 6 C= FSSL 7 C= HM
 5|8 C= F2NDR 9 C= F2NDL 10 C= HR 11 C= F1STR 12 C= F1STL
 6|13 C= HRL 14 C= FBR
```

**Lines 7–10.** Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

```text
 7|( bit equates ) 7 C= VACT 6 C= VATBS 5 C= VOF
 8| 4 C= VPT 3 C= VGO 2 C= VHW ( half way to next base )
 9| 1 C= VBL 0 C= VRUN 1 C= VAUTO 0 C= VFORW
10|-->
```


<a id="block-148"></a>

### Block 148

Define byte offsets within each 31-byte vector record.

**Lines 0–6.** Assign magic, animation pointers, playaction pointer, update count, fixed-point X/Y positions and velocities. Names ending L/H identify low/high bytes; unsuffixed aliases name the cell start.

```text
 0|( BB constants )
 1| DECIMAL 0 C= VMAGIC 1 C= VANM# 2 C= VANML VANML C= VANM
 2| 3 C= VANMH 4 C= VANMSEQL VANMSEQL C= VANMSEQ 5 C= VANMSEQH
 3| 6 C= VPLAYACTPCL VPLAYACTPCL C= VPLAYACTPC 7 C= VPLAYACTPCH
 4| 8 C= VUPDATE# 10 C= VDXH 9 C= VDXL VDXL C= VDX 12 C= VXH
 5| 11 C= VXL VXL C= VX 14 C= VDYH 5 C= LDFLAG
 6| 13 C= VDYL VDYL C= VDY 16 C= VYH 15 C= VYL VYL C= VY
```

**Lines 7–11.** Assign status/base, pattern pointer, perspective, saved-screen address, expansion and destination fields.

```text
 7| 17 C= VSTATUS 18 C= VWBASE 20 C= VPATH
 8| 19 C= VPATL VPATL C= VPAT 21 C= VPERS#
 9| 22 C= VSCRADRL VSCRADRL C= VSCRADR 23 C= VSCRADRH
10| 24 C= VXPAND 25 C= VDSTXL VDSTXL C= VDSTX
11| 26 C= VDSTXH 27 C= VDSTYL VDSTYL C= VDSTY
```

**Lines 12–14.** Assign the shared offset 29 for VOFW/VVEL, record length VLENGTH=31 and runner-status offset 30; continue.

```text
12| 28 C= VDSTYH 29 C= VOFW 29 C= VVEL 31 C= VLENGTH
13| 30 C= VRSTAT
14|-->
```


<a id="block-149"></a>

### Block 149

Allocate persistent game/accounting variables, then relocate the variable pointer for transient play state.

**Lines 0–4.** Create temporary, player, inning, score, credits, coin-counter and attract/pricing variables. V= allocates cells; BV= allocates bytes.

```text
 0|( BB variables)
 1|BV= TMP3 V= TMP2 BV= CMPLR BV= SWRND# BV= LINN BV= CNSW1
 2| BV= PLYR1UP BV= INN# BV= SCORE1 BV= SCORE2 BV= HRAT
 3| BV= GAMEOVER BV= CREDITS BV= COINS V= INNX BV= UPCRED
 4| BV= CNTM1 BV= CNTM2 BV= 1STINN BV= SHILL BV= CNSW12
```

**Lines 5–6.** Print the current VPTR and move it to $7EA0 for the separately placed transient area.

```text
 5| ." VPTR SPEC- " VPTR @ H.
 6| HEX 7EA0 VPTR ! DECIMAL ( seperate ram )
```

**Lines 7–11.** Allocate computer-control, hit-sector, base, throw and play-pointer state.

```text
 7| BV= CMPT BV= CMSW BV= LBASE BV= WALK
 8| BV= HITTYPE BV= SECTNM BV= OFPU BV= HITGOING
 9| BV= BASESTATUS BV= OFTFCNT BV= THROW BV= THROWAROUND
10| BV= OLDSTRING BV= NEGDX BV= SWINGTYPE BV= BASEBLAT
11| BV= THRWBASE BV= OFFLDANM BV= HITOF V= PLAYON
```

**Lines 12–15.** Allocate message, double-play, timeout, pitcher-random, fence/homer and throw-animation state; continue.

```text
12| BV= STRINGERASE BV= DBLPLAY BV= OFTBLGO BV= INTFLAG
13| BV= OUTS BV= TAKEFIELD BV= OLDFORW V= WHOSUP
14| BV= TOTIMER BV= TOOF BV= TOOFF BV= TOOF# BV= PTRND#
15| BV= HOMER BV= FENCE V= WHOTHROWS BV= THROWANM -->
```

<a id="block-150"></a>

### Block 150

Allocate writable playaction records for each moving entity class.

**Lines 0–4.** Allocate trackball temporaries and the throw opcode/delta/update/pattern fields.

```text
 0|( BB variables)
 1| BV= OFANM# BV= OTBALLY BV= TBALLDY
 2| BV= TBALLYSR BV= OTBALLX BV= TBALLDX
 3| BV= THWOPCODE V= THWDX V= THWDY
 4| BV= THWUPDATE# V= THWPA
```

**Lines 5–8.** Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

```text
 5| BV= RUNOPCODE V= RUNDX V= RUNDY
 6| BV= RUNUPDATE# V= RUNPA
 7| BV= FLDOPCODE V= FLDDX V= FLDDY
 8| BV= FLDUPDATE# V= FLDPA
```

**Lines 9–15.** Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

```text
 9| BV= OFOPCODE V= OFDX V= OFDY
10| BV= OFUPDATE# V= OFPA
11| BV= TBLOPCODE V= TBLDX V= TBLDY
12| BV= TBLUPDATE# V= TBLPA
13| BV= OFFOPCODE V= OFFDX V= OFFDY
14| BV= OFFUPDATE# V= OFFPA
15|-->
```

<a id="block-151"></a>

### Block 151

Allocate timers and flags for innings, events, flashing indicators and hit processing.

**Lines 0–5.** Allocate pitch/vector temporaries, inning timers, scores, computer-fielding state, flashing ownership and message/catch controls.

```text
 0|( BB variables )
 1|V= TMPPITCH BV= STRT1 BV= DOWUP
 2| V= VECTPC BV= TFTIMER V= FNCX V= FNCY
 3| V= VECTIX BV= STRIKES BV= BALLS BV= HOMERUN
 4| BV= SCORESHOW V= CMFLDR BV= OFCRUN BV= FLSHSTAY BV= WUPFLSH
 5| BV= NOCATCH BV= WAITTHROW BV= STRING BV= STRINGOFFTIMER
```

**Lines 6–10.** Allocate strike/walk/bonus, field-clear, timing, odds, instruction, base-coordinate, double-play and catch/out flags.

```text
 6| BV= STRIKE BV= WLKCNT BV= SPBON BV= OFTOTBL
 7| BV= SAMEDLT BV= FLDCLR BV= TFTIME BV= ICPTYP V= FLSHWHO
 8| BV= TEMPU BV= IODDS BV= NORUN BV= INSOUT
 9| V= BASEX V= BASEY BV= DBLFLAG
10| BV= NORLWRT BV= OFCATCH BV= OFOUT
```

**Lines 11–15.** Allocate flashing timers, swing/music/cheer/homer flags and game-over-related counters; continue.

```text
11| BV= FLSHCNT BV= FLSHON BV= FLSHTIME
12| BV= SWINGGO BV= STMUSIC BV= CHEERME BV= HMRFLSH
13| BV= TIMEOUT BV= HMRCNT BV= HMFLSHCNT
14| BV= GOSECNT BV= GOSEO
15|-->
```

<a id="block-152"></a>

### Block 152

Finish the transient game-variable declarations.

**Lines 0–5.** Allocate computer-outfield/player-choice, interrupt, ball-distance, throw timers and airborne state.

```text
 0|( BB variables)
 1| BV= CMOFTIMER BV= CHKPLRS BV= SELECT
 2|  BV= WHICHINT BV= BLWAIT
 3| BV= BLTIME BV= RDST
 4| V= THROWTIMER V= THROWTIME
 5| BV= INAIR
```

**Lines 6–10.** Allocate base/defender pointers, scoring, grounder, double-play-hit, side/depth/foul and contact state.

```text
 6| BV= ATBASE V= FLDON1ST V= FLDON2ND
 7| V= FLDON3RD BV= SCRTIME
 8| BV= GRNDR BV= GRNDRVALUE
 9| BV= DPHIT BV= HLSIDE BV= HITDEEP BV= FOUL
10| BV= HITTIME BV= COMMITED
```

**Lines 11–15.** Allocate hit/catch/swing/forward/pitch state and end the variable chain.

```text
11| BV= HITYET BV= CAUGHT
12| BV= SWING BV= SWINGTIME
13| BV= FORW BV= PITCHIT
14| BV= PITCHTIME
15|;S
```

<a id="block-153"></a>

### Block 153

Prepare infield-hit support and a helper to distribute playaction pointers to defenders.

**Lines 0–2.** Save the radix, select hex and allocate temporary bytes.

```text
 0|( infield logic loop    LDINFLDPA , )
 1|BASE@ HEX
 2|BV= HTMP BV= HMTMP BV= SWINGTMP BV= WTMP BV= DPTMP
```

**Lines 3–5.** LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.

```text
 3|: LDINFLDPA VPLAYACTPC 3RD ! VPLAYACTPC SS ! VPLAYACTPC 2ND !
 4|    VPLAYACTPC 1ST ! VPLAYACTPC PT ! ;
 5|-->
```


<a id="block-154"></a>

### Block 154

Define the ball's post-hit initialization and destination/trajectory selection tables.

**Lines 0–3.** HITDST resets the ball update count, gives it THWBLPA, activates its ball status, selects BAL and places it at the batter's starting coordinates.

```text
 0|( BB infield logic HITDST , FHTBL , GHTBL , HTBL , HMHTBL )
 1|: HITDST ( chooses hit location ) VUPDATE# BL BZERO
 2| THWBLPA VPLAYACTPC BL ! 82 VSTATUS BL B! ( vact )
 3| BAL THWPA ! 2800 VX BL ! AD00 VY BL ! ;
```

**Lines 4–8.** Emit FHTBL fly-ball X destinations and GHTBL grounder X destinations.

```text
 4|TABLE FHTBL ( fly ball hit table )
 5|  4000 , 3000 , 2000 , 1000 , 200 ,
 6|TABLE GHTBL ( grounder hit table )
 7|  200 , 800 , 1000 , 1600 , 1800 , 2400 , 2800 , 2E00 ,
 8|  3700 , 3A00 , 3F00 , 4700 , 4E00 ,
```

**Lines 9–11.** Emit HMHTBL's homer/fence/normal classification bytes and continue. Values are data consumed by hit selection.

```text
 9|BTABLE HMHTBL ( fence = 1 homer = 2 normal = 0 )
10|  2 1 1 1 1 1 0 0 0 0 8STF B, B,
11|-->
```


<a id="block-155"></a>

### Block 155

Map left-side and middle ground-hit sectors to defender actions and a left/right indicator.

**Lines 0–4.** Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag.

```text
 0|( BB infield action by sector )
 1|: FBLLS NOACTPA FBLL3RD
 2|  1 THROWAROUND BONE FOUL BONE ;
 3|: HLLS HITOF BONE NOACTPA HLL3RD 1 ;
 4|: F3RDRS NOACTPA F3RDR3RD 1 ;
```

**Lines 5–12.** Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

```text
 5|: F3RDLS F3RDLSS F3RDL3RD 1 ;
 6|: HLS HITOF BONE HLSS HL3RD 1 ;
 7|: FSSRS DPHIT BONE FSSRSS HR3RD 1 ;
 8|: FSSLS DPHIT BONE FSSLSS HR3RD 1 ;
 9|: HMS HITOF BONE HMSS HR3RD 1 ;
10|: F2NDRS DPHIT BONE HRPT HL1ST F2NDR2ND 0 ;
11|: F2NDLS DPHIT BONE HRPT HL1ST F2NDL2ND 0 ;
12|-->
```


<a id="block-156"></a>

### Block 156

Finish right-side sector handlers and build the grounder dispatch table.

**Lines 0–6.** Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

```text
 0|( BB infield action by sector    GRNDRSTABLE )
 1|: HRS HITOF BONE HRPT HR1ST HR2ND 0 ;
 2|: F1STRS F1STPT F1STR1ST NOACTPA 0 ;
 3|: F1STLS F1STPT F1STL1ST NOACTPA 0 ;
 4|: HRLS HITOF BONE HRPT HRL1ST NOACTPA 0 ;
 5|: FBLRS FOUL BONE THROWAROUND BONE NOACTPA
 6| FBLR1ST NOACTPA 0 ;
```

**Lines 7–12.** Emit GSTBL in sector-number order using ticked execution addresses, then continue.

```text
 7|TABLE GSTBL ( grnder fielder action by sector )
 8|  ' FBLLS , ' HLLS , ' F3RDRS , ' F3RDLS ,
 9|  ' HLS , ' FSSRS , ' FSSLS , ' HMS ,
10|  ' F2NDRS , ' F2NDLS , ' HRS , ' F1STRS ,
11|  ' F1STLS , ' HRLS , ' FBLRS ,
12|-->
```


<a id="block-157"></a>

### Block 157

Dispatch a ground-hit sector and install the chosen infield actions.

**Lines 0–4.** GRNDRACTION clears prior hit/foul state, selects a GSTBL entry using the index and executes it with EX.

```text
 0|( BB infield action by sector    GRNDRACTION )
 1|: GRNDRACTION ( given sectnm set up infield action )
 2|  ( default values ) HITOF BZERO DPHIT BZERO
 3|  FOUL BZERO
 4|    GSTBL @ EX ( ret hlside and playact )
```

**Lines 5–9.** Save HLSIDE and install the returned left-side action pointers or the right-side defaults through LDINFLDPA; continue.

```text
 5|  DUP HLSIDE B! IF VPLAYACTPC 3RD ! VPLAYACTPC SS !
 6|  HLPT VPLAYACTPC PT ! HL1ST VPLAYACTPC 1ST ! HL2ND
 7|  VPLAYACTPC 2ND ! ELSE ( hit right side )
 8|  HRSS HR3RD LDINFLDPA THEN ;
 9|-->
```


<a id="block-158"></a>

### Block 158

Choose a ground-hit sector, schedule runner/defender movement and set the ball's destination.

**Lines 0–4.** Mark a grounder and speed 2, combine a random choice with horizontal pitch direction and SWINGTYPE, save SECTNM and dispatch GRNDRACTION.

```text
 0|( BB infield action    GRNDRHIT , CHKCN )
 1|: GRNDRHIT ( grounder ) GRNDR BONE 2 VVEL BL B!
 2|3 RND ( waited hit constant ) VDX BL 1+ B@ ( 1 , 0 -1 )
 3|  SWINGTYPE B@ SWINGTABLE @ EX DUP DUP DUP
 4|  SECTNM B! GRNDRACTION
```

**Lines 5–7.** For a foul, play the foul sound, request FOUL text and choose a side-dependent destination while discarding unused sector values.

```text
 5|  FOUL B@ IF MFOUL 1 THROWAROUND B! CFOUL STRING B!
 6|  HLSIDE B@ IF 800 ELSE 4800 THEN VDSTX BL !
 7|  6400 VDSTY BL ! DROP DROP
```

**Lines 8–12.** For fair play start the batter; schedule outfield timeout/computer pursuit or infield forced runners, select GHTBL's destination and initialize the ball through HITDST.

```text
 8|  ELSE ( fair ) WUPGO HITOF B@ IF 10 TOTIMER B!
 9|  TOOF BONE 3 TOOF# B!
10|  CMPT B@ IF 35 CMOFTIMER B! THEN ELSE HITRUN LBASE BONE THEN
11|  1- GHTBL @ VDSTX BL ! HM = IF 2C00 ELSE 3C00 THEN
12|    VDSTY BL ! THEN HITDST ;
```

**Lines 13–15.** Retain CNTBL's corner-coordinate data. Continue to the boundary-hit calculations.

```text
13| LABLE CNTBL 2800 , 2000 , 300 ,
14|( Unused CHKCN helper omitted; CNTBL is retained )
15|-->
```

<a id="block-159"></a>

### Block 159

Begin native fence/homer classification and rebound destination setup for fly balls.

**Lines 0–4.** HOMERCHK takes stacked random values, hit class and coordinates, swaps register banks and derives FNCY/FNCX perturbations.

```text
 0|( BB fence hit check does homer set up    HOMERCHK )
 1|CODE HOMERCHK ( chk for homer or fence hit )
 2|  EXX, PSW POP, 5 ADI, FNCY { 1+ } STA, ( 5 rnd +5 for fncy )
 3|  PSW POP, 4 ADI, A B MOV, ( 5 rnd +5 for fncx )
 4|  H POP, L A MOV, ( hit type ) H POP, ( x ) D POP, ( y )
```

**Lines 5–9.** Set FENCE or HOMER according to hit class and choose a destination adjustment; handle the left-corner case through CNTBL.

```text
 5|  A ANA, 0<>, IF, 1 CPI, =, IF, FENCE STA, 500 D LXI, ELSE,
 6|  HOMER STA, 100 D LXI, THEN, THEN,
 7|  A C MOV, D A MOV, 28 CPI, <, IF, H A MOV, 0A CPI, ( lcn )
 8|  <, IF, CNTBL H LXI, C A MOV, ' INDEXW CALL,
 9|        B H MOV, FNCX SHLD, 1C0 H LXI, ( lft corner )
```

**Lines 10–13.** Handle the right-corner case and continue the remaining central-field cases in 160.

```text
10|  ELSE, 46 CPI, >=, IF, CNTBL H LXI, C A MOV, ' INDEXW CALL,
11|         B A MOV, NEG, FNCX { 1+ } STA,
12|         4E00 H LXI, ( hit rt corner )
13|-->
```


<a id="block-160"></a>

### Block 160

Finish fly-ball boundary adjustment and return to target TERSE.

**Lines 0–5.** Choose the sign of the horizontal rebound/random component from SWINGTYPE and coordinate parity, then store the high byte of FNCX.

```text
 0|( BB infield action )
 1|  ELSE, SWINGTYPE LDA, A DCR, 0=, IF, B A MOV, NEG,
 2|  ELSE, 4 CPI, =, IF, B A MOV,
 3|  ELSE, B A MOV,
 4|         0 L BIT, 0=, IF, NEG, THEN, THEN, THEN,
 5|  FNCX { 1+ } STA, THEN,
```

**Lines 6–7.** Store the final BL destination, restore the register bank and NEXT back to TERSE. The first --> continues loading; the second is retained source after that directive.

```text
 6|  THEN, THEN, VDSTX BL SHLD, VDSTY BL SDED, EXX, NEXT -->
 7|-->
```


<a id="block-161"></a>

### Block 161

Choose a fly-ball destination and defender response.

**Lines 0–5.** Set outfield, timer, speed and airborne flags; select randomized Y/X coordinates and a HMHTBL class, call HOMERCHK and start the batter.

```text
 0|( BB infield action    OUTFLDHIT )
 1|: OUTFLDHIT ( fly ball ) 18 TOTIMER B! HITOF BONE 3 VVEL BL B!
 2|  TOOF BONE 3 TOOF# B! INAIR BONE 3000 RND 700 + ( y )
 3|  SWINGTYPE B@ 1- FHTBL @ F00 RND + ( x )
 4|  0A RND HMHTBL B@ ( hit type ) 5FF RND 5FF RND
 5|  HOMERCHK WUPGO
```

**Lines 6–9.** Initialize the ball with HITDST, choose the shortstop/second-base response from destination X, install defender actions and continue.

```text
 6|  HITDST HRPT HL1ST VDSTX BL @ 2800 < IF ( hit left )
 7|  HL2ND HLOUTSSPA ELSE HROUT2NDPA HRSS THEN HR3RD LDINFLDPA ;
 9|-->
```


<a id="block-162"></a>

### Block 162

Run the master infield-hit decision path after bat contact.

**Lines 0–4.** Clear catch/base/walk/run/double-play and boundary flags, request the bat-crack sound, and set PLAYON to R1.

```text
 0|( BB infield action    INLOG )
 1|: INLOG ( infield master logic ) NOCATCH BZERO LBASE BZERO
 2|  OFTBLGO BONE WLKCNT BZERO NORUN BZERO
 3|  MHIT VMAGIC R1 PLAYON ! GRNDR BZERO HOMER BZERO DBLFLAG BZERO
 4|  OFPU BZERO FENCE BZERO INAIR BZERO SWINGTYPE B@ 6 = IF 0
```

**Lines 5–6.** Select a hit branch using swing type and a random comparison with HRAT, saving HITTYPE in the ordinary case.

```text
 5|  ELSE HRAT B@ 0A RND < IF 0 ( flyb ) ELSE 1 ( grndr ) THEN
 6|  DUP HITTYPE B! THEN
```

**Lines 7–9.** The actual IF calls OUTFLDHIT for a nonzero selector and GRNDRHIT otherwise; the nearby `0 ( flyb )` comment conflicts with this branch. Activate all fielders, restore radix and stop loading.

```text
 7|  IF OUTFLDHIT CMPT B@ IF 30 CMOFTIMER B! THEN
 8|  ELSE GRNDRHIT THEN ALLFLDACT ;
 9|BASE! ;S
```


<a id="block-163"></a>

### Block 163

Supply occupancy-dependent runner actions for a fly ball.

**Lines 0–8.** Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```text
 0|( BB hit run and throw for outfield fly )
 1|SUBR FNBB RET,
 2|SUBR FRO1 AUTOR1 CALL, RET,
 3|SUBR FRO2 VSTATUS R1 STA, RET,
 4|SUBR FRO3 VSTATUS R1 STA, RET,
 5|SUBR FRO12 AUTOR1 CALL, AUTOR2 CALL, RET,
 6|SUBR FRO23 VSTATUS R1 STA, VSTATUS R2 STA, RET,
 7|SUBR FRO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL, RET,
 8|SUBR FRO13 VSTATUS R1 STA, AUTOR2 CALL, RET,
```

**Lines 9–11.** Emit WBSFTBL in the occupancy-code order used by BASESTATUS, then continue.

```text
 9|LABLE WBSFTBL
10| FNBB , FRO1 , FRO2 , FRO3 , FRO12 , FRO123 , FRO13 , FRO23 ,
11|-->
```


<a id="block-164"></a>

### Block 164

Dispatch fly-ball runner activation through WBSFTBL.

**Lines 0–3.** Select hexadecimal, declare the return label and begin TAKEOFF assembly.

```text
 0|( BB hit run and throw for outfield fly    TAKEOFF )
 1|HEX
 2|F= TORET
 3|SUBR TAKEOFF ( turn proper runners on ) <ASSEMBLE
```

**Lines 4–7.** Index WBSFTBL by BASESTATUS, push a synthetic native return address, load status $81 and jump to the chosen routine. Return at TORET and continue loading.

```text
 4|  BASESTATUS LDA, WBSFTBL H LXI, ' INDEXW CALL, TORET H LXI,
 5|  81 A MVI, ( vact & vrun ) H PUSH, ( ret add.) XCHG, PCHL,
 6|LABEL TORET RET, ASSEMBLE>
 7|-->
```


<a id="block-165"></a>

### Block 165

Begin occupancy-specific grounder runner logic and double-play selection.

**Lines 0–3.** SETDBLPLAY raises its flag; NBB is the empty-bases no-op.

```text
 0|( BB hit run and throw for infield grounder )
 1|SUBR SETDBLPLAY ( sets up double play HL-guy on 1st )
 2| 1 A MVI, DBLPLAY STA, RET,
 3|SUBR NBB RET,
```

**Lines 4–9.** RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
 4|SUBR RO1 AUTOR1 CALL, DPHIT LDA, A ANA,
 5|  SETDBLPLAY JNZ, VMAGIC R2 B LXI, RET,
 6|SUBR RO2 HLSIDE LDA, A ANA, 0=, IF,
 7|    AUTOR1 CALL, THEN, VMAGIC R2 B LXI, RET,
 8|SUBR RO3 VMAGIC R2 B LXI, DPHIT LDA, A ANA,
 9|  AUTOR1 CNZ, RET,
```

**Lines 10–13.** RO12 activates both forced runners, selecting a double-play or ordinary target; continue.

```text
10|SUBR RO12 AUTOR1 CALL, AUTOR2 CALL,
11|  VMAGIC R2 B LXI, DPHIT LDA, A ANA, SETDBLPLAY JNZ,
12|  VMAGIC R3 B LXI, RET,
13|-->
```


<a id="block-166"></a>

### Block 166

Finish grounder occupancy handlers and their dispatch table.

**Lines 0–6.** RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
 0|( BB hit run and throw for infield grounder )
 1|SUBR RO23 VMAGIC R3 B LXI, DPHIT LDA, A ANA,
 2|  0<>, IF, AUTOR1 CALL, HLSIDE LDA, A ANA, AUTOR2 CZ, THEN,
 3|  RET,
 4|SUBR RO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL,
 5|   VMAGIC R3 B LXI, DPHIT LDA, A ANA,
 6|   SETDBLPLAY JNZ, VMAGIC R1 B LXI, RET,
```

**Lines 7–10.** RO13 handles first-and-third occupancy and may branch through SETDBLPLAY.

```text
 7|SUBR RO13 AUTOR2 CALL, DPHIT LDA, A ANA,
 8|  VMAGIC R2 B LXI,
 9|  0<>, IF, AUTOR1 CALL, SETDBLPLAY JMP, THEN,
10|  VMAGIC R3 B LXI, RET,
```

**Lines 11–13.** Emit WBASETABLE in the same occupancy-code ordering and continue.

```text
11|LABLE WBASETABLE
12|  NBB , RO1 , RO2 , RO3 , RO12 , RO123 , RO13 , RO23 ,
13|-->
```


<a id="block-167"></a>

### Block 167

Select and execute the grounder runner handler, saving its selected play target.

**Lines 0–4.** Declare HRRET, define HITRUN, clear OFTBLGO so ordinary runners do not automatically advance two bases, and preserve BC.

```text
 0|( BB hit run and throw for infield grounder )
 1|FORWARD HRRET
 2|CODE HITRUN ( activate proper runners and set trwbase )
 3|   A XRA, OFTBLGO STA, ( runners wont advance 2 bases )
 4|  B PUSH, ( set playon by which runners go defaults to r1 )
```

**Lines 5–8.** Index WBASETABLE by BASESTATUS with R1 as the default BC target, push HRRET, dispatch via PCHL, then store returned BC in PLAYON and return to TERSE.

```text
 5|<ASSEMBLE BASESTATUS LDA, VMAGIC R1 B LXI, ( default value )
 6|  WBASETABLE H LXI, ' INDEXW CALL, HRRET H LXI,
 7|  SECTNM LDA, H PUSH, ( ret add. ) XCHG, PCHL,
 8|LABEL HRRET PLAYON SBCD, B POP, NEXT ASSEMBLE>
```

**Line 9.** Select decimal and stop the runner-logic chain.

```text
 9|DECIMAL ;S
```


<a id="block-168"></a>

### Block 168

Classify occupied bases and select the next batter/runner record.

**Lines 0–6.** RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```text
 0|( BB who's on which base    WHONBASEODDS )
 1|: RUN3CHK VWBASE R3 B@ 0 = IF 7 VMAGIC R3 ELSE 5 VMAGIC R4
 2|  THEN ;
 3|: RUN2CHK1ST VWBASE R2 B@ 1 = IF 6 VMAGIC R3
 4|     ELSE RUN3CHK THEN ;
 5|: RUN2CHK VWBASE R2 B@ 0 = IF 3 VMAGIC R2
 6|     ELSE RUN2CHK1ST THEN ;
```

**Lines 7–13.** RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue.

```text
 7|: RUN2CHK12ND VWBASE R2 B@ 0 = IF 2 VMAGIC R2
 8| ELSE 4 VMAGIC R3 THEN ;
 9|: RUN1CHK2ND VWBASE R1 B@ 2 = IF RUN2CHK12ND
10|     ELSE RUN2CHK THEN ;
11|: RUN1CHK1ST VWBASE R1 B@ 1 = IF 1 VMAGIC R2
12|     ELSE RUN1CHK2ND THEN ;
13|-->
```


<a id="block-169"></a>

### Block 169

Save occupancy and compute random pitch/swing choices and score-dependent hit odds.

**Lines 0–4.** HRBY2 halves HRAT. WHBODDS finds BASESTATUS and WHOSUP using the decision tree, treating an empty R1 as empty bases.

```text
 0|( BB who's on which base    WHBODDS )
 1|: HRBY2 HRAT B@ 2/ HRAT B! ;
 2|: WHBODDS ( sets who is on base calculates play odds )
 3|  VWBASE R1 B@ 0 = IF 0 VMAGIC R1
 4|  ELSE RUN1CHK1ST THEN WHOSUP ! BASESTATUS B!
```

**Lines 5–8.** Choose SWRND# and PTRND#, initialize HRAT from IODDS and calculate the score difference relative to the batting side.

```text
 5|  36 RND SWRND# B! 10 RND PTRND# B!
 6|  ( odds logic )
 7|  IODDS B@ HRAT B! SCORE2 B@ SCORE1 B@
 8|  PLYR1UP B@ IF SWAP THEN -
```

**Lines 9–13.** When behind, choose odds 7 or 8; when ahead by increasing thresholds, halve HRAT repeatedly. End loading.

```text
 9|  DUP 0 < IF -3 > IF 7 ELSE 8 THEN HRAT B!
10|  ELSE ( player up ahead )
11|  DUP 2 > IF HRBY2 DUP 4 > IF HRBY2 DUP 6 > IF HRBY2
12|  THEN THEN THEN DROP THEN ;
13|;S
```


<a id="block-170"></a>

### Block 170

Map the negative and central bat-swing angles to ground-hit sectors.

**Lines 0–2.** SW-90 ignores direction/random inputs and returns the far-right foul sector.

```text
 0|( BB hit logic )
 1|( given dx and rnd waited constant )
 2|: SW-90 DROP DROP FBR ;
```

**Lines 3–6.** SW-45 chooses among right/foul/first-base sectors using horizontal pitch direction and the random selector.

```text
 3|: SW-45 DUP IF 1 = IF ( x=1 ) DROP FBR
 4| ELSE ( x = -1 ) IF HRL ELSE F1STL THEN THEN
 5| ELSE ( X=0 ) DROP DUP IF 1- IF F1STL ELSE F1STR THEN
 6| ELSE DROP HRL THEN THEN ;
```

**Lines 7–10.** SW-30 chooses right/second-base sectors by the same input convention.

```text
 7|: SW-30 DUP IF 1 = IF ( x=1 ) IF F1STR ELSE HR THEN
 8| ELSE ( x=-1 ) IF HR ELSE F2NDL THEN THEN
 9| ELSE ( x= 0 ) DROP DUP IF 1- IF F2NDL ELSE F2NDR THEN
10| ELSE DROP HR THEN THEN ;
```

**Lines 11–14.** SW0 handles the central swing angle and middle/second-base/shortstop sectors; continue.

```text
11|: SW0 DUP IF 1 = IF ( x=1 ) IF F2NDR ELSE HM THEN
12| ELSE ( x=-1 ) IF FSSL ELSE HM THEN THEN
13| ELSE ( x=0 ) DROP IF HM ELSE F2NDR THEN THEN ;
14|-->
```


<a id="block-171"></a>

### Block 171

Finish positive-angle hit selection and assemble its dispatch table.

**Lines 0–4.** SW+30 chooses left/third-base/shortstop sectors.

```text
 0|( BB hit logic SWINGTABLE )
 1|: SW+30 DUP IF 1 = IF ( x=1 ) IF HL ELSE FSSR THEN
 2| ELSE ( x= -1 ) IF F3RDL ELSE HL THEN THEN
 3| ELSE ( x=0 ) DROP DUP IF 1- IF FSSR ELSE FSSL THEN
 4| ELSE DROP HL THEN THEN ;
```

**Lines 5–9.** SW+45 handles the left-edge choices; SW+90 always returns foul-left after dropping its inputs.

```text
 5|: SW+45 DUP IF 1 = IF ( x=1 ) IF HLL ELSE F3RDR THEN
 6| ELSE ( x= -1 ) DROP FBL THEN
 7| ELSE ( x=0 ) DROP DUP IF 1- IF F3RDR ELSE F3RDL THEN
 8| ELSE DROP HLL THEN THEN ;
 9|: SW+90 DROP DROP FBL ;
```

**Lines 10–13.** Emit SWINGTABLE in angle order from -90 through +90 and stop loading.

```text
10|TABLE SWINGTABLE
11|' SW-90 , ' SW-45 , ' SW-30 , ' SW0 ,
12|' SW+30 , ' SW+45 , ' SW+90 ,
13|;S
```


<a id="block-173"></a>

### Block 173

Aim the computer-controlled outfielder at the ball destination and advance its timeout stages.

**Lines 0–6.** CMPOF returns if outfield control is inactive; otherwise preserve IX, choose LF/CF/RF from destination X and save CMFLDR.

```text
 0|( BB outfield computer control    CMPOF )
 1|HEX
 2|SUBR CMPOF ( calculates proper deltas and patterns )
 3|  DI, OFTBLGO LDA, A ANA, RZ, X PUSHX,
 4|  VDSTXH BL LDA, 1C CPI, >=, IF, 34 CPI, >=, IF, 0 RF X LXIX,
 5|  ELSE, 0 CF X LXIX, THEN, ELSE, 0 LF X LXIX, THEN,
 6|  CMFLDR SIXD,
```

**Lines 7–9.** Calculate pursuit deltas/pattern with DSTCALC, write the shared OF motion fields, activate outfielders, restore IX and enable interrupts.

```text
 7|  VDSTX BL LHLD, VDSTY BL LDED, 20 A MVI, VGO VSTATUS X RESX,
 8|  ' DSTCALC CALL, OFDX SDED, OFDY SHLD, OFPA SBCD,
 9|  ' OUTFLDACT CALL, EI, X POPX, RET,
```

**Lines 10–13.** TOOFCK decrements TOOF#; while stages remain reload the timeout, otherwise start CMPOF and mark TOOFF. Return to decimal and stop loading.

```text
10|SUBR TOOFCK ( time out outfield check )
11|  TOOF# H LXI, M DCR, 0<>, IF, FF A MVI, TOOF STA,
12|  ELSE, CMPOF CALL, EI, 1 A MVI, TOOFF STA, THEN, RET,
13|DECIMAL ;S
```


<a id="block-174"></a>

### Block 174

Read trackball deltas and turn their signed values into discrete motion speeds.

**Lines 0–6.** Declare labels and define TBLVEL: zero gives zero velocity, small magnitudes give $0080, magnitudes at least three give $01B0, and the original sign is restored with COMPHL.

```text
 0|( BB tractor ball logic    TBALLPRC )
 1|FORWARD NZPDX FORWARD LDOFPA BASE@ HEX
 2|SUBR TBLVEL ( tractorball vel HL-# add. D-max vel )
 3|  M A MOV, 0 H LXI, A ANA, RZ,
 4|  7 A BIT, PSW PUSH, 0<>, IF, NEG, THEN, ( abs. )
 5|80 H LXI, 3 CPI, >=, IF, 1B0 H LXI, THEN,
 6|  PSW POP, ' COMPHL CNZ, RET,
```

**Line 7.** The source explicitly identifies the selected board input as deltas rather than absolute counters.

```text
 7|( Selected board trackball returns deltas, not absolute counts )
```

**Lines 10–14.** TBALLPRC reads port $13, toggles its axis selector, combines it with PLYR1UP for port $28 and stores the sampled byte in the interleaved TBALL delta area. Continue the routine.

```text
10|SUBR TBALLPRC ( pitch or control outfield ) <ASSEMBLE
11|13 IN, A D MOV, OTBALLX H LXI, M A MOV, A E MOV,
12|1 XRI, A M MOV, A L MOV, PLYR1UP LDA, A ADD, L ORA, 28 OUT,
13|E A MOV, A ADD, E ADD, TBALLDX FF AND ADI, A L MOV,
14|TBALLDX 100 / H MVI, D M MOV, -->
```


<a id="block-175"></a>

### Block 175

Use trackball-derived deltas for player-controlled outfield motion.

**Lines 0–2.** Return during computer pitching, inactive outfield control or the automatic-outfield timeout phase.

```text
 0|( BB outfield tractor ball running algorithm )
 1|  CMPT LDA, A ANA, RNZ, OFTBLGO LDA, A ANA, RZ,
 2|  TOOFF LDA, A ANA, RNZ,
```

**Lines 3–6.** Convert TBALLDY and TBALLDX through TBLVEL, save OFDY/OFDX and retain Y delta in DE; continue.

```text
 3|  TBALLDY H LXI, 1 D MVI, ' TBLVEL CALL, OFDY SHLD, H PUSH,
 4|   TBALLDX H LXI, 1 D MVI, ' TBLVEL CALL,
 5|    OFDX SHLD, D POP, ( ofdy )
 6|-->
```


<a id="block-176"></a>

### Block 176

Choose outfielder standing/right-running/left-running animation from the motion deltas.

**Lines 0–4.** Test all bytes of the X/Y deltas; when both are zero select STND and skip reactivation.

```text
 0|( BB out fielder animation logic )
 1|    7 H BIT, 0=, IF, A XRA, H CMP, NZPDX JNZ,
 2|                     D CMP, NZPDX JNZ, E CMP, NZPDX JNZ,
 3|                     L CMP, NZPDX JNZ, STND H LXI, ( zero delt)
 4|                     LDOFPA JMP,
```

**Lines 5–9.** For movement choose RRUN or LRUN by X sign, activate outfielders, save OFPA, return and finish two-pass assembly; continue loading.

```text
 5|            LABEL NZPDX RRUN H LXI, ( pos dx )
 6|                 ELSE, LRUN H LXI, ( neg dx )
 7|                 THEN, H PUSH, ' OUTFLDACT CALL, H POP,
 8|            LABEL LDOFPA OFPA SHLD, RET, ASSEMBLE>
 9|-->
```


<a id="block-177"></a>

### Block 177

Convert trackball input into pitcher/ball movement parameters.

**Lines 0–9.** TBALLPITCH adjusts TBALLYSR using signed Y input, clamps the positive progression to three and avoids reducing the negative-side state below the shown threshold; store the resulting cell in TBLDY.

```text
 0|( BB pitching algorithm    TBALLPITCH )
 1|CODE TBALLPITCH ( loads pitch velocities )
 2|   TBALLYSR H LXI, TBALLDY LDA, 7 A BIT, PSW PUSH, ( sign )
 3|   M SUB, EXAF, ( save sub ) PSW POP, ( sign )
 4|    0>=, IF, EXAF, ( subtraction )
 5|      0>=, IF, M ADD, A M MOV, 3 CPI, >=, IF, 3 A MVI, THEN,
 6|     ( max = 3 ) A M MOV, THEN, ( if pos and > dy = sr )
 7|    ELSE, ( neg dy ) M A MOV, 2 CPI,
 8|       >=, IF, M DCR, THEN, ( if neg and sr >= 2 dcr sr )
 9|     THEN, M A MOV, A H MOV, 0 L MVI, DI, TBLDY SHLD,
```

**Lines 10–14.** When WLKCNT permits, choose a small positive or negative horizontal ball delta from TBALLDX; otherwise leave zero. Store TBLDX, restore interrupts/radix and stop loading.

```text
10|  TBALLDX H LXI, 0 D LXI, WLKCNT LDA, 2 CPI, <, IF,
11|  M A MOV, A ANA,
12|  0<>, IF, 7 A BIT, 0=, IF, C0 D LXI, ELSE, FF40 D LXI,
13|  THEN, THEN, THEN, TBLDX SDED, EI, RET,
14|BASE! ;S
```


<a id="block-178"></a>

### Block 178

Define the first on-screen event messages and a two-rotation stack helper.

**Lines 0–2.** Save radix, select hex and define 2ROT as two ROT operations.

```text
 0|( BB short subroutines string routines )
 1|BASE@ HEX
 2|: 2ROT ROT ROT ;
```

**Lines 3–10.** Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

```text
 3|: SSAFE 2400 2ROT A" SAFE " SPOST SBO ;
 4|: SFOUL 2400 2ROT A" FOUL " SPOST ;
 5|: SOUT1 2300 2ROT A" 1 OUT" SPOST ;
 6|: SOUT2 2200 2ROT A" 2 OUTS" SPOST ;
 7|: SOUT3 2200 2ROT A" 3 OUTS" SPOST ;
 8|: SSTRIKE1 2000 2ROT A" STRIKE 1" SPOST ;
 9|: SSTRIKE2 2100 2ROT A" STRIKE 2" SPOST ;
10|-->
```


<a id="block-179"></a>

### Block 179

Complete event messages and select text from the current ball/strike/out counts.

**Lines 0–5.** Define BALL 1/2/3, HOMER and WALK string words.

```text
 0|( BB short subroutines string routines )
 1|: SBALL1 2200 2ROT A" BALL 1" SPOST ;
 2|: SBALL2 2200 2ROT A" BALL 2" SPOST ;
 3|: SBALL3 2200 2ROT A" BALL 3" SPOST ;
 4|: SHOMER 2300 2ROT A" HOMER" SPOST ;
 5|: SWALK 2400 2ROT A" WALK" SPOST ;
```

**Lines 6–7.** Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

```text
 6|  6 C= CSAFE 1 C= CFOUL 2 C= COUT 3 C= CSTRIKE 4 C= CBALL
 7|  5 C= CHOMER 7 C= CWALK
```

**Lines 8–12.** DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
 8|: DOSOUT OUTS B@ DUP 31 = IF DROP SOUT1 ELSE 32 = IF SOUT2
 9|  ELSE SOUT3 THEN THEN ;
10|: DOSSTRIKE STRIKES B@ 31 = IF SSTRIKE1 ELSE SSTRIKE2 THEN ;
11|: DOSBALL BALLS B@ DUP 31 = IF DROP SBALL1 ELSE 32 = IF SBALL2
12|  ELSE SBALL3 THEN THEN ;
```

**Lines 13–14.** CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.

```text
13|CODE CLRBLST 30 A MVI, BALLS STA, STRIKES STA, NEXT
14|-->
```


<a id="block-180"></a>

### Block 180

Provide ball erasure and homer-event display helpers.

**Lines 0–2.** BALLERASE preserves BC/IY around native BLERASE and returns to TERSE.

```text
 0|( BB BALLERASE , DOHOMER , DOEHOMER )
 1|CODE BALLERASE B PUSH, Y PUSHX, BLERASE CALL,
 2|  Y POPX, B POP, NEXT
```

**Lines 3–5.** DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; DOEHOMER only posts the text. Continue.

```text
 3|: DOHOMER BALLERASE SHOMER CLRBLST SBO STRINGOFFTIMER BZERO ;
 4|: DOEHOMER SHOMER ;
 5|-->
```


<a id="block-181"></a>

### Block 181

Process an out and, on the third out, send players off field and request the next half-inning.

**Lines 0–3.** Define GAME OVER text. OUTTIME increments OUTS; reaching $33 enters the third-out path and requests cheer music.

```text
 0|( BB string routines    OUTTIME )
 1|: SGO 2000 2D00 828 A" GAME OVER" SPOST ;
 2|: OUTTIME ( out prc )
 3|  OUTS DUP 1+B! B@ 33 = IF MYAH
```

**Lines 4–7.** Assign OFFFPA to eight fielders, activate them while clearing VGO, set TAKEFIELD, and erase the ball when the out followed a third strike.

```text
 4|  VMAGIC PT 08 0 DO DUP DUP VPLAYACTPCL + OFFFPA S!
 5|  VSTATUS + DUP B@ 80 OR F7 AND SB! VLENGTH + LOOP
 6|  DROP TAKEFIELD BONE
 7|  STRIKES B@ 33 = IF BALLERASE THEN
```

**Lines 8–11.** Apply off-field actions to all four runner records, preserving activation for occupied bases.

```text
 8|  VMAGIC R1 4 0 DO DUP DUP VPLAYACTPCL + OFFFPA S!
 9|  VSTATUS + DUP B@ F7 AND ( res vgo ) SB!
10|   DUP VWBASE + B@ IF DUP ( set active if onbase )
11|  VSTATUS + DUP B@ 80 OR SB! THEN VLENGTH + LOOP DROP
```

**Lines 12–15.** If appropriate mark GAMEOVER at the last inning; otherwise play OUT music. Reset counts, redraw them and display the out count; continue.

```text
12|  PLYR1UP B@ IF INN# B@ LINN B@ = IF
13|  SGO GAMEOVER BONE FLSHOFF THEN THEN
14|  ELSE MOUT THEN CLRBLST SBO DOSOUT ;
15|-->
```

<a id="block-182"></a>

### Block 182

Handle strike, ball and foul count events, including strikeouts and walks.

**Lines 0–3.** STRIKETIME increments STRIKES. At $33 call OUTTIME and retain the OUT event code; otherwise play/post the new strike count.

```text
 0|( BB short subroutines STRIKETIME , BALLTIME , FOULTIME )
 1|: STRIKETIME ( strike process )
 2|  STRIKES DUP 1+B! B@ 33 = IF OUTTIME COUT OLDSTRING B!
 3|  ELSE MSTRIKE DOSSTRIKE THEN SBO ;
```

**Lines 5–9.** BALLTIME increments BALLS. At $34 display WALK, start forced runner movement and a WALK timer, update odds/base state and clear counts; otherwise play/post the ball count.

```text
 5|: BALLTIME ( balls process )
 6|  BALLS DUP 1+B! B@ 34 = IF SWALK MYAH WLKCNT 1+B!
 7|  CWALK OLDSTRING B! LBASE BONE 40 WALK B!
 8|   1 HLSIDE B! WHBODDS HITRUN ( start runners ) WUPGO
 9|  CLRBLST ELSE MBALL DOSBALL THEN SBO ;
```

**Lines 11–14.** FOULTIME posts FOUL and increments strikes only below two, then redraws counts; continue.

```text
11|: FOULTIME ( foulball process )
12|  SFOUL STRIKES DUP B@ 32 = IF DROP
13|  ELSE 1+B! SBO THEN ;
14|-->
```


<a id="block-183"></a>

### Block 183

Build event-display dispatch tables and update a team's numeric score.

**Lines 0–4.** DOSAFE combines music/text. STETBL holds redraw addresses for erasing old XOR text, including the repeated SAFE entry and WALK.

```text
 0|( BB short subroutines SCOREME , STTBL , STETBL )
 1|: DOSAFE MSAFE SSAFE ;
 2|TABLE STETBL ( string erase table )
 3|  ' SSAFE , ' SFOUL , ' DOSOUT , ' DOSSTRIKE , ' DOSBALL ,
 4|  ' DOEHOMER , ' SSAFE , ' SWALK ,
```

**Lines 5–7.** STTBL holds event-processing addresses in STRING event order.

```text
 5|TABLE STTBL ( string prc table )
 6| ' SSAFE , ' FOULTIME , ' OUTTIME ,
 7|   ' STRIKETIME , ' BALLTIME , ' DOHOMER , ' DOSAFE ,
```

**Lines 8–12.** SCOREME selects SCORE1/SCORE2 and coordinates from SCORESHOW, posts one BCD byte, clears the display request and selects cannon or cheer music; continue.

```text
 8|: SCOREME ( plop scores up )
 9|   SCORESHOW DUP B@ 2 = IF 900 8C00 4308 SCORE2
10|  ELSE 4300 8C00 4308 SCORE1 THEN 1 NPOST BZERO
11|  HOMERUN B@ IF MCANNON ELSE MYAH THEN ;
12|-->
```


<a id="block-184"></a>

### Block 184

Dispatch event drawing/erasure while retaining the previous message for XOR removal.

**Lines 0–5.** STRINGGO sets the shared Y/options, chooses STETBL for erase or STTBL for an event and initializes its expiry timer, executes the selected word and drops retained drawing parameters.

```text
 0|( BB string routines    STRINGGO , STRINGPRC )
 1|: STRINGGO ( given string , stringerase )
 2|  7A00 ( y ) 828 ( ex/mg ) 4 PICK 4 PICK
 3|  IF STETBL ELSE
 4|  STTBL 50 STRINGOFFTIMER B! THEN @ EX
 5|  DROP DROP ;
```

**Lines 6–11.** STRINGPRC takes and clears STRING, erases an existing timed message when necessary, records OLDSTRING, draws/processes the new event and clears STRINGERASE.

```text
 6|: STRINGPRC ( string display )
 7|  STRING B@ DUP STRING BZERO
 8|  STRINGOFFTIMER B@ IF OLDSTRING B@ 1 STRINGGO OLDSTRING B!
 9|    0 ( erase or write ) STRINGGO
10|  ELSE OLDSTRING B! ( one string ) STRINGERASE B@ STRINGGO
11|  THEN STRINGERASE BZERO ;
```

**Line 12.** Restore the saved radix and stop loading.

```text
12|BASE! ;S
```


<a id="block-186"></a>

### Block 186

Build the first layer of paired sprite-address tables.

```text
; RUP0B             RUP0M
; 16x13             16x14
; .....##.........  .....##.........
; .....##.........  .....##.........
; ...####.........  ....###.........
; ..#.#######.....  ...#####........
; .#..###.........  ...#####........
; #...###.........  ...####.#.......
; ....###.........  ...####.#.......
; ....####........  ....###.........
; ...######.......  ....###.........
; ...##..##.......  ....###.........
; #####..##.......  ....###.........
; #####..##.......  ....####........
; #.......##......  ....##..........
;                   ....###.........
```


**Lines 0–7.** For each running/fielding perspective level, pair its B and M sprite addresses under RUNUPn or FLDUPn.

```text
 0|( BB pattern tables )
 1|LABLE RUNUP0 RUP0B , RUP0M ,
 2|LABLE RUNUP1 RUP1B , RUP1M ,
 3|LABLE RUNUP2 RUP2B , RUP2M ,
 4|LABLE RUNUP3 RUP3B , RUP3M ,
 5|LABLE RUNUP4 RUP4B , RUP4M ,
 6|LABLE FLDUP1 FUP1B , FUP1M ,
 7|LABLE FLDUP2 FUP2B , FUP2M ,
```

**Lines 8–12.** Pair invisible, ball and on-base sprites with themselves for both motion phases, then continue.

```text
 8|LABLE NOBOD0 NOBOD , NOBOD ,
 9|LABLE BALL0 BALLPAT , BALLPAT ,
10|LABLE ONBS1 ONBASE1 , ONBASE1 ,
11|LABLE ONBS2 ONBASE2 , ONBASE2 ,
12|-->
```


<a id="block-187"></a>

### Block 187

Build paired throwing and covering sprite-address tables.

```text
; TUP1M             TUP1F
; 16x12             16x14
; .....###........  #...............
; .....###........  #...............
; ....#####.......  #.##............
; #########.......  #.##............
; ....######......  .####...........
; ....#####.#.....  .#####..........
; ....#####..#....  .####.#.........
; ....#####.......  .####..#........
; ....##.##.......  .####...........
; ....##.##.......  .####...........
; ...###.##.......  #####...........
; .......###......  ##.##...........
;                   #..##...........
;                   ...###..........
```


**Lines 0–4.** Pair TUPnM/TUPnF images at four perspectives under THRWUP1–4.

```text
 0|( BB pattern tables )
 1|LABLE THRWUP1 TUP1M , TUP1F ,
 2|LABLE THRWUP2 TUP2M , TUP2F ,
 3|LABLE THRWUP3 TUP3M , TUP3F ,
 4|LABLE THRWUP4 TUP4M , TUP4F ,
```

**Lines 5–8.** Provide pitcher-throw and repeated-image covering pairs; continue.

```text
 5|LABLE PTTHW1 PTMID , TUP1F ,
 6|LABLE STCB1 TUP1M , TUP1M ,
 7|LABLE STCB2 TUP2M , TUP2M ,
 8|-->
```


<a id="block-188"></a>

### Block 188

Build standing/cover-base pairs and selected perspective lists.

```text
; STN1              STNPT
; 16x12             16x12
; ....##..........  .....###........
; ....##..........  .....###........
; ..######........  ...#######......
; .########.......  ..#########.....
; #..####..#......  .#..#####..#....
; #..####..#......  .#..#####..#....
; #..####..#......  .#..#####..#....
; ...####.........  ....#####.......
; ...#..#.........  ....##.##.......
; ...#..#.........  ....##.##.......
; ...#..#.........  ....##.##.......
; ..##..##........  ...###.###......
```


**Lines 0–7.** Create standing, pitcher-standing and covering two-frame pairs.

```text
 0|( BB pattern tables )
 1|LABLE STND1 STN1 , STN1 ,
 2|LABLE STND2 STN2 , STN2 ,
 3|LABLE STND3 STN3 , STN3 ,
 4|LABLE STND4 STN4 , STN4 ,
 5|LABLE STPT1 STNPT , STNPT ,
 6|LABLE CVRBUP1 CBUP1 , CBUP1 ,
 7|LABLE CVRBUP2 CBUP2 , CBUP2 ,
```

**Lines 9–14.** Emit perspective lists for ball, covering, standing pitcher, pitcher throwing and on-base animation; continue.

```text
 9|LABLE BALLM BALL0 , BALL0 , BALL0 , BALL0 , BALL0 ,
10|LABLE STCB STCB1 , STCB1 , STCB2 ,
11|LABLE STNDPT STPT1 , STPT1 ,
12|LABLE PTPT PTTHW1 , PTTHW1 ,
13|LABLE ONBASE ONBS1 , ONBS1 , ONBS2 ,
14|-->
```


<a id="block-189"></a>

### Block 189

Assemble the top-level animation-group matrix PATTERNS.

```text
; RUP0M             FUP1M
; 16x14             16x11
; .....##.........  ......##........
; .....##.........  ......##........
; ....###.........  .....###........
; ...#####........  ....#####.......
; ...#####........  ...#####.#......
; ...####.#.......  ..#####...#.....
; ...####.#.......  ..####..........
; ....###.........  ..###...........
; ....###.........  ..####..........
; ....###.........  ..##............
; ....###.........  ..###...........
; ....####........
; ....##..........
; ....###.........
;
; TUP1M             STN1
; 16x12             16x12
; .....###........  ....##..........
; .....###........  ....##..........
; ....#####.......  ..######........
; #########.......  .########.......
; ....######......  #..####..#......
; ....#####.#.....  #..####..#......
; ....#####..#....  #..####..#......
; ....#####.......  ...####.........
; ....##.##.......  ...#..#.........
; ....##.##.......  ...#..#.........
; ...###.##.......  ...#..#.........
; .......###......  ..##..##........
```


**Lines 0–10.** Emit perspective lists for cover, throw, invisible, run, field and standing animations, using repeated entries where fewer unique sizes exist.

```text
 0|( BB pattern table matrix    PATTERNS )
 1|LABLE CVRBUP CVRBUP1 , CVRBUP1 , CVRBUP2 ,
 2|LABLE THRWUP THRWUP1 , THRWUP1 , THRWUP2 ,
 3|             THRWUP3 , THRWUP4 ,
 4|LABLE NOBODY NOBOD0 , NOBOD0 , NOBOD0 ,
 5|             NOBOD0 , NOBOD0 ,
 6|LABLE RUNUP RUNUP0 , RUNUP1 , RUNUP2 ,
 7|             RUNUP3 , RUNUP4 ,
 8|LABLE FLDUP FLDUP1 , FLDUP1 , FLDUP2 ,
 9|LABLE STNDS STND1 , STND1 , STND2 ,
10|             STND3 , STND4 ,
```

**Lines 11–15.** Emit PATTERNS in the group order selected by packed pattern numbers, then finish loading.

```text
11|LABLE PATTERNS ( MAIN MATRIX )
12| RUNUP , FLDUP , THRWUP , CVRBUP , STNDS ,
13| NOBODY , BALLM , STCB , STNDPT ,
14| PTPT , ONBASE ,
15|;S
```

<a id="block-190"></a>

### Block 190

Begin native playaction opcodes and provide runner destination coordinates.

**Lines 0–3.** Save radix, select hex and emit BSRTBL as X/Y base-running coordinate pairs.

```text
 0|( BB op codes for playaction defined BSRTBL , DEACTIVATE )
 1|BASE@ HEX
 2|LABLE BSRTBL 3E80 , 6100 , 2800 , 4700 , 11C0 , 6300 ,
 3| 2800 , A600 ,
```

**Lines 4–6.** DEACTIVATE clears VACT in the IX vector record and sets SAMEDLT so playaction loading can retain existing motion; return and continue.

```text
 4|CODE DEACTIVATE ( reset active bit in status )
 5| VACT VSTATUS X RESX, 1 A MVI, SAMEDLT STA, RET,
 6|-->
```


<a id="block-191"></a>

### Block 191

Set throw-animation requests and record which defender covers each base.

**Lines 0–4.** THWANMSET saves the IX entity as WHOTHROWS, erases the ball and sets INAIR/THROWANM for the foreground sentry.

```text
 0|( BB op codes for playaction defined THWANMSET )
 1|CODE THWANMSET ( set up throw animation )
 2| X PUSHX, H POP, WHOTHROWS SHLD, ( save who throws )
 3| BLERASE CALL, 1 A MVI, INAIR STA,
 4| THROWANM STA, RET, ( set for sentry call )
```

**Lines 5–8.** ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue.

```text
 5|CODE ON1ST X PUSHX, H POP, FLDON1ST SHLD, RET,
 6|CODE ON2ND X PUSHX, H POP, FLDON2ND SHLD, RET,
 7|CODE ON3RD X PUSHX, H POP, FLDON3RD SHLD, RET,
 8|-->
```


<a id="block-192"></a>

### Block 192

Begin ball destination handling for hit, thrown and rebounding balls.

**Lines 0–4.** BLDST preserves BC, reads the ball speed, loads its destination and calls DSTCALC; a LDFLAG result means retain the current motion.

```text
 0|( BB op codes for playaction defined BLDST )
 1|CODE BLDST ( ball thrown or hit )
 2| B PUSH, VVEL BL LDA,
 3| ( max delt ) ' DSTLD CALL, ' DSTCALC CALL,
 4| LDFLAG CPI, <>, IF, A ANA, ( rd dst ) 0<>, IF,
```

**Lines 5–9.** On arrival clear grounder/airborne state. A throw hides the ball and requests CAUGHT; a hit preserves calculated deltas and enters outfield boundary-event handling in 193.

```text
 5| A XRA, GRNDR STA, INAIR STA,
 6| THROW LDA, A ANA, 0<>, IF, ( throw or hit )
 7| NBD H LXI, THWPA SHLD, CAUGHT STA, ELSE, H PUSH, D PUSH,
 8| HITOF LDA, A ANA, 0<>, IF,
 9|-->
```


<a id="block-193"></a>

### Block 193

Complete homer/fence reactions and publish the writable ball motion record.

**Lines 0–4.** Optionally start computer pursuit. A homer requests music/HOMER text, initializes flashing counters, clears HOMER and stops outfield motion.

```text
 0|( BB op codes for playaction defined )
 1|  CMPT LDA, A ANA, CMPOF CNZ,
 2|  HOMER LDA, A ANA, 0<>, IF, STMUSIC STA, HOMERUN STA,
 3|  CHOMER A MVI, STRING STA, 10 A MVI, HMFLSHCNT STA, 5 A MVI,
 4|  HMRCNT STA, A XRA, HOMER STA, ' KILLOF CALL, THEN,
```

**Lines 5–8.** For a fence hit compute a new ball destination using FNCX/FNCY and reactivate the ball.

```text
 5|  FENCE LDA, A ANA, 0<>, IF, STMUSIC STA, FNCX LHLD,
 6|  VX BL LDED, D DAD, VDSTX BL SHLD, VY BL LHLD, FNCY LDED,
 7|  D DAD, VDSTY BL SHLD,
 8|  A XRA, FENCE STA, VACT VSTATUS X SETX, THEN, THEN,
```

**Lines 9–11.** Restore saved deltas, store THWDY/THWDX as required and set VECTPC to THWPA; restore BC, return and continue.

```text
 9|  D POP, H POP, THEN, THEN, THWDY SHLD, THWDX SDED,
10|  THEN, THWPA H LXI, VECTPC SHLD, B POP, RET,
11|-->
```


<a id="block-194"></a>

### Block 194

Move defenders to their fielding positions and signal when the outfield is ready.

**Lines 0–6.** FLDDST calculates motion at speed 4. On pitcher arrival select STPT and initialize pitch/timeout/outfield-control state; other arrivals select STND.

```text
 0|( BB op codes for playaction defined    FLDDST )
 1|CODE FLDDST ( fielders take position logic )
 2|  4 A MVI, ' DSTLD CALL, ' DSTCALC CALL, LDFLAG CPI, <>, IF,
 3|  A ANA, 0<>, IF, ( rdst ) VPT VSTATUS X BITX, 0<>, IF,
 4|  STPT B LXI, PITCHIT STA, CMPT LDA, A ANA, 0<>, IF, 4 A MVI,
 5|  ELSE, 1C A MVI, THEN, TIMEOUT STA, OFTBLGO STA, ELSE,
 6|  STND B LXI, THEN, VOF VSTATUS X BITX,
```

**Lines 7–10.** Count each outfielder arrival with OFTFCNT; when all three arrive, clear TAKEFIELD and request the outfield table.

```text
 7|  0<>, IF, OFTFCNT LDA, A DCR, OFTFCNT STA, A ANA, 0=, IF,
 8|  TAKEFIELD STA, 3 A MVI, OFTOTBL STA,
 9|  OFTFCNT STA, THEN, THEN, THEN,
10|  ( count all of outfielders in position )
```

**Lines 11–13.** Write the selected pattern/deltas into FLDPA/FLDDY/FLDDX and point VECTPC at that RAM record; continue.

```text
11|  FLDPA SBCD, FLDDY SHLD, FLDDX SDED,
12|  THEN, FLDPA H LXI, VECTPC SHLD, RET,
13|-->
```


<a id="block-195"></a>

### Block 195

Move players off field and finish homer scoring once the last relevant runner leaves.

**Lines 0–6.** OFFFDST schedules a take-field delay for outfielders, chooses an exit side from team/runner status and calls DSTCALC for the off-field destination.

```text
 0|( BB op codes for playaction defined    OFFFDST )
 1|FORWARD OFFPALD
 2|CODE OFFFDST ( all player off field control ) <ASSEMBLE
 3|  VOF VSTATUS X BITX, 0<>, IF, 20 A MVI, TFTIMER STA, THEN,
 4|  PLYR1UP LDA, VRUN VSTATUS X BITX, 0<>, IF, 1 XRI, THEN,
 5|  A ANA, 0=, IF, 3600 H LXI, ELSE, 1B00 H LXI,
 6|  THEN, 9300 D LXI, 5 A MVI, ( max vel )
```

**Lines 7–13.** On arrival hide the entity. For runners decrement FLDCLR; when homer processing reaches the last relevant runner, request catch/throwaround/music cleanup and clear HOMERUN.

```text
 7|  ' DSTCALC CALL, LDFLAG CPI, <>, IF,
 8|  A ANA, 0<>, IF, NBD B LXI, VRUN VSTATUS X BITX, 0<>, IF,
 9|  FLDCLR LDA, A DCR, FLDCLR STA, 0=, IF, HOMERUN LDA, A ANA,
10|  0<>, IF, H PUSH, X PUSHX, H POP, WHOSUP LDA, L CMP, H POP,
11|  ( last guy? ) >=, IF, 1 A MVI, CAUGHT STA, THROWAROUND STA,
12|  STMUSIC STA, CHEERME STA, STRINGOFFTIMER STA,
13|  A XRA, HOMERUN STA, THEN, THEN, THEN, THEN, THEN,
```

**Lines 14–15.** At OFFPALD write the off-field pattern/deltas, select OFFPA as VECTPC, return and close assembly; continue.

```text
14|LABEL OFFPALD OFFPA SBCD, OFFDX SDED, OFFDY SHLD,
15|  THEN, OFFPA H LXI, VECTPC SHLD, RET, ASSEMBLE> -->
```

<a id="block-196"></a>

### Block 196

Begin the runner state machine for automatic/player-controlled advancement and retreat.

**Lines 0–3.** Declare its cross-screen branch labels and enter RUNDST assembly.

```text
 0|( BB op codes for playaction defined    RUNDST )
 1| F= NVFORW F= RBACK F= ROFW F= NVAUTO F= SOFW F= RVGO F= SVAVF
 2| F= NFORW F= RFDST F= REND F= NOFPU F= CKATBS F= RVACT
 3|CODE RUNDST ( runner base running control ) <ASSEMBLE
```

**Lines 4–9.** If NORUN is set, compare the runner ahead and force retreat when that runner occupies the next base.

```text
 4|  VWBASE X B LDX, NORUN LDA, A ANA, 0<>, IF, ( caught )
 5|  X PUSHX, H POP, VMAGIC R1 LDA, L CMP, <>, IF, ( not r1 )
 6|  VLENGTH D LXI, A ANA, ( reset cy ) D DSBC, ( runner ahead )
 7|  H PUSH, Y POPX, VWBASE Y A LDX, A DCR, B CMP,
 8|  =, IF, VATBS VSTATUS Y BITX, 0<>, IF, ( man on next base )
 9|  2 A MVI, A VRSTAT X STX, ( go back ) THEN, THEN, THEN, THEN,
```

**Lines 10–15.** Read runner control/forward state, honor HOMERUN automatic advancement and choose forward, retreat or at-base paths; continue.

```text
10|  VRSTAT X D LDX, VOFW X C LDX, HOMERUN LDA, A ANA, SVAVF JNZ,
11|  VAUTO D BIT, NVAUTO JZ, VFORW D BIT, NVFORW JZ,
12|  C A MOV, ( ofw ) A ANA, RFDST JNZ, SOFW JMP,
13|LABEL NVFORW C A MOV, ( ofw ) A ANA, CKATBS JZ,
14|LABEL ROFW A XRA, A VOFW X STX, B DCR, RVGO JMP,
15|-->
```

<a id="block-197"></a>

### Block 197

Continue runner control and choose the destination base.

**Lines 0–7.** Handle player FORW input, halfway commitment and the automatic-forward state, updating VOFW/VRSTAT and clearing VGO when a destination changes.

```text
 0|( BB op codes for playaction defined )
 1|LABEL NVAUTO ( runner under player control )
 2|  FORW LDA, A ANA, NFORW JZ, C A MOV, ( ofw ) A ANA,
 3|  SOFW JZ, VHW VSTATUS X BITX, ( half way ) RFDST JZ,
 4|LABEL SVAVF 3 A MVI, LVRSTAT CALL, ( vauto vforw for all )
 5|  RFDST JMP,
 6|LABEL SOFW 1 A MVI, A VOFW X STX,
 7|LABEL RVGO VGO VSTATUS X RESX, RFDST JMP,
```

**Lines 8–11.** Handle outfield pickup, forced retreat and the already-at-base shortcut.

```text
 8|LABEL NFORW OFPU LDA, A ANA, NOFPU JZ, ( out field pick up )
 9|2 A MVI, A VRSTAT X STX, ( set vauto & reset vfopu ) NVFORW JMP,
10| LABEL NOFPU C A MOV, ( ofw ) A ANA, ROFW JNZ,
11|LABEL CKATBS B DCR, VATBS VSTATUS X BITX, REND JNZ,
```

**Lines 12–15.** Index BSRTBL for the selected base, obtain its coordinates and speed 4, and continue to the movement calculation.

```text
12|LABEL RFDST B A MOV, B PUSH, ( which base )
13|  BSRTBL H LXI, A SLAR, ' INDEXW CALL, D PUSH, H INX,
14|  H INX, M E MOV, H INX, M D MOV, 4 A MVI, ( max vel ) H POP,
15|-->
```

<a id="block-198"></a>

### Block 198

Finish runner arrival, scoring and motion-record output.

**Lines 0–7.** Call DSTCALC; on arrival set VATBS, clear halfway/automatic flags, update the base number, or raise SCRTIME and enter the off-field path when home is reached.

```text
 0|( BB op codes for playaction defined )
 1|  ' DSTCALC CALL, LDFLAG CPI, <>, IF, A ANA, 0<>, IF,
 2|  ( rchd dest ) VATBS VSTATUS X SETX, VHW VSTATUS X RESX,
 3|  VAUTO VRSTAT X RESX, B POP, B PUSH, ( base ) A XRA,
 4|  A VOFW X STX, VWBASE X A LDX, B CMP, =, IF, ( rchd nxt base)
 5|  A INR, 4 CPI, ( score ? ) =, IF, SCRTIME STA, PSW POP,
 6|  FLDCLR LDA, A INR, FLDCLR STA, VACT VSTATUS X SETX,
 7|  STND B LXI, OFFPALD JMP, THEN, A VWBASE X STX, THEN,
```

**Lines 8–12.** Keep the runner active when play permits; otherwise choose its left/right on-base image by X and zero movement.

```text
 8|  HOMERUN LDA, A ANA, RVACT JNZ, OFTBLGO LDA, A ANA, REND JNZ,
 9|  LBASE LDA, A ANA, REND JNZ, NORUN LDA, A ANA, REND JNZ,
10|LABEL RVACT VACT VSTATUS X SETX,
11|LABEL REND RONBS B LXI, VXH X A LDX, 19 CPI, <, IF, ( on 3rd )
12|  LONBS B LXI, THEN, 0 H LXI, 0 D LXI,
```

**Lines 13–15.** Clear VATBS while travelling, write RUNPA/RUNDY/RUNDX, restore saved stack/register state and return from assembly; continue loading.

```text
13|  ELSE, VATBS VSTATUS X RESX, ( left base )
14|  THEN, RUNPA SBCD, RUNDY SHLD, RUNDX SDED, THEN, PSW POP,
15|  RUNPA H LXI, VECTPC SHLD, B POP, RET, ASSEMBLE> -->
```

<a id="block-199"></a>

### Block 199

Add RAM-motion and wait-for-throw opcodes, then assemble the playaction dispatch table.

**Lines 0–4.** OFMOTION selects OFPA and deactivates a standing outfielder.

```text
 0|( BB playaction op code OFMOTION , WAITTHRW , BLMOTION , OPTBL )
 1| CODE OFMOTION ( set pc for ram pa table -tractor ball )
 2|   OFPA { 1+ } LDA, 4 CPI, ( stnd ? )
 3|  =, IF, VACT VSTATUS X RESX, THEN,
 4|    OFPA H LXI, VECTPC SHLD, RET,
```

**Lines 5–7.** WAITTHRW starts throw setup, then for most occupancy cases defers THROWANM with a WAITTHROW timer.

```text
 5|CODE WAITTHRW ( sets flag for 1stbaseman to wait throw )
 6|  ' THWANMSET CALL, BASESTATUS LDA, 5 CPI, RZ, A XRA,
 7|  THROWANM STA, 20 A MVI, WAITTHROW STA, RET,
```

**Lines 8–9.** BLMOTION selects the writable pitch-ball RAM action record TBLPA.

```text
 8|CODE BLMOTION ( set pc for ram pa table -tractor ball )
 9|       TBLPA H LXI, VECTPC SHLD, RET,
```

**Lines 10–14.** Emit OPTBL with handlers ordered to match the byte opcodes defined in 225, then continue.

```text
10|LABLE OPTBL
11|  ' ON1ST , ' ON2ND , ' ON3RD ,
12|  ' OFMOTION , ' BLMOTION , ' FLDDST , ' RUNDST , ' OFFFDST ,
13|  ' BLDST , ' THWANMSET , ' DEACTIVATE , ' WAITTHRW ,
14|-->
```


<a id="block-200"></a>

### Block 200

Decode playaction command bytes and load animation-group selections.

**Lines 0–8.** OPCODECHK treats bytes below $28 as commands, saves the next stream address in VECTPC, indexes OPTBL after adjusting the command index, dispatches via a synthetic native return and reloads VECTPC.

```text
 0|( BB playaction process    OPCODECHK , LOADANM )
 1|FORWARD OPRET
 2|CODE OPCODECHK ( called by plyactupdate ) <ASSEMBLE
 3|    M A MOV, 28 CPI, <, A DCR, A DCR, ( check if opcode )
 4|     IF, H INX, VECTPC SHLD, ( save pc )
 5|      OPTBL H LXI, ' INDEXW CALL, ( which opcode )
 6|  OPRET H LXI, H PUSH, ( save ret add. ) XCHG, ( H-opcd )
 7|  PCHL, LABEL OPRET ( ex opcode return here )
 8|  VECTPC LHLD, THEN, RET, ASSEMBLE>
```

**Lines 9–15.** LOADANM copies magic and animation-group fields from the stream into the IX vector record, selects PATTERNS and returns the advanced stream pointer; continue.

```text
 9|CODE LOADANM ( loads magic & anm HL-top of playact table )
10|             ( IX-proper vector add )
11|  M A MOV, A VMAGIC X STX, ( load magic )
12|  H INX, M A MOV, H PUSH, PATTERNS H LXI, ' INDEXW CALL,
13|  D VANMH X STX, E VANML X STX, ( load anm )
14|  H POP, ( pc ) H INX, RET, ( returns updated pc in HL )
15|-->
```

<a id="block-201"></a>

### Block 201

Select the perspective-specific animation list and load one playaction movement record.

**Lines 0–5.** ANMSEQLOAD indexes the current animation group by VPERS# and saves VANMSEQ.

```text
 0|( BB playaction process    ANMSEQLOAD , PACTLOAD )
 1|CODE ANMSEQLOAD ( finds proper anm seq by per=# )
 2|               ( IX-proper vector add )
 3|  VANMH X H LDX, VANML X L LDX, VPERS# X A LDX,
 4|    ' INDEXW CALL, ( anm seq look up )
 5|     D VANMSEQH X STX, E VANMSEQL X STX, RET,
```

**Lines 6–10.** PACTLOAD fetches VPLAYACTPC, services a command and either skips the existing movement fields for SAMEDLT or calls LOADANM.

```text
 6|CODE PACTLOAD ( loads vect from plyact )
 7|  VPLAYACTPCH X H LDX, VPLAYACTPCL X L LDX, ( plyact pc )
 8|    ' OPCODECHK CALL, ( check for opcodes )
 9|  SAMEDLT LDA, A ANA, 0<>, IF, H INX, H INX, A XRA, SAMEDLT STA,
10|   H INX, H INX, H INX, H INX, H INX, ELSE, ' LOADANM CALL,
```

**Lines 11–15.** Load update count and Y/X deltas, save the advanced playaction pointer and return; continue.

```text
11|  M A MOV, A VUPDATE# X STX, H INX, M A MOV, A VDYL X STX,
12|  H INX, M A MOV, A VDYH X STX, H INX, M A MOV,
13|  A VDXL X STX, H INX, M A MOV, A VDXH X STX, H INX,
14|  THEN, H VPLAYACTPCH X STX, L VPLAYACTPCL X STX,
15|RET, -->
```

<a id="block-202"></a>

### Block 202

Choose the current sprite within a perspective-specific animation pair.

```text
; RUP0M             RUP1M
; 16x14             16x12
; .....##.........  ....##..........
; .....##.........  ....##..........
; ....###.........  ...####.........
; ...#####........  ..######........
; ...#####........  ..####.#........
; ...####.#.......  ..####..........
; ...####.#.......  ...###..........
; ....###.........  ...###..........
; ....###.........  ...###..........
; ....###.........  ...####.........
; ....###.........  ...##...........
; ....####........  ...###..........
; ....##..........
; ....###.........
```


**Lines 0–3.** PATFETCH selects normal phase limits or a longer pitcher pre-hit sequence.

```text
 0|( BB playaction process    PATFETCH )
 1|CODE PATFETCH ( loads actual pattern IX-vector )
 2|  503 H LXI, HITYET LDA, A ANA, 0=, IF, VPT VSTATUS X BITX,
 3|  0<>, IF, 1812 H LXI, THEN, THEN,
```

**Lines 4–6.** Advance/wrap VANM# and map its phase to pair index zero or one.

```text
 4|  VANM# X A LDX, ( animation # )
 5| A INR, H CMP, >=, IF, A XRA, THEN, ( start again )
 6| A VANM# X STX, L CMP, <, IF, A XRA, ELSE, 1 A MVI, THEN,
```

**Lines 7–10.** Index VANMSEQ and store the selected VPAT pointer; continue.

```text
 7| ( which motion ) VANMSEQH X H LDX, VANMSEQL X L LDX,
 8| ' INDEXW CALL, ( look up proper pattern of sequence )
 9| D VPATH X STX, E VPATL X STX, RET,
10|-->
```


<a id="block-203"></a>

### Block 203

Run one playaction update for the vector selected by VECTIX.

**Lines 0–5.** Preserve BC/IX, select the vector and fetch a new action when VUPDATE# is zero.

```text
 0|( BB playaction process    PLAYACT )
 1|CODE PLAYACT ( called in intterupt does update prc )
 2|             ( assumes vector add in vectix )
 3| B PUSH, X PUSHX,
 4|  VECTIX LIXD, VUPDATE# X A LDX, A ANA, ( update # chk )
 5|    0=, IF, ' PACTLOAD CALL, ( load new play action )
```

**Lines 6–9.** Leave $FF update counts unchanged; otherwise decrement. Recompute the perspective sequence and pattern and restore registers.

```text
 6|    ELSE, FF CPI, =,
 7|     IF, ELSE, A DCR, A VUPDATE# X STX, ( dcr update# )
 8|   THEN, THEN, ' ANMSEQLOAD CALL, ' PATFETCH CALL, ( new pat.)
 9| X POPX, B POP, RET,
```

**Line 10.** Restore radix and finish the playaction processor source.

```text
10|BASE! ;S
```


<a id="block-207"></a>

### Block 207

Unpack compressed 3×5 characters and mirror the left field image to the right.

```text
; SMALL A  SMALL B
; 3x5      3x5
; ###      ###
; #.#      #.#
; ###      ##.
; #.#      #.#
; #.#      ###
```


**Lines 0–3.** Allocate a five-byte FONTWORK buffer. FONTUNPACK reads two packed bytes and starts a five-row unpack loop.

```text
 0|( Packed small font and field mirror ) HEX
 1|5 BARRAY FONTWORK FORWARD FNTLP
 2|SUBR FONTUNPACK B PUSH, M E MOV, H INX, M D MOV,
 3|0 FONTWORK H LXI, 5 B MVI, LABEL FNTLP E A MOV, 7 ANI,
```

**Lines 4–6.** Extract three bits per row, rotate them into the destination byte position, shift the source by three and return FONTWORK.

```text
 4|RRC, RRC, RRC, A M MOV, H INX,
 5|D SRLR, E RARR, D SRLR, E RARR, D SRLR, E RARR,
 6|FNTLP DJNZ, B POP, 0 FONTWORK H LXI, RET,
```

**Lines 7–11.** FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order.

```text
 7|CODE FMIRROR B PUSH, 0C A MVI, XPAND OUT,
 8|50 A MVI, MAGIC OUT, 0C050 D LXI, 4000 B LXI,
 9|4F H LXI, BEGIN, D PUSH, H PUSH, BEGIN, B LDAX,
10|A M MOV, H DCX, B INX, E DCR, 0=, END,
11|H POP, 50 D LXI, D DAD, D POP, D DCR, 0=, END,
```

**Line 12.** Restore BC, return to TERSE, select decimal and finish this helper load.

```text
12|B POP, NEXT DECIMAL ;S
```


<a id="block-208"></a>

### Block 208

Paint the reconstructed infield and mound directly while allowing palette interrupts to continue.

**Lines 0–4.** Declare row-loop labels, preserve BC/IX, point IX to INFP and initialize the destination row and span endpoint state. Each INFP byte feeds IFSPAN.

```text
 0|( Native RAM fill; palette interrupts remain enabled ) HEX
 1|FORWARD IFMAIN FORWARD IFMOUND
 2|CODE INFIELD B PUSH, X PUSHX,
 3|0 INFP X LXIX, 55E0 D LXI, 2873 B LXI, LABEL IFMAIN
 4|B PUSH, 0 X A LDX, X INXX, IFSPAN CALL, B POP,
```

**Lines 5–6.** Adjust the opposite endpoint per row and repeat the main-region count through DJNZ.

```text
 5|B A MOV, 20 CPI, 0=, IF, C DCR, ELSE,
 6|CY, IF, C DCR, C DCR, C DCR, THEN, THEN, IFMAIN DJNZ,
```

**Lines 7–10.** Move to the mound destination, paint twelve additional rows with endpoint $73, restore IX/BC and return to TERSE.

```text
 7|5EA0 D LXI, 0C B MVI, LABEL IFMOUND B PUSH,
 8|0 X A LDX, 73 C MVI, X INXX, IFSPAN CALL, B POP,
 9|IFMOUND DJNZ,
10|X POPX, B POP, NEXT
```

**Line 11.** Select decimal then hexadecimal, load screen $111 (decimal 273) and stop. This continues field-generation compilation after the infield helper chain.

```text
11|DECIMAL HEX 111 LOAD ;S
```


<a id="block-211"></a>

### Block 211

Assign each defender's default take-field destination.

**Lines 0–6.** Save radix, select hex and write shortstop, first-base, third-base and second-base X/Y destination cells.

```text
 0|( BB inning player initialization    SETFDST )
 1|BASE@ HEX
 2|: SETFDST ( set up fielder destination values )
 3| 1E00 VDSTX SS ! 4800 VDSTY SS !
 4| 3000 VDSTX 1ST ! 5800 VDSTY 1ST !
 5| 1400 VDSTX 3RD ! 5B00 VDSTY 3RD !
 6| 3200 VDSTX 2ND ! 4800 VDSTY 2ND !
```

**Lines 7–11.** Write pitcher and left/right/center outfielder destinations, close SETFDST and continue.

```text
 7| 2800 VDSTX PT ! 6100 VDSTY PT !
 8| 1400 VDSTX LF ! 2A00 VDSTY LF !
 9| 3C00 VDSTX RF ! 2A00 VDSTY RF !
10| 2800 VDSTX CF ! 1600 VDSTY CF ! ;
11|-->
```


<a id="block-212"></a>

### Block 212

Initialize vector-record coordinates, patterns and statuses for taking the field.

**Lines 0–4.** LSETTFCOOR loops through four runners, setting magic, positions, expansion, runner status and invisible pattern pointers.

```text
 0|( BB inning player initialization    LSETTFCOOR )
 1|: LSETTFCOOR ( set take field coor & status -active , xpand )
 2| VMAGIC R1 4 0 DO DUP DUP DUP DUP DUP DUP 28 SB! VXH + 25 SB!
 3|   VYH + A8 SB! VXPAND + 88 SB! VSTATUS + 1 SB!
 4|   VPATL + NOBOD S! VLENGTH + ( next magic ) LOOP
```

**Lines 5–8.** Initialize eight fielders at the side-dependent dugout X and common Y, using invisible patterns and $88 expansion.

```text
 5|  ( pt ) 8 0 DO DUP DUP DUP DUP DUP 28 SB! ( flders )
 6|    VXH + PLYR1UP B@ IF 1B ELSE 36 THEN SB!
 7|   VYH + 93 SB! VXPAND + 88 SB! VPATL + NOBOD S!
 8|    VLENGTH + ( nxt magic ) LOOP DROP
```

**Lines 9–13.** Initialize BL and role bits for pitcher/outfielders, reset the outfielder arrival count and assign RAM opcode bytes; continue the definition in 213.

```text
 9|  28 VMAGIC BL ! NOBOD VPAT BL ! 88 VXPAND BL B! 2 VSTATUS BL B!
10|  10 VSTATUS PT B! 20 VSTATUS RF B!
11|  20 VSTATUS LF B! 20 VSTATUS CF B! 3 OFTFCNT B!
12|  7 FLDOPCODE B! 6 TBLOPCODE B! 5 OFOPCODE B!
13|-->
```


<a id="block-213"></a>

### Block 213

Finish writable action initialization and assign return/take-field playaction pointers.

**Lines 0–2.** Finish LSETTFCOOR by assigning off-field/runner/ball opcodes and default pattern selectors.

```text
 0|( BB inning player initialization RETPA , SETTFPA )
 1|  9 OFFOPCODE B! 8 RUNOPCODE B! OPBLDST THWOPCODE B!
 2|  NBD RUNPA ! STND OFPA ! NBD TBLPA ! BAL THWPA ! ;
```

**Lines 3–5.** RETPA gives eight fielders TFPA, activates them and clears VGO.

```text
 3|: RETPA ( return to position pa )
 4|    VMAGIC PT 8 0 DO DUP DUP VPLAYACTPC + TFPA S! VSTATUS + DUP
 5|  B@ 80 OR F7 AND SB! VLENGTH + LOOP DROP ;
```

**Lines 6–13.** SETTFPA assigns delayed take-field sequences to pitcher/infielders, RUNBPA to all runners and TBLPA to BL; continue.

```text
 6|: SETTFPA ( take field pa )
 7|  TFPA2 VPLAYACTPC PT ! TFPA1 VPLAYACTPC 1ST !
 8|  TFPA1 VPLAYACTPC 2ND ! TFPA1 VPLAYACTPC 3RD !
 9|    TFPA1 VPLAYACTPC SS !
10|    RUNBPA VPLAYACTPC R1 ! RUNBPA VPLAYACTPC R2 !
11|    RUNBPA VPLAYACTPC R3 ! RUNBPA VPLAYACTPC R4 !
12|   TBLPA VPLAYACTPC BL ! ;
13|-->
```


<a id="block-214"></a>

### Block 214

Expose field-reset helpers and finish the initialization source chain.

**Lines 0–1.** Heading and maintenance comment for the field-state helpers.

```text
 0|( BB inning player initialization ZERORAM , SPEC0RAM , LSETTF )
 1|( Unused SPEC0RAM helper omitted; RAM setup is retained )
```

**Lines 2–4.** STFLD installs RETPA and TAKEFIELD. SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

```text
 2|: STFLD RETPA TAKEFIELD BONE ;
 3|: SETTF DI LSETTFCOOR STFLD SETTFPA EI ;
 4|BASE! ;S
```


<a id="block-215"></a>

### Block 215

Load the playaction implementation and inning/player initialization chains.

**Lines 0–3.** Load 190, load 211 and end this loader screen.

```text
 0|( BB playaction loader )
 1|190 LOAD ( plyaction process )
 2|211 LOAD ( inning player initialization )
 3|;S
```


<a id="block-216"></a>

### Block 216

Allocate the thirteen fixed-size vector records in an order used by address stepping.

**Lines 0–9.** Allocate BL, the three outfielders, four infielders and PT as VLENGTH-byte arrays.

```text
 0|( BB vectors )
 1|  VLENGTH BARRAY BL
 2|  VLENGTH BARRAY RF
 3|  VLENGTH BARRAY CF
 4|  VLENGTH BARRAY LF
 5|  VLENGTH BARRAY 3RD
 6|  VLENGTH BARRAY SS
 7|  VLENGTH BARRAY 2ND
 8|  VLENGTH BARRAY 1ST
 9|  VLENGTH BARRAY PT
```

**Lines 10–15.** Allocate R4 through R1, print the ending VPTR and stop. Physical allocation order explains code that moves between records with plus/minus VLENGTH.

```text
10|  VLENGTH BARRAY R4
11|  VLENGTH BARRAY R3
12|  VLENGTH BARRAY R2
13|  VLENGTH BARRAY R1
14|  ." VPTR END - " VPTR @ H.
15|;S
```

<a id="block-225"></a>

### Block 225

Define playaction byte emitters and action-record formats.

**Lines 0–3.** Select hex. REST, emits an invisible stationary action; ACT, emits the stacked pattern, update count and velocity cells in the table format consumed by PACTLOAD.

```text
 0|( BB playaction tables )
 1|HEX
 2|{ : REST, } NBD , B, 0 , 0 , { ; } ( rest time give update# )
 3|{ : ACT, } , B, , , { ; } ( given dx dy update# magic )
```

**Lines 4–10.** Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

```text
 4|{ : ON1ST, } 2 B, { ; }
 5|{ : ON2ND, } 3 B, { ; } { : ON3RD, } 4 B, { ; }
 6|0A C= OPBLDST 6 C= OPBLMOT { : WTHW, } 0D B, { ; }
 7|{ : OFMOT, } 5 B, { ; } { : BLMOT, } OPBLMOT B, { ; }
 8|{ : RUNDST, } 8 B, { ; } { : OFFDST, } 9 B, { ; }
 9|{ : BLDST, } OPBLDST B, { ; } { : FLDDST, } 7 B, { ; }
10|{ : THW, } 0B B, { ; } { : DEACT, } 0C B, { ; }
```

**Lines 11–14.** Define standing and right/left cover-base action macros that end by deactivating; continue.

```text
11|{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
12|{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
13|{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }
14|-->
```


<a id="block-226"></a>

### Block 226

Define standard runner, ball and take-field action streams, plus common defensive movements.

**Lines 0–6.** Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

```text
 0|( BB playaction tables -runners- )
 1|LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
 2|LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
 3|LABLE TFPA1 10 REST, FLDDST,
 4|LABLE TFPA2 20 REST, FLDDST,
 5|LABLE THWBLPA BLDST,
 6|LABLE PITCHBLPA BLMOT,
```

**Lines 7–13.** Emit first/second/third-base defensive routes and pitcher lateral motions using signed deltas, update counts and terminal cover/standing actions; continue.

```text
 7|LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
 8|LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
 9|LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
10|LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
11|LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
12|LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,
13|-->
```


<a id="block-227"></a>

### Block 227

Define pitching, throwing and left/third-base defensive action sequences.

**Lines 0–4.** Emit PITCHPA and right/left throw animations.

```text
 0|( BB playaction tables fieldlogic -infielders- )
 1|( Unused NOBODYPA action table omitted )
 2|LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
 3|LABLE RTHWPA 0 0 5 RTRW ACT, STP,
 4|LABLE LTHWPA 0 0 5 LTRW ACT, STP,
```

**Lines 5–10.** Emit foul-line retrieval and left-field-side third-base routes, including throw and base-cover commands.

```text
 5|LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
 6|LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
 7|  THW, STP,
 8|LABLE NOACTPA STP,
 9|LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
10|   ON3RD, RCB,
```

**Lines 11–15.** Emit third-base/shortstop fielding routes and continue the table chain.

```text
11|LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
12|LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
13|LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
14|LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
15|  -->
```

<a id="block-228"></a>

### Block 228

Define middle/right infield defensive routes and outfield-hit positioning adjustments.

**Lines 0–7.** Emit shortstop and second-base action sequences for each relevant hit sector.

```text
 0|( BB playaction tables fieldlogic -infielders- )
 1|LABLE HLSS -80 0 10 LFLD ACT, STP,
 2|LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
 3|LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
 4|LABLE HMSS 100 -40 0C RRUN ACT, STP,
 5|LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
 6|LABLE F2NDL2ND 80 0 0D RFLD ACT, THW, STP,
 7|LABLE HR2ND 80 0 12 RFLD ACT, STP,
```

**Lines 8–12.** Emit first-base/pitcher routes, including WTHW, to wait for a throw before resuming.

```text
 8|LABLE HR1ST -80 -40 12 LFLD ACT, 200 90 13 RRUN ACT, ON1ST, LCB,
 9| LABLE F1STR1ST -40 30 0A LFLD ACT, WTHW, STP,
10|LABLE F1STL1ST 140 -40 0B RFLD ACT, WTHW, STP,
11|LABLE HRL1ST 100 0 18 RFLD ACT, STP,
12|LABLE F1STPT 480 0 15 RRUN ACT, ON1ST, LCB,
```

**Lines 13–15.** Emit the shortstop/second-base outfield-hit offsets and continue.

```text
13|LABLE HLOUTSSPA -20 -80 10 LRUN ACT, STP,
14|LABLE HROUT2NDPA 20 80 10 RRUN ACT, STP,
15|-->
```

<a id="block-229"></a>

### Block 229

Define the computer's pitch motion streams.

**Lines 0–3.** BACT, emits ball-pattern actions; LK, emits a stationary ball/deactivate sequence.

```text
 0|( BB play action tables single player pitches )
 1|HEX
 2|{ : BACT, } BAL ACT, { ; }
 3|{ : LK, } 0 0 0 BACT, DEACT, { ; }
```

**Lines 4–8.** Emit fast/slow/accelerating/decelerating and curve-out pitch segments as deltas plus duration/update counts.

```text
 4|LABLE PFB 0 300 50 BACT,
 5|LABLE PSB 0 100 80 BACT,
 6|LABLE PSU 0 100 35 BACT, 0 300 50 BACT,
 7|LABLE PSD 0 300 12 BACT, 0 100 50 BACT,
 8|LABLE PCO 0 300 12 BACT, 100 200 9 BACT, 0 200 50 BACT,
```

**Lines 9–12.** Emit the inside-curve variants PICI/PICO, return to decimal and finish loading.

```text
 9|( Unused PCI pitch table omitted; selected pitches retained )
10|LABLE PICI -10 200 1A BACT, -100 200 9 BACT, 0 200 50 BACT,
11|LABLE PICO -20 200 1A BACT, 60 200 9 BACT, 0 200 50 BACT,
12|DECIMAL ;S
```


<a id="block-230"></a>

### Block 230

Begin destination-to-velocity calculation for a vector addressed by IX.

**Lines 0–5.** Save radix, declare labels and document the register interface: destination X in HL, Y in DE, speed in A; result Y delta in HL, X delta in DE and pattern/magic in BC.

```text
 0|( BB destination delta calculation    DSTCALC )
 1|  BASE@ HEX
 2|FORWARD DSTSET FORWARD BTLP1 FORWARD BTLP2 FORWARD RSRDST
 3|CODE DSTCALC ( calc deltas to destination )
 4| ( in HL-dstx DE-dsty A-max vel )
 5| ( out HL-dy DE-dx BC-magic & pattern # ) <ASSEMBLE
```

**Lines 6–10.** Subtract current coordinates, save signs and form absolute differences. X distance is scaled for the differing horizontal coordinate resolution.

```text
 6|   EXAF, VXH X B LDX, VXL X C LDX, B DSBC, PSW PUSH,
 7| ' COMPHL CC, L SLAR, H RALR, L SLAR,
 8| H RALR, XCHG, ( diffx-DE dsty-HL ) VYH X B LDX, VYL X C LDX,
 9| B DSBC, PSW PUSH, ( diffy-HL ) ' COMPHL CC,
10| EXAF, PSW PUSH, EXAF, PSW POP, ( max vel for cmp value )
```

**Lines 11–15.** Check distance against the speed threshold. Exact/near arrival returns standing pattern, zero deltas and RDST=$FF while clearing active/moving bits; otherwise continue into normalization.

```text
11| A INR, A INR, H CMP, RSRDST JC, D CMP, RSRDST JC,
12| A XRA, H CMP, DSTSET JNZ, D CMP, DSTSET JNZ, ( exact point )
13| STND B LXI, A H MOV, A L MOV, H D MOV, L E MOV,
14| PSW POP, PSW POP, 0FF A MVI, RDST STA,
15| VACT VSTATUS X RESX, VGO VSTATUS X RESX, RET, -->
```

<a id="block-231"></a>

### Block 231

Normalize movement toward the destination, restore signs and choose a running image.

**Lines 0–2.** If VGO already indicates an established long move, return the LDFLAG/SAMEDLT indication to preserve existing deltas.

```text
 0|( BB destination delta calculation )
 1|LABEL RSRDST VGO VSTATUS X BITX, 0<>, IF, PSW POP, PSW POP,
 2|  ( only calc once ) LDFLAG A MVI, SAMEDLT STA,
```

**Lines 3–9.** Select the dominant component, repeatedly halve it until within the maximum-speed scale, halve the minor component equally and restore axis ordering.

```text
 3|    ELSE, H A MOV, D CMP, PSW PUSH,
 4|  <, IF, XCHG, ELSE, =, IF, L A MOV, E CMP, <, IF, XCHG,
 5|  PSW POP, STC, PSW PUSH, THEN, THEN,
 6|  THEN, ( HL > diff ) EXAF, ( max delt ) 0 B MVI,
 7|LABEL BTLP1 B INR, H SRLR, L RARR, ( /2 ) H CMP, BTLP1 JC,
 8|LABEL BTLP2 D SRLR, E RARR, BTLP2 DJNZ, ( halve DE )
 9| PSW POP, ( xdl>yd ) <, IF, XCHG, THEN,
```

**Lines 10–15.** Restore Y/X signs with COMPHL/COMPDE, choose LRUN/RRUN, clear RDST, set VGO, return and close assembly; continue.

```text
10|LABEL DSTSET PSW POP, ( +- dy )
11| CY, IF, ' COMPHL CALL, THEN, PSW POP, PSW PUSH, ( +- dx )
12| CY, IF, ' COMPDE CALL, THEN, PSW POP, ( dx sign )
13| CY, IF, LRUN B LXI, ELSE, RRUN B LXI, THEN,
14| A XRA, RDST STA, VGO VSTATUS X SETX, THEN, RET, ASSEMBLE>
15|-->
```

<a id="block-232"></a>

### Block 232

Load destination coordinates from the IX vector record.

**Lines 0–4.** DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.

```text
 0|( BB set destination registers from vector )
 1|CODE DSTLD
 2|  VDSTXH X H LDX, VDSTXL X L LDX, VDSTYH X D LDX,
 3|  VDSTYL X E LDX,
 4|RET,
```

**Line 5.** Restore radix and finish the destination helper chain.

```text
 5|BASE! ;S
```


<a id="block-233"></a>

### Block 233

Provide signed-negation, countdown and byte-state helpers.

**Lines 0–4.** Save radix and select hex. COMPHL forms two's complement of HL; COMPDE applies the same operation to DE while preserving HL.

```text
 0|( BB short subroutines COMPHL COMPDE TIMEDCR BONE BZERO WUPGO )
 1|BASE@ HEX
 2|CODE COMPHL ( compliments HL )
 3|  H A MOV, CMA, A H MOV, L A MOV, CMA, A L MOV, H INX, RET,
 4|CODE COMPDE H PUSH, XCHG, ' COMPHL CALL, XCHG, H POP, RET,
```

**Lines 6–9.** TIMEDCR leaves zero timers unchanged; otherwise decrements the byte and returns A=1 only on the transition to zero.

```text
 6|SUBR TIMEDCR ( HL-timer add if goes to zero return 1 else 0 )
 7|  M A MOV, A ANA, RZ, ( allready zero returns false change )
 8|  A DCR, A M MOV, A ANA, 0=, IF, A INR, ( true change )
 9|  ELSE, A XRA, THEN, RET,
```

**Lines 11–15.** BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue.

```text
11|: BONE ( cange byte memory cell to 1 ) 1 SB! ;
12|: BZERO ( change byte memory cell to 0 ) 0 SB! ;
14|: WUPGO WHOSUP @ DUP VSTATUS + 81 SB! VRSTAT + 3 SB! ;
15|-->
```


<a id="block-234"></a>

### Block 234

Provide target execution, signed division by four and word-table indexing.

**Lines 0–1.** EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.

```text
 0|( BB short subroutines DIVHLBY4 INDEXW EX )
 1|CODE EX C9 B, NEXT
```

**Lines 2–6.** DIVHLBY4 records the sign, negates to absolute magnitude, shifts right twice and reapplies the sign; this truncates the magnitude before sign restoration.

```text
 2|CODE DIVHLBY4 ( divide HL by 4 )
 3|           7 H BIT, PSW PUSH, ( dir )
 4|    ' COMPHL CNZ, ( abs dy )
 5|       H SRLR, L RARR, H SRLR, L RARR, ( /4 )
 6|     PSW POP, ' COMPHL CNZ, RET,
```

**Lines 7–12.** INDEXW preserves A/flags, calculates HL+2*A, loads the selected cell in DE, restores HL to the entry start and returns; continue.

```text
 7|CODE INDEXW ( call routine A- disp HL- table add )
 8|            ( for indexing into table only )
 9|  PSW PUSH, A SLAR, ( 2* A )
10|   L ADD, A L MOV, 0 A MVI, H ADC, A H MOV,
11|   M E MOV, H INX, M D MOV, H DCX, PSW POP, RET,
12|-->
```


<a id="block-235"></a>

### Block 235

Start automatic runners, update all runner-control bytes and end a walk.

**Lines 0–6.** AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

```text
 0|( BB short subroutines AUTOR1 ect. , LVRSTAT , WALKOVER )
 1|SUBR AUTOR1 3 A MVI, VRSTAT R1 STA, 81 A MVI, VSTATUS R1 STA,
 2|  RET, ( sets vauto , vforw , vact , vrun )
 3|SUBR AUTOR2 3 A MVI, VRSTAT R2 STA, 81 A MVI, VSTATUS R2 STA,
 4|  RET,
 5|SUBR AUTOR3 3 A MVI, VRSTAT R3 STA, 81 A MVI, VSTATUS R3 STA,
 6|  RET,
```

**Line 7.** Maintenance comment concerning runner 4.

```text
 7|( Unused AUTOR4 helper omitted; runner 4 state retained )
```

**Lines 9–14.** LVRSTAT writes A to all four VRSTAT bytes. WALKOVER requests CAUGHT and THROWAROUND when the walk timer completes; continue.

```text
 9|SUBR LVRSTAT ( load vstat for all runners in- A value )
10|  VRSTAT R1 STA, VRSTAT R2 STA, VRSTAT R3 STA, VRSTAT R4 STA,
11|  RET,
12|SUBR WALKOVER ( walked runner at base )
13|  1 A MVI, CAUGHT STA, THROWAROUND STA, RET,
14|-->
```


<a id="block-236"></a>

### Block 236

Provide signed scaling, outfield stop and busy-wait helpers.

**Lines 0–3.** MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign.

```text
 0|( BB short subroutines MULTHLBY4 , KILLOF , WAIT )
 1|CODE MULTHLBY4
 2|  7 H BIT, PSW PUSH, ' COMPHL CNZ, L SLAR, H RALR,
 3|  L SLAR, H RALR, PSW POP, ' COMPHL CNZ, RET,
```

**Lines 4–6.** KILLOF zeroes OF deltas, selects standing animation and clears OFTBLGO.

```text
 4|CODE KILLOF ( stop outfield tractor ball control )
 5|  0 H LXI, OFDX SHLD, OFDY SHLD, STND H LXI, OFPA SHLD,
 6|  A XRA, OFTBLGO STA, RET,
```

**Lines 7–9.** WAIT runs nested accumulator countdowns and returns natively.

```text
 7|CODE WAIT ( given A wait period stop every thing )
 8|  BEGIN, PSW PUSH, 0FF A MVI, BEGIN, A DCR, 0=, END,
 9|    PSW POP, A DCR, 0=, END, RET,
```

**Lines 10–15.** TWAIT performs a high-level delay with interrupts enabled, shortening it under the credit/pricing conditions shown, and finishes with interrupts disabled; continue.

```text
10|: TWAIT ( terse wait period )
11|  EI BEGIN FF 0 DO LOOP CREDITS B@ DUP IF 1 = IF CNSW12 B@ IF
12|  ELSE DROP 1 THEN ELSE DROP 1 THEN ELSE DROP THEN
13|  50 0 DO LOOP 1 - DUP 0= END
14|  DROP DI ;
15|-->
```

<a id="block-237"></a>

### Block 237

Activate groups of defenders and display team labels.

**Lines 0–4.** SETACT takes the first status address in HL and count in A, setting VACT at VLENGTH-byte strides.

```text
 0|( BB short subroutines INFLDACT OUTFLDACT ALLFLDACT CMTALL )
 1|CODE SETACT ( sets avtive bit in status )
 2|  ( in HL-status 1st guy A- # of guys )
 3|  VLENGTH D LXI,
 4|  BEGIN, VACT M SET, D DAD, A DCR, 0=, END, RET,
```

**Lines 5–10.** INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE.

```text
 5|CODE INFLDACT ( set infielders active )
 6|  VSTATUS PT H LXI, 5 A MVI, ' SETACT CALL, RET,
 7|CODE OUTFLDACT ( sets outfielders active )
 8|  VSTATUS LF H LXI, 3 A MVI, ' SETACT CALL, RET,
 9|CODE ALLFLDACT ( sets all fielders active )
10|  ' INFLDACT CALL, ' OUTFLDACT CALL, NEXT
```

**Lines 11–13.** HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; continue.

```text
11|: HOM 4200 7A00 828 48 CPOST 4400 7F00 8828 A" OME" SPOST ;
12|: VIS 700 7A00 828 56 CPOST 900 7F00 8828 A" ISITOR" SPOST ;
13|-->
```


<a id="block-238"></a>

### Block 238

Erase the ball, service pitch timeout and show/delay the change-sides state.

**Lines 0–3.** BLERASE preserves IX, selects BL, erases it, clears active status and replaces its pattern with NOBOD.

```text
 0|( BB short subroutines    BLERASE , WUPWRT , CHGS , DWAIT )
 1|SUBR BLERASE ( erases ball )
 2|  X PUSHX, VMAGIC BL X LXIX, ' VERASE CALL, VACT VSTATUS X RESX,
 3|  X POPX, ( stop ball ) NOBOD H LXI, VPAT BL SHLD, RET,
```

**Lines 4–7.** PTAUTOTM decrements TIMEOUT only when field clearing is idle; WUPWRT calls it and draws the currently batting team label.

```text
 4|CODE PTAUTOTM ( pitch auto timer )
 5|  TIMEOUT H LXI, FLDCLR LDA, A ANA, TIMEDCR CZ, NEXT
 6|: WUPWRT ( write whos up for flash )
 7|  PTAUTOTM PLYR1UP B@ IF HOM ELSE VIS THEN ;
```

**Lines 8–10.** CHGS posts CHANGE SIDES; DWAIT runs nested loops with interrupts enabled and disables them on return; continue.

```text
 8|: CHGS 1C00 2000 828 A" CHANGE SIDES" SPOST ;
 9|: DWAIT EI 0 DO FF 0 DO LOOP LOOP DI ;
10|-->
```


<a id="block-239"></a>

### Block 239

Manage flashing text by storing a callback and invoking it for XOR draw/erase phases.

**Lines 0–3.** FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line.

```text
 0|( BB short subroutines FLSHTON FLSHTOFF FLSHWUP DOCHGS )
 1|: FLSHTON FLSHWHO ! FLSHON BONE FLSHTIME BONE ;
 2|: FLSHME FLSHWHO @ DUP 0C000 AND 0= OVER 0 <> AND IF EX
 3|ELSE DROP THEN ; SUBR FLSHWUP ( handle flash callback )
```

**Lines 4–9.** FLSHWUP preserves IX/IY, toggles FLSHCNT when enabled, selects long/short phase timers and calls FLSHME through DOVERB; when disabled it erases any remaining phase.

```text
 4|  X PUSHX, Y PUSHX,
 5|  FLSHCNT H LXI, FLSHON LDA, A ANA, M A MOV, 0<>, IF,
 6|  A ANA, 0=, IF, 1 M MVI, 28 A MVI, ELSE, 0 M MVI, 8 A MVI,
 7|  THEN, FLSHTIME STA, DOVERB FLSHME
 8|  ELSE, A ANA, 0<>, IF, 0 M MVI, DOVERB FLSHME THEN,
 9|  THEN, Y POPX, X POPX, RET,
```

**Lines 10–13.** FLSHOFF disables flashing and services cleanup under DI. DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; continue.

```text
10|CODE FLSHOFF B PUSH, A XRA, FLSHON STA, DI, FLSHWUP CALL,
11|  B POP, NEXT
12|: DOCHGS ' CHGS FLSHTON 28 DWAIT FLSHOFF GAMEOVER BZERO ;
13|-->
```


<a id="block-240"></a>

### Block 240

Restore the normal team-indicator flashing after temporary ownership of the flash callback.

**Lines 0–3.** WUPTON installs WUPWRT. CHKFLSHSTAY checks whether flashing was reserved and stops that special use while retaining its phase state.

```text
 0|( BB short subroutines    CHKFLSHSTAY )
 1|: WUPTON ' WUPWRT FLSHTON ;
 2|: CHKFLSHSTAY ( when isccp turn off check for wupwrt )
 3|  FLSHSTAY B@ IF FLSHSTAY BZERO FLSHCNT B@ FLSHOFF IF
```

**Lines 4–8.** Use DOWUP/WUPFLSH and the old phase to redraw/restart the normal callback as needed, clear special flags, restore radix and stop loading.

```text
 4|  DOWUP B@ IF WUPWRT WUPTON ELSE WUPFLSH B@ IF WUPWRT WUPTON
 5|  THEN THEN ELSE ( not flshcnt ) DOWUP B@ IF WUPTON ELSE
 6|  WUPFLSH B@ IF WUPTON THEN THEN THEN WUPFLSH BZERO
 7|  DOWUP BZERO THEN ;
 8|BASE! ;S
```


<a id="block-241"></a>

### Block 241

Define magic-register bit positions and convert fixed-point screen coordinates to a magic-write address.

**Lines 0–3.** Assign rotate/expand/OR/XOR/flop/flip bit positions.

```text
 0|( VGS write routines    relabs , magic equates )
 1|( MAGIC REGISTER BITS )
 2|2 C= MRROT 3 C= MREXP 4 C= MROR 5 C= MRXOR
 3|6 C= MRFLOP 7 C= MRFLIP
```

**Lines 4–10.** relabs converts Y's integer byte to an 80-byte scanline offset while preserving the expansion/magic settings.

```text
 4|SUBR relabs ( relative X Y to magic address conversion )
 5|  ( in- BC=exp/mag DE=x HL=y )
 6|  ( out- BC=exp/mag+shift HL=scradr )
 7|  H A MOV, 0 H MVI, A L MOV,
 8|  H DAD, H DAD, H DAD,
 9|  H DAD, D PUSH, L E MOV, H D MOV, H DAD, H DAD, ( *64 )
10|  D DAD, ( *80 ) XCHG, H POP, ( x )
```

**Lines 11–15.** Add the X byte coordinate, derive the two-bit pixel shift, adjust it for horizontal flop, combine it into C and return; continue.

```text
11|  L A MOV, ( SAVE BIT CNT ) H L MOV, 0 H MVI, D DAD, ( x+y )
12|  RLC, RLC, HEX 3 ANI,
13|  MRFLOP C BIT, 0<>, IF, NEG, 0=, IF, H DCX, THEN, THEN,
14|  3 ANI, A E MOV, C A MOV, FC ANI, E ORA, A C MOV, RET,
15|-->
```

<a id="block-242"></a>

### Block 242

Apply the relative hotspot offsets stored at the start of a sprite record.

**Lines 0–5.** reloff documents its BC/DE/HL/IY interface, loads the X offset and scales it with two arithmetic/right-through-carry shifts.

```text
 0|( VGS write routines    reloff )
 1|SUBR reloff ( compute relative offset of x , y of pattern )
 2|  ( in- BC=exp/mag DE=x HL=Y IY=relpatadr )
 3|  ( out- BC=exp/mag DE=xoff HL=yoff IY=patadr )
 4|  H PUSH, XCHG, 0 Y D LDX, 0 E MVI, ( X offset )
 5|  D SRAR, E RARR, D SRAR, E RARR,
```

**Line 6.** Commented expansion adjustment for the X offset.

```text
 6|  ( MREXP C BIT, 0<>, IF, E SLAR, D RALR, ) ( *2 ) ( THEN, )
```

**Lines 7–11.** Add/subtract X and Y offsets according to flop/flip flags, advance IY past the two offset bytes to the size header and return; continue.

```text
 7|  MRFLOP C BIT, 0<>, IF, D DAD, ELSE, A ORA, D DSBC, THEN,
 8|  XTHL, ( push X+off, HL<-Y ) 1 Y D LDX, 0 E MVI, ( Y offset )
 9|  MRFLIP C BIT, 0<>, IF, D DAD, ELSE, A ORA, D DSBC, THEN,
10|  D POP, Y INXX, Y INXX, ( offset pattern ) RET,
11|-->
```


<a id="block-243"></a>

### Block 243

Write a rectangle of sprite bytes through the magic-write area using software loops.

**Lines 0–4.** Document the pointer/size interface and absence of a shifter flush, then output XPAND and MAGIC settings.

```text
 0|( VGS write routines    write )
 1|SUBR write ( software write with x y size )
 2| ( IY= patadr BC= ex/magishft DE= Y/X size HL= screenadc )
 3|( does not do shifter flush patterns must flush themselves )
 4|  B PUSH, B A MOV, XPAND OUT, C A MOV, MAGIC OUT,
```

**Lines 5–9.** For horizontal flop, copy source bytes while stepping destination addresses backward; restore the row start and add $50 for each new row.

```text
 5|  Y PUSHX, B POP, ( patadr ) MRFLOP A BIT, 0<>, IF,
 6|    BEGIN, ( y ) D PUSH, H PUSH,
 7|      BEGIN, ( x ) B LDAX, A M MOV, H DCX, A M MOV, H DCX,
 8|      B INX, E DCR, 0=, END,
 9|    H POP, 50 D LXI, D DAD, D POP, D DCR, 0=, END,
```

**Lines 10–15.** For ordinary orientation, step forward instead. Each source byte is written to two successive destination positions as shown; restore BC and return, then continue loading.

```text
10|  ELSE, ( no flop )
11|    BEGIN, ( y ) D PUSH, H PUSH,
12|      BEGIN, ( x ) B LDAX, A M MOV, H INX, A M MOV, H INX,
13|      B INX, E DCR, 0=, END,
14|    H POP, 50 D LXI, D DAD, D POP, D DCR, 0=, END,
15|  THEN, B POP, ( magic ) RET, -->
```

<a id="block-244"></a>

### Block 244

Read dimensions from a sprite header and expose the explicit-size WRITE target word.

**Lines 0–4.** writep reads X/Y byte counts through IY and jumps to the shared write loop.

```text
 0|( VGS write routines    writep , WRITE )
 1|SUBR writep ( software write with pattern size on pattern )
 2|  ( IY=patadr BC=ex/mag+shf HL=scradr --- )
 3|  0 Y E LDX, ( X size ) Y INXX,
 4|  0 Y D LDX, ( Y size ) Y INXX, write JMP,
```

**Lines 5–8.** Document WRITE's stack arguments. The WRTSYS comment describes historical options; this body calls software write directly.

```text
 5|CODE WRITE ( write with X Y sizes ; pattern with no header )
 6|  ( in- x , y , patadr , y/x size ex/mag )
 7|        ( WRTSYS set for pattern board res for software write )
 8|  ( out- pattern on screen )
```

**Lines 9–13.** Preserve the target interpreter's register state, pull options/sizes/pointer/coordinates from the stack, call relabs and write, restore state and NEXT; continue.

```text
 9|  Y PUSHX, H POP, EXX, B POP, ( ex/mag ) H POP, ( sizes )
10|  Y POPX, ( patadr ) D POP, ( Y ) XTHL, ( H<-X S<-sizes )
11|  XCHG, ( X<-Y ) relabs CALL, D POP, ( sizes )
12|  write CALL, EXX, H PUSH, Y POPX, NEXT
13|-->
```


<a id="block-245"></a>

### Block 245

Expose relative-pattern rendering as WRITR.

**Lines 0–4.** Document the stack interface and output. The heading says WRITER, but the actual defined name is WRITR.

```text
 0|( VGS write routines    WRITER )
 1|CODE WRITR ( write with a relative pattern )
 2|  ( in- x , y , relpatadr , ex/mag )
 3|        ( WRTSYS set for pattern board res for software write )
 4|  ( out- pattern on screen )
```

**Lines 5–8.** Extract coordinates/options/pointer, apply reloff and relabs, render via writep and restore target register/stack state before NEXT; continue.

```text
 5|  Y PUSHX, H POP, EXX, B POP, Y POPX, H POP, D POP,
 6|  reloff CALL, relabs CALL,
 7|  writep CALL, EXX, H PUSH, Y POPX, NEXT
 8|-->
```


<a id="block-246"></a>

### Block 246

Begin character posting and choose the large or packed-small font index.

```text
; LARGE A   SMALL A  LARGE 0   SMALL 0
; 8x10      3x5      8x10      3x5
; ...##...  ###      ..####..  .#.
; ..####..  #.#      .######.  #.#
; .######.  ###      .##..##.  #.#
; .##..##.  #.#      .##..##.  #.#
; .##..##.  #.#      .##..##.  .#.
; .##..##.           .##..##.
; .######.           .##..##.
; .######.           .##..##.
; .##..##.           .######.
; .##..##.           ..####..
```


**Lines 0–6.** Define SMFONT and ZEROSP option-bit positions and document cpost's retained X/Y/options return values.

```text
 0|( VGS character routines    cpost )
 1|  ( option bits , top 4 bits of exp )
 2|7 C= SMFONT ( small font if set large font if res )
 3|6 C= ZEROSP ( zero suppress if set )
 4|CODE cpost ( post an ascii-character on the screen ; see opt. )
 5|  ( in= x , y , opt+exp/mag , ascii-char )
 6|  ( out- newx , y , opt+ex/mag ; character on screen )
```

**Lines 7–8.** Extract arguments, emit $ED $57 (LD A,I) to capture interrupt state, preserve it in alternate AF and disable interrupts around rendering.

```text
 7|Y PUSHX, H POP, EXX, H POP,
 8|B POP, 0ED B, 57 B, EXAF, DI, L A MOV,
```

**Lines 9–14.** Select large-font indexing with separate letter/digit/space offsets or small-font indexing from ASCII space; continue in 247.

```text
 9|SMFONT B BIT, PSW PUSH, 0=, IF,
10|  41 CPI, >=, IF, 36 SUI, ELSE, 30 CPI, >=, IF, 2F SUI,
11|  ELSE, 20 SUI, THEN, THEN,
12|  ELSE, ( small font ) 20 SUI,
13|  THEN,
14|-->
```


<a id="block-247"></a>

### Block 247

Finish glyph lookup, draw the character and advance the text X coordinate.

```text
; LARGE A   SMALL A
; 8x10      3x5
; ...##...  ###
; ..####..  #.#
; .######.  ###
; .##..##.  #.#
; .##..##.  #.#
; .##..##.
; .######.
; .######.
; .##..##.
; .##..##.
```


**Lines 0–5.** Compute the glyph index: packed smallfont uses two-byte records and FONTUNPACK; large characters uses ten-byte records.

```text
 0|( VGS character routines    cpost con't. )
 1|  A L MOV, 0 H MVI,
 2|  L SLAR, H RALR, ( *2 ) H D MOV, L E MOV,
 3|PSW POP, 0<>, IF, 0 smallfont D LXI, D DAD,
 4|FONTUNPACK CALL, ELSE, L SLAR, H RALR,
 5|L SLAR, H RALR, D DAD, 0 characters D LXI, D DAD, THEN,
```

**Lines 7–11.** Prepare the pattern, restore coordinates/options and call write for ten large rows or five small rows while retaining character spacing.

```text
 7|H PUSH, Y POPX, ( patadr )
 8|H POP, D POP, D PUSH, H PUSH, B PUSH,
 9|relabs CALL, 0A01 D LXI, SMFONT B BIT, 0<>, IF, 5 D MVI,
10|1 A MVI, ELSE, 2 A MVI, THEN, PSW PUSH,
11|write CALL, PSW POP, B POP, H POP, XTHL,
```

**Lines 12–15.** Advance X by the selected spacing, restore the interpreter state and re-enable interrupts only if the earlier LD A,I parity flag recorded them enabled; continue loading.

```text
12|A D MOV, 0 L MVI, D DAD,
13|XTHL, H PUSH, B PUSH, EXX, H PUSH, Y POPX,
14|EXAF, PE, IF, EI, THEN, NEXT
15|-->
```


<a id="block-248"></a>

### Block 248

Define the consuming character wrapper and a string poster that retains the next drawing position.

**Lines 0–5.** 3DROP discards three cells. CPOST calls lower-case cpost, then discards its returned X/Y/options.

```text
 0|( VGS character routines    CPOST , SPOST , 3DROP )
 1|: 3DROP DROP DROP DROP ;
 2|: CPOST ( post an ascii-character on the screen ; see options )
 3|  ( in- x , y , opt+ex/mag , ascii-char )
 4|  ( out- character on screen )
 5|  cpost 3DROP ;
```

**Lines 7–13.** PPOST obtains the counted string length/address using COUNT and calls cpost for every byte, leaving updated X/Y/options for the next string; continue.

```text
 7|: PPOST ( post an ascii-string on the screen leaving x y and
 8|          options for next string ; see options )
 9|  ( in= x , y , opt+ex/mag , string )
10|  ( i.e. 0 0 8828 28 A" STRING" PPOST )
11|  ( out- character on screen ; x , y , opt+ex/mag )
12|  COUNT OVER + SWAP DO I B@ cpost LOOP ;
13|-->
```


<a id="block-249"></a>

### Block 249

Post complete strings and packed-BCD numbers, with optional leading-zero suppression.

**Lines 0–5.** SPOST calls PPOST then drops the three retained drawing arguments.

```text
 0|( VGS character routines    NPOST )
 1|: SPOST ( post an ascii-string on the screen ; see options )
 2|  ( in= x , y , opt+ex/mag , string )
 3|  ( i.e. 0 0 8828 A" STRING" SPOST )
 4|  ( out- character on screen )
 5|  PPOST 3DROP ;
```

**Lines 7–8.** dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.

```text
 7|: dpost 0F AND OVER 4000 AND 4000 XOR OVER OR IF 30 +
 8|  SWAP BFFF AND SWAP ELSE DROP 20 THEN cpost ;
```

**Lines 10–15.** NPOST iterates the requested byte count, posts each high then low nibble using SWAN and dpost, drops remaining drawing arguments and continues.

```text
10|: NPOST ( post a bcd number on the screen ; see options )
11|  ( in= x , y , opt+ex/mag , variable adr , # of bytes )
12|  ( out- character on screen )
13|  OVER + SWAP DO I B@ SWAN dpost I B@ dpost LOOP
14|  3DROP ;
15|-->
```


<a id="block-250"></a>

### Block 250

Add two packed-BCD cell values using decimal-adjusted byte arithmetic.

**Lines 0–5.** BCD+ pops two cells, adds their low bytes with DAA, adds high bytes with carry and DAA, and pushes the resulting packed-BCD cell. 

```text
 0|( VGS character routines    BCD+ , BCD+! )
 1|CODE BCD+ ( binary to decimal arithmatic )
 2|  ( in- integer 1 , integer 2 )
 3|  ( out- bcd sum of integer 1 and 2 )
 4|  H POP, D POP, E A MOV, L ADD, DAA, A L MOV,
 5|  D A MOV, H ADC, DAA, A H MOV, H PUSH, NEXT
```

**Line 7.** Maintenance comment for the BCD helpers.

```text
 7|( Unused BCD+! helper omitted; BCD+ is retained )
```

**Line 12.** Select decimal, load 251 and stop this screen.

```text
12|DECIMAL 251 LOAD ;S
```


<a id="block-251"></a>

### Block 251

Render the sprite represented by an IX vector record and save enough state for erasure.

```text
; BALLPAT           RUP0M
; 16x2              16x14
; ##..............  .....##.........
; ##..............  .....##.........
;                   ....###.........
;                   ...#####........
;                   ...#####........
;                   ...####.#.......
;                   ...####.#.......
;                   ....###.........
;                   ....###.........
;                   ....###.........
;                   ....###.........
;                   ....####........
;                   ....##..........
;                   ....###.........
```


**Lines 0–6.** VWRITE reads expansion/magic, X/Y and VPAT, converts relative offsets and calculates the magic-write destination.

```text
 0|( BB vector write    VWRITE )
 1|CODE VWRITE ( does reloff relabs patbrd from vector IX )
 2|  VXPAND X B LDX, VMAGIC X C LDX, VXH X D LDX, VXL X E LDX,
 3|  VPATH X H LDX, VPATL X L LDX, H PUSH, Y POPX,
 4|  VYH X H LDX, VYL X L LDX,
 5| reloff CALL, ( calculates relative offset )
 6| relabs CALL, ( calculates magic add.)
```

**Lines 7–11.** Save VSCRADR, call writep and retain the computed shift in VMAGIC before returning; continue.

```text
 7|  H VSCRADRH X STX, L VSCRADRL X STX, ( set scradr for erase )
 8| writep CALL, ( write it )
 9|  C VMAGIC X STX, ( save shift for erase )
10|  RET,
11|-->
```


<a id="block-252"></a>

### Block 252

Erase a vector sprite by replaying its pattern using the saved screen address and magic settings.

```text
; BALLPAT           RUP0M
; 16x2              16x14
; ##..............  .....##.........
; ##..............  .....##.........
;                   ....###.........
;                   ...#####........
;                   ...#####........
;                   ...####.#.......
;                   ...####.#.......
;                   ....###.........
;                   ....###.........
;                   ....###.........
;                   ....###.........
;                   ....####........
;                   ....##..........
;                   ....###.........
```


**Lines 0–4.** VERASE reads expansion/magic and pattern, skips its relative offsets to the size header and loads VSCRADR.

```text
 0|( BB interrupt vector erase    VERASE )
 1|CODE VERASE ( does pattern board erase from vector IX )
 2|  VXPAND X B LDX, VMAGIC X C LDX, VPATH X H LDX, VPATL X L LDX,
 3|  H INX, H INX, ( abs ) H PUSH, Y POPX,
 4|  VSCRADRH X H LDX, VSCRADRL X L LDX,
```

**Lines 5–6.** Call writep, return natively, select decimal and stop loading. XOR-style caller settings determine the erase behavior.

```text
 5|  writep CALL, RET,
 6|DECIMAL ;S
```


<a id="block-253"></a>

### Block 253

Perturb grounder X motion using a cyclic table of small signed offsets.

**Lines 0–4.** Save radix, select hex and emit GVTBL with zero, $0040 and $FFC0 entries.

```text
 0|( BB interrupt    CHKGROUNDER )
 1|BASE@ HEX
 2|LABLE GVTBL ( grounder varb table )
 3|  0 , 40 , 40 , 40 , 0 , 0 , 0 , 0 , FFC0 , FFC0 , FFC0 ,
 4|  0 , 0 ,
```

**Lines 5–10.** CHKGROUNDER returns unless GRNDR is set, advances/wraps GRNDRVALUE across thirteen entries, chooses/sign-adjusts the offset and adds it to HL; continue.

```text
 5|CODE CHKGROUNDER ( if grounder adjust ball direction )
 6|  GRNDR LDA, A ANA, RZ,
 7|  GRNDRVALUE LDA, A INR, 0D CPI, >=, IF, A XRA, THEN,
 8|  GRNDRVALUE STA, H PUSH, GVTBL H LXI, ' INDEXW CALL,
 9|  VXH X A LDX, 0A0 CPI, ' COMPDE CC, H POP, D DAD, RET,
10|-->
```


<a id="block-254"></a>

### Block 254

Advance per-interrupt timers and turn zero transitions into foreground requests or native callbacks.

**Lines 0–3.** TIMER turns THROWTIMER expiry into THROWTIME.

```text
 0|( BB interrupt    TIMER )
 1|CODE TIMER ( interrupt timer routine )
 2|  THROWTIMER H LXI, TIMEDCR CALL, A ANA, 0<>, IF,
 3|     THROWTIME STA, THEN,
```

**Lines 4–8.** Turn string expiry into erase/redraw requests and take-field timer expiry into TFTIME.

```text
 4|  STRINGOFFTIMER H LXI, TIMEDCR CALL,
 5|    A ANA, 0<>, IF, STRINGERASE STA, OLDSTRING LDA,
 6|                STRING STA, THEN,
 7|  TFTIMER H LXI, TIMEDCR CALL, A ANA, 0<>, IF,
 8|    TFTIME STA, THEN,
```

**Lines 9–15.** Trigger delayed throw animation, computer outfield control, text flashing, fly-ball runner takeoff and walk completion. The routine continues in 255.

```text
 9|  WAITTHROW H LXI, TIMEDCR CALL, A ANA, 0<>, IF,
10|    THROWANM STA, THEN,
11|  CMOFTIMER H LXI, TIMEDCR CALL, A ANA, CMPOF CNZ, DI,
12|  FLSHTIME H LXI, TIMEDCR CALL, A ANA, FLSHWUP CNZ,
13|  TOTIMER H LXI, TIMEDCR CALL, A ANA, TAKEOFF CNZ,
14|  WALK H LXI, TIMEDCR CALL, A ANA, WALKOVER CNZ,
15|-->
```

<a id="block-255"></a>

### Block 255

Finish timers and choose sprite perspective from vertical position.

**Lines 0–1.** Service TOOF timeout through TOOFCK and return from TIMER.

```text
 0|( BB interrupt    PERSPECTIVE )
 1|  TOOF H LXI, TIMEDCR CALL, A ANA, TOOFCK CNZ, RET,
```

**Lines 3–7.** PERSPECTIVE compares integer Y against its thresholds and chooses size index 0–4.

```text
 3|CODE PERSPECTIVE ( pattern size determined by y )
 4| 0 E MVI, VYH X H LDX, 54 A MVI, H CMP, <, IF, 84 A MVI, H CMP,
 5| <, IF, 0 D MVI, ELSE, 1 D MVI, THEN, ELSE, 3A A MVI, H CMP,
 6| <, IF, 2 D MVI, ELSE, 1F A MVI, H CMP, <, IF, 3 D MVI,
 7| ELSE, 4 D MVI, THEN, THEN, THEN,
```

**Lines 8–12.** Store VPERS# and set VHW when the perspective index changes; for runners this is also used as commitment state. Continue loading.

```text
 8|  VPERS# X A LDX, D CMP, ( cmp pers new & old )
 9|  D VPERS# X STX, <>, IF, VHW VSTATUS X SETX, THEN,
10| ( for runners set commited if change )
11| RET,
12|-->
```


<a id="block-256"></a>

### Block 256

Reconstructed source-loading bridge within the interrupt chain.

**Lines 0–1.** Continue to 257. 

```text
 0|( BB interrupt - reconstructed continuation bridge )
 1|-->
```


<a id="block-257"></a>

### Block 257

Update fixed-point vector coordinates and enforce playfield limits.

**Lines 0–6.** Choose ordinary or restricted outfielder Y bounds, load X and divide its X delta by four for the horizontal resolution before adding it.

```text
 0|( BB interrupt    VECTOR )
 1|CODE VECTOR ( vectors and limit checks )
 2|  C001 B LXI, ( y limits ) TAKEFIELD LDA, A ANA, 0=, IF,
 3|  VOF VSTATUS X BITX, 0<>, IF, 4009 B LXI, THEN, THEN,
 4|  ( outfielder limits ) VXH X D LDX, VXL X
 5|  E LDX, VDXH X H LDX, VDXL X L LDX,
 6| ' DIVHLBY4 CALL, ( comm. resolution ) D DAD,
```

**Lines 7–9.** Apply grounder perturbation for a ball vector and clamp integer X while retaining its fractional byte.

```text
 7| VBL VSTATUS X BITX, ' CHKGROUNDER CNZ, 1 A MVI, H CMP,
 8| >=, IF, A H MOV, ELSE, 4E A MVI, H CMP, <, IF, A H MOV,
 9| THEN, THEN, H VXH X STX, L VXL X STX, ( limit chk )
```

**Lines 10–15.** Add Y delta, clamp against the selected vertical bounds, store Y and return; continue.

```text
10| VYH X H LDX, VYL X L LDX, VDYH X D LDX, VDYL X E LDX,
11| D DAD, C A MOV, H CMP, >=, IF, ( low ) A H MOV, ELSE,
12| B A MOV,
13| H CMP, <, IF, A H MOV, THEN, THEN, H VYH X STX, L VYL X STX,
14| RET,
15|-->
```

<a id="block-258"></a>

### Block 258

Test the current bat-swing contact window against ball position.

**Lines 0–3.** Emit BWTBL pairs containing Y and X window parameters for the seven swing phases.

```text
 0|( BB interrupt    BATHITCHK )
 1|LABLE BWTBL ( bat window table y span Y, xspan X, )
 2|  0EAF , 698 , 0DAF , 0D98 , 09AF , 0F98 , 08AC , 1098 ,
 3|  9A7 , 0F98 , 0DA3 , 0D98 , 0EA2 , 0896 ,
```

**Lines 4–7.** BATHITCHK indexes by swing phase, rejects out-of-range Y and scaled X coordinates and preserves the table pointer as required.

```text
 4|CODE BATHITCHK ( check window for hit )
 5|  M A MOV, ( swing # ) A SLAR, BWTBL H LXI, ' INDEXW CALL,
 6|  VYH BL LDA, E SUB, D CMP, RNC, H INX, H INX, H PUSH,
 7|  VX BL LHLD, ' MULTHLBY4 CALL, H A MOV, H POP, M SUB, H INX,
```

**Lines 8–10.** Ignore an already-hit ball; otherwise set HITTIME/HITGOING and erase the ball so foreground BATHIT can begin play; continue.

```text
 8|  M CMP, RNC, HITYET LDA, A ANA, RNZ, A INR,
 9|  HITTIME STA, HITGOING STA, BLERASE CALL, RET,
10|-->
```


<a id="block-259"></a>

### Block 259

Render the bat at its current angle and advance an active swing.

**Lines 0–2.** Emit BSWINGTABLE in order from BATD90 to BATU90.

```text
 0|( BB interrupt    BATWRITE , BATSWING )
 1|LABLE BSWINGTABLE BATD90 , BATD45 , BATD30 ,
 2|       BATMID , BATU30 , BATU45 , BATU90 ,
```

**Lines 3–8.** BATWRITE looks up the angle, uses fixed batter coordinates/options and draws the relative pattern, preserving its caller's pointer.

```text
 3|CODE BATWRITE ( xor bat from swingtype )
 4|  H PUSH, M A MOV, BSWINGTABLE H LXI, ' INDEXW CALL,
 5|  D PUSH, ( pattern add. ) Y POPX, 2600 D LXI, AF00 H LXI,
 6|  828 B LXI, ( exp/mag )
 7|  reloff CALL, relabs CALL, writep CALL,
 8|  H POP, RET,
```

**Lines 9–15.** BATSWING marks a strike attempt, XOR-erases/redraws successive phases, checks contact until HITGOING is set and starts the reset delay at the last phase; continue.

```text
 9|CODE BATSWING ( swings bat if appropriate )
10|  SWINGTYPE H LXI, SWING LDA, A ANA,
11|    0<>, IF, STRIKE STA, M A MOV, 6 CPI, ( end of swing ? )
12|    <, IF, ' BATWRITE CALL, M INR, ' BATWRITE CALL,
13|   HITGOING LDA, A ANA, ' BATHITCHK CZ, ( check for hit )
14|    ELSE, A XRA, SWING STA, 18 A MVI, SWINGTIME STA,
15|    THEN, -->
```

<a id="block-260"></a>

### Block 260

Complete inactive-swing cleanup and return the bat to its resting image.

**Lines 0–6.** When at the final phase, clear HITGOING and count down SWINGTIME; at zero erase the final bat image, reset phase zero and redraw. Close the nested active/inactive tests and return.

```text
 0|( BB interrupt )
 1|          ( swing completion reset bat )
 2|     ELSE, ( swing not set ) M A MOV, 6 CPI,
 3|          =, IF, A XRA, HITGOING STA, SWINGTIME LDA, A ANA,
 4|            0=, IF, ' BATWRITE CALL, 0 M MVI, ' BATWRITE CALL,
 5|            ELSE, A DCR, SWINGTIME STA,
 6|     THEN, THEN, THEN, RET,
```

**Line 7.** Continue source loading.

```text
 7|-->
```


<a id="block-261"></a>

### Block 261

Check proximity between the ball and each of the three outfielders.

**Lines 0–4.** OFBLCHK takes a maximum distance in D, loads BL coordinates and begins with LF in IY for a three-record search.

```text
 0|( BB interrupt    OFBLCHK )
 1|SUBR OFBLCHK ( chk for catch or close when cmsw )
 2|  ( in- D max distance to check for )
 3|  VLENGTH B LXI, VX BL LHLD,
 4|  VMAGIC LF Y LXIX, VYH BL LDA, A INR, A E MOV, 3 A MVI,
```

**Lines 5–10.** Compare absolute Y distance first, then absolute/scaled X distance. On a match return A=1 with IY identifying the matching fielder.

```text
 5|  BEGIN, H PUSH, EXAF, VYH Y A LDX, E SUB, CY, IF, NEG, THEN,
 6|  D CMP, ( max dist ) <, IF,
 7|  D PUSH, VXH Y D LDX, VXL Y E LDX, A ANA, ( res cy )
 8|  D DSBC, ' COMPHL CC, D POP, 10 A MVI, H CMP, >=, IF,
 9|  ' MULTHLBY4 CALL, H A MOV, D CMP, <, IF, 1 A MVI, H POP, RET,
10|  THEN, THEN, THEN,
```

**Lines 11–12.** Advance IY by VLENGTH, repeat for remaining fielders and return the failed result if none matches; continue.

```text
11|  B DADY, EXAF, A DCR, H POP, 0=, END, RET,
12|-->
```


<a id="block-262"></a>

### Block 262

Begin ball-position checks for a pitch: decide ball/strike and arrange the return throw.

**Lines 0–3.** BLPOSCHK branches on HITYET. A pitch beyond Y=$BC enters pitch-completion handling unless contact is already pending.

```text
 0|( BB interrupt    BLPOSCHK )
 1|CODE BLPOSCHK
 2|  HITYET LDA, A ANA, 0=, IF, ( pitch check )
 3|  VYH X A LDX, BC CPI, >=, IF, HITTIME LDA, A ANA, RNZ,
```

**Lines 4–11.** Aim BL back at the pitcher, install THWBLPA and speed/status, request BALL or STRIKE text, clear pitch/swing state and start throwaround.

```text
 4|  HITYET LDA, A ANA, RNZ, VX PT LHLD, VDSTX BL SHLD,
 5|  VY PT LHLD, VDSTY BL SHLD, THWBLPA H LXI, VPLAYACTPC BL SHLD,
 6|  A XRA, VUPDATE# BL STA, 4 A MVI, VVEL BL STA,
 7|  81 A MVI, VSTATUS BL STA, BAL H LXI, THWPA SHLD,
 8|  STRIKE LDA, A ANA, 0<>, IF, CSTRIKE A MVI,
 9|  ELSE, CBALL A MVI, THEN, STRING STA,
10|  A XRA, PITCHTIME STA, STRIKE STA, SWINGGO STA,
11|  1 A MVI, HITYET STA, THROW STA, THROWAROUND STA,
```

**Lines 12–15.** Before completion, test the narrow plate crossing window and set STRIKE if the ball crosses it; the outfield branch follows in 263.

```text
12|  ELSE, ( check for cross the plate ) 0A5 SBI, 0 CPI, RNC,
13|  VXH X A LDX, 26 SBI, 2 CPI, RNC, 1 A MVI, STRIKE STA,
14|  THEN,
15|-->
```

<a id="block-263"></a>

### Block 263

Finish ball-position checks for an outfield catch or pickup.

**Lines 0–3.** Skip shallow/ineligible balls and repeated catches; call OFBLCHK with distance five and return if no fielder is close.

```text
 0|( BB interrupt )
 1|  ELSE, ( intercept check for catch in outfield )
 2|  VYH X D LDX, 3C A MVI, D CMP, RC, NOCATCH LDA, A ANA, RNZ,
 3|  5 D MVI, OFBLCHK CALL, A ANA, RZ, INAIR LDA, A ANA, 0<>, IF,
```

**Lines 4–7.** For an airborne catch force runners back, set OFCATCH/CAUGHT and select WHOSUP; for a pickup set OFPU. Record the catching/throwing fielder and prevent another catch.

```text
 4|  2 A MVI, LVRSTAT CALL,
 5|  OFCATCH STA, CAUGHT STA, WHOSUP LHLD,
 6|  PLAYON SHLD, A XRA, ELSE, A INR, OFPU STA, THEN, THROWANM STA,
 7|  A INR, NOCATCH STA, Y PUSHX, H POP, WHOTHROWS SHLD,
```

**Lines 8–10.** Erase the ball, stop outfield motion and timeout processing and return; continue.

```text
 8|  BLERASE CALL, ' KILLOF CALL,
 9|  A XRA, OFTBLGO STA, TOOF STA, ( ofl t.o. timer ) THEN, RET,
10|-->
```


<a id="block-264"></a>

### Block 264

Enter the main game interrupt, restore ordinary palette values and guard nested game-update work.

**Lines 0–2.** Emit WINTBL, four starting vector pointers for the rotating three-entity updates.

```text
 0|( BB interrupt main WINTBL , INTERRUPT )
 1|LABLE WINTBL ( which interrupt table )
 2|  VMAGIC R3 , VMAGIC 1ST , VMAGIC 3RD , VMAGIC RF ,
```

**Lines 4–5.** Declare INTTOP and use ICODE to generate the interrupt prologue before assembling INTERRUPT.

```text
 4|FORWARD INTTOP
 5|ICODE INTERRUPT <ASSEMBLE
```

**Lines 6–9.** Enable interrupts so palette IRQs can run, restore normal colors unless reserved/flashing, increment INTFLAG and preserve BC/IY/IX for the main update pass.

```text
 6| EI, FLSHSTAY LDA, A ANA, 0=, IF, HMRFLSH LDA, A ANA,
 7| 0=, IF, F0 A MVI, 3 OUT, 52 A MVI, 1 OUT, THEN, THEN,
 8| INTFLAG LDA, A INR, INTFLAG STA, 2 CPI, <, IF,
 9|LABEL INTTOP B PUSH, Y PUSHX, X PUSHX,
```

**Lines 10–11.** Continue the body in 265; the comment explicitly records the scanline-interrupt intent.

```text
10|-->
11|( Allow scanline palette IRQ during main game work )
```


<a id="block-265"></a>

### Block 265

Rotate the starting vector group for this game interrupt.

**Lines 0–4.** Increment/wrap WHICHINT modulo four, look up WINTBL and load IX. The next screen processes three records from that start.

```text
 0|( BB interrupt main )
 1|  WHICHINT LDA, A INR, 4 CPI, =, IF, A XRA, THEN,
 2|  WHICHINT STA, WINTBL H LXI, ' INDEXW CALL, D PUSH, X POPX,
 3|  ( 3 guys every 4 interrupts )
 4|-->
```


<a id="block-266"></a>

### Block 266

Erase, update and redraw three vector records during one game interrupt.

**Lines 0–3.** Set a three-entity count and VLENGTH stride; for active vectors clear BLWAIT.

```text
 0|( main vectoring, does 3 vectors given IX-starting vect )
 1|  3 A MVI, VLENGTH D LXI,
 2|BEGIN, PSW PUSH, D PUSH, VACT VSTATUS X BITX,
 3|  0<>, IF, A XRA, BLWAIT STA,
```

**Lines 4–8.** Erase the old sprite, save VECTIX, update playaction, move/clamp coordinates, select perspective and redraw.

```text
 4|        ' VERASE CALL, ( erase )
 5|        VECTIX SIXD, ' PLAYACT CALL, ( player action control )
 6|        ' VECTOR CALL, ( vector limits & perspective chk )
 7|        ' PERSPECTIVE CALL, ( change of size )
 8|        ' VWRITE CALL, ( write )
```

**Lines 9–12.** Restore the stride, subtract VLENGTH from IX to visit the next allocated record, repeat three times and continue.

```text
 9|  THEN, D POP, A XRA, ( res carry ) X PUSHX, H POP,
10|  D DSBC, ( nxt vector ) H PUSH, X POPX, PSW POP, A DCR,
11|0=, END,
12|-->
```


<a id="block-267"></a>

### Block 267

Update the bat and the ball on every game-interrupt pass.

**Lines 0–4.** Advance the bat, select BL and, if active, apply the short BLWAIT delay behavior.

```text
 0|( BB interrupt ball and bat process )
 1|    ' BATSWING CALL, ( if swing every int. )
 2|  VMAGIC BL X LXIX, VACT VSTATUS X BITX,
 3|    0<>, IF, BLWAIT LDA, A ANA, 0<>, IF,
 4|   ' WAIT CALL, ELSE, 2 A MVI, BLWAIT STA, THEN,
```

**Lines 5–10.** Erase BL, update its playaction/coordinates, redraw and run BLPOSCHK even after the active-vector branch.

```text
 5|       ' VERASE CALL, ( erase )
 6|       VECTIX SIXD, ' PLAYACT CALL, ( ball action logic )
 7|       ' VECTOR CALL, ( vector & limit chk )
 8|       ' VWRITE CALL, ( write )
 9|   THEN,
10|       ' BLPOSCHK CALL, ( check pitch or outfield catch )
```

**Line 11.** Continue to interrupt housekeeping.

```text
11|-->
```


<a id="block-268"></a>

### Block 268

Finish the game interrupt: music, timers, trackball, coins and high-level display requests.

**Lines 0–3.** Preserve the index registers for music/timer processing, call MUSCPU/TIMER and poll trackball only when the take-field phase permits.

```text
 0|( BB interrupt )
 1| X POPX, Y POPX, Y PUSHX, X PUSHX, 2B Y LXIX, ' MUSCPU CALL,
 2|  ' TIMER CALL, ( system timers decrimented & flaged )
 3|  TAKEFIELD LDA, A ANA, ' TBALLPRC CZ, ( tractor ball )
```

**Lines 4–7.** Restore indexes, service both coin inputs, invoke pending event/score words via DOVERB and restore BC.

```text
 4|   X POPX, Y POPX, CHKCOIN1 CALL, CHKCOIN2 CALL,
 5|  STRING LDA, A ANA, 0<>, IF, DOVERB STRINGPRC THEN,
 6|    SCORESHOW LDA, A ANA, 0<>, IF, DOVERB SCOREME THEN,
 7|  B POP,
```

**Lines 8–10.** Decrement INTFLAG and repeat at INTTOP if nested work remains; otherwise INEXT uses the generated interrupt epilogue. Close assembly and continue loading.

```text
 8|  INTFLAG LDA, A DCR, INTFLAG STA, INTTOP JNZ, THEN,
 9|  INEXT ASSEMBLE>
10|-->
```


<a id="block-269"></a>

### Block 269

Provide the scanline palette handler and alternate homer-flashing interrupt schedules.

**Lines 0–4.** COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled. Its unusual NEXT/XTHL entry follows the scheduler's calling convention.

```text
 0|( BB released palette bands and homer flashing )
 1|SUBR COLORBAND NEXT XTHL, PSW PUSH, M A MOV, INLIN OUT,
 2|H INX, IPNT SHLD, FLSHSTAY LDA, A ANA, 0=, IF,
 3|6C A MVI, 3 OUT, 7 A MVI, 1 OUT, THEN,
 4|PSW POP, H POP, EI, RET, ( palette only: preserve AF/HL )
```

**Lines 5–10.** HMRINT toggles HMRFLSH when its counter expires, writes alternating color sets, reloads/decrements the timer and exits through INEXT.

```text
 5|ICODE HMRINT ( homer shill interrupt )
 6|HMFLSHCNT H LXI, M A MOV, A ANA, 0=, IF,
 7|HMRFLSH LDA, 1 XRI, HMRFLSH STA, 20 M MVI,
 8|A ANA, 0<>, IF, 7 A MVI, 0 D MVI, ELSE, 7 D MVI, THEN,
 9|0 OUT, 4 OUT, D A MOV, 1 OUT, 2 OUT, 3 OUT, THEN, M DCR,
10|INEXT
```

**Lines 11–15.** Construct INTERRUPTS0 with COLORBAND at $73 and the main game handler at 0; construct INTERRUPTS1 with HMRINT at $73 and the game handler at $C0. Select decimal and load 289.

```text
11|<INTERRUPTS INTERRUPTS0
12|73 I' COLORBAND 0 I' INTERRUPT INTERRUPTS>
13|<INTERRUPTS INTERRUPTS1
14|73 I' HMRINT C0 I' INTERRUPT INTERRUPTS>
15|DECIMAL 289 LOAD ;S
```

<a id="block-270"></a>

### Block 270

Emit dugout graphics and the half-field outline coordinates; wrap native line drawing safely.


**Lines 0–5.** Select hex and emit DUGOUT's pattern bytes with its metadata.

```text
; DUGOUT
; 32x18
; ...................#............
; .................####...........
; ................#######.........
; .................#######........
; ...................######.......
; ...................######.......
; ..................######........
; .................######.........
; ...............######...........
; ..............######............
; ............######..............
; ...#.......######...............
; .####....######.................
; #######.######..................
; .###########....................
; ...########.....................
; ....#####.......................
; ......##........................
```

```text
 0|( BB field table dugout pattern    cnline )
 1|HEX
 2|LABLE DUGOUT 0 0 0 3 0 0 80 0F 0 0 E0 1F 0 0 F0 7F 0 0 FC FE
 3|  0 0 7E 78 0 80 1F 10 0 C0 0F 0 0 F0 3 0 0 F8 1 0
 4|  0 7E 0 0 0 3F 0 0 80 1F 0 0 80 1F 0 0 0 7F 0 0 0 FE 0 0
 5|  0 78 0 0 0 10 0 0 12 4 0 0 24STF 24STF 24STF B, B, B, B,
```

**Lines 6–8.** Emit FIELD, a compact sequence consumed by GETF/FIELDWRT.

```text
 6|BTABLE FIELD
 7|  9D B, AC B, 0 B, 3E B, 1 B, 2D B, 4 B, 24 B, 8 B, 1D B,
 8|  0D B, 16 B, 14 B, 0D B, 1F B, 06 B, 28 B, 03 B, A0 B, 03 B,
```

**Lines 10–15.** cnline preserves BC/IY/IX and the interrupt-enable state captured by LD A,I, calls the line VECTOR routine under DI, restores registers and conditionally EI, then continues loading.

```text
10|CODE cnline ( calls vector line write )
11|B PUSH, Y PUSHX, X PUSHX, 0ED B, 57 B, PSW PUSH, DI,
12|VECTOR CALL, PSW POP, X POPX, Y POPX, B POP,
13|PE, IF, EI, THEN, NEXT
14|( Protect vector scratch IX; restore prior interrupt state )
15|-->
```


<a id="block-271"></a>

### Block 271

Set up a line start and expose absolute/continuing line drawing.

**Lines 0–7.** strtline converts the X representation for relabs, derives BIT-POS and sets the actual framebuffer address SADR by adding $4000.

```text
 0|( BB line vector routines    CNLINE , DLINE )
 1|CODE strtline ( given X Y sets up start of line )
 2|  H POP, ( y ) D POP, ( x ) E SLAR, D RALR, E SLAR, D RALR,
 3|  E SLAR, D RALR, E SLAR, D RALR, E SLAR, D RALR,
 4|  E SLAR, D RALR, ( adjust x for relabs ) B PUSH,
 5|  0 C MVI,
 6|  relabs CALL, 3 ANI, BIT-POS STA, 4000 D LXI, D DAD,
 7|  SADR SHLD, B POP, NEXT
```

**Lines 9–10.** CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state.

```text
 9|: CNLINE ( continue line to this point , given X Y )
10|  YIN ! XIN ! cnline ;
```

**Lines 12–15.** DLINE saves endpoint and initial X/Y state, converts Y for strtline, draws through cnline and continues loading.

```text
12|: DLINE ( draw a line , given X Y start coor X Y ending coor )
13|  YIN ! XIN ! 2DUP Y-AXIS ! X-AXIS !
14|  SWAB ( set y for relabs ) strtline cnline ;
15|-->
```


<a id="block-272"></a>

### Block 272

Build rectangles and outlines from the vector line primitives and display ball/strike/out counts.

**Lines 0–4.** RECLINE derives one horizontal row from retained rectangle arguments. RECTAN repeatedly draws rows, advances Y and decreases remaining height, then discards the arguments.

```text
 0|( BB line vector routines    RECTAN , OUTLINE )
 1|: RECLINE 4 PICK 4 PICK 2DUP SWAP 6 PICK + SWAP DLINE ;
 2|: RECTAN ( in X, Y, X length, Y length, pxtype set )
 3|  BEGIN RECLINE ROT 1+ ROT ROT 1- DUP 0= END DROP DROP DROP
 4|  DROP ;
```

**Lines 6–9.** OUTLINE uses NDUP/PICK and line continuation to draw four edges from X/Y/width/height.

```text
 6|: OUTLINE ( creates rectanguler outline )
 7|  ( in- X , Y , X length , Y length ; pxtype set )
 8|  4 NDUP DROP 3 PICK + OVER 4 NDUP DLINE 5 PICK + CNLINE
 9|  3 PICK + CNLINE DROP DROP CNLINE ;
```

**Lines 11–13.** SBO posts the three $30-based count characters at their fixed positions. Select decimal and load the infield data chain at 278.

```text
11|: SBO 3700 B000 308 BALLS B@ CPOST 3F00 B000 308 STRIKES B@
12|  CPOST 4700 B000 308 OUTS B@ CPOST ;
13|DECIMAL 278 LOAD ;S
```


<a id="block-273"></a>

### Block 273

Read field-outline coordinates, draw scoreboard components and clear background/transient RAM.

**Lines 0–6.** Allocate FINDEX. GETF fetches FIELD bytes sequentially; FIELDWRT draws the initial segment and eight continuations. FMIRROR supplies the other half later.

```text
 0|( BB field write main    FIELDWRT , SUP )
 1|BV= FINDEX
 2|: GETF FINDEX B@ FIELD B@ FINDEX 1+B! ;
 3|( Right half is produced by FMIRROR )
 4|: FIELDWRT ( write field outline )
 5|FINDEX BZERO GETF GETF GETF GETF DLINE
 6|8 0 DO GETF GETF CNLINE LOOP ;
```

**Lines 10–12.** SUP posts UP. SCRS clears two score rectangles and draws zero score characters.

```text
10|: SUP 8C00 8828 A" UP" SPOST ;
11|: SCRS 1F 8A 18 0E RECTAN 107 8A 18 0E RECTAN
12| B00 8C00 308 30 CPOST 4500 8C00 308 30 CPOST ;
```

**Lines 13–15.** FLFILL fills the background while allowing interrupts; ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. Continue loading.

```text
13|: FLFILL EI 0 4000 3C00 FILL DI ;
14|: ZERORAM DI 0 7C30 270 FILL 3 OFTFCNT B! DI ;
15|-->
```


<a id="block-274"></a>

### Block 274

Begin FL, the complete background/scoreboard redraw.

**Lines 0–4.** Select hex, hide the incomplete screen via port $0A, clear RAM/background, enable interrupts, select infield/line pixel patterns and paint INFIELD/FIELDWRT.

```text
 0|( BB field write main    FL )
 1|HEX
 2|: FL ( set up all of background )
 3|0 0A OUTP ZERORAM FLFILL ( hide incomplete background )
 4|EI 0 PXT3 PXTYPE ! INFIELD PX1 FIELDWRT
```

**Lines 5–8.** Draw first base and dugout, mirror the half-field, then draw second base, home plate and resting bat.

```text
 5|10C0 6600 BASEPAT 4428 WRITR
 6|1D00 8D00 DUGOUT 868 WRITR FMIRROR
 7|2880 4C00 BASE2PAT 4428 WRITR
 8|2800 AC00 HOMEPLATE 8808 WRITR 2600 AF00 BATD90 8828 WRITR
```

**Lines 9–15.** Draw the inning/ball/strike/out scoreboard outlines and text, with EIDI calls to allow an interrupt window. FL continues in 275.

```text
 9|0C AA 6E 15 OUTLINE 400 B000 828 A" INN" SPOST
10|  B00 AF00 8408 A" 1 2 3 4 5 6 7 8 9" SPOST
11|  C4 AA 60 15 OUTLINE 3300 B000 828 42 CPOST
12|  D7 AE 10 0E RECTAN 3B00 B000 828 53 CPOST
13|  F7 AE 10 0E RECTAN 4300 B000 828 4F CPOST
14|EIDI 117 AE 10 0E RECTAN
15|-->
```

<a id="block-275"></a>

### Block 275

Finish FL with team labels, counts and credit caption, then reveal the completed background.

**Lines 0–1.** The source comment claims both dugouts precede FMIRROR; block 274 explicitly draws one DUGOUT and mirrors it. Read the actual call order rather than treating the comment as a second draw call.

```text
 0|( BB field write )
 1|( Both dugouts are drawn before FMIRROR )
```

**Lines 2–4.** Draw HOME/VISITOR and scores, initialize count bytes to $30, draw counts and UP, post CREDITS and restore the visible vertical setting $C0 on port $0A; close FL.

```text
 2| HOM VIS SCRS EIDI 30 DUP DUP BALLS B! STRIKES B! OUTS B! SBO
 3|  F00 SUP
 4|300 A300 8828 A" CREDITS" SPOST C0 0A OUTP EIDI ;
```

**Line 5.** Select decimal and finish the field source chain.

```text
 5|DECIMAL ;S
```


<a id="block-276"></a>

### Block 276

Bind counted strings and native loop primitives, then reconstruct +LOOP from the target runtime behavior.

**Lines 0–3.** Save radix, select hex and temporarily move ROMHERE to register COUNT at $E6, preserving the saved object location.

```text
 0|( BB parameter control - reconstructed from Extra Bases ROM )
 1|BASE@ HEX
 2|ROMHERE @ 0E6 ROMHERE ! CODE COUNT ROMHERE !
 3|( COUNT uses the native counted-string routine )
```

**Lines 5–8.** Similarly bind DO=$176, LOOP=$191 and I=$1BF, then restore ROMHERE.

```text
 5|ROMHERE @ 0176 ROMHERE ! CODE DO
 6|0191 ROMHERE ! CODE LOOP
 7|01BF ROMHERE ! CODE I
 8|ROMHERE !
```

**Lines 9–15.** Declare loop labels and assemble +LOOP: pop the increment, update the IX loop index, compare against its limit and use sign/parity flag tests to choose repeat versus completion. Continue its body in 277.

```text
 9|FORWARD PLPOS FORWARD PLBACK FORWARD PLDONE
10|CODE +LOOP <ASSEMBLE H POP, H A MOV, 0 X E LDX, 1 X D LDX,
11|D DAD, L 0 X STX, H 1 X STX,
12|2 X E LDX, 3 X D LDX, A ORA, D DSBC,
13|PSW PUSH, H POP, 7 A BIT, L A MOV, PLPOS JZ,
14|84 ANI, PLBACK JPE, PLDONE JMP,
15|-->
```


<a id="block-277"></a>

### Block 277

Finish reconstructed +LOOP and restore the source-loader radix.

**Lines 0–3.** Use the saved sign/overflow-related tests to choose PLBACK or PLDONE; completion advances IX past the loop frame, while repetition loads the saved branch address into BC. Both return through NEXT.

```text
 0|( BB parameter control - reconstructed continuation )
 1|LABEL PLPOS 84 ANI, PLBACK JPO,
 2|LABEL PLDONE 6 D LXI, D DADX, NEXT
 3|LABEL PLBACK 4 X C LDX, 5 X B LDX, NEXT ASSEMBLE>
```

**Line 4.** Restore radix and end the parameter-control chain.

```text
 4|BASE! ;S
```


<a id="block-278"></a>

### Block 278

Emit the reconstructed infield's encoded per-row span endpoints, including the mound continuation.

**Lines 0–1.** Select hex and label INFP, the byte stream consumed by INFIELD/IFSPAN.

```text
 0|( Infield - exact released spans and mound ) HEX
 1|LABLE INFP
```

**Lines 2–6.** Emit the main-region endpoint/control bytes. High bits participate in span gap handling.

```text
 2|062 B, 0D7 B, 0CC B, 0C5 B, 040 B, 0B9 B, 036 B, 033 B,
 3|0AB B, 029 B, 026 B, 021 B, 01F B, 01D B, 017 B, 014 B,
 4|011 B, 0E B, 0C B, 09 B, 06 B, 04 B, 01 B, 00 B,
 5|01 B, 01 B, 02 B, 04 B, 06 B, 07 B, 09 B, 0B B,
 6|0C B, 0D B, 0E B, 010 B, 011 B, 013 B, 014 B, 016 B,
```

**Lines 7–9.** Emit the twelve mound-row bytes and continue to the painter. 

```text
 7|070 B, 06E B, 06C B, 06B B, 06A B, 06A B, 06A B, 06A B,
 8|06B B, 06C B, 06E B, 070 B,
 9|-->
```


<a id="block-279"></a>

### Block 279

Paint encoded infield spans by modifying selected packed pixels while leaving gap pixels intact.

**Lines 0–4.** Declare labels; IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value.

```text
 0|( Native span painter; gaps preserve existing pixels ) HEX
 1|FORWARD IFALIGN FORWARD IFPIX
 2|SUBR IFSPAN D PUSH, A H MOV, C L MOV, 0 A MVI,
 3|7 H BIT, 0<>, IF, H A MOV, 7F ANI, 4C CPI,
 4|4 A MVI, CY~, IF, 7 A MVI, THEN, THEN, PSW PUSH,
```

**Lines 5–8.** Convert the two endpoints to span coordinates/count and the starting framebuffer byte address.

```text
 5|H A MOV, 7F ANI,
 6|2D ADI, A C MOV, L A MOV, 7F ANI, 2D ADI, C SUB,
 7|A INR, A B MOV, D H MOV, E L MOV, 0 D MVI, C E MOV,
 8|E SRLR, E SRLR, D DAD, PSW POP, A E MOV,
```

**Lines 9–13.** Align a rotating two-bit pixel mask, skip the initial gap count, OR each painted pixel into the destination byte and advance the byte address when the mask wraps.

```text
 9|C A MOV, 3 ANI, A D MOV, 0C0 C MVI, D INR,
10|LABEL IFALIGN D DCR, 0<>, IF, C RRCR, C RRCR,
11|IFALIGN JMP, THEN, LABEL IFPIX E DCR, 0<>, IF,
12|M A MOV, C ORA, A M MOV, THEN, C RRCR, C RRCR,
13|CY, IF, H INX, THEN, IFPIX DJNZ, D POP,
```

**Lines 14–15.** Advance the row address by $50, restore it in DE and return. Select decimal and load 208, which emits the INFIELD row loops.

```text
14|50 H LXI, D DAD, XCHG, RET,
15|DECIMAL 208 LOAD ;S
```

<a id="block-280"></a>

### Block 280

Allocate line-generator state and pixel-value/mask tables.


**Lines 0–3.** Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.

```text
 0|( PIXEL TABLES ) BASE@ HEX
 1|{ : FOWR } FORWARD { ; }
 2|V= PXTYPE V= XIN V= YIN V= Y-AXIS V= X-AXIS
 3|V= BIT-POS V= SADR V= V-PXTYPE V= V-MODE ( 0= write 1= xor )
```

**Lines 4–7.** Emit zero/white pixel patterns and define PX1/PX0 to select them.

```text
; PXT0      PXT1
; 8x4       8x4
; ........  #.......
; ........  ..#.....
; ........  ....#...
; ........  ......#.
```

```text
 4|BTABLE PXT0 0 , 0 ,
 5|BTABLE PXT1 80 B, 20 B, 8 B, 2 B, ( fixed white index 2 )
 6|: PX1 0 PXT1 PXTYPE ! ;
 7|: PX0 0 PXT0 PXTYPE ! ;
```

**Lines 8–10.** Emit four two-bit clearing masks and full-color pixel values, restore radix and continue.

```text
; PXT3
; 8x4
; ##......
; ..##....
; ....##..
; ......##
```

```text
 8|BTABLE MASK 3F B, 0CF B, 0F3 B, 0FC B,
 9|BTABLE PXT3 0C0 B, 30 B, 0C B, 3 B,
10|BASE! -->
```


<a id="block-281"></a>

### Block 281

Begin the two-pass line generator with X-direction stepping code.

**Lines 0–5.** Declare cross-screen labels and enter ASM <ASSEMBLE. Forward labels allow the generated line loop to call code defined on later screens.

```text
 0|( VECTOR GENERATOR )
 1|FOWR VECTOR FOWR XYLOOP FOWR X-RET FOWR Y-RET
 2|FOWR INC-X FOWR DEC-X FOWR INC-Y FOWR DEC-Y
 3|FOWR YSTEP FOWR XYSHIFT FOWR SINCR
 4|FOWR XYTEST FOWR PWRT
 5|ASM <ASSEMBLE ( START 2 PASS ASSEMBLER )
```

**Lines 6–9.** INC-X rotates pixel/mask by two bits, updates SADR when the byte boundary is crossed, increments X-AXIS and returns to X-RET.

```text
 6|LABEL INC-X E RRCR, E RRCR, ( SHIFT BIT VAL )
 7|   D RRCR, D RRCR, ( SHIFT MASK ) CY~,
 8|   EXX, IF, SADR LHLD, H INX, SADR SHLD, THEN,
 9|   X-AXIS LHLD, H INX, X-AXIS SHLD, EXX, X-RET JMP,
```

**Lines 10–15.** DEC-X performs the inverse rotations/address step and decrements X-AXIS; continue without closing assembly.

```text
10|LABEL DEC-X E RLCR, E RLCR, ( SHIFT BIT VAL )
11|   D RLCR, D RLCR, ( SHIFT MASK ) CY~,
12|   EXX, IF, SADR LHLD, H DCX, SADR SHLD, THEN,
13|   X-AXIS LHLD, H DCX, X-AXIS SHLD, EXX, X-RET JMP,
15|-->
```

<a id="block-282"></a>

### Block 282

Supply Y-direction stepping for the line generator.

**Lines 0–3.** Save radix and select decimal. INC-Y increments Y-AXIS and adds 80 bytes to SADR.

```text
 0|( VECTOR GENERATOR ) BASE@ DECIMAL
 1|LABEL INC-Y Y-AXIS H LXI, M INR,
 2| D PUSH, 80 D LXI, SADR LHLD, D DAD, SADR SHLD, D POP,
 3| RET,
```

**Lines 4–8.** DEC-Y subtracts 80 bytes; YSTEP jumps through IY using PCIY,. Restore radix and continue the open assembly chain.

```text
 4|LABEL DEC-Y Y-AXIS H LXI, M DCR,
 5| D PUSH, -80 D LXI, SADR LHLD, D DAD, SADR SHLD, D POP,
 6| RET,
 7|LABEL YSTEP PCIY,
 8|BASE! -->
```


<a id="block-283"></a>

### Block 283

Compute line endpoint differences, choose axis directions and normalize the line increments.

**Lines 0–2.** Document the required initial SADR, BIT-POS and current X/Y state.

```text
 0|( VECTOR GENERATOR )
 1|( INPUT IS XIN, YIN AS PLACE TO MOVE TO. NOTE SADR & BIT-POS
 2|  MUST ALREADY BE SET, AS WELL AS X-AXIS AND Y-AXIS )
```

**Lines 3–8.** Subtract current X/Y from endpoints, select INC/DEC code pointers in IX/IY and form positive differences.

```text
 3|LABEL VECTOR X-AXIS LDED, XIN LHLD, A XRA, D DSBC,
 4|  CY~, IF, INC-X X LXIX,
 5|     ELSE, DEC-X X LXIX, XCHG, A XRA, 0 H LXI, D DSBC, THEN,
 6|  Y-AXIS LDED, YIN LDA, E SUB, ( DIF OF Y )
 7|  CY~, IF, INC-Y Y LXIX,
 8|     ELSE, DEC-Y Y LXIX, CMA, A INR, ( MAKE A + ) THEN,
```

**Lines 9–10.** Stage differences across the main/alternate register banks and return immediately when both are zero.

```text
 9|EXX, A L MOV, 0 H MVI, EXX, L E MOV, H D MOV, ( copy X to DE )
10|  L ORA, A L MOV, ( OR X & Y ) H ORA, RZ, ( ret if 0 dif )
```

**Lines 11–15.** Shift the combined and component magnitudes until a carry normalizes their scale, then continue at SINCR in 284.

```text
11|( normalize - shift up until carry occurs )
12|LABEL XYSHIFT H DAD, ( shift up combined X & Y ) SINCR JC,
13|  XCHG, H DAD, ( shift up X ) XCHG,
14|  EXX, H DAD, EXX, ( shift up Y )
15|  XYSHIFT JMP, LABEL SINCR -->
```

<a id="block-284"></a>

### Block 284

Run the line generator's fixed-point axis accumulators.

**Lines 0–6.** Arrange X/Y increments and sums across register banks, load the current two-bit pixel value and mask using BIT-POS, and prepare the loop.

```text
 0|( VECTOR GEN )
 1| D PUSH, EXX, H PUSH, EXX, B POP, C E MOV, B D MOV, ( Y parms )
 2| EXX,
 3| ( PUT MASK IN D, PIXEL VALUE IN E -NOTE THESE GO IN ALT REGS )
 4|  BIT-POS LBCD, PXTYPE LHLD, B DAD, M E MOV,
 5|  0 MASK H LXI, B DAD, M D MOV,
 6|  H POP, ( X dif ) H B MOV, L C MOV, EXX,
```

**Lines 7–10.** Add one axis increment; on carry call through IX, then test the other axis and step through IY as needed before writing a point.

```text
 7|LABEL XYLOOP EXX, B DAD, CY,
 8|  IF, PCIX, LABEL X-RET
 9|      EXX, XCHG, B DAD, XCHG, CY,
10|          IF, YSTEP CALL, THEN, PWRT JMP,
```

**Lines 11–15.** Handle the no-X-step case, optionally step Y, and repeat until the later endpoint tests finish the routine; continue.

```text
11|  ELSE, EXX, XCHG, B DAD, XCHG, CY,
12|          IF, YSTEP CALL, PWRT JMP, THEN,
13|  THEN,
14| XYLOOP JMP,
15|-->
```

<a id="block-285"></a>

### Block 285

Write each line pixel and stop when both endpoint coordinates have been reached.

**Lines 0–7.** PWRT obtains SADR and the current mask/value. For nonzero V-MODE the actual code stores E directly; otherwise it clears the selected two bits then ORs E. The mode comment in block 280 labels this branch XOR, while the instruction is a direct store.

```text
 0|( VECTOR GEN - WRITE POINT AND TEST )
 1|LABEL PWRT
 2|( WRITE THE POINT )
 3|   EXX, D PUSH, EXX, H POP, XCHG, H PUSH, ( save Y sum )
 4|   SADR LHLD, V-MODE LDA, A ORA, 0<>, IF, E M MOV, ELSE,
 5|   M A MOV, D ANA, ( MASK OFF )
 6|   E ORA, ( OR IN BIT VAL ) A M MOV, THEN,
 7|   D POP, ( return Y sum )
```

**Lines 8–13.** Compare current Y and X with the endpoints, loop while either differs, update BIT-POS from final X and return.

```text
 8|( END CHECKS )
 9|   YIN LDA, A H MOV, Y-AXIS LDA, H CMP, XYLOOP JNZ,
10|   D PUSH, A XRA, XIN LDED, X-AXIS LHLD, D DSBC, D POP,
11|     XYLOOP JNZ,
12|  X-AXIS LDA, 3 ANI, BIT-POS STA,
13| RET,
```

**Lines 14–15.** Close the multi-screen two-pass assembly and end loading.

```text
14|ASSEMBLE> ( END 2 PASS ASSEMBLER )
15|;S
```

<a id="block-286"></a>

### Block 286

Debounce an input bit by requiring repeated matching samples within a retry budget.

**Lines 0–5.** Document the native register interface: A mask, D retry budget, E consecutive-match count, H input port, L expected value. The push-order comment is historical usage guidance.

```text
 0|( COIN READING ROUTINE ) HEX
 1|( A= mask of bits to look for )
 2|( D= # of times to try to accept value )
 3|( E= # of consecutive values to find )
 4|( H= port from which to read )
 5|( L= value to look for , ** PUSH DE, THEN HL, THEN A ** )
```

**Lines 7–10.** Preserve BC, move the port/mask into working registers and sample `(input XOR expected) AND mask`; return A=1 after enough consecutive matches.

```text
 7|FORWARD READPORT SUBR debounce <ASSEMBLE
 8|B PUSH, H C MOV, E B MOV, A H MOV, LABEL READPORT
 9|A INP, L XRA, H ANA, 0=, IF, E DCR, 0=, IF, ( good ) A INR,
10|B POP, RET, THEN, READPORT JMP,
```

**Lines 11–14.** On a mismatch decrement the retry budget, return zero at exhaustion or restore the consecutive-match count and retry. Close assembly and continue.

```text
11|THEN, D DCR, 0=, IF, A XRA, B POP, RET, THEN,
12|B E MOV, ( try again ) READPORT JMP, ASSEMBLE>
14|-->
```


<a id="block-287"></a>

### Block 287

Handle coin-door 1 as a debounced press/release state machine.

**Lines 0–5.** When idle, debounce bit 0 from port $11; on acceptance latch CNTM1, pulse output $20, increment CREDITS, request UPCRED, clear bonus state and play coin music.

```text
 0|( BB coin routine    CHKCOIN1 )
 1|SUBR CHKCOIN1 ( chk door 1 for coin drop )
 2|  CNTM1 LDA, A ANA, 0=, IF, ( waiting for coin )
 3|  1 A MVI, 1020 D LXI, 11FE H LXI, debounce CALL,
 4|  A ANA, RZ, CNTM1 STA, 20 OUT, CREDITS H LXI, M INR,
 5|  UPCRED STA, A XRA, SPBON STA, DOVERB MCOIN RET,
```

**Lines 6–9.** While latched, use the second debounce window until release, clear CNTM1, update output $20 and return; continue.

```text
 6|  ELSE, ( waiting for coin to drop ) 1 A MVI, 520 D LXI,
 7|    11FE H LXI, debounce CALL, A ANA, RNZ, CNTM1 STA,
 8|  20 OUT, THEN, RET,
 9|-->
```


<a id="block-288"></a>

### Block 288

Handle coin-door 2 with switch-dependent one- or five-credit acceptance.

**Lines 0–4.** CHKCOIN2 debounces bit 1 of port $11, latches CNTM2, pulses output $20 and requests a credit update.

```text
 0|( BB coin routine    CHKCOIN1 )
 1|SUBR CHKCOIN2 ( chk door 2 for coin drop )
 2|  CNTM2 LDA, A ANA, 0=, IF, ( waiting for coin )
 3|  2 A MVI, 1020 D LXI, 11FD H LXI, debounce CALL,
 4|  A ANA, RZ, CNTM2 STA, 20 OUT, UPCRED STA,
```

**Lines 5–8.** Read port $12 bit 1: add five credits when set, otherwise one; clear bonus state and play coin music.

```text
 5|  CREDITS H LXI, 12 IN, 1 A BIT, 0<>, IF, ( susan b dollar )
 6|  M INR, M INR, M INR, M INR, M INR, ELSE,
 7|  M INR, THEN,
 8|  A XRA, SPBON STA, DOVERB MCOIN RET,
```

**Lines 9–12.** Debounce release, clear the latch, pulse output and return. Select decimal and finish coin input loading. The screen title repeats CHKCOIN1, but its actual routine is CHKCOIN2.

```text
 9|  ELSE, ( waiting for coin to drop ) 2 A MVI, 520 D LXI,
10|    11FD H LXI, debounce CALL, A ANA, RNZ, CNTM2 STA,
11|  20 OUT, THEN, RET,
12|DECIMAL ;S
```


<a id="block-289"></a>

### Block 289

Expose the normal and homer interrupt schedules as target words.

**Lines 0–2.** S10 starts INTERRUPTS0 through ISTART; S11 starts INTERRUPTS1. Restore the radix saved by the surrounding interrupt chain and stop.

```text
 0|( Released palette continuation ) HEX
 1|: S10 INTERRUPTS0 ISTART ; : S11 INTERRUPTS1 ISTART ;
 2|BASE! ;S
```


<a id="block-290"></a>

### Block 290

Assign named numeric I/O port constants for video, sound and interrupts.

**Lines 0–1.** Save radix and select hex; define horizontal color boundary and vertical blanking ports.

```text
 0|( I/O PORT DEFINES ) BASE@ HEX
 1| 9 C= HORCB 0A C= VERBL
```

**Lines 2–4.** Define sound master/tone/vibrato/volume/noise and extension port names.

```text
 2|( MUSIC PORTS )
 3|10 C= TONMO 11 C= TONEA 12 C= TONEB 13 C= TONEC
 4|14 C= VIBRA 16 C= VOLAB 15 C= VOLC 17 C= VOLN 18 C= SNDX
```

**Lines 5–8.** Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

```text
 5|0D C= INFBK 0E C= INMOD 0F C= INLIN 8 C= CONCM
 6|0C C= MAGIC 19 C= XPAND 8 C= INTST 0E C= VERAF
 7|0F C= HORAF
 8|-->
```


<a id="block-291"></a>

### Block 291

Generate interrupt schedule records, handler prologues and the shared epilogue.

**Lines 0–2.** Align VPTR to an even boundary using host brace evaluation and allocate the schedule pointer IPNT.

```text
 0|( INTERRUPT ROUTINES ) HEX
 1|VPTR { @ 1 AND } VPTR { +! } ( ALIGN TO EVEN BOUNDARY )
 2|0 VARIABLE IPNT
```

**Lines 3–6.** Define schedule-opening/closing helpers, the tick-compilation helper ]'[ and I', which emits a CALL to the handler entry adjusted by two plus its scanline byte.

```text
 3|{ : <INTERRUPTS } DATA HERE { ; }
 4|{ : INTERRUPTS> } { [ } ASM { ] } JMP, { ; }
 5|: ]'[ [COMPILE] ' ;
 6|{ : I' } 0CD B, ]'[ { 2+ } , B, { ; }
```

**Lines 7–10.** ICODE starts a CODE definition and emits the scheduler/register-save prologue: set INLIN/IPNT, swap alternate register banks and preserve the active register sets.

```text
 7|{ : ICODE } CODE { [ } ASM { ] } NEXT XTHL, D PUSH, B PUSH,
 8|   PSW PUSH, M A MOV, INLIN OUT, H INX, IPNT SHLD,
 9|   EXX, EXAF, H PUSH, D PUSH, B PUSH, PSW PUSH,
10|   ASM { ; }
```

**Lines 11–14.** IEX restores saved registers, enables interrupts and returns. INEXT emits a jump to IEX; continue loading.

```text
11|CODE IEX PSW POP, B POP, D POP, H POP, EXX, EXAF,
12|    PSW POP, B POP, D POP, H POP, EI, RET,
13|{ : INEXT } { LIT [ } ' IEX { , } ASM { ] } JMP, { ; }
14|-->
```


<a id="block-292"></a>

### Block 292

Start an interrupt schedule and bind native interrupt-control/byte-nibble helpers.

**Lines 0–3.** ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.

```text
 0|( Interrupt routines )
 1|CODE ISTART DI, H POP, IPNT SHLD, 8 A MVI, INMOD OUT,
 2| IPNT { SWAB } A MVI, STAI, IPNT A MVI,
 3| INFBK OUT, IM2, EI, NEXT
```

**Lines 4–6.** Preserve ROMHERE while binding DI=$243, EI=$246 and SWAN=$249 to native entries. SWAN here is the nibble swap used by NPOST; SWAB is the distinct byte swap.

```text
 4|ROMHERE @ HEX 0243 ROMHERE ! CODE DI
 5|0246 ROMHERE ! CODE EI 0249 ROMHERE ! CODE SWAN
 6|ROMHERE !
```

**Line 8.** Continue source loading.

```text
 8|-->
```


<a id="block-293"></a>

### Block 293

Initialize commercial video mode and bind the native fill primitive.

**Lines 0–3.** INTHIGHRES sets commercial mode, $C0 vertical blanking and zero horizontal color boundary.

```text
 0|( VGS screen handeling verbs INTCOMMERCIAL , FILL , SCRERASE )
 1|: INTHIGHRES ( intialize screen for commercial mode )
 2| 1 8 OUTP ( con,com port ) C0 0A OUTP ( vertbl )
 3| 0 9 OUTP ( horzcb ) ;
```

**Line 4.** Temporarily redirect ROMHERE to bind FILL at $253, then restore the current object address.

```text
 4|ROMHERE @ HEX 0253 ROMHERE ! CODE FILL ROMHERE !
```

**Lines 8–10.** SCRERASE fills $3F00 bytes starting at $4000 with zero; continue.

```text
 8|: SCRERASE ( erase entire screen )
 9| 0 4000 3F00 FILL ;
10|-->
```


<a id="block-294"></a>

### Block 294

Bind the native NDUP stack helper.

**Lines 0–2.** Preserve ROMHERE, bind NDUP at $260 and restore the object pointer, then continue. 

```text
 0|( VGS NDUP - native signed-loop binding )
 1|ROMHERE @ HEX 0260 ROMHERE ! CODE NDUP ROMHERE !
 2|-->
```


<a id="block-295"></a>

### Block 295

Bind random-number state to its native kernel RAM location and expose RND.

**Lines 0–1.** Preserve VPTR while allocating a two-cell RND# array at $7C06.

```text
 0|( HIGH SPEED RANDOM NUMBER - native kernel binding )
 1|HEX VPTR @ 07C06 VPTR ! 2 ARRAY RND# VPTR !
```

**Lines 2–3.** Preserve ROMHERE while binding RND at $275, then continue. 

```text
 2|ROMHERE @ 0275 ROMHERE ! CODE RND ROMHERE !
 3|-->
```


<a id="block-296"></a>

### Block 296

Emit the ten-row large-font glyphs for space and digits zero through nine.


**Lines 0–3.** Label characters and emit the ten zero rows for space.

```text
; LARGE SPACE
; 8x10
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
```

```text
 0|( NUMBER TABLE FOR STRING DISPLAY ROUTINES )
 1|BTABLE characters ( FILL IN CHARACTER TABLES )
 2|( SPACE 0 1 2 3 4 5 6 7 8 9 )
 3|00 B, 00 B, 00 B, 00 B, 00 B, 00 B, 00 B, 00 B, 00 B, 00 B,
```

**Lines 4–13.** Each numbered line emits ten bytes for one digit, in order 0–9. 

```text
; LARGE 0   LARGE 1   LARGE 2   LARGE 3
; 8x10      8x10      8x10      8x10
; ..####..  ...##...  ..####..  ..####..
; .######.  ..###...  .######.  .######.
; .##..##.  ...##...  .##..##.  .##..##.
; .##..##.  ...##...  .....##.  .....##.
; .##..##.  ...##...  ..#####.  ...###..
; .##..##.  ...##...  .#####..  ...####.
; .##..##.  ...##...  .##.....  .....##.
; .##..##.  ...##...  .##.....  .##..##.
; .######.  ..####..  .######.  .######.
; ..####..  ..####..  .######.  ..####..
;
; LARGE 4   LARGE 5   LARGE 6   LARGE 7
; 8x10      8x10      8x10      8x10
; .##..##.  .#####..  ..####..  .######.
; .##..##.  .#####..  .#####..  .######.
; .##..##.  .##.....  .##.....  .....##.
; .##..##.  .##.....  .##.....  ....###.
; .######.  .#####..  .#####..  ....##..
; .######.  .######.  .######.  ...###..
; .....##.  .....##.  .##..##.  ...##...
; .....##.  .##..##.  .##..##.  ..###...
; .....##.  .######.  .######.  ..##....
; .....##.  ..####..  ..####..  ..##....
;
; LARGE 8   LARGE 9
; 8x10      8x10
; ..####..  ..####..
; .######.  .######.
; .##..##.  .##..##.
; .##..##.  .##..##.
; ..####..  .######.
; .######.  ..#####.
; .##..##.  .....##.
; .##..##.  .....##.
; .######.  ..#####.
; ..####..  ..####..
```

```text
 4|3C B, 7E B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 3C B,
 5|18 B, 38 B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B, 3C B, 3C B,
 6|3C B, 7E B, 66 B, 06 B, 3E B, 7C B, 60 B, 60 B, 7E B, 7E B,
 7|3C B, 7E B, 66 B, 06 B, 1C B, 1E B, 06 B, 66 B, 7E B, 3C B,
 8|66 B, 66 B, 66 B, 66 B, 7E B, 7E B, 06 B, 06 B, 06 B, 06 B,
 9|7C B, 7C B, 60 B, 60 B, 7C B, 7E B, 06 B, 66 B, 7E B, 3C B,
10|3C B, 7C B, 60 B, 60 B, 7C B, 7E B, 66 B, 66 B, 7E B, 3C B,
11|7E B, 7E B, 06 B, 0E B, 0C B, 1C B, 18 B, 38 B, 30 B, 30 B,
12|3C B, 7E B, 66 B, 66 B, 3C B, 7E B, 66 B, 66 B, 7E B, 3C B,
13|3C B, 7E B, 66 B, 66 B, 7E B, 3E B, 06 B, 06 B, 3E B, 3C B,
```

**Line 14.** Continue the contiguous large-font table into 297.

```text
14|-->
```


<a id="block-297"></a>

### Block 297

Emit large-font capital letters A through M.


**Lines 0–1.** Document the glyph order; records continue the existing characters table without a new allocation header.

```text
 0|( CHARACTER PATTERN TABLE FOR DISPLAY )
 1|( A B C D E F G H I J K L M )
```

**Lines 2–14.** Each line emits the ten bitmap rows of its corresponding letter A–M.

```text
; LARGE A   LARGE B   LARGE C   LARGE D
; 8x10      8x10      8x10      8x10
; ...##...  .#####..  ..####..  .#####..
; ..####..  .######.  .######.  .######.
; .######.  .##..##.  .##..##.  .##..##.
; .##..##.  .##..##.  .##.....  .##..##.
; .##..##.  .#####..  .##.....  .##..##.
; .##..##.  .######.  .##.....  .##..##.
; .######.  .##..##.  .##.....  .##..##.
; .######.  .##..##.  .##..##.  .##..##.
; .##..##.  .######.  .######.  .######.
; .##..##.  .#####..  ..####..  .#####..
;
; LARGE E   LARGE F   LARGE G   LARGE H
; 8x10      8x10      8x10      8x10
; .######.  .######.  ..####..  .##..##.
; .######.  .######.  .######.  .##..##.
; .##.....  .##.....  .##.....  .##..##.
; .##.....  .##.....  .##.....  .##..##.
; .#####..  .#####..  .##.....  .######.
; .#####..  .#####..  .##.###.  .######.
; .##.....  .##.....  .##.###.  .##..##.
; .##.....  .##.....  .##..##.  .##..##.
; .######.  .##.....  .######.  .##..##.
; .######.  .##.....  ..####..  .##..##.
;
; LARGE I   LARGE J   LARGE K   LARGE L
; 8x10      8x10      8x10      8x10
; ..####..  .....##.  .##..##.  .##.....
; ..####..  .....##.  .##..##.  .##.....
; ...##...  .....##.  .##.##..  .##.....
; ...##...  .....##.  .#####..  .##.....
; ...##...  .....##.  .####...  .##.....
; ...##...  .....##.  .####...  .##.....
; ...##...  .##..##.  .##.##..  .##.....
; ...##...  .##..##.  .##.###.  .##.....
; ..####..  .######.  .##..##.  .######.
; ..####..  ..####..  .##..##.  .######.
;
; LARGE M
; 8x10
; ##....##
; ###..###
; ###..###
; ##.##.##
; ##.##.##
; ##....##
; ##....##
; ##....##
; ##....##
; ##....##
```

```text
 2|18 B, 3C B, 7E B, 66 B, 66 B, 66 B, 7E B, 7E B, 66 B, 66 B,
 3|7C B, 7E B, 66 B, 66 B, 7C B, 7E B, 66 B, 66 B, 7E B, 7C B,
 4|3C B, 7E B, 66 B, 60 B, 60 B, 60 B, 60 B, 66 B, 7E B, 3C B,
 5|7C B, 7E B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 7C B,
 6|7E B, 7E B, 60 B, 60 B, 7C B, 7C B, 60 B, 60 B, 7E B, 7E B,
 7|7E B, 7E B, 60 B, 60 B, 7C B, 7C B, 60 B, 60 B, 60 B, 60 B,
 8|3C B, 7E B, 60 B, 60 B, 60 B, 6E B, 6E B, 66 B, 7E B, 3C B,
 9|66 B, 66 B, 66 B, 66 B, 7E B, 7E B, 66 B, 66 B, 66 B, 66 B,
10|3C B, 3C B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B, 3C B, 3C B,
11|06 B, 06 B, 06 B, 06 B, 06 B, 06 B, 66 B, 66 B, 7E B, 3C B,
12|66 B, 66 B, 6C B, 7C B, 78 B, 78 B, 6C B, 6E B, 66 B, 66 B,
13|60 B, 60 B, 60 B, 60 B, 60 B, 60 B, 60 B, 60 B, 7E B, 7E B,
14|C3 B, E7 B, E7 B, DB B, DB B, C3 B, C3 B, C3 B, C3 B, C3 B,
```

**Line 15.** Continue the contiguous glyph table into 298.

```text
15|-->
```

<a id="block-298"></a>

### Block 298

Emit large-font capital letters N through Z.


**Lines 0–1.** Document the next thirteen glyphs in the existing characters table.

```text
 0|( CHARACTER PATTERN TABLE CONT. )
 1|( N O P Q R S T U V W X Y Z )
```

**Lines 2–14.** Each line emits the ten bitmap rows for N–Z in order.

```text
; LARGE N   LARGE O   LARGE P   LARGE Q
; 8x10      8x10      8x10      8x10
; .##..##.  ..####..  .#####..  ..####..
; .##..##.  .######.  .######.  .######.
; .###.##.  .##..##.  .##..##.  .##..##.
; .######.  .##..##.  .##..##.  .##..##.
; .######.  .##..##.  .######.  .##..##.
; .##.###.  .##..##.  .#####..  .##..##.
; .##..##.  .##..##.  .##.....  .##..##.
; .##..##.  .##..##.  .##.....  .##.###.
; .##..##.  .######.  .##.....  .##..#..
; .##..##.  ..####..  .##.....  ..###.#.
;
; LARGE R   LARGE S   LARGE T   LARGE U
; 8x10      8x10      8x10      8x10
; .#####..  ..####..  .######.  .##..##.
; .######.  .######.  .######.  .##..##.
; .##..##.  .##..##.  ...##...  .##..##.
; .##..##.  .##.....  ...##...  .##..##.
; .######.  .#####..  ...##...  .##..##.
; .#####..  ..#####.  ...##...  .##..##.
; .##.###.  .....##.  ...##...  .##..##.
; .##..##.  .##..##.  ...##...  .##..##.
; .##..##.  .######.  ...##...  .######.
; .##..##.  ..####..  ...##...  ..####..
;
; LARGE V   LARGE W   LARGE X   LARGE Y
; 8x10      8x10      8x10      8x10
; .##..##.  ##....##  .##..##.  .##..##.
; .##..##.  ##....##  .##..##.  .##..##.
; .##..##.  ##....##  .######.  .######.
; .##..##.  ##.##.##  ..####..  ..####..
; .##..##.  ##.##.##  ...##...  ...##...
; .######.  ##.##.##  ...##...  ...##...
; ..####..  ########  ..####..  ...##...
; ..####..  ###..###  .######.  ...##...
; ...##...  ##....##  .##..##.  ...##...
; ...##...  ##....##  .##..##.  ...##...
;
; LARGE Z
; 8x10
; .######.
; .######.
; .....##.
; ....###.
; ...###..
; ..###...
; .###....
; .##.....
; .######.
; .######.
```

```text
 2|66 B, 66 B, 76 B, 7E B, 7E B, 6E B, 66 B, 66 B, 66 B, 66 B,
 3|3C B, 7E B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 3C B,
 4|7C B, 7E B, 66 B, 66 B, 7E B, 7C B, 60 B, 60 B, 60 B, 60 B,
 5|3C B, 7E B, 66 B, 66 B, 66 B, 66 B, 66 B, 6E B, 64 B, 3A B,
 6|7C B, 7E B, 66 B, 66 B, 7E B, 7C B, 6E B, 66 B, 66 B, 66 B,
 7|3C B, 7E B, 66 B, 60 B, 7C B, 3E B, 06 B, 66 B, 7E B, 3C B,
 8|7E B, 7E B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B,
 9|66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 3C B,
10|66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 3C B, 3C B, 18 B, 18 B,
11|C3 B, C3 B, C3 B, DB B, DB B, DB B, FF B, E7 B, C3 B, C3 B,
12|66 B, 66 B, 7E B, 3C B, 18 B, 18 B, 3C B, 7E B, 66 B, 66 B,
13|66 B, 66 B, 7E B, 3C B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B,
14|7E B, 7E B, 06 B, 0E B, 1C B, 38 B, 70 B, 60 B, 7E B, 7E B,
```

**Line 15.** Continue to packed-small-font data.

```text
15|-->
```

<a id="block-299"></a>

### Block 299

Start smallfont as two-byte packed 3×5 glyph records.


**Lines 0–1.** Label smallfont and emit space. FONTUNPACK later turns each two-byte record into five display rows.

```text
; SMALL SPACE
; 3x5
; ...
; ...
; ...
; ...
; ...
```

```text
 0|( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
 1|BTABLE smallfont 00 B, 00 B, ( SPACE )
```

**Lines 2–14.** Emit the punctuation glyphs identified by each source comment, from exclamation through minus.

```text
; SMALL !  SMALL "  SMALL #  SMALL $
; 3x5      3x5      3x5      3x5
; .#.      #.#      #.#      .#.
; .#.      #.#      ###      ###
; .#.      ...      #.#      #..
; ...      ...      ###      ###
; .#.      ...      #.#      .#.
;
; SMALL %  SMALL &  SMALL '  SMALL (
; 3x5      3x5      3x5      3x5
; #..      ...      .#.      .#.
; ..#      ...      .#.      #..
; .#.      .#.      ...      #..
; #..      #.#      ...      #..
; ..#      #.#      ...      .#.
;
; SMALL )  SMALL *  SMALL +  SMALL ,
; 3x5      3x5      3x5      3x5
; .#.      ...      ...      ...
; ..#      #.#      .#.      ...
; ..#      .#.      ###      ...
; ..#      #.#      .#.      .#.
; .#.      ...      ...      #..
;
; SMALL -
; 3x5
; ...
; ...
; ###
; ...
; ...
```

```text
 2|  092 B, 020 B, ( ! )
 3|  02D B, 00 B, ( " )
 4|  07D B, 05F B, ( # )
 5|  03A B, 02F B, ( $ )
 6|  08C B, 018 B, ( % )
 7|  080 B, 05A B, ( & )
 8|  012 B, 00 B, ( ' )
 9|  022 B, 029 B, ( LEFT PAREN )
10|  04A B, 022 B, ( RIGHT PAREN )
11|  0A8 B, 0A B, ( * )
12|  0D0 B, 05 B, ( + )
13|  00 B, 044 B, ( , )
14|  0C0 B, 01 B, ( - )
```

**Line 15.** Emit the period glyph and continue the contiguous table.

```text
; SMALL .
; 3x5
; ...
; ...
; ...
; ...
; .#.
```

```text
15|  00 B, 020 B, ( . ) -->
```

<a id="block-300"></a>

### Block 300

Continue the packed-small-font table through slash, digits and comparison punctuation.


**Lines 0–11.** Emit slash followed by digits 0–9; the comments '00' and '01' label the zero and one glyphs.

```text
; SMALL /  SMALL 0  SMALL 1  SMALL 2
; 3x5      3x5      3x5      3x5
; ...      .#.      .#.      ###
; ..#      #.#      .#.      ..#
; .#.      #.#      .#.      ###
; #..      #.#      .#.      #..
; ...      .#.      .#.      ###
;
; SMALL 3  SMALL 4  SMALL 5  SMALL 6
; 3x5      3x5      3x5      3x5
; ###      #.#      ###      ###
; ..#      #.#      #..      #..
; .##      ###      ##.      ###
; ..#      ..#      ..#      #.#
; ###      ..#      ##.      ###
;
; SMALL 7  SMALL 8  SMALL 9
; 3x5      3x5      3x5
; ###      ###      ###
; ..#      #.#      #.#
; .#.      ###      ###
; .#.      #.#      ..#
; .#.      ###      ###
```

```text
 0|( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
 1|  088 B, 08 B, ( / )
 2|  06A B, 02B B, ( 00 )
 3|  092 B, 024 B, ( 01 )
 4|  0CF B, 079 B, ( 2 )
 5|  0CF B, 072 B, ( 3 )
 6|  0ED B, 013 B, ( 4 )
 7|  0A7 B, 063 B, ( 5 )
 8|  0E7 B, 07B B, ( 6 )
 9|  08F B, 024 B, ( 7 )
10|  0EF B, 07B B, ( 8 )
11|  0EF B, 073 B, ( 9 )
```

**Lines 12–15.** Emit colon, semicolon, less-than and equals, then continue.

```text
; SMALL :  SMALL ;  SMALL <  SMALL =
; 3x5      3x5      3x5      3x5
; ...      ...      ..#      ...
; .#.      .#.      .#.      ###
; ...      ...      #..      ...
; .#.      .#.      .#.      ###
; ...      #..      ..#      ...
```

```text
12|  010 B, 04 B, ( : )
13|  010 B, 044 B, ( ; )
14|  011 B, 015 B, ( < )
15|  038 B, 0E B, ( = ) -->
```

<a id="block-301"></a>

### Block 301

Continue packed-small-font punctuation and letters A through L.


**Lines 0–3.** Emit greater-than, question mark and at-sign records.

```text
; SMALL >  SMALL ?  SMALL @
; 3x5      3x5      3x5
; #..      ###      ###
; .#.      ..#      #.#
; ..#      .#.      ###
; .#.      ...      #..
; #..      .#.      ##.
```

```text
 0|( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
 1|  054 B, 044 B, ( > )
 2|  08F B, 020 B, ( ? )
 3|  0EF B, 069 B, ( @ )
```

**Lines 4–15.** Emit A–L as two bytes per glyph and continue.

```text
; SMALL A  SMALL B  SMALL C  SMALL D
; 3x5      3x5      3x5      3x5
; ###      ###      ###      ##.
; #.#      #.#      #..      #.#
; ###      ##.      #..      #.#
; #.#      #.#      #..      #.#
; #.#      ###      ###      ##.
;
; SMALL E  SMALL F  SMALL G  SMALL H
; 3x5      3x5      3x5      3x5
; ###      ###      ###      #.#
; #..      #..      #..      #.#
; ##.      ##.      #.#      ###
; #..      #..      #.#      #.#
; ###      #..      ###      #.#
;
; SMALL I  SMALL J  SMALL K  SMALL L
; 3x5      3x5      3x5      3x5
; ###      ..#      #.#      #..
; .#.      ..#      #.#      #..
; .#.      ..#      ##.      #..
; .#.      #.#      #.#      #..
; ###      ###      #.#      ###
```

```text
 4|  0EF B, 05B B, ( A )
 5|  0AF B, 07B B, ( B )
 6|  027 B, 079 B, ( C )
 7|  06E B, 06B B, ( D )
 8|  0A7 B, 079 B, ( E )
 9|  0A7 B, 049 B, ( F )
10|  067 B, 07B B, ( G )
11|  0ED B, 05B B, ( H )
12|  097 B, 074 B, ( I )
13|  049 B, 07A B, ( J )
14|  0AD B, 05B B, ( K )
15|  024 B, 079 B, ( L ) -->
```

<a id="block-302"></a>

### Block 302

Continue packed-small-font letters M through Z.


**Lines 0–14.** Emit one two-byte packed record per letter M–Z in source order.

```text
; SMALL M  SMALL N  SMALL O  SMALL P
; 3x5      3x5      3x5      3x5
; #.#      ##.      ###      ###
; ###      #.#      #.#      #.#
; ###      #.#      #.#      ###
; #.#      #.#      #.#      #..
; #.#      #.#      ###      #..
;
; SMALL Q  SMALL R  SMALL S  SMALL T
; 3x5      3x5      3x5      3x5
; ###      ##.      ###      ###
; #.#      #.#      #..      .#.
; #.#      ##.      ###      .#.
; ###      #.#      ..#      .#.
; ..#      #.#      ###      .#.
;
; SMALL U  SMALL V  SMALL W  SMALL X
; 3x5      3x5      3x5      3x5
; #.#      #.#      #.#      #.#
; #.#      #.#      #.#      #.#
; #.#      #.#      ###      .#.
; #.#      #.#      ###      #.#
; ###      .#.      #.#      #.#
;
; SMALL Y  SMALL Z
; 3x5      3x5
; #.#      ###
; #.#      ..#
; .#.      .#.
; .#.      #..
; .#.      ###
```

```text
 0|( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
 1|  0FD B, 05B B, ( M )
 2|  06E B, 05B B, ( N )
 3|  06F B, 07B B, ( O )
 4|  0EF B, 049 B, ( P )
 5|  06F B, 01F B, ( Q )
 6|  0AE B, 05B B, ( R )
 7|  0E7 B, 073 B, ( S )
 8|  097 B, 024 B, ( T )
 9|  06D B, 07B B, ( U )
10|  06D B, 02B B, ( V )
11|  0ED B, 05F B, ( W )
12|  0AD B, 05A B, ( X )
13|  0AD B, 024 B, ( Y )
14|  08F B, 078 B, ( Z )
```

**Line 15.** Continue into the last smallfont screen.

```text
15|-->
```

<a id="block-303"></a>

### Block 303

Finish the packed-small-font table and the video support load chain.


**Lines 0–5.** Emit left bracket, backslash, right bracket, caret and the glyph labeled RIGHT. 

```text
; SMALL [  SMALL \  SMALL ]  SMALL ^
; 3x5      3x5      3x5      3x5
; ##.      ...      .##      .#.
; #..      #..      ..#      ###
; #..      .#.      ..#      .#.
; #..      ..#      ..#      .#.
; ##.      ...      .##      .#.
;
; SMALL RIGHT
; 3x5
; ..#
; .#.
; ###
; .#.
; ..#
```

```text
 0|( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
 1|  026 B, 069 B, ( [ )
 2|  0A0 B, 02 B, ( BACK SLASH )
 3|  04B B, 032 B, ( ] )
 4|  0BA B, 024 B, ( ^ )
 5|  0D1 B, 015 B, ( RIGHT )
```

**Line 6.** Restore the saved radix and stop loading.

```text
 6|BASE! ;S
```


<a id="block-304"></a>

### Block 304

Define compact game-source shorthands and bind a shared increment-byte primitive.

**Lines 0–2.** S! swaps the value/address before cell store; SB! does the same for byte store.

```text
 0|( system verbs )
 1|( Unused 1-B! omitted to fit the released infield )
 2|: S! SWAP ! ; : SB! SWAP B! ;
```

**Lines 3–5.** Define zero-initialized cell/byte variable emitters V=/BV=, constant and forward shorthands C=/F=, and the deliberately spelled label alias LABLE for DATA.

```text
 3|{ : V= } 0 VARIABLE { ; } { : BV= } 0 BVARIABLE { ; }
 4|{ : C= } CONSTANT { ; } { : F= } FORWARD { ; }
 5|{ : LABLE } DATA { ; }
```

**Lines 6–7.** EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. DTC selects decimal and invokes the host editor.

```text
 6|CODE EIDI EI, DI, NEXT
 7|{ : DTC } DECIMAL EDIT { ; }
```

**Lines 9–10.** Preserve radix/ROMHERE while binding 1+B! to native entry $F2, then restore both and finish loading.

```text
 9|BASE@ HEX ROMHERE @ 0F2 ROMHERE ! CODE 1+B! ROMHERE !
10|BASE! ;S
```


<a id="block-305"></a>

### Block 305

Provide credit-continuation prompts, input-interruptible waits and the first-player greeting.

**Lines 0–5.** Define one-coin and switch-dependent two-coin prompts using SPOST.

```text
 0|( BB sentry string routines DPCN CHKGMCNT ) HEX
 1|: DP1CN 400 2800 828 A" DEPOSIT 1 COIN TO CONTINUE THIS GAME"
 2|  SPOST ;
 3|: DP12CN CNSW1 B@ IF 300 2800 828
 4|  A" DEPOSIT 2 COINS TO CONTINUE THIS GAME" SPOST
 5|  ELSE DP1CN THEN ;
```

**Lines 6–8.** DPCN clears credits, performs two waits while displaying the prompt, clears GAMEOVER if a credit arrived or updates LINN/UPCRED otherwise, then increments CREDITS as the source explicitly specifies.

```text
 6|: DPCN ( wait for next coin )
 7|  DP1CN CREDITS BZERO FF TWAIT FF TWAIT DP1CN CREDITS B@ IF
 8| GAMEOVER BZERO ELSE LINN BZERO UPCRED BONE THEN CREDITS 1+B! ;
```

**Line 9.** CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte.

```text
 9|: CHKGMCNT DP12CN C0 TWAIT DP12CN CREDITS B@ ;
```

**Lines 10–12.** INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.

```text
10|: INSWAIT EI BEGIN FF 0 DO LOOP
11| 14 INP 33 AND 33 < IF DROP 1 INSOUT BONE THEN
12| 1- DUP 0= END DROP DI ;
```

**Lines 13–15.** YOU1ST posts the greeting/extra-inning challenge, then continues to 306.

```text
13|: YOU1ST 1A00 1000 828 A" YOU ARE UP 1ST" SPOST 0F00 3000 828
14| A" BEAT ME FOR EXTRA INNING" SPOST 1F00 5000 828
15| A" GOOD LUCK" SPOST ; -->
```

<a id="block-306"></a>

### Block 306

Cycle through pitch/bat instructions until a button is pressed.

**Lines 0–6.** Clear INSOUT, fill the screen and post pitch-button/trackball/outfielder instructions.

```text
 0|( BB sentry string routines INSTRC )
 1|: INSTRC ( instructions )
 2| INSOUT BZERO BEGIN
 3| FLFILL 2300 1000 828 A" PITCH" SPOST 700 4000 828
 4| A" PRESS PITCH BUTTON TO START PITCH" SPOST 0F00 6000 828
 5| A" ROLLERBALL CONTROLS PITCH" SPOST 6000 8000 828
 6| A" ROLLERBALL MOVES OUTFIELDERS" SPOST
```

**Lines 7–10.** Wait for input; if none arrives, show the batting and runner-advance instructions.

```text
 7| 80 INSWAIT INSOUT B@ IF ELSE
 8| FLFILL 2300 1000 828 A" BAT" SPOST B00 4000 828
 9| A" PRESS BAT BUTTON TO SWING BAT" SPOST 500 6000 828
10| A" HOLD BUTTON DOWN TO ADVANCE RUNNERS" SPOST
```

**Lines 11–13.** Wait again, then show the start prompt if still idle. Repeat the whole sequence until INSOUT is nonzero.

```text
11| 60 INSWAIT INSOUT B@ IF ELSE
12| FLFILL 6000 2800 828 A" PRESS ANY BUTTON TO START GAME" SPOST
13| 30 INSWAIT THEN THEN INSOUT B@ END ;
```

**Line 14.** Select decimal and finish the instruction string chain.

```text
14|DECIMAL ;S
```


## Sorted dictionary of words used in the source

Entries cover TERSE words, constants, variables, tables, assembler labels and emitters, register operands, source-control symbols and filenames. Strings, comment prose, dotted binary displays and ordinary number literals are excluded. The explicitly defined target names `0` and `1` are included; their usage references also include indistinguishable literal spellings. Hexadecimal A–E register spellings can likewise occur as numeric operands.

Entries are sorted by case-insensitive spelling, with exact spelling as a tie-breaker. **Case is preserved**: this listing deliberately contains names such as `cpost`/`CPOST`, `write`/`WRITE` and `cnline`/`CNLINE` with different roles. Context/vocabulary also matters when the same exact spelling is rebound; all declaration locations are listed. 

**Declared** gives every definition, forward declaration or binding as `block:line`. **Used in blocks** includes declarations and other lexical references, including retained checkpoint lines after `-->`/`;S`; it does not imply every reference is executed. A forward-only entry is identified as unresolved in the source. Native kernel bindings identify the entry addresses used by the compiler. For high-level words, a short token-form definition excerpt is included when useful; comments/string payloads are omitted from that excerpt, so consult the linked numbered source for the complete original definition.


**Dictionary entries: 1,267.**

### Dictionary: Symbols

**`!`** — Store a cell at an address; target binding at $00A1.

Declared: [87:7](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [89](#block-89), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [101](#block-101), [102](#block-102), [128](#block-128), [130](#block-130), [131](#block-131), [133](#block-133), [140](#block-140), [149](#block-149), [153](#block-153), [154](#block-154), [157](#block-157), [158](#block-158), [162](#block-162), [169](#block-169), [211](#block-211), [212](#block-212), [213](#block-213), [239](#block-239), [271](#block-271), [274](#block-274), [276](#block-276), [280](#block-280), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304).

**`#A0`** — Music period-byte constant #A0, assigned hexadecimal E1; consumed by the music command emitters.

Declared: [142:1](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#A1`** — Music period-byte constant #A1, assigned hexadecimal 70; consumed by the music command emitters.

Declared: [142:3](#block-142) (constant).

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [142](#block-142).

**`#A2`** — Music period-byte constant #A2, assigned hexadecimal 37; consumed by the music command emitters.

Declared: [142:6](#block-142) (constant).

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [140](#block-140), [142](#block-142).

**`#A3`** — Music period-byte constant #A3, assigned hexadecimal 1B; consumed by the music command emitters.

Declared: [142:8](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#A4`** — Music period-byte constant #A4, assigned hexadecimal 0D; consumed by the music command emitters.

Declared: [142:11](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#A5`** — Music period-byte constant #A5, assigned hexadecimal 06; consumed by the music command emitters.

Declared: [142:12](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#AS0`** — Music period-byte constant #AS0, assigned hexadecimal D4; consumed by the music command emitters.

Declared: [142:1](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#AS1`** — Music period-byte constant #AS1, assigned hexadecimal 6A; consumed by the music command emitters.

Declared: [142:4](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#AS2`** — Music period-byte constant #AS2, assigned hexadecimal 34; consumed by the music command emitters.

Declared: [142:6](#block-142) (constant).

Used in blocks: [134](#block-134), [142](#block-142).

**`#AS3`** — Music period-byte constant #AS3, assigned hexadecimal 1A; consumed by the music command emitters.

Declared: [142:8](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#B0`** — Music period-byte constant #B0, assigned hexadecimal C8; consumed by the music command emitters.

Declared: [142:1](#block-142) (constant).

Used in blocks: [136](#block-136), [140](#block-140), [142](#block-142).

**`#B1`** — Music period-byte constant #B1, assigned hexadecimal 64; consumed by the music command emitters.

Declared: [142:4](#block-142) (constant).

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [142](#block-142).

**`#B2`** — Music period-byte constant #B2, assigned hexadecimal 31; consumed by the music command emitters.

Declared: [142:6](#block-142) (constant).

Used in blocks: [140](#block-140), [142](#block-142).

**`#B3`** — Music period-byte constant #B3, assigned hexadecimal 18; consumed by the music command emitters.

Declared: [142:9](#block-142) (constant).

Used in blocks: [134](#block-134), [142](#block-142).

**`#C1`** — Music period-byte constant #C1, assigned hexadecimal BD; consumed by the music command emitters.

Declared: [142:2](#block-142) (constant).

Used in blocks: [136](#block-136), [142](#block-142).

**`#C2`** — Music period-byte constant #C2, assigned hexadecimal 5E; consumed by the music command emitters.

Declared: [142:4](#block-142) (constant).

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [142](#block-142).

**`#C3`** — Music period-byte constant #C3, assigned hexadecimal 2E; consumed by the music command emitters.

Declared: [142:6](#block-142) (constant).

Used in blocks: [134](#block-134), [136](#block-136), [140](#block-140), [142](#block-142).

**`#C4`** — Music period-byte constant #C4, assigned hexadecimal 17; consumed by the music command emitters.

Declared: [142:9](#block-142) (constant).

Used in blocks: [134](#block-134), [142](#block-142).

**`#C5`** — Music period-byte constant #C5, assigned hexadecimal 0B; consumed by the music command emitters.

Declared: [142:11](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#C6`** — Music period-byte constant #C6, assigned hexadecimal 05; consumed by the music command emitters.

Declared: [142:12](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#C7`** — Music period-byte constant #C7, assigned hexadecimal 02; consumed by the music command emitters.

Declared: [142:13](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#CS1`** — Music period-byte constant #CS1, assigned hexadecimal B2; consumed by the music command emitters.

Declared: [142:2](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#CS2`** — Music period-byte constant #CS2, assigned hexadecimal 59; consumed by the music command emitters.

Declared: [142:4](#block-142) (constant).

Used in blocks: [136](#block-136), [142](#block-142).

**`#CS3`** — Music period-byte constant #CS3, assigned hexadecimal 2C; consumed by the music command emitters.

Declared: [142:7](#block-142) (constant).

Used in blocks: [134](#block-134), [142](#block-142).

**`#CS4`** — Music period-byte constant #CS4, assigned hexadecimal 15; consumed by the music command emitters.

Declared: [142:9](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#CS5`** — Music period-byte constant #CS5, assigned hexadecimal 0A; consumed by the music command emitters.

Declared: [142:11](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#D1`** — Music period-byte constant #D1, assigned hexadecimal A8; consumed by the music command emitters.

Declared: [142:2](#block-142) (constant).

Used in blocks: [135](#block-135), [136](#block-136), [142](#block-142).

**`#D2`** — Music period-byte constant #D2, assigned hexadecimal 54; consumed by the music command emitters.

Declared: [142:4](#block-142) (constant).

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [142](#block-142).

**`#D3`** — Music period-byte constant #D3, assigned hexadecimal 29; consumed by the music command emitters.

Declared: [142:7](#block-142) (constant).

Used in blocks: [140](#block-140), [142](#block-142).

**`#D4`** — Music period-byte constant #D4, assigned hexadecimal 14; consumed by the music command emitters.

Declared: [142:9](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#DS1`** — Music period-byte constant #DS1, assigned hexadecimal 9F; consumed by the music command emitters.

Declared: [142:2](#block-142) (constant).

Used in blocks: [136](#block-136), [142](#block-142).

**`#DS2`** — Music period-byte constant #DS2, assigned hexadecimal 4F; consumed by the music command emitters.

Declared: [142:5](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#DS3`** — Music period-byte constant #DS3, assigned hexadecimal 27; consumed by the music command emitters.

Declared: [142:7](#block-142) (constant).

Used in blocks: [134](#block-134), [142](#block-142).

**`#DS4`** — Music period-byte constant #DS4, assigned hexadecimal 13; consumed by the music command emitters.

Declared: [142:9](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#DS5`** — Music period-byte constant #DS5, assigned hexadecimal 09; consumed by the music command emitters.

Declared: [142:11](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#DS6`** — Music period-byte constant #DS6, assigned hexadecimal 04; consumed by the music command emitters.

Declared: [142:12](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#E1`** — Music period-byte constant #E1, assigned hexadecimal 96; consumed by the music command emitters.

Declared: [142:2](#block-142) (constant).

Used in blocks: [135](#block-135), [136](#block-136), [140](#block-140), [142](#block-142).

**`#E2`** — Music period-byte constant #E2, assigned hexadecimal 4A; consumed by the music command emitters.

Declared: [142:5](#block-142) (constant).

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [142](#block-142).

**`#E3`** — Music period-byte constant #E3, assigned hexadecimal 25; consumed by the music command emitters.

Declared: [142:7](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#E4`** — Music period-byte constant #E4, assigned hexadecimal 12; consumed by the music command emitters.

Declared: [142:10](#block-142) (constant).

Used in blocks: [135](#block-135), [142](#block-142).

**`#F1`** — Music period-byte constant #F1, assigned hexadecimal 8D; consumed by the music command emitters.

Declared: [142:3](#block-142) (constant).

Used in blocks: [135](#block-135), [136](#block-136), [140](#block-140), [142](#block-142).

**`#F2`** — Music period-byte constant #F2, assigned hexadecimal 46; consumed by the music command emitters.

Declared: [142:5](#block-142) (constant).

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [140](#block-140), [142](#block-142).

**`#F3`** — Music period-byte constant #F3, assigned hexadecimal 22; consumed by the music command emitters.

Declared: [142:7](#block-142) (constant).

Used in blocks: [134](#block-134), [142](#block-142).

**`#F4`** — Music period-byte constant #F4, assigned hexadecimal 11; consumed by the music command emitters.

Declared: [142:10](#block-142) (constant).

Used in blocks: [135](#block-135), [142](#block-142).

**`#F5`** — Music period-byte constant #F5, assigned hexadecimal 08; consumed by the music command emitters.

Declared: [142:11](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#FS1`** — Music period-byte constant #FS1, assigned hexadecimal 85; consumed by the music command emitters.

Declared: [142:3](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#FS2`** — Music period-byte constant #FS2, assigned hexadecimal 42; consumed by the music command emitters.

Declared: [142:5](#block-142) (constant).

Used in blocks: [134](#block-134), [136](#block-136), [138](#block-138), [142](#block-142).

**`#FS3`** — Music period-byte constant #FS3, assigned hexadecimal 20; consumed by the music command emitters.

Declared: [142:8](#block-142) (constant).

Used in blocks: [134](#block-134), [142](#block-142).

**`#FS4`** — Music period-byte constant #FS4, assigned hexadecimal 10; consumed by the music command emitters.

Declared: [142:10](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#G0`** — Music period-byte constant #G0, assigned hexadecimal FD; consumed by the music command emitters.

Declared: [142:1](#block-142) (constant).

Used in blocks: [136](#block-136), [140](#block-140), [142](#block-142).

**`#G1`** — Music period-byte constant #G1, assigned hexadecimal 7E; consumed by the music command emitters.

Declared: [142:3](#block-142) (constant).

Used in blocks: [135](#block-135), [136](#block-136), [138](#block-138), [142](#block-142).

**`#G2`** — Music period-byte constant #G2, assigned hexadecimal 3E; consumed by the music command emitters.

Declared: [142:5](#block-142) (constant).

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [140](#block-140), [142](#block-142).

**`#G3`** — Music period-byte constant #G3, assigned hexadecimal 1F; consumed by the music command emitters.

Declared: [142:8](#block-142) (constant).

Used in blocks: [140](#block-140), [142](#block-142).

**`#G4`** — Music period-byte constant #G4, assigned hexadecimal 0F; consumed by the music command emitters.

Declared: [142:10](#block-142) (constant).

Used in blocks: [135](#block-135), [142](#block-142).

**`#G5`** — Music period-byte constant #G5, assigned hexadecimal 07; consumed by the music command emitters.

Declared: [142:12](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#G6`** — Music period-byte constant #G6, assigned hexadecimal 03; consumed by the music command emitters.

Declared: [142:12](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#G7`** — Music period-byte constant #G7, assigned hexadecimal 01; consumed by the music command emitters.

Declared: [142:13](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#G8`** — Music period-byte constant #G8, assigned hexadecimal 00; consumed by the music command emitters.

Declared: [142:13](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#GS0`** — Music period-byte constant #GS0, assigned hexadecimal EE; consumed by the music command emitters.

Declared: [142:1](#block-142) (constant).

Used in blocks: [142](#block-142).

**`#GS1`** — Music period-byte constant #GS1, assigned hexadecimal 77; consumed by the music command emitters.

Declared: [142:3](#block-142) (constant).

Used in blocks: [140](#block-140), [142](#block-142).

**`#GS2`** — Music period-byte constant #GS2, assigned hexadecimal 3B; consumed by the music command emitters.

Declared: [142:6](#block-142) (constant).

Used in blocks: [138](#block-138), [142](#block-142).

**`#GS3`** — Music period-byte constant #GS3, assigned hexadecimal 1D; consumed by the music command emitters.

Declared: [142:8](#block-142) (constant).

Used in blocks: [134](#block-134), [142](#block-142).

**`#GS4`** — Music period-byte constant #GS4, assigned hexadecimal 0E; consumed by the music command emitters.

Declared: [142:10](#block-142) (constant).

Used in blocks: [142](#block-142).

**`'`** — Tick: obtain an execution/definition address in the current vocabulary context.

Used in blocks: [10](#block-10), [34](#block-34), [97](#block-97), [101](#block-101), [117](#block-117), [118](#block-118), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [126](#block-126), [127](#block-127), [132](#block-132), [156](#block-156), [159](#block-159), [164](#block-164), [167](#block-167), [171](#block-171), [173](#block-173), [174](#block-174), [175](#block-175), [176](#block-176), [183](#block-183), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [240](#block-240), [253](#block-253), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [263](#block-263), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [291](#block-291).

**`(`** — Open a comment, which consumes source through the next closing parenthesis.

Used in blocks: [10](#block-10), [33](#block-33), [34](#block-34), [35](#block-35), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [103](#block-103), [104](#block-104), [105](#block-105), [106](#block-106), [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [113](#block-113), [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [121](#block-121), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [132](#block-132), [133](#block-133), [134](#block-134), [135](#block-135), [136](#block-136), [137](#block-137), [138](#block-138), [139](#block-139), [140](#block-140), [141](#block-141), [142](#block-142), [143](#block-143), [144](#block-144), [145](#block-145), [146](#block-146), [147](#block-147), [148](#block-148), [149](#block-149), [150](#block-150), [151](#block-151), [152](#block-152), [153](#block-153), [154](#block-154), [155](#block-155), [156](#block-156), [157](#block-157), [158](#block-158), [159](#block-159), [160](#block-160), [161](#block-161), [162](#block-162), [163](#block-163), [164](#block-164), [165](#block-165), [166](#block-166), [167](#block-167), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [173](#block-173), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [178](#block-178), [179](#block-179), [180](#block-180), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [186](#block-186), [187](#block-187), [188](#block-188), [189](#block-189), [190](#block-190), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [207](#block-207), [208](#block-208), [211](#block-211), [212](#block-212), [213](#block-213), [214](#block-214), [215](#block-215), [216](#block-216), [225](#block-225), [226](#block-226), [227](#block-227), [228](#block-228), [229](#block-229), [230](#block-230), [231](#block-231), [232](#block-232), [233](#block-233), [234](#block-234), [235](#block-235), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [240](#block-240), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [248](#block-248), [249](#block-249), [250](#block-250), [251](#block-251), [252](#block-252), [253](#block-253), [254](#block-254), [255](#block-255), [256](#block-256), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [269](#block-269), [270](#block-270), [271](#block-271), [272](#block-272), [273](#block-273), [274](#block-274), [275](#block-275), [276](#block-276), [277](#block-277), [278](#block-278), [279](#block-279), [280](#block-280), [281](#block-281), [282](#block-282), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288), [289](#block-289), [290](#block-290), [291](#block-291), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [296](#block-296), [297](#block-297), [298](#block-298), [299](#block-299), [300](#block-300), [301](#block-301), [302](#block-302), [303](#block-303), [304](#block-304), [305](#block-305), [306](#block-306).

**`)`** — Close a parenthesized comment; not an executed dictionary lookup.

Delimiter consumed while parsing comments; closing occurrences are not counted as word lookups.

**`*`** — Multiply two stack values.

Used in blocks: [10](#block-10), [101](#block-101).

**`+`** — Add two stack values.

Declared: [87:10](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [87](#block-87), [98](#block-98), [99](#block-99), [101](#block-101), [121](#block-121), [130](#block-130), [161](#block-161), [181](#block-181), [212](#block-212), [213](#block-213), [233](#block-233), [248](#block-248), [249](#block-249), [272](#block-272).

**`+!`** — Add a value to the cell at the address (host use in VPTR alignment).

Used in blocks: [291](#block-291).

**`+LOOP`** — Native word / kernel binding. Declare loop labels and assemble +LOOP: pop the increment, update the IX loop index, compare against its limit and use sign/parity flag tests to choose repeat versus completion. Continue its body in 277.

Declared: [276:10](#block-276) (native word / kernel binding).

Used in blocks: [276](#block-276).

**`,`** — Emit one cell in the current host/target data context; object-specific writes also use O,.

Used in blocks: [98](#block-98), [114](#block-114), [122](#block-122), [141](#block-141), [154](#block-154), [156](#block-156), [158](#block-158), [163](#block-163), [166](#block-166), [171](#block-171), [183](#block-183), [186](#block-186), [187](#block-187), [188](#block-188), [189](#block-189), [190](#block-190), [199](#block-199), [225](#block-225), [253](#block-253), [258](#block-258), [259](#block-259), [264](#block-264), [280](#block-280), [291](#block-291).

**`-`** — Subtract the top value from the preceding value.

Declared: [87:11](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [87](#block-87), [101](#block-101), [123](#block-123), [130](#block-130), [169](#block-169), [236](#block-236).

**`-->`** — Continue source loading on the following screen. It is not a Z80 instruction or a game reset vector.

Used in blocks: [9](#block-9), [102](#block-102), [103](#block-103), [104](#block-104), [105](#block-105), [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [121](#block-121), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [132](#block-132), [134](#block-134), [135](#block-135), [136](#block-136), [137](#block-137), [138](#block-138), [139](#block-139), [141](#block-141), [142](#block-142), [143](#block-143), [144](#block-144), [147](#block-147), [148](#block-148), [149](#block-149), [150](#block-150), [151](#block-151), [153](#block-153), [154](#block-154), [155](#block-155), [156](#block-156), [157](#block-157), [158](#block-158), [159](#block-159), [160](#block-160), [161](#block-161), [163](#block-163), [164](#block-164), [165](#block-165), [166](#block-166), [168](#block-168), [170](#block-170), [174](#block-174), [175](#block-175), [176](#block-176), [178](#block-178), [179](#block-179), [180](#block-180), [181](#block-181), [182](#block-182), [183](#block-183), [186](#block-186), [187](#block-187), [188](#block-188), [190](#block-190), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [211](#block-211), [212](#block-212), [213](#block-213), [225](#block-225), [226](#block-226), [227](#block-227), [228](#block-228), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [235](#block-235), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [248](#block-248), [249](#block-249), [251](#block-251), [253](#block-253), [254](#block-254), [255](#block-255), [256](#block-256), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [270](#block-270), [271](#block-271), [273](#block-273), [274](#block-274), [276](#block-276), [278](#block-278), [280](#block-280), [281](#block-281), [282](#block-282), [283](#block-283), [284](#block-284), [286](#block-286), [287](#block-287), [290](#block-290), [291](#block-291), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [296](#block-296), [297](#block-297), [298](#block-298), [299](#block-299), [300](#block-300), [301](#block-301), [302](#block-302), [305](#block-305).

**`.`** — Print a stack number using the current numeric base.

Used in blocks: [102](#block-102), [104](#block-104), [105](#block-105), [106](#block-106).

**`."`** — Parse a quoted string for host progress/banner output; the string's contents are not TERSE words.

Used in blocks: [10](#block-10), [102](#block-102), [103](#block-103), [104](#block-104), [105](#block-105), [106](#block-106), [149](#block-149), [216](#block-216).

**`.dp`** — Cell variable. Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

Declared: [10:6](#block-10) (cell variable).

Used in blocks: [10](#block-10).

**`.eot`** — Constant .eot, assigned source expression/value `HERE` (use the defining screen’s radix). Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

Declared: [10:3](#block-10) (constant).

Used in blocks: [10](#block-10).

**`.h`** — Cell variable. Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

Declared: [10:5](#block-10) (cell variable).

Used in blocks: [10](#block-10).

**`.la`** — Cell variable. Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

Declared: [10:6](#block-10) (cell variable).

Used in blocks: [10](#block-10).

**`.NOPS`** — Disable/leave the assembler opcode lookup context before loading high-level game source.

Used in blocks: [33](#block-33), [94](#block-94).

**`.o`** — Cell variable. Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

Declared: [10:4](#block-10) (cell variable).

Used in blocks: [10](#block-10).

**`.OPS`** — Enable/select the assembler opcode lookup context in the saved XC system.

Used in blocks: [33](#block-33), [34](#block-34), [94](#block-94), [97](#block-97), [99](#block-99), [100](#block-100), [101](#block-101).

**`.rvdl`** — Definition. Restore VPTR, DP and LAST from the saved values.

Declared: [10:11](#block-10) (definition).

Definition tokens: `: .rvdl .vp @ VPTR ! .dp @ DP ! .la @ LAST ! ;`.

Used in blocks: [10](#block-10).

**`.svars`** — Constant .svars, assigned source expression/value `-` (use the defining screen’s radix). Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

Declared: [10:7](#block-10) (constant).

Used in blocks: [10](#block-10).

**`.t`** — Cell variable. Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

Declared: [10:4](#block-10) (cell variable).

Used in blocks: [10](#block-10).

**`.vp`** — Cell variable. Record the end of root TERSE, allocate saved image-size and dictionary-pointer variables, and derive the saved-system-variable destination `.svars`. The comments describe the three image regions; the variables hold image-reload metadata.

Declared: [10:6](#block-10) (cell variable).

Used in blocks: [10](#block-10).

**`/`** — Divide the preceding stack value by the top value.

Used in blocks: [174](#block-174).

### Dictionary: 0–9

**`0`** — Target constant with value zero; ordinary source numeric literals share this spelling.

Declared: [86:13](#block-86) (constant).

Used in blocks: [10](#block-10), [86](#block-86), [94](#block-94), [98](#block-98), [99](#block-99), [100](#block-100), [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [113](#block-113), [120](#block-120), [121](#block-121), [124](#block-124), [128](#block-128), [132](#block-132), [133](#block-133), [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141), [143](#block-143), [145](#block-145), [146](#block-146), [147](#block-147), [148](#block-148), [154](#block-154), [155](#block-155), [156](#block-156), [160](#block-160), [162](#block-162), [168](#block-168), [169](#block-169), [173](#block-173), [174](#block-174), [177](#block-177), [181](#block-181), [184](#block-184), [198](#block-198), [207](#block-207), [208](#block-208), [212](#block-212), [213](#block-213), [225](#block-225), [226](#block-226), [227](#block-227), [228](#block-228), [229](#block-229), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [238](#block-238), [239](#block-239), [241](#block-241), [242](#block-242), [244](#block-244), [247](#block-247), [253](#block-253), [255](#block-255), [260](#block-260), [262](#block-262), [269](#block-269), [270](#block-270), [271](#block-271), [273](#block-273), [274](#block-274), [276](#block-276), [279](#block-279), [280](#block-280), [283](#block-283), [284](#block-284), [291](#block-291), [293](#block-293), [304](#block-304), [305](#block-305).

**`0<>,`** — Assembler nonzero-condition selector.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [119](#block-119), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [159](#block-159), [166](#block-166), [173](#block-173), [174](#block-174), [177](#block-177), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [198](#block-198), [201](#block-201), [202](#block-202), [231](#block-231), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [247](#block-247), [254](#block-254), [257](#block-257), [259](#block-259), [262](#block-262), [263](#block-263), [266](#block-266), [267](#block-267), [268](#block-268), [269](#block-269), [279](#block-279), [285](#block-285), [288](#block-288).

**`0=`** — Return a condition indicating zero.

Declared: [88:11](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [98](#block-98), [101](#block-101), [236](#block-236), [239](#block-239), [272](#block-272), [305](#block-305).

**`0=,`** — Assembler zero-condition selector for structured IF,/END, emission.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [124](#block-124), [126](#block-126), [145](#block-145), [160](#block-160), [165](#block-165), [176](#block-176), [177](#block-177), [194](#block-194), [195](#block-195), [202](#block-202), [203](#block-203), [207](#block-207), [208](#block-208), [233](#block-233), [236](#block-236), [237](#block-237), [239](#block-239), [241](#block-241), [243](#block-243), [246](#block-246), [257](#block-257), [260](#block-260), [261](#block-261), [262](#block-262), [264](#block-264), [266](#block-266), [269](#block-269), [286](#block-286), [287](#block-287), [288](#block-288).

**`0>=,`** — Assembler nonnegative/sign-condition selector.

Used in blocks: [177](#block-177).

**`1`** — Target constant with value one; ordinary source numeric literals share this spelling.

Declared: [86:14](#block-86) (constant).

Used in blocks: [10](#block-10), [34](#block-34), [35](#block-35), [86](#block-86), [101](#block-101), [107](#block-107), [108](#block-108), [110](#block-110), [111](#block-111), [112](#block-112), [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [120](#block-120), [121](#block-121), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [128](#block-128), [129](#block-129), [133](#block-133), [134](#block-134), [138](#block-138), [141](#block-141), [144](#block-144), [145](#block-145), [147](#block-147), [148](#block-148), [154](#block-154), [155](#block-155), [158](#block-158), [159](#block-159), [162](#block-162), [165](#block-165), [168](#block-168), [170](#block-170), [171](#block-171), [173](#block-173), [174](#block-174), [175](#block-175), [179](#block-179), [182](#block-182), [183](#block-183), [184](#block-184), [190](#block-190), [191](#block-191), [195](#block-195), [197](#block-197), [202](#block-202), [212](#block-212), [233](#block-233), [235](#block-235), [236](#block-236), [239](#block-239), [242](#block-242), [247](#block-247), [255](#block-255), [257](#block-257), [261](#block-261), [262](#block-262), [264](#block-264), [269](#block-269), [270](#block-270), [276](#block-276), [287](#block-287), [288](#block-288), [291](#block-291), [293](#block-293), [305](#block-305).

**`1+`** — Increment the top value by one.

Declared: [87:13](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [87](#block-87), [99](#block-99), [121](#block-121), [158](#block-158), [159](#block-159), [160](#block-160), [199](#block-199), [272](#block-272).

**`1+B!`** — Increment a byte in memory; bound to native entry $00F2.

Declared: [88:5](#block-88) (native word / kernel binding), [304:9](#block-304) (native word / kernel binding).

Used in blocks: [88](#block-88), [129](#block-129), [130](#block-130), [181](#block-181), [182](#block-182), [273](#block-273), [304](#block-304), [305](#block-305).

**`1-`** — Decrement the top value by one.

Declared: [87:12](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [87](#block-87), [121](#block-121), [158](#block-158), [161](#block-161), [170](#block-170), [171](#block-171), [272](#block-272), [305](#block-305).

**`12STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:3](#block-107) (definition).

Definition tokens: `: 12STF } 8STF B, B, B, B, { ;`.

Used in blocks: [107](#block-107), [112](#block-112).

**`14STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:4](#block-107) (definition).

Definition tokens: `: 14STF } B, B, 12STF { ;`.

Used in blocks: [107](#block-107).

**`16STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:5](#block-107) (definition).

Definition tokens: `: 16STF } B, B, 14STF { ;`.

Used in blocks: [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [113](#block-113).

**`18STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:6](#block-107) (definition).

Definition tokens: `: 18STF } B, B, 16STF { ;`.

Used in blocks: [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112).

**`1ST`** — VLENGTH-byte vector record for the first baseman. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:8](#block-216) (byte array).

Used in blocks: [153](#block-153), [157](#block-157), [211](#block-211), [213](#block-213), [216](#block-216), [264](#block-264).

**`1STINN`** — First-inning setup flag.

Declared: [149:4](#block-149) (byte variable).

Used in blocks: [130](#block-130), [131](#block-131), [149](#block-149).

**`2*`** — Double the top value.

Declared: [88:2](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [121](#block-121).

**`2+`** — Add two to the top value.

Declared: [87:14](#block-87) (native word / kernel binding).

Used in blocks: [87](#block-87), [291](#block-291).

**`2-`** — Subtract two from the top value.

Declared: [88:1](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88).

**`2/`** — Halve the top value; 

Declared: [88:3](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [169](#block-169).

**`20STF`** — Definition. Define 20STF by combining the existing emitter with two further byte writes; its unusual brace placement is preserved.

Declared: [109:1](#block-109) (definition).

Definition tokens: `: 20STF 18STF } B, B, { ;`.

Used in blocks: [109](#block-109), [110](#block-110), [113](#block-113).

**`24STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:7](#block-107) (definition).

Definition tokens: `: 24STF } 12STF 12STF { ;`.

Used in blocks: [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [270](#block-270).

**`26STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:8](#block-107) (definition).

Definition tokens: `: 26STF } 12STF 14STF { ;`.

Used in blocks: [107](#block-107), [108](#block-108), [110](#block-110).

**`28STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:9](#block-107) (definition).

Definition tokens: `: 28STF } 14STF 14STF { ;`.

Used in blocks: [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [113](#block-113).

**`2DUP`** — Duplicate the top two stack cells.

Declared: [87:2](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [87](#block-87), [271](#block-271), [272](#block-272).

**`2ND`** — VLENGTH-byte vector record for the second baseman. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:7](#block-216) (byte array).

Used in blocks: [153](#block-153), [157](#block-157), [211](#block-211), [213](#block-213), [216](#block-216).

**`2ROT`** — Definition. Save radix, select hex and define 2ROT as two ROT operations.

Declared: [178:2](#block-178) (definition).

Definition tokens: `: 2ROT ROT ROT ;`.

Used in blocks: [178](#block-178), [179](#block-179).

**`32STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:10](#block-107) (definition).

Definition tokens: `: 32STF } 18STF 14STF { ;`.

Used in blocks: [107](#block-107), [108](#block-108), [109](#block-109).

**`3DROP`** — Definition. 3DROP discards three cells. CPOST calls lower-case cpost, then discards its returned X/Y/options.

Declared: [248:1](#block-248) (definition).

Definition tokens: `: 3DROP DROP DROP DROP ;`.

Used in blocks: [248](#block-248), [249](#block-249).

**`3RD`** — VLENGTH-byte vector record for the third baseman. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:5](#block-216) (byte array).

Used in blocks: [153](#block-153), [157](#block-157), [211](#block-211), [213](#block-213), [216](#block-216), [264](#block-264).

**`8STF`** — Definition. Save the radix, select hex, and define fixed-count byte-emission macros. Each macro consumes stacked values through repeated B, calls; source literal order must be understood with stack order.

Declared: [107:2](#block-107) (definition).

Definition tokens: `: 8STF } B, B, B, B, B, B, B, B, { ;`.

Used in blocks: [107](#block-107), [111](#block-111), [112](#block-112), [154](#block-154).

### Dictionary: Symbols

**`:`** — Begin a high-level TERSE definition; brace wrappers in XC code distinguish host compilation from target compilation.

Used in blocks: [10](#block-10), [34](#block-34), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [107](#block-107), [109](#block-109), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [131](#block-131), [132](#block-132), [133](#block-133), [136](#block-136), [141](#block-141), [142](#block-142), [146](#block-146), [153](#block-153), [154](#block-154), [155](#block-155), [156](#block-156), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [178](#block-178), [179](#block-179), [180](#block-180), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [211](#block-211), [212](#block-212), [213](#block-213), [214](#block-214), [225](#block-225), [229](#block-229), [233](#block-233), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [240](#block-240), [248](#block-248), [249](#block-249), [271](#block-271), [272](#block-272), [273](#block-273), [274](#block-274), [280](#block-280), [289](#block-289), [291](#block-291), [293](#block-293), [304](#block-304), [305](#block-305), [306](#block-306).

**`;`** — Finish a high-level definition in the applicable compilation context.

Used in blocks: [10](#block-10), [34](#block-34), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [107](#block-107), [109](#block-109), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [130](#block-130), [131](#block-131), [132](#block-132), [133](#block-133), [136](#block-136), [141](#block-141), [142](#block-142), [146](#block-146), [153](#block-153), [154](#block-154), [155](#block-155), [156](#block-156), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [178](#block-178), [179](#block-179), [180](#block-180), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [211](#block-211), [213](#block-213), [214](#block-214), [225](#block-225), [229](#block-229), [233](#block-233), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [240](#block-240), [248](#block-248), [249](#block-249), [271](#block-271), [272](#block-272), [273](#block-273), [275](#block-275), [280](#block-280), [289](#block-289), [291](#block-291), [293](#block-293), [304](#block-304), [305](#block-305), [306](#block-306).

**`;S`** — Stop the current source-load scan; loading resumes with the caller.

Used in blocks: [10](#block-10), [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [89](#block-89), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [105](#block-105), [106](#block-106), [113](#block-113), [133](#block-133), [140](#block-140), [145](#block-145), [146](#block-146), [152](#block-152), [162](#block-162), [167](#block-167), [169](#block-169), [171](#block-171), [173](#block-173), [177](#block-177), [184](#block-184), [189](#block-189), [203](#block-203), [207](#block-207), [208](#block-208), [214](#block-214), [215](#block-215), [216](#block-216), [229](#block-229), [232](#block-232), [240](#block-240), [250](#block-250), [252](#block-252), [269](#block-269), [272](#block-272), [275](#block-275), [277](#block-277), [279](#block-279), [285](#block-285), [288](#block-288), [289](#block-289), [303](#block-303), [304](#block-304), [306](#block-306).

**`<`** — Compare whether the preceding value is less than the top value.

Declared: [88:8](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [121](#block-121), [129](#block-129), [161](#block-161), [162](#block-162), [169](#block-169), [305](#block-305).

**`<,`** — Assembler less/carry-related condition selector; interpret with the preceding comparison and emitted branch.

Used in blocks: [120](#block-120), [159](#block-159), [177](#block-177), [198](#block-198), [200](#block-200), [202](#block-202), [231](#block-231), [255](#block-255), [257](#block-257), [259](#block-259), [261](#block-261), [264](#block-264).

**`<>`** — Compare two values for inequality.

Declared: [88:7](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [128](#block-128), [239](#block-239).

**`<>,`** — Assembler not-equal condition selector.

Used in blocks: [114](#block-114), [117](#block-117), [192](#block-192), [194](#block-194), [195](#block-195), [196](#block-196), [198](#block-198), [255](#block-255).

**`<ASSEMBLE`** — Begin the cross-assembler's two-pass source region.

Used in blocks: [115](#block-115), [116](#block-116), [143](#block-143), [164](#block-164), [167](#block-167), [174](#block-174), [195](#block-195), [196](#block-196), [200](#block-200), [230](#block-230), [264](#block-264), [276](#block-276), [281](#block-281), [286](#block-286).

**`<INTERRUPTS`** — Definition. Define schedule-opening/closing helpers, the tick-compilation helper ]'[ and I', which emits a CALL to the handler entry adjusted by two plus its scanline byte.

Declared: [291:3](#block-291) (definition).

Definition tokens: `: <INTERRUPTS } DATA HERE { ;`.

Used in blocks: [269](#block-269), [291](#block-291).

**`=`** — Compare two values for equality.

Declared: [88:6](#block-88) (native word / kernel binding).

Used in blocks: [34](#block-34), [88](#block-88), [101](#block-101), [129](#block-129), [130](#block-130), [158](#block-158), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [236](#block-236).

**`=,`** — Assembler equal condition selector.

Used in blocks: [116](#block-116), [117](#block-117), [159](#block-159), [160](#block-160), [196](#block-196), [198](#block-198), [199](#block-199), [203](#block-203), [231](#block-231), [260](#block-260), [265](#block-265).

**`>`** — Compare whether the preceding value is greater than the top value.

Declared: [88:10](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [123](#block-123), [169](#block-169).

**`>=`** — Compare whether the preceding value is greater than or equal to the top value.

Declared: [88:9](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88).

**`>=,`** — Assembler greater-or-equal comparison condition selector.

Used in blocks: [159](#block-159), [173](#block-173), [174](#block-174), [177](#block-177), [195](#block-195), [202](#block-202), [246](#block-246), [253](#block-253), [257](#block-257), [261](#block-261), [262](#block-262).

**`>R`** — Move a parameter-stack value to the return stack in host TERSE.

Used in blocks: [10](#block-10), [97](#block-97).

**`@`** — Fetch a cell from an address; target binding at $0093.

Declared: [87:5](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [34](#block-34), [87](#block-87), [89](#block-89), [98](#block-98), [101](#block-101), [102](#block-102), [130](#block-130), [133](#block-133), [134](#block-134), [149](#block-149), [157](#block-157), [158](#block-158), [161](#block-161), [184](#block-184), [216](#block-216), [233](#block-233), [239](#block-239), [276](#block-276), [291](#block-291), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304).

**`[`** — Enter interpretation state in a compiling definition; used within the compiler macros.

Used in blocks: [291](#block-291).

**`[COMPILE]`** — Compile the following immediate word rather than executing it immediately.

Used in blocks: [291](#block-291).

**`]`** — Resume compilation state.

Used in blocks: [291](#block-291).

**`]'[`** — Definition. Define schedule-opening/closing helpers, the tick-compilation helper ]'[ and I', which emits a CALL to the handler entry adjusted by two plus its scanline byte.

Declared: [291:5](#block-291) (definition).

Definition tokens: `: ]'[ [COMPILE] ' ;`.

Used in blocks: [291](#block-291).

**`^`** — Definition. Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato.

Declared: [136:3](#block-136) (definition).

Definition tokens: `: ^ } EF ABVOLS 0F MCVOLS { ;`.

Used in blocks: [136](#block-136).

### Dictionary: A

**`A`** — Assembler accumulator operand. In hexadecimal data contexts the same character can also be a number.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [132](#block-132), [143](#block-143), [144](#block-144), [145](#block-145), [159](#block-159), [160](#block-160), [164](#block-164), [165](#block-165), [166](#block-166), [167](#block-167), [173](#block-173), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [179](#block-179), [190](#block-190), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [235](#block-235), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [246](#block-246), [247](#block-247), [250](#block-250), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [269](#block-269), [276](#block-276), [279](#block-279), [283](#block-283), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288), [291](#block-291), [292](#block-292).

**`A"`** — Definition. Switch back to XC definitions and expose A" as the immediate wrapper around XC-STRING.

Declared: [99:5](#block-99) (definition).

Used in blocks: [34](#block-34), [99](#block-99), [127](#block-127), [128](#block-128), [131](#block-131), [178](#block-178), [179](#block-179), [181](#block-181), [237](#block-237), [238](#block-238), [273](#block-273), [274](#block-274), [275](#block-275), [305](#block-305), [306](#block-306).

**`ABORT`** — Terminate the host compilation/loading path on a failed runtime check.

Used in blocks: [34](#block-34).

**`ABVOLS`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:3](#block-141) (definition).

Definition tokens: `: ABVOLS } 16 B, B, { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**`ACT,`** — Definition. Select hex. REST, emits an invisible stationary action; ACT, emits the stacked pattern, update count and velocity cells in the table format consumed by PACTLOAD.

Declared: [225:3](#block-225) (definition).

Definition tokens: `: ACT, } , B, , , { ;`.

Used in blocks: [225](#block-225), [226](#block-226), [227](#block-227), [228](#block-228), [229](#block-229).

**`ADC,`** — Add operand plus carry to A.

Used in blocks: [234](#block-234), [250](#block-250).

**`ADD,`** — Add operand to A.

Used in blocks: [174](#block-174), [177](#block-177), [234](#block-234), [250](#block-250).

**`ADI,`** — Add an immediate byte to A.

Used in blocks: [114](#block-114), [117](#block-117), [126](#block-126), [144](#block-144), [159](#block-159), [174](#block-174), [279](#block-279).

**`ALLFLDACT`** — Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE.

Declared: [237:9](#block-237) (native word / kernel binding).

Used in blocks: [162](#block-162), [237](#block-237).

**`ANA,`** — AND an operand with A and set flags.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [132](#block-132), [159](#block-159), [165](#block-165), [166](#block-166), [173](#block-173), [174](#block-174), [175](#block-175), [177](#block-177), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [201](#block-201), [202](#block-202), [203](#block-203), [233](#block-233), [238](#block-238), [239](#block-239), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [267](#block-267), [268](#block-268), [269](#block-269), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288).

**`AND`** — Bitwise AND of two values.

Declared: [88:12](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [101](#block-101), [121](#block-121), [129](#block-129), [131](#block-131), [174](#block-174), [181](#block-181), [213](#block-213), [239](#block-239), [249](#block-249), [291](#block-291), [305](#block-305).

**`ANI,`** — AND an immediate byte with A.

Used in blocks: [125](#block-125), [126](#block-126), [207](#block-207), [241](#block-241), [271](#block-271), [276](#block-276), [277](#block-277), [279](#block-279), [285](#block-285).

**`ANMSEQLOAD`** — Native word / kernel binding. ANMSEQLOAD indexes the current animation group by VPERS# and saves VANMSEQ.

Declared: [201:1](#block-201) (native word / kernel binding).

Used in blocks: [201](#block-201), [203](#block-203).

**`ANOTE`** — Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

Declared: [141:9](#block-141) (definition).

Definition tokens: `: ANOTE } ATONE DURATION { ;`.

Used in blocks: [135](#block-135), [138](#block-138), [141](#block-141).

**`ARRAY`** — Allocate/name an indexed cell array from a the size.

Used in blocks: [295](#block-295).

**`ASM`** — Select assembler context.

Used in blocks: [33](#block-33), [34](#block-34), [94](#block-94), [97](#block-97), [99](#block-99), [100](#block-100), [101](#block-101), [281](#block-281), [291](#block-291).

**`ASSEMBLE>`** — Close the two-pass assembly region.

Used in blocks: [115](#block-115), [118](#block-118), [144](#block-144), [164](#block-164), [167](#block-167), [176](#block-176), [195](#block-195), [198](#block-198), [200](#block-200), [231](#block-231), [268](#block-268), [277](#block-277), [285](#block-285), [286](#block-286).

**`ATBASE`** — Byte variable; allocated at the declaration location. 

Declared: [152:6](#block-152) (byte variable).

Used in blocks: [152](#block-152).

**`ATONE`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:1](#block-141) (definition).

Definition tokens: `: ATONE } 11 B, B, { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [141](#block-141).

**`AUTOR1`** — Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

Declared: [235:1](#block-235) (native subroutine).

Used in blocks: [163](#block-163), [165](#block-165), [166](#block-166), [235](#block-235).

**`AUTOR2`** — Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

Declared: [235:3](#block-235) (native subroutine).

Used in blocks: [163](#block-163), [165](#block-165), [166](#block-166), [235](#block-235).

**`AUTOR3`** — Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

Declared: [235:5](#block-235) (native subroutine).

Used in blocks: [163](#block-163), [166](#block-166), [235](#block-235).

### Dictionary: B

**`B`** — Assembler B/BC-pair designator according to instruction; may also be hexadecimal data.

Used in blocks: [115](#block-115), [119](#block-119), [120](#block-120), [132](#block-132), [143](#block-143), [144](#block-144), [159](#block-159), [160](#block-160), [165](#block-165), [166](#block-166), [167](#block-167), [180](#block-180), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [203](#block-203), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [239](#block-239), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [251](#block-251), [252](#block-252), [257](#block-257), [259](#block-259), [261](#block-261), [264](#block-264), [268](#block-268), [270](#block-270), [271](#block-271), [277](#block-277), [279](#block-279), [284](#block-284), [286](#block-286), [291](#block-291).

**`B!`** — Store one byte at an address; target binding at $00A8.

Declared: [87:8](#block-87) (native word / kernel binding).

Used in blocks: [87](#block-87), [101](#block-101), [121](#block-121), [123](#block-123), [128](#block-128), [129](#block-129), [130](#block-130), [154](#block-154), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [169](#block-169), [182](#block-182), [184](#block-184), [212](#block-212), [213](#block-213), [273](#block-273), [275](#block-275), [304](#block-304).

**`B,`** — Emit one byte in the current compilation/data context; object-specific writes also use OB,.

Used in blocks: [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [123](#block-123), [141](#block-141), [154](#block-154), [225](#block-225), [234](#block-234), [246](#block-246), [270](#block-270), [278](#block-278), [280](#block-280), [291](#block-291), [296](#block-296), [297](#block-297), [298](#block-298), [299](#block-299), [300](#block-300), [301](#block-301), [302](#block-302), [303](#block-303).

**`B@`** — Fetch one byte from an address; target binding at $009A.

Declared: [87:6](#block-87) (native word / kernel binding).

Used in blocks: [87](#block-87), [98](#block-98), [99](#block-99), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [132](#block-132), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [213](#block-213), [236](#block-236), [238](#block-238), [240](#block-240), [248](#block-248), [249](#block-249), [272](#block-272), [273](#block-273), [305](#block-305), [306](#block-306).

**`B@+7`** — Specialized native byte/count helper at $00E6; COUNT is bound to the same entry. Do not interpret the name alone as a complete routine specification.

Declared: [88:4](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88).

**`BACT,`** — Definition. BACT, emits ball-pattern actions; LK, emits a stationary ball/deactivate sequence.

Declared: [229:2](#block-229) (definition).

Definition tokens: `: BACT, } BAL ACT, { ;`.

Used in blocks: [229](#block-229).

**`BAL`** — Constant BAL, assigned source expression/value `628` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:11](#block-113) (constant).

Used in blocks: [113](#block-113), [122](#block-122), [154](#block-154), [213](#block-213), [229](#block-229), [262](#block-262).

**`BALL0`** — Named data address. Pair invisible, ball and on-base sprites with themselves for both motion phases, then continue.

Declared: [186:9](#block-186) (data label).

Used in blocks: [186](#block-186), [188](#block-188).

**`BALLERASE`** — Native word / kernel binding. BALLERASE preserves BC/IY around native BLERASE and returns to TERSE.

Declared: [180:1](#block-180) (native word / kernel binding).

Used in blocks: [180](#block-180), [181](#block-181).

**`BALLM`** — Named data address. Emit perspective lists for ball, covering, standing pitcher, pitcher throwing and on-base animation; continue.

Declared: [188:9](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`BALLPAT`** — Named data address. Label and emit the invisible placeholder NOBOD and the ball pattern BALLPAT, including their size/offset metadata.

Declared: [107:12](#block-107) (data label).

Used in blocks: [107](#block-107), [186](#block-186).

**`BALLS`** — Ball count stored as an ASCII-style $30-based byte.

Declared: [151:3](#block-151) (byte variable).

Used in blocks: [116](#block-116), [129](#block-129), [151](#block-151), [179](#block-179), [182](#block-182), [272](#block-272), [275](#block-275).

**`BALLSCORE`** — Byte table. Emit BALLSCORE as timed three-voice chords and a quiet ending.

Declared: [134:6](#block-134) (byte table).

Used in blocks: [134](#block-134), [146](#block-146).

**`BALLTIME`** — Definition. BALLTIME increments BALLS. At $34 display WALK, start forced runner movement and a WALK timer, update odds/base state and clear counts; otherwise play/post the ball count.

Declared: [182:5](#block-182) (definition).

Definition tokens: `: BALLTIME ( BALLS DUP 1+B! B@ 34 = IF SWALK MYAH WLKCNT 1+B! CWALK OLDSTRING B! LBASE BONE 40 WALK B! 1 HLSIDE B! WHBODDS HITRUN ( WUPGO CLRBLST ELSE MBALL DOSBALL THEN SBO ;`.

Used in blocks: [182](#block-182), [183](#block-183).

**`BARRAY`** — Allocate/name an indexed byte array from a the size.

Used in blocks: [207](#block-207), [216](#block-216).

**`BASE`** — Host numeric-radix variable.

Used in blocks: [10](#block-10), [102](#block-102), [134](#block-134), [140](#block-140).

**`BASE!`** — Definition. Define BASE! and BASE@ as host-side radix save/restore shorthands using the compiler's brace syntax.

Declared: [102:1](#block-102) (definition).

Definition tokens: `: BASE! } BASE ! { ;`.

Used in blocks: [102](#block-102), [113](#block-113), [133](#block-133), [145](#block-145), [162](#block-162), [177](#block-177), [184](#block-184), [203](#block-203), [214](#block-214), [232](#block-232), [240](#block-240), [277](#block-277), [280](#block-280), [282](#block-282), [289](#block-289), [303](#block-303), [304](#block-304).

**`BASE2PAT`** — Named data address. Emit HOMEPLATE, BASEPAT and BASE2PAT.

Declared: [112:10](#block-112) (data label).

Used in blocks: [112](#block-112), [127](#block-127), [274](#block-274).

**`BASE?`** — Host numeric-base diagnostic invoked by historical checkpoint lines.

Used in blocks: [102](#block-102), [104](#block-104), [105](#block-105), [106](#block-106).

**`BASE@`** — Definition. Define BASE! and BASE@ as host-side radix save/restore shorthands using the compiler's brace syntax.

Declared: [102:1](#block-102) (definition).

Definition tokens: `: BASE@ } BASE @ { ;`.

Used in blocks: [102](#block-102), [107](#block-107), [114](#block-114), [141](#block-141), [153](#block-153), [174](#block-174), [178](#block-178), [190](#block-190), [211](#block-211), [230](#block-230), [233](#block-233), [253](#block-253), [276](#block-276), [280](#block-280), [282](#block-282), [290](#block-290), [304](#block-304).

**`BASEBLAT`** — Base selected as the throw destination.

Declared: [149:10](#block-149) (byte variable).

Used in blocks: [116](#block-116), [120](#block-120), [149](#block-149).

**`BASEPAT`** — Named data address. Emit HOMEPLATE, BASEPAT and BASE2PAT.

Declared: [112:9](#block-112) (data label).

Used in blocks: [112](#block-112), [274](#block-274).

**`BASESTATUS`** — Base-occupancy code indexing runner-action tables.

Declared: [149:9](#block-149) (byte variable).

Used in blocks: [149](#block-149), [164](#block-164), [167](#block-167), [169](#block-169), [199](#block-199).

**`BASETABLE`** — Named data address. Load continuation/instruction strings, save the radix, select hex and emit the base destination coordinate table.

Declared: [114:3](#block-114) (data label).

Used in blocks: [114](#block-114), [120](#block-120).

**`BASEX`** — Cell variable; allocated at the declaration location. 

Declared: [151:9](#block-151) (cell variable).

Used in blocks: [151](#block-151).

**`BASEY`** — Cell variable; allocated at the declaration location. 

Declared: [151:9](#block-151) (cell variable).

Used in blocks: [151](#block-151).

**`BATD30`** — Named data address. Emit BATD30, BATD45 and BATD90.

Declared: [112:1](#block-112) (data label).

Used in blocks: [112](#block-112), [259](#block-259).

**`BATD45`** — Named data address. Emit BATD30, BATD45 and BATD90.

Declared: [112:3](#block-112) (data label).

Used in blocks: [112](#block-112), [259](#block-259).

**`BATD90`** — Named data address. Emit BATD30, BATD45 and BATD90.

Declared: [112:5](#block-112) (data label).

Used in blocks: [112](#block-112), [259](#block-259), [274](#block-274).

**`BATHIT`** — Native word / kernel binding. BATHIT marks HITYET, calls INLOG through DOVERB and clears hit/pitch/swing-go flags.

Declared: [124:1](#block-124) (native word / kernel binding).

Used in blocks: [124](#block-124), [132](#block-132).

**`BATHITCHK`** — Native word / kernel binding. BATHITCHK indexes by swing phase, rejects out-of-range Y and scaled X coordinates and preserves the table pointer as required.

Declared: [258:4](#block-258) (native word / kernel binding).

Used in blocks: [258](#block-258), [259](#block-259).

**`BATMID`** — Named data address. Emit BATMID, BATU45, BATU30 and BATU90 with their metadata, then continue.

Declared: [111:9](#block-111) (data label).

Used in blocks: [111](#block-111), [259](#block-259).

**`BATSWING`** — Native word / kernel binding. BATSWING marks a strike attempt, XOR-erases/redraws successive phases, checks contact until HITGOING is set and starts the reset delay at the last phase; continue.

Declared: [259:9](#block-259) (native word / kernel binding).

Used in blocks: [259](#block-259), [267](#block-267).

**`BATU30`** — Named data address. Emit BATMID, BATU45, BATU30 and BATU90 with their metadata, then continue.

Declared: [111:12](#block-111) (data label).

Used in blocks: [111](#block-111), [259](#block-259).

**`BATU45`** — Named data address. Emit BATMID, BATU45, BATU30 and BATU90 with their metadata, then continue.

Declared: [111:10](#block-111) (data label).

Used in blocks: [111](#block-111), [259](#block-259).

**`BATU90`** — Named data address. Emit BATMID, BATU45, BATU30 and BATU90 with their metadata, then continue.

Declared: [111:14](#block-111) (data label).

Used in blocks: [111](#block-111), [259](#block-259).

**`BATWRITE`** — Native word / kernel binding. BATWRITE looks up the angle, uses fixed batter coordinates/options and draws the relative pattern, preserving its caller's pointer.

Declared: [259:3](#block-259) (native word / kernel binding).

Used in blocks: [259](#block-259), [260](#block-260).

**`BCD+`** — Native word / kernel binding. BCD+ pops two cells, adds their low bytes with DAA, adds high bytes with carry and DAA, and pushes the resulting packed-BCD cell. 

Declared: [250:1](#block-250) (native word / kernel binding).

Used in blocks: [250](#block-250).

**`BEGIN`** — Immediate XC wrapper that records a loop's object address.

Declared: [100:10](#block-100) (definition).

Definition tokens: `: BEGIN } XC-BEGIN { ;`.

Used in blocks: [100](#block-100), [236](#block-236), [272](#block-272), [305](#block-305), [306](#block-306).

**`BEGIN,`** — Mark the start of an assembler loop.

Used in blocks: [115](#block-115), [207](#block-207), [236](#block-236), [237](#block-237), [243](#block-243), [261](#block-261), [266](#block-266).

**`BIT,`** — Test a register bit.

Used in blocks: [119](#block-119), [160](#block-160), [174](#block-174), [176](#block-176), [177](#block-177), [196](#block-196), [234](#block-234), [236](#block-236), [241](#block-241), [242](#block-242), [243](#block-243), [246](#block-246), [247](#block-247), [276](#block-276), [279](#block-279), [288](#block-288).

**`BIT-POS`** — Current packed-pixel position within a framebuffer byte.

Declared: [280:3](#block-280) (cell variable).

Used in blocks: [271](#block-271), [280](#block-280), [284](#block-284), [285](#block-285).

**`BITX,`** — Test a bit at an IX/IY-relative memory location.

Used in blocks: [116](#block-116), [117](#block-117), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [202](#block-202), [231](#block-231), [257](#block-257), [266](#block-266), [267](#block-267).

**`BL`** — VLENGTH-byte vector record for the ball. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:1](#block-216) (byte array).

Used in blocks: [119](#block-119), [120](#block-120), [122](#block-122), [123](#block-123), [126](#block-126), [154](#block-154), [158](#block-158), [160](#block-160), [161](#block-161), [173](#block-173), [192](#block-192), [193](#block-193), [212](#block-212), [213](#block-213), [216](#block-216), [238](#block-238), [258](#block-258), [261](#block-261), [262](#block-262), [267](#block-267).

**`BLDST`** — Native word / kernel binding. BLDST preserves BC, reads the ball speed, loads its destination and calls DSTCALC; a LDFLAG result means retain the current motion.

Declared: [192:1](#block-192) (native word / kernel binding).

Used in blocks: [192](#block-192), [199](#block-199).

**`BLDST,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:9](#block-225) (definition).

Definition tokens: `: BLDST, } OPBLDST B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226).

**`BLERASE`** — Native subroutine. BLERASE preserves IX, selects BL, erases it, clears active status and replaces its pattern with NOBOD.

Declared: [238:1](#block-238) (native subroutine).

Used in blocks: [180](#block-180), [191](#block-191), [238](#block-238), [258](#block-258), [263](#block-263).

**`BLMOT,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:7](#block-225) (definition).

Definition tokens: `: BLMOT, } OPBLMOT B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226).

**`BLMOTION`** — Native word / kernel binding. BLMOTION selects the writable pitch-ball RAM action record TBLPA.

Declared: [199:8](#block-199) (native word / kernel binding).

Used in blocks: [199](#block-199).

**`bload`** — Definition. Define bload `( from-blk to-addr #blks -- next-blk )`: fetch each BLOCK, copy $400 bytes to successive destination addresses with protection temporarily lifted, then return the following block number.

Declared: [10:8](#block-10) (definition).

Definition tokens: `: bload ( DUP >R 0 DO 2DUP DROP I + BLOCK 2DUP DROP I 0400 * + 0400 UNPROT BMOVE PROT LOOP DROP R> + ;`.

Used in blocks: [10](#block-10).

**`BLOCK`** — Obtain the buffer address of a disk block; this source uses $400-byte blocks.

Used in blocks: [10](#block-10), [98](#block-98).

**`BLPOSCHK`** — Native word / kernel binding. BLPOSCHK branches on HITYET. A pitch beyond Y=$BC enters pitch-completion handling unless contact is already pending.

Declared: [262:1](#block-262) (native word / kernel binding).

Used in blocks: [262](#block-262), [267](#block-267).

**`BLTIME`** — Byte variable; allocated at the declaration location. 

Declared: [152:3](#block-152) (byte variable).

Used in blocks: [152](#block-152).

**`BLWAIT`** — Ball update pacing state used during interrupts.

Declared: [152:2](#block-152) (byte variable).

Used in blocks: [152](#block-152), [266](#block-266), [267](#block-267).

**`BMOVE`** — Move a block of bytes between addresses; used by bload for $400-byte blocks.

Declared: [89:1](#block-89) (native word / kernel binding).

Used in blocks: [10](#block-10), [89](#block-89).

**`BMUSIC`** — Native word / kernel binding. loadpc installs MUSPC and STARTPC. BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

Declared: [145:2](#block-145) (native word / kernel binding).

Used in blocks: [145](#block-145), [146](#block-146).

**`BNOTE`** — Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

Declared: [141:9](#block-141) (definition).

Definition tokens: `: BNOTE } BTONE DURATION { ;`.

Used in blocks: [138](#block-138), [141](#block-141).

**`BONE`** — Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue.

Declared: [233:11](#block-233) (definition).

Definition tokens: `: BONE ( 1 SB! ;`.

Used in blocks: [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [133](#block-133), [155](#block-155), [156](#block-156), [158](#block-158), [161](#block-161), [162](#block-162), [181](#block-181), [182](#block-182), [214](#block-214), [233](#block-233), [239](#block-239), [305](#block-305).

**`boot`** — Definition. Define boot: enable disk access, reload saved system variables and the three image regions, restore dictionary pointers, discard the final disk-block index, and disable disk access.

Declared: [10:12](#block-10) (definition).

Definition tokens: `: boot DISKON .svars 1 bload .eot .o @ bload 04000 .t @ bload 08000 .h @ bload .rvdl DROP DISKOFF ;`.

Used in blocks: [10](#block-10).

**`BSRTBL`** — Named data address. Save radix, select hex and emit BSRTBL as X/Y base-running coordinate pairs.

Declared: [190:2](#block-190) (data label).

Used in blocks: [190](#block-190), [197](#block-197).

**`BSWINGTABLE`** — Named data address. Emit BSWINGTABLE in order from BATD90 to BATU90.

Declared: [259:1](#block-259) (data label).

Used in blocks: [259](#block-259).

**`BTABLE`** — Declare a byte table accessed with the game's indexed table syntax.

Used in blocks: [123](#block-123), [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141), [154](#block-154), [270](#block-270), [280](#block-280), [296](#block-296), [299](#block-299).

**`BTLP1`** — Native branch/loop label. Select the dominant component, repeatedly halve it until within the maximum-speed scale, halve the minor component equally and restore axis ordering.

Declared: [230:2](#block-230) (forward declaration), [231:7](#block-231) (assembler label).

Used in blocks: [230](#block-230), [231](#block-231).

**`BTLP2`** — Native branch/loop label. Select the dominant component, repeatedly halve it until within the maximum-speed scale, halve the minor component equally and restore axis ordering.

Declared: [230:2](#block-230) (forward declaration), [231:8](#block-231) (assembler label).

Used in blocks: [230](#block-230), [231](#block-231).

**`BTONE`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:2](#block-141) (definition).

Definition tokens: `: BTONE } 12 B, B, { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [138](#block-138), [141](#block-141).

**`BUTTONCHK`** — Native word / kernel binding. BUTTONCHK branches on HITYET; after contact, CMSW selects computer control and enters a protected proximity test.

Declared: [125:1](#block-125) (native word / kernel binding).

Used in blocks: [125](#block-125), [132](#block-132).

**`BV`** — Definition. Define V as VARIABLE and BV as BVARIABLE, then continue the music processor source.

Declared: [142:14](#block-142) (definition).

Definition tokens: `: BV } BVARIABLE { ;`.

Used in blocks: [142](#block-142), [143](#block-143).

**`BV=`** — Definition. Define zero-initialized cell/byte variable emitters V=/BV=, constant and forward shorthands C=/F=, and the deliberately spelled label alias LABLE for DATA.

Declared: [304:3](#block-304) (definition).

Definition tokens: `: BV= } 0 BVARIABLE { ;`.

Used in blocks: [149](#block-149), [150](#block-150), [151](#block-151), [152](#block-152), [153](#block-153), [273](#block-273), [304](#block-304).

**`BVARIABLE`** — Allocate/name a byte variable with the initial value.

Used in blocks: [142](#block-142), [304](#block-304).

**`BWTBL`** — Named data address. Emit BWTBL pairs containing Y and X window parameters for the seven swing phases.

Declared: [258:1](#block-258) (data label).

Used in blocks: [258](#block-258).

**`bytarray`** — Compiler token-to-native-entry table populated by indexed stores in 35/86; table implementation is in FS.XC.

Used in blocks: [35](#block-35), [86](#block-86).

**`byterse`** — Compiler byte-TERSE setting assigned $3A in 86; representation is defined by the saved XC image.

Used in blocks: [86](#block-86).

**`BZERO`** — Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue.

Declared: [233:12](#block-233) (definition).

Definition tokens: `: BZERO ( 0 SB! ;`.

Used in blocks: [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [154](#block-154), [157](#block-157), [162](#block-162), [180](#block-180), [183](#block-183), [184](#block-184), [233](#block-233), [239](#block-239), [240](#block-240), [273](#block-273), [305](#block-305), [306](#block-306).

### Dictionary: C

**`C`** — Assembler C-register operand; may also be hexadecimal data.

Used in blocks: [116](#block-116), [117](#block-117), [144](#block-144), [159](#block-159), [196](#block-196), [197](#block-197), [208](#block-208), [230](#block-230), [241](#block-241), [242](#block-242), [243](#block-243), [251](#block-251), [252](#block-252), [257](#block-257), [271](#block-271), [277](#block-277), [279](#block-279), [284](#block-284), [286](#block-286).

**`C=`** — Definition. Define zero-initialized cell/byte variable emitters V=/BV=, constant and forward shorthands C=/F=, and the deliberately spelled label alias LABLE for DATA.

Declared: [304:4](#block-304) (definition).

Definition tokens: `: C= } CONSTANT { ;`.

Used in blocks: [86](#block-86), [113](#block-113), [142](#block-142), [147](#block-147), [148](#block-148), [179](#block-179), [225](#block-225), [241](#block-241), [246](#block-246), [290](#block-290), [304](#block-304).

**`CALL,`** — Emit an absolute native subroutine call.

Used in blocks: [116](#block-116), [117](#block-117), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [159](#block-159), [163](#block-163), [164](#block-164), [165](#block-165), [166](#block-166), [167](#block-167), [173](#block-173), [175](#block-175), [176](#block-176), [180](#block-180), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [208](#block-208), [231](#block-231), [233](#block-233), [237](#block-237), [238](#block-238), [239](#block-239), [244](#block-244), [245](#block-245), [247](#block-247), [251](#block-251), [252](#block-252), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [263](#block-263), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [270](#block-270), [271](#block-271), [284](#block-284), [287](#block-287), [288](#block-288).

**`CANNONSCORE`** — Byte table. CANNONSCORE combines noise, timed tones and stepped volumes, then transfers into SIRENSCORE; continue loading.

Declared: [138:7](#block-138) (byte table).

Used in blocks: [138](#block-138), [146](#block-146).

**`CAUGHT`** — Foreground request to process a catch/throw arrival.

Declared: [152:11](#block-152) (byte variable).

Used in blocks: [116](#block-116), [132](#block-132), [152](#block-152), [192](#block-192), [195](#block-195), [235](#block-235), [263](#block-263).

**`CBALL`** — Constant CBALL, assigned source expression/value `4` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

Declared: [179:6](#block-179) (constant).

Used in blocks: [179](#block-179), [262](#block-262).

**`CBUP1`** — Named data address. Emit two catch/cover-base images CBUP1 and CBUP2.

Declared: [110:8](#block-110) (data label).

Used in blocks: [110](#block-110), [188](#block-188).

**`CBUP2`** — Named data address. Emit two catch/cover-base images CBUP1 and CBUP2.

Declared: [110:10](#block-110) (data label).

Used in blocks: [110](#block-110), [188](#block-188).

**`CC,`** — Assembler carry-set selector used before a conditional call mnemonic in this dialect.

Used in blocks: [230](#block-230), [253](#block-253), [261](#block-261).

**`CCLEAVE`** — Native branch/loop label. At CCLEAVE clear OFCATCH, restore registers and return; the alternative path clears THROWAROUND.

Declared: [116:1](#block-116) (forward declaration), [118:1](#block-118) (assembler label).

Used in blocks: [116](#block-116), [117](#block-117), [118](#block-118).

**`CF`** — VLENGTH-byte vector record for the center fielder. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:3](#block-216) (byte array).

Used in blocks: [124](#block-124), [173](#block-173), [211](#block-211), [212](#block-212), [216](#block-216).

**`CFOUL`** — Constant CFOUL, assigned source expression/value `1` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

Declared: [179:6](#block-179) (constant).

Used in blocks: [158](#block-158), [179](#block-179).

**`characters`** — Byte table. Label characters and emit the ten zero rows for space.

Declared: [296:1](#block-296) (byte table).

Used in blocks: [247](#block-247), [296](#block-296).

**`CHEERME`** — Request for the cheer/normal-palette branch of STARTMUSIC.

Declared: [151:12](#block-151) (byte variable).

Used in blocks: [124](#block-124), [151](#block-151), [195](#block-195).

**`CHEERSSCORE`** — Byte table. Emit CHEERSSCORE: choose noise and progressively lower voice volumes, then stop sound.

Declared: [135:5](#block-135) (byte table).

Used in blocks: [135](#block-135), [136](#block-136), [140](#block-140), [146](#block-146).

**`CHGS`** — Definition. CHGS posts CHANGE SIDES; DWAIT runs nested loops with interrupts enabled and disables them on return; continue.

Declared: [238:8](#block-238) (definition).

Definition tokens: `: CHGS 1C00 2000 828 A" SPOST ;`.

Used in blocks: [238](#block-238), [239](#block-239).

**`CHKATBS`** — Native subroutine. CHKATBS tests active/at-base bits and increments E when a player is active away from base.

Declared: [119:1](#block-119) (native subroutine).

Used in blocks: [119](#block-119), [120](#block-120).

**`CHKCAUGHT`** — Native word / kernel binding. Declare cross-screen labels, return during WALK, preserve IY/IX, clear flags through the zero accumulator and set NORUN.

Declared: [116:2](#block-116) (native word / kernel binding).

Used in blocks: [116](#block-116), [132](#block-132).

**`CHKCOIN1`** — Native subroutine. When idle, debounce bit 0 from port $11; on acceptance latch CNTM1, pulse output $20, increment CREDITS, request UPCRED, clear bonus state and play coin music.

Declared: [287:1](#block-287) (native subroutine).

Used in blocks: [268](#block-268), [287](#block-287).

**`CHKCOIN2`** — Native subroutine. CHKCOIN2 debounces bit 1 of port $11, latches CNTM2, pulses output $20 and requests a credit update.

Declared: [288:1](#block-288) (native subroutine).

Used in blocks: [268](#block-268), [288](#block-288).

**`CHKFLSHSTAY`** — Definition. WUPTON installs WUPWRT. CHKFLSHSTAY checks whether flashing was reserved and stops that special use while retaining its phase state.

Declared: [240:2](#block-240) (definition).

Definition tokens: `: CHKFLSHSTAY ( FLSHSTAY B@ IF FLSHSTAY BZERO FLSHCNT B@ FLSHOFF IF DOWUP B@ IF WUPWRT WUPTON ELSE WUPFLSH B@ IF WUPWRT WUPTON THEN THEN ELSE ( DOWUP B@ IF WUPTON ELSE WUPFLSH B@ IF WUPTON THEN THEN THEN WUPFLSH BZERO DOWUP BZERO THEN ;`.

Used in blocks: [121](#block-121), [240](#block-240).

**`CHKGMCNT`** — Definition. CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte.

Declared: [305:9](#block-305) (definition).

Definition tokens: `: CHKGMCNT DP12CN C0 TWAIT DP12CN CREDITS B@ ;`.

Used in blocks: [129](#block-129), [130](#block-130), [305](#block-305).

**`CHKGROUNDER`** — Native word / kernel binding. CHKGROUNDER returns unless GRNDR is set, advances/wraps GRNDRVALUE across thirteen entries, chooses/sign-adjusts the offset and adds it to HL; continue.

Declared: [253:5](#block-253) (native word / kernel binding).

Used in blocks: [253](#block-253), [257](#block-257).

**`CHKPLRS`** — Foreground request to poll start/player-selection buttons.

Declared: [152:1](#block-152) (byte variable).

Used in blocks: [121](#block-121), [131](#block-131), [132](#block-132), [152](#block-152).

**`CHKSCRTIME`** — Native word / kernel binding. Disable interrupts and preserve IX. For outfield hits use PLAYON and advance it by VLENGTH unless already at R4 or in the double-play special case; for infield hits use R1.

Declared: [114:5](#block-114) (native word / kernel binding).

Used in blocks: [114](#block-114), [132](#block-132).

**`CHOMER`** — Constant CHOMER, assigned source expression/value `5` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

Declared: [179:7](#block-179) (constant).

Used in blocks: [179](#block-179), [193](#block-193).

**`CKATBS`** — Native branch/loop label. Handle outfield pickup, forced retreat and the already-at-base shortcut.

Declared: [196:2](#block-196) (forward declaration), [197:11](#block-197) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`CLRBLST`** — Native word / kernel binding. CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.

Declared: [179:13](#block-179) (native word / kernel binding).

Used in blocks: [179](#block-179), [180](#block-180), [181](#block-181), [182](#block-182).

**`CMA,`** — Complement A.

Used in blocks: [233](#block-233), [283](#block-283).

**`CMAJOR`** — Definition. Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato.

Declared: [136:1](#block-136) (definition).

Definition tokens: `: CMAJOR } 1C MASTER 0 NOISE EF ABVOLS 0F MCVOLS { ;`.

Used in blocks: [136](#block-136).

**`CMFLDR`** — Pointer to the selected computer-controlled outfielder.

Declared: [151:4](#block-151) (cell variable).

Used in blocks: [151](#block-151), [173](#block-173).

**`CMOFTIMER`** — Countdown before invoking computer outfield pursuit.

Declared: [152:1](#block-152) (byte variable).

Used in blocks: [152](#block-152), [158](#block-158), [162](#block-162), [254](#block-254).

**`CMP,`** — Compare A with an operand without retaining the subtraction result.

Used in blocks: [114](#block-114), [116](#block-116), [120](#block-120), [126](#block-126), [176](#block-176), [195](#block-195), [196](#block-196), [198](#block-198), [202](#block-202), [230](#block-230), [231](#block-231), [255](#block-255), [257](#block-257), [258](#block-258), [261](#block-261), [263](#block-263), [285](#block-285).

**`CMPLR`** — One-player/computer-game selection flag.

Declared: [149:1](#block-149) (byte variable).

Used in blocks: [121](#block-121), [128](#block-128), [129](#block-129), [131](#block-131), [149](#block-149).

**`CMPOF`** — Native subroutine. CMPOF returns if outfield control is inactive; otherwise preserve IX, choose LF/CF/RF from destination X and save CMFLDR.

Declared: [173:2](#block-173) (native subroutine).

Used in blocks: [173](#block-173), [193](#block-193), [254](#block-254).

**`CMPT`** — Computer pitching/outfield-control flag.

Declared: [149:7](#block-149) (byte variable).

Used in blocks: [123](#block-123), [128](#block-128), [129](#block-129), [149](#block-149), [158](#block-158), [162](#block-162), [175](#block-175), [193](#block-193), [194](#block-194).

**`CMSW`** — Computer batting/runner-control flag.

Declared: [149:7](#block-149) (byte variable).

Used in blocks: [123](#block-123), [125](#block-125), [126](#block-126), [128](#block-128), [129](#block-129), [149](#block-149).

**`CNLINE`** — Definition. CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state.

Declared: [271:9](#block-271) (definition).

Definition tokens: `: CNLINE ( YIN ! XIN ! cnline ;`.

Used in blocks: [271](#block-271), [272](#block-272), [273](#block-273).

**`cnline`** — Native word / kernel binding. cnline preserves BC/IY/IX and the interrupt-enable state captured by LD A,I, calls the line VECTOR routine under DI, restores registers and conditionally EI, then continues loading.

Declared: [270:10](#block-270) (native word / kernel binding).

Used in blocks: [270](#block-270), [271](#block-271).

**`CNOTE`** — Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

Declared: [141:10](#block-141) (definition).

Definition tokens: `: CNOTE } CTONE DURATION { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [141](#block-141).

**`CNSW1`** — Pricing-mode DIP state, inverted from input port $12 bit 0 in TF.

Declared: [149:1](#block-149) (byte variable).

Used in blocks: [121](#block-121), [127](#block-127), [128](#block-128), [129](#block-129), [131](#block-131), [149](#block-149), [305](#block-305).

**`CNSW12`** — Continuation/pricing state used when one credit may be insufficient for two players.

Declared: [149:4](#block-149) (byte variable).

Used in blocks: [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [149](#block-149), [236](#block-236).

**`CNTBL`** — Named data address. Retain CNTBL's corner-coordinate data. Continue to the boundary-hit calculations.

Declared: [158:13](#block-158) (data label).

Used in blocks: [158](#block-158), [159](#block-159).

**`CNTM1`** — Coin-door 1 debounce/acceptance latch.

Declared: [149:4](#block-149) (byte variable).

Used in blocks: [149](#block-149), [287](#block-287).

**`CNTM2`** — Coin-door 2 debounce/acceptance latch.

Declared: [149:4](#block-149) (byte variable).

Used in blocks: [149](#block-149), [288](#block-288).

**`CNZ,`** — Emit a call if the zero flag is clear.

Used in blocks: [132](#block-132), [165](#block-165), [174](#block-174), [193](#block-193), [234](#block-234), [236](#block-236), [254](#block-254), [255](#block-255), [257](#block-257).

**`CODE`** — Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry.

Used in blocks: [87](#block-87), [88](#block-88), [89](#block-89), [114](#block-114), [115](#block-115), [116](#block-116), [119](#block-119), [122](#block-122), [124](#block-124), [125](#block-125), [132](#block-132), [143](#block-143), [145](#block-145), [159](#block-159), [167](#block-167), [177](#block-177), [179](#block-179), [180](#block-180), [190](#block-190), [191](#block-191), [192](#block-192), [194](#block-194), [195](#block-195), [196](#block-196), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [207](#block-207), [208](#block-208), [230](#block-230), [232](#block-232), [233](#block-233), [234](#block-234), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [244](#block-244), [245](#block-245), [246](#block-246), [250](#block-250), [251](#block-251), [252](#block-252), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [262](#block-262), [270](#block-270), [271](#block-271), [276](#block-276), [291](#block-291), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304).

**`COINS`** — Byte variable; allocated at the declaration location. 

Declared: [149:3](#block-149) (byte variable).

Used in blocks: [149](#block-149).

**`COINSCORE`** — Byte table. Emit COINSCORE with volume/noise/vibrato setup and a short chord. The parenthesized alternative notes are comments; continue loading.

Declared: [134:10](#block-134) (byte table).

Used in blocks: [134](#block-134), [146](#block-146).

**`COLORBAND`** — Native subroutine. COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled. Its unusual NEXT/XTHL entry follows the scheduler's calling convention.

Declared: [269:1](#block-269) (native subroutine).

Used in blocks: [269](#block-269).

**`COMMITED`** — Byte variable; allocated at the declaration location. 

Declared: [152:10](#block-152) (byte variable).

Used in blocks: [152](#block-152).

**`COMPDE`** — Native word / kernel binding. Save radix and select hex. COMPHL forms two's complement of HL; COMPDE applies the same operation to DE while preserving HL.

Declared: [233:4](#block-233) (native word / kernel binding).

Used in blocks: [231](#block-231), [233](#block-233), [253](#block-253).

**`COMPHL`** — Native word / kernel binding. Save radix and select hex. COMPHL forms two's complement of HL; COMPDE applies the same operation to DE while preserving HL.

Declared: [233:2](#block-233) (native word / kernel binding).

Used in blocks: [174](#block-174), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [261](#block-261).

**`CONCM`** — Constant CONCM, assigned source expression/value `8` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:5](#block-290) (constant).

Used in blocks: [290](#block-290).

**`CONGR`** — Definition. Define congratulatory, loss and one-coin prompts and continue loading.

Declared: [127:10](#block-127) (definition).

Definition tokens: `: CONGR 700 1000 828 A" SPOST 0E00 2800 828 A" SPOST ;`.

Used in blocks: [127](#block-127), [129](#block-129).

**`CONSTANT`** — Define a constant from a value.

Used in blocks: [10](#block-10), [98](#block-98), [113](#block-113), [304](#block-304).

**`COUNT`** — Native counted-string helper at $00E6; used to obtain the address/length for PPOST.

Declared: [276:2](#block-276) (native word / kernel binding).

Used in blocks: [248](#block-248), [276](#block-276).

**`COUT`** — Constant COUT, assigned source expression/value `2` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

Declared: [179:6](#block-179) (constant).

Used in blocks: [117](#block-117), [179](#block-179), [182](#block-182).

**`CPI,`** — Compare A with an immediate byte.

Used in blocks: [117](#block-117), [126](#block-126), [159](#block-159), [160](#block-160), [173](#block-173), [174](#block-174), [177](#block-177), [192](#block-192), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [200](#block-200), [203](#block-203), [208](#block-208), [246](#block-246), [253](#block-253), [259](#block-259), [260](#block-260), [262](#block-262), [264](#block-264), [265](#block-265), [279](#block-279).

**`CPOST`** — Definition. 3DROP discards three cells. CPOST calls lower-case cpost, then discards its returned X/Y/options.

Declared: [248:2](#block-248) (definition).

Definition tokens: `: CPOST ( ( ( cpost 3DROP ;`.

Used in blocks: [237](#block-237), [248](#block-248), [272](#block-272), [273](#block-273), [274](#block-274).

**`cpost`** — Native word / kernel binding. Define SMFONT and ZEROSP option-bit positions and document cpost's retained X/Y/options return values.

Declared: [246:4](#block-246) (native word / kernel binding).

Used in blocks: [246](#block-246), [248](#block-248), [249](#block-249).

**`CR`** — Output a newline on the host console.

Used in blocks: [102](#block-102), [103](#block-103), [104](#block-104), [105](#block-105), [106](#block-106).

**`CRACKSCORE`** — Byte table. Emit CRACKSCORE and the FENCESCORE entry that chains into it using LDPCC; continue the score chain.

Declared: [135:11](#block-135) (byte table).

Used in blocks: [135](#block-135), [146](#block-146).

**`CREDARROW`** — Definition. CREDARROW clears UPCRED and handles STRT1, the coin-mode switch, game-over/player-selection state and computer-player pricing. Some credits remain as a one-credit remainder in two-player mode.

Declared: [121:4](#block-121) (definition).

Definition tokens: `: CREDARROW ( DI UPCRED BZERO STRT1 B@ IF SELECT BONE ELSE CREDITS B@ CREDITS BZERO DUP IF CNSW1 B@ IF GAMEOVER B@ IF CREDITS B! CHKPLRS B@ IF ELSE SELECT BONE THEN 0 ELSE CMPLR B@ IF LINN B@ IF 2* ELSE SELECT BONE 1- 2* 1+ THEN ELSE ( DUP 1 AND CREDITS B! 0FE AND LINN B@ IF ELSE SELECT BONE 1- THEN …`.

Used in blocks: [121](#block-121), [131](#block-131), [132](#block-132).

**`CREDITS`** — Available credit byte, incremented by accepted coins and consumed/reworked by inning pricing.

Declared: [149:3](#block-149) (byte variable).

Used in blocks: [121](#block-121), [128](#block-128), [129](#block-129), [149](#block-149), [236](#block-236), [287](#block-287), [288](#block-288), [305](#block-305).

**`CSAFE`** — Constant CSAFE, assigned source expression/value `6` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

Declared: [179:6](#block-179) (constant).

Used in blocks: [116](#block-116), [179](#block-179).

**`CSTRIKE`** — Constant CSTRIKE, assigned source expression/value `3` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

Declared: [179:6](#block-179) (constant).

Used in blocks: [179](#block-179), [262](#block-262).

**`CTONE`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:2](#block-141) (definition).

Definition tokens: `: CTONE } 13 B, B, { ;`.

Used in blocks: [138](#block-138), [141](#block-141).

**`CVRBUP`** — Named data address. Emit perspective lists for cover, throw, invisible, run, field and standing animations, using repeated entries where fewer unique sizes exist.

Declared: [189:1](#block-189) (data label).

Used in blocks: [189](#block-189).

**`CVRBUP1`** — Named data address. Create standing, pitcher-standing and covering two-frame pairs.

Declared: [188:6](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`CVRBUP2`** — Named data address. Create standing, pitcher-standing and covering two-frame pairs.

Declared: [188:7](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`CWALK`** — Constant CWALK, assigned source expression/value `7` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

Declared: [179:7](#block-179) (constant).

Used in blocks: [179](#block-179), [182](#block-182).

**`CY,`** — Assembler carry-set condition selector.

Used in blocks: [208](#block-208), [231](#block-231), [261](#block-261), [279](#block-279), [284](#block-284).

**`CY~,`** — Assembler carry-clear condition selector.

Used in blocks: [279](#block-279), [281](#block-281), [283](#block-283).

**`CZ,`** — Emit a call if the zero flag is set.

Used in blocks: [132](#block-132), [166](#block-166), [238](#block-238), [259](#block-259), [268](#block-268).

### Dictionary: D

**`D`** — Assembler D/DE-pair designator according to instruction; may also be hexadecimal data.

Used in blocks: [114](#block-114), [115](#block-115), [117](#block-117), [120](#block-120), [122](#block-122), [125](#block-125), [126](#block-126), [143](#block-143), [144](#block-144), [159](#block-159), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [192](#block-192), [193](#block-193), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [200](#block-200), [201](#block-201), [202](#block-202), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [232](#block-232), [234](#block-234), [237](#block-237), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [247](#block-247), [250](#block-250), [251](#block-251), [253](#block-253), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [261](#block-261), [263](#block-263), [265](#block-265), [266](#block-266), [269](#block-269), [271](#block-271), [276](#block-276), [277](#block-277), [279](#block-279), [281](#block-281), [282](#block-282), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288), [291](#block-291).

**`DAA,`** — Decimal-adjust A after packed-BCD arithmetic.

Used in blocks: [114](#block-114), [250](#block-250).

**`DAD,`** — Add a register pair to HL.

Used in blocks: [114](#block-114), [117](#block-117), [122](#block-122), [144](#block-144), [193](#block-193), [207](#block-207), [237](#block-237), [241](#block-241), [242](#block-242), [243](#block-243), [247](#block-247), [253](#block-253), [257](#block-257), [271](#block-271), [276](#block-276), [279](#block-279), [282](#block-282), [283](#block-283), [284](#block-284).

**`DADX,`** — Add a register pair to IX.

Used in blocks: [277](#block-277).

**`DADY,`** — Add a register pair to IY.

Used in blocks: [261](#block-261).

**`DATA`** — Declare a named data location; game source wraps it as LABLE.

Used in blocks: [291](#block-291), [304](#block-304).

**`DBLFLAG`** — Double-play progression flag used while advancing PLAYON.

Declared: [151:9](#block-151) (byte variable).

Used in blocks: [114](#block-114), [117](#block-117), [151](#block-151), [162](#block-162).

**`DBLPLAY`** — Double-play opportunity/request flag.

Declared: [149:12](#block-149) (byte variable).

Used in blocks: [117](#block-117), [149](#block-149), [165](#block-165).

**`DCR,`** — Decrement a byte operand.

Used in blocks: [115](#block-115), [143](#block-143), [144](#block-144), [160](#block-160), [173](#block-173), [177](#block-177), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [200](#block-200), [203](#block-203), [207](#block-207), [208](#block-208), [233](#block-233), [236](#block-236), [237](#block-237), [243](#block-243), [260](#block-260), [261](#block-261), [266](#block-266), [268](#block-268), [269](#block-269), [279](#block-279), [282](#block-282), [286](#block-286).

**`DCX,`** — Decrement a register pair.

Used in blocks: [122](#block-122), [207](#block-207), [234](#block-234), [241](#block-241), [243](#block-243), [281](#block-281).

**`DEACT,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:10](#block-225) (definition).

Definition tokens: `: DEACT, } 0C B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226), [227](#block-227), [229](#block-229).

**`DEACTIVATE`** — Native word / kernel binding. DEACTIVATE clears VACT in the IX vector record and sets SAMEDLT so playaction loading can retain existing motion; return and continue.

Declared: [190:4](#block-190) (native word / kernel binding).

Used in blocks: [190](#block-190), [199](#block-199).

**`debounce`** — Native subroutine. Preserve BC, move the port/mask into working registers and sample `(input XOR expected) AND mask`; return A=1 after enough consecutive matches.

Declared: [286:7](#block-286) (native subroutine).

Used in blocks: [286](#block-286), [287](#block-287), [288](#block-288).

**`DEC-X`** — Native branch/loop label. DEC-X performs the inverse rotations/address step and decrements X-AXIS; continue without closing assembly.

Declared: [281:10](#block-281) (assembler label), [281:2](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [283](#block-283).

**`DEC-Y`** — Native branch/loop label. DEC-Y subtracts 80 bytes; YSTEP jumps through IY using PCIY,. Restore radix and continue the open assembly chain.

Declared: [282:4](#block-282) (assembler label), [281:2](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [282](#block-282), [283](#block-283).

**`DECIMAL`** — Select radix ten for parsing subsequent source numbers.

Used in blocks: [10](#block-10), [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [89](#block-89), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [146](#block-146), [147](#block-147), [148](#block-148), [149](#block-149), [167](#block-167), [173](#block-173), [207](#block-207), [208](#block-208), [229](#block-229), [250](#block-250), [252](#block-252), [269](#block-269), [272](#block-272), [275](#block-275), [279](#block-279), [282](#block-282), [288](#block-288), [304](#block-304), [306](#block-306).

**`DEFINITIONS`** — Set the current definition vocabulary in the active host/XC context.

Used in blocks: [34](#block-34), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101).

**`DELIM`** — Host parser delimiter variable; XC-STRING sets it to double quote.

Used in blocks: [99](#block-99).

**`DI`** — Target disable-interrupts primitive at $0243.

Declared: [89:9](#block-89) (native word / kernel binding), [292:4](#block-292) (native word / kernel binding).

Used in blocks: [89](#block-89), [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [133](#block-133), [214](#block-214), [236](#block-236), [238](#block-238), [273](#block-273), [292](#block-292), [305](#block-305).

**`DI,`** — Disable maskable interrupts.

Used in blocks: [114](#block-114), [116](#block-116), [118](#block-118), [119](#block-119), [122](#block-122), [124](#block-124), [125](#block-125), [126](#block-126), [173](#block-173), [177](#block-177), [239](#block-239), [246](#block-246), [254](#block-254), [270](#block-270), [292](#block-292), [304](#block-304).

**`DIR-BLOCK`** — Host variable selecting the directory block; loaders set it to decimal 32.

Used in blocks: [10](#block-10), [33](#block-33), [94](#block-94).

**`DISKOFF`** — Disable disk access after loading the saved image.

Used in blocks: [10](#block-10).

**`DISKON`** — Enable disk access for the saved-image loader.

Used in blocks: [10](#block-10).

**`DIVHLBY4`** — Native word / kernel binding. DIVHLBY4 records the sign, negates to absolute magnitude, shifts right twice and reapplies the sign; this truncates the magnitude before sign restoration.

Declared: [234:2](#block-234) (native word / kernel binding).

Used in blocks: [234](#block-234), [257](#block-257).

**`DJNZ,`** — Decrement B and branch while it is nonzero.

Used in blocks: [207](#block-207), [208](#block-208), [231](#block-231), [279](#block-279).

**`DLINE`** — Definition. DLINE saves endpoint and initial X/Y state, converts Y for strtline, draws through cnline and continues loading.

Declared: [271:12](#block-271) (definition).

Definition tokens: `: DLINE ( YIN ! XIN ! 2DUP Y-AXIS ! X-AXIS ! SWAB ( strtline cnline ;`.

Used in blocks: [271](#block-271), [272](#block-272), [273](#block-273).

**`DNTRI`** — Named data address. Emit up/down inning triangles and the inning marker, then continue to the next pattern screen.

Declared: [107:14](#block-107) (data label).

Used in blocks: [107](#block-107), [130](#block-130).

**`DO`** — Native counted-loop entry at $0176.

Declared: [276:5](#block-276) (native word / kernel binding).

Used in blocks: [10](#block-10), [98](#block-98), [99](#block-99), [121](#block-121), [181](#block-181), [212](#block-212), [213](#block-213), [236](#block-236), [238](#block-238), [248](#block-248), [249](#block-249), [273](#block-273), [276](#block-276), [305](#block-305).

**`DOCHGS`** — Definition. FLSHOFF disables flashing and services cleanup under DI. DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; continue.

Declared: [239:12](#block-239) (definition).

Definition tokens: `: DOCHGS ' CHGS FLSHTON 28 DWAIT FLSHOFF GAMEOVER BZERO ;`.

Used in blocks: [129](#block-129), [130](#block-130), [239](#block-239).

**`DOEHOMER`** — Definition. DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; DOEHOMER only posts the text. Continue.

Declared: [180:4](#block-180) (definition).

Definition tokens: `: DOEHOMER SHOMER ;`.

Used in blocks: [180](#block-180), [183](#block-183).

**`DOGOVER`** — Definition. DOGOVER resets innings, scores, computer control, flashing and selection state; shows pricing with timed waits and returns to SHILL attract mode.

Declared: [128:9](#block-128) (definition).

Definition tokens: `: DOGOVER ( SGO 32 OUTS B! CMSW BONE CMPT BONE PX0 2A B6 4D 8 RECTAN EIDI 8C0 INNX ! INN# BZERO GAMEOVER BZERO 9 LINN B! MLINN DI GAMEOVER BONE LINN BZERO SCORE1 ZERO PX1 SCRS CMPLR BZERO FLSHSTAY B@ IF FLSHSTAY BZERO FLSHOFF THEN 10 TWAIT INSCN 80 TWAIT INSCN CREDITS B@ IF SGO THEN SHILL BONE FLSHOFF DROP 0 PLYR1UP BZERO ( …`.

Used in blocks: [128](#block-128), [129](#block-129), [130](#block-130).

**`DOHOMER`** — Definition. DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; DOEHOMER only posts the text. Continue.

Declared: [180:3](#block-180) (definition).

Definition tokens: `: DOHOMER BALLERASE SHOMER CLRBLST SBO STRINGOFFTIMER BZERO ;`.

Used in blocks: [180](#block-180), [183](#block-183).

**`DOSAFE`** — Definition. DOSAFE combines music/text. STETBL holds redraw addresses for erasing old XOR text, including the repeated SAFE entry and WALK.

Declared: [183:1](#block-183) (definition).

Definition tokens: `: DOSAFE MSAFE SSAFE ;`.

Used in blocks: [183](#block-183).

**`DOSBALL`** — Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

Declared: [179:11](#block-179) (definition).

Definition tokens: `: DOSBALL BALLS B@ DUP 31 = IF DROP SBALL1 ELSE 32 = IF SBALL2 ELSE SBALL3 THEN THEN ;`.

Used in blocks: [179](#block-179), [182](#block-182), [183](#block-183).

**`DOSOUT`** — Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

Declared: [179:8](#block-179) (definition).

Definition tokens: `: DOSOUT OUTS B@ DUP 31 = IF DROP SOUT1 ELSE 32 = IF SOUT2 ELSE SOUT3 THEN THEN ;`.

Used in blocks: [179](#block-179), [181](#block-181), [183](#block-183).

**`DOSSTRIKE`** — Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

Declared: [179:10](#block-179) (definition).

Definition tokens: `: DOSSTRIKE STRIKES B@ 31 = IF SSTRIKE1 ELSE SSTRIKE2 THEN ;`.

Used in blocks: [179](#block-179), [182](#block-182), [183](#block-183).

**`DOVERB`** — Definition. DOVERB emits $CF (RST $08), followed by the target call/return tokens obtained through the saved compiler and the shared bridge.

Declared: [98:10](#block-98) (definition).

Definition tokens: `: DOVERB XC-RBRIDGE 0CF OB, 0881D EXECUTE T, T, ;`.

Used in blocks: [98](#block-98), [118](#block-118), [122](#block-122), [124](#block-124), [126](#block-126), [132](#block-132), [143](#block-143), [239](#block-239), [268](#block-268), [287](#block-287), [288](#block-288).

**`DOWUP`** — Deferred team-indicator redraw state used when special flashing owns the callback.

Declared: [151:1](#block-151) (byte variable).

Used in blocks: [126](#block-126), [151](#block-151), [240](#block-240).

**`DP`** — Host dictionary allocation pointer.

Used in blocks: [10](#block-10), [102](#block-102).

**`DP1`** — Definition. Define congratulatory, loss and one-coin prompts and continue loading.

Declared: [127:13](#block-127) (definition).

Definition tokens: `: DP1 1A00 2C00 828 A" SPOST ;`.

Used in blocks: [127](#block-127), [128](#block-128).

**`DP12CN`** — Definition. Define one-coin and switch-dependent two-coin prompts using SPOST.

Declared: [305:3](#block-305) (definition).

Definition tokens: `: DP12CN CNSW1 B@ IF 300 2800 828 A" SPOST ELSE DP1CN THEN ;`.

Used in blocks: [305](#block-305).

**`DP1CN`** — Definition. Define one-coin and switch-dependent two-coin prompts using SPOST.

Declared: [305:1](#block-305) (definition).

Definition tokens: `: DP1CN 400 2800 828 A" SPOST ;`.

Used in blocks: [127](#block-127), [305](#block-305).

**`DPCN`** — Definition. DPCN clears credits, performs two waits while displaying the prompt, clears GAMEOVER if a credit arrived or updates LINN/UPCRED otherwise, then increments CREDITS as the source explicitly specifies.

Declared: [305:6](#block-305) (definition).

Definition tokens: `: DPCN ( DP1CN CREDITS BZERO FF TWAIT FF TWAIT DP1CN CREDITS B@ IF GAMEOVER BZERO ELSE LINN BZERO UPCRED BONE THEN CREDITS 1+B! ;`.

Used in blocks: [129](#block-129), [305](#block-305).

**`DPHIT`** — Ground-hit opportunity for double-play selection.

Declared: [152:9](#block-152) (byte variable).

Used in blocks: [152](#block-152), [155](#block-155), [157](#block-157), [165](#block-165), [166](#block-166).

**`dpost`** — Definition. dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.

Declared: [249:7](#block-249) (definition).

Definition tokens: `: dpost 0F AND OVER 4000 AND 4000 XOR OVER OR IF 30 + SWAP BFFF AND SWAP ELSE DROP 20 THEN cpost ;`.

Used in blocks: [249](#block-249).

**`DPTMP`** — Byte variable; allocated at the declaration location. 

Declared: [153:2](#block-153) (byte variable).

Used in blocks: [153](#block-153).

**`DROP`** — Discard the top stack cell.

Declared: [87:3](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [33](#block-33), [87](#block-87), [94](#block-94), [98](#block-98), [99](#block-99), [101](#block-101), [121](#block-121), [123](#block-123), [128](#block-128), [130](#block-130), [131](#block-131), [132](#block-132), [158](#block-158), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [184](#block-184), [212](#block-212), [213](#block-213), [236](#block-236), [239](#block-239), [248](#block-248), [249](#block-249), [272](#block-272), [305](#block-305).

**`DSBC,`** — Subtract a register pair and carry from HL.

Used in blocks: [196](#block-196), [230](#block-230), [242](#block-242), [261](#block-261), [266](#block-266), [276](#block-276), [283](#block-283), [285](#block-285).

**`DSTCALC`** — Native word / kernel binding. Save radix, declare labels and document the register interface: destination X in HL, Y in DE, speed in A; result Y delta in HL, X delta in DE and pattern/magic in BC.

Declared: [230:3](#block-230) (native word / kernel binding).

Used in blocks: [173](#block-173), [192](#block-192), [194](#block-194), [195](#block-195), [198](#block-198), [230](#block-230).

**`DSTLD`** — Native word / kernel binding. DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.

Declared: [232:1](#block-232) (native word / kernel binding).

Used in blocks: [192](#block-192), [194](#block-194), [232](#block-232).

**`DSTSET`** — Native branch/loop label. Restore Y/X signs with COMPHL/COMPDE, choose LRUN/RRUN, clear RDST, set VGO, return and close assembly; continue.

Declared: [230:2](#block-230) (forward declaration), [231:10](#block-231) (assembler label).

Used in blocks: [230](#block-230), [231](#block-231).

**`DTC`** — Definition. EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. DTC selects decimal and invokes the host editor.

Declared: [304:7](#block-304) (definition).

Definition tokens: `: DTC } DECIMAL EDIT { ;`.

Used in blocks: [304](#block-304).

**`DUGOUT`** — Named data address. Select hex and emit DUGOUT's pattern bytes with its metadata.

Declared: [270:2](#block-270) (data label).

Used in blocks: [270](#block-270), [274](#block-274).

**`DUP`** — Duplicate the top stack cell.

Declared: [87:1](#block-87) (native word / kernel binding).

Used in blocks: [10](#block-10), [87](#block-87), [97](#block-97), [98](#block-98), [99](#block-99), [101](#block-101), [121](#block-121), [123](#block-123), [129](#block-129), [130](#block-130), [131](#block-131), [133](#block-133), [157](#block-157), [158](#block-158), [162](#block-162), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [213](#block-213), [233](#block-233), [236](#block-236), [239](#block-239), [272](#block-272), [275](#block-275), [305](#block-305).

**`DURATION`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:5](#block-141) (definition).

Definition tokens: `: DURATION } 1 B, B, { ;`.

Used in blocks: [135](#block-135), [136](#block-136), [138](#block-138), [141](#block-141).

**`DWAIT`** — Definition. CHGS posts CHANGE SIDES; DWAIT runs nested loops with interrupts enabled and disables them on return; continue.

Declared: [238:9](#block-238) (definition).

Definition tokens: `: DWAIT EI 0 DO FF 0 DO LOOP LOOP DI ;`.

Used in blocks: [131](#block-131), [238](#block-238), [239](#block-239).

### Dictionary: E

**`E`** — Assembler E-register operand; may also be hexadecimal data.

Used in blocks: [114](#block-114), [119](#block-119), [120](#block-120), [143](#block-143), [174](#block-174), [176](#block-176), [197](#block-197), [200](#block-200), [201](#block-201), [202](#block-202), [207](#block-207), [230](#block-230), [231](#block-231), [232](#block-232), [234](#block-234), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [247](#block-247), [250](#block-250), [251](#block-251), [255](#block-255), [257](#block-257), [258](#block-258), [261](#block-261), [271](#block-271), [276](#block-276), [279](#block-279), [281](#block-281), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286).

**`EDIT`** — Invoke the external host editor.

Used in blocks: [304](#block-304).

**`EI`** — Target enable-interrupts primitive at $0246.

Declared: [89:10](#block-89) (native word / kernel binding), [292:5](#block-292) (native word / kernel binding).

Used in blocks: [89](#block-89), [121](#block-121), [129](#block-129), [131](#block-131), [133](#block-133), [214](#block-214), [236](#block-236), [238](#block-238), [273](#block-273), [274](#block-274), [292](#block-292), [305](#block-305).

**`EI,`** — Enable maskable interrupts under Z80 timing rules.

Used in blocks: [114](#block-114), [117](#block-117), [118](#block-118), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [173](#block-173), [177](#block-177), [247](#block-247), [264](#block-264), [269](#block-269), [270](#block-270), [291](#block-291), [292](#block-292), [304](#block-304).

**`EIDI`** — Native word / kernel binding. EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. DTC selects decimal and invokes the host editor.

Declared: [304:6](#block-304) (native word / kernel binding).

Used in blocks: [128](#block-128), [130](#block-130), [274](#block-274), [275](#block-275), [304](#block-304).

**`ELSE`** — Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch.

Declared: [100:9](#block-100) (definition).

Definition tokens: `: ELSE } XC-ELSE { ;`.

Used in blocks: [100](#block-100), [101](#block-101), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [236](#block-236), [238](#block-238), [239](#block-239), [240](#block-240), [249](#block-249), [305](#block-305), [306](#block-306).

**`ELSE,`** — Emit the alternative structured assembler branch.

Used in blocks: [114](#block-114), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [159](#block-159), [160](#block-160), [173](#block-173), [176](#block-176), [177](#block-177), [192](#block-192), [194](#block-194), [195](#block-195), [198](#block-198), [201](#block-201), [202](#block-202), [203](#block-203), [208](#block-208), [231](#block-231), [233](#block-233), [239](#block-239), [242](#block-242), [243](#block-243), [246](#block-246), [247](#block-247), [255](#block-255), [257](#block-257), [259](#block-259), [260](#block-260), [262](#block-262), [263](#block-263), [267](#block-267), [269](#block-269), [283](#block-283), [284](#block-284), [285](#block-285), [287](#block-287), [288](#block-288).

**`EMUSIC`** — Native word / kernel binding. EMUSIC selects ENDMUSIC and initializes timing/repetition to one; it is intended for startup.

Declared: [145:4](#block-145) (native word / kernel binding).

Used in blocks: [133](#block-133), [145](#block-145).

**`END`** — Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true.

Declared: [100:11](#block-100) (definition).

Definition tokens: `: END } XC-END { ;`.

Used in blocks: [100](#block-100), [236](#block-236), [272](#block-272), [305](#block-305), [306](#block-306).

**`END,`** — Emit the loop-ending conditional branch; preceding condition indicates completion.

Used in blocks: [115](#block-115), [207](#block-207), [236](#block-236), [237](#block-237), [243](#block-243), [261](#block-261), [266](#block-266).

**`ENDMUSIC`** — Byte table. Emit ENDMUSIC using QUIET and continue to note constants.

Declared: [141:15](#block-141) (byte table).

Used in blocks: [141](#block-141), [145](#block-145).

**`EX`** — Native word / kernel binding. EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.

Declared: [234:1](#block-234) (native word / kernel binding).

Used in blocks: [33](#block-33), [94](#block-94), [157](#block-157), [158](#block-158), [184](#block-184), [234](#block-234), [239](#block-239).

**`EXAF,`** — Exchange AF with its alternate register pair.

Used in blocks: [177](#block-177), [230](#block-230), [231](#block-231), [246](#block-246), [247](#block-247), [261](#block-261), [291](#block-291).

**`EXECUTE`** — Execute the address/definition the on the host stack.

Used in blocks: [34](#block-34), [98](#block-98), [100](#block-100), [101](#block-101).

**`EXTRABASES.ROM`** — Object filename passed to OBJECT-FILE; not an executed game word.

Used in blocks: [33](#block-33), [94](#block-94).

**`EXX,`** — Exchange BC/DE/HL with their alternate register bank.

Used in blocks: [159](#block-159), [160](#block-160), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [281](#block-281), [283](#block-283), [284](#block-284), [285](#block-285), [291](#block-291).

### Dictionary: F

**`F1STL`** — Game sector/bit constant F1STL = 12 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:5](#block-147) (constant).

Used in blocks: [147](#block-147), [170](#block-170).

**`F1STL1ST`** — Named data address. Emit first-base/pitcher routes, including WTHW, to wait for a throw before resuming.

Declared: [228:10](#block-228) (data label).

Used in blocks: [156](#block-156), [228](#block-228).

**`F1STLS`** — Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

Declared: [156:3](#block-156) (definition).

Definition tokens: `: F1STLS F1STPT F1STL1ST NOACTPA 0 ;`.

Used in blocks: [156](#block-156).

**`F1STPT`** — Named data address. Emit first-base/pitcher routes, including WTHW, to wait for a throw before resuming.

Declared: [228:12](#block-228) (data label).

Used in blocks: [156](#block-156), [228](#block-228).

**`F1STR`** — Game sector/bit constant F1STR = 11 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:5](#block-147) (constant).

Used in blocks: [147](#block-147), [170](#block-170).

**`F1STR1ST`** — Named data address. Emit first-base/pitcher routes, including WTHW, to wait for a throw before resuming.

Declared: [228:9](#block-228) (data label).

Used in blocks: [156](#block-156), [228](#block-228).

**`F1STRS`** — Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

Declared: [156:2](#block-156) (definition).

Definition tokens: `: F1STRS F1STPT F1STR1ST NOACTPA 0 ;`.

Used in blocks: [156](#block-156).

**`F2NDL`** — Game sector/bit constant F2NDL = 9 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:5](#block-147) (constant).

Used in blocks: [147](#block-147), [170](#block-170).

**`F2NDL2ND`** — Named data address. Emit shortstop and second-base action sequences for each relevant hit sector.

Declared: [228:6](#block-228) (data label).

Used in blocks: [155](#block-155), [228](#block-228).

**`F2NDLS`** — Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

Declared: [155:11](#block-155) (definition).

Definition tokens: `: F2NDLS DPHIT BONE HRPT HL1ST F2NDL2ND 0 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`F2NDR`** — Game sector/bit constant F2NDR = 8 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:5](#block-147) (constant).

Used in blocks: [147](#block-147), [170](#block-170).

**`F2NDR2ND`** — Named data address. Emit shortstop and second-base action sequences for each relevant hit sector.

Declared: [228:5](#block-228) (data label).

Used in blocks: [155](#block-155), [228](#block-228).

**`F2NDRS`** — Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

Declared: [155:10](#block-155) (definition).

Definition tokens: `: F2NDRS DPHIT BONE HRPT HL1ST F2NDR2ND 0 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`F3RDL`** — Game sector/bit constant F3RDL = 3 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:3](#block-147) (constant).

Used in blocks: [147](#block-147), [171](#block-171).

**`F3RDL3RD`** — Named data address. Emit third-base/shortstop fielding routes and continue the table chain.

Declared: [227:12](#block-227) (data label).

Used in blocks: [155](#block-155), [227](#block-227).

**`F3RDLS`** — Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

Declared: [155:5](#block-155) (definition).

Definition tokens: `: F3RDLS F3RDLSS F3RDL3RD 1 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`F3RDLSS`** — Named data address. Emit third-base/shortstop fielding routes and continue the table chain.

Declared: [227:13](#block-227) (data label).

Used in blocks: [155](#block-155), [227](#block-227).

**`F3RDR`** — Game sector/bit constant F3RDR = 2 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:3](#block-147) (constant).

Used in blocks: [147](#block-147), [171](#block-171).

**`F3RDR3RD`** — Named data address. Emit third-base/shortstop fielding routes and continue the table chain.

Declared: [227:11](#block-227) (data label).

Used in blocks: [155](#block-155), [227](#block-227).

**`F3RDRS`** — Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag.

Declared: [155:4](#block-155) (definition).

Definition tokens: `: F3RDRS NOACTPA F3RDR3RD 1 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`F=`** — Definition. Define zero-initialized cell/byte variable emitters V=/BV=, constant and forward shorthands C=/F=, and the deliberately spelled label alias LABLE for DATA.

Declared: [304:4](#block-304) (definition).

Definition tokens: `: F= } FORWARD { ;`.

Used in blocks: [164](#block-164), [196](#block-196), [304](#block-304).

**`FBL`** — Game sector/bit constant FBL = 0 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:3](#block-147) (constant).

Used in blocks: [147](#block-147), [171](#block-171).

**`FBLL3RD`** — Named data address. Emit foul-line retrieval and left-field-side third-base routes, including throw and base-cover commands.

Declared: [227:6](#block-227) (data label).

Used in blocks: [155](#block-155), [227](#block-227).

**`FBLLS`** — Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag.

Declared: [155:1](#block-155) (definition).

Definition tokens: `: FBLLS NOACTPA FBLL3RD 1 THROWAROUND BONE FOUL BONE ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`FBLR1ST`** — Named data address. Emit foul-line retrieval and left-field-side third-base routes, including throw and base-cover commands.

Declared: [227:5](#block-227) (data label).

Used in blocks: [156](#block-156), [227](#block-227).

**`FBLRS`** — Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

Declared: [156:5](#block-156) (definition).

Definition tokens: `: FBLRS FOUL BONE THROWAROUND BONE NOACTPA FBLR1ST NOACTPA 0 ;`.

Used in blocks: [156](#block-156).

**`FBR`** — Game sector/bit constant FBR = 14 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:6](#block-147) (constant).

Used in blocks: [147](#block-147), [170](#block-170).

**`FENCE`** — Pending fence collision/rebound event.

Declared: [149:15](#block-149) (byte variable).

Used in blocks: [149](#block-149), [159](#block-159), [162](#block-162), [193](#block-193).

**`FENCESCORE`** — Byte table. Emit CRACKSCORE and the FENCESCORE entry that chains into it using LDPCC; continue the score chain.

Declared: [135:14](#block-135) (byte table).

Used in blocks: [135](#block-135), [146](#block-146).

**`FETCH`** — Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

Declared: [143:2](#block-143) (native subroutine).

Used in blocks: [143](#block-143), [144](#block-144).

**`FG`** — Game sector/bit constant FG = 0 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:2](#block-147) (constant).

Used in blocks: [147](#block-147).

**`FHTBL`** — Cell table. Emit FHTBL fly-ball X destinations and GHTBL grounder X destinations.

Declared: [154:4](#block-154) (cell table).

Used in blocks: [154](#block-154), [161](#block-161).

**`FIELD`** — Byte table. Emit FIELD, a compact sequence consumed by GETF/FIELDWRT.

Declared: [270:6](#block-270) (byte table).

Used in blocks: [270](#block-270), [273](#block-273).

**`FIELDWRT`** — Definition. Allocate FINDEX. GETF fetches FIELD bytes sequentially; FIELDWRT draws the initial segment and eight continuations. FMIRROR supplies the other half later.

Declared: [273:4](#block-273) (definition).

Definition tokens: `: FIELDWRT ( FINDEX BZERO GETF GETF GETF GETF DLINE 8 0 DO GETF GETF CNLINE LOOP ;`.

Used in blocks: [273](#block-273), [274](#block-274).

**`FILES`** — Enable/restore the host file-access context around compilation.

Used in blocks: [33](#block-33), [94](#block-94), [98](#block-98).

**`FILL`** — Native byte fill at $0253, called as value/address/count in this source.

Declared: [293:4](#block-293) (native word / kernel binding).

Used in blocks: [273](#block-273), [293](#block-293).

**`FINDEX`** — Sequential byte index used by GETF to read FIELD.

Declared: [273:1](#block-273) (byte variable).

Used in blocks: [273](#block-273).

**`FL`** — Definition. Select hex, hide the incomplete screen via port $0A, clear RAM/background, enable interrupts, select infield/line pixel patterns and paint INFIELD/FIELDWRT.

Declared: [274:2](#block-274) (definition).

Definition tokens: `: FL ( 0 0A OUTP ZERORAM FLFILL ( EI 0 PXT3 PXTYPE ! INFIELD PX1 FIELDWRT 10C0 6600 BASEPAT 4428 WRITR 1D00 8D00 DUGOUT 868 WRITR FMIRROR 2880 4C00 BASE2PAT 4428 WRITR 2800 AC00 HOMEPLATE 8808 WRITR 2600 AF00 BATD90 8828 WRITR 0C AA 6E 15 OUTLINE 400 B000 828 A" SPOST B00 AF00 8408 A" SPOST C4 AA 60 15 OUTLINE 3300 B000 828 …`.

Used in blocks: [131](#block-131), [133](#block-133), [274](#block-274).

**`FLDCLR`** — Pending players/runners clearing the field; suppresses new throws/pitches.

Declared: [151:7](#block-151) (byte variable).

Used in blocks: [117](#block-117), [122](#block-122), [126](#block-126), [151](#block-151), [195](#block-195), [198](#block-198), [238](#block-238).

**`FLDDST`** — Native word / kernel binding. FLDDST calculates motion at speed 4. On pitcher arrival select STPT and initialize pitch/timeout/outfield-control state; other arrivals select STND.

Declared: [194:1](#block-194) (native word / kernel binding).

Used in blocks: [194](#block-194), [199](#block-199).

**`FLDDST,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:9](#block-225) (definition).

Definition tokens: `: FLDDST, } 7 B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226).

**`FLDDX`** — Cell variable. Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

Declared: [150:7](#block-150) (cell variable).

Used in blocks: [150](#block-150), [194](#block-194).

**`FLDDY`** — Cell variable. Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

Declared: [150:7](#block-150) (cell variable).

Used in blocks: [150](#block-150), [194](#block-194).

**`FLDON1ST`** — Pointer to the defender covering first base.

Declared: [152:6](#block-152) (cell variable).

Used in blocks: [152](#block-152), [191](#block-191).

**`FLDON2ND`** — Pointer to the defender covering second base.

Declared: [152:6](#block-152) (cell variable).

Used in blocks: [152](#block-152), [191](#block-191).

**`FLDON3RD`** — Pointer to the defender covering third base.

Declared: [152:7](#block-152) (cell variable).

Used in blocks: [117](#block-117), [152](#block-152), [191](#block-191).

**`FLDOPCODE`** — Byte variable. Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

Declared: [150:7](#block-150) (byte variable).

Used in blocks: [150](#block-150), [212](#block-212).

**`FLDPA`** — Cell variable. Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

Declared: [150:8](#block-150) (cell variable).

Used in blocks: [150](#block-150), [194](#block-194).

**`FLDUP`** — Named data address. Emit perspective lists for cover, throw, invisible, run, field and standing animations, using repeated entries where fewer unique sizes exist.

Declared: [189:8](#block-189) (data label).

Used in blocks: [189](#block-189).

**`FLDUP1`** — Named data address. For each running/fielding perspective level, pair its B and M sprite addresses under RUNUPn or FLDUPn.

Declared: [186:6](#block-186) (data label).

Used in blocks: [186](#block-186), [189](#block-189).

**`FLDUP2`** — Named data address. For each running/fielding perspective level, pair its B and M sprite addresses under RUNUPn or FLDUPn.

Declared: [186:7](#block-186) (data label).

Used in blocks: [186](#block-186), [189](#block-189).

**`FLDUPDATE#`** — Byte variable; allocated at the declaration location. 

Declared: [150:8](#block-150) (byte variable).

Used in blocks: [150](#block-150).

**`FLFILL`** — Definition. FLFILL fills the background while allowing interrupts; ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. Continue loading.

Declared: [273:13](#block-273) (definition).

Definition tokens: `: FLFILL EI 0 4000 3C00 FILL DI ;`.

Used in blocks: [273](#block-273), [274](#block-274), [306](#block-306).

**`FLOAD`** — Load a named source file using the current file directory.

Used in blocks: [33](#block-33), [94](#block-94).

**`FLSHCNT`** — Current visible/invisible phase of flashing text.

Declared: [151:11](#block-151) (byte variable).

Used in blocks: [126](#block-126), [151](#block-151), [239](#block-239), [240](#block-240).

**`FLSHME`** — Definition. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line.

Declared: [239:2](#block-239) (definition).

Definition tokens: `: FLSHME FLSHWHO @ DUP 0C000 AND 0= OVER 0 <> AND IF EX ELSE DROP THEN ;`.

Used in blocks: [239](#block-239).

**`FLSHOFF`** — Native word / kernel binding. FLSHOFF disables flashing and services cleanup under DI. DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; continue.

Declared: [239:10](#block-239) (native word / kernel binding).

Used in blocks: [128](#block-128), [181](#block-181), [239](#block-239), [240](#block-240).

**`FLSHON`** — Enable flag for flashing text.

Declared: [151:11](#block-151) (byte variable).

Used in blocks: [118](#block-118), [126](#block-126), [151](#block-151), [239](#block-239).

**`FLSHSTAY`** — Flag reserving flashing/palette behavior for a special display state.

Declared: [151:4](#block-151) (byte variable).

Used in blocks: [118](#block-118), [126](#block-126), [128](#block-128), [130](#block-130), [151](#block-151), [240](#block-240), [264](#block-264), [269](#block-269).

**`FLSHTIME`** — Countdown until the next flash phase.

Declared: [151:11](#block-151) (byte variable).

Used in blocks: [118](#block-118), [126](#block-126), [151](#block-151), [239](#block-239), [254](#block-254).

**`FLSHTON`** — Definition. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line.

Declared: [239:1](#block-239) (definition).

Definition tokens: `: FLSHTON FLSHWHO ! FLSHON BONE FLSHTIME BONE ;`.

Used in blocks: [127](#block-127), [239](#block-239), [240](#block-240).

**`FLSHWHO`** — Execution-address callback for the currently flashing message.

Declared: [151:7](#block-151) (cell variable).

Used in blocks: [118](#block-118), [151](#block-151), [239](#block-239).

**`FLSHWUP`** — Native subroutine. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line.

Declared: [239:3](#block-239) (native subroutine).

Used in blocks: [239](#block-239), [254](#block-254).

**`FLYB`** — Game sector/bit constant FLYB = 1 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:2](#block-147) (constant).

Used in blocks: [147](#block-147).

**`FMIRROR`** — Native word / kernel binding. FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order.

Declared: [207:7](#block-207) (native word / kernel binding).

Used in blocks: [207](#block-207), [274](#block-274).

**`FNBB`** — Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

Declared: [163:1](#block-163) (native subroutine).

Used in blocks: [163](#block-163).

**`FNCX`** — Horizontal fence/homer perturbation/rebound component.

Declared: [151:2](#block-151) (cell variable).

Used in blocks: [151](#block-151), [159](#block-159), [160](#block-160), [193](#block-193).

**`FNCY`** — Vertical fence/homer perturbation/rebound component.

Declared: [151:2](#block-151) (cell variable).

Used in blocks: [151](#block-151), [159](#block-159), [193](#block-193).

**`FNTLP`** — Native branch/loop label. Allocate a five-byte FONTWORK buffer. FONTUNPACK reads two packed bytes and starts a five-row unpack loop.

Declared: [207:1](#block-207) (forward declaration), [207:3](#block-207) (assembler label).

Used in blocks: [207](#block-207).

**`FONTUNPACK`** — Native subroutine. Allocate a five-byte FONTWORK buffer. FONTUNPACK reads two packed bytes and starts a five-row unpack loop.

Declared: [207:2](#block-207) (native subroutine).

Used in blocks: [207](#block-207), [247](#block-247).

**`FONTWORK`** — Byte array. Allocate a five-byte FONTWORK buffer. FONTUNPACK reads two packed bytes and starts a five-row unpack loop.

Declared: [207:1](#block-207) (byte array).

Used in blocks: [207](#block-207).

**`FORW`** — Player/computer runner-advance input state.

Declared: [152:13](#block-152) (byte variable).

Used in blocks: [125](#block-125), [152](#block-152), [197](#block-197).

**`FORWARD`** — Declare a name for later resolution.

Used in blocks: [115](#block-115), [116](#block-116), [143](#block-143), [167](#block-167), [174](#block-174), [195](#block-195), [200](#block-200), [207](#block-207), [208](#block-208), [230](#block-230), [264](#block-264), [276](#block-276), [279](#block-279), [280](#block-280), [286](#block-286), [304](#block-304).

**`FOUL`** — Ground-hit foul flag.

Declared: [152:9](#block-152) (byte variable).

Used in blocks: [152](#block-152), [155](#block-155), [156](#block-156), [157](#block-157), [158](#block-158).

**`FOULSCORE`** — Byte table. Start FOULSCORE with no vibrato, then step the A voice down through timed notes before QUIET.

Declared: [135:0](#block-135) (byte table).

Used in blocks: [135](#block-135), [146](#block-146).

**`FOULTIME`** — Definition. FOULTIME posts FOUL and increments strikes only below two, then redraws counts; continue.

Declared: [182:11](#block-182) (definition).

Definition tokens: `: FOULTIME ( SFOUL STRIKES DUP B@ 32 = IF DROP ELSE 1+B! SBO THEN ;`.

Used in blocks: [182](#block-182), [183](#block-183).

**`FOWR`** — Definition. Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.

Declared: [280:1](#block-280) (definition).

Definition tokens: `: FOWR } FORWARD { ;`.

Used in blocks: [280](#block-280), [281](#block-281).

**`FRO1`** — Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

Declared: [163:2](#block-163) (native subroutine).

Used in blocks: [163](#block-163).

**`FRO12`** — Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

Declared: [163:5](#block-163) (native subroutine).

Used in blocks: [163](#block-163).

**`FRO123`** — Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

Declared: [163:7](#block-163) (native subroutine).

Used in blocks: [163](#block-163).

**`FRO13`** — Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

Declared: [163:8](#block-163) (native subroutine).

Used in blocks: [163](#block-163).

**`FRO2`** — Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

Declared: [163:3](#block-163) (native subroutine).

Used in blocks: [163](#block-163).

**`FRO23`** — Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

Declared: [163:6](#block-163) (native subroutine).

Used in blocks: [163](#block-163).

**`FRO3`** — Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

Declared: [163:4](#block-163) (native subroutine).

Used in blocks: [163](#block-163).

**`FS.XC`** — Saved compiler image filename passed to FSLD; not an executed game word.

Used in blocks: [33](#block-33), [94](#block-94).

**`FSLD`** — Restore/load the named saved environment FS.XC.

Used in blocks: [33](#block-33), [94](#block-94).

**`FSSL`** — Game sector/bit constant FSSL = 6 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:4](#block-147) (constant).

Used in blocks: [147](#block-147), [170](#block-170), [171](#block-171).

**`FSSLS`** — Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

Declared: [155:8](#block-155) (definition).

Definition tokens: `: FSSLS DPHIT BONE FSSLSS HR3RD 1 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`FSSLSS`** — Named data address. Emit shortstop and second-base action sequences for each relevant hit sector.

Declared: [228:3](#block-228) (data label).

Used in blocks: [155](#block-155), [228](#block-228).

**`FSSR`** — Game sector/bit constant FSSR = 5 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:4](#block-147) (constant).

Used in blocks: [147](#block-147), [171](#block-171).

**`FSSRS`** — Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

Declared: [155:7](#block-155) (definition).

Definition tokens: `: FSSRS DPHIT BONE FSSRSS HR3RD 1 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`FSSRSS`** — Named data address. Emit shortstop and second-base action sequences for each relevant hit sector.

Declared: [228:2](#block-228) (data label).

Used in blocks: [155](#block-155), [228](#block-228).

**`FUP1B`** — Named data address. Emit paired fielding records FUP1B/FUP2B and FUP1M/FUP2M.

Declared: [111:1](#block-111) (data label).

Used in blocks: [111](#block-111), [186](#block-186).

**`FUP1M`** — Named data address. Emit paired fielding records FUP1B/FUP2B and FUP1M/FUP2M.

Declared: [111:5](#block-111) (data label).

Used in blocks: [111](#block-111), [186](#block-186).

**`FUP2B`** — Named data address. Emit paired fielding records FUP1B/FUP2B and FUP1M/FUP2M.

Declared: [111:3](#block-111) (data label).

Used in blocks: [111](#block-111), [186](#block-186).

**`FUP2M`** — Named data address. Emit paired fielding records FUP1B/FUP2B and FUP1M/FUP2M.

Declared: [111:7](#block-111) (data label).

Used in blocks: [111](#block-111), [186](#block-186).

### Dictionary: G

**`GAMEOVER`** — Game-over/continuation state flag.

Declared: [149:3](#block-149) (byte variable).

Used in blocks: [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [133](#block-133), [149](#block-149), [181](#block-181), [239](#block-239), [305](#block-305).

**`GETF`** — Definition. Allocate FINDEX. GETF fetches FIELD bytes sequentially; FIELDWRT draws the initial segment and eight continuations. FMIRROR supplies the other half later.

Declared: [273:2](#block-273) (definition).

Definition tokens: `: GETF FINDEX B@ FIELD B@ FINDEX 1+B! ;`.

Used in blocks: [273](#block-273).

**`GHTBL`** — Cell table. Emit FHTBL fly-ball X destinations and GHTBL grounder X destinations.

Declared: [154:6](#block-154) (cell table).

Used in blocks: [154](#block-154), [158](#block-158).

**`GOSECNT`** — Byte variable; allocated at the declaration location. 

Declared: [151:14](#block-151) (byte variable).

Used in blocks: [151](#block-151).

**`GOSEO`** — Byte variable; allocated at the declaration location. 

Declared: [151:14](#block-151) (byte variable).

Used in blocks: [151](#block-151).

**`GRNDR`** — Grounder-motion flag enabling CHKGROUNDER perturbation.

Declared: [152:8](#block-152) (byte variable).

Used in blocks: [119](#block-119), [152](#block-152), [158](#block-158), [162](#block-162), [192](#block-192), [253](#block-253).

**`GRNDRACTION`** — Definition. GRNDRACTION clears prior hit/foul state, selects a GSTBL entry using the index and executes it with EX.

Declared: [157:1](#block-157) (definition).

Definition tokens: `: GRNDRACTION ( ( HITOF BZERO DPHIT BZERO FOUL BZERO GSTBL @ EX ( DUP HLSIDE B! IF VPLAYACTPC 3RD ! VPLAYACTPC SS ! HLPT VPLAYACTPC PT ! HL1ST VPLAYACTPC 1ST ! HL2ND VPLAYACTPC 2ND ! ELSE ( HRSS HR3RD LDINFLDPA THEN ;`.

Used in blocks: [157](#block-157), [158](#block-158).

**`GRNDRHIT`** — Definition. Mark a grounder and speed 2, combine a random choice with horizontal pitch direction and SWINGTYPE, save SECTNM and dispatch GRNDRACTION.

Declared: [158:1](#block-158) (definition).

Definition tokens: `: GRNDRHIT ( GRNDR BONE 2 VVEL BL B! 3 RND ( VDX BL 1+ B@ ( SWINGTYPE B@ SWINGTABLE @ EX DUP DUP DUP SECTNM B! GRNDRACTION FOUL B@ IF MFOUL 1 THROWAROUND B! CFOUL STRING B! HLSIDE B@ IF 800 ELSE 4800 THEN VDSTX BL ! 6400 VDSTY BL ! DROP DROP ELSE ( WUPGO HITOF B@ IF 10 TOTIMER B! TOOF BONE 3 …`.

Used in blocks: [158](#block-158), [162](#block-162).

**`GRNDRVALUE`** — Cyclic index into GVTBL.

Declared: [152:8](#block-152) (byte variable).

Used in blocks: [152](#block-152), [253](#block-253).

**`GSTBL`** — Cell table. Emit GSTBL in sector-number order using ticked execution addresses, then continue.

Declared: [156:7](#block-156) (cell table).

Used in blocks: [156](#block-156), [157](#block-157).

**`GVTBL`** — Named data address. Save radix, select hex and emit GVTBL with zero, $0040 and $FFC0 entries.

Declared: [253:2](#block-253) (data label).

Used in blocks: [253](#block-253).

### Dictionary: H

**`H`** — Assembler H/HL-pair designator according to instruction.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [159](#block-159), [164](#block-164), [167](#block-167), [173](#block-173), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [207](#block-207), [230](#block-230), [231](#block-231), [232](#block-232), [233](#block-233), [234](#block-234), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [250](#block-250), [251](#block-251), [252](#block-252), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [261](#block-261), [262](#block-262), [263](#block-263), [265](#block-265), [266](#block-266), [269](#block-269), [271](#block-271), [276](#block-276), [279](#block-279), [281](#block-281), [282](#block-282), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288), [291](#block-291), [292](#block-292).

**`H.`** — Print a number in hexadecimal for loader diagnostics.

Used in blocks: [102](#block-102), [106](#block-106), [149](#block-149), [216](#block-216).

**`HERE`** — Current allocation/compilation address in the active dictionary/data context.

Used in blocks: [10](#block-10), [98](#block-98), [99](#block-99), [102](#block-102), [106](#block-106), [141](#block-141), [291](#block-291).

**`HEX`** — Select radix sixteen for parsing subsequent source numbers.

Used in blocks: [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [89](#block-89), [90](#block-90), [91](#block-91), [92](#block-92), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [107](#block-107), [114](#block-114), [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141), [149](#block-149), [153](#block-153), [164](#block-164), [173](#block-173), [174](#block-174), [178](#block-178), [190](#block-190), [207](#block-207), [208](#block-208), [211](#block-211), [225](#block-225), [229](#block-229), [230](#block-230), [233](#block-233), [241](#block-241), [253](#block-253), [270](#block-270), [274](#block-274), [276](#block-276), [278](#block-278), [279](#block-279), [280](#block-280), [286](#block-286), [289](#block-289), [290](#block-290), [291](#block-291), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304), [305](#block-305).

**`HITDEEP`** — Byte variable; allocated at the declaration location. 

Declared: [152:9](#block-152) (byte variable).

Used in blocks: [152](#block-152).

**`HITDST`** — Definition. HITDST resets the ball update count, gives it THWBLPA, activates its ball status, selects BAL and places it at the batter's starting coordinates.

Declared: [154:1](#block-154) (definition).

Definition tokens: `: HITDST ( VUPDATE# BL BZERO THWBLPA VPLAYACTPC BL ! 82 VSTATUS BL B! ( BAL THWPA ! 2800 VX BL ! AD00 VY BL ! ;`.

Used in blocks: [154](#block-154), [158](#block-158), [161](#block-161).

**`HITGOING`** — Bat-contact latch preventing repeated hit-window acceptance during a swing.

Declared: [149:8](#block-149) (byte variable).

Used in blocks: [149](#block-149), [258](#block-258), [259](#block-259), [260](#block-260).

**`HITOF`** — Flag distinguishing outfield-hit logic from infield play.

Declared: [149:11](#block-149) (byte variable).

Used in blocks: [114](#block-114), [119](#block-119), [149](#block-149), [155](#block-155), [156](#block-156), [157](#block-157), [158](#block-158), [161](#block-161), [192](#block-192).

**`HITRUN`** — Native word / kernel binding. Declare HRRET, define HITRUN, clear OFTBLGO so ordinary runners do not automatically advance two bases, and preserve BC.

Declared: [167:2](#block-167) (native word / kernel binding).

Used in blocks: [158](#block-158), [167](#block-167), [182](#block-182).

**`HITTIME`** — Foreground request to process accepted bat contact.

Declared: [152:10](#block-152) (byte variable).

Used in blocks: [124](#block-124), [132](#block-132), [152](#block-152), [258](#block-258), [262](#block-262).

**`HITTYPE`** — Hit-selection branch state recorded by INLOG; see the source/comment discrepancy noted there.

Declared: [149:8](#block-149) (byte variable).

Used in blocks: [149](#block-149), [162](#block-162).

**`HITYET`** — Pitch-versus-post-hit state flag.

Declared: [152:11](#block-152) (byte variable).

Used in blocks: [124](#block-124), [125](#block-125), [126](#block-126), [130](#block-130), [152](#block-152), [202](#block-202), [258](#block-258), [262](#block-262).

**`HL`** — Game sector/bit constant HL = 4 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:4](#block-147) (constant).

Used in blocks: [147](#block-147), [171](#block-171).

**`HL1ST`** — Named data address. Emit first/second/third-base defensive routes and pitcher lateral motions using signed deltas, update counts and terminal cover/standing actions; continue.

Declared: [226:7](#block-226) (data label).

Used in blocks: [155](#block-155), [157](#block-157), [161](#block-161), [226](#block-226).

**`HL2ND`** — Named data address. Emit first/second/third-base defensive routes and pitcher lateral motions using signed deltas, update counts and terminal cover/standing actions; continue.

Declared: [226:8](#block-226) (data label).

Used in blocks: [157](#block-157), [161](#block-161), [226](#block-226).

**`HL3RD`** — Named data address. Emit third-base/shortstop fielding routes and continue the table chain.

Declared: [227:14](#block-227) (data label).

Used in blocks: [155](#block-155), [227](#block-227).

**`HLL`** — Game sector/bit constant HLL = 1 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:3](#block-147) (constant).

Used in blocks: [147](#block-147), [171](#block-171).

**`HLL3RD`** — Named data address. Emit foul-line retrieval and left-field-side third-base routes, including throw and base-cover commands.

Declared: [227:9](#block-227) (data label).

Used in blocks: [155](#block-155), [227](#block-227).

**`HLLS`** — Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag.

Declared: [155:3](#block-155) (definition).

Definition tokens: `: HLLS HITOF BONE NOACTPA HLL3RD 1 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`HLOAD`** — Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

Declared: [143:4](#block-143) (native subroutine).

Used in blocks: [143](#block-143).

**`HLOUTSSPA`** — Named data address. Emit the shortstop/second-base outfield-hit offsets and continue.

Declared: [228:13](#block-228) (data label).

Used in blocks: [161](#block-161), [228](#block-228).

**`HLPT`** — Named data address. Emit first/second/third-base defensive routes and pitcher lateral motions using signed deltas, update counts and terminal cover/standing actions; continue.

Declared: [226:11](#block-226) (data label).

Used in blocks: [157](#block-157), [226](#block-226).

**`HLS`** — Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

Declared: [155:6](#block-155) (definition).

Definition tokens: `: HLS HITOF BONE HLSS HL3RD 1 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`HLSIDE`** — Ground-hit left/right-side indicator returned by a sector handler.

Declared: [152:9](#block-152) (byte variable).

Used in blocks: [152](#block-152), [157](#block-157), [158](#block-158), [165](#block-165), [166](#block-166), [182](#block-182).

**`HLSS`** — Named data address. Emit shortstop and second-base action sequences for each relevant hit sector.

Declared: [228:1](#block-228) (data label).

Used in blocks: [155](#block-155), [228](#block-228).

**`HM`** — Game sector/bit constant HM = 7 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:4](#block-147) (constant).

Used in blocks: [147](#block-147), [158](#block-158), [170](#block-170).

**`HMFLSHCNT`** — Countdown between homer palette toggles.

Declared: [151:13](#block-151) (byte variable).

Used in blocks: [151](#block-151), [193](#block-193), [269](#block-269).

**`HMHTBL`** — Byte table. Emit HMHTBL's homer/fence/normal classification bytes and continue. Values are data consumed by hit selection.

Declared: [154:9](#block-154) (byte table).

Used in blocks: [154](#block-154), [161](#block-161).

**`HMRCNT`** — Byte variable. Allocate flashing timers, swing/music/cheer/homer flags and game-over-related counters; continue.

Declared: [151:13](#block-151) (byte variable).

Used in blocks: [151](#block-151), [193](#block-193).

**`HMRFLSH`** — Current homer palette-flash phase.

Declared: [151:12](#block-151) (byte variable).

Used in blocks: [130](#block-130), [151](#block-151), [264](#block-264), [269](#block-269).

**`HMRINT`** — Interrupt handler. HMRINT toggles HMRFLSH when its counter expires, writes alternating color sets, reloads/decrements the timer and exits through INEXT.

Declared: [269:5](#block-269) (interrupt handler).

Used in blocks: [269](#block-269).

**`HMS`** — Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

Declared: [155:9](#block-155) (definition).

Definition tokens: `: HMS HITOF BONE HMSS HR3RD 1 ;`.

Used in blocks: [155](#block-155), [156](#block-156).

**`HMSS`** — Named data address. Emit shortstop and second-base action sequences for each relevant hit sector.

Declared: [228:4](#block-228) (data label).

Used in blocks: [155](#block-155), [228](#block-228).

**`HMTMP`** — Byte variable; allocated at the declaration location. 

Declared: [153:2](#block-153) (byte variable).

Used in blocks: [153](#block-153).

**`HOM`** — Definition. HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; continue.

Declared: [237:11](#block-237) (definition).

Definition tokens: `: HOM 4200 7A00 828 48 CPOST 4400 7F00 8828 A" SPOST ;`.

Used in blocks: [237](#block-237), [238](#block-238), [275](#block-275).

**`HOMEPLATE`** — Named data address. Emit HOMEPLATE, BASEPAT and BASE2PAT.

Declared: [112:7](#block-112) (data label).

Used in blocks: [112](#block-112), [274](#block-274).

**`HOMER`** — Pending homer-boundary event before the ball reaches its selected destination.

Declared: [149:15](#block-149) (byte variable).

Used in blocks: [149](#block-149), [159](#block-159), [162](#block-162), [193](#block-193).

**`HOMERCHK`** — Native word / kernel binding. HOMERCHK takes stacked random values, hit class and coordinates, swaps register banks and derives FNCY/FNCX perturbations.

Declared: [159:1](#block-159) (native word / kernel binding).

Used in blocks: [159](#block-159), [161](#block-161).

**`HOMERUN`** — Active homer-runner/scoring sequence state.

Declared: [151:3](#block-151) (byte variable).

Used in blocks: [124](#block-124), [151](#block-151), [183](#block-183), [193](#block-193), [195](#block-195), [196](#block-196), [198](#block-198).

**`HORAF`** — Constant HORAF, assigned source expression/value `0F` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:7](#block-290) (constant).

Used in blocks: [290](#block-290).

**`HORCB`** — Constant HORCB, assigned source expression/value `9` (use the defining screen’s radix). Save radix and select hex; define horizontal color boundary and vertical blanking ports.

Declared: [290:1](#block-290) (constant).

Used in blocks: [290](#block-290).

**`HR`** — Game sector/bit constant HR = 10 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:5](#block-147) (constant).

Used in blocks: [147](#block-147), [170](#block-170).

**`HR1ST`** — Named data address. Emit first-base/pitcher routes, including WTHW, to wait for a throw before resuming.

Declared: [228:8](#block-228) (data label).

Used in blocks: [156](#block-156), [228](#block-228).

**`HR2ND`** — Named data address. Emit shortstop and second-base action sequences for each relevant hit sector.

Declared: [228:7](#block-228) (data label).

Used in blocks: [156](#block-156), [228](#block-228).

**`HR3RD`** — Named data address. Emit first/second/third-base defensive routes and pitcher lateral motions using signed deltas, update counts and terminal cover/standing actions; continue.

Declared: [226:10](#block-226) (data label).

Used in blocks: [155](#block-155), [157](#block-157), [161](#block-161), [226](#block-226).

**`HRAT`** — Current randomized hit-selection threshold, adjusted by inning and score difference.

Declared: [149:2](#block-149) (byte variable).

Used in blocks: [149](#block-149), [162](#block-162), [169](#block-169).

**`HRBY2`** — Definition. HRBY2 halves HRAT. WHBODDS finds BASESTATUS and WHOSUP using the decision tree, treating an empty R1 as empty bases.

Declared: [169:1](#block-169) (definition).

Definition tokens: `: HRBY2 HRAT B@ 2/ HRAT B! ;`.

Used in blocks: [169](#block-169).

**`HRL`** — Game sector/bit constant HRL = 13 (decimal on this screen). Select decimal and assign fly/ground and left-to-right field-sector constants. These values index the hit/action tables.

Declared: [147:6](#block-147) (constant).

Used in blocks: [147](#block-147), [170](#block-170).

**`HRL1ST`** — Named data address. Emit first-base/pitcher routes, including WTHW, to wait for a throw before resuming.

Declared: [228:11](#block-228) (data label).

Used in blocks: [156](#block-156), [228](#block-228).

**`HRLS`** — Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

Declared: [156:4](#block-156) (definition).

Definition tokens: `: HRLS HITOF BONE HRPT HRL1ST NOACTPA 0 ;`.

Used in blocks: [156](#block-156).

**`HROUT2NDPA`** — Named data address. Emit the shortstop/second-base outfield-hit offsets and continue.

Declared: [228:14](#block-228) (data label).

Used in blocks: [161](#block-161), [228](#block-228).

**`HRPT`** — Named data address. Emit first/second/third-base defensive routes and pitcher lateral motions using signed deltas, update counts and terminal cover/standing actions; continue.

Declared: [226:12](#block-226) (data label).

Used in blocks: [155](#block-155), [156](#block-156), [161](#block-161), [226](#block-226).

**`HRRET`** — Native branch/loop label. Index WBASETABLE by BASESTATUS with R1 as the default BC target, push HRRET, dispatch via PCHL, then store returned BC in PLAYON and return to TERSE.

Declared: [167:1](#block-167) (forward declaration), [167:8](#block-167) (assembler label).

Used in blocks: [167](#block-167).

**`HRS`** — Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

Declared: [156:1](#block-156) (definition).

Definition tokens: `: HRS HITOF BONE HRPT HR1ST HR2ND 0 ;`.

Used in blocks: [156](#block-156).

**`HRSS`** — Named data address. Emit first/second/third-base defensive routes and pitcher lateral motions using signed deltas, update counts and terminal cover/standing actions; continue.

Declared: [226:9](#block-226) (data label).

Used in blocks: [157](#block-157), [161](#block-161), [226](#block-226).

**`HTMP`** — Byte variable; allocated at the declaration location. 

Declared: [153:2](#block-153) (byte variable).

Used in blocks: [153](#block-153).

### Dictionary: I

**`I`** — Native loop-index access at $01BF.

Declared: [276:7](#block-276) (native word / kernel binding).

Used in blocks: [10](#block-10), [98](#block-98), [99](#block-99), [248](#block-248), [249](#block-249), [276](#block-276).

**`I'`** — Definition. Define schedule-opening/closing helpers, the tick-compilation helper ]'[ and I', which emits a CALL to the handler entry adjusted by two plus its scanline byte.

Declared: [291:6](#block-291) (definition).

Definition tokens: `: I' } 0CD B, ]'[ { 2+ } , B, { ;`.

Used in blocks: [269](#block-269), [291](#block-291).

**`ICODE`** — Definition. ICODE starts a CODE definition and emits the scheduler/register-save prologue: set INLIN/IPNT, swap alternate register banks and preserve the active register sets.

Declared: [291:7](#block-291) (definition).

Definition tokens: `: ICODE } CODE { [ } ASM { ] } NEXT XTHL, D PUSH, B PUSH, PSW PUSH, M A MOV, INLIN OUT, H INX, IPNT SHLD, EXX, EXAF, H PUSH, D PUSH, B PUSH, PSW PUSH, ASM { ;`.

Used in blocks: [264](#block-264), [269](#block-269), [291](#block-291).

**`ICPTYP`** — Byte variable; allocated at the declaration location. 

Declared: [151:7](#block-151) (byte variable).

Used in blocks: [151](#block-151).

**`IEX`** — Native word / kernel binding. IEX restores saved registers, enables interrupts and returns. INEXT emits a jump to IEX; continue loading.

Declared: [291:11](#block-291) (native word / kernel binding).

Used in blocks: [291](#block-291).

**`IF`** — Immediate XC wrapper that emits a conditional target branch through XC-IF.

Declared: [100:7](#block-100) (definition).

Definition tokens: `: IF } XC-IF { ;`.

Used in blocks: [34](#block-34), [98](#block-98), [100](#block-100), [101](#block-101), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [132](#block-132), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [236](#block-236), [238](#block-238), [239](#block-239), [240](#block-240), [249](#block-249), [305](#block-305), [306](#block-306).

**`IF,`** — Begin a structured assembler conditional branch; distinct from the target TERSE IF.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [145](#block-145), [159](#block-159), [160](#block-160), [165](#block-165), [166](#block-166), [173](#block-173), [174](#block-174), [176](#block-176), [177](#block-177), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [208](#block-208), [231](#block-231), [233](#block-233), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [246](#block-246), [247](#block-247), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [269](#block-269), [270](#block-270), [279](#block-279), [281](#block-281), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288).

**`IFALIGN`** — Native branch/loop label. Align a rotating two-bit pixel mask, skip the initial gap count, OR each painted pixel into the destination byte and advance the byte address when the mask wraps.

Declared: [279:1](#block-279) (forward declaration), [279:10](#block-279) (assembler label).

Used in blocks: [279](#block-279).

**`IFMAIN`** — Native branch/loop label. Declare row-loop labels, preserve BC/IX, point IX to INFP and initialize the destination row and span endpoint state. Each INFP byte feeds IFSPAN.

Declared: [208:1](#block-208) (forward declaration), [208:3](#block-208) (assembler label).

Used in blocks: [208](#block-208).

**`IFMOUND`** — Native branch/loop label. Move to the mound destination, paint twelve additional rows with endpoint $73, restore IX/BC and return to TERSE.

Declared: [208:1](#block-208) (forward declaration), [208:7](#block-208) (assembler label).

Used in blocks: [208](#block-208).

**`IFPIX`** — Native branch/loop label. Align a rotating two-bit pixel mask, skip the initial gap count, OR each painted pixel into the destination byte and advance the byte address when the mask wraps.

Declared: [279:1](#block-279) (forward declaration), [279:11](#block-279) (assembler label).

Used in blocks: [279](#block-279).

**`IFSPAN`** — Native subroutine. Declare labels; IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value.

Declared: [279:2](#block-279) (native subroutine).

Used in blocks: [208](#block-208), [279](#block-279).

**`IM2,`** — Select Z80 interrupt mode 2.

Used in blocks: [292](#block-292).

**`IMMED`** — Mark a definition to execute during compilation.

Used in blocks: [99](#block-99), [100](#block-100).

**`IMRK`** — Named data address. Emit up/down inning triangles and the inning marker, then continue to the next pattern screen.

Declared: [107:15](#block-107) (data label).

Used in blocks: [107](#block-107), [121](#block-121).

**`IN,`** — Definition. Define object emitters for immediate IN and subtract-with-borrow instructions.

Declared: [98:11](#block-98) (definition).

Definition tokens: `: IN, 0DB OB, OB, ;`.

Used in blocks: [98](#block-98), [125](#block-125), [126](#block-126), [174](#block-174), [288](#block-288).

**`INAIR`** — Airborne ball flag distinguishing a fly catch from pickup.

Declared: [152:5](#block-152) (byte variable).

Used in blocks: [117](#block-117), [152](#block-152), [161](#block-161), [162](#block-162), [191](#block-191), [192](#block-192), [263](#block-263).

**`INC-X`** — Native branch/loop label. INC-X rotates pixel/mask by two bits, updates SADR when the byte boundary is crossed, increments X-AXIS and returns to X-RET.

Declared: [281:6](#block-281) (assembler label), [281:2](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [283](#block-283).

**`INC-Y`** — Native branch/loop label. Save radix and select decimal. INC-Y increments Y-AXIS and adds 80 bytes to SADR.

Declared: [282:1](#block-282) (assembler label), [281:2](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [282](#block-282), [283](#block-283).

**`INCPC`** — Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

Declared: [143:3](#block-143) (native subroutine).

Used in blocks: [143](#block-143), [144](#block-144).

**`INDEXW`** — Native word / kernel binding. INDEXW preserves A/flags, calculates HL+2*A, loads the selected cell in DE, restores HL to the entry start and returns; continue.

Declared: [234:7](#block-234) (native word / kernel binding).

Used in blocks: [117](#block-117), [120](#block-120), [123](#block-123), [159](#block-159), [164](#block-164), [167](#block-167), [197](#block-197), [200](#block-200), [201](#block-201), [202](#block-202), [234](#block-234), [253](#block-253), [258](#block-258), [259](#block-259), [265](#block-265).

**`INEXT`** — Definition. IEX restores saved registers, enables interrupts and returns. INEXT emits a jump to IEX; continue loading.

Declared: [291:13](#block-291) (definition).

Definition tokens: `: INEXT } { LIT [ } ' IEX { , } ASM { ] } JMP, { ;`.

Used in blocks: [268](#block-268), [269](#block-269), [291](#block-291).

**`INFBK`** — Constant INFBK, assigned source expression/value `0D` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:5](#block-290) (constant).

Used in blocks: [290](#block-290), [292](#block-292).

**`INFIELD`** — Native word / kernel binding. Declare row-loop labels, preserve BC/IX, point IX to INFP and initialize the destination row and span endpoint state. Each INFP byte feeds IFSPAN.

Declared: [208:2](#block-208) (native word / kernel binding).

Used in blocks: [208](#block-208), [274](#block-274).

**`INFLDACT`** — Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE.

Declared: [237:5](#block-237) (native word / kernel binding).

Used in blocks: [237](#block-237).

**`INFP`** — Named data address. Select hex and label INFP, the byte stream consumed by INFIELD/IFSPAN.

Declared: [278:1](#block-278) (data label).

Used in blocks: [208](#block-208), [278](#block-278).

**`INLIN`** — Constant INLIN, assigned source expression/value `0F` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:5](#block-290) (constant).

Used in blocks: [269](#block-269), [290](#block-290), [291](#block-291).

**`INLOG`** — Definition. Clear catch/base/walk/run/double-play and boundary flags, request the bat-crack sound, and set PLAYON to R1.

Declared: [162:1](#block-162) (definition).

Definition tokens: `: INLOG ( NOCATCH BZERO LBASE BZERO OFTBLGO BONE WLKCNT BZERO NORUN BZERO MHIT VMAGIC R1 PLAYON ! GRNDR BZERO HOMER BZERO DBLFLAG BZERO OFPU BZERO FENCE BZERO INAIR BZERO SWINGTYPE B@ 6 = IF 0 ELSE HRAT B@ 0A RND < IF 0 ( ELSE 1 ( THEN DUP HITTYPE B! THEN IF OUTFLDHIT CMPT B@ IF 30 CMOFTIMER B! THEN ELSE GRNDRHIT THEN ALLFLDACT …`.

Used in blocks: [124](#block-124), [162](#block-162).

**`INMOD`** — Constant INMOD, assigned source expression/value `0E` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:5](#block-290) (constant).

Used in blocks: [290](#block-290), [292](#block-292).

**`INN#`** — Current displayed inning number.

Declared: [149:2](#block-149) (byte variable).

Used in blocks: [123](#block-123), [128](#block-128), [130](#block-130), [131](#block-131), [149](#block-149), [181](#block-181).

**`INNODDS`** — Definition. INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state; continue loading.

Declared: [123:9](#block-123) (definition).

Definition tokens: `: INNODDS INN# B@ CMSW B@ IF DUP 6 > IF DROP 1 ELSE 1 > IF 2 ELSE 3 THEN THEN ( SPBON B@ IF DROP 4 THEN ELSE ( SPBON B@ ( IF 3 > IF 1 ELSE 2 THEN ELSE 1 - IODTBL B@ THEN THEN IODDS B! ;`.

Used in blocks: [123](#block-123), [130](#block-130).

**`INNX`** — X position of the current inning indicator.

Declared: [149:3](#block-149) (cell variable).

Used in blocks: [128](#block-128), [130](#block-130), [131](#block-131), [149](#block-149).

**`INP`** — Read a hardware input port; a target primitive distinct from assembler INP,.

Declared: [89:6](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89), [129](#block-129), [131](#block-131), [305](#block-305).

**`INP,`** — Emit register-port input using the assembler operand convention.

Used in blocks: [286](#block-286).

**`INR,`** — Increment a byte operand.

Used in blocks: [117](#block-117), [119](#block-119), [145](#block-145), [198](#block-198), [202](#block-202), [230](#block-230), [231](#block-231), [233](#block-233), [253](#block-253), [258](#block-258), [259](#block-259), [261](#block-261), [263](#block-263), [264](#block-264), [265](#block-265), [279](#block-279), [282](#block-282), [283](#block-283), [286](#block-286), [287](#block-287), [288](#block-288).

**`INSCN`** — Definition. INSCN shows GAME OVER, flashes ISCN and prints one of two pricing layouts according to CNSW1, then draws the second-base pattern.

Declared: [127:2](#block-127) (definition).

Definition tokens: `: INSCN ( SGO ' ISCN FLSHTON CNSW1 B@ IF 0C00 2200 828 A" SPOST 1700 3400 828 A" SPOST 0F00 4600 828 A" SPOST ELSE 1800 2600 828 A" SPOST 800 3C00 828 A" SPOST THEN 2880 4C00 BASE2PAT 428 WRITR ;`.

Used in blocks: [127](#block-127), [128](#block-128).

**`INSOUT`** — Instruction-screen exit flag set by a button press.

Declared: [151:8](#block-151) (byte variable).

Used in blocks: [151](#block-151), [305](#block-305), [306](#block-306).

**`INSTRC`** — Definition. Clear INSOUT, fill the screen and post pitch-button/trackball/outfielder instructions.

Declared: [306:1](#block-306) (definition).

Definition tokens: `: INSTRC ( INSOUT BZERO BEGIN FLFILL 2300 1000 828 A" SPOST 700 4000 828 A" SPOST 0F00 6000 828 A" SPOST 6000 8000 828 A" SPOST 80 INSWAIT INSOUT B@ IF ELSE FLFILL 2300 1000 828 A" SPOST B00 4000 828 A" SPOST 500 6000 828 A" SPOST 60 INSWAIT INSOUT B@ IF ELSE FLFILL 6000 2800 828 A" SPOST 30 INSWAIT THEN THEN INSOUT …`.

Used in blocks: [131](#block-131), [306](#block-306).

**`INSWAIT`** — Definition. INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.

Declared: [305:10](#block-305) (definition).

Definition tokens: `: INSWAIT EI BEGIN FF 0 DO LOOP 14 INP 33 AND 33 < IF DROP 1 INSOUT BONE THEN 1- DUP 0= END DROP DI ;`.

Used in blocks: [305](#block-305), [306](#block-306).

**`INTERRUPT`** — Interrupt handler. Declare INTTOP and use ICODE to generate the interrupt prologue before assembling INTERRUPT.

Declared: [264:5](#block-264) (interrupt handler).

Used in blocks: [264](#block-264), [269](#block-269).

**`INTERRUPTS0`** — Interrupt schedule. Construct INTERRUPTS0 with COLORBAND at $73 and the main game handler at 0; construct INTERRUPTS1 with HMRINT at $73 and the game handler at $C0. Select decimal and load 289.

Declared: [269:11](#block-269) (interrupt schedule).

Used in blocks: [269](#block-269), [289](#block-289).

**`INTERRUPTS1`** — Interrupt schedule. Construct INTERRUPTS0 with COLORBAND at $73 and the main game handler at 0; construct INTERRUPTS1 with HMRINT at $73 and the game handler at $C0. Select decimal and load 289.

Declared: [269:13](#block-269) (interrupt schedule).

Used in blocks: [269](#block-269), [289](#block-289).

**`INTERRUPTS>`** — Definition. Define schedule-opening/closing helpers, the tick-compilation helper ]'[ and I', which emits a CALL to the handler entry adjusted by two plus its scanline byte.

Declared: [291:4](#block-291) (definition).

Definition tokens: `: INTERRUPTS> } { [ } ASM { ] } JMP, { ;`.

Used in blocks: [269](#block-269), [291](#block-291).

**`INTFLAG`** — Nested game-interrupt work counter.

Declared: [149:12](#block-149) (byte variable).

Used in blocks: [149](#block-149), [264](#block-264), [268](#block-268).

**`INTHIGHRES`** — Definition. INTHIGHRES sets commercial mode, $C0 vertical blanking and zero horizontal color boundary.

Declared: [293:1](#block-293) (definition).

Definition tokens: `: INTHIGHRES ( 1 8 OUTP ( C0 0A OUTP ( 0 9 OUTP ( ;`.

Used in blocks: [133](#block-133), [293](#block-293).

**`INTST`** — Constant INTST, assigned source expression/value `8` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:6](#block-290) (constant).

Used in blocks: [290](#block-290).

**`INTTOP`** — Native branch/loop label. Enable interrupts so palette IRQs can run, restore normal colors unless reserved/flashing, increment INTFLAG and preserve BC/IY/IX for the main update pass.

Declared: [264:4](#block-264) (forward declaration), [264:9](#block-264) (assembler label).

Used in blocks: [264](#block-264), [268](#block-268).

**`INX,`** — Increment a register pair.

Used in blocks: [119](#block-119), [120](#block-120), [143](#block-143), [197](#block-197), [200](#block-200), [201](#block-201), [207](#block-207), [233](#block-233), [234](#block-234), [243](#block-243), [252](#block-252), [258](#block-258), [269](#block-269), [279](#block-279), [281](#block-281), [291](#block-291).

**`INXX,`** — Increment the selected index register.

Used in blocks: [208](#block-208), [242](#block-242), [244](#block-244).

**`IODDS`** — Inning-derived hit-odds baseline.

Declared: [151:8](#block-151) (byte variable).

Used in blocks: [123](#block-123), [151](#block-151), [169](#block-169).

**`IODTBL`** — Byte table. Emit nine inning-odds bytes. The target table accessor supplies the index addressing behavior.

Declared: [123:7](#block-123) (byte table).

Used in blocks: [123](#block-123).

**`IPNT`** — Interrupt schedule pointer programmed/advanced by the generated handlers.

Declared: [291:2](#block-291) (cell variable).

Used in blocks: [269](#block-269), [291](#block-291), [292](#block-292).

**`ISCN`** — Definition. Define ISCN to post V15 at the given coordinates.

Declared: [127:1](#block-127) (definition).

Definition tokens: `: ISCN 1C00 1000 828 A" SPOST ;`.

Used in blocks: [127](#block-127).

**`ISTART`** — Native word / kernel binding. ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.

Declared: [292:1](#block-292) (native word / kernel binding).

Used in blocks: [289](#block-289), [292](#block-292).

### Dictionary: J

**`JC,`** — Jump if carry is set.

Used in blocks: [230](#block-230), [231](#block-231), [283](#block-283).

**`JMP,`** — Emit an unconditional absolute jump.

Used in blocks: [115](#block-115), [116](#block-116), [117](#block-117), [132](#block-132), [144](#block-144), [166](#block-166), [176](#block-176), [196](#block-196), [197](#block-197), [198](#block-198), [244](#block-244), [276](#block-276), [279](#block-279), [281](#block-281), [283](#block-283), [284](#block-284), [286](#block-286), [291](#block-291).

**`JNZ,`** — Jump if zero is clear.

Used in blocks: [143](#block-143), [144](#block-144), [165](#block-165), [166](#block-166), [176](#block-176), [196](#block-196), [197](#block-197), [198](#block-198), [230](#block-230), [268](#block-268), [285](#block-285).

**`JPE,`** — Jump on parity even.

Used in blocks: [276](#block-276).

**`JPO,`** — Jump on parity odd.

Used in blocks: [277](#block-277).

**`JZ,`** — Jump if zero is set.

Used in blocks: [115](#block-115), [143](#block-143), [144](#block-144), [196](#block-196), [197](#block-197), [276](#block-276).

### Dictionary: K

**`KILLOF`** — Native word / kernel binding. KILLOF zeroes OF deltas, selects standing animation and clears OFTBLGO.

Declared: [236:4](#block-236) (native word / kernel binding).

Used in blocks: [126](#block-126), [193](#block-193), [236](#block-236), [263](#block-263).

### Dictionary: L

**`L`** — Assembler L-register operand.

Used in blocks: [114](#block-114), [115](#block-115), [117](#block-117), [120](#block-120), [143](#block-143), [144](#block-144), [159](#block-159), [160](#block-160), [174](#block-174), [176](#block-176), [177](#block-177), [195](#block-195), [196](#block-196), [201](#block-201), [202](#block-202), [230](#block-230), [231](#block-231), [232](#block-232), [233](#block-233), [234](#block-234), [236](#block-236), [241](#block-241), [246](#block-246), [247](#block-247), [250](#block-250), [251](#block-251), [252](#block-252), [257](#block-257), [276](#block-276), [279](#block-279), [283](#block-283), [284](#block-284), [286](#block-286).

**`LABEL`** — Resolve an assembler code label at the current assembly location.

Used in blocks: [115](#block-115), [116](#block-116), [118](#block-118), [143](#block-143), [144](#block-144), [164](#block-164), [167](#block-167), [176](#block-176), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [200](#block-200), [207](#block-207), [208](#block-208), [231](#block-231), [264](#block-264), [277](#block-277), [279](#block-279), [281](#block-281), [282](#block-282), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286).

**`LABLE`** — Definition. Define zero-initialized cell/byte variable emitters V=/BV=, constant and forward shorthands C=/F=, and the deliberately spelled label alias LABLE for DATA.

Declared: [304:5](#block-304) (definition).

Definition tokens: `: LABLE } DATA { ;`.

Used in blocks: [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [113](#block-113), [114](#block-114), [122](#block-122), [158](#block-158), [163](#block-163), [166](#block-166), [186](#block-186), [187](#block-187), [188](#block-188), [189](#block-189), [190](#block-190), [199](#block-199), [226](#block-226), [227](#block-227), [228](#block-228), [229](#block-229), [253](#block-253), [258](#block-258), [259](#block-259), [264](#block-264), [270](#block-270), [278](#block-278), [304](#block-304).

**`LAST`** — Host last-definition pointer restored after loading a saved environment.

Used in blocks: [10](#block-10).

**`LBASE`** — Byte variable. Allocate computer-control, hit-sector, base, throw and play-pointer state.

Declared: [149:7](#block-149) (byte variable).

Used in blocks: [149](#block-149), [158](#block-158), [162](#block-162), [182](#block-182), [198](#block-198).

**`LBCD,`** — Load BC from a direct memory cell.

Used in blocks: [284](#block-284).

**`LCB`** — Constant LCB, assigned source expression/value `368` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:9](#block-113) (constant).

Used in blocks: [113](#block-113), [225](#block-225).

**`LCB,`** — Definition. Define standing and right/left cover-base action macros that end by deactivating; continue.

Declared: [225:13](#block-225) (definition).

Definition tokens: `: LCB, } 0 0 0 LCB ACT, DEACT, { ;`.

Used in blocks: [225](#block-225), [226](#block-226), [228](#block-228).

**`LDA,`** — Load A from a direct memory address.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [132](#block-132), [143](#block-143), [144](#block-144), [145](#block-145), [160](#block-160), [164](#block-164), [165](#block-165), [166](#block-166), [167](#block-167), [173](#block-173), [174](#block-174), [175](#block-175), [177](#block-177), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [201](#block-201), [202](#block-202), [238](#block-238), [239](#block-239), [253](#block-253), [254](#block-254), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [267](#block-267), [268](#block-268), [269](#block-269), [283](#block-283), [285](#block-285), [287](#block-287), [288](#block-288).

**`LDAX,`** — Load A through a register-pair address.

Used in blocks: [207](#block-207), [243](#block-243).

**`LDED,`** — Load DE from a direct memory cell.

Used in blocks: [119](#block-119), [173](#block-173), [193](#block-193), [283](#block-283), [285](#block-285).

**`LDFLAG`** — Vector-record layout constant LDFLAG = 5 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:5](#block-148) (constant).

Used in blocks: [148](#block-148), [192](#block-192), [194](#block-194), [195](#block-195), [198](#block-198), [231](#block-231).

**`LDINFLDPA`** — Definition. LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.

Declared: [153:3](#block-153) (definition).

Definition tokens: `: LDINFLDPA VPLAYACTPC 3RD ! VPLAYACTPC SS ! VPLAYACTPC 2ND ! VPLAYACTPC 1ST ! VPLAYACTPC PT ! ;`.

Used in blocks: [153](#block-153), [157](#block-157), [161](#block-161).

**`LDIR,`** — Copy bytes from HL to DE, incrementing both until BC reaches zero.

Used in blocks: [115](#block-115).

**`LDOFPA`** — Native branch/loop label. For movement choose RRUN or LRUN by X sign, activate outfielders, save OFPA, return and finish two-pass assembly; continue loading.

Declared: [174:1](#block-174) (forward declaration), [176:8](#block-176) (assembler label).

Used in blocks: [174](#block-174), [176](#block-176).

**`LDPC`** — Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

Declared: [141:6](#block-141) (definition).

Definition tokens: `: LDPC } 3 B, , { ;`.

Used in blocks: [141](#block-141).

**`LDPCC`** — Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

Declared: [141:7](#block-141) (definition).

Definition tokens: `: LDPCC } 2 B, , { ;`.

Used in blocks: [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**`LDX,`** — Load a register from IX/IY plus the displacement.

Used in blocks: [116](#block-116), [119](#block-119), [120](#block-120), [196](#block-196), [198](#block-198), [201](#block-201), [202](#block-202), [203](#block-203), [208](#block-208), [230](#block-230), [232](#block-232), [242](#block-242), [244](#block-244), [251](#block-251), [252](#block-252), [253](#block-253), [255](#block-255), [257](#block-257), [261](#block-261), [262](#block-262), [263](#block-263), [276](#block-276), [277](#block-277).

**`LF`** — VLENGTH-byte vector record for the left fielder. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:4](#block-216) (byte array).

Used in blocks: [124](#block-124), [173](#block-173), [211](#block-211), [212](#block-212), [216](#block-216), [237](#block-237), [261](#block-261).

**`LFLD`** — Constant LFLD, assigned source expression/value `168` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:7](#block-113) (constant).

Used in blocks: [113](#block-113), [227](#block-227), [228](#block-228).

**`LHLD,`** — Load HL from a direct memory cell.

Used in blocks: [114](#block-114), [119](#block-119), [122](#block-122), [143](#block-143), [144](#block-144), [173](#block-173), [193](#block-193), [200](#block-200), [258](#block-258), [261](#block-261), [262](#block-262), [263](#block-263), [281](#block-281), [282](#block-282), [283](#block-283), [284](#block-284), [285](#block-285).

**`LINN`** — Last inning currently purchased/available; MLINN draws its marker.

Declared: [149:1](#block-149) (byte variable).

Used in blocks: [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [149](#block-149), [181](#block-181), [305](#block-305).

**`LIT`** — Compiler literal mechanism used by INEXT's host macro.

Used in blocks: [291](#block-291).

**`LIXD,`** — Load IX from a direct memory cell.

Used in blocks: [119](#block-119), [203](#block-203).

**`LIYD,`** — Load IY from a direct memory cell.

Used in blocks: [116](#block-116), [119](#block-119).

**`LK,`** — Definition. BACT, emits ball-pattern actions; LK, emits a stationary ball/deactivate sequence.

Declared: [229:3](#block-229) (definition).

Definition tokens: `: LK, } 0 0 0 BACT, DEACT, { ;`.

Used in blocks: [229](#block-229).

**`LOAD`** — Load a numbered source screen in the current disk/file context; exact translation belongs to the external loader.

Used in blocks: [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [94](#block-94), [98](#block-98), [102](#block-102), [103](#block-103), [104](#block-104), [105](#block-105), [106](#block-106), [114](#block-114), [146](#block-146), [208](#block-208), [215](#block-215), [250](#block-250), [269](#block-269), [272](#block-272), [279](#block-279).

**`LOADANM`** — Native word / kernel binding. LOADANM copies magic and animation-group fields from the stream into the IX vector record, selects PATTERNS and returns the advanced stream pointer; continue.

Declared: [200:9](#block-200) (native word / kernel binding).

Used in blocks: [200](#block-200), [201](#block-201).

**`loadpc`** — Native subroutine. loadpc installs MUSPC and STARTPC. BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

Declared: [145:1](#block-145) (native subroutine).

Used in blocks: [145](#block-145).

**`LONBS`** — Constant LONBS, assigned source expression/value `0A68` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:13](#block-113) (constant).

Used in blocks: [113](#block-113), [198](#block-198).

**`LOOP`** — Native counted-loop continuation at $0191.

Declared: [276:6](#block-276) (native word / kernel binding).

Used in blocks: [10](#block-10), [98](#block-98), [99](#block-99), [121](#block-121), [181](#block-181), [212](#block-212), [213](#block-213), [236](#block-236), [238](#block-238), [248](#block-248), [249](#block-249), [273](#block-273), [276](#block-276), [305](#block-305).

**`LRUN`** — Constant LRUN, assigned source expression/value `68` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:6](#block-113) (constant).

Used in blocks: [113](#block-113), [176](#block-176), [226](#block-226), [227](#block-227), [228](#block-228), [231](#block-231).

**`LSETTFCOOR`** — Definition. LSETTFCOOR loops through four runners, setting magic, positions, expansion, runner status and invisible pattern pointers.

Declared: [212:1](#block-212) (definition).

Definition tokens: `: LSETTFCOOR ( VMAGIC R1 4 0 DO DUP DUP DUP DUP DUP DUP 28 SB! VXH + 25 SB! VYH + A8 SB! VXPAND + 88 SB! VSTATUS + 1 SB! VPATL + NOBOD S! VLENGTH + ( LOOP ( 8 0 DO DUP DUP DUP DUP DUP 28 SB! ( VXH + PLYR1UP B@ IF 1B ELSE 36 THEN SB! VYH + 93 SB! …`.

Used in blocks: [212](#block-212), [214](#block-214).

**`LTHWPA`** — Named data address. Emit PITCHPA and right/left throw animations.

Declared: [227:4](#block-227) (data label).

Used in blocks: [120](#block-120), [227](#block-227).

**`LTRW`** — Constant LTRW, assigned source expression/value `268` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:8](#block-113) (constant).

Used in blocks: [113](#block-113), [227](#block-227).

**`LVRSTAT`** — Native subroutine. LVRSTAT writes A to all four VRSTAT bytes. WALKOVER requests CAUGHT and THROWAROUND when the walk timer completes; continue.

Declared: [235:9](#block-235) (native subroutine).

Used in blocks: [116](#block-116), [197](#block-197), [235](#block-235), [263](#block-263).

**`LXI,`** — Load an immediate cell into a register pair.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [126](#block-126), [145](#block-145), [159](#block-159), [164](#block-164), [165](#block-165), [166](#block-166), [167](#block-167), [173](#block-173), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [202](#block-202), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [243](#block-243), [247](#block-247), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [261](#block-261), [262](#block-262), [265](#block-265), [266](#block-266), [269](#block-269), [271](#block-271), [277](#block-277), [279](#block-279), [282](#block-282), [283](#block-283), [284](#block-284), [287](#block-287), [288](#block-288).

**`LXIX,`** — Load an immediate value into the selected IX/IY register.

Used in blocks: [114](#block-114), [173](#block-173), [208](#block-208), [238](#block-238), [261](#block-261), [267](#block-267), [268](#block-268), [283](#block-283).

### Dictionary: M

**`M`** — Assembler memory operand addressed through HL.

Used in blocks: [114](#block-114), [117](#block-117), [120](#block-120), [123](#block-123), [126](#block-126), [143](#block-143), [173](#block-173), [174](#block-174), [177](#block-177), [197](#block-197), [200](#block-200), [201](#block-201), [207](#block-207), [233](#block-233), [234](#block-234), [237](#block-237), [239](#block-239), [243](#block-243), [258](#block-258), [259](#block-259), [260](#block-260), [269](#block-269), [279](#block-279), [282](#block-282), [284](#block-284), [285](#block-285), [287](#block-287), [288](#block-288), [291](#block-291).

**`M1CASE`** — Native branch/loop label. Finish randomized-note output, then handle opcode 1 by loading NOTETIMER and returning with a nonzero completion indication.

Declared: [143:8](#block-143) (forward declaration), [144:2](#block-144) (assembler label).

Used in blocks: [143](#block-143), [144](#block-144).

**`M2CASE`** — Native branch/loop label. Handle opcodes 2 and 3 as address transfers; one continues command processing immediately while the other leaves a nonzero indication to end this pass.

Declared: [143:8](#block-143) (forward declaration), [144:4](#block-144) (assembler label).

Used in blocks: [143](#block-143), [144](#block-144).

**`M3CASE`** — Native branch/loop label. Handle opcodes 2 and 3 as address transfers; one continues command processing immediately while the other leaves a nonzero indication to end this pass.

Declared: [143:8](#block-143) (forward declaration), [144:6](#block-144) (assembler label).

Used in blocks: [143](#block-143), [144](#block-144).

**`M4CASE`** — Native branch/loop label. Handle opcode 4: decrement MULTIPLE, restart at STARTPC if repetitions remain, otherwise clear PRIORITY.

Declared: [143:9](#block-143) (forward declaration), [144:8](#block-144) (assembler label).

Used in blocks: [143](#block-143), [144](#block-144).

**`MAGIC`** — Constant MAGIC, assigned source expression/value `0C` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:6](#block-290) (constant).

Used in blocks: [207](#block-207), [243](#block-243), [290](#block-290).

**`MASK`** — Byte table. Emit four two-bit clearing masks and full-color pixel values, restore radix and continue.

Declared: [280:8](#block-280) (byte table).

Used in blocks: [280](#block-280), [284](#block-284).

**`MASTER`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:1](#block-141) (definition).

Definition tokens: `: MASTER } 10 B, B, { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**`MBALL`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:6](#block-146) (definition).

Definition tokens: `: MBALL 0 BALLSCORE BMUSIC ;`.

Used in blocks: [146](#block-146), [182](#block-182).

**`MCANNON`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:2](#block-146) (definition).

Definition tokens: `: MCANNON 0 CANNONSCORE BMUSIC ;`.

Used in blocks: [124](#block-124), [146](#block-146), [183](#block-183).

**`MCOIN`** — Definition. Use PMUSIC for the opening tune and BMUSIC for coin sound; stop loading.

Declared: [146:10](#block-146) (definition).

Definition tokens: `: MCOIN 0 COINSCORE BMUSIC ;`.

Used in blocks: [146](#block-146), [287](#block-287), [288](#block-288).

**`MCVOLS`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:4](#block-141) (definition).

Definition tokens: `: MCVOLS } 15 B, B, { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**`MEMAP!`** — External host memory-mapping operation invoked by UNMAP with $F1.

Used in blocks: [10](#block-10).

**`MFENCE`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:5](#block-146) (definition).

Definition tokens: `: MFENCE 0 FENCESCORE BMUSIC ;`.

Used in blocks: [124](#block-124), [146](#block-146).

**`MFOUL`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:7](#block-146) (definition).

Definition tokens: `: MFOUL 0 FOULSCORE BMUSIC ;`.

Used in blocks: [146](#block-146), [158](#block-158).

**`MHIT`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:5](#block-146) (definition).

Definition tokens: `: MHIT 0 CRACKSCORE BMUSIC ;`.

Used in blocks: [146](#block-146), [162](#block-162).

**`MLINN`** — Definition. MLINN clears the marker region and, for a nonzero LINN, computes the arrow X coordinate with a cap before drawing IMRK.

Declared: [121:1](#block-121) (definition).

Definition tokens: `: MLINN ( DI PX0 2A A5 4D 3 RECTAN LINN B@ DUP DUP IF 0A < IF 8F0 SWAP 0 DO 200 + LOOP ELSE DROP 1CF0 THEN A500 IMRK 301 828 WRITE ELSE DROP DROP THEN EI ;`.

Used in blocks: [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131).

**`MOPENERS`** — Definition. Use PMUSIC for the opening tune and BMUSIC for coin sound; stop loading.

Declared: [146:9](#block-146) (definition).

Definition tokens: `: MOPENERS 0 TAKE-ME PMUSIC ;`.

Used in blocks: [131](#block-131), [146](#block-146).

**`MORE-BUFFERS`** — External host helper requesting additional block/file buffers.

Used in blocks: [33](#block-33), [94](#block-94).

**`MOUT`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:8](#block-146) (definition).

Definition tokens: `: MOUT 0 OUTSCORE BMUSIC ;`.

Used in blocks: [146](#block-146), [181](#block-181).

**`MOV,`** — Copy source operand to destination operand; this source puts the source first.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [120](#block-120), [126](#block-126), [143](#block-143), [144](#block-144), [159](#block-159), [160](#block-160), [174](#block-174), [177](#block-177), [196](#block-196), [197](#block-197), [200](#block-200), [201](#block-201), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [239](#block-239), [241](#block-241), [243](#block-243), [246](#block-246), [247](#block-247), [250](#block-250), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [269](#block-269), [276](#block-276), [279](#block-279), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286), [291](#block-291).

**`MREXP`** — Constant MREXP, assigned source expression/value `3` (use the defining screen’s radix). Assign rotate/expand/OR/XOR/flop/flip bit positions.

Declared: [241:2](#block-241) (constant).

Used in blocks: [241](#block-241).

**`MRFLIP`** — Constant MRFLIP, assigned source expression/value `7` (use the defining screen’s radix). Assign rotate/expand/OR/XOR/flop/flip bit positions.

Declared: [241:3](#block-241) (constant).

Used in blocks: [241](#block-241), [242](#block-242).

**`MRFLOP`** — Constant MRFLOP, assigned source expression/value `6` (use the defining screen’s radix). Assign rotate/expand/OR/XOR/flop/flip bit positions.

Declared: [241:3](#block-241) (constant).

Used in blocks: [241](#block-241), [242](#block-242), [243](#block-243).

**`MROR`** — Constant MROR, assigned source expression/value `4` (use the defining screen’s radix). Assign rotate/expand/OR/XOR/flop/flip bit positions.

Declared: [241:2](#block-241) (constant).

Used in blocks: [241](#block-241).

**`MRROT`** — Constant MRROT, assigned source expression/value `2` (use the defining screen’s radix). Assign rotate/expand/OR/XOR/flop/flip bit positions.

Declared: [241:2](#block-241) (constant).

Used in blocks: [241](#block-241).

**`MRXOR`** — Constant MRXOR, assigned source expression/value `5` (use the defining screen’s radix). Assign rotate/expand/OR/XOR/flop/flip bit positions.

Declared: [241:2](#block-241) (constant).

Used in blocks: [241](#block-241).

**`MSAFE`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:8](#block-146) (definition).

Definition tokens: `: MSAFE 0 SAFESCORE BMUSIC ;`.

Used in blocks: [146](#block-146), [183](#block-183).

**`MSTRIKE`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:6](#block-146) (definition).

Definition tokens: `: MSTRIKE 0 STRIKESCORE BMUSIC ;`.

Used in blocks: [146](#block-146), [182](#block-182).

**`MULTDN`** — Native branch/loop label. Handle opcode 4: decrement MULTIPLE, restart at STARTPC if repetitions remain, otherwise clear PRIORITY.

Declared: [143:9](#block-143) (forward declaration), [144:10](#block-144) (assembler label).

Used in blocks: [143](#block-143), [144](#block-144).

**`MULTHLBY4`** — Native word / kernel binding. MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign.

Declared: [236:1](#block-236) (native word / kernel binding).

Used in blocks: [236](#block-236), [258](#block-258), [261](#block-261).

**`MULTIPLE`** — Music stream repetition counter.

Declared: [143:1](#block-143) (byte variable).

Used in blocks: [143](#block-143), [144](#block-144), [145](#block-145).

**`MUSCPU`** — Native word / kernel binding. Declare cross-screen dispatch labels and begin assembling MUSCPU.

Declared: [143:10](#block-143) (native word / kernel binding).

Used in blocks: [143](#block-143), [268](#block-268).

**`MUSEND`** — Native branch/loop label. For register commands, recover the port number and output the following byte. Continue processing while A is zero; otherwise restore BC, return and close assembly.

Declared: [143:9](#block-143) (forward declaration), [144:13](#block-144) (assembler label).

Used in blocks: [143](#block-143), [144](#block-144).

**`MUSPC`** — Current music-bytecode stream pointer.

Declared: [141:1](#block-141) (cell variable).

Used in blocks: [141](#block-141), [143](#block-143), [144](#block-144), [145](#block-145).

**`MVI,`** — Load an immediate byte into the selected operand.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [124](#block-124), [125](#block-125), [126](#block-126), [143](#block-143), [145](#block-145), [164](#block-164), [165](#block-165), [173](#block-173), [174](#block-174), [175](#block-175), [177](#block-177), [179](#block-179), [190](#block-190), [191](#block-191), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [199](#block-199), [202](#block-202), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [234](#block-234), [235](#block-235), [236](#block-236), [237](#block-237), [239](#block-239), [241](#block-241), [242](#block-242), [247](#block-247), [255](#block-255), [257](#block-257), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [266](#block-266), [267](#block-267), [269](#block-269), [271](#block-271), [279](#block-279), [283](#block-283), [287](#block-287), [288](#block-288), [292](#block-292).

**`MYAH`** — Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

Declared: [146:4](#block-146) (definition).

Definition tokens: `: MYAH 0 CHEERSSCORE BMUSIC ;`.

Used in blocks: [124](#block-124), [130](#block-130), [146](#block-146), [181](#block-181), [182](#block-182), [183](#block-183).

### Dictionary: N

**`NBB`** — Native subroutine. SETDBLPLAY raises its flag; NBB is the empty-bases no-op.

Declared: [165:3](#block-165) (native subroutine).

Used in blocks: [165](#block-165), [166](#block-166).

**`NBD`** — Constant NBD, assigned source expression/value `528` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:10](#block-113) (constant).

Used in blocks: [113](#block-113), [192](#block-192), [195](#block-195), [213](#block-213), [225](#block-225).

**`NDUP`** — Native multi-cell stack duplication helper bound to $0260, used by OUTLINE.

Declared: [294:1](#block-294) (native word / kernel binding).

Used in blocks: [272](#block-272), [294](#block-294).

**`NEG,`** — Two's-complement negate A.

Used in blocks: [117](#block-117), [159](#block-159), [160](#block-160), [174](#block-174), [241](#block-241), [261](#block-261).

**`NEGDX`** — Byte variable; allocated at the declaration location. 

Declared: [149:10](#block-149) (byte variable).

Used in blocks: [149](#block-149).

**`NEXT`** — Native return to the byte-TERSE dispatcher; also appears in the scheduler entry convention.

Used in blocks: [145](#block-145), [160](#block-160), [167](#block-167), [179](#block-179), [180](#block-180), [207](#block-207), [208](#block-208), [234](#block-234), [237](#block-237), [238](#block-238), [239](#block-239), [244](#block-244), [245](#block-245), [247](#block-247), [250](#block-250), [269](#block-269), [270](#block-270), [271](#block-271), [277](#block-277), [291](#block-291), [292](#block-292), [304](#block-304).

**`NFORW`** — Native branch/loop label. Handle outfield pickup, forced retreat and the already-at-base shortcut.

Declared: [196:2](#block-196) (forward declaration), [197:8](#block-197) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`NOACTPA`** — Named data address. Emit foul-line retrieval and left-field-side third-base routes, including throw and base-cover commands.

Declared: [227:8](#block-227) (data label).

Used in blocks: [155](#block-155), [156](#block-156), [227](#block-227).

**`NOBOD`** — Named data address. Label and emit the invisible placeholder NOBOD and the ball pattern BALLPAT, including their size/offset metadata.

Declared: [107:11](#block-107) (data label).

Used in blocks: [107](#block-107), [115](#block-115), [186](#block-186), [212](#block-212), [238](#block-238).

**`NOBOD0`** — Named data address. Pair invisible, ball and on-base sprites with themselves for both motion phases, then continue.

Declared: [186:8](#block-186) (data label).

Used in blocks: [186](#block-186), [189](#block-189).

**`NOBODY`** — Named data address. Emit perspective lists for cover, throw, invisible, run, field and standing animations, using repeated entries where fewer unique sizes exist.

Declared: [189:4](#block-189) (data label).

Used in blocks: [189](#block-189).

**`NOCATCH`** — Latch preventing duplicate outfield catch/pickup detection.

Declared: [151:5](#block-151) (byte variable).

Used in blocks: [151](#block-151), [162](#block-162), [263](#block-263).

**`NOFILES`** — Temporarily suspend host file access while preserving the intended vocabulary context; block 34 patches related host behavior.

Used in blocks: [33](#block-33), [94](#block-94), [98](#block-98).

**`NOFPU`** — Native branch/loop label. Handle outfield pickup, forced retreat and the already-at-base shortcut.

Declared: [196:2](#block-196) (forward declaration), [197:10](#block-197) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`NOISE`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:4](#block-141) (definition).

Definition tokens: `: NOISE } 17 B, B, { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [141](#block-141).

**`NORLWRT`** — Byte variable; allocated at the declaration location. 

Declared: [151:10](#block-151) (byte variable).

Used in blocks: [151](#block-151).

**`NORUN`** — Post-catch runner-control constraint.

Declared: [151:8](#block-151) (byte variable).

Used in blocks: [116](#block-116), [151](#block-151), [162](#block-162), [196](#block-196), [198](#block-198).

**`NOT`** — Invert a condition; used in the host unsigned RAM-range test.

Used in blocks: [101](#block-101).

**`NOTES`** — Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

Declared: [141:14](#block-141) (definition).

Definition tokens: `: NOTES } ATONE BTONE CNOTE { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [140](#block-140), [141](#block-141).

**`NOTETIMER`** — Music duration countdown serviced by MUSCPU.

Declared: [143:1](#block-143) (byte variable).

Used in blocks: [143](#block-143), [144](#block-144), [145](#block-145).

**`NPICK`** — Native indexed-stack helper at $0260.

Declared: [89:12](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89).

**`NPOST`** — Definition. NPOST iterates the requested byte count, posts each high then low nibble using SWAN and dpost, drops remaining drawing arguments and continues.

Declared: [249:10](#block-249) (definition).

Definition tokens: `: NPOST ( ( ( OVER + SWAP DO I B@ SWAN dpost I B@ dpost LOOP 3DROP ;`.

Used in blocks: [183](#block-183), [249](#block-249).

**`NVAUTO`** — Native branch/loop label. Handle player FORW input, halfway commitment and the automatic-forward state, updating VOFW/VRSTAT and clearing VGO when a destination changes.

Declared: [196:1](#block-196) (forward declaration), [197:1](#block-197) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`NVFORW`** — Native branch/loop label. Read runner control/forward state, honor HOMERUN automatic advancement and choose forward, retreat or at-base paths; continue.

Declared: [196:1](#block-196) (forward declaration), [196:13](#block-196) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`NZPDX`** — Native branch/loop label. For movement choose RRUN or LRUN by X sign, activate outfielders, save OFPA, return and finish two-pass assembly; continue loading.

Declared: [174:1](#block-174) (forward declaration), [176:5](#block-176) (assembler label).

Used in blocks: [174](#block-174), [176](#block-176).

### Dictionary: O

**`O,`** — Definition. Wrap four saved-XC entry addresses as OB,, O,, OHERE and T,. Their implementations reside in the loaded XC image.

Declared: [98:2](#block-98) (definition).

Definition tokens: `: O, 08302 EXECUTE ;`.

Used in blocks: [98](#block-98), [100](#block-100), [101](#block-101).

**`OB,`** — Definition. Wrap four saved-XC entry addresses as OB,, O,, OHERE and T,. Their implementations reside in the loaded XC image.

Declared: [98:2](#block-98) (definition).

Definition tokens: `: OB, 08257 EXECUTE ;`.

Used in blocks: [97](#block-97), [98](#block-98), [99](#block-99), [101](#block-101).

**`OBJECT-FILE`** — Select the named target object file.

Used in blocks: [33](#block-33), [94](#block-94).

**`OFANM#`** — Byte variable; allocated at the declaration location. 

Declared: [150:1](#block-150) (byte variable).

Used in blocks: [150](#block-150).

**`OFBLCHK`** — Native subroutine. OFBLCHK takes a maximum distance in D, loads BL coordinates and begins with LF in IY for a three-record search.

Declared: [261:1](#block-261) (native subroutine).

Used in blocks: [125](#block-125), [261](#block-261), [263](#block-263).

**`OFCATCH`** — Byte variable. Allocate strike/walk/bonus, field-clear, timing, odds, instruction, base-coordinate, double-play and catch/out flags.

Declared: [151:10](#block-151) (byte variable).

Used in blocks: [116](#block-116), [117](#block-117), [118](#block-118), [151](#block-151), [263](#block-263).

**`OFCRUN`** — Byte variable; allocated at the declaration location. 

Declared: [151:4](#block-151) (byte variable).

Used in blocks: [151](#block-151).

**`OFDX`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:9](#block-150) (cell variable).

Used in blocks: [150](#block-150), [173](#block-173), [175](#block-175), [236](#block-236).

**`OFDY`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:9](#block-150) (cell variable).

Used in blocks: [150](#block-150), [173](#block-173), [175](#block-175), [236](#block-236).

**`OFFDST,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:8](#block-225) (definition).

Definition tokens: `: OFFDST, } 9 B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226).

**`OFFDX`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:13](#block-150) (cell variable).

Used in blocks: [150](#block-150), [195](#block-195).

**`OFFDY`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:13](#block-150) (cell variable).

Used in blocks: [150](#block-150), [195](#block-195).

**`OFFFDST`** — Native word / kernel binding. OFFFDST schedules a take-field delay for outfielders, chooses an exit side from team/runner status and calls DSTCALC for the off-field destination.

Declared: [195:2](#block-195) (native word / kernel binding).

Used in blocks: [195](#block-195), [199](#block-199).

**`OFFFPA`** — Named data address. Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

Declared: [226:1](#block-226) (data label).

Used in blocks: [116](#block-116), [181](#block-181), [226](#block-226).

**`OFFLDANM`** — Byte variable; allocated at the declaration location. 

Declared: [149:11](#block-149) (byte variable).

Used in blocks: [149](#block-149).

**`OFFOPCODE`** — Byte variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:13](#block-150) (byte variable).

Used in blocks: [150](#block-150), [213](#block-213).

**`OFFPA`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:14](#block-150) (cell variable).

Used in blocks: [150](#block-150), [195](#block-195).

**`OFFPALD`** — Native branch/loop label. At OFFPALD write the off-field pattern/deltas, select OFFPA as VECTPC, return and close assembly; continue.

Declared: [195:1](#block-195) (forward declaration), [195:14](#block-195) (assembler label).

Used in blocks: [195](#block-195), [198](#block-198).

**`OFFUPDATE#`** — Byte variable; allocated at the declaration location. 

Declared: [150:14](#block-150) (byte variable).

Used in blocks: [150](#block-150).

**`OFLDTBL`** — Native word / kernel binding. OFLDTBL gives all three outfielders OFTBLPA, activates them and returns; continue.

Declared: [124:12](#block-124) (native word / kernel binding).

Used in blocks: [124](#block-124), [132](#block-132).

**`OFMOT,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:7](#block-225) (definition).

Definition tokens: `: OFMOT, } 5 B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226).

**`OFMOTION`** — Native word / kernel binding. OFMOTION selects OFPA and deactivates a standing outfielder.

Declared: [199:1](#block-199) (native word / kernel binding).

Used in blocks: [199](#block-199).

**`OFOPCODE`** — Byte variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:9](#block-150) (byte variable).

Used in blocks: [150](#block-150), [212](#block-212).

**`OFOUT`** — Byte variable. Allocate strike/walk/bonus, field-clear, timing, odds, instruction, base-coordinate, double-play and catch/out flags.

Declared: [151:10](#block-151) (byte variable).

Used in blocks: [116](#block-116), [117](#block-117), [151](#block-151).

**`OFPA`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:10](#block-150) (cell variable).

Used in blocks: [150](#block-150), [173](#block-173), [176](#block-176), [199](#block-199), [213](#block-213), [236](#block-236).

**`OFPU`** — Outfield pickup flag used by runner retreat/advance control.

Declared: [149:8](#block-149) (byte variable).

Used in blocks: [149](#block-149), [162](#block-162), [197](#block-197), [263](#block-263).

**`OFTBLGO`** — Outfield motion/control enabled state.

Declared: [149:12](#block-149) (byte variable).

Used in blocks: [149](#block-149), [162](#block-162), [167](#block-167), [173](#block-173), [175](#block-175), [194](#block-194), [198](#block-198), [236](#block-236), [263](#block-263).

**`OFTBLPA`** — Named data address. Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

Declared: [226:2](#block-226) (data label).

Used in blocks: [124](#block-124), [226](#block-226).

**`OFTFCNT`** — Count of outfielders still reaching their take-field positions.

Declared: [149:9](#block-149) (byte variable).

Used in blocks: [130](#block-130), [149](#block-149), [194](#block-194), [212](#block-212), [273](#block-273).

**`OFTOTBL`** — Request to place outfielders on their shared control action table.

Declared: [151:6](#block-151) (byte variable).

Used in blocks: [124](#block-124), [132](#block-132), [151](#block-151), [194](#block-194).

**`OFUPDATE#`** — Byte variable; allocated at the declaration location. 

Declared: [150:10](#block-150) (byte variable).

Used in blocks: [150](#block-150).

**`OHERE`** — Definition. Wrap four saved-XC entry addresses as OB,, O,, OHERE and T,. Their implementations reside in the loaded XC image.

Declared: [98:3](#block-98) (definition).

Definition tokens: `: OHERE 08314 EXECUTE ;`.

Used in blocks: [97](#block-97), [98](#block-98), [100](#block-100).

**`OLDFORW`** — Byte variable; allocated at the declaration location. 

Declared: [149:13](#block-149) (byte variable).

Used in blocks: [149](#block-149).

**`OLDSTRING`** — Last event-string index retained for erase/redraw.

Declared: [149:10](#block-149) (byte variable).

Used in blocks: [149](#block-149), [182](#block-182), [184](#block-184), [254](#block-254).

**`ON1ST`** — Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue.

Declared: [191:5](#block-191) (native word / kernel binding).

Used in blocks: [191](#block-191), [199](#block-199).

**`ON1ST,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:4](#block-225) (definition).

Definition tokens: `: ON1ST, } 2 B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226), [228](#block-228).

**`ON2ND`** — Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue.

Declared: [191:6](#block-191) (native word / kernel binding).

Used in blocks: [191](#block-191), [199](#block-199).

**`ON2ND,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:5](#block-225) (definition).

Definition tokens: `: ON2ND, } 3 B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226).

**`ON3RD`** — Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue.

Declared: [191:7](#block-191) (native word / kernel binding).

Used in blocks: [191](#block-191), [199](#block-199).

**`ON3RD,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:5](#block-225) (definition).

Definition tokens: `: ON3RD, } 4 B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226), [227](#block-227).

**`ONBASE`** — Named data address. Emit perspective lists for ball, covering, standing pitcher, pitcher throwing and on-base animation; continue.

Declared: [188:13](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`ONBASE1`** — Named data address. Emit the pitcher-middle image PTMID and ONBASE1, then continue.

Declared: [110:14](#block-110) (data label).

Used in blocks: [110](#block-110), [186](#block-186).

**`ONBASE2`** — Named data address. Emit RUP0B and ONBASE2, then continue with the pattern chain.

Declared: [109:13](#block-109) (data label).

Used in blocks: [109](#block-109), [186](#block-186).

**`ONBS1`** — Named data address. Pair invisible, ball and on-base sprites with themselves for both motion phases, then continue.

Declared: [186:10](#block-186) (data label).

Used in blocks: [186](#block-186), [188](#block-188).

**`ONBS2`** — Named data address. Pair invisible, ball and on-base sprites with themselves for both motion phases, then continue.

Declared: [186:11](#block-186) (data label).

Used in blocks: [186](#block-186), [188](#block-188).

**`OPBLDST`** — Constant OPBLDST, assigned source expression/value `0A` (use the defining screen’s radix). Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:6](#block-225) (constant).

Used in blocks: [213](#block-213), [225](#block-225).

**`OPBLMOT`** — Constant OPBLMOT, assigned source expression/value `6` (use the defining screen’s radix). Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:6](#block-225) (constant).

Used in blocks: [225](#block-225).

**`OPCODECHK`** — Native word / kernel binding. OPCODECHK treats bytes below $28 as commands, saves the next stream address in VECTPC, indexes OPTBL after adjusting the command index, dispatches via a synthetic native return and reloads VECTPC.

Declared: [200:2](#block-200) (native word / kernel binding).

Used in blocks: [200](#block-200), [201](#block-201).

**`OPRET`** — Native branch/loop label. OPCODECHK treats bytes below $28 as commands, saves the next stream address in VECTPC, indexes OPTBL after adjusting the command index, dispatches via a synthetic native return and reloads VECTPC.

Declared: [200:1](#block-200) (forward declaration), [200:7](#block-200) (assembler label).

Used in blocks: [200](#block-200).

**`OPTBL`** — Named data address. Emit OPTBL with handlers ordered to match the byte opcodes defined in 225, then continue.

Declared: [199:10](#block-199) (data label).

Used in blocks: [199](#block-199), [200](#block-200).

**`OR`** — Bitwise inclusive OR of two values.

Declared: [88:13](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [181](#block-181), [213](#block-213), [249](#block-249).

**`ORA,`** — OR an operand into A and set flags.

Used in blocks: [120](#block-120), [143](#block-143), [144](#block-144), [145](#block-145), [174](#block-174), [241](#block-241), [242](#block-242), [276](#block-276), [279](#block-279), [283](#block-283), [285](#block-285).

**`ORI,`** — OR an immediate byte into A.

Used in blocks: [144](#block-144).

**`OTBALLX`** — Axis-selection latch used while reading interleaved trackball deltas.

Declared: [150:2](#block-150) (byte variable).

Used in blocks: [150](#block-150), [174](#block-174).

**`OTBALLY`** — Byte variable; allocated at the declaration location. 

Declared: [150:1](#block-150) (byte variable).

Used in blocks: [150](#block-150).

**`OUB!`** — Definition. Define OUB!: save OHERE, temporarily replace host pointer $F3DD, emit OB,, and restore that pointer.

Declared: [97:2](#block-97) (definition).

Definition tokens: `: OUB! OHERE >R 0F3DD ! OB, R> 0F3DD ! ;`.

Used in blocks: [97](#block-97).

**`OUT,`** — Output A to an immediate port; port numbers may appear directly before this word.

Used in blocks: [124](#block-124), [174](#block-174), [207](#block-207), [243](#block-243), [264](#block-264), [269](#block-269), [287](#block-287), [288](#block-288), [291](#block-291), [292](#block-292).

**`OUTFLDACT`** — Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE.

Declared: [237:7](#block-237) (native word / kernel binding).

Used in blocks: [124](#block-124), [173](#block-173), [176](#block-176), [237](#block-237).

**`OUTFLDHIT`** — Definition. Set outfield, timer, speed and airborne flags; select randomized Y/X coordinates and a HMHTBL class, call HOMERCHK and start the batter.

Declared: [161:1](#block-161) (definition).

Definition tokens: `: OUTFLDHIT ( 18 TOTIMER B! HITOF BONE 3 VVEL BL B! TOOF BONE 3 TOOF# B! INAIR BONE 3000 RND 700 + ( SWINGTYPE B@ 1- FHTBL @ F00 RND + ( 0A RND HMHTBL B@ ( 5FF RND 5FF RND HOMERCHK WUPGO HITDST HRPT HL1ST VDSTX BL @ 2800 < IF ( HL2ND HLOUTSSPA ELSE HROUT2NDPA HRSS THEN HR3RD LDINFLDPA ;`.

Used in blocks: [161](#block-161), [162](#block-162).

**`OUTLINE`** — Definition. OUTLINE uses NDUP/PICK and line continuation to draw four edges from X/Y/width/height.

Declared: [272:6](#block-272) (definition).

Definition tokens: `: OUTLINE ( ( 4 NDUP DROP 3 PICK + OVER 4 NDUP DLINE 5 PICK + CNLINE 3 PICK + CNLINE DROP DROP CNLINE ;`.

Used in blocks: [272](#block-272), [274](#block-274).

**`OUTOFFF`** — Native branch/loop label. Test runner-at-base, forward motion and halfway status, possibly force runners back, compare base numbers and enter the out path at OUTOFFF.

Declared: [116:1](#block-116) (forward declaration), [116:14](#block-116) (assembler label).

Used in blocks: [116](#block-116).

**`OUTP`** — Write a hardware output port; a target primitive distinct from assembler OUTP,.

Declared: [89:5](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89), [133](#block-133), [274](#block-274), [275](#block-275), [293](#block-293).

**`OUTP,`** — Emit register-port output according to the assembler operand convention.

Used in blocks: [144](#block-144).

**`OUTS`** — Out count stored as an ASCII-style $30-based byte.

Declared: [149:13](#block-149) (byte variable).

Used in blocks: [117](#block-117), [128](#block-128), [129](#block-129), [149](#block-149), [179](#block-179), [181](#block-181), [272](#block-272), [275](#block-275).

**`OUTSCORE`** — Byte table. OUTSCORE plays descending chords and ends quietly. Restore the saved radix and stop loading.

Declared: [140:5](#block-140) (byte table).

Used in blocks: [140](#block-140), [146](#block-146).

**`OUTTIME`** — Definition. Define GAME OVER text. OUTTIME increments OUTS; reaching $33 enters the third-out path and requests cheer music.

Declared: [181:2](#block-181) (definition).

Definition tokens: `: OUTTIME ( OUTS DUP 1+B! B@ 33 = IF MYAH VMAGIC PT 08 0 DO DUP DUP VPLAYACTPCL + OFFFPA S! VSTATUS + DUP B@ 80 OR F7 AND SB! VLENGTH + LOOP DROP TAKEFIELD BONE STRIKES B@ 33 = IF BALLERASE THEN VMAGIC R1 4 0 DO DUP DUP VPLAYACTPCL + OFFFPA S! VSTATUS + DUP B@ F7 AND ( SB! DUP VWBASE + …`.

Used in blocks: [181](#block-181), [182](#block-182), [183](#block-183).

**`OVER`** — Copy the second stack cell to the top.

Declared: [89:3](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89), [101](#block-101), [239](#block-239), [248](#block-248), [249](#block-249), [272](#block-272).

### Dictionary: P

**`PACTLOAD`** — Native word / kernel binding. PACTLOAD fetches VPLAYACTPC, services a command and either skips the existing movement fields for SAMEDLT or calls LOADANM.

Declared: [201:6](#block-201) (native word / kernel binding).

Used in blocks: [201](#block-201), [203](#block-203).

**`PATFETCH`** — Native word / kernel binding. PATFETCH selects normal phase limits or a longer pitcher pre-hit sequence.

Declared: [202:1](#block-202) (native word / kernel binding).

Used in blocks: [202](#block-202), [203](#block-203).

**`PATTERNS`** — Named data address. Emit PATTERNS in the group order selected by packed pattern numbers, then finish loading.

Declared: [189:11](#block-189) (data label).

Used in blocks: [189](#block-189), [200](#block-200).

**`PCHL,`** — Jump through HL.

Used in blocks: [164](#block-164), [167](#block-167), [200](#block-200).

**`PCIX,`** — Jump through IX.

Used in blocks: [284](#block-284).

**`PCIY,`** — Jump through IY.

Used in blocks: [282](#block-282).

**`PCJUMP`** — Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

Declared: [143:5](#block-143) (native subroutine).

Used in blocks: [143](#block-143), [144](#block-144).

**`PCO`** — Named data address. Emit fast/slow/accelerating/decelerating and curve-out pitch segments as deltas plus duration/update counts.

Declared: [229:8](#block-229) (data label).

Used in blocks: [122](#block-122), [229](#block-229).

**`PE,`** — Assembler parity-even selector; after LD A,I it tests the saved interrupt-enable state.

Used in blocks: [247](#block-247), [270](#block-270).

**`PERSPECTIVE`** — Native word / kernel binding. PERSPECTIVE compares integer Y against its thresholds and chooses size index 0–4.

Declared: [255:3](#block-255) (native word / kernel binding).

Used in blocks: [255](#block-255), [266](#block-266).

**`PFB`** — Named data address. Emit fast/slow/accelerating/decelerating and curve-out pitch segments as deltas plus duration/update counts.

Declared: [229:4](#block-229) (data label).

Used in blocks: [122](#block-122), [229](#block-229).

**`PICI`** — Named data address. Emit the inside-curve variants PICI/PICO, return to decimal and finish loading.

Declared: [229:10](#block-229) (data label).

Used in blocks: [122](#block-122), [229](#block-229).

**`PICK`** — Copy an indexed parameter-stack cell; see the calling sequences for this dialect's index convention.

Declared: [89:8](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89), [184](#block-184), [272](#block-272).

**`PICO`** — Named data address. Emit the inside-curve variants PICI/PICO, return to decimal and finish loading.

Declared: [229:11](#block-229) (data label).

Used in blocks: [122](#block-122), [229](#block-229).

**`PITCHBLPA`** — Named data address. Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

Declared: [226:6](#block-226) (data label).

Used in blocks: [122](#block-122), [226](#block-226).

**`PITCHIT`** — Gate/request for beginning a pitcher animation.

Declared: [152:13](#block-152) (byte variable).

Used in blocks: [126](#block-126), [152](#block-152), [194](#block-194).

**`PITCHPA`** — Named data address. Emit PITCHPA and right/left throw animations.

Declared: [227:2](#block-227) (data label).

Used in blocks: [126](#block-126), [227](#block-227).

**`PITCHTIME`** — Active pitch state and initial pitch timing flag.

Declared: [152:14](#block-152) (byte variable).

Used in blocks: [122](#block-122), [124](#block-124), [126](#block-126), [132](#block-132), [152](#block-152), [262](#block-262).

**`PLAYACT`** — Native word / kernel binding. Preserve BC/IX, select the vector and fetch a new action when VUPDATE# is zero.

Declared: [203:1](#block-203) (native word / kernel binding).

Used in blocks: [203](#block-203), [266](#block-266), [267](#block-267).

**`PLAYON`** — Pointer to the runner record currently relevant to the defensive play.

Declared: [149:11](#block-149) (cell variable).

Used in blocks: [114](#block-114), [116](#block-116), [117](#block-117), [119](#block-119), [149](#block-149), [162](#block-162), [167](#block-167), [263](#block-263).

**`PLBACK`** — Native branch/loop label. Use the saved sign/overflow-related tests to choose PLBACK or PLDONE; completion advances IX past the loop frame, while repetition loads the saved branch address into BC. Both return through NEXT.

Declared: [276:9](#block-276) (forward declaration), [277:3](#block-277) (assembler label).

Used in blocks: [276](#block-276), [277](#block-277).

**`PLDONE`** — Native branch/loop label. Use the saved sign/overflow-related tests to choose PLBACK or PLDONE; completion advances IX past the loop frame, while repetition loads the saved branch address into BC. Both return through NEXT.

Declared: [276:9](#block-276) (forward declaration), [277:2](#block-277) (assembler label).

Used in blocks: [276](#block-276), [277](#block-277).

**`PLPOS`** — Native branch/loop label. Use the saved sign/overflow-related tests to choose PLBACK or PLDONE; completion advances IX past the loop frame, while repetition loads the saved branch address into BC. Both return through NEXT.

Declared: [276:9](#block-276) (forward declaration), [277:1](#block-277) (assembler label).

Used in blocks: [276](#block-276), [277](#block-277).

**`PLRCHK`** — Definition. PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL; continue.

Declared: [131:9](#block-131) (definition).

Definition tokens: `: PLRCHK 14 INP DUP 10 AND 10 XOR IF DROP CMPLR BONE STRTBALL DI 800 7000 8828 A" SPOST EI ELSE STRT1 B@ IF DROP ELSE 20 AND 20 XOR IF CNSW1 B@ IF CNSW12 BONE THEN STRTBALL THEN THEN THEN ;`.

Used in blocks: [131](#block-131), [132](#block-132).

**`PLRSELECT`** — Definition. PLRSELECT redraws the field, enables player-choice polling and resets SELECT while updating the inning marker.

Declared: [131:1](#block-131) (definition).

Definition tokens: `: PLRSELECT ( DI FL CHKPLRS BONE SPLR SELECT BZERO MLINN ;`.

Used in blocks: [131](#block-131), [132](#block-132).

**`PLYR1UP`** — Batting-side flag selecting team scores and control direction.

Declared: [149:2](#block-149) (byte variable).

Used in blocks: [114](#block-114), [128](#block-128), [129](#block-129), [131](#block-131), [149](#block-149), [169](#block-169), [174](#block-174), [181](#block-181), [195](#block-195), [212](#block-212), [238](#block-238).

**`PMUSIC`** — Native word / kernel binding. PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer. 

Declared: [145:6](#block-145) (native word / kernel binding).

Used in blocks: [145](#block-145), [146](#block-146).

**`POP,`** — Pop a native stack cell into the selected pair.

Used in blocks: [115](#block-115), [117](#block-117), [132](#block-132), [144](#block-144), [145](#block-145), [159](#block-159), [167](#block-167), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [180](#block-180), [191](#block-191), [193](#block-193), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [200](#block-200), [203](#block-203), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [250](#block-250), [253](#block-253), [258](#block-258), [259](#block-259), [261](#block-261), [263](#block-263), [266](#block-266), [268](#block-268), [269](#block-269), [270](#block-270), [271](#block-271), [276](#block-276), [279](#block-279), [282](#block-282), [284](#block-284), [285](#block-285), [286](#block-286), [291](#block-291), [292](#block-292).

**`POPX,`** — Pop a native stack cell into IX/IY.

Used in blocks: [114](#block-114), [117](#block-117), [118](#block-118), [120](#block-120), [125](#block-125), [173](#block-173), [180](#block-180), [196](#block-196), [203](#block-203), [208](#block-208), [238](#block-238), [239](#block-239), [244](#block-244), [245](#block-245), [247](#block-247), [251](#block-251), [252](#block-252), [259](#block-259), [265](#block-265), [266](#block-266), [268](#block-268), [270](#block-270).

**`PORTOUT`** — Native branch/loop label. For register commands, recover the port number and output the following byte. Continue processing while A is zero; otherwise restore BC, return and close assembly.

Declared: [143:9](#block-143) (forward declaration), [144:11](#block-144) (assembler label).

Used in blocks: [143](#block-143), [144](#block-144).

**`PPOST`** — Definition. PPOST obtains the counted string length/address using COUNT and calls cpost for every byte, leaving updated X/Y/options for the next string; continue.

Declared: [248:7](#block-248) (definition).

Definition tokens: `: PPOST ( ( ( ( COUNT OVER + SWAP DO I B@ cpost LOOP ;`.

Used in blocks: [248](#block-248), [249](#block-249).

**`PRIORITY`** — Music priority flag preventing BMUSIC from replacing a priority stream.

Declared: [143:1](#block-143) (byte variable).

Used in blocks: [143](#block-143), [144](#block-144), [145](#block-145).

**`PROCESS`** — Native branch/loop label. Preserve BC, count down a pending note duration, then fetch a command. Opcode zero reads randomized-note parameters and calls RND through DOVERB; continue in 144.

Declared: [143:8](#block-143) (forward declaration), [143:13](#block-143) (assembler label).

Used in blocks: [143](#block-143), [144](#block-144).

**`PROT`** — Reinstate host memory protection after bload's copy.

Used in blocks: [10](#block-10).

**`PSB`** — Named data address. Emit fast/slow/accelerating/decelerating and curve-out pitch segments as deltas plus duration/update counts.

Declared: [229:5](#block-229) (data label).

Used in blocks: [122](#block-122), [229](#block-229).

**`PSD`** — Named data address. Emit fast/slow/accelerating/decelerating and curve-out pitch segments as deltas plus duration/update counts.

Declared: [229:7](#block-229) (data label).

Used in blocks: [122](#block-122), [229](#block-229).

**`PSTACK`** — Cross-compiler parameter-stack location setting.

Used in blocks: [33](#block-33), [94](#block-94).

**`PSU`** — Named data address. Emit fast/slow/accelerating/decelerating and curve-out pitch segments as deltas plus duration/update counts.

Declared: [229:6](#block-229) (data label).

Used in blocks: [122](#block-122), [229](#block-229).

**`PSW`** — Assembler AF accumulator/flags pair operand for PUSH,/POP,.

Used in blocks: [115](#block-115), [159](#block-159), [174](#block-174), [177](#block-177), [198](#block-198), [230](#block-230), [231](#block-231), [234](#block-234), [236](#block-236), [246](#block-246), [247](#block-247), [266](#block-266), [269](#block-269), [270](#block-270), [276](#block-276), [279](#block-279), [291](#block-291).

**`PT`** — VLENGTH-byte vector record for the pitcher. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:9](#block-216) (byte array).

Used in blocks: [119](#block-119), [122](#block-122), [126](#block-126), [153](#block-153), [157](#block-157), [181](#block-181), [211](#block-211), [212](#block-212), [213](#block-213), [216](#block-216), [237](#block-237), [262](#block-262).

**`PTAUTOTM`** — Native word / kernel binding. PTAUTOTM decrements TIMEOUT only when field clearing is idle; WUPWRT calls it and draws the currently batting team label.

Declared: [238:4](#block-238) (native word / kernel binding).

Used in blocks: [238](#block-238).

**`PTMID`** — Named data address. Emit the pitcher-middle image PTMID and ONBASE1, then continue.

Declared: [110:12](#block-110) (data label).

Used in blocks: [110](#block-110), [187](#block-187).

**`PTPT`** — Named data address. Emit perspective lists for ball, covering, standing pitcher, pitcher throwing and on-base animation; continue.

Declared: [188:12](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`PTRND#`** — Random index selecting a computer pitch from PTTBL.

Declared: [149:14](#block-149) (byte variable).

Used in blocks: [123](#block-123), [149](#block-149), [169](#block-169).

**`PTTBL`** — Named data address. Emit PTTBL, an address table of supported computer pitch sequences, with intentional repeated entries affecting selection frequency.

Declared: [122:1](#block-122) (data label).

Used in blocks: [122](#block-122), [123](#block-123).

**`PTTHW`** — Constant PTTHW, assigned source expression/value `928` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:12](#block-113) (constant).

Used in blocks: [113](#block-113), [227](#block-227).

**`PTTHW1`** — Named data address. Provide pitcher-throw and repeated-image covering pairs; continue.

Declared: [187:5](#block-187) (data label).

Used in blocks: [187](#block-187), [188](#block-188).

**`PUP`** — Definition. Initialize high-resolution commercial video mode, select B1 and write the initial output values.

Declared: [133:1](#block-133) (definition).

Definition tokens: `: PUP ( INTHIGHRES B1 DUP 0 OUTP 4 OUTP 7 2 OUTP DI 0 RND# @ 1 RND# @ SCRERASE 1 RND# ! 0 RND# ! EMUSIC S10 SHILL BONE DI FL SGO EI GAMEOVER BONE TF SENTRY ;`.

Used in blocks: [133](#block-133).

**`PUSH,`** — Push the selected register pair on the native stack.

Used in blocks: [114](#block-114), [115](#block-115), [117](#block-117), [132](#block-132), [143](#block-143), [164](#block-164), [167](#block-167), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [180](#block-180), [192](#block-192), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [200](#block-200), [203](#block-203), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [250](#block-250), [251](#block-251), [252](#block-252), [253](#block-253), [258](#block-258), [259](#block-259), [261](#block-261), [264](#block-264), [265](#block-265), [266](#block-266), [269](#block-269), [270](#block-270), [271](#block-271), [276](#block-276), [279](#block-279), [282](#block-282), [284](#block-284), [285](#block-285), [286](#block-286), [291](#block-291).

**`PUSHX,`** — Push IX/IY on the native stack.

Used in blocks: [114](#block-114), [116](#block-116), [117](#block-117), [119](#block-119), [125](#block-125), [173](#block-173), [180](#block-180), [191](#block-191), [195](#block-195), [196](#block-196), [203](#block-203), [208](#block-208), [238](#block-238), [239](#block-239), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [263](#block-263), [264](#block-264), [266](#block-266), [268](#block-268), [270](#block-270).

**`PWRT`** — Native branch/loop label. PWRT obtains SADR and the current mask/value. For nonzero V-MODE the actual code stores E directly; otherwise it clears the selected two bits then ORs E. The mode comment in block 280 labels this branch XOR, while the instruction is a direct store.

Declared: [285:1](#block-285) (assembler label), [281:4](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [284](#block-284), [285](#block-285).

**`PX0`** — Definition. Emit zero/white pixel patterns and define PX1/PX0 to select them.

Declared: [280:7](#block-280) (definition).

Definition tokens: `: PX0 0 PXT0 PXTYPE ! ;`.

Used in blocks: [121](#block-121), [128](#block-128), [130](#block-130), [280](#block-280).

**`PX1`** — Definition. Emit zero/white pixel patterns and define PX1/PX0 to select them.

Declared: [280:6](#block-280) (definition).

Definition tokens: `: PX1 0 PXT1 PXTYPE ! ;`.

Used in blocks: [128](#block-128), [274](#block-274), [280](#block-280).

**`PXT0`** — Byte table. Emit zero/white pixel patterns and define PX1/PX0 to select them.

Declared: [280:4](#block-280) (byte table).

Used in blocks: [280](#block-280).

**`PXT1`** — Byte table. Emit zero/white pixel patterns and define PX1/PX0 to select them.

Declared: [280:5](#block-280) (byte table).

Used in blocks: [280](#block-280).

**`PXT3`** — Byte table. Emit four two-bit clearing masks and full-color pixel values, restore radix and continue.

Declared: [280:9](#block-280) (byte table).

Used in blocks: [274](#block-274), [280](#block-280).

**`PXTYPE`** — Pointer to the selected two-bit line-drawing pixel-value table.

Declared: [280:2](#block-280) (cell variable).

Used in blocks: [274](#block-274), [280](#block-280), [284](#block-284).

### Dictionary: Q

**`QUIET`** — Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

Declared: [141:7](#block-141) (definition).

Definition tokens: `: QUIET } 0 ABVOLS 0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [140](#block-140), [141](#block-141).

**`QUIT`** — Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

Declared: [141:6](#block-141) (definition).

Definition tokens: `: QUIT } 4 B, HERE LDPC { ;`.

Used in blocks: [141](#block-141).

### Dictionary: R

**`R1`** — VLENGTH-byte vector record for runner slot 1. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:13](#block-216) (byte array).

Used in blocks: [114](#block-114), [115](#block-115), [120](#block-120), [162](#block-162), [163](#block-163), [166](#block-166), [167](#block-167), [168](#block-168), [169](#block-169), [181](#block-181), [196](#block-196), [212](#block-212), [213](#block-213), [216](#block-216), [235](#block-235).

**`R2`** — VLENGTH-byte vector record for runner slot 2. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:12](#block-216) (byte array).

Used in blocks: [115](#block-115), [120](#block-120), [163](#block-163), [165](#block-165), [166](#block-166), [168](#block-168), [213](#block-213), [216](#block-216), [235](#block-235).

**`R3`** — VLENGTH-byte vector record for runner slot 3. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:11](#block-216) (byte array).

Used in blocks: [115](#block-115), [120](#block-120), [165](#block-165), [166](#block-166), [168](#block-168), [213](#block-213), [216](#block-216), [235](#block-235), [264](#block-264).

**`R4`** — VLENGTH-byte vector record for runner slot 4. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:10](#block-216) (byte array).

Used in blocks: [114](#block-114), [115](#block-115), [120](#block-120), [168](#block-168), [213](#block-213), [216](#block-216), [235](#block-235).

**`R>`** — Move the top return-stack value to the parameter stack in host TERSE.

Used in blocks: [10](#block-10), [97](#block-97).

**`R@`** — Fetch the return-stack/loop-state value exposed by native entry $01BF; I is bound to the same entry.

Declared: [89:2](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89).

**`RALR,`** — Rotate a register left through carry.

Used in blocks: [230](#block-230), [236](#block-236), [247](#block-247), [271](#block-271).

**`RAMSTART`** — Cross-compiler target variable/RAM origin setting.

Used in blocks: [33](#block-33), [94](#block-94).

**`RARR,`** — Rotate a register right through carry.

Used in blocks: [207](#block-207), [231](#block-231), [234](#block-234), [242](#block-242).

**`RBACK`** — Forward-declared assembler name. Declared as a forward assembler name.

Declared: [196:1](#block-196) (forward declaration).

Used in blocks: [196](#block-196).

**`RC,`** — Return if carry is set.

Used in blocks: [126](#block-126), [263](#block-263).

**`RCB`** — Constant RCB, assigned source expression/value `328` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:9](#block-113) (constant).

Used in blocks: [113](#block-113), [225](#block-225).

**`RCB,`** — Definition. Define standing and right/left cover-base action macros that end by deactivating; continue.

Declared: [225:12](#block-225) (definition).

Definition tokens: `: RCB, } 0 0 0 RCB ACT, DEACT, { ;`.

Used in blocks: [225](#block-225), [226](#block-226), [227](#block-227).

**`RDRNDNTE`** — Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

Declared: [141:11](#block-141) (definition).

Definition tokens: `: RDRNDNTE } 0 B, B, B, B, { ;`.

Used in blocks: [138](#block-138), [141](#block-141).

**`RDST`** — Destination-reached indication returned by DSTCALC.

Declared: [152:3](#block-152) (byte variable).

Used in blocks: [152](#block-152), [230](#block-230), [231](#block-231).

**`READPORT`** — Native branch/loop label. Preserve BC, move the port/mask into working registers and sample `(input XOR expected) AND mask`; return A=1 after enough consecutive matches.

Declared: [286:7](#block-286) (forward declaration), [286:8](#block-286) (assembler label).

Used in blocks: [286](#block-286).

**`RECLINE`** — Definition. RECLINE derives one horizontal row from retained rectangle arguments. RECTAN repeatedly draws rows, advances Y and decreases remaining height, then discards the arguments.

Declared: [272:1](#block-272) (definition).

Definition tokens: `: RECLINE 4 PICK 4 PICK 2DUP SWAP 6 PICK + SWAP DLINE ;`.

Used in blocks: [272](#block-272).

**`RECTAN`** — Definition. RECLINE derives one horizontal row from retained rectangle arguments. RECTAN repeatedly draws rows, advances Y and decreases remaining height, then discards the arguments.

Declared: [272:2](#block-272) (definition).

Definition tokens: `: RECTAN ( BEGIN RECLINE ROT 1+ ROT ROT 1- DUP 0= END DROP DROP DROP DROP ;`.

Used in blocks: [121](#block-121), [128](#block-128), [130](#block-130), [272](#block-272), [273](#block-273), [274](#block-274).

**`relabs`** — Native subroutine. relabs converts Y's integer byte to an 80-byte scanline offset while preserving the expansion/magic settings.

Declared: [241:4](#block-241) (native subroutine).

Used in blocks: [241](#block-241), [244](#block-244), [245](#block-245), [247](#block-247), [251](#block-251), [259](#block-259), [271](#block-271).

**`reloff`** — Native subroutine. reloff documents its BC/DE/HL/IY interface, loads the X offset and scales it with two arithmetic/right-through-carry shifts.

Declared: [242:1](#block-242) (native subroutine).

Used in blocks: [242](#block-242), [245](#block-245), [251](#block-251), [259](#block-259).

**`REND`** — Native branch/loop label. Keep the runner active when play permits; otherwise choose its left/right on-base image by X and zero movement.

Declared: [196:2](#block-196) (forward declaration), [198:11](#block-198) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197), [198](#block-198).

**`RES,`** — Clear a register bit.

Used in blocks: [123](#block-123).

**`RESETRUNNERS`** — Native word / kernel binding. Declare copy-path labels, enter assembly, and set a four-pass loop while saving the loop accumulator/flags.

Declared: [115:2](#block-115) (native word / kernel binding).

Used in blocks: [115](#block-115), [122](#block-122).

**`REST`** — Definition. Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato.

Declared: [136:2](#block-136) (definition).

Definition tokens: `: REST } 0 ABVOLS 0 MCVOLS 0A DURATION { ;`.

Used in blocks: [136](#block-136).

**`REST,`** — Definition. Select hex. REST, emits an invisible stationary action; ACT, emits the stacked pattern, update count and velocity cells in the table format consumed by PACTLOAD.

Declared: [225:2](#block-225) (definition).

Definition tokens: `: REST, } NBD , B, 0 , 0 , { ;`.

Used in blocks: [225](#block-225), [226](#block-226).

**`RESX,`** — Clear a bit in indexed memory.

Used in blocks: [117](#block-117), [120](#block-120), [173](#block-173), [190](#block-190), [197](#block-197), [198](#block-198), [199](#block-199), [230](#block-230), [238](#block-238).

**`RET,`** — Emit native RET.

Used in blocks: [114](#block-114), [115](#block-115), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [123](#block-123), [124](#block-124), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [163](#block-163), [164](#block-164), [165](#block-165), [166](#block-166), [173](#block-173), [174](#block-174), [176](#block-176), [177](#block-177), [190](#block-190), [191](#block-191), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [207](#block-207), [230](#block-230), [231](#block-231), [232](#block-232), [233](#block-233), [234](#block-234), [235](#block-235), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [251](#block-251), [252](#block-252), [253](#block-253), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [263](#block-263), [269](#block-269), [279](#block-279), [282](#block-282), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288), [291](#block-291).

**`RETPA`** — Definition. RETPA gives eight fielders TFPA, activates them and clears VGO.

Declared: [213:3](#block-213) (definition).

Definition tokens: `: RETPA ( VMAGIC PT 8 0 DO DUP DUP VPLAYACTPC + TFPA S! VSTATUS + DUP B@ 80 OR F7 AND SB! VLENGTH + LOOP DROP ;`.

Used in blocks: [213](#block-213), [214](#block-214).

**`RF`** — VLENGTH-byte vector record for the right fielder. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:2](#block-216) (byte array).

Used in blocks: [124](#block-124), [173](#block-173), [211](#block-211), [212](#block-212), [216](#block-216), [264](#block-264).

**`RFDST`** — Native branch/loop label. Index BSRTBL for the selected base, obtain its coordinates and speed 4, and continue to the movement calculation.

Declared: [196:2](#block-196) (forward declaration), [197:12](#block-197) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`RFLD`** — Constant RFLD, assigned source expression/value `128` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:7](#block-113) (constant).

Used in blocks: [113](#block-113), [227](#block-227), [228](#block-228).

**`RLC,`** — Rotate the accumulator left circularly in this dialect.

Used in blocks: [241](#block-241).

**`RLCR,`** — Rotate a register left circularly.

Used in blocks: [281](#block-281).

**`RNC,`** — Return if carry is clear.

Used in blocks: [126](#block-126), [258](#block-258), [262](#block-262).

**`RND`** — Native random-range helper at $0275.

Declared: [295:2](#block-295) (native word / kernel binding).

Used in blocks: [132](#block-132), [143](#block-143), [158](#block-158), [161](#block-161), [162](#block-162), [169](#block-169), [295](#block-295).

**`RND#`** — Two-cell random-generator state array explicitly placed at $7C06.

Declared: [295:1](#block-295) (cell array).

Used in blocks: [133](#block-133), [295](#block-295).

**`RNDNTE`** — Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

Declared: [141:13](#block-141) (definition).

Definition tokens: `: RNDNTE } 0 B, B, 0 B, FF B, { ;`.

Used in blocks: [141](#block-141).

**`RNZ,`** — Return if the zero flag is clear.

Used in blocks: [116](#block-116), [119](#block-119), [122](#block-122), [126](#block-126), [175](#block-175), [258](#block-258), [262](#block-262), [263](#block-263), [287](#block-287), [288](#block-288).

**`RO1`** — Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

Declared: [165:4](#block-165) (native subroutine).

Used in blocks: [165](#block-165), [166](#block-166).

**`RO12`** — Native subroutine. RO12 activates both forced runners, selecting a double-play or ordinary target; continue.

Declared: [165:10](#block-165) (native subroutine).

Used in blocks: [165](#block-165), [166](#block-166).

**`RO123`** — Native subroutine. RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

Declared: [166:4](#block-166) (native subroutine).

Used in blocks: [166](#block-166).

**`RO13`** — Native subroutine. RO13 handles first-and-third occupancy and may branch through SETDBLPLAY.

Declared: [166:7](#block-166) (native subroutine).

Used in blocks: [166](#block-166).

**`RO2`** — Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

Declared: [165:6](#block-165) (native subroutine).

Used in blocks: [165](#block-165), [166](#block-166).

**`RO23`** — Native subroutine. RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

Declared: [166:1](#block-166) (native subroutine).

Used in blocks: [166](#block-166).

**`RO3`** — Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

Declared: [165:8](#block-165) (native subroutine).

Used in blocks: [165](#block-165), [166](#block-166).

**`ROFW`** — Native branch/loop label. Read runner control/forward state, honor HOMERUN automatic advancement and choose forward, retreat or at-base paths; continue.

Declared: [196:1](#block-196) (forward declaration), [196:14](#block-196) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`ROMHERE`** — Cross-compiler target/object allocation pointer.

Used in blocks: [87](#block-87), [88](#block-88), [89](#block-89), [276](#block-276), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304).

**`ROMSTART`** — Cross-compiler target ROM origin setting.

Used in blocks: [33](#block-33), [89](#block-89), [94](#block-94).

**`RONBS`** — Constant RONBS, assigned source expression/value `0A28` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:13](#block-113) (constant).

Used in blocks: [113](#block-113), [198](#block-198).

**`ROT`** — Rotate the top three stack cells.

Declared: [89:7](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89), [129](#block-129), [130](#block-130), [178](#block-178), [272](#block-272).

**`RRC,`** — Rotate the accumulator right circularly in this dialect.

Used in blocks: [207](#block-207).

**`RRCR,`** — Rotate a register right circularly.

Used in blocks: [279](#block-279), [281](#block-281).

**`RRRNDNTE`** — Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

Declared: [141:12](#block-141) (definition).

Definition tokens: `: RRRNDNTE } 0 B, B, 0 B, B, { ;`.

Used in blocks: [141](#block-141).

**`RRUN`** — Constant RRUN, assigned source expression/value `28` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:6](#block-113) (constant).

Used in blocks: [113](#block-113), [176](#block-176), [226](#block-226), [227](#block-227), [228](#block-228), [231](#block-231).

**`RSR2WB`** — Native branch/loop label. Copy later runner records into earlier slots with LDIR, entering at the selected label; then clear R4's base byte.

Declared: [115:1](#block-115) (forward declaration), [115:7](#block-115) (assembler label).

Used in blocks: [115](#block-115).

**`RSR3WB`** — Native branch/loop label. Copy later runner records into earlier slots with LDIR, entering at the selected label; then clear R4's base byte.

Declared: [115:1](#block-115) (forward declaration), [115:8](#block-115) (assembler label).

Used in blocks: [115](#block-115).

**`RSR4WB`** — Native branch/loop label. Copy later runner records into earlier slots with LDIR, entering at the selected label; then clear R4's base byte.

Declared: [115:1](#block-115) (forward declaration), [115:9](#block-115) (assembler label).

Used in blocks: [115](#block-115).

**`RSRDST`** — Native branch/loop label. If VGO already indicates an established long move, return the LDFLAG/SAMEDLT indication to preserve existing deltas.

Declared: [230:2](#block-230) (forward declaration), [231:1](#block-231) (assembler label).

Used in blocks: [230](#block-230), [231](#block-231).

**`RSTACK`** — Cross-compiler return-stack location setting.

Used in blocks: [33](#block-33), [94](#block-94).

**`RTHWPA`** — Named data address. Emit PITCHPA and right/left throw animations.

Declared: [227:3](#block-227) (data label).

Used in blocks: [120](#block-120), [227](#block-227).

**`RTRW`** — Constant RTRW, assigned source expression/value `228` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:8](#block-113) (constant).

Used in blocks: [113](#block-113), [227](#block-227).

**`RUN1CHK1ST`** — Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue.

Declared: [168:11](#block-168) (definition).

Definition tokens: `: RUN1CHK1ST VWBASE R1 B@ 1 = IF 1 VMAGIC R2 ELSE RUN1CHK2ND THEN ;`.

Used in blocks: [168](#block-168), [169](#block-169).

**`RUN1CHK2ND`** — Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue.

Declared: [168:9](#block-168) (definition).

Definition tokens: `: RUN1CHK2ND VWBASE R1 B@ 2 = IF RUN2CHK12ND ELSE RUN2CHK THEN ;`.

Used in blocks: [168](#block-168).

**`RUN2CHK`** — Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

Declared: [168:5](#block-168) (definition).

Definition tokens: `: RUN2CHK VWBASE R2 B@ 0 = IF 3 VMAGIC R2 ELSE RUN2CHK1ST THEN ;`.

Used in blocks: [168](#block-168).

**`RUN2CHK12ND`** — Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue.

Declared: [168:7](#block-168) (definition).

Definition tokens: `: RUN2CHK12ND VWBASE R2 B@ 0 = IF 2 VMAGIC R2 ELSE 4 VMAGIC R3 THEN ;`.

Used in blocks: [168](#block-168).

**`RUN2CHK1ST`** — Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

Declared: [168:3](#block-168) (definition).

Definition tokens: `: RUN2CHK1ST VWBASE R2 B@ 1 = IF 6 VMAGIC R3 ELSE RUN3CHK THEN ;`.

Used in blocks: [168](#block-168).

**`RUN3CHK`** — Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

Declared: [168:1](#block-168) (definition).

Definition tokens: `: RUN3CHK VWBASE R3 B@ 0 = IF 7 VMAGIC R3 ELSE 5 VMAGIC R4 THEN ;`.

Used in blocks: [168](#block-168).

**`RUNBPA`** — Named data address. Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

Declared: [226:1](#block-226) (data label).

Used in blocks: [115](#block-115), [213](#block-213), [226](#block-226).

**`RUNDST`** — Native word / kernel binding. Declare its cross-screen branch labels and enter RUNDST assembly.

Declared: [196:3](#block-196) (native word / kernel binding).

Used in blocks: [196](#block-196), [199](#block-199).

**`RUNDST,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:8](#block-225) (definition).

Definition tokens: `: RUNDST, } 8 B, { ;`.

Used in blocks: [225](#block-225), [226](#block-226).

**`RUNDX`** — Cell variable. Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

Declared: [150:5](#block-150) (cell variable).

Used in blocks: [150](#block-150), [198](#block-198).

**`RUNDY`** — Cell variable. Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

Declared: [150:5](#block-150) (cell variable).

Used in blocks: [150](#block-150), [198](#block-198).

**`RUNOPCODE`** — Byte variable. Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

Declared: [150:5](#block-150) (byte variable).

Used in blocks: [150](#block-150), [213](#block-213).

**`RUNPA`** — Cell variable. Allocate runner and take-field motion fields, each with opcode, X/Y deltas, update count and pattern selector.

Declared: [150:6](#block-150) (cell variable).

Used in blocks: [150](#block-150), [198](#block-198), [213](#block-213).

**`RUNUP`** — Named data address. Emit perspective lists for cover, throw, invisible, run, field and standing animations, using repeated entries where fewer unique sizes exist.

Declared: [189:6](#block-189) (data label).

Used in blocks: [189](#block-189).

**`RUNUP0`** — Named data address. For each running/fielding perspective level, pair its B and M sprite addresses under RUNUPn or FLDUPn.

Declared: [186:1](#block-186) (data label).

Used in blocks: [186](#block-186), [189](#block-189).

**`RUNUP1`** — Named data address. For each running/fielding perspective level, pair its B and M sprite addresses under RUNUPn or FLDUPn.

Declared: [186:2](#block-186) (data label).

Used in blocks: [186](#block-186), [189](#block-189).

**`RUNUP2`** — Named data address. For each running/fielding perspective level, pair its B and M sprite addresses under RUNUPn or FLDUPn.

Declared: [186:3](#block-186) (data label).

Used in blocks: [186](#block-186), [189](#block-189).

**`RUNUP3`** — Named data address. For each running/fielding perspective level, pair its B and M sprite addresses under RUNUPn or FLDUPn.

Declared: [186:4](#block-186) (data label).

Used in blocks: [186](#block-186), [189](#block-189).

**`RUNUP4`** — Named data address. For each running/fielding perspective level, pair its B and M sprite addresses under RUNUPn or FLDUPn.

Declared: [186:5](#block-186) (data label).

Used in blocks: [186](#block-186), [189](#block-189).

**`RUNUPDATE#`** — Byte variable; allocated at the declaration location. 

Declared: [150:6](#block-150) (byte variable).

Used in blocks: [150](#block-150).

**`RUP0B`** — Named data address. Emit RUP0B and ONBASE2, then continue with the pattern chain.

Declared: [109:11](#block-109) (data label).

Used in blocks: [109](#block-109), [186](#block-186).

**`RUP0M`** — Named data address. Emit RUP3M/RUP4M and RUP0M–RUP2M perspective records.

Declared: [109:5](#block-109) (data label).

Used in blocks: [109](#block-109), [186](#block-186).

**`RUP1B`** — Named data address. Emit RUP1B–RUP4B, the second set of running records.

Declared: [110:1](#block-110) (data label).

Used in blocks: [110](#block-110), [186](#block-186).

**`RUP1M`** — Named data address. Emit RUP3M/RUP4M and RUP0M–RUP2M perspective records.

Declared: [109:7](#block-109) (data label).

Used in blocks: [109](#block-109), [186](#block-186).

**`RUP2B`** — Named data address. Emit RUP1B–RUP4B, the second set of running records.

Declared: [110:3](#block-110) (data label).

Used in blocks: [110](#block-110), [186](#block-186).

**`RUP2M`** — Named data address. Emit RUP3M/RUP4M and RUP0M–RUP2M perspective records.

Declared: [109:9](#block-109) (data label).

Used in blocks: [109](#block-109), [186](#block-186).

**`RUP3B`** — Named data address. Emit RUP1B–RUP4B, the second set of running records.

Declared: [110:5](#block-110) (data label).

Used in blocks: [110](#block-110), [186](#block-186).

**`RUP3M`** — Named data address. Emit RUP3M/RUP4M and RUP0M–RUP2M perspective records.

Declared: [109:2](#block-109) (data label).

Used in blocks: [109](#block-109), [186](#block-186).

**`RUP4B`** — Named data address. Emit RUP1B–RUP4B, the second set of running records.

Declared: [110:7](#block-110) (data label).

Used in blocks: [110](#block-110), [186](#block-186).

**`RUP4M`** — Named data address. Emit RUP3M/RUP4M and RUP0M–RUP2M perspective records.

Declared: [109:4](#block-109) (data label).

Used in blocks: [109](#block-109), [186](#block-186).

**`RVACT`** — Native branch/loop label. Keep the runner active when play permits; otherwise choose its left/right on-base image by X and zero movement.

Declared: [196:2](#block-196) (forward declaration), [198:10](#block-198) (assembler label).

Used in blocks: [196](#block-196), [198](#block-198).

**`RVGO`** — Native branch/loop label. Handle player FORW input, halfway commitment and the automatic-forward state, updating VOFW/VRSTAT and clearing VGO when a destination changes.

Declared: [196:1](#block-196) (forward declaration), [197:7](#block-197) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`RZ,`** — Return if the zero flag is set.

Used in blocks: [119](#block-119), [126](#block-126), [173](#block-173), [174](#block-174), [175](#block-175), [199](#block-199), [233](#block-233), [253](#block-253), [263](#block-263), [283](#block-283), [287](#block-287), [288](#block-288).

### Dictionary: S

**`S!`** — Definition. S! swaps the value/address before cell store; SB! does the same for byte store.

Declared: [304:2](#block-304) (definition).

Definition tokens: `: S! SWAP ! ;`.

Used in blocks: [181](#block-181), [212](#block-212), [213](#block-213), [304](#block-304).

**`S10`** — Definition. S10 starts INTERRUPTS0 through ISTART; S11 starts INTERRUPTS1. Restore the radix saved by the surrounding interrupt chain and stop.

Declared: [289:1](#block-289) (definition).

Definition tokens: `: S10 INTERRUPTS0 ISTART ;`.

Used in blocks: [124](#block-124), [130](#block-130), [133](#block-133), [289](#block-289).

**`S11`** — Definition. S10 starts INTERRUPTS0 through ISTART; S11 starts INTERRUPTS1. Restore the radix saved by the surrounding interrupt chain and stop.

Declared: [289:1](#block-289) (definition).

Definition tokens: `: S11 INTERRUPTS1 ISTART ;`.

Used in blocks: [124](#block-124), [289](#block-289).

**`SADR`** — Current framebuffer address used by the line generator.

Declared: [280:3](#block-280) (cell variable).

Used in blocks: [271](#block-271), [280](#block-280), [281](#block-281), [282](#block-282), [285](#block-285).

**`SAFESCORE`** — Byte table. SAFESCORE sets volumes and plays timed chords, then transfers into the crowd cheer.

Declared: [140:1](#block-140) (byte table).

Used in blocks: [140](#block-140), [146](#block-146).

**`SAMEDLT`** — Marker allowing the next playaction load to retain its existing movement deltas.

Declared: [151:7](#block-151) (byte variable).

Used in blocks: [151](#block-151), [190](#block-190), [201](#block-201), [231](#block-231).

**`SB!`** — Definition. S! swaps the value/address before cell store; SB! does the same for byte store.

Declared: [304:2](#block-304) (definition).

Definition tokens: `: SB! SWAP B! ;`.

Used in blocks: [130](#block-130), [181](#block-181), [212](#block-212), [213](#block-213), [233](#block-233), [304](#block-304).

**`SBALL1`** — Definition. Define BALL 1/2/3, HOMER and WALK string words.

Declared: [179:1](#block-179) (definition).

Definition tokens: `: SBALL1 2200 2ROT A" SPOST ;`.

Used in blocks: [179](#block-179).

**`SBALL2`** — Definition. Define BALL 1/2/3, HOMER and WALK string words.

Declared: [179:2](#block-179) (definition).

Definition tokens: `: SBALL2 2200 2ROT A" SPOST ;`.

Used in blocks: [179](#block-179).

**`SBALL3`** — Definition. Define BALL 1/2/3, HOMER and WALK string words.

Declared: [179:3](#block-179) (definition).

Definition tokens: `: SBALL3 2200 2ROT A" SPOST ;`.

Used in blocks: [179](#block-179).

**`SBCD,`** — Store BC in a direct memory cell.

Used in blocks: [167](#block-167), [173](#block-173), [194](#block-194), [195](#block-195), [198](#block-198).

**`SBI,`** — Definition. Define object emitters for immediate IN and subtract-with-borrow instructions.

Declared: [98:11](#block-98) (definition).

Definition tokens: `: SBI, 0DE OB, OB, ;`.

Used in blocks: [98](#block-98), [126](#block-126), [262](#block-262).

**`SBO`** — Definition. SBO posts the three $30-based count characters at their fixed positions. Select decimal and load the infield data chain at 278.

Declared: [272:11](#block-272) (definition).

Definition tokens: `: SBO 3700 B000 308 BALLS B@ CPOST 3F00 B000 308 STRIKES B@ CPOST 4700 B000 308 OUTS B@ CPOST ;`.

Used in blocks: [130](#block-130), [178](#block-178), [180](#block-180), [181](#block-181), [182](#block-182), [272](#block-272), [275](#block-275).

**`SCORE1`** — Team/player 1 packed-BCD score byte; SCORE1 ZERO clears the adjacent score pair.

Declared: [149:2](#block-149) (byte variable).

Used in blocks: [114](#block-114), [128](#block-128), [129](#block-129), [131](#block-131), [149](#block-149), [169](#block-169), [183](#block-183).

**`SCORE2`** — Team/player 2 packed-BCD score byte.

Declared: [149:2](#block-149) (byte variable).

Used in blocks: [114](#block-114), [129](#block-129), [149](#block-149), [169](#block-169), [183](#block-183).

**`SCOREME`** — Definition. SCOREME selects SCORE1/SCORE2 and coordinates from SCORESHOW, posts one BCD byte, clears the display request and selects cannon or cheer music; continue.

Declared: [183:8](#block-183) (definition).

Definition tokens: `: SCOREME ( SCORESHOW DUP B@ 2 = IF 900 8C00 4308 SCORE2 ELSE 4300 8C00 4308 SCORE1 THEN 1 NPOST BZERO HOMERUN B@ IF MCANNON ELSE MYAH THEN ;`.

Used in blocks: [183](#block-183), [268](#block-268).

**`SCORESHOW`** — Pending team score-display request: one selects SCORE1, two selects SCORE2.

Declared: [151:4](#block-151) (byte variable).

Used in blocks: [114](#block-114), [151](#block-151), [183](#block-183), [268](#block-268).

**`SCR`** — Constant SCR, assigned source expression/value `728` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:11](#block-113) (constant).

Used in blocks: [10](#block-10), [113](#block-113).

**`SCRERASE`** — Definition. SCRERASE fills $3F00 bytes starting at $4000 with zero; continue.

Declared: [293:8](#block-293) (definition).

Definition tokens: `: SCRERASE ( 0 4000 3F00 FILL ;`.

Used in blocks: [133](#block-133), [293](#block-293).

**`SCRS`** — Definition. SUP posts UP. SCRS clears two score rectangles and draws zero score characters.

Declared: [273:11](#block-273) (definition).

Definition tokens: `: SCRS 1F 8A 18 0E RECTAN 107 8A 18 0E RECTAN B00 8C00 308 30 CPOST 4500 8C00 308 30 CPOST ;`.

Used in blocks: [128](#block-128), [273](#block-273), [275](#block-275).

**`SCRTIME`** — Foreground request to process a runner reaching home.

Declared: [152:7](#block-152) (byte variable).

Used in blocks: [114](#block-114), [132](#block-132), [152](#block-152), [198](#block-198).

**`SDED,`** — Store DE in a direct memory cell.

Used in blocks: [120](#block-120), [143](#block-143), [160](#block-160), [173](#block-173), [177](#block-177), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198).

**`SECTNM`** — Chosen ground-hit sector index.

Declared: [149:8](#block-149) (byte variable).

Used in blocks: [149](#block-149), [158](#block-158), [167](#block-167).

**`SELECT`** — Foreground request to show the player-selection screen.

Declared: [152:1](#block-152) (byte variable).

Used in blocks: [121](#block-121), [131](#block-131), [132](#block-132), [152](#block-152).

**`SENTRY`** — Native word / kernel binding. SENTRY preserves BC, polls the request flags and conditionally calls button, pitch, outfield, throw, hit, catch, scoring and music routines.

Declared: [132:4](#block-132) (native word / kernel binding).

Used in blocks: [132](#block-132), [133](#block-133).

**`SET,`** — Set a register bit.

Used in blocks: [123](#block-123), [126](#block-126), [237](#block-237).

**`SETACT`** — Native word / kernel binding. SETACT takes the first status address in HL and count in A, setting VACT at VLENGTH-byte strides.

Declared: [237:1](#block-237) (native word / kernel binding).

Used in blocks: [237](#block-237).

**`SETDBLPLAY`** — Native subroutine. SETDBLPLAY raises its flag; NBB is the empty-bases no-op.

Declared: [165:1](#block-165) (native subroutine).

Used in blocks: [165](#block-165), [166](#block-166).

**`SETFDST`** — Definition. Save radix, select hex and write shortstop, first-base, third-base and second-base X/Y destination cells.

Declared: [211:2](#block-211) (definition).

Definition tokens: `: SETFDST ( 1E00 VDSTX SS ! 4800 VDSTY SS ! 3000 VDSTX 1ST ! 5800 VDSTY 1ST ! 1400 VDSTX 3RD ! 5B00 VDSTY 3RD ! 3200 VDSTX 2ND ! 4800 VDSTY 2ND ! 2800 VDSTX PT ! 6100 VDSTY PT ! 1400 VDSTX LF ! 2A00 VDSTY LF ! 3C00 VDSTX RF ! 2A00 VDSTY RF ! 2800 VDSTX CF ! 1600 VDSTY CF …`.

Used in blocks: [130](#block-130), [211](#block-211).

**`SETTF`** — Definition. STFLD installs RETPA and TAKEFIELD. SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

Declared: [214:3](#block-214) (definition).

Definition tokens: `: SETTF DI LSETTFCOOR STFLD SETTFPA EI ;`.

Used in blocks: [130](#block-130), [214](#block-214).

**`SETTFPA`** — Definition. SETTFPA assigns delayed take-field sequences to pitcher/infielders, RUNBPA to all runners and TBLPA to BL; continue.

Declared: [213:6](#block-213) (definition).

Definition tokens: `: SETTFPA ( TFPA2 VPLAYACTPC PT ! TFPA1 VPLAYACTPC 1ST ! TFPA1 VPLAYACTPC 2ND ! TFPA1 VPLAYACTPC 3RD ! TFPA1 VPLAYACTPC SS ! RUNBPA VPLAYACTPC R1 ! RUNBPA VPLAYACTPC R2 ! RUNBPA VPLAYACTPC R3 ! RUNBPA VPLAYACTPC R4 ! TBLPA VPLAYACTPC BL ! ;`.

Used in blocks: [213](#block-213), [214](#block-214).

**`SETX,`** — Set a bit in indexed memory.

Used in blocks: [120](#block-120), [193](#block-193), [198](#block-198), [231](#block-231), [255](#block-255).

**`SFOUL`** — Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

Declared: [178:4](#block-178) (definition).

Definition tokens: `: SFOUL 2400 2ROT A" SPOST ;`.

Used in blocks: [178](#block-178), [182](#block-182), [183](#block-183).

**`SGO`** — Definition. Define GAME OVER text. OUTTIME increments OUTS; reaching $33 enters the third-out path and requests cheer music.

Declared: [181:1](#block-181) (definition).

Definition tokens: `: SGO 2000 2D00 828 A" SPOST ;`.

Used in blocks: [127](#block-127), [128](#block-128), [129](#block-129), [133](#block-133), [181](#block-181).

**`SHILL`** — Attract/demo-mode flag.

Declared: [149:4](#block-149) (byte variable).

Used in blocks: [128](#block-128), [129](#block-129), [131](#block-131), [133](#block-133), [149](#block-149).

**`SHLD,`** — Store HL in a direct memory cell.

Used in blocks: [114](#block-114), [115](#block-115), [117](#block-117), [118](#block-118), [119](#block-119), [122](#block-122), [123](#block-123), [124](#block-124), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [159](#block-159), [160](#block-160), [173](#block-173), [175](#block-175), [176](#block-176), [177](#block-177), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [200](#block-200), [236](#block-236), [238](#block-238), [262](#block-262), [263](#block-263), [269](#block-269), [271](#block-271), [281](#block-281), [282](#block-282), [291](#block-291), [292](#block-292).

**`SHOMER`** — Definition. Define BALL 1/2/3, HOMER and WALK string words.

Declared: [179:4](#block-179) (definition).

Definition tokens: `: SHOMER 2300 2ROT A" SPOST ;`.

Used in blocks: [179](#block-179), [180](#block-180).

**`SINCR`** — Native branch/loop label. Shift the combined and component magnitudes until a carry normalizes their scale, then continue at SINCR in 284.

Declared: [283:15](#block-283) (assembler label), [281:3](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [283](#block-283).

**`SIRENSCORE`** — Byte table. SIRENSCORE uses randomized-note commands, a declining master setting and a counted LDPCC jump back to its beginning.

Declared: [138:1](#block-138) (byte table).

Used in blocks: [138](#block-138).

**`SIXD,`** — Store IX in a direct memory cell.

Used in blocks: [173](#block-173), [266](#block-266), [267](#block-267).

**`SLAR,`** — Shift a register left arithmetically/logically (SLA).

Used in blocks: [120](#block-120), [197](#block-197), [230](#block-230), [234](#block-234), [236](#block-236), [247](#block-247), [258](#block-258), [271](#block-271).

**`smallfont`** — Byte table. Label smallfont and emit space. FONTUNPACK later turns each two-byte record into five display rows.

Declared: [299:1](#block-299) (byte table).

Used in blocks: [247](#block-247), [299](#block-299).

**`SMFONT`** — Constant SMFONT, assigned source expression/value `7` (use the defining screen’s radix). Define SMFONT and ZEROSP option-bit positions and document cpost's retained X/Y/options return values.

Declared: [246:2](#block-246) (constant).

Used in blocks: [246](#block-246), [247](#block-247).

**`SNDX`** — Constant SNDX, assigned source expression/value `18` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:4](#block-290) (constant).

Used in blocks: [290](#block-290).

**`SOFW`** — Native branch/loop label. Handle player FORW input, halfway commitment and the automatic-forward state, updating VOFW/VRSTAT and clearing VGO when a destination changes.

Declared: [196:1](#block-196) (forward declaration), [197:6](#block-197) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`SORRY`** — Definition. Define congratulatory, loss and one-coin prompts and continue loading.

Declared: [127:12](#block-127) (definition).

Definition tokens: `: SORRY 1B00 1000 828 A" SPOST DP1CN ;`.

Used in blocks: [127](#block-127), [129](#block-129).

**`SOUT1`** — Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

Declared: [178:5](#block-178) (definition).

Definition tokens: `: SOUT1 2300 2ROT A" SPOST ;`.

Used in blocks: [178](#block-178), [179](#block-179).

**`SOUT2`** — Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

Declared: [178:6](#block-178) (definition).

Definition tokens: `: SOUT2 2200 2ROT A" SPOST ;`.

Used in blocks: [178](#block-178), [179](#block-179).

**`SOUT3`** — Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

Declared: [178:7](#block-178) (definition).

Definition tokens: `: SOUT3 2200 2ROT A" SPOST ;`.

Used in blocks: [178](#block-178), [179](#block-179).

**`SPBON`** — Special bonus-inning flag.

Declared: [151:6](#block-151) (byte variable).

Used in blocks: [123](#block-123), [129](#block-129), [151](#block-151), [287](#block-287), [288](#block-288).

**`SPLR`** — Definition. SPLR12/SPLR display available player choices; when one more credit is needed for two players, set STRT1.

Declared: [128:5](#block-128) (definition).

Definition tokens: `: SPLR CNSW1 B@ IF CREDITS B@ 1 <> IF SPLR12 ELSE 0E00 2000 828 A" SPOST 0F00 3000 828 A" SPOST STRT1 BONE THEN ELSE SPLR12 THEN ;`.

Used in blocks: [128](#block-128), [131](#block-131).

**`SPLR12`** — Definition. SPLR12/SPLR display available player choices; when one more credit is needed for two players, set STRT1.

Declared: [128:4](#block-128) (definition).

Definition tokens: `: SPLR12 1400 2000 828 A" SPOST ;`.

Used in blocks: [128](#block-128).

**`SPOST`** — Definition. SPOST calls PPOST then drops the three retained drawing arguments.

Declared: [249:1](#block-249) (definition).

Definition tokens: `: SPOST ( ( ( ( PPOST 3DROP ;`.

Used in blocks: [127](#block-127), [128](#block-128), [131](#block-131), [178](#block-178), [179](#block-179), [181](#block-181), [237](#block-237), [238](#block-238), [249](#block-249), [273](#block-273), [274](#block-274), [275](#block-275), [305](#block-305), [306](#block-306).

**`SRAR,`** — Shift a register right retaining its sign (SRA).

Used in blocks: [242](#block-242).

**`SRLR,`** — Shift a register right with zero fill (SRL).

Used in blocks: [207](#block-207), [231](#block-231), [234](#block-234), [279](#block-279).

**`SS`** — VLENGTH-byte vector record for the shortstop. Record layout is defined in 148; allocation order is defined in 216.

Declared: [216:6](#block-216) (byte array).

Used in blocks: [153](#block-153), [157](#block-157), [211](#block-211), [213](#block-213), [216](#block-216).

**`SSAFE`** — Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

Declared: [178:3](#block-178) (definition).

Definition tokens: `: SSAFE 2400 2ROT A" SPOST SBO ;`.

Used in blocks: [178](#block-178), [183](#block-183).

**`SSTRIKE1`** — Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

Declared: [178:8](#block-178) (definition).

Definition tokens: `: SSTRIKE1 2000 2ROT A" SPOST ;`.

Used in blocks: [178](#block-178), [179](#block-179).

**`SSTRIKE2`** — Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

Declared: [178:9](#block-178) (definition).

Definition tokens: `: SSTRIKE2 2100 2ROT A" SPOST ;`.

Used in blocks: [178](#block-178), [179](#block-179).

**`STA,`** — Store A at a direct memory address.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [124](#block-124), [125](#block-125), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [159](#block-159), [160](#block-160), [163](#block-163), [165](#block-165), [167](#block-167), [173](#block-173), [179](#block-179), [190](#block-190), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [201](#block-201), [230](#block-230), [231](#block-231), [235](#block-235), [236](#block-236), [239](#block-239), [253](#block-253), [254](#block-254), [258](#block-258), [259](#block-259), [260](#block-260), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [269](#block-269), [271](#block-271), [285](#block-285), [287](#block-287), [288](#block-288).

**`STAI,`** — Load the Z80 I register from A.

Used in blocks: [292](#block-292).

**`STARTMUSIC`** — Native word / kernel binding. STARTMUSIC clears its request. CHEERME selects crowd cheer and normal palette setup; otherwise choose fence or homer cannon music, with the homer palette schedule when needed.

Declared: [124:6](#block-124) (native word / kernel binding).

Used in blocks: [124](#block-124), [132](#block-132).

**`STARTPC`** — Restart address for repeated music streams.

Declared: [143:1](#block-143) (cell variable).

Used in blocks: [143](#block-143), [144](#block-144), [145](#block-145).

**`STC,`** — Set the carry flag.

Used in blocks: [231](#block-231).

**`STCB`** — Named data address. Emit perspective lists for ball, covering, standing pitcher, pitcher throwing and on-base animation; continue.

Declared: [188:10](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`STCB1`** — Named data address. Provide pitcher-throw and repeated-image covering pairs; continue.

Declared: [187:6](#block-187) (data label).

Used in blocks: [187](#block-187), [188](#block-188).

**`STCB2`** — Named data address. Provide pitcher-throw and repeated-image covering pairs; continue.

Declared: [187:7](#block-187) (data label).

Used in blocks: [187](#block-187), [188](#block-188).

**`STETBL`** — Cell table. DOSAFE combines music/text. STETBL holds redraw addresses for erasing old XOR text, including the repeated SAFE entry and WALK.

Declared: [183:2](#block-183) (cell table).

Used in blocks: [183](#block-183), [184](#block-184).

**`STFLD`** — Definition. STFLD installs RETPA and TAKEFIELD. SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

Declared: [214:2](#block-214) (definition).

Definition tokens: `: STFLD RETPA TAKEFIELD BONE ;`.

Used in blocks: [118](#block-118), [214](#block-214).

**`STMUSIC`** — Foreground request to choose/start event music.

Declared: [151:12](#block-151) (byte variable).

Used in blocks: [124](#block-124), [132](#block-132), [151](#block-151), [193](#block-193), [195](#block-195).

**`STN1`** — Named data address. Emit STN1/STN2 standing images and continue.

Declared: [112:11](#block-112) (data label).

Used in blocks: [112](#block-112), [188](#block-188).

**`STN2`** — Named data address. Emit STN1/STN2 standing images and continue.

Declared: [112:13](#block-112) (data label).

Used in blocks: [112](#block-112), [188](#block-188).

**`STN3`** — Named data address. Emit STN3, STN4 and the standing pitcher STNPT.

Declared: [113:1](#block-113) (data label).

Used in blocks: [113](#block-113), [188](#block-188).

**`STN4`** — Named data address. Emit STN3, STN4 and the standing pitcher STNPT.

Declared: [113:3](#block-113) (data label).

Used in blocks: [113](#block-113), [188](#block-188).

**`STND`** — Constant STND, assigned source expression/value `428` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:10](#block-113) (constant).

Used in blocks: [113](#block-113), [176](#block-176), [194](#block-194), [198](#block-198), [213](#block-213), [225](#block-225), [230](#block-230), [236](#block-236).

**`STND1`** — Named data address. Create standing, pitcher-standing and covering two-frame pairs.

Declared: [188:1](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`STND2`** — Named data address. Create standing, pitcher-standing and covering two-frame pairs.

Declared: [188:2](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`STND3`** — Named data address. Create standing, pitcher-standing and covering two-frame pairs.

Declared: [188:3](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`STND4`** — Named data address. Create standing, pitcher-standing and covering two-frame pairs.

Declared: [188:4](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`STNDPT`** — Named data address. Emit perspective lists for ball, covering, standing pitcher, pitcher throwing and on-base animation; continue.

Declared: [188:11](#block-188) (data label).

Used in blocks: [188](#block-188), [189](#block-189).

**`STNDS`** — Named data address. Emit perspective lists for cover, throw, invisible, run, field and standing animations, using repeated entries where fewer unique sizes exist.

Declared: [189:9](#block-189) (data label).

Used in blocks: [189](#block-189).

**`STNPT`** — Named data address. Emit STN3, STN4 and the standing pitcher STNPT.

Declared: [113:4](#block-113) (data label).

Used in blocks: [113](#block-113), [188](#block-188).

**`STP,`** — Definition. Define standing and right/left cover-base action macros that end by deactivating; continue.

Declared: [225:11](#block-225) (definition).

Definition tokens: `: STP, } 0 0 0 STND ACT, DEACT, { ;`.

Used in blocks: [225](#block-225), [227](#block-227), [228](#block-228).

**`STPT`** — Constant STPT, assigned source expression/value `828` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

Declared: [113:12](#block-113) (constant).

Used in blocks: [113](#block-113), [194](#block-194), [226](#block-226), [227](#block-227).

**`STPT1`** — Named data address. Create standing, pitcher-standing and covering two-frame pairs.

Declared: [188:5](#block-188) (data label).

Used in blocks: [188](#block-188).

**`STRIKE`** — Pitch strike-zone/attempt classification flag.

Declared: [151:6](#block-151) (byte variable).

Used in blocks: [126](#block-126), [151](#block-151), [259](#block-259), [262](#block-262).

**`STRIKES`** — Strike count stored as an ASCII-style $30-based byte.

Declared: [151:3](#block-151) (byte variable).

Used in blocks: [116](#block-116), [129](#block-129), [151](#block-151), [179](#block-179), [181](#block-181), [182](#block-182), [272](#block-272), [275](#block-275).

**`STRIKESCORE`** — Byte table. Save the radix, select hex and emit STRIKESCORE: master/voice volumes, vibrato and timed B/C voice tones ending in QUIET.

Declared: [134:1](#block-134) (byte table).

Used in blocks: [134](#block-134), [146](#block-146).

**`STRIKETIME`** — Definition. STRIKETIME increments STRIKES. At $33 call OUTTIME and retain the OUT event code; otherwise play/post the new strike count.

Declared: [182:1](#block-182) (definition).

Definition tokens: `: STRIKETIME ( STRIKES DUP 1+B! B@ 33 = IF OUTTIME COUT OLDSTRING B! ELSE MSTRIKE DOSSTRIKE THEN SBO ;`.

Used in blocks: [182](#block-182), [183](#block-183).

**`STRING`** — Pending event-message index consumed by STRINGPRC.

Declared: [151:5](#block-151) (byte variable).

Used in blocks: [116](#block-116), [117](#block-117), [151](#block-151), [158](#block-158), [184](#block-184), [193](#block-193), [254](#block-254), [262](#block-262), [268](#block-268).

**`STRINGERASE`** — Request to erase the event text using its retained rendering routine.

Declared: [149:12](#block-149) (byte variable).

Used in blocks: [149](#block-149), [184](#block-184), [254](#block-254).

**`STRINGGO`** — Definition. STRINGGO sets the shared Y/options, chooses STETBL for erase or STTBL for an event and initializes its expiry timer, executes the selected word and drops retained drawing parameters.

Declared: [184:1](#block-184) (definition).

Definition tokens: `: STRINGGO ( 7A00 ( 828 ( 4 PICK 4 PICK IF STETBL ELSE STTBL 50 STRINGOFFTIMER B! THEN @ EX DROP DROP ;`.

Used in blocks: [184](#block-184).

**`STRINGOFFTIMER`** — Lifetime of the current event message before erase/redraw.

Declared: [151:5](#block-151) (byte variable).

Used in blocks: [151](#block-151), [180](#block-180), [184](#block-184), [195](#block-195), [254](#block-254).

**`STRINGPRC`** — Definition. STRINGPRC takes and clears STRING, erases an existing timed message when necessary, records OLDSTRING, draws/processes the new event and clears STRINGERASE.

Declared: [184:6](#block-184) (definition).

Definition tokens: `: STRINGPRC ( STRING B@ DUP STRING BZERO STRINGOFFTIMER B@ IF OLDSTRING B@ 1 STRINGGO OLDSTRING B! 0 ( STRINGGO ELSE OLDSTRING B! ( STRINGERASE B@ STRINGGO THEN STRINGERASE BZERO ;`.

Used in blocks: [184](#block-184), [268](#block-268).

**`STRT1`** — Restricted one-player start/credit-choice state.

Declared: [151:1](#block-151) (byte variable).

Used in blocks: [121](#block-121), [128](#block-128), [131](#block-131), [151](#block-151).

**`STRTBALL`** — Definition. STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music.

Declared: [131:4](#block-131) (definition).

Definition tokens: `: STRTBALL DI INSTRC FL F00 SUP 3F00 SUP PLYR1UP BONE SCORE1 ZERO INN# BZERO STRT1 BZERO GAMEOVER BZERO CNSW1 B@ IF CREDARROW ELSE MLINN DI THEN SHILL BZERO CMPLR B@ IF YOU1ST 50 DWAIT YOU1ST THEN 8C0 INNX ! 1STINN BONE TF 1STINN BZERO MOPENERS ;`.

Used in blocks: [131](#block-131).

**`strtline`** — Native word / kernel binding. strtline converts the X representation for relabs, derives BIT-POS and sets the actual framebuffer address SADR by adding $4000.

Declared: [271:1](#block-271) (native word / kernel binding).

Used in blocks: [271](#block-271).

**`STTBL`** — Cell table. STTBL holds event-processing addresses in STRING event order.

Declared: [183:5](#block-183) (cell table).

Used in blocks: [183](#block-183), [184](#block-184).

**`STX,`** — Store a register into IX/IY plus the displacement.

Used in blocks: [114](#block-114), [117](#block-117), [119](#block-119), [120](#block-120), [196](#block-196), [197](#block-197), [198](#block-198), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [251](#block-251), [255](#block-255), [257](#block-257), [276](#block-276).

**`SUB,`** — Subtract an operand from A.

Used in blocks: [177](#block-177), [258](#block-258), [261](#block-261), [279](#block-279), [283](#block-283).

**`SUBR`** — Declare a native subroutine intended for CALL,/RET, use.

Used in blocks: [119](#block-119), [143](#block-143), [145](#block-145), [163](#block-163), [164](#block-164), [165](#block-165), [166](#block-166), [173](#block-173), [174](#block-174), [207](#block-207), [233](#block-233), [235](#block-235), [238](#block-238), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [261](#block-261), [269](#block-269), [279](#block-279), [286](#block-286), [287](#block-287), [288](#block-288).

**`SUI,`** — Subtract an immediate byte from A.

Used in blocks: [246](#block-246).

**`SUP`** — Definition. SUP posts UP. SCRS clears two score rectangles and draws zero score characters.

Declared: [273:10](#block-273) (definition).

Definition tokens: `: SUP 8C00 8828 A" SPOST ;`.

Used in blocks: [130](#block-130), [131](#block-131), [273](#block-273), [275](#block-275).

**`SVAVF`** — Native branch/loop label. Handle player FORW input, halfway commitment and the automatic-forward state, updating VOFW/VRSTAT and clearing VGO when a destination changes.

Declared: [196:1](#block-196) (forward declaration), [197:4](#block-197) (assembler label).

Used in blocks: [196](#block-196), [197](#block-197).

**`SW+30`** — Definition. SW+30 chooses left/third-base/shortstop sectors.

Declared: [171:1](#block-171) (definition).

Definition tokens: `: SW+30 DUP IF 1 = IF ( IF HL ELSE FSSR THEN ELSE ( IF F3RDL ELSE HL THEN THEN ELSE ( DROP DUP IF 1- IF FSSR ELSE FSSL THEN ELSE DROP HL THEN THEN ;`.

Used in blocks: [171](#block-171).

**`SW+45`** — Definition. SW+45 handles the left-edge choices; SW+90 always returns foul-left after dropping its inputs.

Declared: [171:5](#block-171) (definition).

Definition tokens: `: SW+45 DUP IF 1 = IF ( IF HLL ELSE F3RDR THEN ELSE ( DROP FBL THEN ELSE ( DROP DUP IF 1- IF F3RDR ELSE F3RDL THEN ELSE DROP HLL THEN THEN ;`.

Used in blocks: [171](#block-171).

**`SW+90`** — Definition. SW+45 handles the left-edge choices; SW+90 always returns foul-left after dropping its inputs.

Declared: [171:9](#block-171) (definition).

Definition tokens: `: SW+90 DROP DROP FBL ;`.

Used in blocks: [171](#block-171).

**`SW-30`** — Definition. SW-30 chooses right/second-base sectors by the same input convention.

Declared: [170:7](#block-170) (definition).

Definition tokens: `: SW-30 DUP IF 1 = IF ( IF F1STR ELSE HR THEN ELSE ( IF HR ELSE F2NDL THEN THEN ELSE ( DROP DUP IF 1- IF F2NDL ELSE F2NDR THEN ELSE DROP HR THEN THEN ;`.

Used in blocks: [170](#block-170), [171](#block-171).

**`SW-45`** — Definition. SW-45 chooses among right/foul/first-base sectors using horizontal pitch direction and the random selector.

Declared: [170:3](#block-170) (definition).

Definition tokens: `: SW-45 DUP IF 1 = IF ( DROP FBR ELSE ( IF HRL ELSE F1STL THEN THEN ELSE ( DROP DUP IF 1- IF F1STL ELSE F1STR THEN ELSE DROP HRL THEN THEN ;`.

Used in blocks: [170](#block-170), [171](#block-171).

**`SW-90`** — Definition. SW-90 ignores direction/random inputs and returns the far-right foul sector.

Declared: [170:2](#block-170) (definition).

Definition tokens: `: SW-90 DROP DROP FBR ;`.

Used in blocks: [170](#block-170), [171](#block-171).

**`SW0`** — Definition. SW0 handles the central swing angle and middle/second-base/shortstop sectors; continue.

Declared: [170:11](#block-170) (definition).

Definition tokens: `: SW0 DUP IF 1 = IF ( IF F2NDR ELSE HM THEN ELSE ( IF FSSL ELSE HM THEN THEN ELSE ( DROP IF HM ELSE F2NDR THEN THEN ;`.

Used in blocks: [170](#block-170), [171](#block-171).

**`SWAB`** — Swap the two bytes of a cell; distinct from nibble-swap SWAN.

Declared: [89:4](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89), [101](#block-101), [271](#block-271), [292](#block-292).

**`SWABN`** — Native swap helper at $0249; the game also binds SWAN to this entry.

Declared: [89:11](#block-89) (native word / kernel binding).

Used in blocks: [89](#block-89).

**`SWALK`** — Definition. Define BALL 1/2/3, HOMER and WALK string words.

Declared: [179:5](#block-179) (definition).

Definition tokens: `: SWALK 2400 2ROT A" SPOST ;`.

Used in blocks: [179](#block-179), [182](#block-182), [183](#block-183).

**`SWAN`** — Native nibble-swap binding used to post the high BCD digit before the low digit.

Declared: [292:5](#block-292) (native word / kernel binding).

Used in blocks: [249](#block-249), [292](#block-292).

**`SWAP`** — Exchange the top two stack cells.

Declared: [87:4](#block-87) (native word / kernel binding).

Used in blocks: [87](#block-87), [100](#block-100), [121](#block-121), [169](#block-169), [248](#block-248), [249](#block-249), [272](#block-272), [304](#block-304).

**`SWING`** — Bat-swing activity flag.

Declared: [152:12](#block-152) (byte variable).

Used in blocks: [126](#block-126), [152](#block-152), [259](#block-259).

**`SWINGGO`** — Gate permitting a new swing during an active pitch.

Declared: [151:12](#block-151) (byte variable).

Used in blocks: [122](#block-122), [124](#block-124), [126](#block-126), [151](#block-151), [262](#block-262).

**`SWINGTABLE`** — Cell table. Emit SWINGTABLE in angle order from -90 through +90 and stop loading.

Declared: [171:10](#block-171) (cell table).

Used in blocks: [158](#block-158), [171](#block-171).

**`SWINGTIME`** — Delay before the completed swing returns to its resting phase.

Declared: [152:12](#block-152) (byte variable).

Used in blocks: [152](#block-152), [259](#block-259), [260](#block-260).

**`SWINGTMP`** — Byte variable; allocated at the declaration location. 

Declared: [153:2](#block-153) (byte variable).

Used in blocks: [153](#block-153).

**`SWINGTYPE`** — Current bat/swing phase index selecting hit windows and graphics.

Declared: [149:10](#block-149) (byte variable).

Used in blocks: [149](#block-149), [158](#block-158), [160](#block-160), [161](#block-161), [162](#block-162), [259](#block-259).

**`SWRND#`** — Random value used for computer swing timing.

Declared: [149:1](#block-149) (byte variable).

Used in blocks: [126](#block-126), [149](#block-149), [169](#block-169).

### Dictionary: T

**`T`** — Host interpreter word whose preceding byte is patched in block 10.

Used in blocks: [10](#block-10).

**`T,`** — Definition. Wrap four saved-XC entry addresses as OB,, O,, OHERE and T,. Their implementations reside in the loaded XC image.

Declared: [98:3](#block-98) (definition).

Definition tokens: `: T, 08475 EXECUTE ;`.

Used in blocks: [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101).

**`TABLE`** — Declare a cell table accessed with the game's indexed table syntax.

Used in blocks: [154](#block-154), [156](#block-156), [171](#block-171), [183](#block-183).

**`TAKE-ME`** — Byte table. Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato.

Declared: [136:3](#block-136) (byte table).

Used in blocks: [136](#block-136), [146](#block-146).

**`TAKEFIELD`** — Take-field transition flag; gates normal input and movement handling.

Declared: [149:13](#block-149) (byte variable).

Used in blocks: [132](#block-132), [149](#block-149), [181](#block-181), [194](#block-194), [214](#block-214), [257](#block-257), [268](#block-268).

**`TAKEOFF`** — Native subroutine. Select hexadecimal, declare the return label and begin TAKEOFF assembly.

Declared: [164:3](#block-164) (native subroutine).

Used in blocks: [164](#block-164), [254](#block-254).

**`TBALLDX`** — Signed trackball X input delta.

Declared: [150:2](#block-150) (byte variable).

Used in blocks: [150](#block-150), [174](#block-174), [175](#block-175), [177](#block-177).

**`TBALLDY`** — Signed trackball Y input delta.

Declared: [150:1](#block-150) (byte variable).

Used in blocks: [150](#block-150), [175](#block-175), [177](#block-177).

**`TBALLPITCH`** — Native word / kernel binding. TBALLPITCH adjusts TBALLYSR using signed Y input, clamps the positive progression to three and avoids reducing the negative-side state below the shown threshold; store the resulting cell in TBLDY.

Declared: [177:1](#block-177) (native word / kernel binding).

Used in blocks: [132](#block-132), [177](#block-177).

**`TBALLPRC`** — Native subroutine. TBALLPRC reads port $13, toggles its axis selector, combines it with PLYR1UP for port $28 and stores the sampled byte in the interleaved TBALL delta area. Continue the routine.

Declared: [174:10](#block-174) (native subroutine).

Used in blocks: [174](#block-174), [268](#block-268).

**`TBALLYSR`** — Pitch-speed state adjusted by trackball Y input.

Declared: [150:2](#block-150) (byte variable).

Used in blocks: [122](#block-122), [150](#block-150), [177](#block-177).

**`TBLDX`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:11](#block-150) (cell variable).

Used in blocks: [150](#block-150), [177](#block-177).

**`TBLDY`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:11](#block-150) (cell variable).

Used in blocks: [150](#block-150), [177](#block-177).

**`TBLOPCODE`** — Byte variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:11](#block-150) (byte variable).

Used in blocks: [150](#block-150), [212](#block-212).

**`TBLPA`** — Cell variable. Allocate corresponding outfield, trackball-ball and off-field fields; continue. These field names are used as RAM table addresses by playaction dispatch.

Declared: [150:12](#block-150) (cell variable).

Used in blocks: [122](#block-122), [150](#block-150), [199](#block-199), [213](#block-213).

**`TBLUPDATE#`** — Byte variable; allocated at the declaration location. 

Declared: [150:12](#block-150) (byte variable).

Used in blocks: [150](#block-150).

**`TBLVEL`** — Native subroutine. Declare labels and define TBLVEL: zero gives zero velocity, small magnitudes give $0080, magnitudes at least three give $01B0, and the original sign is restored with COMPHL.

Declared: [174:2](#block-174) (native subroutine).

Used in blocks: [174](#block-174), [175](#block-175).

**`TCNT`** — Definition. TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits.

Declared: [128:1](#block-128) (definition).

Definition tokens: `: TCNT 700 1800 828 A" SPOST CNSW12 B@ IF CREDITS B@ IF DP1 ELSE 0F00 2C00 828 A" SPOST THEN ELSE DP1 THEN ;`.

Used in blocks: [128](#block-128), [130](#block-130).

**`TEMPU`** — Byte variable; allocated at the declaration location. 

Declared: [151:8](#block-151) (byte variable).

Used in blocks: [151](#block-151).

**`TERSE`** — Select the host TERSE vocabulary/context.

Used in blocks: [33](#block-33), [34](#block-34), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101).

**`TERSECHK`** — Definition. TERSECHK advances the random generator and services pending take-field, player-selection, player-check and credit-update flags.

Declared: [132:1](#block-132) (definition).

Definition tokens: `: TERSECHK ( 0 RND DROP TFTIME B@ IF TF THEN SELECT B@ IF PLRSELECT THEN CHKPLRS B@ IF PLRCHK THEN UPCRED B@ IF CREDARROW THEN ;`.

Used in blocks: [132](#block-132).

**`TF`** — Definition. TF clears transient RAM, initializes ball/strike/out character bytes to $30, reads and inverts the pricing DIP bit, switches PLYR1UP and adjusts computer control.

Declared: [129:1](#block-129) (definition).

Definition tokens: `: TF ( DI ZERORAM EI 30 DUP DUP OUTS B! BALLS B! STRIKES B! 12 INP 1 AND 1 XOR CNSW1 B! ( PLYR1UP DUP B@ 1 XOR DUP ROT B! CMPLR B@ IF DUP IF CMSW BONE ELSE CMPT BONE THEN THEN DI SHILL B@ IF SGO DOGOVER ELSE GAMEOVER B@ IF SGO CMPLR B@ IF SCORE1 B@ SCORE2 B@ < IF CONGR 50 …`.

Used in blocks: [129](#block-129), [131](#block-131), [132](#block-132), [133](#block-133).

**`TFPA`** — Named data address. Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

Declared: [226:2](#block-226) (data label).

Used in blocks: [213](#block-213), [226](#block-226).

**`TFPA1`** — Named data address. Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

Declared: [226:3](#block-226) (data label).

Used in blocks: [213](#block-213), [226](#block-226).

**`TFPA2`** — Named data address. Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

Declared: [226:4](#block-226) (data label).

Used in blocks: [213](#block-213), [226](#block-226).

**`TFTIME`** — Foreground request to invoke TF after the take-field timer expires.

Declared: [151:7](#block-151) (byte variable).

Used in blocks: [132](#block-132), [151](#block-151), [254](#block-254).

**`TFTIMER`** — Delay before the next take-field request.

Declared: [151:2](#block-151) (byte variable).

Used in blocks: [151](#block-151), [195](#block-195), [254](#block-254).

**`THEN`** — Immediate XC wrapper that resolves a saved target branch destination.

Declared: [100:8](#block-100) (definition).

Definition tokens: `: THEN } XC-THEN { ;`.

Used in blocks: [34](#block-34), [98](#block-98), [100](#block-100), [101](#block-101), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [132](#block-132), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [236](#block-236), [238](#block-238), [239](#block-239), [240](#block-240), [249](#block-249), [305](#block-305), [306](#block-306).

**`THEN,`** — Resolve a structured assembler conditional branch.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [145](#block-145), [159](#block-159), [160](#block-160), [165](#block-165), [166](#block-166), [173](#block-173), [174](#block-174), [176](#block-176), [177](#block-177), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [208](#block-208), [231](#block-231), [233](#block-233), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [246](#block-246), [247](#block-247), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [269](#block-269), [270](#block-270), [279](#block-279), [281](#block-281), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288).

**`THROW`** — Ball is being thrown rather than following a newly hit trajectory.

Declared: [149:9](#block-149) (byte variable).

Used in blocks: [116](#block-116), [120](#block-120), [149](#block-149), [192](#block-192), [262](#block-262).

**`THROWANIM`** — Native word / kernel binding. Preserve IX/IY, disable interrupts, select WHOTHROWS, clear throw-animation state and velocity, and copy the thrower's coordinates into BL with the shown X adjustment.

Declared: [119:3](#block-119) (native word / kernel binding).

Used in blocks: [119](#block-119), [132](#block-132).

**`THROWANM`** — Foreground throw-animation request.

Declared: [149:15](#block-149) (byte variable).

Used in blocks: [116](#block-116), [117](#block-117), [119](#block-119), [132](#block-132), [149](#block-149), [191](#block-191), [199](#block-199), [254](#block-254), [263](#block-263).

**`THROWAROUND`** — Post-play return-throw state.

Declared: [149:9](#block-149) (byte variable).

Used in blocks: [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [149](#block-149), [155](#block-155), [156](#block-156), [158](#block-158), [195](#block-195), [235](#block-235), [262](#block-262).

**`THROWBALL`** — Native word / kernel binding. THROWBALL waits while scoring is clearing, resets THROWTIME, selects BAL and, for a pitch, copies pitcher coordinates into BL with offsets under DI.

Declared: [122:5](#block-122) (native word / kernel binding).

Used in blocks: [122](#block-122), [132](#block-132).

**`THROWTIME`** — Foreground request to call THROWBALL.

Declared: [152:4](#block-152) (cell variable).

Used in blocks: [122](#block-122), [132](#block-132), [152](#block-152), [254](#block-254).

**`THROWTIMER`** — Delay before the ball throw is issued; some paths use the low byte with TIMEDCR.

Declared: [152:4](#block-152) (cell variable).

Used in blocks: [120](#block-120), [126](#block-126), [152](#block-152), [254](#block-254).

**`THRWBASE`** — Byte variable; allocated at the declaration location. 

Declared: [149:11](#block-149) (byte variable).

Used in blocks: [149](#block-149).

**`THRWUP`** — Named data address. Emit perspective lists for cover, throw, invisible, run, field and standing animations, using repeated entries where fewer unique sizes exist.

Declared: [189:2](#block-189) (data label).

Used in blocks: [189](#block-189).

**`THRWUP1`** — Named data address. Pair TUPnM/TUPnF images at four perspectives under THRWUP1–4.

Declared: [187:1](#block-187) (data label).

Used in blocks: [187](#block-187), [189](#block-189).

**`THRWUP2`** — Named data address. Pair TUPnM/TUPnF images at four perspectives under THRWUP1–4.

Declared: [187:2](#block-187) (data label).

Used in blocks: [187](#block-187), [189](#block-189).

**`THRWUP3`** — Named data address. Pair TUPnM/TUPnF images at four perspectives under THRWUP1–4.

Declared: [187:3](#block-187) (data label).

Used in blocks: [187](#block-187), [189](#block-189).

**`THRWUP4`** — Named data address. Pair TUPnM/TUPnF images at four perspectives under THRWUP1–4.

Declared: [187:4](#block-187) (data label).

Used in blocks: [187](#block-187), [189](#block-189).

**`THW,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:10](#block-225) (definition).

Definition tokens: `: THW, } 0B B, { ;`.

Used in blocks: [225](#block-225), [227](#block-227), [228](#block-228).

**`THWANMSET`** — Native word / kernel binding. THWANMSET saves the IX entity as WHOTHROWS, erases the ball and sets INAIR/THROWANM for the foreground sentry.

Declared: [191:1](#block-191) (native word / kernel binding).

Used in blocks: [191](#block-191), [199](#block-199).

**`THWBLPA`** — Named data address. Label command-only streams for running/off-field/field/outfield/ball motion, with delayed take-field variants.

Declared: [226:5](#block-226) (data label).

Used in blocks: [123](#block-123), [154](#block-154), [226](#block-226), [262](#block-262).

**`THWDX`** — Cell variable. Allocate trackball temporaries and the throw opcode/delta/update/pattern fields.

Declared: [150:3](#block-150) (cell variable).

Used in blocks: [150](#block-150), [193](#block-193).

**`THWDY`** — Cell variable. Allocate trackball temporaries and the throw opcode/delta/update/pattern fields.

Declared: [150:3](#block-150) (cell variable).

Used in blocks: [150](#block-150), [193](#block-193).

**`THWOPCODE`** — Byte variable. Allocate trackball temporaries and the throw opcode/delta/update/pattern fields.

Declared: [150:3](#block-150) (byte variable).

Used in blocks: [150](#block-150), [213](#block-213).

**`THWPA`** — Cell variable. Allocate trackball temporaries and the throw opcode/delta/update/pattern fields.

Declared: [150:4](#block-150) (cell variable).

Used in blocks: [123](#block-123), [150](#block-150), [154](#block-154), [192](#block-192), [193](#block-193), [213](#block-213), [262](#block-262).

**`THWUPDATE#`** — Byte variable; allocated at the declaration location. 

Declared: [150:4](#block-150) (byte variable).

Used in blocks: [150](#block-150).

**`TIMEDCR`** — Native subroutine. TIMEDCR leaves zero timers unchanged; otherwise decrements the byte and returns A=1 only on the transition to zero.

Declared: [233:6](#block-233) (native subroutine).

Used in blocks: [233](#block-233), [238](#block-238), [254](#block-254), [255](#block-255).

**`TIMEOUT`** — Pitch-button/automatic-pitch countdown.

Declared: [151:13](#block-151) (byte variable).

Used in blocks: [126](#block-126), [151](#block-151), [194](#block-194), [238](#block-238).

**`TIMER`** — Native word / kernel binding. TIMER turns THROWTIMER expiry into THROWTIME.

Declared: [254:1](#block-254) (native word / kernel binding).

Used in blocks: [254](#block-254), [268](#block-268).

**`TMP2`** — Cell variable; allocated at the declaration location. 

Declared: [149:1](#block-149) (cell variable).

Used in blocks: [149](#block-149).

**`TMP3`** — Byte variable; allocated at the declaration location. 

Declared: [149:1](#block-149) (byte variable).

Used in blocks: [149](#block-149).

**`TMPPITCH`** — Cell variable; allocated at the declaration location. 

Declared: [151:1](#block-151) (cell variable).

Used in blocks: [151](#block-151).

**`TONEA`** — Constant TONEA, assigned source expression/value `11` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:3](#block-290) (constant).

Used in blocks: [290](#block-290).

**`TONEB`** — Constant TONEB, assigned source expression/value `12` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:3](#block-290) (constant).

Used in blocks: [290](#block-290).

**`TONEC`** — Constant TONEC, assigned source expression/value `13` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:3](#block-290) (constant).

Used in blocks: [290](#block-290).

**`TONMO`** — Constant TONMO, assigned source expression/value `10` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:3](#block-290) (constant).

Used in blocks: [290](#block-290).

**`TOOF`** — Outfield automatic-control timeout counter.

Declared: [149:14](#block-149) (byte variable).

Used in blocks: [116](#block-116), [149](#block-149), [158](#block-158), [161](#block-161), [173](#block-173), [255](#block-255), [263](#block-263).

**`TOOF#`** — Number of timeout stages remaining before automatic outfield pursuit.

Declared: [149:14](#block-149) (byte variable).

Used in blocks: [149](#block-149), [158](#block-158), [161](#block-161), [173](#block-173).

**`TOOFCK`** — Native subroutine. TOOFCK decrements TOOF#; while stages remain reload the timeout, otherwise start CMPOF and mark TOOFF. Return to decimal and stop loading.

Declared: [173:10](#block-173) (native subroutine).

Used in blocks: [173](#block-173), [255](#block-255).

**`TOOFF`** — Outfield timeout-completed state.

Declared: [149:14](#block-149) (byte variable).

Used in blocks: [116](#block-116), [149](#block-149), [173](#block-173), [175](#block-175).

**`TORET`** — Native branch/loop label. Index WBSFTBL by BASESTATUS, push a synthetic native return address, load status $81 and jump to the chosen routine. Return at TORET and continue loading.

Declared: [164:2](#block-164) (forward declaration), [164:6](#block-164) (assembler label).

Used in blocks: [164](#block-164).

**`TOTIMER`** — Delay before automatic fly-ball runner takeoff.

Declared: [149:14](#block-149) (byte variable).

Used in blocks: [149](#block-149), [158](#block-158), [161](#block-161), [254](#block-254).

**`TUP1F`** — Named data address. Emit TUP1F–TUP4F counterpart records and continue. 

Declared: [108:8](#block-108) (data label).

Used in blocks: [108](#block-108), [187](#block-187).

**`TUP1M`** — Named data address. Emit TUP1M–TUP4M byte records. The fixed-count emitters also consume each record's trailing header/offset values.

Declared: [108:1](#block-108) (data label).

Used in blocks: [108](#block-108), [187](#block-187).

**`TUP2F`** — Named data address. Emit TUP1F–TUP4F counterpart records and continue. 

Declared: [108:10](#block-108) (data label).

Used in blocks: [108](#block-108), [187](#block-187).

**`TUP2M`** — Named data address. Emit TUP1M–TUP4M byte records. The fixed-count emitters also consume each record's trailing header/offset values.

Declared: [108:3](#block-108) (data label).

Used in blocks: [108](#block-108), [187](#block-187).

**`TUP3F`** — Named data address. Emit TUP1F–TUP4F counterpart records and continue. 

Declared: [108:12](#block-108) (data label).

Used in blocks: [108](#block-108), [187](#block-187).

**`TUP3M`** — Named data address. Emit TUP1M–TUP4M byte records. The fixed-count emitters also consume each record's trailing header/offset values.

Declared: [108:5](#block-108) (data label).

Used in blocks: [108](#block-108), [187](#block-187).

**`TUP4F`** — Named data address. Emit TUP1F–TUP4F counterpart records and continue. 

Declared: [108:14](#block-108) (data label).

Used in blocks: [108](#block-108), [187](#block-187).

**`TUP4M`** — Named data address. Emit TUP1M–TUP4M byte records. The fixed-count emitters also consume each record's trailing header/offset values.

Declared: [108:7](#block-108) (data label).

Used in blocks: [108](#block-108), [187](#block-187).

**`TWAIT`** — Definition. TWAIT performs a high-level delay with interrupts enabled, shortening it under the credit/pricing conditions shown, and finishes with interrupts disabled; continue.

Declared: [236:10](#block-236) (definition).

Definition tokens: `: TWAIT ( EI BEGIN FF 0 DO LOOP CREDITS B@ DUP IF 1 = IF CNSW12 B@ IF ELSE DROP 1 THEN ELSE DROP 1 THEN ELSE DROP THEN 50 0 DO LOOP 1 - DUP 0= END DROP DI ;`.

Used in blocks: [128](#block-128), [129](#block-129), [130](#block-130), [236](#block-236), [305](#block-305).

### Dictionary: U

**`U<`** — Unsigned less-than comparison used by the host literal compiler.

Used in blocks: [101](#block-101).

**`UB!`** — Host byte write used for the interpreter patch in block 10.

Used in blocks: [10](#block-10).

**`UNMAP`** — Definition. Define the GAS TERSE version of UNMAP by passing $F1 to MEMAP!. 

Declared: [10:2](#block-10) (definition).

Definition tokens: `: UNMAP 0F1 MEMAP! ;`.

Used in blocks: [10](#block-10).

**`UNPROT`** — Lift host memory protection around bload's copy.

Used in blocks: [10](#block-10).

**`UPCRED`** — Request to update credit-to-inning accounting in TERSECHK.

Declared: [149:3](#block-149) (byte variable).

Used in blocks: [121](#block-121), [132](#block-132), [149](#block-149), [287](#block-287), [288](#block-288), [305](#block-305).

**`UPTRI`** — Named data address. Emit up/down inning triangles and the inning marker, then continue to the next pattern screen.

Declared: [107:13](#block-107) (data label).

Used in blocks: [107](#block-107), [130](#block-130).

### Dictionary: V

**`V`** — Definition. Define V as VARIABLE and BV as BVARIABLE, then continue the music processor source.

Declared: [142:14](#block-142) (definition).

Definition tokens: `: V } VARIABLE { ;`.

Used in blocks: [142](#block-142), [143](#block-143).

**`V-MODE`** — Alternate pixel-write mode; see 285:4, whose nonzero branch stores E directly rather than XORing.

Declared: [280:3](#block-280) (cell variable).

Used in blocks: [280](#block-280), [285](#block-285).

**`V-PXTYPE`** — Cell variable; allocated at the declaration location. 

Declared: [280:3](#block-280) (cell variable).

Used in blocks: [280](#block-280).

**`V=`** — Definition. Define zero-initialized cell/byte variable emitters V=/BV=, constant and forward shorthands C=/F=, and the deliberately spelled label alias LABLE for DATA.

Declared: [304:3](#block-304) (definition).

Definition tokens: `: V= } 0 VARIABLE { ;`.

Used in blocks: [149](#block-149), [150](#block-150), [151](#block-151), [152](#block-152), [280](#block-280), [304](#block-304).

**`VACT`** — Game sector/bit constant VACT = 7 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:7](#block-147) (constant).

Used in blocks: [119](#block-119), [120](#block-120), [123](#block-123), [126](#block-126), [147](#block-147), [190](#block-190), [193](#block-193), [198](#block-198), [199](#block-199), [230](#block-230), [237](#block-237), [238](#block-238), [266](#block-266), [267](#block-267).

**`VANM`** — Vector-record layout constant VANM = VANML (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:1](#block-148) (constant).

Used in blocks: [148](#block-148).

**`VANM#`** — Vector-record layout constant VANM# = 1 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:1](#block-148) (constant).

Used in blocks: [119](#block-119), [148](#block-148), [202](#block-202).

**`VANMH`** — Vector-record layout constant VANMH = 3 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:2](#block-148) (constant).

Used in blocks: [148](#block-148), [200](#block-200), [201](#block-201).

**`VANML`** — Vector-record layout constant VANML = 2 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:1](#block-148) (constant).

Used in blocks: [148](#block-148), [200](#block-200), [201](#block-201).

**`VANMSEQ`** — Vector-record layout constant VANMSEQ = VANMSEQL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:2](#block-148) (constant).

Used in blocks: [148](#block-148).

**`VANMSEQH`** — Vector-record layout constant VANMSEQH = 5 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:2](#block-148) (constant).

Used in blocks: [148](#block-148), [201](#block-201), [202](#block-202).

**`VANMSEQL`** — Vector-record layout constant VANMSEQL = 4 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:2](#block-148) (constant).

Used in blocks: [148](#block-148), [201](#block-201), [202](#block-202).

**`VARIABLE`** — Allocate/name a cell variable with the initial value in this dialect.

Used in blocks: [10](#block-10), [141](#block-141), [142](#block-142), [291](#block-291), [304](#block-304).

**`VATBS`** — Game sector/bit constant VATBS = 6 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:7](#block-147) (constant).

Used in blocks: [116](#block-116), [119](#block-119), [147](#block-147), [196](#block-196), [197](#block-197), [198](#block-198).

**`VAUTO`** — Game sector/bit constant VAUTO = 1 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:9](#block-147) (constant).

Used in blocks: [147](#block-147), [196](#block-196), [198](#block-198).

**`VBL`** — Game sector/bit constant VBL = 1 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:9](#block-147) (constant).

Used in blocks: [147](#block-147), [257](#block-257).

**`VDSTX`** — Vector-record layout constant VDSTX = VDSTXL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:10](#block-148) (constant).

Used in blocks: [120](#block-120), [148](#block-148), [158](#block-158), [160](#block-160), [161](#block-161), [173](#block-173), [193](#block-193), [211](#block-211), [262](#block-262).

**`VDSTXH`** — Vector-record layout constant VDSTXH = 26 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:11](#block-148) (constant).

Used in blocks: [148](#block-148), [173](#block-173), [232](#block-232).

**`VDSTXL`** — Vector-record layout constant VDSTXL = 25 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:10](#block-148) (constant).

Used in blocks: [148](#block-148), [232](#block-232).

**`VDSTY`** — Vector-record layout constant VDSTY = VDSTYL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:11](#block-148) (constant).

Used in blocks: [119](#block-119), [120](#block-120), [148](#block-148), [158](#block-158), [160](#block-160), [173](#block-173), [193](#block-193), [211](#block-211), [262](#block-262).

**`VDSTYH`** — Vector-record layout constant VDSTYH = 28 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:12](#block-148) (constant).

Used in blocks: [148](#block-148), [232](#block-232).

**`VDSTYL`** — Vector-record layout constant VDSTYL = 27 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:11](#block-148) (constant).

Used in blocks: [148](#block-148), [232](#block-232).

**`VDX`** — Vector-record layout constant VDX = VDXL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:4](#block-148) (constant).

Used in blocks: [115](#block-115), [148](#block-148), [158](#block-158).

**`VDXH`** — Vector-record layout constant VDXH = 10 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:4](#block-148) (constant).

Used in blocks: [119](#block-119), [148](#block-148), [201](#block-201), [257](#block-257).

**`VDXL`** — Vector-record layout constant VDXL = 9 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:4](#block-148) (constant).

Used in blocks: [119](#block-119), [148](#block-148), [201](#block-201), [257](#block-257).

**`VDY`** — Vector-record layout constant VDY = VDYL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:6](#block-148) (constant).

Used in blocks: [115](#block-115), [148](#block-148).

**`VDYH`** — Vector-record layout constant VDYH = 14 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:5](#block-148) (constant).

Used in blocks: [119](#block-119), [148](#block-148), [201](#block-201), [257](#block-257).

**`VDYL`** — Vector-record layout constant VDYL = 13 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:6](#block-148) (constant).

Used in blocks: [119](#block-119), [148](#block-148), [201](#block-201), [257](#block-257).

**`VECTIX`** — Saved address of the vector record currently being updated.

Declared: [151:3](#block-151) (cell variable).

Used in blocks: [151](#block-151), [203](#block-203), [266](#block-266), [267](#block-267).

**`VECTOR`** — Native word / kernel binding. Choose ordinary or restricted outfielder Y bounds, load X and divide its X delta by four for the horizontal resolution before adding it.

Declared: [257:1](#block-257) (native word / kernel binding), [283:3](#block-283) (assembler label), [281:1](#block-281) (forward declaration).

Used in blocks: [257](#block-257), [266](#block-266), [267](#block-267), [270](#block-270), [281](#block-281), [283](#block-283).

**`VECTPC`** — Current playaction/opcode stream address, including RAM motion-record redirection.

Declared: [151:2](#block-151) (cell variable).

Used in blocks: [151](#block-151), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [200](#block-200).

**`VERAF`** — Constant VERAF, assigned source expression/value `0E` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:6](#block-290) (constant).

Used in blocks: [290](#block-290).

**`VERASE`** — Native word / kernel binding. VERASE reads expansion/magic and pattern, skips its relative offsets to the size header and loads VSCRADR.

Declared: [252:1](#block-252) (native word / kernel binding).

Used in blocks: [238](#block-238), [252](#block-252), [266](#block-266), [267](#block-267).

**`VERBL`** — Constant VERBL, assigned source expression/value `0A` (use the defining screen’s radix). Save radix and select hex; define horizontal color boundary and vertical blanking ports.

Declared: [290:1](#block-290) (constant).

Used in blocks: [290](#block-290).

**`VFORW`** — Game sector/bit constant VFORW = 0 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:9](#block-147) (constant).

Used in blocks: [147](#block-147), [196](#block-196).

**`VGO`** — Game sector/bit constant VGO = 3 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:8](#block-147) (constant).

Used in blocks: [117](#block-117), [120](#block-120), [123](#block-123), [147](#block-147), [173](#block-173), [197](#block-197), [230](#block-230), [231](#block-231).

**`VHW`** — Game sector/bit constant VHW = 2 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:8](#block-147) (constant).

Used in blocks: [116](#block-116), [147](#block-147), [197](#block-197), [198](#block-198), [255](#block-255).

**`VIBRA`** — Constant VIBRA, assigned source expression/value `14` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:4](#block-290) (constant).

Used in blocks: [290](#block-290).

**`VIBS`** — Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

Declared: [141:3](#block-141) (definition).

Definition tokens: `: VIBS } 14 B, B, { ;`.

Used in blocks: [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**`VIS`** — Definition. HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; continue.

Declared: [237:12](#block-237) (definition).

Definition tokens: `: VIS 700 7A00 828 56 CPOST 900 7F00 8828 A" SPOST ;`.

Used in blocks: [237](#block-237), [238](#block-238), [275](#block-275).

**`VLENGTH`** — Vector-record layout constant VLENGTH = 31 (decimal on this screen). VLENGTH is the complete record size.

Declared: [148:12](#block-148) (constant).

Used in blocks: [114](#block-114), [115](#block-115), [117](#block-117), [148](#block-148), [181](#block-181), [196](#block-196), [212](#block-212), [213](#block-213), [216](#block-216), [237](#block-237), [261](#block-261), [266](#block-266).

**`VMAGIC`** — Vector-record layout constant VMAGIC = 0 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:1](#block-148) (constant).

Used in blocks: [114](#block-114), [115](#block-115), [126](#block-126), [148](#block-148), [162](#block-162), [165](#block-165), [166](#block-166), [167](#block-167), [168](#block-168), [169](#block-169), [181](#block-181), [196](#block-196), [200](#block-200), [212](#block-212), [213](#block-213), [238](#block-238), [251](#block-251), [252](#block-252), [261](#block-261), [264](#block-264), [267](#block-267).

**`VOF`** — Game sector/bit constant VOF = 5 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:7](#block-147) (constant).

Used in blocks: [147](#block-147), [194](#block-194), [195](#block-195), [257](#block-257).

**`VOFW`** — Vector-record layout constant VOFW = 29 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:12](#block-148) (constant).

Used in blocks: [115](#block-115), [116](#block-116), [148](#block-148), [196](#block-196), [197](#block-197), [198](#block-198).

**`VOLAB`** — Constant VOLAB, assigned source expression/value `16` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:4](#block-290) (constant).

Used in blocks: [290](#block-290).

**`VOLC`** — Constant VOLC, assigned source expression/value `15` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:4](#block-290) (constant).

Used in blocks: [290](#block-290).

**`VOLN`** — Constant VOLN, assigned source expression/value `17` (use the defining screen’s radix). Define sound master/tone/vibrato/volume/noise and extension port names.

Declared: [290:4](#block-290) (constant).

Used in blocks: [290](#block-290).

**`VPAT`** — Vector-record layout constant VPAT = VPATL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:8](#block-148) (constant).

Used in blocks: [115](#block-115), [148](#block-148), [212](#block-212), [238](#block-238).

**`VPATH`** — Vector-record layout constant VPATH = 20 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:7](#block-148) (constant).

Used in blocks: [148](#block-148), [202](#block-202), [251](#block-251), [252](#block-252).

**`VPATL`** — Vector-record layout constant VPATL = 19 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:8](#block-148) (constant).

Used in blocks: [148](#block-148), [202](#block-202), [212](#block-212), [251](#block-251), [252](#block-252).

**`VPERS#`** — Vector-record layout constant VPERS# = 21 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:8](#block-148) (constant).

Used in blocks: [148](#block-148), [201](#block-201), [255](#block-255).

**`VPLAYACTPC`** — Vector-record layout constant VPLAYACTPC = VPLAYACTPCL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:3](#block-148) (constant).

Used in blocks: [115](#block-115), [123](#block-123), [124](#block-124), [126](#block-126), [148](#block-148), [153](#block-153), [154](#block-154), [157](#block-157), [213](#block-213), [262](#block-262).

**`VPLAYACTPCH`** — Vector-record layout constant VPLAYACTPCH = 7 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:3](#block-148) (constant).

Used in blocks: [117](#block-117), [120](#block-120), [148](#block-148), [201](#block-201).

**`VPLAYACTPCL`** — Vector-record layout constant VPLAYACTPCL = 6 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:3](#block-148) (constant).

Used in blocks: [117](#block-117), [120](#block-120), [148](#block-148), [181](#block-181), [201](#block-201).

**`VPT`** — Game sector/bit constant VPT = 4 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:8](#block-147) (constant).

Used in blocks: [117](#block-117), [147](#block-147), [194](#block-194), [202](#block-202).

**`VPTR`** — Variable allocation pointer; explicitly relocated by game variable/vector declarations.

Used in blocks: [10](#block-10), [149](#block-149), [216](#block-216), [291](#block-291), [295](#block-295).

**`VRSTAT`** — Vector-record layout constant VRSTAT = 30 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:13](#block-148) (constant).

Used in blocks: [116](#block-116), [148](#block-148), [196](#block-196), [197](#block-197), [198](#block-198), [233](#block-233), [235](#block-235).

**`VRUN`** — Game sector/bit constant VRUN = 0 (decimal on this screen). Define VSTATUS and VRSTAT bit positions, including active, at-base, outfielder, pitcher, moving, halfway, ball/runner and automatic/forward controls; continue.

Declared: [147:9](#block-147) (constant).

Used in blocks: [147](#block-147), [195](#block-195).

**`VSCRADR`** — Vector-record layout constant VSCRADR = VSCRADRL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:9](#block-148) (constant).

Used in blocks: [148](#block-148).

**`VSCRADRH`** — Vector-record layout constant VSCRADRH = 23 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:9](#block-148) (constant).

Used in blocks: [148](#block-148), [251](#block-251), [252](#block-252).

**`VSCRADRL`** — Vector-record layout constant VSCRADRL = 22 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:9](#block-148) (constant).

Used in blocks: [148](#block-148), [251](#block-251), [252](#block-252).

**`VSTATUS`** — Vector-record layout constant VSTATUS = 17 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:7](#block-148) (constant).

Used in blocks: [115](#block-115), [116](#block-116), [117](#block-117), [120](#block-120), [123](#block-123), [126](#block-126), [148](#block-148), [154](#block-154), [163](#block-163), [173](#block-173), [181](#block-181), [190](#block-190), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [202](#block-202), [212](#block-212), [213](#block-213), [230](#block-230), [231](#block-231), [233](#block-233), [235](#block-235), [237](#block-237), [238](#block-238), [255](#block-255), [257](#block-257), [262](#block-262), [266](#block-266), [267](#block-267).

**`VUPDATE#`** — Vector-record layout constant VUPDATE# = 8 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:4](#block-148) (constant).

Used in blocks: [126](#block-126), [148](#block-148), [154](#block-154), [201](#block-201), [203](#block-203), [262](#block-262).

**`VVEL`** — Vector-record layout constant VVEL = 29 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:12](#block-148) (constant).

Used in blocks: [120](#block-120), [148](#block-148), [158](#block-158), [161](#block-161), [192](#block-192), [262](#block-262).

**`VWBASE`** — Vector-record layout constant VWBASE = 18 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:7](#block-148) (constant).

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [119](#block-119), [148](#block-148), [168](#block-168), [169](#block-169), [181](#block-181), [196](#block-196), [198](#block-198).

**`VWRITE`** — Native word / kernel binding. VWRITE reads expansion/magic, X/Y and VPAT, converts relative offsets and calculates the magic-write destination.

Declared: [251:1](#block-251) (native word / kernel binding).

Used in blocks: [251](#block-251), [266](#block-266), [267](#block-267).

**`VX`** — Vector-record layout constant VX = VXL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:5](#block-148) (constant).

Used in blocks: [115](#block-115), [119](#block-119), [122](#block-122), [148](#block-148), [154](#block-154), [193](#block-193), [258](#block-258), [261](#block-261), [262](#block-262).

**`VXH`** — Vector-record layout constant VXH = 12 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:4](#block-148) (constant).

Used in blocks: [119](#block-119), [120](#block-120), [126](#block-126), [148](#block-148), [198](#block-198), [212](#block-212), [230](#block-230), [251](#block-251), [253](#block-253), [257](#block-257), [261](#block-261), [262](#block-262).

**`VXL`** — Vector-record layout constant VXL = 11 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:5](#block-148) (constant).

Used in blocks: [148](#block-148), [230](#block-230), [251](#block-251), [257](#block-257), [261](#block-261).

**`VXPAND`** — Vector-record layout constant VXPAND = 24 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:10](#block-148) (constant).

Used in blocks: [148](#block-148), [212](#block-212), [251](#block-251), [252](#block-252).

**`VY`** — Vector-record layout constant VY = VYL (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:6](#block-148) (constant).

Used in blocks: [115](#block-115), [119](#block-119), [122](#block-122), [148](#block-148), [154](#block-154), [193](#block-193), [262](#block-262).

**`VYH`** — Vector-record layout constant VYH = 16 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:6](#block-148) (constant).

Used in blocks: [119](#block-119), [126](#block-126), [148](#block-148), [212](#block-212), [230](#block-230), [251](#block-251), [255](#block-255), [257](#block-257), [258](#block-258), [261](#block-261), [262](#block-262), [263](#block-263).

**`VYL`** — Vector-record layout constant VYL = 15 (decimal on this screen). Used to address the corresponding field/byte; see the annotated layout in block 148.

Declared: [148:6](#block-148) (constant).

Used in blocks: [148](#block-148), [230](#block-230), [251](#block-251), [257](#block-257).

### Dictionary: W

**`WAIT`** — Native word / kernel binding. WAIT runs nested accumulator countdowns and returns natively.

Declared: [236:7](#block-236) (native word / kernel binding).

Used in blocks: [236](#block-236), [267](#block-267).

**`WAITTHROW`** — Countdown before a delayed throw-animation request.

Declared: [151:5](#block-151) (byte variable).

Used in blocks: [151](#block-151), [199](#block-199), [254](#block-254).

**`WAITTHRW`** — Native word / kernel binding. WAITTHRW starts throw setup, then for most occupancy cases defers THROWANM with a WAITTHROW timer.

Declared: [199:5](#block-199) (native word / kernel binding).

Used in blocks: [199](#block-199).

**`WALK`** — Walk delay/countdown state; suppresses catch handling until walk completion.

Declared: [149:7](#block-149) (byte variable).

Used in blocks: [116](#block-116), [149](#block-149), [182](#block-182), [254](#block-254).

**`WALKOVER`** — Native subroutine. LVRSTAT writes A to all four VRSTAT bytes. WALKOVER requests CAUGHT and THROWAROUND when the walk timer completes; continue.

Declared: [235:12](#block-235) (native subroutine).

Used in blocks: [235](#block-235), [254](#block-254).

**`WBASETABLE`** — Named data address. Emit WBASETABLE in the same occupancy-code ordering and continue.

Declared: [166:11](#block-166) (data label).

Used in blocks: [166](#block-166), [167](#block-167).

**`WBSFTBL`** — Named data address. Emit WBSFTBL in the occupancy-code order used by BASESTATUS, then continue.

Declared: [163:9](#block-163) (data label).

Used in blocks: [163](#block-163), [164](#block-164).

**`WHBODDS`** — Definition. HRBY2 halves HRAT. WHBODDS finds BASESTATUS and WHOSUP using the decision tree, treating an empty R1 as empty bases.

Declared: [169:2](#block-169) (definition).

Definition tokens: `: WHBODDS ( VWBASE R1 B@ 0 = IF 0 VMAGIC R1 ELSE RUN1CHK1ST THEN WHOSUP ! BASESTATUS B! 36 RND SWRND# B! 10 RND PTRND# B! ( IODDS B@ HRAT B! SCORE2 B@ SCORE1 B@ PLYR1UP B@ IF SWAP THEN - DUP 0 < IF -3 > IF 7 ELSE 8 THEN HRAT B! ELSE ( DUP 2 > IF HRBY2 DUP 4 > IF …`.

Used in blocks: [122](#block-122), [169](#block-169), [182](#block-182).

**`WHICHINT`** — Modulo-four selector for WINTBL's vector group.

Declared: [152:2](#block-152) (byte variable).

Used in blocks: [152](#block-152), [265](#block-265).

**`WHOSUP`** — Pointer to the current batter/available runner record.

Declared: [149:13](#block-149) (cell variable).

Used in blocks: [116](#block-116), [149](#block-149), [169](#block-169), [195](#block-195), [233](#block-233), [263](#block-263).

**`WHOTHROWS`** — Pointer to the throwing fielder's vector record.

Declared: [149:15](#block-149) (cell variable).

Used in blocks: [117](#block-117), [119](#block-119), [126](#block-126), [149](#block-149), [191](#block-191), [263](#block-263).

**`WINTBL`** — Named data address. Emit WINTBL, four starting vector pointers for the rotating three-entity updates.

Declared: [264:1](#block-264) (data label).

Used in blocks: [264](#block-264), [265](#block-265).

**`WLKCNT`** — Walk counter influencing permitted horizontal pitch adjustment.

Declared: [151:6](#block-151) (byte variable).

Used in blocks: [151](#block-151), [162](#block-162), [177](#block-177), [182](#block-182).

**`WORD`** — Host token/string parser used after selecting DELIM.

Used in blocks: [99](#block-99).

**`WRITE`** — Native word / kernel binding. Document WRITE's stack arguments. The WRTSYS comment describes historical options; this body calls software write directly.

Declared: [244:5](#block-244) (native word / kernel binding).

Used in blocks: [121](#block-121), [130](#block-130), [244](#block-244).

**`write`** — Native subroutine. Document the pointer/size interface and absence of a shifter flush, then output XPAND and MAGIC settings.

Declared: [243:1](#block-243) (native subroutine).

Used in blocks: [243](#block-243), [244](#block-244), [247](#block-247).

**`writep`** — Native subroutine. writep reads X/Y byte counts through IY and jumps to the shared write loop.

Declared: [244:1](#block-244) (native subroutine).

Used in blocks: [244](#block-244), [245](#block-245), [251](#block-251), [252](#block-252), [259](#block-259).

**`WRITR`** — Native word / kernel binding. Document the stack interface and output. The heading says WRITER, but the actual defined name is WRITR.

Declared: [245:1](#block-245) (native word / kernel binding).

Used in blocks: [127](#block-127), [245](#block-245), [274](#block-274).

**`WTHW,`** — Definition. Define command-byte emitters for base coverage, waiting, outfield/ball motion, destinations, throwing and deactivation; assign OPBLDST and OPBLMOT.

Declared: [225:6](#block-225) (definition).

Definition tokens: `: WTHW, } 0D B, { ;`.

Used in blocks: [225](#block-225), [228](#block-228).

**`WTMP`** — Byte variable; allocated at the declaration location. 

Declared: [153:2](#block-153) (byte variable).

Used in blocks: [153](#block-153).

**`WUPFLSH`** — Deferred normal team-indicator flashing request.

Declared: [151:4](#block-151) (byte variable).

Used in blocks: [118](#block-118), [126](#block-126), [130](#block-130), [151](#block-151), [240](#block-240).

**`WUPGO`** — Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue.

Declared: [233:14](#block-233) (definition).

Definition tokens: `: WUPGO WHOSUP @ DUP VSTATUS + 81 SB! VRSTAT + 3 SB! ;`.

Used in blocks: [158](#block-158), [161](#block-161), [182](#block-182), [233](#block-233).

**`WUPTON`** — Definition. WUPTON installs WUPWRT. CHKFLSHSTAY checks whether flashing was reserved and stops that special use while retaining its phase state.

Declared: [240:1](#block-240) (definition).

Definition tokens: `: WUPTON ' WUPWRT FLSHTON ;`.

Used in blocks: [130](#block-130), [240](#block-240).

**`WUPWRT`** — Definition. PTAUTOTM decrements TIMEOUT only when field clearing is idle; WUPWRT calls it and draws the currently batting team label.

Declared: [238:6](#block-238) (definition).

Definition tokens: `: WUPWRT ( PTAUTOTM PLYR1UP B@ IF HOM ELSE VIS THEN ;`.

Used in blocks: [118](#block-118), [126](#block-126), [130](#block-130), [238](#block-238), [240](#block-240).

### Dictionary: X

**`X`** — Assembler IX index-register designator.

Used in blocks: [114](#block-114), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [125](#block-125), [173](#block-173), [190](#block-190), [191](#block-191), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [208](#block-208), [230](#block-230), [231](#block-231), [232](#block-232), [238](#block-238), [239](#block-239), [251](#block-251), [252](#block-252), [253](#block-253), [255](#block-255), [257](#block-257), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [270](#block-270), [276](#block-276), [277](#block-277), [283](#block-283).

**`X-AXIS`** — Current line-generator X coordinate.

Declared: [280:2](#block-280) (cell variable).

Used in blocks: [271](#block-271), [280](#block-280), [281](#block-281), [283](#block-283), [285](#block-285).

**`X-RET`** — Native branch/loop label. Add one axis increment; on carry call through IX, then test the other axis and step through IY as needed before writing a point.

Declared: [284:8](#block-284) (assembler label), [281:1](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [284](#block-284).

**`xc`** — Select the cross-compiler vocabulary/context.

Used in blocks: [33](#block-33), [34](#block-34), [94](#block-94), [97](#block-97), [99](#block-99), [100](#block-100), [101](#block-101).

**`XC-BEGIN`** — Definition. XC-BEGIN saves the object address; XC-END emits the conditional back-branch to that address.

Declared: [100:5](#block-100) (definition).

Definition tokens: `: XC-BEGIN OHERE ;`.

Used in blocks: [100](#block-100).

**`XC-CHECK`** — Definition. Define XC-CHECK: reject $FFFF placeholders at $854B and $8559 with messages naming .dbeg. and .dend.; otherwise leave $F3D7 on the stack.

Declared: [34:2](#block-34) (definition).

Definition tokens: `: XC-CHECK 854B @ FFFF = IF A" ABORT THEN 8559 @ FFFF = IF A" ABORT THEN F3D7 ;`.

Used in blocks: [33](#block-33), [34](#block-34), [94](#block-94).

**`XC-ELSE`** — Definition. XC-ELSE emits unconditional branch token $1F9 and its placeholder, then resolves the preceding IF.

Declared: [100:4](#block-100) (definition).

Definition tokens: `: XC-ELSE 01F9 T, OHERE 0 O, SWAP XC-THEN ;`.

Used in blocks: [100](#block-100).

**`XC-END`** — Definition. XC-BEGIN saves the object address; XC-END emits the conditional back-branch to that address.

Declared: [100:5](#block-100) (definition).

Definition tokens: `: XC-END 0201 T, O, ;`.

Used in blocks: [100](#block-100).

**`XC-IF`** — Definition. XC-IF emits conditional branch token $201 and a placeholder cell. XC-THEN patches a saved object address to the current OHERE using the host entry $832A.

Declared: [100:2](#block-100) (definition).

Definition tokens: `: XC-IF 0201 T, OHERE 0 O, ;`.

Used in blocks: [100](#block-100).

**`XC-KERNEL`** — Definition. XC-KERNEL copies $300 bytes from source block $5D to the target object. 

Declared: [98:12](#block-98) (definition).

Definition tokens: `: XC-KERNEL NOFILES 05D BLOCK 0300 0 DO DUP I + B@ OB, LOOP DROP FILES ;`.

Used in blocks: [94](#block-94), [98](#block-98).

**`XC-LITERAL`** — Definition. When the cell at $F3D7 is zero, handle a literal; special values 0 and 1 use the kernel entries $71 and $77 through T,.

Declared: [101:2](#block-101) (definition).

Definition tokens: `: XC-LITERAL F3D7 @ 0= IF DUP 0= IF DROP 071 T, ELSE DUP 1 = IF DROP 077 T, ELSE DUP 07C00 U< NOT OVER 07F00 U< AND IF DUP SWAB 0FF AND 07C - 9 * 02D3 + T, OB, ELSE DUP 0100 U< IF 04F T, OB, ELSE 046 T, O, THEN THEN THEN THEN 06868 EXECUTE THEN ;`.

Used in blocks: [101](#block-101).

**`XC-OBJECT`** — Definition. Define XC-OBJECT by executing host entries $2DF2 and $81BF, then patch the two object-output hooks.

Declared: [34:10](#block-34) (definition).

Definition tokens: `: XC-OBJECT 02DF2 EXECUTE 081BF EXECUTE ;`.

Used in blocks: [34](#block-34).

**`XC-RBRIDGE`** — Definition. Allocate a cached bridge address. On the first XC-RBRIDGE call, emit a jump over the bridge and its machine bytes; later calls reuse its address. The emitted sequence copies BC to HL, reads the next address through IX and jumps through HL.

Declared: [98:5](#block-98) (definition).

Definition tokens: `: XC-RBRIDGE XC-RETURN @ 0= IF 0C3 OB, OHERE 0F + O, OHERE XC-RETURN ! 060 OB, 069 OB, 0DD OB, 04E OB, 0 OB, 0DD OB, 023 OB, 0DD OB, 046 OB, 0 OB, 0DD OB, 023 OB, 0E9 OB, THEN XC-RETURN @ ;`.

Used in blocks: [33](#block-33), [94](#block-94), [98](#block-98).

**`XC-RETURN`** — Constant XC-RETURN, assigned source expression/value `,` (use the defining screen’s radix). Allocate a cached bridge address. On the first XC-RBRIDGE call, emit a jump over the bridge and its machine bytes; later calls reuse its address. The emitted sequence copies BC to HL, reads the next address through IX and jumps through HL.

Declared: [98:4](#block-98) (constant).

Used in blocks: [98](#block-98).

**`XC-RUNTIME`** — Source filename passed to FLOAD; its visible support includes runtime bindings and kernel/bridge helpers.

Used in blocks: [33](#block-33), [94](#block-94).

**`XC-STRING`** — Definition. XC-STRING emits the target string token $20E, parses through delimiter $22 (double quote), then copies the length byte plus the character bytes into the object.

Declared: [99:2](#block-99) (definition).

Definition tokens: `: XC-STRING 020E T, 22 DELIM ! WORD HERE DUP B@ 1+ 0 DO DUP I + B@ OB, LOOP DROP ;`.

Used in blocks: [99](#block-99).

**`XC-THEN`** — Definition. XC-IF emits conditional branch token $201 and a placeholder cell. XC-THEN patches a saved object address to the current OHERE using the host entry $832A.

Declared: [100:3](#block-100) (definition).

Definition tokens: `: XC-THEN OHERE SWAP 0832A EXECUTE ;`.

Used in blocks: [100](#block-100).

**`XCBEG`** — Begin cross-compilation with the selected target settings.

Used in blocks: [33](#block-33), [94](#block-94).

**`XCEND`** — Finish the target object; invoked by finalized build screen 94.

Used in blocks: [94](#block-94).

**`XCHG,`** — Exchange DE and HL.

Used in blocks: [123](#block-123), [164](#block-164), [167](#block-167), [200](#block-200), [230](#block-230), [231](#block-231), [233](#block-233), [241](#block-241), [242](#block-242), [244](#block-244), [279](#block-279), [283](#block-283), [284](#block-284), [285](#block-285).

**`xcsys`** — Select the saved XC system vocabulary/context.

Used in blocks: [33](#block-33), [34](#block-34), [94](#block-94), [97](#block-97), [99](#block-99), [100](#block-100), [101](#block-101).

**`XIN`** — Requested line endpoint X coordinate.

Declared: [280:2](#block-280) (cell variable).

Used in blocks: [271](#block-271), [280](#block-280), [283](#block-283), [285](#block-285).

**`XOR`** — Bitwise exclusive OR of two values.

Declared: [88:14](#block-88) (native word / kernel binding).

Used in blocks: [88](#block-88), [129](#block-129), [131](#block-131), [249](#block-249).

**`XPAND`** — Constant XPAND, assigned source expression/value `19` (use the defining screen’s radix). Define interrupt feedback/mode/scanline, commercial-mode, magic/expansion and interrupt-status/after-frame names. Reused numbers can represent read/write or hardware-specific roles; continue.

Declared: [290:6](#block-290) (constant).

Used in blocks: [207](#block-207), [243](#block-243), [290](#block-290).

**`XRA,`** — Exclusive-OR an operand with A.

Used in blocks: [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [124](#block-124), [126](#block-126), [144](#block-144), [167](#block-167), [176](#block-176), [192](#block-192), [193](#block-193), [195](#block-195), [196](#block-196), [198](#block-198), [199](#block-199), [201](#block-201), [202](#block-202), [230](#block-230), [231](#block-231), [233](#block-233), [236](#block-236), [239](#block-239), [253](#block-253), [259](#block-259), [260](#block-260), [262](#block-262), [263](#block-263), [265](#block-265), [266](#block-266), [283](#block-283), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288).

**`XRI,`** — Exclusive-OR an immediate byte with A.

Used in blocks: [125](#block-125), [174](#block-174), [195](#block-195), [269](#block-269).

**`XTHL,`** — Exchange HL with the native top-of-stack cell.

Used in blocks: [242](#block-242), [244](#block-244), [247](#block-247), [269](#block-269), [291](#block-291).

**`XYLOOP`** — Native branch/loop label. Add one axis increment; on carry call through IX, then test the other axis and step through IY as needed before writing a point.

Declared: [284:7](#block-284) (assembler label), [281:1](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [284](#block-284), [285](#block-285).

**`XYSHIFT`** — Native branch/loop label. Shift the combined and component magnitudes until a carry normalizes their scale, then continue at SINCR in 284.

Declared: [283:12](#block-283) (assembler label), [281:3](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [283](#block-283).

**`XYTEST`** — Forward-declared assembler name. Declared as a forward assembler name.

Declared: [281:4](#block-281) (forward declaration).

Used in blocks: [281](#block-281).

### Dictionary: Y

**`Y`** — Assembler IY index-register designator.

Used in blocks: [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [125](#block-125), [180](#block-180), [196](#block-196), [239](#block-239), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [251](#block-251), [252](#block-252), [259](#block-259), [261](#block-261), [263](#block-263), [264](#block-264), [268](#block-268), [270](#block-270), [283](#block-283).

**`Y-AXIS`** — Current line-generator Y coordinate.

Declared: [280:2](#block-280) (cell variable).

Used in blocks: [271](#block-271), [280](#block-280), [282](#block-282), [283](#block-283), [285](#block-285).

**`Y-RET`** — Forward-declared assembler name. Declared as a forward assembler name.

Declared: [281:1](#block-281) (forward declaration).

Used in blocks: [281](#block-281).

**`YIN`** — Requested line endpoint Y coordinate.

Declared: [280:2](#block-280) (cell variable).

Used in blocks: [271](#block-271), [280](#block-280), [283](#block-283), [285](#block-285).

**`YOU1ST`** — Definition. YOU1ST posts the greeting/extra-inning challenge, then continues to 306.

Declared: [305:13](#block-305) (definition).

Definition tokens: `: YOU1ST 1A00 1000 828 A" SPOST 0F00 3000 828 A" SPOST 1F00 5000 828 A" SPOST ;`.

Used in blocks: [131](#block-131), [305](#block-305).

**`YSTEP`** — Native branch/loop label. DEC-Y subtracts 80 bytes; YSTEP jumps through IY using PCIY,. Restore radix and continue the open assembly chain.

Declared: [282:7](#block-282) (assembler label), [281:3](#block-281) (forward declaration).

Used in blocks: [281](#block-281), [282](#block-282), [284](#block-284).

### Dictionary: Z

**`ZERO`** — Native cell-zeroing helper, used to clear paired score bytes; entry $00AD.

Declared: [87:9](#block-87) (native word / kernel binding).

Used in blocks: [87](#block-87), [128](#block-128), [131](#block-131).

**`ZERORAM`** — Definition. FLFILL fills the background while allowing interrupts; ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. Continue loading.

Declared: [273:14](#block-273) (definition).

Definition tokens: `: ZERORAM DI 0 7C30 270 FILL 3 OFTFCNT B! DI ;`.

Used in blocks: [129](#block-129), [273](#block-273), [274](#block-274).

**`ZEROSP`** — Constant ZEROSP, assigned source expression/value `6` (use the defining screen’s radix). Define SMFONT and ZEROSP option-bit positions and document cpost's retained X/Y/options return values.

Declared: [246:3](#block-246) (constant).

Used in blocks: [246](#block-246).

### Dictionary: Symbols

**`{`** — Enter the host-evaluated portion of the XC source's brace notation; exact implementation is in the loaded compiler.

Used in blocks: [99](#block-99), [100](#block-100), [102](#block-102), [107](#block-107), [109](#block-109), [136](#block-136), [141](#block-141), [142](#block-142), [159](#block-159), [160](#block-160), [199](#block-199), [225](#block-225), [229](#block-229), [280](#block-280), [291](#block-291), [292](#block-292), [304](#block-304).

**`}`** — Leave that host portion/resume the surrounding XC compilation convention.

Used in blocks: [99](#block-99), [100](#block-100), [102](#block-102), [107](#block-107), [109](#block-109), [136](#block-136), [141](#block-141), [142](#block-142), [159](#block-159), [160](#block-160), [199](#block-199), [225](#block-225), [229](#block-229), [280](#block-280), [291](#block-291), [292](#block-292), [304](#block-304).
