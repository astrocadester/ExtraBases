<p align="right"><code>v20261123-0021</code></p>

# Extra Bases - TERSE Glossary

- [Standard TERSE Vocabulary](#catalog-runtime) (38)<br>Core TERSE operations and inherited words used by the Extra Bases development and target environments.
- [Extra Bases TERSE Definitions](#catalog-colon) (201)<br>Game-specific TERSE definitions combining existing words to implement gameplay, display, sound and control logic.
- [Extra Bases CODE Verbs](#catalog-code) (85)<br>Z80 machine-code words that implement game operations, hardware access and TERSE runtime services.
- [Z80 SUBR Routines](#catalog-subr) (47)<br>Z80 subroutines called by other native routines for shared calculations, drawing, input and state updates.
- [Development Host Vocabulary](#catalog-host) (2)<br>Definitions used by the development host to manage source compilation rather than game execution.
- [Word and Verb Implementations](#catalog-implementations)<br>Complete available source bodies, stack signatures, native Z80 effects and cross-references for cataloged words.

<a name="catalog-runtime"></a>
## Standard TERSE Vocabulary (38)

<table>
<tbody>
<tr><td><strong>-</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-2d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Subtract the top value from the preceding value.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;difference&nbsp;)</code></td></tr>
<tr><td><strong>!</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-21" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Store one 16-bit cell.<br><code>(&nbsp;value&nbsp;address&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>@</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-40" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fetch one 16-bit cell.<br><code>(&nbsp;address&nbsp;--&nbsp;value&nbsp;)</code></td></tr>
<tr><td><strong>*</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-2a" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Multiply two stack values.<br><code>(&nbsp;m&nbsp;n&nbsp;--&nbsp;product&nbsp;)</code></td></tr>
<tr><td><strong>/</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-2f" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Divide the preceding stack value by the top value.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;quotient&nbsp;)</code></td></tr>
<tr><td><strong>+</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-2b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Add two stack values.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;sum&nbsp;)</code></td></tr>
<tr><td><strong>&lt;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-3c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Compare whether the preceding value is less than the top value.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code></td></tr>
<tr><td><strong>=</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-3d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Compare two values for equality.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code></td></tr>
<tr><td><strong>&gt;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-3e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Compare whether the preceding value is greater than the top value.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code></td></tr>
<tr><td><strong>0=</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-30-3d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Return a condition indicating zero.<br><code>(&nbsp;n&nbsp;--&nbsp;flag&nbsp;)</code></td></tr>
<tr><td><strong>2DUP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-32-44-55-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Duplicate the top two stack cells.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;a&nbsp;b&nbsp;a&nbsp;b&nbsp;)</code></td></tr>
<tr><td><strong>AND</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-4e-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Bitwise AND of two values.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code></td></tr>
<tr><td><strong>ARRAY</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-52-52-41-59" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Allocate/name an indexed cell array from a the size.<br><code>(&nbsp;size&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ASM</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-53-4d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select the Z80 assembler vocabulary in the development host.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>B!</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-21" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Store one byte.<br><code>(&nbsp;byte&nbsp;address&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>B@</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-40" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fetch one byte.<br><code>(&nbsp;address&nbsp;--&nbsp;byte&nbsp;)</code></td></tr>
<tr><td><strong>BARRAY</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-52-52-41-59" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Allocate/name an indexed byte array from a the size.<br><code>(&nbsp;size&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BEGIN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-45-47-49-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Immediate XC wrapper that records a loop's object address.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CODE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4f-44-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CONSTANT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4f-4e-53-54-41-4e-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Define a constant from a value.<br><code>(&nbsp;value&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DECIMAL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-45-43-49-4d-41-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select radix ten for parsing subsequent source numbers.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DROP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-52-4f-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Discard the top stack cell.<br><code>(&nbsp;x&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DUP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-55-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Duplicate the top stack cell.<br><code>(&nbsp;x&nbsp;--&nbsp;x&nbsp;x&nbsp;)</code></td></tr>
<tr><td><strong>ELSE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-45-4c-53-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>END</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-45-4e-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true.<br><code>(&nbsp;flag&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HERE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-45-52-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Return the address of the next free dictionary location.<br><code>(&nbsp;--&nbsp;address&nbsp;)</code></td></tr>
<tr><td><strong>HEX</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-45-58" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select radix sixteen for parsing subsequent source numbers.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>IF</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-46" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Immediate XC wrapper that emits a conditional target branch through XC-IF.<br><code>(&nbsp;flag&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Read an 8-bit input-port value and push it zero-extended.<br><code>(&nbsp;port&nbsp;--&nbsp;value&nbsp;)</code></td></tr>
<tr><td><strong>LIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Compiler literal mechanism used by INEXT's host macro.<br><code>(&nbsp;--&nbsp;value&nbsp;)</code></td></tr>
<tr><td><strong>OR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Bitwise inclusive OR of two values.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code></td></tr>
<tr><td><strong>OUTP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-55-54-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Write the low byte of a value to a hardware output port.<br><code>(&nbsp;value&nbsp;port&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OVER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-56-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Copy the second stack cell to the top.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;a&nbsp;b&nbsp;a&nbsp;)</code></td></tr>
<tr><td><strong>ROT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4f-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Rotate the top three stack cells.<br><code>(&nbsp;a&nbsp;b&nbsp;c&nbsp;--&nbsp;b&nbsp;c&nbsp;a&nbsp;)</code></td></tr>
<tr><td><strong>SWAP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-41-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Exchange the top two stack cells.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;b&nbsp;a&nbsp;)</code></td></tr>
<tr><td><strong>THEN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-48-45-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Immediate XC wrapper that resolves a saved target branch destination.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>VARIABLE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-56-41-52-49-41-42-4c-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Define a named 16-bit variable; the 1979 XC wrapper discards its incoming value before allocation.<br><code>(&nbsp;value&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>XOR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-58-4f-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Bitwise exclusive OR of two values.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code></td></tr>
</tbody>
</table>

<a name="catalog-colon"></a>
## Extra Bases TERSE Definitions (201)

<table>
<tbody>
<tr><td><strong>]'[</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-5d-27-5b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Source-level compiler/TERSE definition shown below.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>^</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-5e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses ABVOLS and MCVOLS to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>&lt;INTERRUPTS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-3c-49-4e-54-45-52-52-55-50-54-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Mark the start of interrupt data.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ABVOLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-42-56-4f-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the music volume command.<br><code>(&nbsp;volume&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ACT,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-43-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a playaction record.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ANOTE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-4e-4f-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a channel A note followed by its duration.<br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ATONE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-54-4f-4e-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit tone setting for channel A.<br><code>(&nbsp;tone&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BACT,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-43-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a ball-action record.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BALLTIME</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-4c-4c-54-49-4d-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Balls process.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BLDST,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4c-44-53-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the ball destination command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BLMOT,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4c-4d-4f-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the ball motion command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BNOTE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4e-4f-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a channel B note followed by its duration.<br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BONE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4f-4e-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Store byte value 1.<br><code>(&nbsp;address&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BTONE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-54-4f-4e-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit tone setting for channel B.<br><code>(&nbsp;tone&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BV</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-56" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Define a named byte variable.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BV=</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-56-3d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BV to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BZERO</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-5a-45-52-4f" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Store byte value 0.<br><code>(&nbsp;address&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>C=</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-3d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses CONSTANT to compose game logic.<br><code>(&nbsp;value&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHGS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-47-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Posts CHANGE SIDES.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHKFLSHSTAY</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-4b-46-4c-53-48-53-54-41-59" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>When isccp turn off check for wupwrt.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHKGMCNT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-4b-47-4d-43-4e-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Posts the appropriate prompt around a timed wait and returns the current credit byte.<br><code>(&nbsp;--&nbsp;credits&nbsp;)</code></td></tr>
<tr><td><strong>CMAJOR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4d-41-4a-4f-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Initialize the C-major sound pattern.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CNLINE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4e-4c-49-4e-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Saves a new XIN/YIN endpoint and calls cnline from the current line state.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CNOTE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4e-4f-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a channel C note followed by its duration.<br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CONGR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4f-4e-47-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Display the congratulatory prompt.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CPOST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-50-4f-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw one character at the specified position.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;char&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CREDARROW</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-52-45-44-41-52-52-4f-57" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Update last inning arrow.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CTONE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-54-4f-4e-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit tone setting for channel C.<br><code>(&nbsp;tone&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DEACT,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-45-41-43-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit vector-deactivation command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DLINE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4c-49-4e-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw a line , given X Y start coor X Y ending coor.<br><code>(&nbsp;x1&nbsp;y1&nbsp;x2&nbsp;y2&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DOCHGS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f-43-48-47-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DOEHOMER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f-45-48-4f-4d-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Display the home-run message.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DOGOVER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f-47-4f-56-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Do game over.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DOHOMER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f-48-4f-4d-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Erases the ball, displays HOMER, resets counts and clears the event timer.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DOSAFE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f-53-41-46-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Play the safe-call music and display its message.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DOSBALL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f-53-42-41-4c-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Inspect the $30-based count character and display the matching out message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DOSOUT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f-53-4f-55-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DOSSTRIKE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f-53-53-54-52-49-4b-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DP1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-50-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Display the one-coin deposit prompt.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DP12CN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-50-31-32-43-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses B@ and SPOST to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DP1CN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-50-31-43-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses SPOST to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DPCN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-50-43-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Wait for next coin.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>dpost</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-64-70-6f-73-74" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;nibble&nbsp;--&nbsp;x&nbsp;y&nbsp;options&nbsp;)</code></td></tr>
<tr><td><strong>DTC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-54-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Selects decimal and invokes the host editor.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DURATION</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-55-52-41-54-49-4f-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a note-duration command.<br><code>(&nbsp;duration&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DWAIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-57-41-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Runs nested loops with interrupts enabled and disables them on return.<br><code>(&nbsp;limit&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>F=</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-3d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Declare a forward word with the game's source shorthand.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>F1STLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-31-53-54-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select the first-base left-side action.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>F1STRS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-31-53-54-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select the first-base right-side action.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>F2NDLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-32-4e-44-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>F2NDRS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-32-4e-44-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>F3RDLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-33-52-44-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select the third-base left-side action.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>F3RDRS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-33-52-44-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select the third-base right-side action.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FBLLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-42-4c-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FBLRS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-42-4c-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FIELDWRT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-49-45-4c-44-57-52-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Write field outline.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Set up all of background.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FLDDST,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4c-44-44-53-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the fielder destination command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FLFILL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4c-46-49-4c-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fills the background while allowing interrupts.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FLSHME</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4c-53-48-4d-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Executes only a nonzero address whose top two bits are clear.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FLSHTON</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4c-53-48-54-4f-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Saves a callback and starts its timer.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FOULTIME</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4f-55-4c-54-49-4d-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Foulball process.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FOWR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4f-57-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FSSLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-53-53-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FSSRS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-53-53-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>GETF</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-47-45-54-46" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fetches FIELD bytes sequentially.<br><code>(&nbsp;--&nbsp;index&nbsp;field-byte&nbsp;)</code></td></tr>
<tr><td><strong>GRNDRACTION</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-47-52-4e-44-52-41-43-54-49-4f-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Consumes a selected hit-sector index, executes its `GSTBL` word, then installs the appropriate fielder playaction addresses.<br><code>(&nbsp;sector&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>GRNDRHIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-47-52-4e-44-52-48-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Computes a ground-ball sector from randomized timing and pitch direction, dispatches `GRNDRACTION`, then sets ball destination.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HITDST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-49-54-44-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Chooses hit location.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HLLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-4c-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HMS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-4d-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HOM</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-4f-4d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw HOME using a large initial character and the remainder of the string.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HRBY2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-52-42-59-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Halves HRAT.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HRLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-52-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HRS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>I'</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-27" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the target's indexed immediate reference.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ICODE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-43-4f-44-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Defines the native interrupt handler and emits its Z80 register-save prologue in the host compiler.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INEXT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-45-58-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emits a jump to IEX.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INLOG</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-4c-4f-47" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Infield master logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INNODDS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-4e-4f-44-44-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Derives IODDS from inning, computer/player swing control and bonus-inning state.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INSCN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-53-43-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Insert coin call.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INSTRC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-53-54-52-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Instructions.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INSWAIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-53-57-41-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.<br><code>(&nbsp;count&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INTERRUPTS&gt;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-54-45-52-52-55-50-54-53-3e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the interrupt-vector dispatch jump.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INTHIGHRES</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-54-48-49-47-48-52-45-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Intialize screen for commercial mode.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ISCN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-53-43-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Display the V15 instruction message.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LABLE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-41-42-4c-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Provide the original source's label-definition alias.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LCB,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-43-42-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses ACT, and DEACT, to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LDINFLDPA</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-44-49-4e-46-4c-44-50-41" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LDPC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-44-50-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit/load the music program-counter value.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LDPCC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-44-50-43-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit/load a music program-counter command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LK,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-4b-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BACT, and DEACT, to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LSETTFCOOR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Set take field coor & status -active , xpand.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MASTER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-41-53-54-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Define the game's master music stream.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MBALL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-42-41-4c-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MCANNON</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-43-41-4e-4e-4f-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MCOIN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-43-4f-49-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MCVOLS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-43-56-4f-4c-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit music-channel volume values.<br><code>(&nbsp;volume&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MFENCE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-46-45-4e-43-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MFOUL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-46-4f-55-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MHIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-48-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MLINN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-4c-49-4e-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Mark last inning.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MOPENERS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-4f-50-45-4e-45-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses PMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MOUT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-4f-55-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MSAFE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-53-41-46-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MSTRIKE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-53-54-52-49-4b-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MYAH</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-59-41-48" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses BMUSIC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>NOISE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4e-4f-49-53-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a noise/sound command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>NOTES</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4e-4f-54-45-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses ATONE and BTONE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>NPOST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4e-50-4f-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Post a bcd number on the screen ; see options.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;address&nbsp;length&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OFFDST,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-46-46-44-53-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the outfielder destination command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OFMOT,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-46-4d-4f-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the outfield motion command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ON1ST,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-4e-31-53-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the first-base playaction command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ON2ND,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-4e-32-4e-44-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the second-base playaction command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ON3RD,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-4e-33-52-44-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the third-base playaction command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OUTFLDHIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-55-54-46-4c-44-48-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fly ball.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OUTLINE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-55-54-4c-49-4e-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Creates rectanguler outline.<br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OUTTIME</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-55-54-54-49-4d-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Out prc.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PLRCHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-4c-52-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PLRSELECT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-4c-52-53-45-4c-45-43-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select singel player or 2 player.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PPOST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-50-4f-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw a counted string and keep drawing coordinates.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;string&nbsp;--&nbsp;x&nbsp;y&nbsp;options&nbsp;)</code></td></tr>
<tr><td><strong>PUP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-55-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Power up routine.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PX0</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-58-30" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit zero/white pixel patterns and define PX1/PX0 to select them.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PX1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-58-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit zero/white pixel patterns and define PX1/PX0 to select them.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>QUIET</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-51-55-49-45-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses ABVOLS and MCVOLS to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>QUIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-51-55-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses HERE and LDPC to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RCB,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-43-42-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses ACT, and DEACT, to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RDRNDNTE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-44-52-4e-44-4e-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a randomized note with a rest interval.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RECLINE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-45-43-4c-49-4e-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draws a horizontal rectangle row without consuming the five retained rectangle arguments.<br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;options&nbsp;--&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;options&nbsp;)</code></td></tr>
<tr><td><strong>RECTAN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-45-43-54-41-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>In X, Y, X length, Y length, pxtype set.<br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>REST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-45-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Insert a silent music interval.<br><code>(&nbsp;duration&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>REST,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-45-53-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a resting playaction record.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RETPA</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-45-54-50-41" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Return to position pa.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RNDNTE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4e-44-4e-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a randomized musical note.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RRRNDNTE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-52-52-4e-44-4e-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a sequence of randomized notes.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RUN1CHK1ST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-55-4e-31-43-48-4b-31-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Selects the runner vector for an occupied first-base slot, or delegates to the next occupancy test.<br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code></td></tr>
<tr><td><strong>RUN1CHK2ND</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-55-4e-31-43-48-4b-32-4e-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Chooses the next runner vector according to runner 1's second-base occupancy.<br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code></td></tr>
<tr><td><strong>RUN2CHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-55-4e-32-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Returns the runner code and vector for the next open base.<br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code></td></tr>
<tr><td><strong>RUN2CHK12ND</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-55-4e-32-43-48-4b-31-32-4e-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Returns runner 2 or 3 vector based on second-base occupancy.<br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code></td></tr>
<tr><td><strong>RUN2CHK1ST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-55-4e-32-43-48-4b-31-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Chooses runner 3 or delegates according to runner 2's first-base state.<br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code></td></tr>
<tr><td><strong>RUN3CHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-55-4e-33-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Returns runner 3 or 4 code/vector from third runner's occupancy.<br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code></td></tr>
<tr><td><strong>RUNDST,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-55-4e-44-53-54-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the runner destination command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>S!</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-21" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Store cell with address-first arguments.<br><code>(&nbsp;address&nbsp;value&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>S10</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-31-30" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Starts INTERRUPTS0 through ISTART.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>S11</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-31-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Starts INTERRUPTS1.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SB!</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-42-21" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Store byte with address-first arguments.<br><code>(&nbsp;address&nbsp;value&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SBALL1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-42-41-4c-4c-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw the BALL 1 message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SBALL2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-42-41-4c-4c-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw the BALL 2 message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SBALL3</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-42-41-4c-4c-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw the BALL 3 message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SBO</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-42-4f" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Posts the three $30-based count characters at their fixed positions.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SCOREME</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-43-4f-52-45-4d-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Plop scores up.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SCRERASE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-43-52-45-52-41-53-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Erase entire screen.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SCRS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-43-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Clears two score rectangles and draws zero score characters.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SETFDST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-45-54-46-44-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Set up fielder destination values.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SETTF</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-45-54-54-46" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SETTFPA</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-45-54-54-46-50-41" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Take field pa.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SFOUL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-46-4f-55-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses ROT and SPOST to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SGO</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-47-4f" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses SPOST to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SHOMER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-48-4f-4d-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses ROT and SPOST to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SORRY</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-4f-52-52-59" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Display the losing-player prompt.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SOUT1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-4f-55-54-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw the 1 OUT message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SOUT2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-4f-55-54-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw the 2 OUT message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SOUT3</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-4f-55-54-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw the 3 OUT message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SPLR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-50-4c-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>SPLR12/SPLR display available player choices;<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SPLR12</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-50-4c-52-31-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>SPLR12/SPLR display available player choices;<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SPOST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-50-4f-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw a string.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;string&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SSAFE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-53-41-46-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Display SAFE and redraw counts using SBO.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SSTRIKE1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-53-54-52-49-4b-45-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw the STRIKE 1 message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SSTRIKE2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-53-54-52-49-4b-45-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Draw the STRIKE 2 message.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>STFLD</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-54-46-4c-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Installs RETPA and TAKEFIELD.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>STP,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-54-50-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a standing-action record.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>STRIKETIME</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Strike process.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>STRINGGO</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-54-52-49-4e-47-47-4f" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Given string , stringerase.<br><code>(&nbsp;string&nbsp;erase-flag&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>STRINGPRC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-54-52-49-4e-47-50-52-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>String display.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>STRTBALL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-54-52-54-42-41-4c-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SUP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-55-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Posts UP.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SW-30</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-2d-33-30" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Maps a −30° swing and horizontal direction into a baseball sector code.<br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code></td></tr>
<tr><td><strong>SW-45</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-2d-34-35" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Maps a −45° swing and horizontal direction into a baseball sector code.<br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code></td></tr>
<tr><td><strong>SW-90</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-2d-39-30" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Ignores direction/random inputs and returns the far-right foul sector.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SW+30</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-2b-33-30" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Maps a +30° swing and horizontal direction into a baseball sector code.<br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code></td></tr>
<tr><td><strong>SW+45</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-2b-34-35" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Maps a +45° swing and horizontal direction into a baseball sector code.<br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code></td></tr>
<tr><td><strong>SW+90</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-2b-39-30" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Discard the two inputs and return the far-left foul sector.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SW0</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-30" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Maps a central swing and horizontal direction into a baseball sector code.<br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code></td></tr>
<tr><td><strong>SWALK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-41-4c-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses ROT and SPOST to compose game logic.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TCNT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-43-4e-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Chooses one-coin versus per-player continuation wording from CNSW12 and current credits.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TERSECHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-45-52-53-45-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Look at terse routine flags.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TF</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-46" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Take the field.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>THW,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-48-57-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the throw command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TWAIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-57-41-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Terse wait period.<br><code>(&nbsp;count&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>V</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-56" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses VARIABLE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>V=</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-56-3d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses V and VARIABLE to compose game logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>VIBS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-56-49-42-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit a vibrato setting.<br><code>(&nbsp;value&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>VIS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-56-49-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WHBODDS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-48-42-4f-44-44-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Sets who is on base calculates play odds.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WTHW,</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-54-48-57-2c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emit the wait-for-throw command.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WUPGO</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-55-50-47-4f" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Activates WHOSUP with runner/automatic-forward flags.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WUPTON</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-55-50-54-4f-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Installs WUPWRT.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WUPWRT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-55-50-57-52-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Write whos up for flash.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>YOU1ST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-59-4f-55-31-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Posts the greeting/extra-inning challenge, then continues to 306.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ZERORAM</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-5a-45-52-4f-52-41-4d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Clears $270 bytes starting at $7C30 and resets OFTFCNT.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
</tbody>
</table>

<a name="catalog-code"></a>
## Extra Bases CODE Verbs (85)

<table>
<tbody>
<tr><td><strong>+LOOP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-2b-4c-4f-4f-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses LOOP to process game state.<br><code>(&nbsp;increment&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ALLFLDACT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-4c-4c-46-4c-44-41-43-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Sets all fielders active.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ANMSEQLOAD</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-4e-4d-53-45-51-4c-4f-41-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Finds proper anm seq by per=#.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BALLERASE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-4c-4c-45-52-41-53-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Preserves BC/IY around native BLERASE and returns to TERSE.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BATHIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-54-48-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>He hit it time to get em running.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BATHITCHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-54-48-49-54-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Check window for hit.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BATSWING</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-54-53-57-49-4e-47" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Swings bat if appropriate.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BATWRITE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-54-57-52-49-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Xor bat from swingtype.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BCD+</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-43-44-2b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Binary to decimal arithmatic.<br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;bcd-sum&nbsp;)</code></td></tr>
<tr><td><strong>BLDST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4c-44-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Ball thrown or hit.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BLMOTION</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4c-4d-4f-54-49-4f-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Set pc for ram pa table -tractor ball.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BLPOSCHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4c-50-4f-53-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Branches on HITYET.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BMUSIC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4d-55-53-49-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.<br><code>(&nbsp;music-address&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BUTTONCHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-55-54-54-4f-4e-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Reads buttons for swing run & pitch it.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHKCAUGHT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-4b-43-41-55-47-48-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Caught set in interrupt.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHKGROUNDER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-4b-47-52-4f-55-4e-44-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>If grounder adjust ball direction.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHKSCRTIME</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-4b-53-43-52-54-49-4d-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Score process.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CLRBLST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4c-52-42-4c-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>cnline</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-63-6e-6c-69-6e-65" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Calls vector line write.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>COMPDE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4f-4d-50-44-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Negate DE while preserving HL.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>COMPHL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4f-4d-50-48-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Compliments HL.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>COUNT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4f-55-4e-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Read the next character of a counted/high-bit-terminated string.<br><code>(&nbsp;address&nbsp;--&nbsp;address+1&nbsp;character&nbsp;)</code></td></tr>
<tr><td><strong>cpost</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-63-70-6f-73-74" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Post an ascii-character on the screen ; see opt.<br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;char&nbsp;--&nbsp;x'&nbsp;y&nbsp;options&nbsp;)</code></td></tr>
<tr><td><strong>DEACTIVATE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-45-41-43-54-49-56-41-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Reset active bit in status.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DI</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-49" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Disable maskable Z80 interrupts.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DIVHLBY4</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-49-56-48-4c-42-59-34" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Divide HL by 4.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DO</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-4f" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Enter a counted loop using a three-cell return-stack frame.<br><code>(&nbsp;limit&nbsp;start&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DSTCALC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-53-54-43-41-4c-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Calc deltas to destination.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>DSTLD</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-44-53-54-4c-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>EI</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-45-49" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Enable maskable Z80 interrupts.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>EIDI</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-45-49-44-49" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Executes EI then DI, providing the Z80 interrupt opportunity used by callers.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>EMUSIC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-45-4d-55-53-49-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Selects ENDMUSIC and initializes timing/repetition to one.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>EX</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-45-58" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FILL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-49-4c-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fill consecutive bytes with a specified value.<br><code>(&nbsp;value&nbsp;address&nbsp;count&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FLDDST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4c-44-44-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fielders take position logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FLSHOFF</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4c-53-48-4f-46-46" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Disables flashing and services cleanup under DI.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FMIRROR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4d-49-52-52-4f-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HITRUN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-49-54-52-55-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Activate proper runners and set trwbase.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HOMERCHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-4f-4d-45-52-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Consumes two random offsets, hit type and ball coordinates from the TERSE parameter stack; sets fence/homer state and ball destination.<br><code>(&nbsp;y&nbsp;x&nbsp;hit-type&nbsp;random-x&nbsp;random-y&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>I</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fetch the innermost counted-loop index.<br><code>(&nbsp;--&nbsp;index&nbsp;)</code></td></tr>
<tr><td><strong>IEX</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-45-58" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Restores two saved Z80 register banks, enables interrupts, then returns from the interrupt bridge; this is an interrupt-frame convention, not an ordinary TERSE data-word call.<br><code>(&nbsp;saved-interrupt-frame&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INDEXW</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-44-45-58-57" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Call routine A- disp HL- table add.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INFIELD</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-46-49-45-4c-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses IFSPAN to process game state.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INFLDACT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-46-4c-44-41-43-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Set infielders active.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ISTART</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-53-54-41-52-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.<br><code>(&nbsp;interrupt-address&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>KILLOF</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4b-49-4c-4c-4f-46" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Stop outfield tractor ball control.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LOADANM</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-4f-41-44-41-4e-4d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Loads magic & anm HL-top of playact table.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LOOP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-4f-4f-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Advance a counted loop and test its termination.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MULTHLBY4</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-55-4c-54-48-4c-42-59-34" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Multiplies the magnitude of HL by four through shifts, then restores its sign.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>MUSCPU</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4d-55-53-43-50-55" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Declare cross-screen dispatch labels and begin assembling MUSCPU.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>NDUP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4e-44-55-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Duplicate the top n parameter-stack cells.<br><code>(&nbsp;x1&nbsp;…&nbsp;xn&nbsp;n&nbsp;--&nbsp;x1&nbsp;…&nbsp;xn&nbsp;x1&nbsp;…&nbsp;xn&nbsp;)</code></td></tr>
<tr><td><strong>OFFFDST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-46-46-46-44-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>All player off field control.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OFLDTBL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-46-4c-44-54-42-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Gives all three outfielders OFTBLPA, activates them and returns.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OFMOTION</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-46-4d-4f-54-49-4f-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Set pc for ram pa table -tractor ball.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ON1ST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-4e-31-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ON2ND</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-4e-32-4e-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>ON3RD</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-4e-33-52-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OPCODECHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-50-43-4f-44-45-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Called by plyactupdate.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OUTFLDACT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-55-54-46-4c-44-41-43-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Sets outfielders active.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PACTLOAD</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-41-43-54-4c-4f-41-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Loads vect from plyact.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PATFETCH</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-41-54-46-45-54-43-48" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Loads actual pattern IX-vector.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PERSPECTIVE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-45-52-53-50-45-43-54-49-56-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Pattern size determined by y.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PLAYACT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-4c-41-59-41-43-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Called in intterupt does update prc.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PMUSIC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-4d-55-53-49-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Installs a stream unconditionally and sets priority, repeat count and note timer.<br><code>(&nbsp;music-address&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PTAUTOTM</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-54-41-55-54-4f-54-4d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Pitch auto timer.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RESETRUNNERS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-45-53-45-54-52-55-4e-4e-45-52-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Reset runners to order of on base.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RND</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4e-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Produce a random value scaled to the supplied bound.<br><code>(&nbsp;upper-bound&nbsp;--&nbsp;random-value&nbsp;)</code></td></tr>
<tr><td><strong>RUNDST</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-55-4e-44-53-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Runner base running control.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SENTRY</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-45-4e-54-52-59" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Game loop.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SETACT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-45-54-41-43-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Sets avtive bit in status.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>STARTMUSIC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-54-41-52-54-4d-55-53-49-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Clears its request.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>strtline</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-73-74-72-74-6c-69-6e-65" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Given X Y sets up start of line.<br><code>(&nbsp;x&nbsp;y&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SWAN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-57-41-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Exchange the high and low nibbles of the low byte.<br><code>(&nbsp;value&nbsp;--&nbsp;nibble-swapped-value&nbsp;)</code></td></tr>
<tr><td><strong>TBALLPITCH</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-42-41-4c-4c-50-49-54-43-48" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Loads pitch velocities.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>THROWANIM</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-48-52-4f-57-41-4e-49-4d" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Sets up BLDST and player anim.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>THROWBALL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-48-52-4f-57-42-41-4c-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Finish scoring first.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>THWANMSET</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-48-57-41-4e-4d-53-45-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Set up throw animation.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TIMER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-49-4d-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Interrupt timer routine.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>VECTOR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-56-45-43-54-4f-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Vectors and limit checks.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>VERASE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-56-45-52-41-53-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Does pattern board erase from vector IX.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>VWRITE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-56-57-52-49-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Does reloff relabs patbrd from vector IX.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WAIT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-41-49-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Given A wait period stop every thing.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WAITTHRW</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-41-49-54-54-48-52-57" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Sets flag for 1stbaseman to wait throw.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WRITE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-52-49-54-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Write with X Y sizes ; pattern with no header.<br><code>(&nbsp;x&nbsp;y&nbsp;pattern&nbsp;dimensions&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WRITR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-52-49-54-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Write with a relative pattern.<br><code>(&nbsp;x&nbsp;y&nbsp;relative-pattern&nbsp;options&nbsp;--&nbsp;)</code></td></tr>
</tbody>
</table>

<a name="catalog-subr"></a>
## Z80 SUBR Routines (47)

<table>
<tbody>
<tr><td><strong>AUTOR1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-55-54-4f-52-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>AUTOR2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-55-54-4f-52-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Run second-runner automation logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>AUTOR3</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-41-55-54-4f-52-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Run third-runner automation logic.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BLERASE</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-4c-45-52-41-53-45" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Erases ball.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHKATBS</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-4b-41-54-42-53" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Check if active player at base in- A vstatus.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHKCOIN1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-4b-43-4f-49-4e-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Chk door 1 for coin drop.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CHKCOIN2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-48-4b-43-4f-49-4e-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Chk door 2 for coin drop.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>CMPOF</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4d-50-4f-46" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Calculates proper deltas and patterns.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>COLORBAND</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-43-4f-4c-4f-52-42-41-4e-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled.<br><code>(&nbsp;saved-interrupt-frame&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>debounce</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-64-65-62-6f-75-6e-63-65" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Debounce input transitions.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FETCH</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-45-54-43-48" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Read the current music command byte; INCPC, HLOAD, and PCJUMP provide related stream operations.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FLSHWUP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4c-53-48-57-55-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Handle flash callback.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FNBB</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4e-42-42" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Native game routine; source body below.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FONTUNPACK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-4f-4e-54-55-4e-50-41-43-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Reads two packed bytes and starts a five-row unpack loop.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FRO1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-52-4f-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses AUTOR1 to process game state.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FRO12</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-52-4f-31-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses AUTOR1 and AUTOR2 to process game state.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FRO123</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-52-4f-31-32-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses AUTOR1 and AUTOR2 to process game state.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FRO13</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-52-4f-31-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Uses AUTOR2 to process game state.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FRO2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-52-4f-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Native game routine; source body below.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FRO23</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-52-4f-32-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Native game routine; source body below.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>FRO3</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-46-52-4f-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Native game routine; source body below.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>HLOAD</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-48-4c-4f-41-44" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>IFSPAN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-46-53-50-41-4e" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>INCPC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-49-4e-43-50-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>loadpc</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-6c-6f-61-64-70-63" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Installs MUSPC and STARTPC.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>LVRSTAT</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4c-56-52-53-54-41-54" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Load vstat for all runners in- A value.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>NBB</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4e-42-42" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Do nothing for the empty-bases case.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>OFBLCHK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-4f-46-42-4c-43-48-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Chk for catch or close when cmsw.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>PCJUMP</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-50-43-4a-55-4d-50" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>relabs</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-72-65-6c-61-62-73" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Relative X Y to magic address conversion.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>reloff</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-72-65-6c-6f-66-66" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Compute relative offset of x , y of pattern.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RO1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4f-31" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RO12</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4f-31-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Activates both forced runners, selecting a double-play or ordinary target.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RO123</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4f-31-32-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Select forced advancement and double-play targets for second- and third-base runners.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RO13</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4f-31-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Handles first-and-third occupancy and may branch through SETDBLPLAY.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RO2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4f-32" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RO23</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4f-32-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>RO23 and RO123 choose forced advancement and double-play targets for their base combinations.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>RO3</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-52-4f-33" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>SETDBLPLAY</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-53-45-54-44-42-4c-50-4c-41-59" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Sets up double play HL-guy on 1st.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TAKEOFF</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-41-4b-45-4f-46-46" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Turn proper runners on.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TBALLPRC</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-42-41-4c-4c-50-52-43" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Pitch or control outfield.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TBLVEL</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-42-4c-56-45-4c" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Tractorball vel HL-# add. D-max vel.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TIMEDCR</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-49-4d-45-44-43-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>HL-timer add if goes to zero return 1 else 0.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>TOOFCK</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-54-4f-4f-46-43-4b" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Time out outfield check.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>WALKOVER</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-57-41-4c-4b-4f-56-45-52" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Walked runner at base.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>write</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-77-72-69-74-65" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Software write with x y size.<br><code>(&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>writep</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-77-72-69-74-65-70" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Software write with pattern size on pattern.<br><code>(&nbsp;IY=patadr&nbsp;BC=ex/mag+shf&nbsp;HL=scradr&nbsp;---&nbsp;)</code></td></tr>
</tbody>
</table>

<a name="catalog-host"></a>
## Development Host Vocabulary (2)

<table>
<tbody>
<tr><td><strong>BASE!</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-53-45-21" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Set the number base.<br><code>(&nbsp;base&nbsp;--&nbsp;)</code></td></tr>
<tr><td><strong>BASE@</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#terse-word-42-41-53-45-40" title="View implementation"><img src="images/terse-word-link.svg" width="14" height="14" alt="Implementation" /></a><br>Fetch the current number base.<br><code>(&nbsp;--&nbsp;base&nbsp;)</code></td></tr>
</tbody>
</table>

<a name="catalog-implementations"></a>
## Word and Verb Implementations

### <a name="terse-word-2d"></a><span>-</span>

Subtract the top value from the preceding value.

`( a b -- difference )`

```text
_minus:
            pop     de                  ; Pop subtrahend from parameter stack
            pop     hl                  ; Pop minuend from parameter stack
            xor     a                   ; Clear carry flag
            sbc     hl,de               ; Subtract subtrahend from minuend
            push    hl                  ; Push difference onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

---

### <a name="terse-word-21"></a><span>!</span>

Store one 16-bit cell.

`( value address -- )`

```text
_bang:
            pop     hl                  ; Pop target memory address
            pop     de                  ; Pop 16-bit word value
            ld      (hl),e              ; Write LSB to memory address
            inc     hl                  ; Advance memory pointer
            ld      (hl),d              ; Write MSB to memory address
            jp      (iy)                ; Return to TERSE inner interpreter
```

---

### <a name="terse-word-40"></a><span>@</span>

Fetch one 16-bit cell.

`( address -- value )`

```text
_at:
            pop     hl                  ; Pop target memory address from stack
            ld      e,(hl)              ; Read low byte from memory address
            inc     hl                  ; Advance memory pointer
            ld      d,(hl)              ; Read high byte from memory address
            push    de                  ; Push 16-bit fetched word onto stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

---

### <a name="terse-word-2a"></a><span>&#42;</span>

16-bit signed multiplication; result = m × n (16-bit cell).

`( m n -- product )`

**Original DNA host implementation — Gas Root 1.0, July 1982, entry $04A3.** This is the multiplication primitive used by the 1982 development-host interpreter. It consumes two 16-bit stack values and returns their low 16-bit product. The Extra Bases game's byte-token runtime remains a separate target.

```z80
xt_04A3:
    exx                     ; Work with the host's alternate register set
    pop de                  ; Multiplicand
    pop bc                  ; Multiplier
    ld hl,0                 ; Product accumulator
multiply_loop:
    srl b
    rr c                    ; Shift multiplier right; low bit enters carry
    jp nc,multiply_test
    add hl,de               ; Include multiplicand when bit was set
multiply_test:
    ld a,b
    or c
    jp z,multiply_done
    sla e
    rl d                    ; Double multiplicand
    jp multiply_loop
multiply_done:
    push hl                 ; Push low 16 bits of product
    exx
    jp (iy)                 ; Resume TERSE
```

**Source:** [WB original Gas Root interpreter, `xt_04A3`](https://github.com/lizard43/dnaTERSE-WB/blob/main/src/z80-runtime/terse-runtime.asm). The listing above replaces numeric branch destinations with local labels for readability; the original byte-annotated instructions are retained in WB.

**Variant boundary:** This is a verified July 1982 host primitive, not a claim that the Extra Bases game ROM contains an identical standalone multiplication token or that the February 25, 1982 Ice TERSE V.19 host has the same bytes.


---

### <a name="terse-word-2f"></a><span>/</span>

Divide the preceding stack value by the top value.

`( a b -- quotient )`

```terse
: / /MOD DROP ;
```

---

### <a name="terse-word-2b"></a><span>+</span>

Add two stack values.

`( a b -- sum )`

```text
_plus:
            pop     de                  ; Pop second operand from parameter stack
            pop     hl                  ; Pop first operand from parameter stack
            add     hl,de               ; Calculate 16-bit sum
            push    hl                  ; Push sum onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

---

### <a name="terse-word-3c"></a><span>&lt;</span>

Compare whether the preceding value is less than the top value.

`( a b -- flag )`

```z80
_less:
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
```

---

### <a name="terse-word-3d"></a><span>=</span>

Compare two values for equality.

`( a b -- flag )`

```text
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
```

---

### <a name="terse-word-3e"></a><span>&gt;</span>

Compare whether the preceding value is greater than the top value.

`( a b -- flag )`

```z80
_gt:
            pop     hl                  ; Pop first operand (m)
            pop     de                  ; Pop second operand (n)
            jp      $0116               ; Jump into signed less-than evaluation
```

---

### <a name="terse-word-30-3d"></a><span>0=</span>

Return a condition indicating zero.

`( n -- flag )`

```text
_zeroequal:
            ld      de,$0000            ; Load 0 as second operand
            jp      $00F7               ; Jump into equal comparison routine
```

---

### <a name="terse-word-32-44-55-50"></a><span>2DUP</span>

Duplicate the top two stack cells.

`( a b -- a b a b )`

```text
_2DUP:
            pop     hl                  ; Pop top value from parameter stack
            pop     de                  ; Pop second value from parameter stack
            push    de                  ; Push second value back
            push    hl                  ; Push top value back
            push    de                  ; Push duplicate of second value
            push    hl                  ; Push duplicate of top value
            jp      (iy)                ; Return to TERSE inner interpreter
```

---

### <a name="terse-word-41-4e-44"></a><span>AND</span>

Bitwise AND of two values.

`( a b -- result )`

```text
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
```

**Used by:** <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-46-4c-53-48-4d-45"><code>FLSHME</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-54-42-41-4c-4c-50-52-43"><code>TBALLPRC</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-64-70-6f-73-74"><code>dpost</code></a>.

---

### <a name="terse-word-41-52-52-41-59"></a><span>ARRAY</span>

Allocate/name an indexed cell array from a the size.

`( size -- )`

```text
_ARRAY:
            pop     hl                  ; Pop array index from parameter stack
            add     hl,hl               ; Double index for 16-bit word offset
            jp      $0062               ; Jump to add inline base address and push
```

**Used by:** <a href="#terse-word-4e-44-55-50"><code>NDUP</code></a>.

---

### <a name="terse-word-41-53-4d"></a><span>ASM</span>

The DNA TERSE 81 Glossary defines this host dictionary operation. The host implementation is not part of the Extra Bases target ROM.

`( -- )`

Select the Z80 assembler vocabulary in the development host.

**1979 XC host reference — vocabulary adapter only.** `CODE` invokes this assembler vocabulary entry; the uploaded 1979 image provides the binding at `$6A70`, which jumps to the host implementation at `$1EC4`. The host implementation body is outside this XC image.

```z80
xt_6a70_alias_ASM: ; alias_ASM
        JP code_1ec4_ASM ; $6A70
```


---

### <a name="terse-word-42-21"></a><span>B!</span>

Store one byte.

`( byte address -- )`

```text
_Bbang:
            pop     hl                  ; Pop target byte-address
            pop     de                  ; Pop byte value
            ld      (hl),e              ; Store low-order byte to memory
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-44-50-43-4e"><code>DPCN</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-46-4f-55-4c-54-49-4d-45"><code>FOULTIME</code></a>, <a href="#terse-word-47-45-54-46"><code>GETF</code></a>, <a href="#terse-word-47-52-4e-44-52-41-43-54-49-4f-4e"><code>GRNDRACTION</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-48-49-54-44-53-54"><code>HITDST</code></a>, <a href="#terse-word-48-52-42-59-32"><code>HRBY2</code></a>, <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>, <a href="#terse-word-49-4e-4e-4f-44-44-53"><code>INNODDS</code></a>, <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-53-42-21"><code>SB!</code></a>, <a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45"><code>STRIKETIME</code></a>, <a href="#terse-word-53-54-52-49-4e-47-47-4f"><code>STRINGGO</code></a>, <a href="#terse-word-53-54-52-49-4e-47-50-52-43"><code>STRINGPRC</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>, <a href="#terse-word-5a-45-52-4f-52-41-4d"><code>ZERORAM</code></a>.

---

### <a name="terse-word-42-40"></a><span>B@</span>

Fetch one byte.

`( address -- byte )`

```text
_Bat:
            pop     hl                  ; Pop memory address from parameter stack
            ld      e,(hl)              ; Fetch byte from memory address
            ld      d,$00               ; Zero-extend high byte
            push    de                  ; Push 16-bit zero-extended value
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-43-48-4b-46-4c-53-48-53-54-41-59"><code>CHKFLSHSTAY</code></a>, <a href="#terse-word-43-48-4b-47-4d-43-4e-54"><code>CHKGMCNT</code></a>, <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-44-4f-53-42-41-4c-4c"><code>DOSBALL</code></a>, <a href="#terse-word-44-4f-53-4f-55-54"><code>DOSOUT</code></a>, <a href="#terse-word-44-4f-53-53-54-52-49-4b-45"><code>DOSSTRIKE</code></a>, <a href="#terse-word-44-50-31-32-43-4e"><code>DP12CN</code></a>, <a href="#terse-word-44-50-43-4e"><code>DPCN</code></a>, <a href="#terse-word-46-4f-55-4c-54-49-4d-45"><code>FOULTIME</code></a>, <a href="#terse-word-47-45-54-46"><code>GETF</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-48-52-42-59-32"><code>HRBY2</code></a>, <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>, <a href="#terse-word-49-4e-4e-4f-44-44-53"><code>INNODDS</code></a>, <a href="#terse-word-49-4e-53-43-4e"><code>INSCN</code></a>, <a href="#terse-word-49-4e-53-54-52-43"><code>INSTRC</code></a>, <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-52-55-4e-31-43-48-4b-31-53-54"><code>RUN1CHK1ST</code></a>, <a href="#terse-word-52-55-4e-31-43-48-4b-32-4e-44"><code>RUN1CHK2ND</code></a>, <a href="#terse-word-52-55-4e-32-43-48-4b"><code>RUN2CHK</code></a>, <a href="#terse-word-52-55-4e-32-43-48-4b-31-32-4e-44"><code>RUN2CHK12ND</code></a>, <a href="#terse-word-52-55-4e-32-43-48-4b-31-53-54"><code>RUN2CHK1ST</code></a>, <a href="#terse-word-52-55-4e-33-43-48-4b"><code>RUN3CHK</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>, <a href="#terse-word-53-43-4f-52-45-4d-45"><code>SCOREME</code></a>, <a href="#terse-word-53-50-4c-52"><code>SPLR</code></a>, <a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45"><code>STRIKETIME</code></a>, <a href="#terse-word-53-54-52-49-4e-47-50-52-43"><code>STRINGPRC</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>, <a href="#terse-word-54-43-4e-54"><code>TCNT</code></a>, <a href="#terse-word-54-45-52-53-45-43-48-4b"><code>TERSECHK</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>, <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>, <a href="#terse-word-57-55-50-57-52-54"><code>WUPWRT</code></a>.

---

### <a name="terse-word-42-41-52-52-41-59"></a><span>BARRAY</span>

Create a named array of size uninitialized bytes; indexing the resulting word returns the byte address.

`( size -- )`

**1979 XC host reference**

```forth
: BARRAY G79-BARRAY ;
: G79-BARRAY
  G79XC DEFINITIONS
  0 pv
  <BUILDS
    G79-ALLOC
    0 prnt, IMMED
    G79XC DEFINITIONS
  (DOES>)
    ref BTLIT ;
```

---

### <a name="terse-word-42-45-47-49-4e"></a><span>BEGIN</span>

Immediate XC wrapper that records a loop's object address.

`( -- )`

```terse
: BEGIN } XC-BEGIN { ;
```

**Used by:** <a href="#terse-word-49-4e-53-54-52-43"><code>INSTRC</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>.

---

### <a name="terse-word-43-4f-44-45"></a><span>CODE</span>

Create a dictionary word implemented in assembler; enter assembler vocabulary for the definition.

`( -- )`

**1979 XC host reference**

```forth
: CODE
  G79VERBS DEFINITIONS
  1 pv
  <BUILDS
    G79-HERE 1 prnt, IMMED
    G79XC DEFINITIONS ASM
  (DOES>)
    G79-XCSTATE @ IF
      ref @ byt, p
    ELSE
      errtype
      ." VERB NOT EXECUTED" .ABORT
    THEN ;
```

---

### <a name="terse-word-43-4f-4e-53-54-41-4e-54"></a><span>CONSTANT</span>

Create a named word whose execution pushes its defining value.

`( value -- )`

**1979 XC host reference**

```forth
: CONSTANT G79-CONSTANT ;
: G79-CONSTANT
  G79XC DEFINITIONS
  0 pv
  <BUILDS
    0 prnt, IMMED
    G79XC DEFINITIONS
  (DOES>)
    ref XCLIT ;
```

---

### <a name="terse-word-44-45-43-49-4d-41-4c"></a><span>DECIMAL</span>

Select decimal numeric conversion base.

`( -- )`

**1982 XC System host reference**

```forth
: DECIMAL 0A BASE ! ;
```

---

### <a name="terse-word-44-52-4f-50"></a><span>DROP</span>

Discard the top stack cell.

`( x -- )`

```text
_DROP:
            pop     hl                  ; Pop and discard top value from stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-43-50-4f-53-54"><code>CPOST</code></a>, <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-44-4f-53-42-41-4c-4c"><code>DOSBALL</code></a>, <a href="#terse-word-44-4f-53-4f-55-54"><code>DOSOUT</code></a>, <a href="#terse-word-46-4f-55-4c-54-49-4d-45"><code>FOULTIME</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-49-4e-4e-4f-44-44-53"><code>INNODDS</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>, <a href="#terse-word-4f-55-54-4c-49-4e-45"><code>OUTLINE</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-53-54-52-49-4e-47-47-4f"><code>STRINGGO</code></a>, <a href="#terse-word-53-57-2b-33-30"><code>SW+30</code></a>, <a href="#terse-word-53-57-2b-34-35"><code>SW+45</code></a>, <a href="#terse-word-53-57-2b-39-30"><code>SW+90</code></a>, <a href="#terse-word-53-57-2d-33-30"><code>SW-30</code></a>, <a href="#terse-word-53-57-2d-34-35"><code>SW-45</code></a>, <a href="#terse-word-53-57-2d-39-30"><code>SW-90</code></a>, <a href="#terse-word-53-57-30"><code>SW0</code></a>, <a href="#terse-word-54-45-52-53-45-43-48-4b"><code>TERSECHK</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>, <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>, <a href="#terse-word-64-70-6f-73-74"><code>dpost</code></a>.

---

### <a name="terse-word-44-55-50"></a><span>DUP</span>

Duplicate the top stack cell.

`( x -- x x )`

```text
_DUP:
            pop     hl                  ; Pop top value from parameter stack
            push    hl                  ; Push first copy back onto stack
            push    hl                  ; Push second copy onto stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-4c-49-4e-45"><code>DLINE</code></a>, <a href="#terse-word-44-4f-53-42-41-4c-4c"><code>DOSBALL</code></a>, <a href="#terse-word-44-4f-53-4f-55-54"><code>DOSOUT</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-46-4c-53-48-4d-45"><code>FLSHME</code></a>, <a href="#terse-word-46-4f-55-4c-54-49-4d-45"><code>FOULTIME</code></a>, <a href="#terse-word-47-52-4e-44-52-41-43-54-49-4f-4e"><code>GRNDRACTION</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>, <a href="#terse-word-49-4e-4e-4f-44-44-53"><code>INNODDS</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-50-55-50"><code>PUP</code></a>, <a href="#terse-word-52-45-43-4c-49-4e-45"><code>RECLINE</code></a>, <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-53-43-4f-52-45-4d-45"><code>SCOREME</code></a>, <a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45"><code>STRIKETIME</code></a>, <a href="#terse-word-53-54-52-49-4e-47-50-52-43"><code>STRINGPRC</code></a>, <a href="#terse-word-53-57-2b-33-30"><code>SW+30</code></a>, <a href="#terse-word-53-57-2b-34-35"><code>SW+45</code></a>, <a href="#terse-word-53-57-2d-33-30"><code>SW-30</code></a>, <a href="#terse-word-53-57-2d-34-35"><code>SW-45</code></a>, <a href="#terse-word-53-57-30"><code>SW0</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>, <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>, <a href="#terse-word-57-55-50-47-4f"><code>WUPGO</code></a>.

---

### <a name="terse-word-45-4c-53-45"></a><span>ELSE</span>

Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch.

`( -- )`

```terse
: ELSE } XC-ELSE { ;
```

---

### <a name="terse-word-45-4e-44"></a><span>END</span>

Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true.

`( flag -- )`

```terse
: END } XC-END { ;
```

**Used by:** <a href="#terse-word-49-4e-53-54-52-43"><code>INSTRC</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>.

---

### <a name="terse-word-48-45-52-45"></a><span>HERE</span>

The DNA TERSE 81 Glossary defines this host dictionary operation. The host implementation is not part of the Extra Bases target ROM.

`( -- address )`

Return the address of the next free dictionary location.

**1979 XC host reference**

```forth
: HERE G79-HERE ;
: G79-HERE G79-ROMHERE @ ;
```

---

### <a name="terse-word-48-45-58"></a><span>HEX</span>

Select hexadecimal numeric conversion base.

`( -- )`

**1982 XC System host reference**

```forth
: HEX 10 BASE ! ;
```

---

### <a name="terse-word-49-46"></a><span>IF</span>

Immediate XC wrapper that emits a conditional target branch through XC-IF.

`( flag -- )`

```terse
: IF } XC-IF { ;
```

---

### <a name="terse-word-49-4e-50"></a><span>INP</span>

Read an 8-bit input-port value and push it zero-extended.

`( port -- value )`

```z80
_INP:
            exx                         ; Save TERSE VM registers in alternate set
            pop     bc                  ; Port address
            in      l,(c)               ; Read byte from hardware port
            ld      h,$00               ; Zero-extend input value
            push    hl                  ; Push result onto parameter stack
            exx                         ; Restore TERSE VM registers
            jp      (iy)                ; Resume TERSE interpreter
```

---

### <a name="terse-word-4c-49-54"></a><span>LIT</span>

Fetch the next inline dictionary cell and push it as a 16-bit literal.

`( -- value )`

```z80
_LITERAL:
            ld      a,(bc)              ; Read low byte from instruction pointer
            inc     bc
            ld      l,a
            ld      a,(bc)              ; Read high byte from instruction pointer
            inc     bc
            ld      h,a
            push    hl                  ; Push 16-bit literal
            jp      (iy)                ; Resume TERSE interpreter
```

---

### <a name="terse-word-4f-52"></a><span>OR</span>

Bitwise inclusive OR of two values.

`( a b -- result )`

```text
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
```

**Used by:** <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-64-70-6f-73-74"><code>dpost</code></a>.

---

### <a name="terse-word-4f-55-54-50"></a><span>OUTP</span>

Write the low byte of a value to a hardware output port.

`( value port -- )`

```z80
_OUTP:
            exx                         ; Save TERSE VM registers in alternate set
            pop     bc                  ; Port address
            pop     hl                  ; Output value (low byte L)
            out     (c),l               ; Write byte to hardware port
            exx                         ; Restore TERSE VM registers
            jp      (iy)                ; Resume TERSE interpreter
```

---

### <a name="terse-word-4f-56-45-52"></a><span>OVER</span>

Copy the second stack cell to the top.

`( a b -- a b a )`

```text
_OVER:
            pop     hl                  ; Pop top value from parameter stack
            pop     de                  ; Pop second value from parameter stack
            push    de                  ; Push second value back
            push    hl                  ; Push top value back
            push    de                  ; Push copy of second value onto stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-46-4c-53-48-4d-45"><code>FLSHME</code></a>, <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>, <a href="#terse-word-4f-55-54-4c-49-4e-45"><code>OUTLINE</code></a>, <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>, <a href="#terse-word-64-70-6f-73-74"><code>dpost</code></a>.

---

### <a name="terse-word-52-4f-54"></a><span>ROT</span>

Rotate the top three stack cells.

`( a b c -- b c a )`

```text
_ROT:
            pop     de                  ; Pop top value (first item)
            pop     hl                  ; Pop second value
            ex      (sp),hl             ; Swap second value with third value on stack
            push    de                  ; Push top value into second position
            push    hl                  ; Push third value into top position
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-53-42-41-4c-4c-31"><code>SBALL1</code></a>, <a href="#terse-word-53-42-41-4c-4c-32"><code>SBALL2</code></a>, <a href="#terse-word-53-42-41-4c-4c-33"><code>SBALL3</code></a>, <a href="#terse-word-53-46-4f-55-4c"><code>SFOUL</code></a>, <a href="#terse-word-53-48-4f-4d-45-52"><code>SHOMER</code></a>, <a href="#terse-word-53-4f-55-54-31"><code>SOUT1</code></a>, <a href="#terse-word-53-4f-55-54-32"><code>SOUT2</code></a>, <a href="#terse-word-53-4f-55-54-33"><code>SOUT3</code></a>, <a href="#terse-word-53-53-41-46-45"><code>SSAFE</code></a>, <a href="#terse-word-53-53-54-52-49-4b-45-31"><code>SSTRIKE1</code></a>, <a href="#terse-word-53-53-54-52-49-4b-45-32"><code>SSTRIKE2</code></a>, <a href="#terse-word-53-57-41-4c-4b"><code>SWALK</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-53-57-41-50"></a><span>SWAP</span>

Exchange the top two stack cells.

`( a b -- b a )`

```text
_SWAP:
            pop     hl                  ; Pop top value from parameter stack
            pop     de                  ; Pop second value from parameter stack
            push    hl                  ; Push top value into second position
            push    de                  ; Push second value into top position
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>, <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>, <a href="#terse-word-52-45-43-4c-49-4e-45"><code>RECLINE</code></a>, <a href="#terse-word-53-21"><code>S!</code></a>, <a href="#terse-word-53-42-21"><code>SB!</code></a>, <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>, <a href="#terse-word-64-70-6f-73-74"><code>dpost</code></a>.

---

### <a name="terse-word-54-48-45-4e"></a><span>THEN</span>

Immediate XC wrapper that resolves a saved target branch destination.

`( -- )`

```terse
: THEN } XC-THEN { ;
```

---

### <a name="terse-word-56-41-52-49-41-42-4c-45"></a><span>VARIABLE</span>

Define a named 16-bit variable; the 1979 XC wrapper discards its incoming value before allocation.

`( value -- )`

**1979 XC host reference**

```forth
: VARIABLE
  DROP 2 G79-VARI ;
: G79-VARI
  G79XC DEFINITIONS
  0 pv
  <BUILDS
    G79-ALLOC
    0 prnt, IMMED
    G79XC DEFINITIONS
  (DOES>)
    ref XCLIT ;
```

---

### <a name="terse-word-58-4f-52"></a><span>XOR</span>

Bitwise exclusive OR of two values.

`( a b -- result )`

```text
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
```

**Used by:** <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-64-70-6f-73-74"><code>dpost</code></a>.

---

### <a name="terse-word-5d-27-5b"></a><span>]'[</span>

Source-level compiler/TERSE definition shown below.

`( -- )`

```text
: ]'[ [COMPILE] ' ;
```

---

### <a name="terse-word-5e"></a><span>^</span>

Uses ABVOLS and MCVOLS to compose game logic.

`( -- )`

```text
{ : ^ } EF ABVOLS 0F MCVOLS { ; }
```

**Calls:** <a href="#terse-word-41-42-56-4f-4c-53"><code>ABVOLS</code></a>, <a href="#terse-word-4d-43-56-4f-4c-53"><code>MCVOLS</code></a>.

---

### <a name="terse-word-3c-49-4e-54-45-52-52-55-50-54-53"></a><span>&lt;INTERRUPTS</span>

Mark the start of interrupt data.

`( -- )`

```text
{ : <INTERRUPTS } DATA HERE { ; }
```

**Calls:** <a href="#terse-word-48-45-52-45"><code>HERE</code></a>.

---

### <a name="terse-word-41-42-56-4f-4c-53"></a><span>ABVOLS</span>

Emit the music volume command.

`( volume -- )`

```text
{ : ABVOLS } 16 B, B, { ; }
```

**Used by:** <a href="#terse-word-43-4d-41-4a-4f-52"><code>CMAJOR</code></a>, <a href="#terse-word-51-55-49-45-54"><code>QUIET</code></a>, <a href="#terse-word-52-45-53-54"><code>REST</code></a>, <a href="#terse-word-5e"><code>^</code></a>.

---

### <a name="terse-word-41-43-54-2c"></a><span>ACT,</span>

Emit a playaction record.

`( -- )`

```text
{ : ACT, } , B, , , { ; }
```

**Used by:** <a href="#terse-word-42-41-43-54-2c"><code>BACT,</code></a>, <a href="#terse-word-4c-43-42-2c"><code>LCB,</code></a>, <a href="#terse-word-52-43-42-2c"><code>RCB,</code></a>, <a href="#terse-word-53-54-50-2c"><code>STP,</code></a>.

---

### <a name="terse-word-41-4e-4f-54-45"></a><span>ANOTE</span>

Emit a channel A note followed by its duration.

`( duration tone -- )`

```text
{ : ANOTE } ATONE DURATION { ; }
```

**Calls:** <a href="#terse-word-41-54-4f-4e-45"><code>ATONE</code></a>, <a href="#terse-word-44-55-52-41-54-49-4f-4e"><code>DURATION</code></a>.

---

### <a name="terse-word-41-54-4f-4e-45"></a><span>ATONE</span>

Emit tone setting for channel A.

`( tone -- )`

```text
{ : ATONE } 11 B,
B, { ; }
```

**Used by:** <a href="#terse-word-41-4e-4f-54-45"><code>ANOTE</code></a>, <a href="#terse-word-4e-4f-54-45-53"><code>NOTES</code></a>, <a href="#terse-word-51-55-49-45-54"><code>QUIET</code></a>.

---

### <a name="terse-word-42-41-43-54-2c"></a><span>BACT,</span>

Emit a ball-action record.

`( -- )`

```text
{ : BACT, } BAL ACT, { ; }
```

**Calls:** <a href="#terse-word-41-43-54-2c"><code>ACT,</code></a>.

**Used by:** <a href="#terse-word-4c-4b-2c"><code>LK,</code></a>.

---

### <a name="terse-word-42-41-4c-4c-54-49-4d-45"></a><span>BALLTIME</span>

Balls process.

`( -- )`

```text
: BALLTIME ( balls process )
BALLS DUP 1+B! B@ 34 = IF SWALK MYAH WLKCNT 1+B!
CWALK OLDSTRING B! LBASE BONE 40 WALK B!
1 HLSIDE B! WHBODDS HITRUN ( start runners ) WUPGO
CLRBLST ELSE MBALL DOSBALL THEN SBO ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-53-57-41-4c-4b"><code>SWALK</code></a>, <a href="#terse-word-4d-59-41-48"><code>MYAH</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>, <a href="#terse-word-48-49-54-52-55-4e"><code>HITRUN</code></a>, <a href="#terse-word-57-55-50-47-4f"><code>WUPGO</code></a>, <a href="#terse-word-43-4c-52-42-4c-53-54"><code>CLRBLST</code></a>, <a href="#terse-word-4d-42-41-4c-4c"><code>MBALL</code></a>, <a href="#terse-word-44-4f-53-42-41-4c-4c"><code>DOSBALL</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>.

---

### <a name="terse-word-42-4c-44-53-54-2c"></a><span>BLDST,</span>

Emit the ball destination command.

`( -- )`

```text
{ : BLDST, } OPBLDST B, { ; }
```

---

### <a name="terse-word-42-4c-4d-4f-54-2c"></a><span>BLMOT,</span>

Emit the ball motion command.

`( -- )`

```text
{ : BLMOT, } OPBLMOT B, { ; }
```

---

### <a name="terse-word-42-4e-4f-54-45"></a><span>BNOTE</span>

Emit a channel B note followed by its duration.

`( duration tone -- )`

```text
{ : BNOTE } BTONE DURATION
{ ; }
```

**Calls:** <a href="#terse-word-42-54-4f-4e-45"><code>BTONE</code></a>, <a href="#terse-word-44-55-52-41-54-49-4f-4e"><code>DURATION</code></a>.

---

### <a name="terse-word-42-4f-4e-45"></a><span>BONE</span>

Store byte value 1.

`( address -- )`

```text
: BONE ( cange byte memory cell to 1 ) 1 SB! ;
```

**Calls:** <a href="#terse-word-53-42-21"><code>SB!</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-44-50-43-4e"><code>DPCN</code></a>, <a href="#terse-word-46-32-4e-44-4c-53"><code>F2NDLS</code></a>, <a href="#terse-word-46-32-4e-44-52-53"><code>F2NDRS</code></a>, <a href="#terse-word-46-42-4c-4c-53"><code>FBLLS</code></a>, <a href="#terse-word-46-42-4c-52-53"><code>FBLRS</code></a>, <a href="#terse-word-46-4c-53-48-54-4f-4e"><code>FLSHTON</code></a>, <a href="#terse-word-46-53-53-4c-53"><code>FSSLS</code></a>, <a href="#terse-word-46-53-53-52-53"><code>FSSRS</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-48-4c-4c-53"><code>HLLS</code></a>, <a href="#terse-word-48-4c-53"><code>HLS</code></a>, <a href="#terse-word-48-4d-53"><code>HMS</code></a>, <a href="#terse-word-48-52-4c-53"><code>HRLS</code></a>, <a href="#terse-word-48-52-53"><code>HRS</code></a>, <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-50-4c-52-53-45-4c-45-43-54"><code>PLRSELECT</code></a>, <a href="#terse-word-50-55-50"><code>PUP</code></a>, <a href="#terse-word-53-50-4c-52"><code>SPLR</code></a>, <a href="#terse-word-53-54-46-4c-44"><code>STFLD</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-42-54-4f-4e-45"></a><span>BTONE</span>

Emit tone setting for channel B.

`( tone -- )`

```text
{ : BTONE } 12 B, B, { ; }
```

**Used by:** <a href="#terse-word-42-4e-4f-54-45"><code>BNOTE</code></a>, <a href="#terse-word-4e-4f-54-45-53"><code>NOTES</code></a>, <a href="#terse-word-51-55-49-45-54"><code>QUIET</code></a>.

---

### <a name="terse-word-42-56"></a><span>BV</span>

Define a named byte variable.

`( -- )`

```text
{ : BV } BVARIABLE { ; }
```

**Used by:** <a href="#terse-word-42-56-3d"><code>BV=</code></a>.

---

### <a name="terse-word-42-56-3d"></a><span>BV=</span>

Uses BV to compose game logic.

`( -- )`

```text
{ : BV= } 0 BVARIABLE { ; }
```

**Calls:** <a href="#terse-word-42-56"><code>BV</code></a>.

---

### <a name="terse-word-42-5a-45-52-4f"></a><span>BZERO</span>

Store byte value 0.

`( address -- )`

```text
: BZERO ( change byte memory cell to 0 ) 0 SB! ;
```

**Calls:** <a href="#terse-word-53-42-21"><code>SB!</code></a>.

**Used by:** <a href="#terse-word-43-48-4b-46-4c-53-48-53-54-41-59"><code>CHKFLSHSTAY</code></a>, <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-4f-43-48-47-53"><code>DOCHGS</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-44-4f-48-4f-4d-45-52"><code>DOHOMER</code></a>, <a href="#terse-word-44-50-43-4e"><code>DPCN</code></a>, <a href="#terse-word-46-49-45-4c-44-57-52-54"><code>FIELDWRT</code></a>, <a href="#terse-word-47-52-4e-44-52-41-43-54-49-4f-4e"><code>GRNDRACTION</code></a>, <a href="#terse-word-48-49-54-44-53-54"><code>HITDST</code></a>, <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>, <a href="#terse-word-49-4e-53-54-52-43"><code>INSTRC</code></a>, <a href="#terse-word-50-4c-52-53-45-4c-45-43-54"><code>PLRSELECT</code></a>, <a href="#terse-word-53-43-4f-52-45-4d-45"><code>SCOREME</code></a>, <a href="#terse-word-53-54-52-49-4e-47-50-52-43"><code>STRINGPRC</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-43-3d"></a><span>C=</span>

Uses CONSTANT to compose game logic.

`( value -- )`

```text
{ : C= } CONSTANT { ; }
```

**Calls:** <a href="#terse-word-43-4f-4e-53-54-41-4e-54"><code>CONSTANT</code></a>.

---

### <a name="terse-word-43-48-47-53"></a><span>CHGS</span>

Posts CHANGE SIDES.

`( -- )`

```text
: CHGS 1C00 2000 828 A" CHANGE SIDES" SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-43-48-47-53"><code>DOCHGS</code></a>.

---

### <a name="terse-word-43-48-4b-46-4c-53-48-53-54-41-59"></a><span>CHKFLSHSTAY</span>

When isccp turn off check for wupwrt.

`( -- )`

```text
: CHKFLSHSTAY ( when isccp turn off check for wupwrt )
FLSHSTAY B@ IF FLSHSTAY BZERO FLSHCNT B@ FLSHOFF IF
DOWUP B@ IF WUPWRT WUPTON ELSE WUPFLSH B@ IF WUPWRT WUPTON
THEN THEN ELSE ( not flshcnt ) DOWUP B@ IF WUPTON ELSE
WUPFLSH B@ IF WUPTON THEN THEN THEN WUPFLSH BZERO
DOWUP BZERO THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-46-4c-53-48-4f-46-46"><code>FLSHOFF</code></a>, <a href="#terse-word-57-55-50-57-52-54"><code>WUPWRT</code></a>, <a href="#terse-word-57-55-50-54-4f-4e"><code>WUPTON</code></a>.

**Used by:** <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>.

---

### <a name="terse-word-43-48-4b-47-4d-43-4e-54"></a><span>CHKGMCNT</span>

Posts the appropriate prompt around a timed wait and returns the current credit byte.

`( -- credits )`

```text
: CHKGMCNT DP12CN C0 TWAIT DP12CN CREDITS B@ ;
```

**Calls:** <a href="#terse-word-44-50-31-32-43-4e"><code>DP12CN</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>.

**Used by:** <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-43-4d-41-4a-4f-52"></a><span>CMAJOR</span>

Initialize the C-major sound pattern.

`( -- )`

```text
{ : CMAJOR } 1C MASTER 0 NOISE EF ABVOLS 0F MCVOLS { ; }
```

**Calls:** <a href="#terse-word-4d-41-53-54-45-52"><code>MASTER</code></a>, <a href="#terse-word-4e-4f-49-53-45"><code>NOISE</code></a>, <a href="#terse-word-41-42-56-4f-4c-53"><code>ABVOLS</code></a>, <a href="#terse-word-4d-43-56-4f-4c-53"><code>MCVOLS</code></a>.

---

### <a name="terse-word-43-4e-4c-49-4e-45"></a><span>CNLINE</span>

Saves a new XIN/YIN endpoint and calls cnline from the current line state.

`( -- )`

```text
: CNLINE ( continue line to this point , given X Y )
YIN ! XIN ! cnline ;
```

**Calls:** <a href="#terse-word-63-6e-6c-69-6e-65"><code>cnline</code></a>.

**Used by:** <a href="#terse-word-46-49-45-4c-44-57-52-54"><code>FIELDWRT</code></a>, <a href="#terse-word-4f-55-54-4c-49-4e-45"><code>OUTLINE</code></a>.

---

### <a name="terse-word-43-4e-4f-54-45"></a><span>CNOTE</span>

Emit a channel C note followed by its duration.

`( duration tone -- )`

```text
{ : CNOTE } CTONE DURATION { ; }
```

**Calls:** <a href="#terse-word-43-54-4f-4e-45"><code>CTONE</code></a>, <a href="#terse-word-44-55-52-41-54-49-4f-4e"><code>DURATION</code></a>.

**Used by:** <a href="#terse-word-4e-4f-54-45-53"><code>NOTES</code></a>.

---

### <a name="terse-word-43-4f-4e-47-52"></a><span>CONGR</span>

Display the congratulatory prompt.

`( -- )`

```text
: CONGR 700 1000 828 A" CONGRATULATIONS YOU ARE VERY GOOD"
SPOST 0E00 2800 828 A" LETS PLAY AGAIN I WILL BUY" SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-43-50-4f-53-54"></a><span>CPOST</span>

Draw one character at the specified position.

`( x y options char -- )`

```text
: CPOST ( post an ascii-character on the screen ; see options )
( in- x , y , opt+ex/mag , ascii-char )
( out- character on screen )
cpost 3DROP ;
```

**Calls:** <a href="#terse-word-63-70-6f-73-74"><code>cpost</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-48-4f-4d"><code>HOM</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>, <a href="#terse-word-53-43-52-53"><code>SCRS</code></a>, <a href="#terse-word-56-49-53"><code>VIS</code></a>.

---

### <a name="terse-word-43-52-45-44-41-52-52-4f-57"></a><span>CREDARROW</span>

Update last inning arrow.

`( -- )`

```text
: CREDARROW ( update last inning arrow ) DI UPCRED BZERO
STRT1 B@ IF SELECT BONE ELSE CREDITS B@ CREDITS BZERO
DUP IF CNSW1 B@ IF GAMEOVER B@ IF CREDITS B!
CHKPLRS B@ IF ELSE SELECT BONE THEN 0
ELSE CMPLR B@ IF LINN B@ IF 2* ELSE SELECT BONE 1- 2* 1+ THEN
ELSE ( not cmplr ) DUP 1 AND CREDITS B! 0FE AND
LINN B@ IF ELSE SELECT BONE 1- THEN THEN THEN
ELSE ( not cnsw1 ) LINN B@ IF 2* ELSE SELECT BONE 1- 2* 1+
THEN THEN LINN B@ + LINN B! MLINN
CHKFLSHSTAY ELSE DROP THEN THEN EI ;
```

**Calls:** <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-43-48-4b-46-4c-53-48-53-54-41-59"><code>CHKFLSHSTAY</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-45-49"><code>EI</code></a>.

**Used by:** <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>, <a href="#terse-word-54-45-52-53-45-43-48-4b"><code>TERSECHK</code></a>.

---

### <a name="terse-word-43-54-4f-4e-45"></a><span>CTONE</span>

Emit tone setting for channel C.

`( tone -- )`

```text
{ : CTONE } 13 B, B, { ; }
```

**Used by:** <a href="#terse-word-43-4e-4f-54-45"><code>CNOTE</code></a>, <a href="#terse-word-51-55-49-45-54"><code>QUIET</code></a>.

---

### <a name="terse-word-44-45-41-43-54-2c"></a><span>DEACT,</span>

Emit vector-deactivation command.

`( -- )`

```text
{ : DEACT, } 0C B, { ; }
```

**Used by:** <a href="#terse-word-4c-43-42-2c"><code>LCB,</code></a>, <a href="#terse-word-4c-4b-2c"><code>LK,</code></a>, <a href="#terse-word-52-43-42-2c"><code>RCB,</code></a>, <a href="#terse-word-53-54-50-2c"><code>STP,</code></a>.

---

### <a name="terse-word-44-4c-49-4e-45"></a><span>DLINE</span>

Draw a line , given X Y start coor X Y ending coor.

`( x1 y1 x2 y2 -- )`

```text
: DLINE ( draw a line , given X Y start coor X Y ending coor )
YIN ! XIN ! 2DUP Y-AXIS ! X-AXIS !
SWAB ( set y for relabs ) strtline cnline ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-73-74-72-74-6c-69-6e-65"><code>strtline</code></a>, <a href="#terse-word-63-6e-6c-69-6e-65"><code>cnline</code></a>.

**Used by:** <a href="#terse-word-46-49-45-4c-44-57-52-54"><code>FIELDWRT</code></a>, <a href="#terse-word-4f-55-54-4c-49-4e-45"><code>OUTLINE</code></a>, <a href="#terse-word-52-45-43-4c-49-4e-45"><code>RECLINE</code></a>.

---

### <a name="terse-word-44-4f-43-48-47-53"></a><span>DOCHGS</span>

Flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER.

`( -- )`

```text
: DOCHGS ' CHGS FLSHTON 28 DWAIT FLSHOFF GAMEOVER BZERO ;
```

**Calls:** <a href="#terse-word-43-48-47-53"><code>CHGS</code></a>, <a href="#terse-word-46-4c-53-48-54-4f-4e"><code>FLSHTON</code></a>, <a href="#terse-word-44-57-41-49-54"><code>DWAIT</code></a>, <a href="#terse-word-46-4c-53-48-4f-46-46"><code>FLSHOFF</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>.

**Used by:** <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-44-4f-45-48-4f-4d-45-52"></a><span>DOEHOMER</span>

Display the home-run message.

`( -- )`

```text
: DOEHOMER SHOMER ;
```

**Calls:** <a href="#terse-word-53-48-4f-4d-45-52"><code>SHOMER</code></a>.

---

### <a name="terse-word-44-4f-47-4f-56-45-52"></a><span>DOGOVER</span>

Do game over.

`( -- )`

```text
: DOGOVER ( do game over )
SGO 32 OUTS B! CMSW BONE CMPT BONE PX0 2A B6 4D 8 RECTAN EIDI
8C0 INNX ! INN# BZERO GAMEOVER BZERO 9 LINN B! MLINN DI
GAMEOVER BONE LINN BZERO SCORE1 ZERO PX1 SCRS CMPLR BZERO
FLSHSTAY B@ IF FLSHSTAY BZERO FLSHOFF THEN 10 TWAIT INSCN
80 TWAIT INSCN CREDITS B@ IF SGO THEN SHILL BONE
FLSHOFF DROP 0 PLYR1UP BZERO ( plyr1up 0 ) EIDI ;
```

**Calls:** <a href="#terse-word-53-47-4f"><code>SGO</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-50-58-30"><code>PX0</code></a>, <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-45-49-44-49"><code>EIDI</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-50-58-31"><code>PX1</code></a>, <a href="#terse-word-53-43-52-53"><code>SCRS</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-46-4c-53-48-4f-46-46"><code>FLSHOFF</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>, <a href="#terse-word-49-4e-53-43-4e"><code>INSCN</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

**Used by:** <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-44-4f-48-4f-4d-45-52"></a><span>DOHOMER</span>

Erases the ball, displays HOMER, resets counts and clears the event timer.

`( -- )`

```text
: DOHOMER BALLERASE SHOMER CLRBLST SBO STRINGOFFTIMER BZERO ;
```

**Calls:** <a href="#terse-word-42-41-4c-4c-45-52-41-53-45"><code>BALLERASE</code></a>, <a href="#terse-word-53-48-4f-4d-45-52"><code>SHOMER</code></a>, <a href="#terse-word-43-4c-52-42-4c-53-54"><code>CLRBLST</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>.

---

### <a name="terse-word-44-4f-53-41-46-45"></a><span>DOSAFE</span>

Play the safe-call music and display its message.

`( -- )`

```text
: DOSAFE MSAFE SSAFE ;
```

**Calls:** <a href="#terse-word-4d-53-41-46-45"><code>MSAFE</code></a>, <a href="#terse-word-53-53-41-46-45"><code>SSAFE</code></a>.

---

### <a name="terse-word-44-4f-53-42-41-4c-4c"></a><span>DOSBALL</span>

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

`( x y options -- )`

```text
: DOSBALL BALLS B@ DUP 31 = IF DROP SBALL1 ELSE 32 = IF SBALL2
ELSE SBALL3 THEN THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-53-42-41-4c-4c-31"><code>SBALL1</code></a>, <a href="#terse-word-53-42-41-4c-4c-32"><code>SBALL2</code></a>, <a href="#terse-word-53-42-41-4c-4c-33"><code>SBALL3</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>.

---

### <a name="terse-word-44-4f-53-4f-55-54"></a><span>DOSOUT</span>

Inspect the $30-based count character and display the matching out message.

`( x y options -- )`

```text
: DOSOUT OUTS B@ DUP 31 = IF DROP SOUT1 ELSE 32 = IF SOUT2
ELSE SOUT3 THEN THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-53-4f-55-54-31"><code>SOUT1</code></a>, <a href="#terse-word-53-4f-55-54-32"><code>SOUT2</code></a>, <a href="#terse-word-53-4f-55-54-33"><code>SOUT3</code></a>.

**Used by:** <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>.

---

### <a name="terse-word-44-4f-53-53-54-52-49-4b-45"></a><span>DOSSTRIKE</span>

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

`( x y options -- )`

```text
: DOSSTRIKE STRIKES B@ 31 = IF SSTRIKE1 ELSE SSTRIKE2 THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-53-53-54-52-49-4b-45-31"><code>SSTRIKE1</code></a>, <a href="#terse-word-53-53-54-52-49-4b-45-32"><code>SSTRIKE2</code></a>.

**Used by:** <a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45"><code>STRIKETIME</code></a>.

---

### <a name="terse-word-44-50-31"></a><span>DP1</span>

Display the one-coin deposit prompt.

`( -- )`

```text
: DP1 1A00 2C00 828 A" DEPOSIT 1 COIN" SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-54-43-4e-54"><code>TCNT</code></a>.

---

### <a name="terse-word-44-50-31-32-43-4e"></a><span>DP12CN</span>

Uses B@ and SPOST to compose game logic.

`( -- )`

```text
: DP12CN CNSW1 B@ IF 300 2800 828
A" DEPOSIT 2 COINS TO CONTINUE THIS GAME" SPOST
ELSE DP1CN THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-44-50-31-43-4e"><code>DP1CN</code></a>.

**Used by:** <a href="#terse-word-43-48-4b-47-4d-43-4e-54"><code>CHKGMCNT</code></a>.

---

### <a name="terse-word-44-50-31-43-4e"></a><span>DP1CN</span>

Uses SPOST to compose game logic.

`( -- )`

```text
: DP1CN 400 2800 828 A" DEPOSIT 1 COIN TO CONTINUE THIS GAME"
SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-50-31-32-43-4e"><code>DP12CN</code></a>, <a href="#terse-word-44-50-43-4e"><code>DPCN</code></a>, <a href="#terse-word-53-4f-52-52-59"><code>SORRY</code></a>.

---

### <a name="terse-word-44-50-43-4e"></a><span>DPCN</span>

Wait for next coin.

`( -- )`

```text
: DPCN ( wait for next coin )
DP1CN CREDITS BZERO FF TWAIT FF TWAIT DP1CN CREDITS B@ IF
GAMEOVER BZERO ELSE LINN BZERO UPCRED BONE THEN CREDITS 1+B! ;
```

**Calls:** <a href="#terse-word-44-50-31-43-4e"><code>DP1CN</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

**Used by:** <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-64-70-6f-73-74"></a><span>dpost</span>

Isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.

`( x y options nibble -- x y options )`

```text
: dpost 0F AND OVER 4000 AND 4000 XOR OVER OR IF 30 +
SWAP BFFF AND SWAP ELSE DROP 20 THEN cpost ;
```

**Calls:** <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-4f-56-45-52"><code>OVER</code></a>, <a href="#terse-word-58-4f-52"><code>XOR</code></a>, <a href="#terse-word-4f-52"><code>OR</code></a>, <a href="#terse-word-53-57-41-50"><code>SWAP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-63-70-6f-73-74"><code>cpost</code></a>.

**Used by:** <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>.

---

### <a name="terse-word-44-54-43"></a><span>DTC</span>

Selects decimal and invokes the host editor.

`( -- )`

```text
{ : DTC } DECIMAL EDIT { ; }
```

**Calls:** <a href="#terse-word-44-45-43-49-4d-41-4c"><code>DECIMAL</code></a>.

---

### <a name="terse-word-44-55-52-41-54-49-4f-4e"></a><span>DURATION</span>

Emit a note-duration command.

`( duration -- )`

```text
{ : DURATION } 1 B, B, { ; }
```

**Used by:** <a href="#terse-word-41-4e-4f-54-45"><code>ANOTE</code></a>, <a href="#terse-word-42-4e-4f-54-45"><code>BNOTE</code></a>, <a href="#terse-word-43-4e-4f-54-45"><code>CNOTE</code></a>, <a href="#terse-word-52-45-53-54"><code>REST</code></a>.

---

### <a name="terse-word-44-57-41-49-54"></a><span>DWAIT</span>

Runs nested loops with interrupts enabled and disables them on return.

`( limit -- )`

```text
: DWAIT EI 0 DO FF 0 DO LOOP LOOP DI ;
```

**Calls:** <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>, <a href="#terse-word-44-49"><code>DI</code></a>.

**Used by:** <a href="#terse-word-44-4f-43-48-47-53"><code>DOCHGS</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>.

---

### <a name="terse-word-46-3d"></a><span>F=</span>

Declare a forward word with the game's source shorthand.

`( -- )`

```text
{ : F= } FORWARD { ; }
```

---

### <a name="terse-word-46-31-53-54-4c-53"></a><span>F1STLS</span>

Select the first-base left-side action.

`( -- )`

```text
: F1STLS F1STPT F1STL1ST NOACTPA 0 ;
```

---

### <a name="terse-word-46-31-53-54-52-53"></a><span>F1STRS</span>

Select the first-base right-side action.

`( -- )`

```text
: F1STRS F1STPT F1STR1ST NOACTPA 0 ;
```

---

### <a name="terse-word-46-32-4e-44-4c-53"></a><span>F2NDLS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: F2NDLS DPHIT BONE HRPT HL1ST F2NDL2ND 0 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-46-32-4e-44-52-53"></a><span>F2NDRS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: F2NDRS DPHIT BONE HRPT HL1ST F2NDR2ND 0 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-46-33-52-44-4c-53"></a><span>F3RDLS</span>

Select the third-base left-side action.

`( -- )`

```text
: F3RDLS F3RDLSS F3RDL3RD 1 ;
```

---

### <a name="terse-word-46-33-52-44-52-53"></a><span>F3RDRS</span>

Select the third-base right-side action.

`( -- )`

```text
: F3RDRS NOACTPA F3RDR3RD 1 ;
```

---

### <a name="terse-word-46-42-4c-4c-53"></a><span>FBLLS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: FBLLS NOACTPA FBLL3RD
1 THROWAROUND BONE FOUL BONE ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-46-42-4c-52-53"></a><span>FBLRS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: FBLRS FOUL BONE THROWAROUND BONE NOACTPA
FBLR1ST NOACTPA 0 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-46-49-45-4c-44-57-52-54"></a><span>FIELDWRT</span>

Write field outline.

`( -- )`

```text
: FIELDWRT ( write field outline )
FINDEX BZERO GETF GETF GETF GETF DLINE
8 0 DO GETF GETF CNLINE LOOP ;
```

**Calls:** <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-47-45-54-46"><code>GETF</code></a>, <a href="#terse-word-44-4c-49-4e-45"><code>DLINE</code></a>, <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-43-4e-4c-49-4e-45"><code>CNLINE</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>.

---

### <a name="terse-word-46-4c"></a><span>FL</span>

Set up all of background.

`( -- )`

```text
: FL ( set up all of background )
0 0A OUTP ZERORAM FLFILL ( hide incomplete background )
EI 0 PXT3 PXTYPE ! INFIELD PX1 FIELDWRT
10C0 6600 BASEPAT 4428 WRITR
1D00 8D00 DUGOUT 868 WRITR FMIRROR
2880 4C00 BASE2PAT 4428 WRITR
2800 AC00 HOMEPLATE 8808 WRITR 2600 AF00 BATD90 8828 WRITR
0C AA 6E 15 OUTLINE 400 B000 828 A" INN" SPOST
B00 AF00 8408 A" 1 2 3 4 5 6 7 8 9" SPOST
C4 AA 60 15 OUTLINE 3300 B000 828 42 CPOST
D7 AE 10 0E RECTAN 3B00 B000 828 53 CPOST
F7 AE 10 0E RECTAN 4300 B000 828 4F CPOST
EIDI 117 AE 10 0E RECTAN
( BB field write )
( Both dugouts are drawn before FMIRROR )
HOM VIS SCRS EIDI 30 DUP DUP BALLS B! STRIKES B! OUTS B! SBO
F00 SUP
300 A300 8828 A" CREDITS" SPOST C0 0A OUTP EIDI ;
```

**Calls:** <a href="#terse-word-4f-55-54-50"><code>OUTP</code></a>, <a href="#terse-word-5a-45-52-4f-52-41-4d"><code>ZERORAM</code></a>, <a href="#terse-word-46-4c-46-49-4c-4c"><code>FLFILL</code></a>, <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-49-4e-46-49-45-4c-44"><code>INFIELD</code></a>, <a href="#terse-word-50-58-31"><code>PX1</code></a>, <a href="#terse-word-46-49-45-4c-44-57-52-54"><code>FIELDWRT</code></a>, <a href="#terse-word-57-52-49-54-52"><code>WRITR</code></a>, <a href="#terse-word-46-4d-49-52-52-4f-52"><code>FMIRROR</code></a>, <a href="#terse-word-4f-55-54-4c-49-4e-45"><code>OUTLINE</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-43-50-4f-53-54"><code>CPOST</code></a>, <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-45-49-44-49"><code>EIDI</code></a>, <a href="#terse-word-48-4f-4d"><code>HOM</code></a>, <a href="#terse-word-56-49-53"><code>VIS</code></a>, <a href="#terse-word-53-43-52-53"><code>SCRS</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>, <a href="#terse-word-53-55-50"><code>SUP</code></a>.

**Used by:** <a href="#terse-word-50-4c-52-53-45-4c-45-43-54"><code>PLRSELECT</code></a>, <a href="#terse-word-50-55-50"><code>PUP</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>.

---

### <a name="terse-word-46-4c-44-44-53-54-2c"></a><span>FLDDST,</span>

Emit the fielder destination command.

`( -- )`

```text
{ : FLDDST, } 7 B, { ; }
```

---

### <a name="terse-word-46-4c-46-49-4c-4c"></a><span>FLFILL</span>

Fills the background while allowing interrupts.

`( -- )`

```text
: FLFILL EI 0 4000 3C00 FILL DI ;
```

**Calls:** <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-46-49-4c-4c"><code>FILL</code></a>, <a href="#terse-word-44-49"><code>DI</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-49-4e-53-54-52-43"><code>INSTRC</code></a>.

---

### <a name="terse-word-46-4c-53-48-4d-45"></a><span>FLSHME</span>

Executes only a nonzero address whose top two bits are clear.

`( -- )`

```text
: FLSHME FLSHWHO @ DUP 0C000 AND 0= OVER 0 <> AND IF EX ELSE DROP THEN ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-4f-56-45-52"><code>OVER</code></a>, <a href="#terse-word-45-58"><code>EX</code></a>, <a href="#terse-word-45-4c-53-45"><code>ELSE</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-54-48-45-4e"><code>THEN</code></a>.

**Used by:** <a href="#terse-word-46-4c-53-48-57-55-50"><code>FLSHWUP</code></a>.

---

### <a name="terse-word-46-4c-53-48-54-4f-4e"></a><span>FLSHTON</span>

Saves a callback and starts its timer.

`( -- )`

```text
: FLSHTON FLSHWHO ! FLSHON BONE FLSHTIME BONE ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

**Used by:** <a href="#terse-word-44-4f-43-48-47-53"><code>DOCHGS</code></a>, <a href="#terse-word-49-4e-53-43-4e"><code>INSCN</code></a>, <a href="#terse-word-57-55-50-54-4f-4e"><code>WUPTON</code></a>.

---

### <a name="terse-word-46-4f-55-4c-54-49-4d-45"></a><span>FOULTIME</span>

Foulball process.

`( -- )`

```text
: FOULTIME ( foulball process )
SFOUL STRIKES DUP B@ 32 = IF DROP
ELSE 1+B! SBO THEN ;
```

**Calls:** <a href="#terse-word-53-46-4f-55-4c"><code>SFOUL</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>.

---

### <a name="terse-word-46-4f-57-52"></a><span>FOWR</span>

Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.

`( -- )`

```text
{ : FOWR } FORWARD { ; }
```

---

### <a name="terse-word-46-53-53-4c-53"></a><span>FSSLS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: FSSLS DPHIT BONE FSSLSS HR3RD 1 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-46-53-53-52-53"></a><span>FSSRS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: FSSRS DPHIT BONE FSSRSS HR3RD 1 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-47-45-54-46"></a><span>GETF</span>

Fetches FIELD bytes sequentially.

`( -- index field-byte )`

```text
: GETF FINDEX B@ FIELD B@ FINDEX 1+B! ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

**Used by:** <a href="#terse-word-46-49-45-4c-44-57-52-54"><code>FIELDWRT</code></a>.

---

### <a name="terse-word-47-52-4e-44-52-41-43-54-49-4f-4e"></a><span>GRNDRACTION</span>

Consumes a selected hit-sector index, executes its `GSTBL` word, then installs the appropriate fielder playaction addresses.

`( sector -- )`

```text
: GRNDRACTION ( given sectnm set up infield action )
( default values ) HITOF BZERO DPHIT BZERO
FOUL BZERO
GSTBL @ EX ( ret hlside and playact )
DUP HLSIDE B! IF VPLAYACTPC 3RD ! VPLAYACTPC SS !
HLPT VPLAYACTPC PT ! HL1ST VPLAYACTPC 1ST ! HL2ND
VPLAYACTPC 2ND ! ELSE ( hit right side )
HRSS HR3RD LDINFLDPA THEN ;
```

**Calls:** <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-45-58"><code>EX</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-4c-44-49-4e-46-4c-44-50-41"><code>LDINFLDPA</code></a>.

**Used by:** <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>.

---

### <a name="terse-word-47-52-4e-44-52-48-49-54"></a><span>GRNDRHIT</span>

Computes a ground-ball sector from randomized timing and pitch direction, dispatches `GRNDRACTION`, then sets ball destination.

`( -- )`

```text
: GRNDRHIT ( grounder ) GRNDR BONE 2 VVEL BL B!
3 RND ( waited hit constant ) VDX BL 1+ B@ ( 1 , 0 -1 )
SWINGTYPE B@ SWINGTABLE @ EX DUP DUP DUP
SECTNM B! GRNDRACTION
FOUL B@ IF MFOUL 1 THROWAROUND B! CFOUL STRING B!
HLSIDE B@ IF 800 ELSE 4800 THEN VDSTX BL !
6400 VDSTY BL ! DROP DROP
ELSE ( fair ) WUPGO HITOF B@ IF 10 TOTIMER B!
TOOF BONE 3 TOOF# B!
CMPT B@ IF 35 CMOFTIMER B! THEN ELSE HITRUN LBASE BONE THEN
1- GHTBL @ VDSTX BL ! HM = IF 2C00 ELSE 3C00 THEN
VDSTY BL ! THEN HITDST ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-52-4e-44"><code>RND</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-45-58"><code>EX</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-47-52-4e-44-52-41-43-54-49-4f-4e"><code>GRNDRACTION</code></a>, <a href="#terse-word-4d-46-4f-55-4c"><code>MFOUL</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-57-55-50-47-4f"><code>WUPGO</code></a>, <a href="#terse-word-48-49-54-52-55-4e"><code>HITRUN</code></a>, <a href="#terse-word-48-49-54-44-53-54"><code>HITDST</code></a>.

**Used by:** <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>.

---

### <a name="terse-word-48-49-54-44-53-54"></a><span>HITDST</span>

Chooses hit location.

`( -- )`

```text
: HITDST ( chooses hit location ) VUPDATE# BL BZERO
THWBLPA VPLAYACTPC BL ! 82 VSTATUS BL B! ( vact )
BAL THWPA ! 2800 VX BL ! AD00 VY BL ! ;
```

**Calls:** <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

**Used by:** <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>.

---

### <a name="terse-word-48-4c-4c-53"></a><span>HLLS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: HLLS HITOF BONE NOACTPA HLL3RD 1 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-48-4c-53"></a><span>HLS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: HLS HITOF BONE HLSS HL3RD 1 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-48-4d-53"></a><span>HMS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: HMS HITOF BONE HMSS HR3RD 1 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-48-4f-4d"></a><span>HOM</span>

Draw HOME using a large initial character and the remainder of the string.

`( -- )`

```text
: HOM 4200 7A00 828 48 CPOST 4400 7F00 8828 A" OME" SPOST ;
```

**Calls:** <a href="#terse-word-43-50-4f-53-54"><code>CPOST</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-57-55-50-57-52-54"><code>WUPWRT</code></a>.

---

### <a name="terse-word-48-52-42-59-32"></a><span>HRBY2</span>

Halves HRAT.

`( -- )`

```text
: HRBY2 HRAT B@ 2/ HRAT B! ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

**Used by:** <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>.

---

### <a name="terse-word-48-52-4c-53"></a><span>HRLS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: HRLS HITOF BONE HRPT HRL1ST NOACTPA 0 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-48-52-53"></a><span>HRS</span>

Uses BONE to compose game logic.

`( -- )`

```text
: HRS HITOF BONE HRPT HR1ST HR2ND 0 ;
```

**Calls:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

---

### <a name="terse-word-49-27"></a><span>I'</span>

Emit the target's indexed immediate reference.

`( -- )`

```text
{ : I' } 0CD B, ]'[ { 2+ } , B, { ; }
```

---

### <a name="terse-word-49-43-4f-44-45"></a><span>ICODE</span>

Defines the native interrupt handler and emits its Z80 register-save prologue in the host compiler.

`( -- )`

```text
{ : ICODE } CODE { [ } ASM { ] } NEXT XTHL, D PUSH, B PUSH,
PSW PUSH, M A MOV, INLIN OUT, H INX, IPNT SHLD,
EXX, EXAF, H PUSH, D PUSH, B PUSH, PSW PUSH,
ASM { ; }
```

**Calls:** <a href="#terse-word-41-53-4d"><code>ASM</code></a>.

---

### <a name="terse-word-49-4e-45-58-54"></a><span>INEXT</span>

Emits a jump to IEX.

`( -- )`

```text
{ : INEXT } { LIT [ } ' IEX { , } ASM { ] } JMP, { ; }
```

**Calls:** <a href="#terse-word-4c-49-54"><code>LIT</code></a>, <a href="#terse-word-49-45-58"><code>IEX</code></a>, <a href="#terse-word-41-53-4d"><code>ASM</code></a>.

---

### <a name="terse-word-49-4e-4c-4f-47"></a><span>INLOG</span>

Infield master logic.

`( -- )`

```text
: INLOG ( infield master logic ) NOCATCH BZERO LBASE BZERO
OFTBLGO BONE WLKCNT BZERO NORUN BZERO
MHIT VMAGIC R1 PLAYON ! GRNDR BZERO HOMER BZERO DBLFLAG BZERO
OFPU BZERO FENCE BZERO INAIR BZERO SWINGTYPE B@ 6 = IF 0
ELSE HRAT B@ 0A RND < IF 0 ( flyb ) ELSE 1 ( grndr ) THEN
DUP HITTYPE B! THEN
IF OUTFLDHIT CMPT B@ IF 30 CMOFTIMER B! THEN
ELSE GRNDRHIT THEN ALLFLDACT ;
```

**Calls:** <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-4d-48-49-54"><code>MHIT</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-52-4e-44"><code>RND</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-41-4c-4c-46-4c-44-41-43-54"><code>ALLFLDACT</code></a>.

**Used by:** <a href="#terse-word-42-41-54-48-49-54"><code>BATHIT</code></a>.

---

### <a name="terse-word-49-4e-4e-4f-44-44-53"></a><span>INNODDS</span>

Derives IODDS from inning, computer/player swing control and bonus-inning state.

`( -- )`

```text
: INNODDS
INN# B@ CMSW B@ IF DUP 6 > IF DROP 1 ELSE 1 > IF 2 ELSE 3
THEN THEN ( cmp player hit ratio ) SPBON B@ IF DROP 4 THEN
ELSE ( player ) SPBON B@ ( bonous inning ) IF 3 > IF 1 ELSE 2
THEN ELSE 1 - IODTBL B@ THEN THEN IODDS B! ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

---

### <a name="terse-word-49-4e-53-43-4e"></a><span>INSCN</span>

Insert coin call.

`( -- )`

```text
: INSCN ( insert coin call )
SGO ' ISCN FLSHTON
CNSW1 B@ IF 0C00 2200 828 A" 1 COIN PER PLAYER 1ST INNING"
SPOST 1700 3400 828 A" 1 COIN PER PLAYER" SPOST 0F00 4600 828
A" EACH ADDITIONAL 2 INNINGS" SPOST
ELSE 1800 2600 828 A" 1 COIN 1ST INNING " SPOST
800 3C00 828 A" 1 COIN EACH ADDITIONAL 2 INNINGS " SPOST
THEN 2880 4C00 BASE2PAT 428 WRITR ;
```

**Calls:** <a href="#terse-word-53-47-4f"><code>SGO</code></a>, <a href="#terse-word-49-53-43-4e"><code>ISCN</code></a>, <a href="#terse-word-46-4c-53-48-54-4f-4e"><code>FLSHTON</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-57-52-49-54-52"><code>WRITR</code></a>.

**Used by:** <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>.

---

### <a name="terse-word-49-4e-53-54-52-43"></a><span>INSTRC</span>

Instructions.

`( -- )`

```text
: INSTRC ( instructions )
INSOUT BZERO BEGIN
FLFILL 2300 1000 828 A" PITCH" SPOST 700 4000 828
A" PRESS PITCH BUTTON TO START PITCH" SPOST 0F00 6000 828
A" ROLLERBALL CONTROLS PITCH" SPOST 6000 8000 828
A" ROLLERBALL MOVES OUTFIELDERS" SPOST
80 INSWAIT INSOUT B@ IF ELSE
FLFILL 2300 1000 828 A" BAT" SPOST B00 4000 828
A" PRESS BAT BUTTON TO SWING BAT" SPOST 500 6000 828
A" HOLD BUTTON DOWN TO ADVANCE RUNNERS" SPOST
60 INSWAIT INSOUT B@ IF ELSE
FLFILL 6000 2800 828 A" PRESS ANY BUTTON TO START GAME" SPOST
30 INSWAIT THEN THEN INSOUT B@ END ;
```

**Calls:** <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-42-45-47-49-4e"><code>BEGIN</code></a>, <a href="#terse-word-46-4c-46-49-4c-4c"><code>FLFILL</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-45-4e-44"><code>END</code></a>.

**Used by:** <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>.

---

### <a name="terse-word-49-4e-53-57-41-49-54"></a><span>INSWAIT</span>

Enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.

`( count -- )`

```text
: INSWAIT EI BEGIN FF 0 DO LOOP
14 INP 33 AND 33 < IF DROP 1 INSOUT BONE THEN
1- DUP 0= END DROP DI ;
```

**Calls:** <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-42-45-47-49-4e"><code>BEGIN</code></a>, <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>, <a href="#terse-word-49-4e-50"><code>INP</code></a>, <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-45-4e-44"><code>END</code></a>, <a href="#terse-word-44-49"><code>DI</code></a>.

**Used by:** <a href="#terse-word-49-4e-53-54-52-43"><code>INSTRC</code></a>.

---

### <a name="terse-word-49-4e-54-45-52-52-55-50-54-53-3e"></a><span>INTERRUPTS&gt;</span>

Emit the interrupt-vector dispatch jump.

`( -- )`

```text
{ : INTERRUPTS> } { [ } ASM { ] } JMP, { ; }
```

**Calls:** <a href="#terse-word-41-53-4d"><code>ASM</code></a>.

---

### <a name="terse-word-49-4e-54-48-49-47-48-52-45-53"></a><span>INTHIGHRES</span>

Intialize screen for commercial mode.

`( -- )`

```text
: INTHIGHRES ( intialize screen for commercial mode )
1 8 OUTP ( con,com port ) C0 0A OUTP ( vertbl )
0 9 OUTP ( horzcb ) ;
```

**Calls:** <a href="#terse-word-4f-55-54-50"><code>OUTP</code></a>.

**Used by:** <a href="#terse-word-50-55-50"><code>PUP</code></a>.

---

### <a name="terse-word-49-53-43-4e"></a><span>ISCN</span>

Display the V15 instruction message.

`( -- )`

```text
: ISCN 1C00 1000 828 A" V15" SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-49-4e-53-43-4e"><code>INSCN</code></a>.

---

### <a name="terse-word-4c-41-42-4c-45"></a><span>LABLE</span>

Provide the original source's label-definition alias.

`( -- )`

```text
{ : LABLE } DATA { ; }
```

---

### <a name="terse-word-4c-43-42-2c"></a><span>LCB,</span>

Uses ACT, and DEACT, to compose game logic.

`( -- )`

```text
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }
```

**Calls:** <a href="#terse-word-41-43-54-2c"><code>ACT,</code></a>, <a href="#terse-word-44-45-41-43-54-2c"><code>DEACT,</code></a>.

---

### <a name="terse-word-4c-44-49-4e-46-4c-44-50-41"></a><span>LDINFLDPA</span>

Consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.

`( -- )`

```text
: LDINFLDPA VPLAYACTPC 3RD ! VPLAYACTPC SS ! VPLAYACTPC 2ND !
VPLAYACTPC 1ST ! VPLAYACTPC PT ! ;
```

**Used by:** <a href="#terse-word-47-52-4e-44-52-41-43-54-49-4f-4e"><code>GRNDRACTION</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>.

---

### <a name="terse-word-4c-44-50-43"></a><span>LDPC</span>

Emit/load the music program-counter value.

`( -- )`

```text
{ : LDPC } 3 B, , { ; }
```

**Used by:** <a href="#terse-word-51-55-49-54"><code>QUIT</code></a>.

---

### <a name="terse-word-4c-44-50-43-43"></a><span>LDPCC</span>

Emit/load a music program-counter command.

`( -- )`

```text
{ : LDPCC } 2 B, , { ; }
```

---

### <a name="terse-word-4c-4b-2c"></a><span>LK,</span>

Uses BACT, and DEACT, to compose game logic.

`( -- )`

```text
{ : LK, } 0 0 0 BACT, DEACT, { ; }
```

**Calls:** <a href="#terse-word-42-41-43-54-2c"><code>BACT,</code></a>, <a href="#terse-word-44-45-41-43-54-2c"><code>DEACT,</code></a>.

---

### <a name="terse-word-4c-53-45-54-54-46-43-4f-4f-52"></a><span>LSETTFCOOR</span>

Set take field coor & status -active , xpand.

`( -- )`

```text
: LSETTFCOOR ( set take field coor & status -active , xpand )
VMAGIC R1 4 0 DO DUP DUP DUP DUP DUP DUP 28 SB! VXH + 25 SB!
VYH + A8 SB! VXPAND + 88 SB! VSTATUS + 1 SB!
VPATL + NOBOD S! VLENGTH + ( next magic ) LOOP
( pt ) 8 0 DO DUP DUP DUP DUP DUP 28 SB! ( flders )
VXH + PLYR1UP B@ IF 1B ELSE 36 THEN SB!
VYH + 93 SB! VXPAND + 88 SB! VPATL + NOBOD S!
VLENGTH + ( nxt magic ) LOOP DROP
28 VMAGIC BL ! NOBOD VPAT BL ! 88 VXPAND BL B! 2 VSTATUS BL B!
10 VSTATUS PT B! 20 VSTATUS RF B!
20 VSTATUS LF B! 20 VSTATUS CF B! 3 OFTFCNT B!
7 FLDOPCODE B! 6 TBLOPCODE B! 5 OFOPCODE B!
( BB inning player initialization RETPA , SETTFPA )
9 OFFOPCODE B! 8 RUNOPCODE B! OPBLDST THWOPCODE B!
NBD RUNPA ! STND OFPA ! NBD TBLPA ! BAL THWPA ! ;
```

**Calls:** <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-53-42-21"><code>SB!</code></a>, <a href="#terse-word-53-21"><code>S!</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

**Used by:** <a href="#terse-word-53-45-54-54-46"><code>SETTF</code></a>.

---

### <a name="terse-word-4d-41-53-54-45-52"></a><span>MASTER</span>

Define the game's master music stream.

`( -- )`

```text
{ : MASTER } 10 B, B, { ; }
```

**Used by:** <a href="#terse-word-43-4d-41-4a-4f-52"><code>CMAJOR</code></a>.

---

### <a name="terse-word-4d-42-41-4c-4c"></a><span>MBALL</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MBALL 0 BALLSCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>.

---

### <a name="terse-word-4d-43-41-4e-4e-4f-4e"></a><span>MCANNON</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MCANNON 0 CANNONSCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-53-43-4f-52-45-4d-45"><code>SCOREME</code></a>, <a href="#terse-word-53-54-41-52-54-4d-55-53-49-43"><code>STARTMUSIC</code></a>.

---

### <a name="terse-word-4d-43-4f-49-4e"></a><span>MCOIN</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MCOIN 0 COINSCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-43-48-4b-43-4f-49-4e-31"><code>CHKCOIN1</code></a>, <a href="#terse-word-43-48-4b-43-4f-49-4e-32"><code>CHKCOIN2</code></a>.

---

### <a name="terse-word-4d-43-56-4f-4c-53"></a><span>MCVOLS</span>

Emit music-channel volume values.

`( volume -- )`

```text
{ : MCVOLS } 15 B, B, { ; }
```

**Used by:** <a href="#terse-word-43-4d-41-4a-4f-52"><code>CMAJOR</code></a>, <a href="#terse-word-51-55-49-45-54"><code>QUIET</code></a>, <a href="#terse-word-52-45-53-54"><code>REST</code></a>, <a href="#terse-word-5e"><code>^</code></a>.

---

### <a name="terse-word-4d-46-45-4e-43-45"></a><span>MFENCE</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MFENCE 0 FENCESCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-53-54-41-52-54-4d-55-53-49-43"><code>STARTMUSIC</code></a>.

---

### <a name="terse-word-4d-46-4f-55-4c"></a><span>MFOUL</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MFOUL 0 FOULSCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>.

---

### <a name="terse-word-4d-48-49-54"></a><span>MHIT</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MHIT 0 CRACKSCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>.

---

### <a name="terse-word-4d-4c-49-4e-4e"></a><span>MLINN</span>

Mark last inning.

`( -- )`

```text
: MLINN ( mark last inning ) DI PX0 2A A5 4D 3 RECTAN LINN B@
DUP DUP IF 0A < IF 8F0 SWAP 0 DO 200 + LOOP ELSE DROP 1CF0
THEN A500 IMRK 301 828 WRITE ELSE DROP DROP THEN EI ;
```

**Calls:** <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-50-58-30"><code>PX0</code></a>, <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-53-57-41-50"><code>SWAP</code></a>, <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-57-52-49-54-45"><code>WRITE</code></a>, <a href="#terse-word-45-49"><code>EI</code></a>.

**Used by:** <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-50-4c-52-53-45-4c-45-43-54"><code>PLRSELECT</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-4d-4f-50-45-4e-45-52-53"></a><span>MOPENERS</span>

Uses PMUSIC to compose game logic.

`( -- )`

```text
: MOPENERS 0 TAKE-ME PMUSIC ;
```

**Calls:** <a href="#terse-word-50-4d-55-53-49-43"><code>PMUSIC</code></a>.

**Used by:** <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>.

---

### <a name="terse-word-4d-4f-55-54"></a><span>MOUT</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MOUT 0 OUTSCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>.

---

### <a name="terse-word-4d-53-41-46-45"></a><span>MSAFE</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MSAFE 0 SAFESCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-41-46-45"><code>DOSAFE</code></a>.

---

### <a name="terse-word-4d-53-54-52-49-4b-45"></a><span>MSTRIKE</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MSTRIKE 0 STRIKESCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45"><code>STRIKETIME</code></a>.

---

### <a name="terse-word-4d-59-41-48"></a><span>MYAH</span>

Uses BMUSIC to compose game logic.

`( -- )`

```text
: MYAH 0 CHEERSSCORE BMUSIC ;
```

**Calls:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-53-43-4f-52-45-4d-45"><code>SCOREME</code></a>, <a href="#terse-word-53-54-41-52-54-4d-55-53-49-43"><code>STARTMUSIC</code></a>.

---

### <a name="terse-word-4e-4f-49-53-45"></a><span>NOISE</span>

Emit a noise/sound command.

`( -- )`

```text
{ : NOISE } 17 B, B, { ; }
```

**Used by:** <a href="#terse-word-43-4d-41-4a-4f-52"><code>CMAJOR</code></a>.

---

### <a name="terse-word-4e-4f-54-45-53"></a><span>NOTES</span>

Uses ATONE and BTONE to compose game logic.

`( -- )`

```text
{ : NOTES } ATONE BTONE CNOTE { ; }
```

**Calls:** <a href="#terse-word-41-54-4f-4e-45"><code>ATONE</code></a>, <a href="#terse-word-42-54-4f-4e-45"><code>BTONE</code></a>, <a href="#terse-word-43-4e-4f-54-45"><code>CNOTE</code></a>.

---

### <a name="terse-word-4e-50-4f-53-54"></a><span>NPOST</span>

Post a bcd number on the screen ; see options.

`( x y options address length -- )`

```text
: NPOST ( post a bcd number on the screen ; see options )
( in= x , y , opt+ex/mag , variable adr , # of bytes )
( out- character on screen )
OVER + SWAP DO I B@ SWAN dpost I B@ dpost LOOP
3DROP ;
```

**Calls:** <a href="#terse-word-4f-56-45-52"><code>OVER</code></a>, <a href="#terse-word-53-57-41-50"><code>SWAP</code></a>, <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-49"><code>I</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-53-57-41-4e"><code>SWAN</code></a>, <a href="#terse-word-64-70-6f-73-74"><code>dpost</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

**Used by:** <a href="#terse-word-53-43-4f-52-45-4d-45"><code>SCOREME</code></a>.

---

### <a name="terse-word-4f-46-46-44-53-54-2c"></a><span>OFFDST,</span>

Emit the outfielder destination command.

`( -- )`

```text
{ : OFFDST, } 9 B, { ; }
```

---

### <a name="terse-word-4f-46-4d-4f-54-2c"></a><span>OFMOT,</span>

Emit the outfield motion command.

`( -- )`

```text
{ : OFMOT, } 5 B, { ; }
```

---

### <a name="terse-word-4f-4e-31-53-54-2c"></a><span>ON1ST,</span>

Emit the first-base playaction command.

`( -- )`

```text
{ : ON1ST, } 2 B, { ; }
```

---

### <a name="terse-word-4f-4e-32-4e-44-2c"></a><span>ON2ND,</span>

Emit the second-base playaction command.

`( -- )`

```text
{ : ON2ND, } 3 B, { ; }
```

---

### <a name="terse-word-4f-4e-33-52-44-2c"></a><span>ON3RD,</span>

Emit the third-base playaction command.

`( -- )`

```text
{ : ON3RD, } 4 B, { ; }
```

---

### <a name="terse-word-4f-55-54-46-4c-44-48-49-54"></a><span>OUTFLDHIT</span>

Fly ball.

`( -- )`

```text
: OUTFLDHIT ( fly ball ) 18 TOTIMER B! HITOF BONE 3 VVEL BL B!
TOOF BONE 3 TOOF# B! INAIR BONE 3000 RND 700 + ( y )
SWINGTYPE B@ 1- FHTBL @ F00 RND + ( x )
0A RND HMHTBL B@ ( hit type ) 5FF RND 5FF RND
HOMERCHK WUPGO
HITDST HRPT HL1ST VDSTX BL @ 2800 < IF ( hit left )
HL2ND HLOUTSSPA ELSE HROUT2NDPA HRSS THEN HR3RD LDINFLDPA ;
```

**Calls:** <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-52-4e-44"><code>RND</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-48-4f-4d-45-52-43-48-4b"><code>HOMERCHK</code></a>, <a href="#terse-word-57-55-50-47-4f"><code>WUPGO</code></a>, <a href="#terse-word-48-49-54-44-53-54"><code>HITDST</code></a>, <a href="#terse-word-4c-44-49-4e-46-4c-44-50-41"><code>LDINFLDPA</code></a>.

**Used by:** <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>.

---

### <a name="terse-word-4f-55-54-4c-49-4e-45"></a><span>OUTLINE</span>

Creates rectanguler outline.

`( x y width height -- )`

```text
: OUTLINE ( creates rectanguler outline )
( in- X , Y , X length , Y length ; pxtype set )
4 NDUP DROP 3 PICK + OVER 4 NDUP DLINE 5 PICK + CNLINE
3 PICK + CNLINE DROP DROP CNLINE ;
```

**Calls:** <a href="#terse-word-4e-44-55-50"><code>NDUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-4f-56-45-52"><code>OVER</code></a>, <a href="#terse-word-44-4c-49-4e-45"><code>DLINE</code></a>, <a href="#terse-word-43-4e-4c-49-4e-45"><code>CNLINE</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>.

---

### <a name="terse-word-4f-55-54-54-49-4d-45"></a><span>OUTTIME</span>

Out prc.

`( -- )`

```text
: OUTTIME ( out prc )
OUTS DUP 1+B! B@ 33 = IF MYAH
VMAGIC PT 08 0 DO DUP DUP VPLAYACTPCL + OFFFPA S!
VSTATUS + DUP B@ 80 OR F7 AND SB! VLENGTH + LOOP
DROP TAKEFIELD BONE
STRIKES B@ 33 = IF BALLERASE THEN
VMAGIC R1 4 0 DO DUP DUP VPLAYACTPCL + OFFFPA S!
VSTATUS + DUP B@ F7 AND ( res vgo ) SB!
DUP VWBASE + B@ IF DUP ( set active if onbase )
VSTATUS + DUP B@ 80 OR SB! THEN VLENGTH + LOOP DROP
PLYR1UP B@ IF INN# B@ LINN B@ = IF
SGO GAMEOVER BONE FLSHOFF THEN THEN
ELSE MOUT THEN CLRBLST SBO DOSOUT ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-4d-59-41-48"><code>MYAH</code></a>, <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-53-21"><code>S!</code></a>, <a href="#terse-word-4f-52"><code>OR</code></a>, <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-53-42-21"><code>SB!</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-42-41-4c-4c-45-52-41-53-45"><code>BALLERASE</code></a>, <a href="#terse-word-53-47-4f"><code>SGO</code></a>, <a href="#terse-word-46-4c-53-48-4f-46-46"><code>FLSHOFF</code></a>, <a href="#terse-word-4d-4f-55-54"><code>MOUT</code></a>, <a href="#terse-word-43-4c-52-42-4c-53-54"><code>CLRBLST</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>, <a href="#terse-word-44-4f-53-4f-55-54"><code>DOSOUT</code></a>.

**Used by:** <a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45"><code>STRIKETIME</code></a>.

---

### <a name="terse-word-50-4c-52-43-48-4b"></a><span>PLRCHK</span>

Reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL.

`( -- )`

```text
: PLRCHK 14 INP DUP 10 AND 10 XOR IF DROP CMPLR BONE STRTBALL
DI 800 7000 8828 A" YOU ARE" SPOST EI
ELSE STRT1 B@ IF DROP ELSE 20 AND 20 XOR IF CNSW1 B@ IF
CNSW12 BONE THEN STRTBALL THEN THEN THEN ;
```

**Calls:** <a href="#terse-word-49-4e-50"><code>INP</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-58-4f-52"><code>XOR</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>, <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>.

**Used by:** <a href="#terse-word-54-45-52-53-45-43-48-4b"><code>TERSECHK</code></a>.

---

### <a name="terse-word-50-4c-52-53-45-4c-45-43-54"></a><span>PLRSELECT</span>

Select singel player or 2 player.

`( -- )`

```text
: PLRSELECT ( select singel player or 2 player )
DI FL CHKPLRS BONE
SPLR SELECT BZERO MLINN ;
```

**Calls:** <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-53-50-4c-52"><code>SPLR</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>.

**Used by:** <a href="#terse-word-54-45-52-53-45-43-48-4b"><code>TERSECHK</code></a>.

---

### <a name="terse-word-50-50-4f-53-54"></a><span>PPOST</span>

Draw a counted string and keep drawing coordinates.

`( x y options string -- x y options )`

```text
: PPOST ( post an ascii-string on the screen leaving x y and
options for next string ; see options )
( in= x , y , opt+ex/mag , string )
( i.e. 0 0 8828 28 A" STRING" PPOST )
( out- character on screen ; x , y , opt+ex/mag )
COUNT OVER + SWAP DO I B@ cpost LOOP ;
```

**Calls:** <a href="#terse-word-43-4f-55-4e-54"><code>COUNT</code></a>, <a href="#terse-word-4f-56-45-52"><code>OVER</code></a>, <a href="#terse-word-53-57-41-50"><code>SWAP</code></a>, <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-49"><code>I</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-63-70-6f-73-74"><code>cpost</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>.

**Used by:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

---

### <a name="terse-word-50-55-50"></a><span>PUP</span>

Power up routine.

`( -- )`

```text
: PUP ( power up routine )
INTHIGHRES B1 DUP 0 OUTP 4 OUTP 7 2 OUTP
DI 0 RND# @ 1 RND# @ SCRERASE 1 RND# ! 0 RND# ! EMUSIC S10
SHILL BONE
DI FL SGO EI GAMEOVER BONE TF SENTRY ;
```

**Calls:** <a href="#terse-word-49-4e-54-48-49-47-48-52-45-53"><code>INTHIGHRES</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-4f-55-54-50"><code>OUTP</code></a>, <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-53-43-52-45-52-41-53-45"><code>SCRERASE</code></a>, <a href="#terse-word-45-4d-55-53-49-43"><code>EMUSIC</code></a>, <a href="#terse-word-53-31-30"><code>S10</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-53-47-4f"><code>SGO</code></a>, <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-50-58-30"></a><span>PX0</span>

Emit zero/white pixel patterns and define PX1/PX0 to select them.

`( -- )`

```text
: PX0 0 PXT0 PXTYPE ! ;
```

**Used by:** <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>.

---

### <a name="terse-word-50-58-31"></a><span>PX1</span>

Emit zero/white pixel patterns and define PX1/PX0 to select them.

`( -- )`

```text
: PX1 0 PXT1 PXTYPE ! ;
```

**Used by:** <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>.

---

### <a name="terse-word-51-55-49-45-54"></a><span>QUIET</span>

Uses ABVOLS and MCVOLS to compose game logic.

`( -- )`

```text
{ : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
```

**Calls:** <a href="#terse-word-41-42-56-4f-4c-53"><code>ABVOLS</code></a>, <a href="#terse-word-4d-43-56-4f-4c-53"><code>MCVOLS</code></a>, <a href="#terse-word-41-54-4f-4e-45"><code>ATONE</code></a>, <a href="#terse-word-42-54-4f-4e-45"><code>BTONE</code></a>, <a href="#terse-word-43-54-4f-4e-45"><code>CTONE</code></a>, <a href="#terse-word-51-55-49-54"><code>QUIT</code></a>.

---

### <a name="terse-word-51-55-49-54"></a><span>QUIT</span>

Uses HERE and LDPC to compose game logic.

`( -- )`

```text
{ : QUIT } 4 B, HERE LDPC { ; }
```

**Calls:** <a href="#terse-word-48-45-52-45"><code>HERE</code></a>, <a href="#terse-word-4c-44-50-43"><code>LDPC</code></a>.

**Used by:** <a href="#terse-word-51-55-49-45-54"><code>QUIET</code></a>.

---

### <a name="terse-word-52-43-42-2c"></a><span>RCB,</span>

Uses ACT, and DEACT, to compose game logic.

`( -- )`

```text
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
```

**Calls:** <a href="#terse-word-41-43-54-2c"><code>ACT,</code></a>, <a href="#terse-word-44-45-41-43-54-2c"><code>DEACT,</code></a>.

---

### <a name="terse-word-52-44-52-4e-44-4e-54-45"></a><span>RDRNDNTE</span>

Emit a randomized note with a rest interval.

`( -- )`

```text
{ : RDRNDNTE } 0 B, B, B, B, { ; }
```

---

### <a name="terse-word-52-45-43-4c-49-4e-45"></a><span>RECLINE</span>

Draws a horizontal rectangle row without consuming the five retained rectangle arguments.

`( x y width height options -- x y width height options )`

```text
: RECLINE 4 PICK 4 PICK 2DUP SWAP 6 PICK + SWAP DLINE ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-53-57-41-50"><code>SWAP</code></a>, <a href="#terse-word-44-4c-49-4e-45"><code>DLINE</code></a>.

**Used by:** <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>.

---

### <a name="terse-word-52-45-43-54-41-4e"></a><span>RECTAN</span>

In X, Y, X length, Y length, pxtype set.

`( x y width height -- )`

```text
: RECTAN ( in X, Y, X length, Y length, pxtype set )
BEGIN RECLINE ROT 1+ ROT ROT 1- DUP 0= END DROP DROP DROP
DROP ;
```

**Calls:** <a href="#terse-word-42-45-47-49-4e"><code>BEGIN</code></a>, <a href="#terse-word-52-45-43-4c-49-4e-45"><code>RECLINE</code></a>, <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-45-4e-44"><code>END</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

**Used by:** <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-53-43-52-53"><code>SCRS</code></a>.

---

### <a name="terse-word-52-45-53-54"></a><span>REST</span>

Insert a silent music interval.

`( duration -- )`

```text
{ : REST } 0 ABVOLS 0 MCVOLS 0A DURATION { ; }
```

**Calls:** <a href="#terse-word-41-42-56-4f-4c-53"><code>ABVOLS</code></a>, <a href="#terse-word-4d-43-56-4f-4c-53"><code>MCVOLS</code></a>, <a href="#terse-word-44-55-52-41-54-49-4f-4e"><code>DURATION</code></a>.

---

### <a name="terse-word-52-45-53-54-2c"></a><span>REST,</span>

Emit a resting playaction record.

`( -- )`

```text
{ : REST, } NBD , B, 0 , 0 , { ; }
```

---

### <a name="terse-word-52-45-54-50-41"></a><span>RETPA</span>

Return to position pa.

`( -- )`

```text
: RETPA ( return to position pa )
VMAGIC PT 8 0 DO DUP DUP VPLAYACTPC + TFPA S! VSTATUS + DUP
B@ 80 OR F7 AND SB! VLENGTH + LOOP DROP ;
```

**Calls:** <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-53-21"><code>S!</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-4f-52"><code>OR</code></a>, <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-53-42-21"><code>SB!</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

**Used by:** <a href="#terse-word-53-54-46-4c-44"><code>STFLD</code></a>.

---

### <a name="terse-word-52-4e-44-4e-54-45"></a><span>RNDNTE</span>

Emit a randomized musical note.

`( -- )`

```text
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
```

---

### <a name="terse-word-52-52-52-4e-44-4e-54-45"></a><span>RRRNDNTE</span>

Emit a sequence of randomized notes.

`( -- )`

```text
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
```

---

### <a name="terse-word-52-55-4e-31-43-48-4b-31-53-54"></a><span>RUN1CHK1ST</span>

Selects the runner vector for an occupied first-base slot, or delegates to the next occupancy test.

`( -- occupancy-code vector-address )`

```text
: RUN1CHK1ST VWBASE R1 B@ 1 = IF 1 VMAGIC R2
ELSE RUN1CHK2ND THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-52-55-4e-31-43-48-4b-32-4e-44"><code>RUN1CHK2ND</code></a>.

**Used by:** <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>.

---

### <a name="terse-word-52-55-4e-31-43-48-4b-32-4e-44"></a><span>RUN1CHK2ND</span>

Chooses the next runner vector according to runner 1's second-base occupancy.

`( -- occupancy-code vector-address )`

```text
: RUN1CHK2ND VWBASE R1 B@ 2 = IF RUN2CHK12ND
ELSE RUN2CHK THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-52-55-4e-32-43-48-4b-31-32-4e-44"><code>RUN2CHK12ND</code></a>, <a href="#terse-word-52-55-4e-32-43-48-4b"><code>RUN2CHK</code></a>.

**Used by:** <a href="#terse-word-52-55-4e-31-43-48-4b-31-53-54"><code>RUN1CHK1ST</code></a>.

---

### <a name="terse-word-52-55-4e-32-43-48-4b"></a><span>RUN2CHK</span>

Returns the runner code and vector for the next open base.

`( -- occupancy-code vector-address )`

```text
: RUN2CHK VWBASE R2 B@ 0 = IF 3 VMAGIC R2
ELSE RUN2CHK1ST THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-52-55-4e-32-43-48-4b-31-53-54"><code>RUN2CHK1ST</code></a>.

**Used by:** <a href="#terse-word-52-55-4e-31-43-48-4b-32-4e-44"><code>RUN1CHK2ND</code></a>.

---

### <a name="terse-word-52-55-4e-32-43-48-4b-31-32-4e-44"></a><span>RUN2CHK12ND</span>

Returns runner 2 or 3 vector based on second-base occupancy.

`( -- occupancy-code vector-address )`

```text
: RUN2CHK12ND VWBASE R2 B@ 0 = IF 2 VMAGIC R2
ELSE 4 VMAGIC R3 THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>.

**Used by:** <a href="#terse-word-52-55-4e-31-43-48-4b-32-4e-44"><code>RUN1CHK2ND</code></a>.

---

### <a name="terse-word-52-55-4e-32-43-48-4b-31-53-54"></a><span>RUN2CHK1ST</span>

Chooses runner 3 or delegates according to runner 2's first-base state.

`( -- occupancy-code vector-address )`

```text
: RUN2CHK1ST VWBASE R2 B@ 1 = IF 6 VMAGIC R3
ELSE RUN3CHK THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-52-55-4e-33-43-48-4b"><code>RUN3CHK</code></a>.

**Used by:** <a href="#terse-word-52-55-4e-32-43-48-4b"><code>RUN2CHK</code></a>.

---

### <a name="terse-word-52-55-4e-33-43-48-4b"></a><span>RUN3CHK</span>

Returns runner 3 or 4 code/vector from third runner's occupancy.

`( -- occupancy-code vector-address )`

```text
: RUN3CHK VWBASE R3 B@ 0 = IF 7 VMAGIC R3 ELSE 5 VMAGIC R4
THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>.

**Used by:** <a href="#terse-word-52-55-4e-32-43-48-4b-31-53-54"><code>RUN2CHK1ST</code></a>.

---

### <a name="terse-word-52-55-4e-44-53-54-2c"></a><span>RUNDST,</span>

Emit the runner destination command.

`( -- )`

```text
{ : RUNDST, } 8 B, { ; }
```

---

### <a name="terse-word-53-21"></a><span>S!</span>

Store cell with address-first arguments.

`( address value -- )`

```text
: S! SWAP ! ;
```

**Calls:** <a href="#terse-word-53-57-41-50"><code>SWAP</code></a>.

**Used by:** <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>.

---

### <a name="terse-word-53-31-30"></a><span>S10</span>

Starts INTERRUPTS0 through ISTART.

`( -- )`

```text
: S10 INTERRUPTS0 ISTART ;
```

**Calls:** <a href="#terse-word-49-53-54-41-52-54"><code>ISTART</code></a>.

**Used by:** <a href="#terse-word-50-55-50"><code>PUP</code></a>, <a href="#terse-word-53-54-41-52-54-4d-55-53-49-43"><code>STARTMUSIC</code></a>.

---

### <a name="terse-word-53-31-31"></a><span>S11</span>

Starts INTERRUPTS1.

`( -- )`

```text
: S11 INTERRUPTS1 ISTART ;
```

**Calls:** <a href="#terse-word-49-53-54-41-52-54"><code>ISTART</code></a>.

**Used by:** <a href="#terse-word-53-54-41-52-54-4d-55-53-49-43"><code>STARTMUSIC</code></a>.

---

### <a name="terse-word-53-42-21"></a><span>SB!</span>

Store byte with address-first arguments.

`( address value -- )`

```text
: SB! SWAP B! ;
```

**Calls:** <a href="#terse-word-53-57-41-50"><code>SWAP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

**Used by:** <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-57-55-50-47-4f"><code>WUPGO</code></a>.

---

### <a name="terse-word-53-42-41-4c-4c-31"></a><span>SBALL1</span>

Draw the BALL 1 message.

`( x y options -- )`

```text
: SBALL1 2200 2ROT A" BALL 1" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-42-41-4c-4c"><code>DOSBALL</code></a>.

---

### <a name="terse-word-53-42-41-4c-4c-32"></a><span>SBALL2</span>

Draw the BALL 2 message.

`( x y options -- )`

```text
: SBALL2 2200 2ROT A" BALL 2" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-42-41-4c-4c"><code>DOSBALL</code></a>.

---

### <a name="terse-word-53-42-41-4c-4c-33"></a><span>SBALL3</span>

Draw the BALL 3 message.

`( x y options -- )`

```text
: SBALL3 2200 2ROT A" BALL 3" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-42-41-4c-4c"><code>DOSBALL</code></a>.

---

### <a name="terse-word-53-42-4f"></a><span>SBO</span>

Posts the three $30-based count characters at their fixed positions.

`( -- )`

```text
: SBO 3700 B000 308 BALLS B@ CPOST 3F00 B000 308 STRIKES B@
CPOST 4700 B000 308 OUTS B@ CPOST ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-43-50-4f-53-54"><code>CPOST</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-44-4f-48-4f-4d-45-52"><code>DOHOMER</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-46-4f-55-4c-54-49-4d-45"><code>FOULTIME</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-53-53-41-46-45"><code>SSAFE</code></a>, <a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45"><code>STRIKETIME</code></a>.

---

### <a name="terse-word-53-43-4f-52-45-4d-45"></a><span>SCOREME</span>

Plop scores up.

`( -- )`

```text
: SCOREME ( plop scores up )
SCORESHOW DUP B@ 2 = IF 900 8C00 4308 SCORE2
ELSE 4300 8C00 4308 SCORE1 THEN 1 NPOST BZERO
HOMERUN B@ IF MCANNON ELSE MYAH THEN ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-4d-43-41-4e-4e-4f-4e"><code>MCANNON</code></a>, <a href="#terse-word-4d-59-41-48"><code>MYAH</code></a>.

---

### <a name="terse-word-53-43-52-45-52-41-53-45"></a><span>SCRERASE</span>

Erase entire screen.

`( -- )`

```text
: SCRERASE ( erase entire screen )
0 4000 3F00 FILL ;
```

**Calls:** <a href="#terse-word-46-49-4c-4c"><code>FILL</code></a>.

**Used by:** <a href="#terse-word-50-55-50"><code>PUP</code></a>.

---

### <a name="terse-word-53-43-52-53"></a><span>SCRS</span>

Clears two score rectangles and draws zero score characters.

`( -- )`

```text
: SCRS 1F 8A 18 0E RECTAN 107 8A 18 0E RECTAN
B00 8C00 308 30 CPOST 4500 8C00 308 30 CPOST ;
```

**Calls:** <a href="#terse-word-52-45-43-54-41-4e"><code>RECTAN</code></a>, <a href="#terse-word-43-50-4f-53-54"><code>CPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>.

---

### <a name="terse-word-53-45-54-46-44-53-54"></a><span>SETFDST</span>

Set up fielder destination values.

`( -- )`

```text
: SETFDST ( set up fielder destination values )
1E00 VDSTX SS ! 4800 VDSTY SS !
3000 VDSTX 1ST ! 5800 VDSTY 1ST !
1400 VDSTX 3RD ! 5B00 VDSTY 3RD !
3200 VDSTX 2ND ! 4800 VDSTY 2ND !
2800 VDSTX PT ! 6100 VDSTY PT !
1400 VDSTX LF ! 2A00 VDSTY LF !
3C00 VDSTX RF ! 2A00 VDSTY RF !
2800 VDSTX CF ! 1600 VDSTY CF ! ;
```

---

### <a name="terse-word-53-45-54-54-46"></a><span>SETTF</span>

Performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

`( -- )`

```text
: SETTF DI LSETTFCOOR STFLD SETTFPA EI ;
```

**Calls:** <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-53-54-46-4c-44"><code>STFLD</code></a>, <a href="#terse-word-53-45-54-54-46-50-41"><code>SETTFPA</code></a>, <a href="#terse-word-45-49"><code>EI</code></a>.

---

### <a name="terse-word-53-45-54-54-46-50-41"></a><span>SETTFPA</span>

Take field pa.

`( -- )`

```text
: SETTFPA ( take field pa )
TFPA2 VPLAYACTPC PT ! TFPA1 VPLAYACTPC 1ST !
TFPA1 VPLAYACTPC 2ND ! TFPA1 VPLAYACTPC 3RD !
TFPA1 VPLAYACTPC SS !
RUNBPA VPLAYACTPC R1 ! RUNBPA VPLAYACTPC R2 !
RUNBPA VPLAYACTPC R3 ! RUNBPA VPLAYACTPC R4 !
TBLPA VPLAYACTPC BL ! ;
```

**Used by:** <a href="#terse-word-53-45-54-54-46"><code>SETTF</code></a>.

---

### <a name="terse-word-53-46-4f-55-4c"></a><span>SFOUL</span>

Uses ROT and SPOST to compose game logic.

`( -- )`

```text
: SFOUL 2400 2ROT A" FOUL " SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-46-4f-55-4c-54-49-4d-45"><code>FOULTIME</code></a>.

---

### <a name="terse-word-53-47-4f"></a><span>SGO</span>

Uses SPOST to compose game logic.

`( -- )`

```text
: SGO 2000 2D00 828 A" GAME OVER" SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-49-4e-53-43-4e"><code>INSCN</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-50-55-50"><code>PUP</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-53-48-4f-4d-45-52"></a><span>SHOMER</span>

Uses ROT and SPOST to compose game logic.

`( -- )`

```text
: SHOMER 2300 2ROT A" HOMER" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-45-48-4f-4d-45-52"><code>DOEHOMER</code></a>, <a href="#terse-word-44-4f-48-4f-4d-45-52"><code>DOHOMER</code></a>.

---

### <a name="terse-word-53-4f-52-52-59"></a><span>SORRY</span>

Display the losing-player prompt.

`( -- )`

```text
: SORRY 1B00 1000 828 A" TOO BAD I WON" SPOST DP1CN ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-44-50-31-43-4e"><code>DP1CN</code></a>.

**Used by:** <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-53-4f-55-54-31"></a><span>SOUT1</span>

Draw the 1 OUT message.

`( x y options -- )`

```text
: SOUT1 2300 2ROT A" 1 OUT" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-4f-55-54"><code>DOSOUT</code></a>.

---

### <a name="terse-word-53-4f-55-54-32"></a><span>SOUT2</span>

Draw the 2 OUT message.

`( x y options -- )`

```text
: SOUT2 2200 2ROT A" 2 OUTS" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-4f-55-54"><code>DOSOUT</code></a>.

---

### <a name="terse-word-53-4f-55-54-33"></a><span>SOUT3</span>

Draw the 3 OUT message.

`( x y options -- )`

```text
: SOUT3 2200 2ROT A" 3 OUTS" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-4f-55-54"><code>DOSOUT</code></a>.

---

### <a name="terse-word-53-50-4c-52"></a><span>SPLR</span>

SPLR12/SPLR display available player choices;

`( -- )`

```text
: SPLR CNSW1 B@ IF CREDITS B@ 1 <> IF SPLR12 ELSE 0E00 2000 828
A" SELECT 1 PLAYER OR DEPOSIT" SPOST
0F00 3000 828 A" 1 MORE COIN FOR 2 PLAYERS"
SPOST STRT1 BONE THEN ELSE SPLR12 THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-53-50-4c-52-31-32"><code>SPLR12</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

**Used by:** <a href="#terse-word-50-4c-52-53-45-4c-45-43-54"><code>PLRSELECT</code></a>.

---

### <a name="terse-word-53-50-4c-52-31-32"></a><span>SPLR12</span>

SPLR12/SPLR display available player choices;

`( -- )`

```text
: SPLR12 1400 2000 828 A" SELECT 1 OR 2 PLAYERS" SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-53-50-4c-52"><code>SPLR</code></a>.

---

### <a name="terse-word-53-50-4f-53-54"></a><span>SPOST</span>

Draw a string.

`( x y options string -- )`

```text
: SPOST ( post an ascii-string on the screen ; see options )
( in= x , y , opt+ex/mag , string )
( i.e. 0 0 8828 A" STRING" SPOST )
( out- character on screen )
PPOST 3DROP ;
```

**Calls:** <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

**Used by:** <a href="#terse-word-43-48-47-53"><code>CHGS</code></a>, <a href="#terse-word-43-4f-4e-47-52"><code>CONGR</code></a>, <a href="#terse-word-44-50-31"><code>DP1</code></a>, <a href="#terse-word-44-50-31-32-43-4e"><code>DP12CN</code></a>, <a href="#terse-word-44-50-31-43-4e"><code>DP1CN</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-48-4f-4d"><code>HOM</code></a>, <a href="#terse-word-49-4e-53-43-4e"><code>INSCN</code></a>, <a href="#terse-word-49-4e-53-54-52-43"><code>INSTRC</code></a>, <a href="#terse-word-49-53-43-4e"><code>ISCN</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-53-42-41-4c-4c-31"><code>SBALL1</code></a>, <a href="#terse-word-53-42-41-4c-4c-32"><code>SBALL2</code></a>, <a href="#terse-word-53-42-41-4c-4c-33"><code>SBALL3</code></a>, <a href="#terse-word-53-46-4f-55-4c"><code>SFOUL</code></a>, <a href="#terse-word-53-47-4f"><code>SGO</code></a>, <a href="#terse-word-53-48-4f-4d-45-52"><code>SHOMER</code></a>, <a href="#terse-word-53-4f-52-52-59"><code>SORRY</code></a>, <a href="#terse-word-53-4f-55-54-31"><code>SOUT1</code></a>, <a href="#terse-word-53-4f-55-54-32"><code>SOUT2</code></a>, <a href="#terse-word-53-4f-55-54-33"><code>SOUT3</code></a>, <a href="#terse-word-53-50-4c-52"><code>SPLR</code></a>, <a href="#terse-word-53-50-4c-52-31-32"><code>SPLR12</code></a>, <a href="#terse-word-53-53-41-46-45"><code>SSAFE</code></a>, <a href="#terse-word-53-53-54-52-49-4b-45-31"><code>SSTRIKE1</code></a>, <a href="#terse-word-53-53-54-52-49-4b-45-32"><code>SSTRIKE2</code></a>, <a href="#terse-word-53-55-50"><code>SUP</code></a>, <a href="#terse-word-53-57-41-4c-4b"><code>SWALK</code></a>, <a href="#terse-word-54-43-4e-54"><code>TCNT</code></a>, <a href="#terse-word-56-49-53"><code>VIS</code></a>, <a href="#terse-word-59-4f-55-31-53-54"><code>YOU1ST</code></a>.

---

### <a name="terse-word-53-53-41-46-45"></a><span>SSAFE</span>

Display SAFE and redraw counts using SBO.

`( x y options -- )`

```text
: SSAFE 2400 2ROT A" SAFE " SPOST SBO ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-41-46-45"><code>DOSAFE</code></a>.

---

### <a name="terse-word-53-53-54-52-49-4b-45-31"></a><span>SSTRIKE1</span>

Draw the STRIKE 1 message.

`( x y options -- )`

```text
: SSTRIKE1 2000 2ROT A" STRIKE 1" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-53-54-52-49-4b-45"><code>DOSSTRIKE</code></a>.

---

### <a name="terse-word-53-53-54-52-49-4b-45-32"></a><span>SSTRIKE2</span>

Draw the STRIKE 2 message.

`( x y options -- )`

```text
: SSTRIKE2 2100 2ROT A" STRIKE 2" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-44-4f-53-53-54-52-49-4b-45"><code>DOSSTRIKE</code></a>.

---

### <a name="terse-word-53-54-46-4c-44"></a><span>STFLD</span>

Installs RETPA and TAKEFIELD.

`( -- )`

```text
: STFLD RETPA TAKEFIELD BONE ;
```

**Calls:** <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>.

**Used by:** <a href="#terse-word-53-45-54-54-46"><code>SETTF</code></a>.

---

### <a name="terse-word-53-54-50-2c"></a><span>STP,</span>

Emit a standing-action record.

`( -- )`

```text
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
```

**Calls:** <a href="#terse-word-41-43-54-2c"><code>ACT,</code></a>, <a href="#terse-word-44-45-41-43-54-2c"><code>DEACT,</code></a>.

---

### <a name="terse-word-53-54-52-49-4b-45-54-49-4d-45"></a><span>STRIKETIME</span>

Strike process.

`( -- )`

```text
: STRIKETIME ( strike process )
STRIKES DUP 1+B! B@ 33 = IF OUTTIME COUT OLDSTRING B!
ELSE MSTRIKE DOSSTRIKE THEN SBO ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-4d-53-54-52-49-4b-45"><code>MSTRIKE</code></a>, <a href="#terse-word-44-4f-53-53-54-52-49-4b-45"><code>DOSSTRIKE</code></a>, <a href="#terse-word-53-42-4f"><code>SBO</code></a>.

---

### <a name="terse-word-53-54-52-49-4e-47-47-4f"></a><span>STRINGGO</span>

Given string , stringerase.

`( string erase-flag -- )`

```text
: STRINGGO ( given string , stringerase )
7A00 ( y ) 828 ( ex/mg ) 4 PICK 4 PICK
IF STETBL ELSE
STTBL 50 STRINGOFFTIMER B! THEN @ EX
DROP DROP ;
```

**Calls:** <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-45-58"><code>EX</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

**Used by:** <a href="#terse-word-53-54-52-49-4e-47-50-52-43"><code>STRINGPRC</code></a>.

---

### <a name="terse-word-53-54-52-49-4e-47-50-52-43"></a><span>STRINGPRC</span>

String display.

`( -- )`

```text
: STRINGPRC ( string display )
STRING B@ DUP STRING BZERO
STRINGOFFTIMER B@ IF OLDSTRING B@ 1 STRINGGO OLDSTRING B!
0 ( erase or write ) STRINGGO
ELSE OLDSTRING B! ( one string ) STRINGERASE B@ STRINGGO
THEN STRINGERASE BZERO ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-53-54-52-49-4e-47-47-4f"><code>STRINGGO</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

---

### <a name="terse-word-53-54-52-54-42-41-4c-4c"></a><span>STRTBALL</span>

Runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music.

`( -- )`

```text
: STRTBALL DI INSTRC FL F00 SUP 3F00 SUP
PLYR1UP BONE SCORE1 ZERO INN# BZERO STRT1 BZERO GAMEOVER BZERO
CNSW1 B@ IF CREDARROW ELSE MLINN DI THEN SHILL BZERO
CMPLR B@ IF YOU1ST 50 DWAIT YOU1ST THEN
8C0 INNX ! 1STINN BONE TF 1STINN BZERO MOPENERS ;
```

**Calls:** <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-49-4e-53-54-52-43"><code>INSTRC</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-53-55-50"><code>SUP</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-59-4f-55-31-53-54"><code>YOU1ST</code></a>, <a href="#terse-word-44-57-41-49-54"><code>DWAIT</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-4d-4f-50-45-4e-45-52-53"><code>MOPENERS</code></a>.

**Used by:** <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>.

---

### <a name="terse-word-53-55-50"></a><span>SUP</span>

Posts UP.

`( -- )`

```text
: SUP 8C00 8828 A" UP" SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>.

---

### <a name="terse-word-53-57-2d-33-30"></a><span>SW-30</span>

Maps a −30° swing and horizontal direction into a baseball sector code.

`( random dx -- sector )`

```text
: SW-30 DUP IF 1 = IF ( x=1 ) IF F1STR ELSE HR THEN
ELSE ( x=-1 ) IF HR ELSE F2NDL THEN THEN
ELSE ( x= 0 ) DROP DUP IF 1- IF F2NDL ELSE F2NDR THEN
ELSE DROP HR THEN THEN ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

---

### <a name="terse-word-53-57-2d-34-35"></a><span>SW-45</span>

Maps a −45° swing and horizontal direction into a baseball sector code.

`( random dx -- sector )`

```text
: SW-45 DUP IF 1 = IF ( x=1 ) DROP FBR
ELSE ( x = -1 ) IF HRL ELSE F1STL THEN THEN
ELSE ( X=0 ) DROP DUP IF 1- IF F1STL ELSE F1STR THEN
ELSE DROP HRL THEN THEN ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

---

### <a name="terse-word-53-57-2d-39-30"></a><span>SW-90</span>

Ignores direction/random inputs and returns the far-right foul sector.

`( a b -- )`

```text
: SW-90 DROP DROP FBR ;
```

**Calls:** <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

---

### <a name="terse-word-53-57-2b-33-30"></a><span>SW+30</span>

Maps a +30° swing and horizontal direction into a baseball sector code.

`( random dx -- sector )`

```text
: SW+30 DUP IF 1 = IF ( x=1 ) IF HL ELSE FSSR THEN
ELSE ( x= -1 ) IF F3RDL ELSE HL THEN THEN
ELSE ( x=0 ) DROP DUP IF 1- IF FSSR ELSE FSSL THEN
ELSE DROP HL THEN THEN ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

---

### <a name="terse-word-53-57-2b-34-35"></a><span>SW+45</span>

Maps a +45° swing and horizontal direction into a baseball sector code.

`( random dx -- sector )`

```text
: SW+45 DUP IF 1 = IF ( x=1 ) IF HLL ELSE F3RDR THEN
ELSE ( x= -1 ) DROP FBL THEN
ELSE ( x=0 ) DROP DUP IF 1- IF F3RDR ELSE F3RDL THEN
ELSE DROP HLL THEN THEN ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

---

### <a name="terse-word-53-57-2b-39-30"></a><span>SW+90</span>

Discard the two inputs and return the far-left foul sector.

`( a b -- )`

```text
: SW+90 DROP DROP FBL ;
```

**Calls:** <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

---

### <a name="terse-word-53-57-30"></a><span>SW0</span>

Maps a central swing and horizontal direction into a baseball sector code.

`( random dx -- sector )`

```text
: SW0 DUP IF 1 = IF ( x=1 ) IF F2NDR ELSE HM THEN
ELSE ( x=-1 ) IF FSSL ELSE HM THEN THEN
ELSE ( x=0 ) DROP IF HM ELSE F2NDR THEN THEN ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

---

### <a name="terse-word-53-57-41-4c-4b"></a><span>SWALK</span>

Uses ROT and SPOST to compose game logic.

`( x y options -- )`

```text
: SWALK 2400 2ROT A" WALK" SPOST ;
```

**Calls:** <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>.

---

### <a name="terse-word-54-43-4e-54"></a><span>TCNT</span>

Chooses one-coin versus per-player continuation wording from CNSW12 and current credits.

`( -- )`

```text
: TCNT 700 1800 828 A" TO CONTINUE GAME AT END OF INNING" SPOST
CNSW12 B@ IF CREDITS B@ IF DP1 ELSE 0F00 2C00 828
A" DEPOSIT 1 COIN PER PLAYER" SPOST THEN ELSE DP1 THEN ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-50-31"><code>DP1</code></a>.

**Used by:** <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-54-45-52-53-45-43-48-4b"></a><span>TERSECHK</span>

Look at terse routine flags.

`( -- )`

```text
: TERSECHK ( look at terse routine flags ) 0 RND DROP
TFTIME B@ IF TF THEN SELECT B@ IF PLRSELECT THEN
CHKPLRS B@ IF PLRCHK THEN UPCRED B@ IF CREDARROW THEN ;
```

**Calls:** <a href="#terse-word-52-4e-44"><code>RND</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-50-4c-52-53-45-4c-45-43-54"><code>PLRSELECT</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>.

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-54-46"></a><span>TF</span>

Take the field.

`( -- )`

```text
: TF ( take the field )
DI ZERORAM EI 30 DUP DUP OUTS B! BALLS B! STRIKES B!
12 INP 1 AND 1 XOR CNSW1 B! ( released DIP polarity )
PLYR1UP DUP B@ 1 XOR DUP ROT B! CMPLR B@
IF DUP IF CMSW BONE ELSE CMPT BONE THEN THEN
DI SHILL B@ IF SGO DOGOVER ELSE
GAMEOVER B@ IF SGO CMPLR B@ IF SCORE1 B@ SCORE2 B@ < IF
CONGR 50 TWAIT LINN 1+B! MLINN DI CONGR
GAMEOVER BZERO SPBON BONE
ELSE SORRY C0 TWAIT SORRY CREDITS B@ IF DOCHGS
ELSE DOGOVER THEN THEN
ELSE CNSW1 B@ IF CNSW12 BZERO CREDITS B@ 1 = IF DPCN ELSE
CHKGMCNT DUP IF 1 = IF DPCN ELSE DOCHGS THEN
( BB sentry definitions    TF )
ELSE DROP DOGOVER THEN THEN CNSW12 BONE
ELSE ( no cnsw1 ) CHKGMCNT IF DOCHGS
ELSE DOGOVER THEN THEN THEN ELSE 1STINN B@ IF ELSE
DOCHGS THEN THEN THEN
( plyr1up ) IF INNX @ B700 DNTRI INN# B@ LINN B@ = IF
TCNT 30 TWAIT TCNT THEN ELSE
INN# DUP 1+B! B@ 0A = IF INN# BONE
LINN DUP B@ 9 - SB! ( new pointer ) MLINN DI
PX0 2A B6 4D 8 RECTAN 8C0 INNX ! THEN
INNX DUP @ 200 + DUP ROT ! B600 UPTRI THEN 501 828 WRITE
FLSHSTAY B@ IF WUPFLSH BONE ELSE WUPWRT WUPTON
EIDI THEN SETFDST SETTF SBO HMRFLSH BZERO 3 OFTFCNT B! INNODDS
GAMEOVER B@ IF ELSE F00 SUP 3F00 SUP ( sets "up" ) THEN
HITYET BONE MYAH S10 ;
```

**Calls:** <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-5a-45-52-4f-52-41-4d"><code>ZERORAM</code></a>, <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-49-4e-50"><code>INP</code></a>, <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-58-4f-52"><code>XOR</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-52-4f-54"><code>ROT</code></a>, <a href="#terse-word-42-4f-4e-45"><code>BONE</code></a>, <a href="#terse-word-53-47-4f"><code>SGO</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-43-4f-4e-47-52"><code>CONGR</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-42-5a-45-52-4f"><code>BZERO</code></a>, <a href="#terse-word-53-4f-52-52-59"><code>SORRY</code></a>, <a href="#terse-word-44-4f-43-48-47-53"><code>DOCHGS</code></a>, <a href="#terse-word-44-50-43-4e"><code>DPCN</code></a>, <a href="#terse-word-43-48-4b-47-4d-43-4e-54"><code>CHKGMCNT</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-54-43-4e-54"><code>TCNT</code></a>.

**Used by:** <a href="#terse-word-50-55-50"><code>PUP</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>, <a href="#terse-word-54-45-52-53-45-43-48-4b"><code>TERSECHK</code></a>.

---

### <a name="terse-word-54-48-57-2c"></a><span>THW,</span>

Emit the throw command.

`( -- )`

```text
{ : THW, } 0B B, { ; }
```

---

### <a name="terse-word-54-57-41-49-54"></a><span>TWAIT</span>

Terse wait period.

`( count -- )`

```text
: TWAIT ( terse wait period )
EI BEGIN FF 0 DO LOOP CREDITS B@ DUP IF 1 = IF CNSW12 B@ IF
ELSE DROP 1 THEN ELSE DROP 1 THEN ELSE DROP THEN
50 0 DO LOOP 1 - DUP 0= END
DROP DI ;
```

**Calls:** <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-42-45-47-49-4e"><code>BEGIN</code></a>, <a href="#terse-word-44-4f"><code>DO</code></a>, <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>, <a href="#terse-word-45-4e-44"><code>END</code></a>, <a href="#terse-word-44-49"><code>DI</code></a>.

**Used by:** <a href="#terse-word-43-48-4b-47-4d-43-4e-54"><code>CHKGMCNT</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-44-50-43-4e"><code>DPCN</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-56"></a><span>V</span>

Uses VARIABLE to compose game logic.

`( -- )`

```text
{ : V } VARIABLE { ; }
```

**Calls:** <a href="#terse-word-56-41-52-49-41-42-4c-45"><code>VARIABLE</code></a>.

**Used by:** <a href="#terse-word-56-3d"><code>V=</code></a>.

---

### <a name="terse-word-56-3d"></a><span>V=</span>

Uses V and VARIABLE to compose game logic.

`( -- )`

```text
{ : V= } 0 VARIABLE { ; }
```

**Calls:** <a href="#terse-word-56"><code>V</code></a>, <a href="#terse-word-56-41-52-49-41-42-4c-45"><code>VARIABLE</code></a>.

---

### <a name="terse-word-56-49-42-53"></a><span>VIBS</span>

Emit a vibrato setting.

`( value -- )`

```text
{ : VIBS } 14 B, B, { ; }
```

---

### <a name="terse-word-56-49-53"></a><span>VIS</span>

HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;

`( -- )`

```text
: VIS 700 7A00 828 56 CPOST 900 7F00 8828 A" ISITOR" SPOST ;
```

**Calls:** <a href="#terse-word-43-50-4f-53-54"><code>CPOST</code></a>, <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-57-55-50-57-52-54"><code>WUPWRT</code></a>.

---

### <a name="terse-word-57-48-42-4f-44-44-53"></a><span>WHBODDS</span>

Sets who is on base calculates play odds.

`( -- )`

```text
: WHBODDS ( sets who is on base calculates play odds )
VWBASE R1 B@ 0 = IF 0 VMAGIC R1
ELSE RUN1CHK1ST THEN WHOSUP ! BASESTATUS B!
36 RND SWRND# B! 10 RND PTRND# B!
( odds logic )
IODDS B@ HRAT B! SCORE2 B@ SCORE1 B@
PLYR1UP B@ IF SWAP THEN -
DUP 0 < IF -3 > IF 7 ELSE 8 THEN HRAT B!
ELSE ( player up ahead )
DUP 2 > IF HRBY2 DUP 4 > IF HRBY2 DUP 6 > IF HRBY2
THEN THEN THEN DROP THEN ;
```

**Calls:** <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-52-55-4e-31-43-48-4b-31-53-54"><code>RUN1CHK1ST</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>, <a href="#terse-word-52-4e-44"><code>RND</code></a>, <a href="#terse-word-53-57-41-50"><code>SWAP</code></a>, <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-48-52-42-59-32"><code>HRBY2</code></a>, <a href="#terse-word-44-52-4f-50"><code>DROP</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-54-48-52-4f-57-42-41-4c-4c"><code>THROWBALL</code></a>.

---

### <a name="terse-word-57-54-48-57-2c"></a><span>WTHW,</span>

Emit the wait-for-throw command.

`( -- )`

```text
{ : WTHW, } 0D B, { ; }
```

---

### <a name="terse-word-57-55-50-47-4f"></a><span>WUPGO</span>

Activates WHOSUP with runner/automatic-forward flags.

`( -- )`

```text
: WUPGO WHOSUP @ DUP VSTATUS + 81 SB! VRSTAT + 3 SB! ;
```

**Calls:** <a href="#terse-word-44-55-50"><code>DUP</code></a>, <a href="#terse-word-53-42-21"><code>SB!</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>.

---

### <a name="terse-word-57-55-50-54-4f-4e"></a><span>WUPTON</span>

Installs WUPWRT.

`( -- )`

```text
: WUPTON ' WUPWRT FLSHTON ;
```

**Calls:** <a href="#terse-word-57-55-50-57-52-54"><code>WUPWRT</code></a>, <a href="#terse-word-46-4c-53-48-54-4f-4e"><code>FLSHTON</code></a>.

**Used by:** <a href="#terse-word-43-48-4b-46-4c-53-48-53-54-41-59"><code>CHKFLSHSTAY</code></a>.

---

### <a name="terse-word-57-55-50-57-52-54"></a><span>WUPWRT</span>

Write whos up for flash.

`( -- )`

```text
: WUPWRT ( write whos up for flash )
PTAUTOTM PLYR1UP B@ IF HOM ELSE VIS THEN ;
```

**Calls:** <a href="#terse-word-50-54-41-55-54-4f-54-4d"><code>PTAUTOTM</code></a>, <a href="#terse-word-42-40"><code>B@</code></a>, <a href="#terse-word-48-4f-4d"><code>HOM</code></a>, <a href="#terse-word-56-49-53"><code>VIS</code></a>.

**Used by:** <a href="#terse-word-42-55-54-54-4f-4e-43-48-4b"><code>BUTTONCHK</code></a>, <a href="#terse-word-43-48-4b-46-4c-53-48-53-54-41-59"><code>CHKFLSHSTAY</code></a>, <a href="#terse-word-57-55-50-54-4f-4e"><code>WUPTON</code></a>.

---

### <a name="terse-word-59-4f-55-31-53-54"></a><span>YOU1ST</span>

Posts the greeting/extra-inning challenge, then continues to 306.

`( -- )`

```text
: YOU1ST 1A00 1000 828 A" YOU ARE UP 1ST" SPOST 0F00 3000 828
A" BEAT ME FOR EXTRA INNING" SPOST 1F00 5000 828
A" GOOD LUCK" SPOST ;
```

**Calls:** <a href="#terse-word-53-50-4f-53-54"><code>SPOST</code></a>.

**Used by:** <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>.

---

### <a name="terse-word-5a-45-52-4f-52-41-4d"></a><span>ZERORAM</span>

Clears $270 bytes starting at $7C30 and resets OFTFCNT.

`( -- )`

```text
: ZERORAM DI 0 7C30 270 FILL 3 OFTFCNT B! DI ;
```

**Calls:** <a href="#terse-word-44-49"><code>DI</code></a>, <a href="#terse-word-46-49-4c-4c"><code>FILL</code></a>, <a href="#terse-word-42-21"><code>B!</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>.

---

### <a name="terse-word-2b-4c-4f-4f-50"></a><span>+LOOP</span>

Uses LOOP to process game state.

`( increment -- )`

Increment consumed; IX loop frame updated or released

```text
CODE +LOOP <ASSEMBLE H POP, H A MOV, 0 X E LDX, 1 X D LDX,
D DAD, L 0 X STX, H 1 X STX,
2 X E LDX, 3 X D LDX, A ORA, D DSBC,
PSW PUSH, H POP, 7 A BIT, L A MOV, PLPOS JZ,
84 ANI, PLBACK JPE, PLDONE JMP,
( BB parameter control - reconstructed continuation )
LABEL PLPOS 84 ANI, PLBACK JPO,
LABEL PLDONE 6 D LXI, D DADX, NEXT
```

**Calls:** <a href="#terse-word-4c-4f-4f-50"><code>LOOP</code></a>.

---

### <a name="terse-word-41-4c-4c-46-4c-44-41-43-54"></a><span>ALLFLDACT</span>

Sets all fielders active.

`( -- )`

RAM: infield/outfield active flags set; returns NEXT

```text
CODE ALLFLDACT ( sets all fielders active )
' INFLDACT CALL, ' OUTFLDACT CALL, NEXT
```

**Calls:** <a href="#terse-word-49-4e-46-4c-44-41-43-54"><code>INFLDACT</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-41-43-54"><code>OUTFLDACT</code></a>.

**Used by:** <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>.

---

### <a name="terse-word-41-4e-4d-53-45-51-4c-4f-41-44"></a><span>ANMSEQLOAD</span>

Finds proper anm seq by per=#.

`( -- )`

Uses IX's current VANMH/VANML animation table pointer and VPERS# to select an indexed 16-bit animation sequence address; stores it in IX:VANMSEQH/VANMSEQL and returns natively.

```text
CODE ANMSEQLOAD ( finds proper anm seq by per=# )
( IX-proper vector add )
VANMH X H LDX, VANML X L LDX, VPERS# X A LDX,
' INDEXW CALL, ( anm seq look up )
D VANMSEQH X STX, E VANMSEQL X STX, RET,
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>.

**Used by:** <a href="#terse-word-50-4c-41-59-41-43-54"><code>PLAYACT</code></a>.

---

### <a name="terse-word-42-41-4c-4c-45-52-41-53-45"></a><span>BALLERASE</span>

Preserves BC/IY around native BLERASE and returns to TERSE.

`( -- )`

BC, IY preserved; ball cleared; returns NEXT

```text
CODE BALLERASE B PUSH, Y PUSHX, BLERASE CALL,
Y POPX, B POP, NEXT
```

**Calls:** <a href="#terse-word-42-4c-45-52-41-53-45"><code>BLERASE</code></a>.

**Used by:** <a href="#terse-word-44-4f-48-4f-4d-45-52"><code>DOHOMER</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>.

---

### <a name="terse-word-42-41-54-48-49-54"></a><span>BATHIT</span>

He hit it time to get em running.

`( -- )`

Writes HITYET, invokes INLOG with interrupts disabled, clears HITTIME, PITCHTIME and SWINGGO, then executes EI and returns natively.

```text
CODE BATHIT ( he hit it time to get em running )
HITYET STA, DI, DOVERB INLOG
A XRA, HITTIME STA, PITCHTIME STA, ( tractor ball utfld)
SWINGGO STA, EI, RET,
```

**Calls:** <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>.

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-42-41-54-48-49-54-43-48-4b"></a><span>BATHITCHK</span>

Check window for hit.

`( -- )`

Takes the swing-state entry through HL, looks up its hit window via BWTBL/INDEXW, compares ball Y/X against it, and, on a new hit, sets HITTIME and HITGOING and calls BLERASE; returns natively.

```text
CODE BATHITCHK ( check window for hit )
M A MOV, ( swing # ) A SLAR, BWTBL H LXI, ' INDEXW CALL,
VYH BL LDA, E SUB, D CMP, RNC, H INX, H INX, H PUSH,
VX BL LHLD, ' MULTHLBY4 CALL, H A MOV, H POP, M SUB, H INX,
M CMP, RNC, HITYET LDA, A ANA, RNZ, A INR,
HITTIME STA, HITGOING STA, BLERASE CALL, RET,
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>, <a href="#terse-word-4d-55-4c-54-48-4c-42-59-34"><code>MULTHLBY4</code></a>, <a href="#terse-word-42-4c-45-52-41-53-45"><code>BLERASE</code></a>.

**Used by:** <a href="#terse-word-42-41-54-53-57-49-4e-47"><code>BATSWING</code></a>.

---

### <a name="terse-word-42-41-54-53-57-49-4e-47"></a><span>BATSWING</span>

Swings bat if appropriate.

`( -- )`

Reads swing counters from RAM, calls 'BATWRITE'/'BATHITCHK', updates swing/strike state

```text
CODE BATSWING ( swings bat if appropriate )
SWINGTYPE H LXI, SWING LDA, A ANA,
0<>, IF, STRIKE STA, M A MOV, 6 CPI, ( end of swing ? )
<, IF, ' BATWRITE CALL, M INR, ' BATWRITE CALL,
HITGOING LDA, A ANA, ' BATHITCHK CZ, ( check for hit )
ELSE, A XRA, SWING STA, 18 A MVI, SWINGTIME STA,
THEN, -->
( BB interrupt )
( swing completion reset bat )
ELSE, ( swing not set ) M A MOV, 6 CPI,
=, IF, A XRA, HITGOING STA, SWINGTIME LDA, A ANA,
0=, IF, ' BATWRITE CALL, 0 M MVI, ' BATWRITE CALL,
ELSE, A DCR, SWINGTIME STA,
THEN, THEN, THEN, RET,
```

**Calls:** <a href="#terse-word-42-41-54-57-52-49-54-45"><code>BATWRITE</code></a>, <a href="#terse-word-42-41-54-48-49-54-43-48-4b"><code>BATHITCHK</code></a>.

---

### <a name="terse-word-42-41-54-57-52-49-54-45"></a><span>BATWRITE</span>

Xor bat from swingtype.

`( -- )`

HL = swing-state pointer; derives drawing parameters and calls native pattern writer; restores HL

```text
CODE BATWRITE ( xor bat from swingtype )
H PUSH, M A MOV, BSWINGTABLE H LXI, ' INDEXW CALL,
D PUSH, ( pattern add. ) Y POPX, 2600 D LXI, AF00 H LXI,
828 B LXI, ( exp/mag )
reloff CALL, relabs CALL, writep CALL,
H POP, RET,
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>, <a href="#terse-word-72-65-6c-6f-66-66"><code>reloff</code></a>, <a href="#terse-word-72-65-6c-61-62-73"><code>relabs</code></a>, <a href="#terse-word-77-72-69-74-65-70"><code>writep</code></a>.

**Used by:** <a href="#terse-word-42-41-54-53-57-49-4e-47"><code>BATSWING</code></a>.

---

### <a name="terse-word-42-43-44-2b"></a><span>BCD+</span>

Binary to decimal arithmatic.

`( a b -- bcd-sum )`

HL contains BCD sum, pushed onto parameter stack

```text
CODE BCD+ ( binary to decimal arithmatic )
( in- integer 1 , integer 2 )
( out- bcd sum of integer 1 and 2 )
H POP, D POP, E A MOV, L ADD, DAA, A L MOV,
D A MOV, H ADC, DAA, A H MOV, H PUSH, NEXT
```

---

### <a name="terse-word-42-4c-44-53-54"></a><span>BLDST</span>

Ball thrown or hit.

`( -- )`

Ball-vector update helper: computes motion/destination, handles catch/throw transitions

```text
CODE BLDST ( ball thrown or hit )
B PUSH, VVEL BL LDA,
( max delt ) ' DSTLD CALL, ' DSTCALC CALL,
LDFLAG CPI, <>, IF, A ANA, ( rd dst ) 0<>, IF,
A XRA, GRNDR STA, INAIR STA,
THROW LDA, A ANA, 0<>, IF, ( throw or hit )
NBD H LXI, THWPA SHLD, CAUGHT STA, ELSE, H PUSH, D PUSH,
HITOF LDA, A ANA, 0<>, IF,
( BB op codes for playaction defined )
CMPT LDA, A ANA, CMPOF CNZ,
HOMER LDA, A ANA, 0<>, IF, STMUSIC STA, HOMERUN STA,
CHOMER A MVI, STRING STA, 10 A MVI, HMFLSHCNT STA, 5 A MVI,
HMRCNT STA, A XRA, HOMER STA, ' KILLOF CALL, THEN,
FENCE LDA, A ANA, 0<>, IF, STMUSIC STA, FNCX LHLD,
VX BL LDED, D DAD, VDSTX BL SHLD, VY BL LHLD, FNCY LDED,
D DAD, VDSTY BL SHLD,
A XRA, FENCE STA, VACT VSTATUS X SETX, THEN, THEN,
D POP, H POP, THEN, THEN, THWDY SHLD, THWDX SDED,
THEN, THWPA H LXI, VECTPC SHLD, B POP, RET,
```

**Calls:** <a href="#terse-word-44-53-54-4c-44"><code>DSTLD</code></a>, <a href="#terse-word-44-53-54-43-41-4c-43"><code>DSTCALC</code></a>, <a href="#terse-word-43-4d-50-4f-46"><code>CMPOF</code></a>, <a href="#terse-word-4b-49-4c-4c-4f-46"><code>KILLOF</code></a>.

---

### <a name="terse-word-42-4c-4d-4f-54-49-4f-4e"></a><span>BLMOTION</span>

Set pc for ram pa table -tractor ball.

`( -- )`

Loads HL with TBLPA, stores it into VECTPC and returns natively; no TERSE parameter-stack cells are consumed.

```text
CODE BLMOTION ( set pc for ram pa table -tractor ball )
TBLPA H LXI, VECTPC SHLD, RET,
```

---

### <a name="terse-word-42-4c-50-4f-53-43-48-4b"></a><span>BLPOSCHK</span>

Branches on HITYET.

`( -- )`

IX = ball vector; checks ball/pitch position, collision flags and destination vector

```text
CODE BLPOSCHK
HITYET LDA, A ANA, 0=, IF, ( pitch check )
VYH X A LDX, BC CPI, >=, IF, HITTIME LDA, A ANA, RNZ,
HITYET LDA, A ANA, RNZ, VX PT LHLD, VDSTX BL SHLD,
VY PT LHLD, VDSTY BL SHLD, THWBLPA H LXI, VPLAYACTPC BL SHLD,
A XRA, VUPDATE# BL STA, 4 A MVI, VVEL BL STA,
81 A MVI, VSTATUS BL STA, BAL H LXI, THWPA SHLD,
STRIKE LDA, A ANA, 0<>, IF, CSTRIKE A MVI,
ELSE, CBALL A MVI, THEN, STRING STA,
A XRA, PITCHTIME STA, STRIKE STA, SWINGGO STA,
1 A MVI, HITYET STA, THROW STA, THROWAROUND STA,
ELSE, ( check for cross the plate ) 0A5 SBI, 0 CPI, RNC,
VXH X A LDX, 26 SBI, 2 CPI, RNC, 1 A MVI, STRIKE STA,
THEN,
( BB interrupt )
ELSE, ( intercept check for catch in outfield )
VYH X D LDX, 3C A MVI, D CMP, RC, NOCATCH LDA, A ANA, RNZ,
5 D MVI, OFBLCHK CALL, A ANA, RZ, INAIR LDA, A ANA, 0<>, IF,
2 A MVI, LVRSTAT CALL,
OFCATCH STA, CAUGHT STA, WHOSUP LHLD,
PLAYON SHLD, A XRA, ELSE, A INR, OFPU STA, THEN, THROWANM STA,
A INR, NOCATCH STA, Y PUSHX, H POP, WHOTHROWS SHLD,
BLERASE CALL, ' KILLOF CALL,
A XRA, OFTBLGO STA, TOOF STA, ( ofl t.o. timer ) THEN, RET,
```

**Calls:** <a href="#terse-word-4f-46-42-4c-43-48-4b"><code>OFBLCHK</code></a>, <a href="#terse-word-4c-56-52-53-54-41-54"><code>LVRSTAT</code></a>.

---

### <a name="terse-word-42-4d-55-53-49-43"></a><span>BMUSIC</span>

Consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

`( music-address -- )`

Pops the music address into HL unconditionally. If PRIORITY is zero, calls loadpc, clears NOTETIMER and sets MULTIPLE to one; otherwise leaves the current music stream and timers unchanged.

```text
CODE BMUSIC PRIORITY LDA, H POP, A ORA, 0=, IF, loadpc CALL,
NOTETIMER STA, A INR, MULTIPLE STA, THEN, NEXT
```

**Calls:** <a href="#terse-word-6c-6f-61-64-70-63"><code>loadpc</code></a>.

**Used by:** <a href="#terse-word-4d-42-41-4c-4c"><code>MBALL</code></a>, <a href="#terse-word-4d-43-41-4e-4e-4f-4e"><code>MCANNON</code></a>, <a href="#terse-word-4d-43-4f-49-4e"><code>MCOIN</code></a>, <a href="#terse-word-4d-46-45-4e-43-45"><code>MFENCE</code></a>, <a href="#terse-word-4d-46-4f-55-4c"><code>MFOUL</code></a>, <a href="#terse-word-4d-48-49-54"><code>MHIT</code></a>, <a href="#terse-word-4d-4f-55-54"><code>MOUT</code></a>, <a href="#terse-word-4d-53-41-46-45"><code>MSAFE</code></a>, <a href="#terse-word-4d-53-54-52-49-4b-45"><code>MSTRIKE</code></a>, <a href="#terse-word-4d-59-41-48"><code>MYAH</code></a>.

---

### <a name="terse-word-42-55-54-54-4f-4e-43-48-4b"></a><span>BUTTONCHK</span>

Reads buttons for swing run & pitch it.

`( -- )`

Samples controls and updates pitch/run flags; saves/restores IX/IY on native calls

```text
CODE BUTTONCHK ( reads buttons for swing run & pitch it )
HITYET LDA, A ANA, 0<>, IF,
( runner control )
CMSW LDA, A ANA, 0<>, IF, ( computer control ) DI,
X PUSHX, Y PUSHX, 0F D MVI, OFBLCHK CALL, ( chk if close )
Y POPX, X POPX, EI, 1 XRI,
ELSE, 14 IN, 2 ANI, 2 XRI, THEN, FORW STA,
( BB sentry definitions ) ( pitch control )
PITCHIT LDA, A ANA, RZ, FLDCLR LDA, A ANA, RNZ,
TIMEOUT LDA, A ANA, 0<>, IF, 14 IN, 1 ANI, RNZ, THEN, DI,
A XRA, STRIKE STA, HITYET STA, FLSHCNT LDA, A ANA, 0=, IF,
DOVERB WUPWRT THEN, FLSHSTAY LDA, A ANA, 0=, IF,
FLSHON STA, FLSHTIME STA, FLSHCNT STA,
ELSE, A XRA, DOWUP STA, WUPFLSH STA, THEN,
PITCHPA H LXI, VPLAYACTPC PT SHLD, A XRA,
PITCHIT STA, VUPDATE# PT STA, 4A A MVI, THROWTIMER STA,
PITCHTIME STA, VMAGIC PT H LXI, WHOTHROWS SHLD,
VSTATUS PT H LXI, VACT M SET, ' KILLOF CALL, EI,
ELSE, ( swing control ) CMSW LDA, A ANA, 0<>, IF,
SWRND# LDA, ( set up in whonbase ) 98 ADI, A D MOV,
VYH BL LDA, D CMP, RC, VXH BL LDA, 26 SBI, 4 CPI, RNC,
ELSE, 14 IN, 2 ANI, RNZ, THEN, SWINGGO LDA, A ANA, RZ,
SWING STA, THEN, RET, -->
( BB sentry definitions    INSCN , PP )
```

**Calls:** <a href="#terse-word-4f-46-42-4c-43-48-4b"><code>OFBLCHK</code></a>, <a href="#terse-word-57-55-50-57-52-54"><code>WUPWRT</code></a>.

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-43-48-4b-43-41-55-47-48-54"></a><span>CHKCAUGHT</span>

Caught set in interrupt.

`( -- )`

Interrupt-side caught-ball handler; saves native vector registers and changes runner/score flags

```text
CODE CHKCAUGHT ( caught set in interrupt )
<ASSEMBLE WALK LDA, A ANA, RNZ, Y PUSHX, X PUSHX,
THROW STA, CAUGHT STA, TOOFF STA, TOOF STA,
1 A MVI, NORUN STA,
THROWAROUND LDA, A ANA, 0=, IF, 30 A MVI, STRIKES STA,
BALLS STA, OFCATCH LDA, A ANA, DI, 0<>, IF,
THROWANM STA, WHOSUP LIYD, OUTOFFF JMP, THEN,
PLAYON LIYD, OFOUT LDA, A ANA, 0<>, IF, A XRA, OFOUT STA,
ELSE, CSAFE A MVI, STRING STA, THEN, BASEBLAT LDA, A C MOV,
VATBS VSTATUS Y BITX, 0=, IF, VOFW Y A LDX, A ANA, 0<>, IF,
VHW VRSTAT Y BITX, 0<>, IF, 2 A MVI, LVRSTAT CALL, ELSE,
VWBASE Y A LDX, C CMP, ( runner at this base ) =, IF,
LABEL OUTOFFF ( out ) OFFFPA H LXI, A XRA,
( BB sentry defined routines )
A VWBASE Y STX, H VPLAYACTPCH Y STX, ( run off field )
L VPLAYACTPCL Y STX, FLDCLR H LXI, M INR, COUT A MVI,
STRING STA, VGO VSTATUS Y RESX, OUTS LDA, 32 CPI,
=, IF, A XRA, THROWANM STA,
X POPX, Y POPX, EI, RET, ( ret if 3rd out ) THEN,
THEN, THEN, THEN, THEN,
OFCATCH LDA, A ANA, 0<>, IF, OFOUT STA,
CCLEAVE JMP, THEN, C A MOV, ( baseblat ) 3 CPI, <>, IF,
NEG, 2 ADI, FLDON3RD H LXI, ' INDEXW CALL, D PUSH, X POPX,
VPT VSTATUS X BITX, 0=, IF, X PUSHX, H POP, WHOTHROWS SHLD,
1 A MVI, THROWANM STA, INAIR STA, DBLPLAY LDA, A ANA,
0<>, IF, ( double play ) A XRA, DBLPLAY STA, VLENGTH D LXI,
Y PUSHX, H POP, D DAD, PLAYON SHLD, 1 A MVI, DBLFLAG STA,
ELSE, ( no dblplay ) 1 A MVI, THROWAROUND STA, THEN,
--> ( Reverse base index for downward fielder pointers )
( BB sentry defined routines )
LABEL CCLEAVE A XRA, OFCATCH STA, X POPX, Y POPX,
EI, RET, THEN, THEN, THEN, ( throwaround catch )
A XRA, THROWAROUND STA,
X POPX, Y POPX, DI, DOVERB STFLD ( reset fielders )
FLSHSTAY LDA, A ANA, 0=, IF,
DOVERB WUPWRT ' WUPWRT H LXI, FLSHWHO SHLD,
1 A MVI, FLSHON STA, FLSHTIME STA,
ELSE, WUPFLSH STA, THEN,
EI, RET, ASSEMBLE>
( BB sentry defined routines THROWANIM )
```

**Calls:** <a href="#terse-word-4c-56-52-53-54-41-54"><code>LVRSTAT</code></a>.

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-43-48-4b-47-52-4f-55-4e-44-45-52"></a><span>CHKGROUNDER</span>

If grounder adjust ball direction.

`( -- )`

IX = ball vector; adjusts velocity using grounder lookup; preserves HL across table lookup

```text
CODE CHKGROUNDER ( if grounder adjust ball direction )
GRNDR LDA, A ANA, RZ,
GRNDRVALUE LDA, A INR, 0D CPI, >=, IF, A XRA, THEN,
GRNDRVALUE STA, H PUSH, GVTBL H LXI, ' INDEXW CALL,
VXH X A LDX, 0A0 CPI, ' COMPDE CC, H POP, D DAD, RET,
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>, <a href="#terse-word-43-4f-4d-50-44-45"><code>COMPDE</code></a>.

**Used by:** <a href="#terse-word-56-45-43-54-4f-52"><code>VECTOR</code></a>.

---

### <a name="terse-word-43-48-4b-53-43-52-54-49-4d-45"></a><span>CHKSCRTIME</span>

Score process.

`( -- )`

Scores play events from RAM, updates runner/base and score state; temporary IX stack saves balance on return

```text
CODE CHKSCRTIME ( score process ) DI,
X PUSHX, HITOF LDA, A ANA, 0<>, IF, PLAYON LHLD, H PUSH,
X POPX, ( player play is on ) VMAGIC R4 D LXI, E A MOV,
L CMP, ( r4? ) <>, IF, DBLFLAG LDA, A ANA, 0=, IF,
VLENGTH D LXI, D DAD, PLAYON SHLD, THEN, THEN,
ELSE, VMAGIC R1 X LXIX, ( infield hit ) THEN,
A XRA, A VWBASE X STX, SCRTIME STA, X POPX, EI,
PLYR1UP LDA, A ANA, 0<>, IF, SCORE1 H LXI, 1 D MVI,
ELSE, SCORE2 H LXI, 2 D MVI, THEN,
M A MOV, 1 ADI, DAA, A M MOV, D A MOV, SCORESHOW STA, RET,
```

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-43-4c-52-42-4c-53-54"></a><span>CLRBLST</span>

Resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.

`( -- )`

Stores ASCII zero ($30) into ball and strike counters; 'NEXT'

```text
CODE CLRBLST 30 A MVI, BALLS STA, STRIKES STA, NEXT
```

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-44-4f-48-4f-4d-45-52"><code>DOHOMER</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>.

---

### <a name="terse-word-63-6e-6c-69-6e-65"></a><span>cnline</span>

Calls vector line write.

`( -- )`

Saves BC, IX and IY around 'VECTOR'; restores registers before 'NEXT'

```text
CODE cnline ( calls vector line write )
B PUSH, Y PUSHX, X PUSHX, 0ED B, 57 B, PSW PUSH, DI,
VECTOR CALL, PSW POP, X POPX, Y POPX, B POP,
PE, IF, EI, THEN, NEXT
```

**Calls:** <a href="#terse-word-56-45-43-54-4f-52"><code>VECTOR</code></a>.

**Used by:** <a href="#terse-word-43-4e-4c-49-4e-45"><code>CNLINE</code></a>, <a href="#terse-word-44-4c-49-4e-45"><code>DLINE</code></a>.

---

### <a name="terse-word-43-4f-4d-50-44-45"></a><span>COMPDE</span>

Negate DE while preserving HL.

`( -- )`

Negates DE through COMPHL after exchanging DE/HL, then restores the caller's original HL; returns natively.

```text
CODE COMPDE H PUSH, XCHG, ' COMPHL CALL, XCHG, H POP, RET,
```

**Calls:** <a href="#terse-word-43-4f-4d-50-48-4c"><code>COMPHL</code></a>.

**Used by:** <a href="#terse-word-43-48-4b-47-52-4f-55-4e-44-45-52"><code>CHKGROUNDER</code></a>.

---

### <a name="terse-word-43-4f-4d-50-48-4c"></a><span>COMPHL</span>

Compliments HL.

`( -- )`

Returns the two's-complement negation of HL (bitwise complement of both bytes followed by increment); no TERSE parameter-stack cells are consumed.

```text
CODE COMPHL ( compliments HL )
H A MOV, CMA, A H MOV, L A MOV, CMA, A L MOV, H INX, RET,
```

**Used by:** <a href="#terse-word-43-4f-4d-50-44-45"><code>COMPDE</code></a>, <a href="#terse-word-44-49-56-48-4c-42-59-34"><code>DIVHLBY4</code></a>, <a href="#terse-word-44-53-54-43-41-4c-43"><code>DSTCALC</code></a>, <a href="#terse-word-4d-55-4c-54-48-4c-42-59-34"><code>MULTHLBY4</code></a>, <a href="#terse-word-4f-46-42-4c-43-48-4b"><code>OFBLCHK</code></a>, <a href="#terse-word-54-42-4c-56-45-4c"><code>TBLVEL</code></a>.

---

### <a name="terse-word-43-4f-55-4e-54"></a><span>COUNT</span>

Read the next character of a counted/high-bit-terminated string.

`( address -- address+1 character )`

Character returned with high-bit terminator stripped; address advanced by one

```z80
            pop     hl                  ; Pop string address from parameter stack
            ld      a,(hl)              ; Read character byte
            inc     hl                  ; Advance string pointer
            push    hl                  ; Push updated string pointer
            ld      l,a                 ; Move character code to low byte
            res     7,l                 ; Strip bit 7 string-end flag
            ld      h,$00               ; Zero-extend high byte
            push    hl                  ; Push character code onto stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>.

---

### <a name="terse-word-63-70-6f-73-74"></a><span>cpost</span>

Post an ascii-character on the screen ; see opt.

`( x y options char -- x' y options )`

Consumes drawing position, options and character; returns updated x and retained state

```text
CODE cpost ( post an ascii-character on the screen ; see opt. )
( in= x , y , opt+exp/mag , ascii-char )
( out- newx , y , opt+ex/mag ; character on screen )
Y PUSHX, H POP, EXX, H POP,
B POP, 0ED B, 57 B, EXAF, DI, L A MOV,
SMFONT B BIT, PSW PUSH, 0=, IF,
41 CPI, >=, IF, 36 SUI, ELSE, 30 CPI, >=, IF, 2F SUI,
ELSE, 20 SUI, THEN, THEN,
ELSE, ( small font ) 20 SUI,
THEN,
( VGS character routines    cpost con't. )
A L MOV, 0 H MVI,
L SLAR, H RALR, ( *2 ) H D MOV, L E MOV,
PSW POP, 0<>, IF, 0 smallfont D LXI, D DAD,
FONTUNPACK CALL, ELSE, L SLAR, H RALR,
L SLAR, H RALR, D DAD, 0 characters D LXI, D DAD, THEN,
H PUSH, Y POPX, ( patadr )
H POP, D POP, D PUSH, H PUSH, B PUSH,
relabs CALL, 0A01 D LXI, SMFONT B BIT, 0<>, IF, 5 D MVI,
1 A MVI, ELSE, 2 A MVI, THEN, PSW PUSH,
write CALL, PSW POP, B POP, H POP, XTHL,
A D MOV, 0 L MVI, D DAD,
XTHL, H PUSH, B PUSH, EXX, H PUSH, Y POPX,
EXAF, PE, IF, EI, THEN, NEXT
```

**Calls:** <a href="#terse-word-46-4f-4e-54-55-4e-50-41-43-4b"><code>FONTUNPACK</code></a>, <a href="#terse-word-72-65-6c-61-62-73"><code>relabs</code></a>.

**Used by:** <a href="#terse-word-43-50-4f-53-54"><code>CPOST</code></a>, <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>, <a href="#terse-word-64-70-6f-73-74"><code>dpost</code></a>.

---

### <a name="terse-word-44-45-41-43-54-49-56-41-54-45"></a><span>DEACTIVATE</span>

Reset active bit in status.

`( -- )`

Clears the VACT bit of VSTATUS in the vector addressed by IX, writes 1 to SAMEDLT and returns natively.

```text
CODE DEACTIVATE ( reset active bit in status )
VACT VSTATUS X RESX, 1 A MVI, SAMEDLT STA, RET,
```

---

### <a name="terse-word-44-49"></a><span>DI</span>

Disable maskable Z80 interrupts.

`( -- )`

Maskable interrupts disabled; parameter stack unchanged

```z80
_DI:
            di                          ; Disable hardware interrupts
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-44-57-41-49-54"><code>DWAIT</code></a>, <a href="#terse-word-46-4c-46-49-4c-4c"><code>FLFILL</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-50-4c-52-53-45-4c-45-43-54"><code>PLRSELECT</code></a>, <a href="#terse-word-50-55-50"><code>PUP</code></a>, <a href="#terse-word-53-45-54-54-46"><code>SETTF</code></a>, <a href="#terse-word-53-54-52-54-42-41-4c-4c"><code>STRTBALL</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>, <a href="#terse-word-5a-45-52-4f-52-41-4d"><code>ZERORAM</code></a>.

---

### <a name="terse-word-44-49-56-48-4c-42-59-34"></a><span>DIVHLBY4</span>

Divide HL by 4.

`( -- )`

HL ← signed(HL / 4)

```text
CODE DIVHLBY4 ( divide HL by 4 )
7 H BIT, PSW PUSH, ( dir )
' COMPHL CNZ, ( abs dy )
H SRLR, L RARR, H SRLR, L RARR, ( /4 )
PSW POP, ' COMPHL CNZ, RET,
```

**Calls:** <a href="#terse-word-43-4f-4d-50-48-4c"><code>COMPHL</code></a>.

**Used by:** <a href="#terse-word-56-45-43-54-4f-52"><code>VECTOR</code></a>.

---

### <a name="terse-word-44-4f"></a><span>DO</span>

Enter a counted loop using a three-cell return-stack frame.

`( limit start -- )`

Two parameter-stack cells consumed; IX return stack holds start, limit and loop IP

```z80
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
```

**Used by:** <a href="#terse-word-44-57-41-49-54"><code>DWAIT</code></a>, <a href="#terse-word-46-49-45-4c-44-57-52-54"><code>FIELDWRT</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>.

---

### <a name="terse-word-44-53-54-43-41-4c-43"></a><span>DSTCALC</span>

Calc deltas to destination.

`( -- )`

HL ← dy; DE ← dx; BC ← action selector

```text
CODE DSTCALC ( calc deltas to destination )
( in HL-dstx DE-dsty A-max vel )
( out HL-dy DE-dx BC-magic & pattern # ) <ASSEMBLE
EXAF, VXH X B LDX, VXL X C LDX, B DSBC, PSW PUSH,
' COMPHL CC, L SLAR, H RALR, L SLAR,
H RALR, XCHG, ( diffx-DE dsty-HL ) VYH X B LDX, VYL X C LDX,
B DSBC, PSW PUSH, ( diffy-HL ) ' COMPHL CC,
EXAF, PSW PUSH, EXAF, PSW POP, ( max vel for cmp value )
A INR, A INR, H CMP, RSRDST JC, D CMP, RSRDST JC,
A XRA, H CMP, DSTSET JNZ, D CMP, DSTSET JNZ, ( exact point )
STND B LXI, A H MOV, A L MOV, H D MOV, L E MOV,
PSW POP, PSW POP, 0FF A MVI, RDST STA,
VACT VSTATUS X RESX, VGO VSTATUS X RESX, RET, -->
( BB destination delta calculation )
LABEL RSRDST VGO VSTATUS X BITX, 0<>, IF, PSW POP, PSW POP,
( only calc once ) LDFLAG A MVI, SAMEDLT STA,
ELSE, H A MOV, D CMP, PSW PUSH,
<, IF, XCHG, ELSE, =, IF, L A MOV, E CMP, <, IF, XCHG,
PSW POP, STC, PSW PUSH, THEN, THEN,
THEN, ( HL > diff ) EXAF, ( max delt ) 0 B MVI,
LABEL BTLP1 B INR, H SRLR, L RARR, ( /2 ) H CMP, BTLP1 JC,
LABEL BTLP2 D SRLR, E RARR, BTLP2 DJNZ, ( halve DE )
PSW POP, ( xdl>yd ) <, IF, XCHG, THEN,
LABEL DSTSET PSW POP, ( +- dy )
CY, IF, ' COMPHL CALL, THEN, PSW POP, PSW PUSH, ( +- dx )
CY, IF, ' COMPDE CALL, THEN, PSW POP, ( dx sign )
CY, IF, LRUN B LXI, ELSE, RRUN B LXI, THEN,
A XRA, RDST STA, VGO VSTATUS X SETX, THEN, RET, ASSEMBLE>
( BB set destination registers from vector )
```

**Calls:** <a href="#terse-word-43-4f-4d-50-48-4c"><code>COMPHL</code></a>.

**Used by:** <a href="#terse-word-42-4c-44-53-54"><code>BLDST</code></a>, <a href="#terse-word-43-4d-50-4f-46"><code>CMPOF</code></a>, <a href="#terse-word-46-4c-44-44-53-54"><code>FLDDST</code></a>, <a href="#terse-word-4f-46-46-46-44-53-54"><code>OFFFDST</code></a>.

---

### <a name="terse-word-44-53-54-4c-44"></a><span>DSTLD</span>

Reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.

`( -- )`

IX input vector; HL ← destination X; DE ← destination Y

```text
CODE DSTLD
VDSTXH X H LDX, VDSTXL X L LDX, VDSTYH X D LDX,
VDSTYL X E LDX,
RET,
```

**Used by:** <a href="#terse-word-42-4c-44-53-54"><code>BLDST</code></a>, <a href="#terse-word-46-4c-44-44-53-54"><code>FLDDST</code></a>.

---

### <a name="terse-word-45-49"></a><span>EI</span>

Enable maskable Z80 interrupts.

`( -- )`

Maskable interrupts enabled; parameter stack unchanged

```z80
_EI:
            ei                          ; Enable hardware interrupts
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Calls:** <a href="#terse-word-53-57-41-4e"><code>SWAN</code></a>.

**Used by:** <a href="#terse-word-43-52-45-44-41-52-52-4f-57"><code>CREDARROW</code></a>, <a href="#terse-word-44-57-41-49-54"><code>DWAIT</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-46-4c-46-49-4c-4c"><code>FLFILL</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-50-4c-52-43-48-4b"><code>PLRCHK</code></a>, <a href="#terse-word-50-55-50"><code>PUP</code></a>, <a href="#terse-word-53-45-54-54-46"><code>SETTF</code></a>, <a href="#terse-word-54-46"><code>TF</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>.

---

### <a name="terse-word-45-49-44-49"></a><span>EIDI</span>

Executes EI then DI, providing the Z80 interrupt opportunity used by callers.

`( -- )`

Emits 'EI' then 'DI', returns through 'NEXT'

```text
CODE EIDI EI, DI, NEXT
```

**Used by:** <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-46-4c"><code>FL</code></a>.

---

### <a name="terse-word-45-4d-55-53-49-43"></a><span>EMUSIC</span>

Selects ENDMUSIC and initializes timing/repetition to one.

`( -- )`

Initializes music state and returns through 'NEXT'

```text
CODE EMUSIC 0 ENDMUSIC H LXI, loadpc CALL, 1 A MVI, NOTETIMER
STA, MULTIPLE STA, NEXT ( CALL EMUSIC AS AN INIT IN PROGRAM )
```

**Calls:** <a href="#terse-word-6c-6f-61-64-70-63"><code>loadpc</code></a>.

**Used by:** <a href="#terse-word-50-55-50"><code>PUP</code></a>.

---

### <a name="terse-word-45-58"></a><span>EX</span>

Emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.

`( -- )`

Emits 'RET' instruction and continues through 'NEXT'

```text
CODE EX C9 B, NEXT
```

**Used by:** <a href="#terse-word-46-4c-53-48-4d-45"><code>FLSHME</code></a>, <a href="#terse-word-47-52-4e-44-52-41-43-54-49-4f-4e"><code>GRNDRACTION</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-53-54-52-49-4e-47-47-4f"><code>STRINGGO</code></a>.

---

### <a name="terse-word-46-49-4c-4c"></a><span>FILL</span>

Fill consecutive bytes with a specified value.

`( value address count -- )`

Bytes [address..address+count−1] filled with value; parameter stack consumed

```z80
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
```

**Used by:** <a href="#terse-word-46-4c-46-49-4c-4c"><code>FLFILL</code></a>, <a href="#terse-word-53-43-52-45-52-41-53-45"><code>SCRERASE</code></a>, <a href="#terse-word-5a-45-52-4f-52-41-4d"><code>ZERORAM</code></a>.

---

### <a name="terse-word-46-4c-44-44-53-54"></a><span>FLDDST</span>

Fielders take position logic.

`( -- )`

IX = fielder vector; computes velocity/destination and updates playaction state through native helpers

```text
CODE FLDDST ( fielders take position logic )
4 A MVI, ' DSTLD CALL, ' DSTCALC CALL, LDFLAG CPI, <>, IF,
A ANA, 0<>, IF, ( rdst ) VPT VSTATUS X BITX, 0<>, IF,
STPT B LXI, PITCHIT STA, CMPT LDA, A ANA, 0<>, IF, 4 A MVI,
ELSE, 1C A MVI, THEN, TIMEOUT STA, OFTBLGO STA, ELSE,
STND B LXI, THEN, VOF VSTATUS X BITX,
0<>, IF, OFTFCNT LDA, A DCR, OFTFCNT STA, A ANA, 0=, IF,
TAKEFIELD STA, 3 A MVI, OFTOTBL STA,
OFTFCNT STA, THEN, THEN, THEN,
( count all of outfielders in position )
FLDPA SBCD, FLDDY SHLD, FLDDX SDED,
THEN, FLDPA H LXI, VECTPC SHLD, RET,
```

**Calls:** <a href="#terse-word-44-53-54-4c-44"><code>DSTLD</code></a>, <a href="#terse-word-44-53-54-43-41-4c-43"><code>DSTCALC</code></a>.

---

### <a name="terse-word-46-4c-53-48-4f-46-46"></a><span>FLSHOFF</span>

Disables flashing and services cleanup under DI.

`( -- )`

Preserves BC, sets FLSHON to zero, disables interrupts (DI), calls FLSHWUP, restores BC, then resumes via NEXT; there is no EI in this routine.

```text
CODE FLSHOFF B PUSH, A XRA, FLSHON STA, DI, FLSHWUP CALL,
B POP, NEXT
```

**Calls:** <a href="#terse-word-46-4c-53-48-57-55-50"><code>FLSHWUP</code></a>.

**Used by:** <a href="#terse-word-43-48-4b-46-4c-53-48-53-54-41-59"><code>CHKFLSHSTAY</code></a>, <a href="#terse-word-44-4f-43-48-47-53"><code>DOCHGS</code></a>, <a href="#terse-word-44-4f-47-4f-56-45-52"><code>DOGOVER</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>.

---

### <a name="terse-word-46-4d-49-52-52-4f-52"></a><span>FMIRROR</span>

Selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order.

`( -- )`

Preserves BC while mirroring field graphics and returns through 'NEXT'

```text
CODE FMIRROR B PUSH, 0C A MVI, XPAND OUT,
50 A MVI, MAGIC OUT, 0C050 D LXI, 4000 B LXI,
4F H LXI, BEGIN, D PUSH, H PUSH, BEGIN, B LDAX,
A M MOV, H DCX, B INX, E DCR, 0=, END,
H POP, 50 D LXI, D DAD, D POP, D DCR, 0=, END,
B POP, NEXT DECIMAL ;S
( Native RAM fill; palette interrupts remain enabled ) HEX
FORWARD IFMAIN FORWARD IFMOUND
```

**Calls:** <a href="#terse-word-44-45-43-49-4d-41-4c"><code>DECIMAL</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>.

---

### <a name="terse-word-48-49-54-52-55-4e"></a><span>HITRUN</span>

Activate proper runners and set trwbase.

`( -- )`

Selects runner activation and throw target via indexed native dispatch; restores BC before 'NEXT'

```text
CODE HITRUN ( activate proper runners and set trwbase )
A XRA, OFTBLGO STA, ( runners wont advance 2 bases )
B PUSH, ( set playon by which runners go defaults to r1 )
<ASSEMBLE BASESTATUS LDA, VMAGIC R1 B LXI, ( default value )
WBASETABLE H LXI, ' INDEXW CALL, HRRET H LXI,
SECTNM LDA, H PUSH, ( ret add. ) XCHG, PCHL,
LABEL HRRET PLAYON SBCD, B POP, NEXT ASSEMBLE>
DECIMAL ;S
( BB who's on which base    WHONBASEODDS )
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>, <a href="#terse-word-44-45-43-49-4d-41-4c"><code>DECIMAL</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-54-49-4d-45"><code>BALLTIME</code></a>, <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>.

---

### <a name="terse-word-48-4f-4d-45-52-43-48-4b"></a><span>HOMERCHK</span>

Consumes two random offsets, hit type and ball coordinates from the TERSE parameter stack; sets fence/homer state and ball destination.

`( y x hit-type random-x random-y -- )`

Five TERSE inputs consumed; ball/homer state updated

```text
CODE HOMERCHK ( chk for homer or fence hit )
EXX, PSW POP, 5 ADI, FNCY { 1+ } STA, ( 5 rnd +5 for fncy )
PSW POP, 4 ADI, A B MOV, ( 5 rnd +5 for fncx )
H POP, L A MOV, ( hit type ) H POP, ( x ) D POP, ( y )
A ANA, 0<>, IF, 1 CPI, =, IF, FENCE STA, 500 D LXI, ELSE,
HOMER STA, 100 D LXI, THEN, THEN,
A C MOV, D A MOV, 28 CPI, <, IF, H A MOV, 0A CPI, ( lcn )
<, IF, CNTBL H LXI, C A MOV, ' INDEXW CALL,
B H MOV, FNCX SHLD, 1C0 H LXI, ( lft corner )
ELSE, 46 CPI, >=, IF, CNTBL H LXI, C A MOV, ' INDEXW CALL,
B A MOV, NEG, FNCX { 1+ } STA,
4E00 H LXI, ( hit rt corner )
( BB infield action )
ELSE, SWINGTYPE LDA, A DCR, 0=, IF, B A MOV, NEG,
ELSE, 4 CPI, =, IF, B A MOV,
ELSE, B A MOV,
0 L BIT, 0=, IF, NEG, THEN, THEN, THEN,
FNCX { 1+ } STA, THEN,
THEN, THEN, VDSTX BL SHLD, VDSTY BL SDED, EXX, NEXT -->
( BB infield action    OUTFLDHIT )
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>.

**Used by:** <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>.

---

### <a name="terse-word-49"></a><span>I</span>

Fetch the innermost counted-loop index.

`( -- index )`

Loop index copied from IX return-stack frame to parameter stack; IX frame intact

```z80
_Rat:
            ld      l,(ix+$00)          ; Read Return Stack top LSB
            ld      h,(ix+$01)          ; Read Return Stack top MSB
            push    hl                  ; Push copied word onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>, <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>.

---

### <a name="terse-word-49-45-58"></a><span>IEX</span>

Restores two saved Z80 register banks, enables interrupts, then returns from the interrupt bridge; this is an interrupt-frame convention, not an ordinary TERSE data-word call.

`( saved-interrupt-frame -- )`

Saved interrupt register frame restored, interrupt enabled

```text
CODE IEX PSW POP, B POP, D POP, H POP, EXX, EXAF,
PSW POP, B POP, D POP, H POP, EI, RET,
```

**Used by:** <a href="#terse-word-49-4e-45-58-54"><code>INEXT</code></a>.

---

### <a name="terse-word-49-4e-44-45-58-57"></a><span>INDEXW</span>

Call routine A- disp HL- table add.

`( -- )`

Inputs A = table index and HL = base address; computes HL = base + 2 × index, reads the little-endian indexed word into DE, restores A, and returns with HL pointing to the selected table entry.

```text
CODE INDEXW ( call routine A- disp HL- table add )
( for indexing into table only )
PSW PUSH, A SLAR, ( 2* A )
L ADD, A L MOV, 0 A MVI, H ADC, A H MOV,
M E MOV, H INX, M D MOV, H DCX, PSW POP, RET,
```

**Used by:** <a href="#terse-word-41-4e-4d-53-45-51-4c-4f-41-44"><code>ANMSEQLOAD</code></a>, <a href="#terse-word-42-41-54-48-49-54-43-48-4b"><code>BATHITCHK</code></a>, <a href="#terse-word-42-41-54-57-52-49-54-45"><code>BATWRITE</code></a>, <a href="#terse-word-43-48-4b-47-52-4f-55-4e-44-45-52"><code>CHKGROUNDER</code></a>, <a href="#terse-word-48-49-54-52-55-4e"><code>HITRUN</code></a>, <a href="#terse-word-48-4f-4d-45-52-43-48-4b"><code>HOMERCHK</code></a>, <a href="#terse-word-4c-4f-41-44-41-4e-4d"><code>LOADANM</code></a>, <a href="#terse-word-4f-50-43-4f-44-45-43-48-4b"><code>OPCODECHK</code></a>, <a href="#terse-word-50-41-54-46-45-54-43-48"><code>PATFETCH</code></a>, <a href="#terse-word-54-41-4b-45-4f-46-46"><code>TAKEOFF</code></a>, <a href="#terse-word-54-48-52-4f-57-41-4e-49-4d"><code>THROWANIM</code></a>, <a href="#terse-word-54-48-52-4f-57-42-41-4c-4c"><code>THROWBALL</code></a>.

---

### <a name="terse-word-49-4e-46-49-45-4c-44"></a><span>INFIELD</span>

Uses IFSPAN to process game state.

`( -- )`

Draws infield stripes/pitcher mound; preserves BC and IX around row-rendering helpers

```text
CODE INFIELD B PUSH, X PUSHX,
0 INFP X LXIX, 55E0 D LXI, 2873 B LXI, LABEL IFMAIN
B PUSH, 0 X A LDX, X INXX, IFSPAN CALL, B POP,
B A MOV, 20 CPI, 0=, IF, C DCR, ELSE,
CY, IF, C DCR, C DCR, C DCR, THEN, THEN, IFMAIN DJNZ,
5EA0 D LXI, 0C B MVI, LABEL IFMOUND B PUSH,
0 X A LDX, 73 C MVI, X INXX, IFSPAN CALL, B POP,
IFMOUND DJNZ,
X POPX, B POP, NEXT
```

**Calls:** <a href="#terse-word-49-46-53-50-41-4e"><code>IFSPAN</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>.

---

### <a name="terse-word-49-4e-46-4c-44-41-43-54"></a><span>INFLDACT</span>

Set infielders active.

`( -- )`

Sets HL to first infield vector, A to five records, and calls 'SETACT'

```text
CODE INFLDACT ( set infielders active )
VSTATUS PT H LXI, 5 A MVI, ' SETACT CALL, RET,
```

**Calls:** <a href="#terse-word-53-45-54-41-43-54"><code>SETACT</code></a>.

**Used by:** <a href="#terse-word-41-4c-4c-46-4c-44-41-43-54"><code>ALLFLDACT</code></a>.

---

### <a name="terse-word-49-53-54-41-52-54"></a><span>ISTART</span>

Disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.

`( interrupt-address -- )`

RAM[IPNT] ← interrupt handler address; mode IM2

```text
CODE ISTART DI, H POP, IPNT SHLD, 8 A MVI, INMOD OUT,
IPNT { SWAB } A MVI, STAI, IPNT A MVI,
INFBK OUT, IM2, EI, NEXT
```

**Used by:** <a href="#terse-word-53-31-30"><code>S10</code></a>, <a href="#terse-word-53-31-31"><code>S11</code></a>.

---

### <a name="terse-word-4b-49-4c-4c-4f-46"></a><span>KILLOF</span>

Stop outfield tractor ball control.

`( -- )`

Clears outfield delta words and control flag; selects standing playaction

```text
CODE KILLOF ( stop outfield tractor ball control )
0 H LXI, OFDX SHLD, OFDY SHLD, STND H LXI, OFPA SHLD,
A XRA, OFTBLGO STA, RET,
```

**Used by:** <a href="#terse-word-42-4c-44-53-54"><code>BLDST</code></a>.

---

### <a name="terse-word-4c-4f-41-44-41-4e-4d"></a><span>LOADANM</span>

Loads magic & anm HL-top of playact table.

`( -- )`

Reads the next magic byte into IX:VMAGIC, uses the following pattern index with INDEXW/PATTERNS to store IX:VANMH/VANML, then returns HL advanced past both playaction bytes.

```text
CODE LOADANM ( loads magic & anm HL-top of playact table )
( IX-proper vector add )
M A MOV, A VMAGIC X STX, ( load magic )
H INX, M A MOV, H PUSH, PATTERNS H LXI, ' INDEXW CALL,
D VANMH X STX, E VANML X STX, ( load anm )
H POP, ( pc ) H INX, RET, ( returns updated pc in HL )
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>.

**Used by:** <a href="#terse-word-50-41-43-54-4c-4f-41-44"><code>PACTLOAD</code></a>.

---

### <a name="terse-word-4c-4f-4f-50"></a><span>LOOP</span>

Advance a counted loop and test its termination.

`( -- )`

Parameter stack unchanged; IX loop index incremented, loop frame retained or released

```z80
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
```

**Used by:** <a href="#terse-word-2b-4c-4f-4f-50"><code>+LOOP</code></a>, <a href="#terse-word-44-57-41-49-54"><code>DWAIT</code></a>, <a href="#terse-word-46-49-45-4c-44-57-52-54"><code>FIELDWRT</code></a>, <a href="#terse-word-49-4e-53-57-41-49-54"><code>INSWAIT</code></a>, <a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52"><code>LSETTFCOOR</code></a>, <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>, <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>, <a href="#terse-word-4f-55-54-54-49-4d-45"><code>OUTTIME</code></a>, <a href="#terse-word-50-50-4f-53-54"><code>PPOST</code></a>, <a href="#terse-word-52-45-54-50-41"><code>RETPA</code></a>, <a href="#terse-word-54-57-41-49-54"><code>TWAIT</code></a>.

---

### <a name="terse-word-4d-55-4c-54-48-4c-42-59-34"></a><span>MULTHLBY4</span>

Multiplies the magnitude of HL by four through shifts, then restores its sign.

`( -- )`

HL ← signed(4×HL)

```text
CODE MULTHLBY4
7 H BIT, PSW PUSH, ' COMPHL CNZ, L SLAR, H RALR,
L SLAR, H RALR, PSW POP, ' COMPHL CNZ, RET,
```

**Calls:** <a href="#terse-word-43-4f-4d-50-48-4c"><code>COMPHL</code></a>.

**Used by:** <a href="#terse-word-42-41-54-48-49-54-43-48-4b"><code>BATHITCHK</code></a>, <a href="#terse-word-4f-46-42-4c-43-48-4b"><code>OFBLCHK</code></a>.

---

### <a name="terse-word-4d-55-53-43-50-55"></a><span>MUSCPU</span>

Declare cross-screen dispatch labels and begin assembling MUSCPU.

`( -- )`

Music tick handler; updates note timer, decodes music commands and drives sound ports

```text
CODE MUSCPU <ASSEMBLE
B PUSH, NOTETIMER LDA, A ORA, PROCESS JZ,
A DCR, NOTETIMER STA, MUSEND JNZ,
LABEL PROCESS FETCH CALL, INCPC CALL, A ORA,
M1CASE JNZ, HLOAD CALL, H PUSH, HLOAD CALL,
H PUSH, HLOAD CALL, H PUSH, DOVERB RND -->
( MUSIC PROCESSOR AS A CODED SUBROUTINE )
H POP, D POP, D DAD, B POP, L OUTP, A XRA, MUSEND JMP,
LABEL M1CASE A DCR, M2CASE JNZ, FETCH CALL,
NOTETIMER STA, INCPC CALL, 1 ORI, MUSEND JMP,
LABEL M2CASE A DCR, M3CASE JNZ, PCJUMP CALL,
A XRA, MUSEND JMP,
LABEL M3CASE A DCR, M4CASE JNZ, PCJUMP CALL,
1 ORI, MUSEND JMP,
LABEL M4CASE A DCR, PORTOUT JNZ, MULTIPLE LDA, A DCR,
MULTIPLE STA, MULTDN JZ, STARTPC LHLD, MUSPC SHLD, MUSEND JMP,
LABEL MULTDN PRIORITY STA, MUSEND JMP,
LABEL PORTOUT 4 ADI, A C MOV, FETCH CALL, A OUTP,
INCPC CALL, A XRA,
LABEL MUSEND A ORA, PROCESS JZ, B POP, RET,
```

**Calls:** <a href="#terse-word-46-45-54-43-48"><code>FETCH</code></a>, <a href="#terse-word-49-4e-43-50-43"><code>INCPC</code></a>, <a href="#terse-word-48-4c-4f-41-44"><code>HLOAD</code></a>, <a href="#terse-word-52-4e-44"><code>RND</code></a>, <a href="#terse-word-50-43-4a-55-4d-50"><code>PCJUMP</code></a>.

---

### <a name="terse-word-4e-44-55-50"></a><span>NDUP</span>

Duplicate the top n parameter-stack cells.

`( x1 … xn n -- x1 … xn x1 … xn )`

Parameter stack retains original n cells and appends a copy; count removed

```z80
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
```

**Calls:** <a href="#terse-word-41-52-52-41-59"><code>ARRAY</code></a>.

**Used by:** <a href="#terse-word-4f-55-54-4c-49-4e-45"><code>OUTLINE</code></a>.

---

### <a name="terse-word-4f-46-46-46-44-53-54"></a><span>OFFFDST</span>

All player off field control.

`( -- )`

IX = active fielder vector; selects off-field destination, computes movement deltas

```text
CODE OFFFDST ( all player off field control ) <ASSEMBLE
VOF VSTATUS X BITX, 0<>, IF, 20 A MVI, TFTIMER STA, THEN,
PLYR1UP LDA, VRUN VSTATUS X BITX, 0<>, IF, 1 XRI, THEN,
A ANA, 0=, IF, 3600 H LXI, ELSE, 1B00 H LXI,
THEN, 9300 D LXI, 5 A MVI, ( max vel )
' DSTCALC CALL, LDFLAG CPI, <>, IF,
A ANA, 0<>, IF, NBD B LXI, VRUN VSTATUS X BITX, 0<>, IF,
FLDCLR LDA, A DCR, FLDCLR STA, 0=, IF, HOMERUN LDA, A ANA,
0<>, IF, H PUSH, X PUSHX, H POP, WHOSUP LDA, L CMP, H POP,
( last guy? ) >=, IF, 1 A MVI, CAUGHT STA, THROWAROUND STA,
STMUSIC STA, CHEERME STA, STRINGOFFTIMER STA,
A XRA, HOMERUN STA, THEN, THEN, THEN, THEN, THEN,
LABEL OFFPALD OFFPA SBCD, OFFDX SDED, OFFDY SHLD,
THEN, OFFPA H LXI, VECTPC SHLD, RET, ASSEMBLE> -->
( BB op codes for playaction defined    RUNDST )
F= NVFORW F= RBACK F= ROFW F= NVAUTO F= SOFW F= RVGO F= SVAVF
F= NFORW F= RFDST F= REND F= NOFPU F= CKATBS F= RVACT
```

**Calls:** <a href="#terse-word-44-53-54-43-41-4c-43"><code>DSTCALC</code></a>.

---

### <a name="terse-word-4f-46-4c-44-54-42-4c"></a><span>OFLDTBL</span>

Gives all three outfielders OFTBLPA, activates them and returns.

`( -- )`

Clears OFTOTBL, disables interrupts, stores OFTBLPA in the right-, center- and left-fielder VPLAYACTPC cells, calls OUTFLDACT, enables interrupts and returns natively.

```text
CODE OFLDTBL OFTBLPA H LXI, A XRA, OFTOTBL STA,
DI, VPLAYACTPC RF SHLD, VPLAYACTPC CF SHLD, VPLAYACTPC LF SHLD,
' OUTFLDACT CALL, EI, RET,
```

**Calls:** <a href="#terse-word-4f-55-54-46-4c-44-41-43-54"><code>OUTFLDACT</code></a>.

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-4f-46-4d-4f-54-49-4f-4e"></a><span>OFMOTION</span>

Set pc for ram pa table -tractor ball.

`( -- )`

If the action byte at OFPA+1 equals 4 (standing), clears VACT in the IX vector; then writes OFPA into VECTPC and returns natively.

```text
CODE OFMOTION ( set pc for ram pa table -tractor ball )
OFPA { 1+ } LDA, 4 CPI, ( stnd ? )
=, IF, VACT VSTATUS X RESX, THEN,
OFPA H LXI, VECTPC SHLD, RET,
```

---

### <a name="terse-word-4f-4e-31-53-54"></a><span>ON1ST</span>

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

`( -- )`

RAM[FLDON1ST] ← IX

```text
CODE ON1ST X PUSHX, H POP, FLDON1ST SHLD, RET,
```

---

### <a name="terse-word-4f-4e-32-4e-44"></a><span>ON2ND</span>

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

`( -- )`

RAM[FLDON2ND] ← IX

```text
CODE ON2ND X PUSHX, H POP, FLDON2ND SHLD, RET,
```

---

### <a name="terse-word-4f-4e-33-52-44"></a><span>ON3RD</span>

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

`( -- )`

RAM[FLDON3RD] ← IX

```text
CODE ON3RD X PUSHX, H POP, FLDON3RD SHLD, RET,
```

---

### <a name="terse-word-4f-50-43-4f-44-45-43-48-4b"></a><span>OPCODECHK</span>

Called by plyactupdate.

`( -- )`

HL = playaction cursor; looks up opcode handler and executes with a native return trampoline

```text
CODE OPCODECHK ( called by plyactupdate ) <ASSEMBLE
M A MOV, 28 CPI, <, A DCR, A DCR, ( check if opcode )
IF, H INX, VECTPC SHLD, ( save pc )
OPTBL H LXI, ' INDEXW CALL, ( which opcode )
OPRET H LXI, H PUSH, ( save ret add. ) XCHG, ( H-opcd )
PCHL, LABEL OPRET ( ex opcode return here )
VECTPC LHLD, THEN, RET, ASSEMBLE>
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>.

**Used by:** <a href="#terse-word-50-41-43-54-4c-4f-41-44"><code>PACTLOAD</code></a>.

---

### <a name="terse-word-4f-55-54-46-4c-44-41-43-54"></a><span>OUTFLDACT</span>

Sets outfielders active.

`( -- )`

Sets HL to first outfield vector, A to three records, and calls 'SETACT'

```text
CODE OUTFLDACT ( sets outfielders active )
VSTATUS LF H LXI, 3 A MVI, ' SETACT CALL, RET,
```

**Calls:** <a href="#terse-word-53-45-54-41-43-54"><code>SETACT</code></a>.

**Used by:** <a href="#terse-word-41-4c-4c-46-4c-44-41-43-54"><code>ALLFLDACT</code></a>, <a href="#terse-word-43-4d-50-4f-46"><code>CMPOF</code></a>, <a href="#terse-word-4f-46-4c-44-54-42-4c"><code>OFLDTBL</code></a>.

---

### <a name="terse-word-50-41-43-54-4c-4f-41-44"></a><span>PACTLOAD</span>

Loads vect from plyact.

`( -- )`

IX = target vector; reads playaction stream, dispatches opcodes, advances vector PC

```text
CODE PACTLOAD ( loads vect from plyact )
VPLAYACTPCH X H LDX, VPLAYACTPCL X L LDX, ( plyact pc )
' OPCODECHK CALL, ( check for opcodes )
SAMEDLT LDA, A ANA, 0<>, IF, H INX, H INX, A XRA, SAMEDLT STA,
H INX, H INX, H INX, H INX, H INX, ELSE, ' LOADANM CALL,
M A MOV, A VUPDATE# X STX, H INX, M A MOV, A VDYL X STX,
H INX, M A MOV, A VDYH X STX, H INX, M A MOV,
A VDXL X STX, H INX, M A MOV, A VDXH X STX, H INX,
THEN, H VPLAYACTPCH X STX, L VPLAYACTPCL X STX,
RET, -->
( BB playaction process    PATFETCH )
```

**Calls:** <a href="#terse-word-4f-50-43-4f-44-45-43-48-4b"><code>OPCODECHK</code></a>, <a href="#terse-word-4c-4f-41-44-41-4e-4d"><code>LOADANM</code></a>.

**Used by:** <a href="#terse-word-50-4c-41-59-41-43-54"><code>PLAYACT</code></a>.

---

### <a name="terse-word-50-41-54-46-45-54-43-48"></a><span>PATFETCH</span>

Loads actual pattern IX-vector.

`( -- )`

IX = vector; selects animation-frame pattern from sequence table and stores its address

```text
CODE PATFETCH ( loads actual pattern IX-vector )
503 H LXI, HITYET LDA, A ANA, 0=, IF, VPT VSTATUS X BITX,
0<>, IF, 1812 H LXI, THEN, THEN,
VANM# X A LDX, ( animation # )
A INR, H CMP, >=, IF, A XRA, THEN, ( start again )
A VANM# X STX, L CMP, <, IF, A XRA, ELSE, 1 A MVI, THEN,
( which motion ) VANMSEQH X H LDX, VANMSEQL X L LDX,
' INDEXW CALL, ( look up proper pattern of sequence )
D VPATH X STX, E VPATL X STX, RET,
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>.

**Used by:** <a href="#terse-word-50-4c-41-59-41-43-54"><code>PLAYACT</code></a>.

---

### <a name="terse-word-50-45-52-53-50-45-43-54-49-56-45"></a><span>PERSPECTIVE</span>

Pattern size determined by y.

`( -- )`

IX = vector; derives perspective class from Y and updates redraw flag if class changed

```text
CODE PERSPECTIVE ( pattern size determined by y )
0 E MVI, VYH X H LDX, 54 A MVI, H CMP, <, IF, 84 A MVI, H CMP,
<, IF, 0 D MVI, ELSE, 1 D MVI, THEN, ELSE, 3A A MVI, H CMP,
<, IF, 2 D MVI, ELSE, 1F A MVI, H CMP, <, IF, 3 D MVI,
ELSE, 4 D MVI, THEN, THEN, THEN,
VPERS# X A LDX, D CMP, ( cmp pers new & old )
D VPERS# X STX, <>, IF, VHW VSTATUS X SETX, THEN,
( for runners set commited if change )
RET,
```

---

### <a name="terse-word-50-4c-41-59-41-43-54"></a><span>PLAYACT</span>

Called in intterupt does update prc.

`( -- )`

Reads 'VECTIX', preserves BC/IX, advances vector animation/update through helper routines

```text
CODE PLAYACT ( called in intterupt does update prc )
( assumes vector add in vectix )
B PUSH, X PUSHX,
VECTIX LIXD, VUPDATE# X A LDX, A ANA, ( update # chk )
0=, IF, ' PACTLOAD CALL, ( load new play action )
ELSE, FF CPI, =,
IF, ELSE, A DCR, A VUPDATE# X STX, ( dcr update# )
THEN, THEN, ' ANMSEQLOAD CALL, ' PATFETCH CALL, ( new pat.)
X POPX, B POP, RET,
```

**Calls:** <a href="#terse-word-50-41-43-54-4c-4f-41-44"><code>PACTLOAD</code></a>, <a href="#terse-word-41-4e-4d-53-45-51-4c-4f-41-44"><code>ANMSEQLOAD</code></a>, <a href="#terse-word-50-41-54-46-45-54-43-48"><code>PATFETCH</code></a>.

---

### <a name="terse-word-50-4d-55-53-49-43"></a><span>PMUSIC</span>

Installs a stream unconditionally and sets priority, repeat count and note timer.

`( music-address -- )`

HL consumes music address; RAM priority/timers updated

```text
CODE PMUSIC H POP, loadpc CALL, 1 A MVI, MULTIPLE STA,
PRIORITY STA, NOTETIMER STA, NEXT
```

**Calls:** <a href="#terse-word-6c-6f-61-64-70-63"><code>loadpc</code></a>.

**Used by:** <a href="#terse-word-4d-4f-50-45-4e-45-52-53"><code>MOPENERS</code></a>.

---

### <a name="terse-word-50-54-41-55-54-4f-54-4d"></a><span>PTAUTOTM</span>

Pitch auto timer.

`( -- )`

Calls 'TIMEDCR' for pitch timeout and returns through 'NEXT'

```text
CODE PTAUTOTM ( pitch auto timer )
TIMEOUT H LXI, FLDCLR LDA, A ANA, TIMEDCR CZ, NEXT
```

**Calls:** <a href="#terse-word-54-49-4d-45-44-43-52"><code>TIMEDCR</code></a>.

**Used by:** <a href="#terse-word-57-55-50-57-52-54"><code>WUPWRT</code></a>.

---

### <a name="terse-word-52-45-53-45-54-52-55-4e-4e-45-52-53"></a><span>RESETRUNNERS</span>

Reset runners to order of on base.

`( -- )`

Runs four occupancy-compaction passes using LDIR to move runner records upward; clears runner 4 base/motion, sets its position/pattern/playaction, and stores status 1 to R1, R3, R3 and R4 in the original listing (R2 is not named by those stores).

```text
CODE RESETRUNNERS ( reset runners to order of on base )
<ASSEMBLE 4 A MVI, BEGIN, PSW PUSH,
VWBASE R1 LDA, A ANA, 0<>, IF, VWBASE R2 LDA, A ANA,
RSR2WB JZ, VWBASE R3 LDA, A ANA, RSR3WB JZ, RSR4WB JMP, THEN,
VMAGIC R1 D LXI, VMAGIC R2 H LXI, VLENGTH B LXI, LDIR,
LABEL RSR2WB VMAGIC R2 D LXI, VMAGIC R3 H LXI, VLENGTH B LXI,
LDIR, LABEL RSR3WB VMAGIC R3 D LXI, VMAGIC R4 H LXI,
VLENGTH B LXI, LDIR, LABEL RSR4WB A XRA, VWBASE R4 STA,
VOFW R4 STA, 2800 H LXI, VX R4 SHLD,
A H MOV, A L MOV, VDX R4 SHLD, VDY R4 SHLD,
AC00 H LXI, VY R4 SHLD, NOBOD H LXI, VPAT R4 SHLD, 1 A MVI,
VSTATUS R1 STA, VSTATUS R3 STA, VSTATUS R3 STA,
VSTATUS R4 STA, RUNBPA H LXI, VPLAYACTPC R4 SHLD, PSW POP,
A DCR, 0=, END, ( do 4 tms ) RET, ASSEMBLE> -->
( BB sentry defined routines CHKCAUGHT )
FORWARD OUTOFFF FORWARD CCLEAVE
```

**Used by:** <a href="#terse-word-54-48-52-4f-57-42-41-4c-4c"><code>THROWBALL</code></a>.

---

### <a name="terse-word-52-4e-44"></a><span>RND</span>

Produce a random value scaled to the supplied bound.

`( upper-bound -- random-value )`

Upper bound consumed and scaled random result pushed; random seed advanced

```z80
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
```

**Used by:** <a href="#terse-word-47-52-4e-44-52-48-49-54"><code>GRNDRHIT</code></a>, <a href="#terse-word-49-4e-4c-4f-47"><code>INLOG</code></a>, <a href="#terse-word-4d-55-53-43-50-55"><code>MUSCPU</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-48-49-54"><code>OUTFLDHIT</code></a>, <a href="#terse-word-54-45-52-53-45-43-48-4b"><code>TERSECHK</code></a>, <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>.

---

### <a name="terse-word-52-55-4e-44-53-54"></a><span>RUNDST</span>

Runner base running control.

`( -- )`

IX = runner record; processes base occupancy, auto-forward and movement state

```text
CODE RUNDST ( runner base running control ) <ASSEMBLE
VWBASE X B LDX, NORUN LDA, A ANA, 0<>, IF, ( caught )
X PUSHX, H POP, VMAGIC R1 LDA, L CMP, <>, IF, ( not r1 )
VLENGTH D LXI, A ANA, ( reset cy ) D DSBC, ( runner ahead )
H PUSH, Y POPX, VWBASE Y A LDX, A DCR, B CMP,
=, IF, VATBS VSTATUS Y BITX, 0<>, IF, ( man on next base )
2 A MVI, A VRSTAT X STX, ( go back ) THEN, THEN, THEN, THEN,
VRSTAT X D LDX, VOFW X C LDX, HOMERUN LDA, A ANA, SVAVF JNZ,
VAUTO D BIT, NVAUTO JZ, VFORW D BIT, NVFORW JZ,
C A MOV, ( ofw ) A ANA, RFDST JNZ, SOFW JMP,
LABEL NVFORW C A MOV, ( ofw ) A ANA, CKATBS JZ,
LABEL ROFW A XRA, A VOFW X STX, B DCR, RVGO JMP,
( BB op codes for playaction defined )
LABEL NVAUTO ( runner under player control )
FORW LDA, A ANA, NFORW JZ, C A MOV, ( ofw ) A ANA,
SOFW JZ, VHW VSTATUS X BITX, ( half way ) RFDST JZ,
LABEL SVAVF 3 A MVI, LVRSTAT CALL, ( vauto vforw for all )
RFDST JMP,
LABEL SOFW 1 A MVI, A VOFW X STX,
LABEL RVGO VGO VSTATUS X RESX, RFDST JMP,
LABEL NFORW OFPU LDA, A ANA, NOFPU JZ, ( out field pick up )
2 A MVI, A VRSTAT X STX, ( set vauto & reset vfopu ) NVFORW JMP,
LABEL NOFPU C A MOV, ( ofw ) A ANA, ROFW JNZ,
LABEL CKATBS B DCR, VATBS VSTATUS X BITX, REND JNZ,
LABEL RFDST B A MOV, B PUSH, ( which base )
BSRTBL H LXI, A SLAR, ' INDEXW CALL, D PUSH, H INX,
H INX, M E MOV, H INX, M D MOV, 4 A MVI, ( max vel ) H POP,
( BB op codes for playaction defined )
' DSTCALC CALL, LDFLAG CPI, <>, IF, A ANA, 0<>, IF,
( rchd dest ) VATBS VSTATUS X SETX, VHW VSTATUS X RESX,
VAUTO VRSTAT X RESX, B POP, B PUSH, ( base ) A XRA,
A VOFW X STX, VWBASE X A LDX, B CMP, =, IF, ( rchd nxt base)
A INR, 4 CPI, ( score ? ) =, IF, SCRTIME STA, PSW POP,
FLDCLR LDA, A INR, FLDCLR STA, VACT VSTATUS X SETX,
STND B LXI, OFFPALD JMP, THEN, A VWBASE X STX, THEN,
HOMERUN LDA, A ANA, RVACT JNZ, OFTBLGO LDA, A ANA, REND JNZ,
LBASE LDA, A ANA, REND JNZ, NORUN LDA, A ANA, REND JNZ,
LABEL RVACT VACT VSTATUS X SETX,
LABEL REND RONBS B LXI, VXH X A LDX, 19 CPI, <, IF, ( on 3rd )
LONBS B LXI, THEN, 0 H LXI, 0 D LXI,
ELSE, VATBS VSTATUS X RESX, ( left base )
THEN, RUNPA SBCD, RUNDY SHLD, RUNDX SDED, THEN, PSW POP,
RUNPA H LXI, VECTPC SHLD, B POP, RET, ASSEMBLE> -->
( BB playaction op code OFMOTION , WAITTHRW , BLMOTION , OPTBL )
```

**Calls:** <a href="#terse-word-4c-56-52-53-54-41-54"><code>LVRSTAT</code></a>.

---

### <a name="terse-word-53-45-4e-54-52-59"></a><span>SENTRY</span>

Game loop.

`( -- )`

Native game scheduler; calls tick services, invokes 'TERSECHK', then loops

```text
CODE SENTRY ( game loop ) B PUSH,
TAKEFIELD LDA, A ANA, ' BUTTONCHK CZ,
PITCHTIME LDA, A ANA, ' TBALLPITCH CNZ,
OFTOTBL LDA, A ANA, ' OFLDTBL CNZ,
THROWTIME LDA, A ANA, ' THROWBALL CNZ,
THROWANM LDA, A ANA, ' THROWANIM CNZ,
HITTIME LDA, A ANA, ' BATHIT CNZ,
CAUGHT LDA, A ANA, ' CHKCAUGHT CNZ,
SCRTIME LDA, A ANA, ' CHKSCRTIME CNZ,
STMUSIC LDA, A ANA, ' STARTMUSIC CNZ,
DOVERB TERSECHK ( chk terse flags )
B POP, ' SENTRY JMP, -->
( BB gamestart call    GS )
```

**Calls:** <a href="#terse-word-42-55-54-54-4f-4e-43-48-4b"><code>BUTTONCHK</code></a>, <a href="#terse-word-54-42-41-4c-4c-50-49-54-43-48"><code>TBALLPITCH</code></a>, <a href="#terse-word-4f-46-4c-44-54-42-4c"><code>OFLDTBL</code></a>, <a href="#terse-word-54-48-52-4f-57-42-41-4c-4c"><code>THROWBALL</code></a>, <a href="#terse-word-54-48-52-4f-57-41-4e-49-4d"><code>THROWANIM</code></a>, <a href="#terse-word-42-41-54-48-49-54"><code>BATHIT</code></a>, <a href="#terse-word-43-48-4b-43-41-55-47-48-54"><code>CHKCAUGHT</code></a>, <a href="#terse-word-43-48-4b-53-43-52-54-49-4d-45"><code>CHKSCRTIME</code></a>, <a href="#terse-word-53-54-41-52-54-4d-55-53-49-43"><code>STARTMUSIC</code></a>, <a href="#terse-word-54-45-52-53-45-43-48-4b"><code>TERSECHK</code></a>.

**Used by:** <a href="#terse-word-50-55-50"><code>PUP</code></a>.

---

### <a name="terse-word-53-45-54-41-43-54"></a><span>SETACT</span>

Sets avtive bit in status.

`( -- )`

HL,A input vector/count; VACT set across records

```text
CODE SETACT ( sets avtive bit in status )
( in HL-status 1st guy A- # of guys )
VLENGTH D LXI,
BEGIN, VACT M SET, D DAD, A DCR, 0=, END, RET,
```

**Used by:** <a href="#terse-word-49-4e-46-4c-44-41-43-54"><code>INFLDACT</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-41-43-54"><code>OUTFLDACT</code></a>.

---

### <a name="terse-word-53-54-41-52-54-4d-55-53-49-43"></a><span>STARTMUSIC</span>

Clears its request.

`( -- )`

Selects event music from state flags and dispatches music requests

```text
CODE STARTMUSIC A XRA, STMUSIC STA,
CHEERME LDA, A ANA, 0<>, IF, DOVERB MYAH A XRA, CHEERME STA,
DOVERB S10 7 A MVI, 1 OUT, 2 OUT, 3 OUT, A XRA, 0 OUT, 4 OUT,
ELSE, HOMERUN LDA, A ANA, 0=, IF, DOVERB MFENCE
ELSE, DOVERB MCANNON DOVERB S11 THEN, THEN, RET,
```

**Calls:** <a href="#terse-word-4d-59-41-48"><code>MYAH</code></a>, <a href="#terse-word-53-31-30"><code>S10</code></a>, <a href="#terse-word-4d-46-45-4e-43-45"><code>MFENCE</code></a>, <a href="#terse-word-4d-43-41-4e-4e-4f-4e"><code>MCANNON</code></a>, <a href="#terse-word-53-31-31"><code>S11</code></a>.

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-73-74-72-74-6c-69-6e-65"></a><span>strtline</span>

Given X Y sets up start of line.

`( x y -- )`

Pops X and Y to native registers, computes address/line setup; returns via 'NEXT'

```text
CODE strtline ( given X Y sets up start of line )
H POP, ( y ) D POP, ( x ) E SLAR, D RALR, E SLAR, D RALR,
E SLAR, D RALR, E SLAR, D RALR, E SLAR, D RALR,
E SLAR, D RALR, ( adjust x for relabs ) B PUSH,
0 C MVI,
relabs CALL, 3 ANI, BIT-POS STA, 4000 D LXI, D DAD,
SADR SHLD, B POP, NEXT
```

**Calls:** <a href="#terse-word-72-65-6c-61-62-73"><code>relabs</code></a>.

**Used by:** <a href="#terse-word-44-4c-49-4e-45"><code>DLINE</code></a>.

---

### <a name="terse-word-53-57-41-4e"></a><span>SWAN</span>

Exchange the high and low nibbles of the low byte.

`( value -- nibble-swapped-value )`

High byte unchanged; low byte rotated four bits; result replaces input

```z80
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
```

**Used by:** <a href="#terse-word-45-49"><code>EI</code></a>, <a href="#terse-word-4e-50-4f-53-54"><code>NPOST</code></a>.

---

### <a name="terse-word-54-42-41-4c-4c-50-49-54-43-48"></a><span>TBALLPITCH</span>

Loads pitch velocities.

`( -- )`

Computes pitcher/trackball velocity updates and writes movement fields

```text
CODE TBALLPITCH ( loads pitch velocities )
TBALLYSR H LXI, TBALLDY LDA, 7 A BIT, PSW PUSH, ( sign )
M SUB, EXAF, ( save sub ) PSW POP, ( sign )
0>=, IF, EXAF, ( subtraction )
0>=, IF, M ADD, A M MOV, 3 CPI, >=, IF, 3 A MVI, THEN,
( max = 3 ) A M MOV, THEN, ( if pos and > dy = sr )
ELSE, ( neg dy ) M A MOV, 2 CPI,
>=, IF, M DCR, THEN, ( if neg and sr >= 2 dcr sr )
THEN, M A MOV, A H MOV, 0 L MVI, DI, TBLDY SHLD,
TBALLDX H LXI, 0 D LXI, WLKCNT LDA, 2 CPI, <, IF,
M A MOV, A ANA,
0<>, IF, 7 A BIT, 0=, IF, C0 D LXI, ELSE, FF40 D LXI,
THEN, THEN, THEN, TBLDX SDED, EI, RET,
```

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-54-48-52-4f-57-41-4e-49-4d"></a><span>THROWANIM</span>

Sets up BLDST and player anim.

`( -- )`

Prepares ball/throw vector data; saves/restores IX and IY around native update

```text
CODE THROWANIM ( sets up BLDST and player anim )
X PUSHX, Y PUSHX, DI, A XRA, WHOTHROWS LIXD, GRNDR STA,
THROWANM STA, A VANM# X STX, ( zero plyr deltas )
A VDXL X STX, A VDXH X STX, A VDYL X STX, A VDYH X STX,
VXH X H LDX, H INX, H INX,
VX BL SHLD, VYH X H LDX, VY BL SHLD, ( give ball plyr coor. )
THROWAROUND LDA, A ANA, 0<>, IF, ( thrown to pt after play )
VY PT LHLD, VDSTY BL SHLD, VX PT LDED, 4 B MVI, ( bl vel )
ELSE, ( base throw )
PLAYON LIYD, HITOF LDA, A ANA, VWBASE Y A LDX, 0<>, IF,
( hit outfield ) A ANA, 0=, IF, ( run to 1st ) A INR, THEN,
( BB sentry defined routines )
A D MOV, 0 E MVI, VSTATUS R1 LDA, CHKATBS CALL,
VSTATUS R2 LDA, CHKATBS CALL, VSTATUS R3 LDA, CHKATBS CALL,
VSTATUS R4 LDA, CHKATBS CALL, A XRA, E ORA,
0=, IF, ( everybody on base ) 1 D MVI, THEN, D A MOV,
2 B MVI, ELSE, 5 B MVI, ( throw vel )
THEN, BASEBLAT STA, ( # of base to throw to ) A SLAR,
BASETABLE H LXI, ' INDEXW CALL,
VDSTY BL SDED, H INX, H INX, M E MOV, H INX, M D MOV,
THEN, B A MOV, VVEL BL STA, ( set bl vel )
VDSTX BL SDED, VXH X A LDX, D CMP, <, IF, RTHWPA H LXI,
ELSE, LTHWPA H LXI, THEN, H VPLAYACTPCH X STX,
L VPLAYACTPCL X STX, VACT VSTATUS X SETX,
VGO VSTATUS X RESX, 10 A MVI, THROWTIMER STA,
THROW STA, Y POPX, X POPX, EI, RET, -->
( BB sentry defined routines    CREDARROW MLINN )
```

**Calls:** <a href="#terse-word-43-48-4b-41-54-42-53"><code>CHKATBS</code></a>, <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>.

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-54-48-52-4f-57-42-41-4c-4c"></a><span>THROWBALL</span>

Finish scoring first.

`( -- )`

Builds the pitch or throw state, updates ball vector and runner decisions

```text
CODE THROWBALL FLDCLR LDA, A ANA, RNZ, ( finish scoring first )
A XRA, THROWTIME STA,
BAL H LXI, PITCHTIME LDA, A ANA, 0<>, IF, TBLPA SHLD,
DI, ( pitch ) VX PT LHLD, H DCX, H DCX, H DCX,
H DCX, VX BL SHLD, VY PT LHLD, -7 D LXI, D DAD,
VY BL SHLD, ( give bl pt coor.)
EI, ' RESETRUNNERS CALL, DOVERB WHBODDS DI,
( reset runners ) PITCHBLPA H LXI, 1 A MVI, TBALLYSR STA,
SWINGGO STA, -->
( BB sentry defined routines )
CMPT LDA, A ANA, 0<>, IF, ( computer pitch )
PTRND# LDA, PTTBL H LXI, ' INDEXW CALL, XCHG, ( rnd pitch )
THEN, ELSE, ( hit or throw ) THWPA SHLD, THWBLPA H LXI, THEN,
VPLAYACTPC BL SHLD, VSTATUS BL H LXI, VACT M SET,
VGO M RES, EI, RET,
```

**Calls:** <a href="#terse-word-52-45-53-45-54-52-55-4e-4e-45-52-53"><code>RESETRUNNERS</code></a>, <a href="#terse-word-57-48-42-4f-44-44-53"><code>WHBODDS</code></a>, <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>.

**Used by:** <a href="#terse-word-53-45-4e-54-52-59"><code>SENTRY</code></a>.

---

### <a name="terse-word-54-48-57-41-4e-4d-53-45-54"></a><span>THWANMSET</span>

Set up throw animation.

`( -- )`

Reads thrower vector from IX and stores 'WHOTHROWS'; initializes animation flags

```text
CODE THWANMSET ( set up throw animation )
X PUSHX, H POP, WHOTHROWS SHLD, ( save who throws )
BLERASE CALL, 1 A MVI, INAIR STA,
THROWANM STA, RET, ( set for sentry call )
```

**Calls:** <a href="#terse-word-42-4c-45-52-41-53-45"><code>BLERASE</code></a>.

**Used by:** <a href="#terse-word-57-41-49-54-54-48-52-57"><code>WAITTHRW</code></a>.

---

### <a name="terse-word-54-49-4d-45-52"></a><span>TIMER</span>

Interrupt timer routine.

`( -- )`

Scans game timers with 'TIMEDCR' and invokes native event handlers

```text
CODE TIMER ( interrupt timer routine )
THROWTIMER H LXI, TIMEDCR CALL, A ANA, 0<>, IF,
THROWTIME STA, THEN,
STRINGOFFTIMER H LXI, TIMEDCR CALL,
A ANA, 0<>, IF, STRINGERASE STA, OLDSTRING LDA,
STRING STA, THEN,
TFTIMER H LXI, TIMEDCR CALL, A ANA, 0<>, IF,
TFTIME STA, THEN,
WAITTHROW H LXI, TIMEDCR CALL, A ANA, 0<>, IF,
THROWANM STA, THEN,
CMOFTIMER H LXI, TIMEDCR CALL, A ANA, CMPOF CNZ, DI,
FLSHTIME H LXI, TIMEDCR CALL, A ANA, FLSHWUP CNZ,
TOTIMER H LXI, TIMEDCR CALL, A ANA, TAKEOFF CNZ,
WALK H LXI, TIMEDCR CALL, A ANA, WALKOVER CNZ,
( BB interrupt    PERSPECTIVE )
TOOF H LXI, TIMEDCR CALL, A ANA, TOOFCK CNZ, RET,
```

**Calls:** <a href="#terse-word-54-49-4d-45-44-43-52"><code>TIMEDCR</code></a>, <a href="#terse-word-43-4d-50-4f-46"><code>CMPOF</code></a>, <a href="#terse-word-46-4c-53-48-57-55-50"><code>FLSHWUP</code></a>, <a href="#terse-word-54-41-4b-45-4f-46-46"><code>TAKEOFF</code></a>, <a href="#terse-word-57-41-4c-4b-4f-56-45-52"><code>WALKOVER</code></a>, <a href="#terse-word-54-4f-4f-46-43-4b"><code>TOOFCK</code></a>.

---

### <a name="terse-word-56-45-43-54-4f-52"></a><span>VECTOR</span>

Vectors and limit checks.

`( -- )`

IX = vector record; advances positions and applies hardware limits

```text
CODE VECTOR ( vectors and limit checks )
C001 B LXI, ( y limits ) TAKEFIELD LDA, A ANA, 0=, IF,
VOF VSTATUS X BITX, 0<>, IF, 4009 B LXI, THEN, THEN,
( outfielder limits ) VXH X D LDX, VXL X
E LDX, VDXH X H LDX, VDXL X L LDX,
' DIVHLBY4 CALL, ( comm. resolution ) D DAD,
VBL VSTATUS X BITX, ' CHKGROUNDER CNZ, 1 A MVI, H CMP,
>=, IF, A H MOV, ELSE, 4E A MVI, H CMP, <, IF, A H MOV,
THEN, THEN, H VXH X STX, L VXL X STX, ( limit chk )
VYH X H LDX, VYL X L LDX, VDYH X D LDX, VDYL X E LDX,
D DAD, C A MOV, H CMP, >=, IF, ( low ) A H MOV, ELSE,
B A MOV,
H CMP, <, IF, A H MOV, THEN, THEN, H VYH X STX, L VYL X STX,
RET,
```

**Calls:** <a href="#terse-word-44-49-56-48-4c-42-59-34"><code>DIVHLBY4</code></a>, <a href="#terse-word-43-48-4b-47-52-4f-55-4e-44-45-52"><code>CHKGROUNDER</code></a>.

**Used by:** <a href="#terse-word-63-6e-6c-69-6e-65"><code>cnline</code></a>.

---

### <a name="terse-word-56-45-52-41-53-45"></a><span>VERASE</span>

Does pattern board erase from vector IX.

`( -- )`

IX = vector record; derives previous pattern/screen address and calls native 'writep'

```text
CODE VERASE ( does pattern board erase from vector IX )
VXPAND X B LDX, VMAGIC X C LDX, VPATH X H LDX, VPATL X L LDX,
H INX, H INX, ( abs ) H PUSH, Y POPX,
VSCRADRH X H LDX, VSCRADRL X L LDX,
writep CALL, RET,
```

**Calls:** <a href="#terse-word-77-72-69-74-65-70"><code>writep</code></a>.

**Used by:** <a href="#terse-word-42-4c-45-52-41-53-45"><code>BLERASE</code></a>.

---

### <a name="terse-word-56-57-52-49-54-45"></a><span>VWRITE</span>

Does reloff relabs patbrd from vector IX.

`( -- )`

IX = vector record; derives pattern position, calls 'reloff'/'relabs'/'writep', saves erase address

```text
CODE VWRITE ( does reloff relabs patbrd from vector IX )
VXPAND X B LDX, VMAGIC X C LDX, VXH X D LDX, VXL X E LDX,
VPATH X H LDX, VPATL X L LDX, H PUSH, Y POPX,
VYH X H LDX, VYL X L LDX,
reloff CALL, ( calculates relative offset )
relabs CALL, ( calculates magic add.)
H VSCRADRH X STX, L VSCRADRL X STX, ( set scradr for erase )
writep CALL, ( write it )
C VMAGIC X STX, ( save shift for erase )
RET,
```

**Calls:** <a href="#terse-word-72-65-6c-6f-66-66"><code>reloff</code></a>, <a href="#terse-word-72-65-6c-61-62-73"><code>relabs</code></a>, <a href="#terse-word-77-72-69-74-65-70"><code>writep</code></a>.

---

### <a name="terse-word-57-41-49-54"></a><span>WAIT</span>

Given A wait period stop every thing.

`( -- )`

Uses incoming A as the outer delay count, preserves it on the native stack while an inner $FF-count busy loop runs, decrements the outer count and returns when it reaches zero.

```text
CODE WAIT ( given A wait period stop every thing )
BEGIN, PSW PUSH, 0FF A MVI, BEGIN, A DCR, 0=, END,
PSW POP, A DCR, 0=, END, RET,
```

---

### <a name="terse-word-57-41-49-54-54-48-52-57"></a><span>WAITTHRW</span>

Sets flag for 1stbaseman to wait throw.

`( -- )`

Configures throw animation and wait state; A used for flags, native 'RET'

```text
CODE WAITTHRW ( sets flag for 1stbaseman to wait throw )
' THWANMSET CALL, BASESTATUS LDA, 5 CPI, RZ, A XRA,
THROWANM STA, 20 A MVI, WAITTHROW STA, RET,
```

**Calls:** <a href="#terse-word-54-48-57-41-4e-4d-53-45-54"><code>THWANMSET</code></a>.

---

### <a name="terse-word-57-52-49-54-45"></a><span>WRITE</span>

Write with X Y sizes ; pattern with no header.

`( x y pattern dimensions options -- )`

Stack consumes x,y,pattern,dimensions,options; framebuffer updated

```text
CODE WRITE ( write with X Y sizes ; pattern with no header )
( in- x , y , patadr , y/x size ex/mag )
( WRTSYS set for pattern board res for software write )
( out- pattern on screen )
Y PUSHX, H POP, EXX, B POP, ( ex/mag ) H POP, ( sizes )
Y POPX, ( patadr ) D POP, ( Y ) XTHL, ( H<-X S<-sizes )
XCHG, ( X<-Y ) relabs CALL, D POP, ( sizes )
write CALL, EXX, H PUSH, Y POPX, NEXT
```

**Calls:** <a href="#terse-word-72-65-6c-61-62-73"><code>relabs</code></a>, <a href="#terse-word-77-72-69-74-65"><code>write</code></a>.

**Used by:** <a href="#terse-word-4d-4c-49-4e-4e"><code>MLINN</code></a>.

---

### <a name="terse-word-57-52-49-54-52"></a><span>WRITR</span>

Write with a relative pattern.

`( x y relative-pattern options -- )`

Stack consumes x,y,relative-pattern,options; framebuffer updated

```text
CODE WRITR ( write with a relative pattern )
( in- x , y , relpatadr , ex/mag )
( WRTSYS set for pattern board res for software write )
( out- pattern on screen )
Y PUSHX, H POP, EXX, B POP, Y POPX, H POP, D POP,
reloff CALL, relabs CALL,
writep CALL, EXX, H PUSH, Y POPX, NEXT
```

**Calls:** <a href="#terse-word-72-65-6c-6f-66-66"><code>reloff</code></a>, <a href="#terse-word-72-65-6c-61-62-73"><code>relabs</code></a>, <a href="#terse-word-77-72-69-74-65-70"><code>writep</code></a>.

**Used by:** <a href="#terse-word-46-4c"><code>FL</code></a>, <a href="#terse-word-49-4e-53-43-4e"><code>INSCN</code></a>.

---

### <a name="terse-word-41-55-54-4f-52-31"></a><span>AUTOR1</span>

AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

`( -- )`

Writes automatic-run and active flags into runner 1 status fields

```text
SUBR AUTOR1 3 A MVI, VRSTAT R1 STA, 81 A MVI, VSTATUS R1 STA,
RET, ( sets vauto , vforw , vact , vrun )
```

**Used by:** <a href="#terse-word-46-52-4f-31"><code>FRO1</code></a>, <a href="#terse-word-46-52-4f-31-32"><code>FRO12</code></a>, <a href="#terse-word-46-52-4f-31-32-33"><code>FRO123</code></a>, <a href="#terse-word-52-4f-31"><code>RO1</code></a>, <a href="#terse-word-52-4f-31-32"><code>RO12</code></a>, <a href="#terse-word-52-4f-31-32-33"><code>RO123</code></a>, <a href="#terse-word-52-4f-31-33"><code>RO13</code></a>, <a href="#terse-word-52-4f-32"><code>RO2</code></a>, <a href="#terse-word-52-4f-32-33"><code>RO23</code></a>, <a href="#terse-word-52-4f-33"><code>RO3</code></a>.

---

### <a name="terse-word-41-55-54-4f-52-32"></a><span>AUTOR2</span>

Run second-runner automation logic.

`( -- )`

Writes automatic-run and active flags into runner 2 status fields

```text
SUBR AUTOR2 3 A MVI, VRSTAT R2 STA, 81 A MVI, VSTATUS R2 STA,
RET,
```

**Used by:** <a href="#terse-word-46-52-4f-31-32"><code>FRO12</code></a>, <a href="#terse-word-46-52-4f-31-32-33"><code>FRO123</code></a>, <a href="#terse-word-46-52-4f-31-33"><code>FRO13</code></a>, <a href="#terse-word-52-4f-31-32"><code>RO12</code></a>, <a href="#terse-word-52-4f-31-32-33"><code>RO123</code></a>, <a href="#terse-word-52-4f-31-33"><code>RO13</code></a>, <a href="#terse-word-52-4f-32-33"><code>RO23</code></a>.

---

### <a name="terse-word-41-55-54-4f-52-33"></a><span>AUTOR3</span>

Run third-runner automation logic.

`( -- )`

Writes automatic-run and active flags into runner 3 status fields

```text
SUBR AUTOR3 3 A MVI, VRSTAT R3 STA, 81 A MVI, VSTATUS R3 STA,
RET,
```

**Used by:** <a href="#terse-word-46-52-4f-31-32-33"><code>FRO123</code></a>, <a href="#terse-word-52-4f-31-32-33"><code>RO123</code></a>.

---

### <a name="terse-word-42-4c-45-52-41-53-45"></a><span>BLERASE</span>

Erases ball.

`( -- )`

Saves/restores IX; addresses ball vector, erases image, clears active bit

```text
SUBR BLERASE ( erases ball )
X PUSHX, VMAGIC BL X LXIX, ' VERASE CALL, VACT VSTATUS X RESX,
X POPX, ( stop ball ) NOBOD H LXI, VPAT BL SHLD, RET,
```

**Calls:** <a href="#terse-word-56-45-52-41-53-45"><code>VERASE</code></a>.

**Used by:** <a href="#terse-word-42-41-4c-4c-45-52-41-53-45"><code>BALLERASE</code></a>, <a href="#terse-word-42-41-54-48-49-54-43-48-4b"><code>BATHITCHK</code></a>, <a href="#terse-word-54-48-57-41-4e-4d-53-45-54"><code>THWANMSET</code></a>.

---

### <a name="terse-word-43-48-4b-41-54-42-53"></a><span>CHKATBS</span>

Check if active player at base in- A vstatus.

`( -- )`

A = vector status flags, E = accumulator; increments E if active and not at base

```text
SUBR CHKATBS ( check if active player at base in- A vstatus )
VACT A BIT, RZ, VATBS A BIT, RNZ, E INR, RET,
```

**Used by:** <a href="#terse-word-54-48-52-4f-57-41-4e-49-4d"><code>THROWANIM</code></a>.

---

### <a name="terse-word-43-48-4b-43-4f-49-4e-31"></a><span>CHKCOIN1</span>

Chk door 1 for coin drop.

`( -- )`

Reads coin-door 1 via 'debounce'; updates credits and signals coin event

```text
SUBR CHKCOIN1 ( chk door 1 for coin drop )
CNTM1 LDA, A ANA, 0=, IF, ( waiting for coin )
1 A MVI, 1020 D LXI, 11FE H LXI, debounce CALL,
A ANA, RZ, CNTM1 STA, 20 OUT, CREDITS H LXI, M INR,
UPCRED STA, A XRA, SPBON STA, DOVERB MCOIN RET,
```

**Calls:** <a href="#terse-word-64-65-62-6f-75-6e-63-65"><code>debounce</code></a>, <a href="#terse-word-4d-43-4f-49-4e"><code>MCOIN</code></a>.

---

### <a name="terse-word-43-48-4b-43-4f-49-4e-32"></a><span>CHKCOIN2</span>

Chk door 2 for coin drop.

`( -- )`

Reads coin-door 2 via 'debounce'; updates credits with door/DIP-specific increments

```text
SUBR CHKCOIN2 ( chk door 2 for coin drop )
CNTM2 LDA, A ANA, 0=, IF, ( waiting for coin )
2 A MVI, 1020 D LXI, 11FD H LXI, debounce CALL,
A ANA, RZ, CNTM2 STA, 20 OUT, UPCRED STA,
CREDITS H LXI, 12 IN, 1 A BIT, 0<>, IF, ( susan b dollar )
M INR, M INR, M INR, M INR, M INR, ELSE,
M INR, THEN,
A XRA, SPBON STA, DOVERB MCOIN RET,
```

**Calls:** <a href="#terse-word-64-65-62-6f-75-6e-63-65"><code>debounce</code></a>, <a href="#terse-word-4d-43-4f-49-4e"><code>MCOIN</code></a>.

---

### <a name="terse-word-43-4d-50-4f-46"></a><span>CMPOF</span>

Calculates proper deltas and patterns.

`( -- )`

Selects outfielder vector in IX, computes deltas and activates outfield control

```text
SUBR CMPOF ( calculates proper deltas and patterns )
DI, OFTBLGO LDA, A ANA, RZ, X PUSHX,
VDSTXH BL LDA, 1C CPI, >=, IF, 34 CPI, >=, IF, 0 RF X LXIX,
ELSE, 0 CF X LXIX, THEN, ELSE, 0 LF X LXIX, THEN,
CMFLDR SIXD,
VDSTX BL LHLD, VDSTY BL LDED, 20 A MVI, VGO VSTATUS X RESX,
' DSTCALC CALL, OFDX SDED, OFDY SHLD, OFPA SBCD,
' OUTFLDACT CALL, EI, X POPX, RET,
```

**Calls:** <a href="#terse-word-44-53-54-43-41-4c-43"><code>DSTCALC</code></a>, <a href="#terse-word-4f-55-54-46-4c-44-41-43-54"><code>OUTFLDACT</code></a>.

**Used by:** <a href="#terse-word-42-4c-44-53-54"><code>BLDST</code></a>, <a href="#terse-word-54-49-4d-45-52"><code>TIMER</code></a>, <a href="#terse-word-54-4f-4f-46-43-4b"><code>TOOFCK</code></a>.

---

### <a name="terse-word-43-4f-4c-4f-52-42-41-4e-44"></a><span>COLORBAND</span>

Schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled.

`( saved-interrupt-frame -- )`

Updates INLIN and IPNT; when FLSHSTAY is zero, writes palette ports 3 and 1. Restores AF and HL from its interrupt bridge, then explicitly enables maskable interrupts (EI) and returns.

```text
SUBR COLORBAND NEXT XTHL, PSW PUSH, M A MOV, INLIN OUT,
H INX, IPNT SHLD, FLSHSTAY LDA, A ANA, 0=, IF,
6C A MVI, 3 OUT, 7 A MVI, 1 OUT, THEN,
PSW POP, H POP, EI, RET, ( palette only: preserve AF/HL )
```

---

### <a name="terse-word-64-65-62-6f-75-6e-63-65"></a><span>debounce</span>

Debounce input transitions.

`( -- )`

A = input port, HL = bit mask, DE = sampling duration; returns A = accepted pulse/zero

```text
SUBR debounce <ASSEMBLE
B PUSH, H C MOV, E B MOV, A H MOV, LABEL READPORT
A INP, L XRA, H ANA, 0=, IF, E DCR, 0=, IF, ( good ) A INR,
B POP, RET, THEN, READPORT JMP,
THEN, D DCR, 0=, IF, A XRA, B POP, RET, THEN,
B E MOV, ( try again ) READPORT JMP, ASSEMBLE>
( BB coin routine    CHKCOIN1 )
```

**Used by:** <a href="#terse-word-43-48-4b-43-4f-49-4e-31"><code>CHKCOIN1</code></a>, <a href="#terse-word-43-48-4b-43-4f-49-4e-32"><code>CHKCOIN2</code></a>.

---

### <a name="terse-word-46-45-54-43-48"></a><span>FETCH</span>

Read the current music command byte; INCPC, HLOAD, and PCJUMP provide related stream operations.

`( -- )`

HL ← MUSICPC; A ← byte at HL

```text
SUBR FETCH MUSPC LHLD, M A MOV, RET,
```

**Used by:** <a href="#terse-word-48-4c-4f-41-44"><code>HLOAD</code></a>, <a href="#terse-word-4d-55-53-43-50-55"><code>MUSCPU</code></a>.

---

### <a name="terse-word-46-4c-53-48-57-55-50"></a><span>FLSHWUP</span>

Handle flash callback.

`( -- )`

Saves/restores IX and IY while updating flash timer and callback

```text
SUBR FLSHWUP ( handle flash callback )
X PUSHX, Y PUSHX,
FLSHCNT H LXI, FLSHON LDA, A ANA, M A MOV, 0<>, IF,
A ANA, 0=, IF, 1 M MVI, 28 A MVI, ELSE, 0 M MVI, 8 A MVI,
THEN, FLSHTIME STA, DOVERB FLSHME
ELSE, A ANA, 0<>, IF, 0 M MVI, DOVERB FLSHME THEN,
THEN, Y POPX, X POPX, RET,
```

**Calls:** <a href="#terse-word-46-4c-53-48-4d-45"><code>FLSHME</code></a>.

**Used by:** <a href="#terse-word-46-4c-53-48-4f-46-46"><code>FLSHOFF</code></a>, <a href="#terse-word-54-49-4d-45-52"><code>TIMER</code></a>.

---

### <a name="terse-word-46-4e-42-42"></a><span>FNBB</span>

Native game routine; source body below.

`( -- )`

Native no-op helper; immediate 'RET'

```text
SUBR FNBB RET,
```

---

### <a name="terse-word-46-4f-4e-54-55-4e-50-41-43-4b"></a><span>FONTUNPACK</span>

Reads two packed bytes and starts a five-row unpack loop.

`( -- )`

HL = packed font source; expands bytes into 'FONTWORK'; HL returns its address

```text
SUBR FONTUNPACK B PUSH, M E MOV, H INX, M D MOV,
0 FONTWORK H LXI, 5 B MVI, LABEL FNTLP E A MOV, 7 ANI,
RRC, RRC, RRC, A M MOV, H INX,
D SRLR, E RARR, D SRLR, E RARR, D SRLR, E RARR,
FNTLP DJNZ, B POP, 0 FONTWORK H LXI, RET,
```

**Used by:** <a href="#terse-word-63-70-6f-73-74"><code>cpost</code></a>.

---

### <a name="terse-word-46-52-4f-31"></a><span>FRO1</span>

Uses AUTOR1 to process game state.

`( -- )`

Calls 'AUTOR1'; native 'RET'

```text
SUBR FRO1 AUTOR1 CALL, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>.

---

### <a name="terse-word-46-52-4f-31-32"></a><span>FRO12</span>

Uses AUTOR1 and AUTOR2 to process game state.

`( -- )`

Calls 'AUTOR1', 'AUTOR2'; native 'RET'

```text
SUBR FRO12 AUTOR1 CALL, AUTOR2 CALL, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>, <a href="#terse-word-41-55-54-4f-52-32"><code>AUTOR2</code></a>.

---

### <a name="terse-word-46-52-4f-31-32-33"></a><span>FRO123</span>

Uses AUTOR1 and AUTOR2 to process game state.

`( -- )`

Calls 'AUTOR1', 'AUTOR2', 'AUTOR3'; native 'RET'

```text
SUBR FRO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>, <a href="#terse-word-41-55-54-4f-52-32"><code>AUTOR2</code></a>, <a href="#terse-word-41-55-54-4f-52-33"><code>AUTOR3</code></a>.

---

### <a name="terse-word-46-52-4f-31-33"></a><span>FRO13</span>

Uses AUTOR2 to process game state.

`( -- )`

Writes incoming A to VSTATUS for runner R1, calls AUTOR2 (which sets runner R2 automatic-run/active state), then returns.

```text
SUBR FRO13 VSTATUS R1 STA, AUTOR2 CALL, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-32"><code>AUTOR2</code></a>.

---

### <a name="terse-word-46-52-4f-32"></a><span>FRO2</span>

Native game routine; source body below.

`( -- )`

Stores incoming A in VSTATUS for runner R1 and returns. The original FRO2 body names R1, not R2.

```text
SUBR FRO2 VSTATUS R1 STA, RET,
```

---

### <a name="terse-word-46-52-4f-32-33"></a><span>FRO23</span>

Native game routine; source body below.

`( -- )`

Writes runner-1 and runner-2 status; native 'RET'

```text
SUBR FRO23 VSTATUS R1 STA, VSTATUS R2 STA, RET,
```

---

### <a name="terse-word-46-52-4f-33"></a><span>FRO3</span>

Native game routine; source body below.

`( -- )`

Stores incoming A in VSTATUS for runner R1 and returns. The original FRO3 body names R1, not R3.

```text
SUBR FRO3 VSTATUS R1 STA, RET,
```

---

### <a name="terse-word-48-4c-4f-41-44"></a><span>HLOAD</span>

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

`( -- )`

HL ← zero-extended music byte

```text
SUBR HLOAD FETCH CALL, INCPC CALL, 0 H MVI, A L MOV, RET,
```

**Calls:** <a href="#terse-word-46-45-54-43-48"><code>FETCH</code></a>, <a href="#terse-word-49-4e-43-50-43"><code>INCPC</code></a>.

**Used by:** <a href="#terse-word-4d-55-53-43-50-55"><code>MUSCPU</code></a>.

---

### <a name="terse-word-49-46-53-50-41-4e"></a><span>IFSPAN</span>

Preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value.

`( -- )`

Uses incoming A and C for fielder span calculation; returns native register results

```text
SUBR IFSPAN D PUSH, A H MOV, C L MOV, 0 A MVI,
7 H BIT, 0<>, IF, H A MOV, 7F ANI, 4C CPI,
4 A MVI, CY~, IF, 7 A MVI, THEN, THEN, PSW PUSH,
H A MOV, 7F ANI,
2D ADI, A C MOV, L A MOV, 7F ANI, 2D ADI, C SUB,
A INR, A B MOV, D H MOV, E L MOV, 0 D MVI, C E MOV,
E SRLR, E SRLR, D DAD, PSW POP, A E MOV,
C A MOV, 3 ANI, A D MOV, 0C0 C MVI, D INR,
LABEL IFALIGN D DCR, 0<>, IF, C RRCR, C RRCR,
IFALIGN JMP, THEN, LABEL IFPIX E DCR, 0<>, IF,
M A MOV, C ORA, A M MOV, THEN, C RRCR, C RRCR,
CY, IF, H INX, THEN, IFPIX DJNZ, D POP,
50 H LXI, D DAD, XCHG, RET,
```

**Used by:** <a href="#terse-word-49-4e-46-49-45-4c-44"><code>INFIELD</code></a>.

---

### <a name="terse-word-49-4e-43-50-43"></a><span>INCPC</span>

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

`( -- )`

Loads the 16-bit MUSPC pointer into HL, increments it by one and stores it back; returns natively.

```text
SUBR INCPC MUSPC LHLD, H INX, MUSPC SHLD, RET,
```

**Used by:** <a href="#terse-word-48-4c-4f-41-44"><code>HLOAD</code></a>, <a href="#terse-word-4d-55-53-43-50-55"><code>MUSCPU</code></a>.

---

### <a name="terse-word-6c-6f-61-64-70-63"></a><span>loadpc</span>

Installs MUSPC and STARTPC.

`( -- )`

RAM[MUSPC], RAM[STARTPC] ← HL

```text
SUBR loadpc MUSPC SHLD, STARTPC SHLD, RET,
```

**Used by:** <a href="#terse-word-42-4d-55-53-49-43"><code>BMUSIC</code></a>, <a href="#terse-word-45-4d-55-53-49-43"><code>EMUSIC</code></a>, <a href="#terse-word-50-4d-55-53-49-43"><code>PMUSIC</code></a>.

---

### <a name="terse-word-4c-56-52-53-54-41-54"></a><span>LVRSTAT</span>

Load vstat for all runners in- A value.

`( -- )`

Input A is stored unchanged to VRSTAT for runners R1, R2, R3 and R4; returns natively.

```text
SUBR LVRSTAT ( load vstat for all runners in- A value )
VRSTAT R1 STA, VRSTAT R2 STA, VRSTAT R3 STA, VRSTAT R4 STA,
RET,
```

**Used by:** <a href="#terse-word-42-4c-50-4f-53-43-48-4b"><code>BLPOSCHK</code></a>, <a href="#terse-word-43-48-4b-43-41-55-47-48-54"><code>CHKCAUGHT</code></a>, <a href="#terse-word-52-55-4e-44-53-54"><code>RUNDST</code></a>.

---

### <a name="terse-word-4e-42-42"></a><span>NBB</span>

Do nothing for the empty-bases case.

`( -- )`

Native no-op helper; immediate 'RET'

```text
SUBR NBB RET,
```

---

### <a name="terse-word-4f-46-42-4c-43-48-4b"></a><span>OFBLCHK</span>

Chk for catch or close when cmsw.

`( -- )`

D = maximum catch distance; checks nearby ball/player vectors, returns native result in A

```text
SUBR OFBLCHK ( chk for catch or close when cmsw )
( in- D max distance to check for )
VLENGTH B LXI, VX BL LHLD,
VMAGIC LF Y LXIX, VYH BL LDA, A INR, A E MOV, 3 A MVI,
BEGIN, H PUSH, EXAF, VYH Y A LDX, E SUB, CY, IF, NEG, THEN,
D CMP, ( max dist ) <, IF,
D PUSH, VXH Y D LDX, VXL Y E LDX, A ANA, ( res cy )
D DSBC, ' COMPHL CC, D POP, 10 A MVI, H CMP, >=, IF,
' MULTHLBY4 CALL, H A MOV, D CMP, <, IF, 1 A MVI, H POP, RET,
```

**Calls:** <a href="#terse-word-43-4f-4d-50-48-4c"><code>COMPHL</code></a>, <a href="#terse-word-4d-55-4c-54-48-4c-42-59-34"><code>MULTHLBY4</code></a>.

**Used by:** <a href="#terse-word-42-4c-50-4f-53-43-48-4b"><code>BLPOSCHK</code></a>, <a href="#terse-word-42-55-54-54-4f-4e-43-48-4b"><code>BUTTONCHK</code></a>.

---

### <a name="terse-word-50-43-4a-55-4d-50"></a><span>PCJUMP</span>

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

`( -- )`

Reads MUSPC into HL, fetches the following little-endian target bytes into DE, and stores DE to MUSPC; returns natively.

```text
SUBR PCJUMP MUSPC LHLD, M E MOV, H INX, M D MOV,
MUSPC SDED, RET,
```

**Used by:** <a href="#terse-word-4d-55-53-43-50-55"><code>MUSCPU</code></a>.

---

### <a name="terse-word-72-65-6c-61-62-73"></a><span>relabs</span>

Relative X Y to magic address conversion.

`( -- )`

BC ← expansion/shift; HL ← screen address

```text
SUBR relabs ( relative X Y to magic address conversion )
( in- BC=exp/mag DE=x HL=y )
( out- BC=exp/mag+shift HL=scradr )
H A MOV, 0 H MVI, A L MOV,
H DAD, H DAD, H DAD,
H DAD, D PUSH, L E MOV, H D MOV, H DAD, H DAD, ( *64 )
D DAD, ( *80 ) XCHG, H POP, ( x )
L A MOV, ( SAVE BIT CNT ) H L MOV, 0 H MVI, D DAD, ( x+y )
RLC, RLC, HEX 3 ANI,
MRFLOP C BIT, 0<>, IF, NEG, 0=, IF, H DCX, THEN, THEN,
3 ANI, A E MOV, C A MOV, FC ANI, E ORA, A C MOV, RET,
```

**Used by:** <a href="#terse-word-42-41-54-57-52-49-54-45"><code>BATWRITE</code></a>, <a href="#terse-word-56-57-52-49-54-45"><code>VWRITE</code></a>, <a href="#terse-word-57-52-49-54-45"><code>WRITE</code></a>, <a href="#terse-word-57-52-49-54-52"><code>WRITR</code></a>, <a href="#terse-word-63-70-6f-73-74"><code>cpost</code></a>, <a href="#terse-word-73-74-72-74-6c-69-6e-65"><code>strtline</code></a>.

---

### <a name="terse-word-72-65-6c-6f-66-66"></a><span>reloff</span>

Compute relative offset of x , y of pattern.

`( -- )`

DE ← x offset; HL ← y offset; IY ← absolute pattern

```text
SUBR reloff ( compute relative offset of x , y of pattern )
( in- BC=exp/mag DE=x HL=Y IY=relpatadr )
( out- BC=exp/mag DE=xoff HL=yoff IY=patadr )
H PUSH, XCHG, 0 Y D LDX, 0 E MVI, ( X offset )
D SRAR, E RARR, D SRAR, E RARR,
( MREXP C BIT, 0<>, IF, E SLAR, D RALR, ) ( *2 ) ( THEN, )
MRFLOP C BIT, 0<>, IF, D DAD, ELSE, A ORA, D DSBC, THEN,
XTHL, ( push X+off, HL<-Y ) 1 Y D LDX, 0 E MVI, ( Y offset )
MRFLIP C BIT, 0<>, IF, D DAD, ELSE, A ORA, D DSBC, THEN,
D POP, Y INXX, Y INXX, ( offset pattern ) RET,
```

**Used by:** <a href="#terse-word-42-41-54-57-52-49-54-45"><code>BATWRITE</code></a>, <a href="#terse-word-56-57-52-49-54-45"><code>VWRITE</code></a>, <a href="#terse-word-57-52-49-54-52"><code>WRITR</code></a>.

---

### <a name="terse-word-52-4f-31"></a><span>RO1</span>

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

`( -- )`

Activates runner 1 and selects a native runner pointer in BC, conditional on double-play state

```text
SUBR RO1 AUTOR1 CALL, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R2 B LXI, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>, <a href="#terse-word-53-45-54-44-42-4c-50-4c-41-59"><code>SETDBLPLAY</code></a>.

---

### <a name="terse-word-52-4f-31-32"></a><span>RO12</span>

Activates both forced runners, selecting a double-play or ordinary target.

`( -- )`

Activates runners 1 and 2; selects the next runner pointer in BC

```text
SUBR RO12 AUTOR1 CALL, AUTOR2 CALL,
VMAGIC R2 B LXI, DPHIT LDA, A ANA, SETDBLPLAY JNZ,
VMAGIC R3 B LXI, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>, <a href="#terse-word-41-55-54-4f-52-32"><code>AUTOR2</code></a>, <a href="#terse-word-53-45-54-44-42-4c-50-4c-41-59"><code>SETDBLPLAY</code></a>.

---

### <a name="terse-word-52-4f-31-32-33"></a><span>RO123</span>

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

`( -- )`

Activates runners 1–3; selects runner pointer in BC, conditional on double play

```text
SUBR RO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL,
VMAGIC R3 B LXI, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R1 B LXI, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>, <a href="#terse-word-41-55-54-4f-52-32"><code>AUTOR2</code></a>, <a href="#terse-word-41-55-54-4f-52-33"><code>AUTOR3</code></a>, <a href="#terse-word-53-45-54-44-42-4c-50-4c-41-59"><code>SETDBLPLAY</code></a>.

---

### <a name="terse-word-52-4f-31-33"></a><span>RO13</span>

Handles first-and-third occupancy and may branch through SETDBLPLAY.

`( -- )`

Activates runner 2, then chooses runner pointer and double-play path

```text
SUBR RO13 AUTOR2 CALL, DPHIT LDA, A ANA,
VMAGIC R2 B LXI,
0<>, IF, AUTOR1 CALL, SETDBLPLAY JMP, THEN,
VMAGIC R3 B LXI, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-32"><code>AUTOR2</code></a>, <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>, <a href="#terse-word-53-45-54-44-42-4c-50-4c-41-59"><code>SETDBLPLAY</code></a>.

---

### <a name="terse-word-52-4f-32"></a><span>RO2</span>

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

`( -- )`

Activates runner 1 conditionally; returns BC = runner 2 vector

```text
SUBR RO2 HLSIDE LDA, A ANA, 0=, IF,
AUTOR1 CALL, THEN, VMAGIC R2 B LXI, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>.

---

### <a name="terse-word-52-4f-32-33"></a><span>RO23</span>

Select forced advancement and double-play targets for second- and third-base runners.

`( -- )`

Selects runner 3 in BC, conditionally activating runners 1 and 2

```text
SUBR RO23 VMAGIC R3 B LXI, DPHIT LDA, A ANA,
0<>, IF, AUTOR1 CALL, HLSIDE LDA, A ANA, AUTOR2 CZ, THEN,
RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>, <a href="#terse-word-41-55-54-4f-52-32"><code>AUTOR2</code></a>.

---

### <a name="terse-word-52-4f-33"></a><span>RO3</span>

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

`( -- )`

Selects runner 2 in BC, conditionally activates runner 1

```text
SUBR RO3 VMAGIC R2 B LXI, DPHIT LDA, A ANA,
AUTOR1 CNZ, RET,
```

**Calls:** <a href="#terse-word-41-55-54-4f-52-31"><code>AUTOR1</code></a>.

---

### <a name="terse-word-53-45-54-44-42-4c-50-4c-41-59"></a><span>SETDBLPLAY</span>

Sets up double play HL-guy on 1st.

`( -- )`

Sets DBLPLAY to 1 and returns; HL is documented as the runner-on-first pointer by the original source comment but is not read by this subroutine.

```text
SUBR SETDBLPLAY ( sets up double play HL-guy on 1st )
1 A MVI, DBLPLAY STA, RET,
```

**Used by:** <a href="#terse-word-52-4f-31"><code>RO1</code></a>, <a href="#terse-word-52-4f-31-32"><code>RO12</code></a>, <a href="#terse-word-52-4f-31-32-33"><code>RO123</code></a>, <a href="#terse-word-52-4f-31-33"><code>RO13</code></a>.

---

### <a name="terse-word-54-41-4b-45-4f-46-46"></a><span>TAKEOFF</span>

Turn proper runners on.

`( -- )`

Dispatches runner-activation handler via BC/table and native return trampoline

```text
SUBR TAKEOFF ( turn proper runners on ) <ASSEMBLE
BASESTATUS LDA, WBSFTBL H LXI, ' INDEXW CALL, TORET H LXI,
81 A MVI, ( vact & vrun ) H PUSH, ( ret add.) XCHG, PCHL,
LABEL TORET RET, ASSEMBLE>
( BB hit run and throw for infield grounder )
```

**Calls:** <a href="#terse-word-49-4e-44-45-58-57"><code>INDEXW</code></a>.

**Used by:** <a href="#terse-word-54-49-4d-45-52"><code>TIMER</code></a>.

---

### <a name="terse-word-54-42-41-4c-4c-50-52-43"></a><span>TBALLPRC</span>

Pitch or control outfield.

`( -- )`

Samples trackball port and computes tractor-ball/outfielder velocity state

```text
SUBR TBALLPRC ( pitch or control outfield ) <ASSEMBLE
13 IN, A D MOV, OTBALLX H LXI, M A MOV, A E MOV,
1 XRI, A M MOV, A L MOV, PLYR1UP LDA, A ADD, L ORA, 28 OUT,
E A MOV, A ADD, E ADD, TBALLDX FF AND ADI, A L MOV,
TBALLDX 100 / H MVI, D M MOV, -->
( BB outfield tractor ball running algorithm )
CMPT LDA, A ANA, RNZ, OFTBLGO LDA, A ANA, RZ,
TOOFF LDA, A ANA, RNZ,
TBALLDY H LXI, 1 D MVI, ' TBLVEL CALL, OFDY SHLD, H PUSH,
TBALLDX H LXI, 1 D MVI, ' TBLVEL CALL,
OFDX SHLD, D POP, ( ofdy )
( BB out fielder animation logic )
7 H BIT, 0=, IF, A XRA, H CMP, NZPDX JNZ,
D CMP, NZPDX JNZ, E CMP, NZPDX JNZ,
L CMP, NZPDX JNZ, STND H LXI, ( zero delt)
LDOFPA JMP,
LABEL NZPDX RRUN H LXI, ( pos dx )
ELSE, LRUN H LXI, ( neg dx )
THEN, H PUSH, ' OUTFLDACT CALL, H POP,
LABEL LDOFPA OFPA SHLD, RET, ASSEMBLE>
( BB pitching algorithm    TBALLPITCH )
```

**Calls:** <a href="#terse-word-41-4e-44"><code>AND</code></a>, <a href="#terse-word-54-42-4c-56-45-4c"><code>TBLVEL</code></a>.

---

### <a name="terse-word-54-42-4c-56-45-4c"></a><span>TBLVEL</span>

Tractorball vel HL-# add. D-max vel.

`( -- )`

Inputs HL = velocity-byte address and D = maximum parameter. Reads the signed velocity byte, selects magnitude $80 or $1B0 according to threshold 3, applies the original sign and returns the signed 16-bit result in HL (returns zero if the byte is zero).

```text
SUBR TBLVEL ( tractorball vel HL-# add. D-max vel )
M A MOV, 0 H LXI, A ANA, RZ,
7 A BIT, PSW PUSH, 0<>, IF, NEG, THEN, ( abs. )
80 H LXI, 3 CPI, >=, IF, 1B0 H LXI, THEN,
PSW POP, ' COMPHL CNZ, RET,
```

**Calls:** <a href="#terse-word-43-4f-4d-50-48-4c"><code>COMPHL</code></a>.

**Used by:** <a href="#terse-word-54-42-41-4c-4c-50-52-43"><code>TBALLPRC</code></a>.

---

### <a name="terse-word-54-49-4d-45-44-43-52"></a><span>TIMEDCR</span>

HL-timer add if goes to zero return 1 else 0.

`( -- )`

Input HL addresses a timer byte. If already zero, returns A = 0 without writing; otherwise decrements the byte and returns A = 1 only on transition to zero, or 0 if still nonzero.

```text
SUBR TIMEDCR ( HL-timer add if goes to zero return 1 else 0 )
M A MOV, A ANA, RZ, ( allready zero returns false change )
A DCR, A M MOV, A ANA, 0=, IF, A INR, ( true change )
ELSE, A XRA, THEN, RET,
```

**Used by:** <a href="#terse-word-50-54-41-55-54-4f-54-4d"><code>PTAUTOTM</code></a>, <a href="#terse-word-54-49-4d-45-52"><code>TIMER</code></a>.

---

### <a name="terse-word-54-4f-4f-46-43-4b"></a><span>TOOFCK</span>

Time out outfield check.

`( -- )`

Decrements TOOF#. On a nonzero result, sets TOOF to $FF; when the counter reaches zero, calls CMPOF, enables interrupts (EI), and sets TOOFF to 1; returns natively.

```text
SUBR TOOFCK ( time out outfield check )
TOOF# H LXI, M DCR, 0<>, IF, FF A MVI, TOOF STA,
ELSE, CMPOF CALL, EI, 1 A MVI, TOOFF STA, THEN, RET,
```

**Calls:** <a href="#terse-word-43-4d-50-4f-46"><code>CMPOF</code></a>.

**Used by:** <a href="#terse-word-54-49-4d-45-52"><code>TIMER</code></a>.

---

### <a name="terse-word-57-41-4c-4b-4f-56-45-52"></a><span>WALKOVER</span>

Walked runner at base.

`( -- )`

Sets 'CAUGHT' and 'THROWAROUND' flags to one

```text
SUBR WALKOVER ( walked runner at base )
1 A MVI, CAUGHT STA, THROWAROUND STA, RET,
```

**Used by:** <a href="#terse-word-54-49-4d-45-52"><code>TIMER</code></a>.

---

### <a name="terse-word-77-72-69-74-65"></a><span>write</span>

Software write with x y size.

`( -- )`

Inputs IY = pattern data, BC = expansion/magic/shift, DE = pattern dimensions and HL = screen address. Configures XPAND/MAGIC and writes the pattern through the raster drawing loops; this routine does not flush the shifter automatically.

```text
SUBR write ( software write with x y size )
( IY= patadr BC= ex/magishft DE= Y/X size HL= screenadc )
( does not do shifter flush patterns must flush themselves )
B PUSH, B A MOV, XPAND OUT, C A MOV, MAGIC OUT,
Y PUSHX, B POP, ( patadr ) MRFLOP A BIT, 0<>, IF,
BEGIN, ( y ) D PUSH, H PUSH,
BEGIN, ( x ) B LDAX, A M MOV, H DCX, A M MOV, H DCX,
B INX, E DCR, 0=, END,
H POP, 50 D LXI, D DAD, D POP, D DCR, 0=, END,
ELSE, ( no flop )
BEGIN, ( y ) D PUSH, H PUSH,
BEGIN, ( x ) B LDAX, A M MOV, H INX, A M MOV, H INX,
B INX, E DCR, 0=, END,
H POP, 50 D LXI, D DAD, D POP, D DCR, 0=, END,
THEN, B POP, ( magic ) RET, -->
( VGS write routines    writep , WRITE )
```

**Used by:** <a href="#terse-word-57-52-49-54-45"><code>WRITE</code></a>, <a href="#terse-word-77-72-69-74-65-70"><code>writep</code></a>.

---

### <a name="terse-word-77-72-69-74-65-70"></a><span>writep</span>

Uses IY for the pattern address, BC for expansion/magic and shift settings, and HL for the screen address. Loads the pattern dimensions and transfers to the native drawing routine.

`( -- )`

Inputs: IY points to the size-prefixed pattern, BC holds expansion/magic/shift settings, and HL holds the screen address. Reads pattern X size into E and Y size into D, advances IY past the size bytes, and tail-jumps to write (no local RET).

```text
SUBR writep ( software write with pattern size on pattern )
( IY=patadr BC=ex/mag+shf HL=scradr --- )
0 Y E LDX, ( X size ) Y INXX,
0 Y D LDX, ( Y size ) Y INXX, write JMP,
```

**Calls:** <a href="#terse-word-77-72-69-74-65"><code>write</code></a>.

**Used by:** <a href="#terse-word-42-41-54-57-52-49-54-45"><code>BATWRITE</code></a>, <a href="#terse-word-56-45-52-41-53-45"><code>VERASE</code></a>, <a href="#terse-word-56-57-52-49-54-45"><code>VWRITE</code></a>, <a href="#terse-word-57-52-49-54-52"><code>WRITR</code></a>.

---

### <a name="terse-word-42-41-53-45-21"></a><span>BASE!</span>

Set the number base.

`( base -- )`

```text
{ : BASE! } BASE ! { ; }
```

---

### <a name="terse-word-42-41-53-45-40"></a><span>BASE@</span>

Fetch the current number base.

`( -- base )`

```text
{ : BASE@ } BASE @ { ; }
```

---

## Source notes

The catalog reproduces source implementations where present, including native Z80 routines and TERSE colon definitions. Stack signatures describe TERSE parameter-stack behavior; native register and memory behavior is explained in the implementation description or original source listing where relevant. Source callers are static references, not runtime execution counts.
