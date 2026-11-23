# Extra Bases — TERSE Word Catalog

## TERSE runtime and inherited words (34)

<table>
<tbody>
<tr><td><strong>-</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;difference&nbsp;)</code><br>Subtract the top value from the preceding value.<br><a href="#terse-word-2d" title="View implementation">📄</a></td></tr>
<tr><td><strong>!</strong><br><code>(&nbsp;value&nbsp;address&nbsp;--&nbsp;)</code><br>Store one 16-bit cell.<br><a href="#terse-word-21" title="View implementation">📄</a></td></tr>
<tr><td><strong>@</strong><br><code>(&nbsp;address&nbsp;--&nbsp;value&nbsp;)</code><br>Fetch one 16-bit cell.<br><a href="#terse-word-40" title="View implementation">📄</a></td></tr>
<tr><td><strong>*</strong><br><code>(&nbsp;m&nbsp;n&nbsp;--&nbsp;product&nbsp;)</code><br>Multiply two stack values.<br><a href="#terse-word-2a" title="View implementation">📄</a></td></tr>
<tr><td><strong>/</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;quotient&nbsp;)</code><br>Divide the preceding stack value by the top value.<br><a href="#terse-word-2f" title="View implementation">📄</a></td></tr>
<tr><td><strong>+</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;sum&nbsp;)</code><br>Add two stack values.<br><a href="#terse-word-2b" title="View implementation">📄</a></td></tr>
<tr><td><strong>&lt;</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code><br>Compare whether the preceding value is less than the top value.<br><a href="#terse-word-3c" title="View implementation">📄</a></td></tr>
<tr><td><strong>=</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code><br>Compare two values for equality.<br><a href="#terse-word-3d" title="View implementation">📄</a></td></tr>
<tr><td><strong>&gt;</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code><br>Compare whether the preceding value is greater than the top value.<br><a href="#terse-word-3e" title="View implementation">📄</a></td></tr>
<tr><td><strong>0=</strong><br><code>(&nbsp;n&nbsp;--&nbsp;flag&nbsp;)</code><br>Return a condition indicating zero.<br><a href="#terse-word-30-3d" title="View implementation">📄</a></td></tr>
<tr><td><strong>2DUP</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;a&nbsp;b&nbsp;a&nbsp;b&nbsp;)</code><br>Duplicate the top two stack cells.<br><a href="#terse-word-32-44-55-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>AND</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code><br>Bitwise AND of two values.<br><a href="#terse-word-41-4e-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>ARRAY</strong><br><code>(&nbsp;size&nbsp;--&nbsp;)</code><br>Allocate/name an indexed cell array from a the size.<br><a href="#terse-word-41-52-52-41-59" title="View implementation">📄</a></td></tr>
<tr><td><strong>B!</strong><br><code>(&nbsp;byte&nbsp;address&nbsp;--&nbsp;)</code><br>Store one byte.<br><a href="#terse-word-42-21" title="View implementation">📄</a></td></tr>
<tr><td><strong>B@</strong><br><code>(&nbsp;address&nbsp;--&nbsp;byte&nbsp;)</code><br>Fetch one byte.<br><a href="#terse-word-42-40" title="View implementation">📄</a></td></tr>
<tr><td><strong>BARRAY</strong><br><code>(&nbsp;size&nbsp;--&nbsp;)</code><br>Allocate/name an indexed byte array from a the size.<br><a href="#terse-word-42-41-52-52-41-59" title="View implementation">📄</a></td></tr>
<tr><td><strong>BEGIN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Immediate XC wrapper that records a loop's object address.<br><a href="#terse-word-42-45-47-49-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>CODE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry.<br><a href="#terse-word-43-4f-44-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>CONSTANT</strong><br><code>(&nbsp;value&nbsp;--&nbsp;)</code><br>Define a constant from a value.<br><a href="#terse-word-43-4f-4e-53-54-41-4e-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>DECIMAL</strong><br><code>(&nbsp;--&nbsp;)</code><br>Select radix ten for parsing subsequent source numbers.<br><a href="#terse-word-44-45-43-49-4d-41-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>DROP</strong><br><code>(&nbsp;x&nbsp;--&nbsp;)</code><br>Discard the top stack cell.<br><a href="#terse-word-44-52-4f-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>DUP</strong><br><code>(&nbsp;x&nbsp;--&nbsp;x&nbsp;x&nbsp;)</code><br>Duplicate the top stack cell.<br><a href="#terse-word-44-55-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>ELSE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch.<br><a href="#terse-word-45-4c-53-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>END</strong><br><code>(&nbsp;flag&nbsp;--&nbsp;)</code><br>Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true.<br><a href="#terse-word-45-4e-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>HEX</strong><br><code>(&nbsp;--&nbsp;)</code><br>Select radix sixteen for parsing subsequent source numbers.<br><a href="#terse-word-48-45-58" title="View implementation">📄</a></td></tr>
<tr><td><strong>IF</strong><br><code>(&nbsp;flag&nbsp;--&nbsp;)</code><br>Immediate XC wrapper that emits a conditional target branch through XC-IF.<br><a href="#terse-word-49-46" title="View implementation">📄</a></td></tr>
<tr><td><strong>LIT</strong><br><code>(&nbsp;--&nbsp;value&nbsp;)</code><br>Compiler literal mechanism used by INEXT's host macro.<br><a href="#terse-word-4c-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>OR</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code><br>Bitwise inclusive OR of two values.<br><a href="#terse-word-4f-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>OVER</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;a&nbsp;b&nbsp;a&nbsp;)</code><br>Copy the second stack cell to the top.<br><a href="#terse-word-4f-56-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>ROT</strong><br><code>(&nbsp;a&nbsp;b&nbsp;c&nbsp;--&nbsp;b&nbsp;c&nbsp;a&nbsp;)</code><br>Rotate the top three stack cells.<br><a href="#terse-word-52-4f-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>SWAP</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;b&nbsp;a&nbsp;)</code><br>Exchange the top two stack cells.<br><a href="#terse-word-53-57-41-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>THEN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Immediate XC wrapper that resolves a saved target branch destination.<br><a href="#terse-word-54-48-45-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>VARIABLE</strong><br><code>(&nbsp;initial-value&nbsp;--&nbsp;)</code><br>Allocate/name a cell variable with the initial value in this dialect.<br><a href="#terse-word-56-41-52-49-41-42-4c-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>XOR</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code><br>Bitwise exclusive OR of two values.<br><a href="#terse-word-58-4f-52" title="View implementation">📄</a></td></tr>
</tbody>
</table>

## Extra Bases colon definitions (201)

<table>
<tbody>
<tr><td><strong>]'[</strong><br><code>(&nbsp;--&nbsp;)</code><br>Source-level compiler/TERSE definition shown below.<br><a href="#terse-word-5d-27-5b" title="View implementation">📄</a></td></tr>
<tr><td><strong>^</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses ABVOLS and MCVOLS to compose game logic.<br><a href="#terse-word-5e" title="View implementation">📄</a></td></tr>
<tr><td><strong>&lt;INTERRUPTS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Mark the start of interrupt data.<br><a href="#terse-word-3c-49-4e-54-45-52-52-55-50-54-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>ABVOLS</strong><br><code>(&nbsp;volume&nbsp;--&nbsp;)</code><br>Emit the music volume command.<br><a href="#terse-word-41-42-56-4f-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>ACT,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit a playaction record.<br><a href="#terse-word-41-43-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>ANOTE</strong><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code><br>Emit a channel A note followed by its duration.<br><a href="#terse-word-41-4e-4f-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>ATONE</strong><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code><br>Emit tone setting for channel A.<br><a href="#terse-word-41-54-4f-4e-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>BACT,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit a ball-action record.<br><a href="#terse-word-42-41-43-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>BALLTIME</strong><br><code>(&nbsp;--&nbsp;)</code><br>Balls process.<br><a href="#terse-word-42-41-4c-4c-54-49-4d-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>BLDST,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the ball destination command.<br><a href="#terse-word-42-4c-44-53-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>BLMOT,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the ball motion command.<br><a href="#terse-word-42-4c-4d-4f-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>BNOTE</strong><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code><br>Emit a channel B note followed by its duration.<br><a href="#terse-word-42-4e-4f-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>BONE</strong><br><code>(&nbsp;address&nbsp;--&nbsp;)</code><br>Store byte value 1.<br><a href="#terse-word-42-4f-4e-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>BTONE</strong><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code><br>Emit tone setting for channel B.<br><a href="#terse-word-42-54-4f-4e-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>BV</strong><br><code>(&nbsp;--&nbsp;)</code><br>Define a named byte variable.<br><a href="#terse-word-42-56" title="View implementation">📄</a></td></tr>
<tr><td><strong>BV=</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BV to compose game logic.<br><a href="#terse-word-42-56-3d" title="View implementation">📄</a></td></tr>
<tr><td><strong>BZERO</strong><br><code>(&nbsp;address&nbsp;--&nbsp;)</code><br>Store byte value 0.<br><a href="#terse-word-42-5a-45-52-4f" title="View implementation">📄</a></td></tr>
<tr><td><strong>C=</strong><br><code>(&nbsp;value&nbsp;--&nbsp;)</code><br>Uses CONSTANT to compose game logic.<br><a href="#terse-word-43-3d" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHGS</strong><br><code>(&nbsp;--&nbsp;)</code><br>CHGS posts CHANGE SIDES;<br><a href="#terse-word-43-48-47-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHKFLSHSTAY</strong><br><code>(&nbsp;--&nbsp;)</code><br>When isccp turn off check for wupwrt.<br><a href="#terse-word-43-48-4b-46-4c-53-48-53-54-41-59" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHKGMCNT</strong><br><code>(&nbsp;--&nbsp;credits&nbsp;)</code><br>CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte.<br><a href="#terse-word-43-48-4b-47-4d-43-4e-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>CMAJOR</strong><br><code>(&nbsp;--&nbsp;)</code><br>Initialize the C-major sound pattern.<br><a href="#terse-word-43-4d-41-4a-4f-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>CNLINE</strong><br><code>(&nbsp;--&nbsp;)</code><br>CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state.<br><a href="#terse-word-43-4e-4c-49-4e-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>CNOTE</strong><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code><br>Emit a channel C note followed by its duration.<br><a href="#terse-word-43-4e-4f-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>CONGR</strong><br><code>(&nbsp;--&nbsp;)</code><br>Display the congratulatory prompt.<br><a href="#terse-word-43-4f-4e-47-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>CPOST</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;char&nbsp;--&nbsp;)</code><br>Draw one character at the specified position.<br><a href="#terse-word-43-50-4f-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>CREDARROW</strong><br><code>(&nbsp;--&nbsp;)</code><br>Update last inning arrow.<br><a href="#terse-word-43-52-45-44-41-52-52-4f-57" title="View implementation">📄</a></td></tr>
<tr><td><strong>CTONE</strong><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code><br>Emit tone setting for channel C.<br><a href="#terse-word-43-54-4f-4e-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>DEACT,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit vector-deactivation command.<br><a href="#terse-word-44-45-41-43-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>DLINE</strong><br><code>(&nbsp;x1&nbsp;y1&nbsp;x2&nbsp;y2&nbsp;--&nbsp;)</code><br>Draw a line , given X Y start coor X Y ending coor.<br><a href="#terse-word-44-4c-49-4e-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>DOCHGS</strong><br><code>(&nbsp;--&nbsp;)</code><br>DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER;<br><a href="#terse-word-44-4f-43-48-47-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>DOEHOMER</strong><br><code>(&nbsp;--&nbsp;)</code><br>DOEHOMER only posts the text.<br><a href="#terse-word-44-4f-45-48-4f-4d-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>DOGOVER</strong><br><code>(&nbsp;--&nbsp;)</code><br>Do game over.<br><a href="#terse-word-44-4f-47-4f-56-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>DOHOMER</strong><br><code>(&nbsp;--&nbsp;)</code><br>DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer;<br><a href="#terse-word-44-4f-48-4f-4d-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>DOSAFE</strong><br><code>(&nbsp;--&nbsp;)</code><br>DOSAFE combines music/text.<br><a href="#terse-word-44-4f-53-41-46-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>DOSBALL</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.<br><a href="#terse-word-44-4f-53-42-41-4c-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>DOSOUT</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.<br><a href="#terse-word-44-4f-53-4f-55-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>DOSSTRIKE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.<br><a href="#terse-word-44-4f-53-53-54-52-49-4b-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>DP1</strong><br><code>(&nbsp;--&nbsp;)</code><br>Display the one-coin deposit prompt.<br><a href="#terse-word-44-50-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>DP12CN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses B@ and SPOST to compose game logic.<br><a href="#terse-word-44-50-31-32-43-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>DP1CN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses SPOST to compose game logic.<br><a href="#terse-word-44-50-31-43-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>DPCN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Wait for next coin.<br><a href="#terse-word-44-50-43-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>dpost</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;nibble&nbsp;--&nbsp;x&nbsp;y&nbsp;options&nbsp;)</code><br>dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.<br><a href="#terse-word-64-70-6f-73-74" title="View implementation">📄</a></td></tr>
<tr><td><strong>DTC</strong><br><code>(&nbsp;--&nbsp;)</code><br>DTC selects decimal and invokes the host editor.<br><a href="#terse-word-44-54-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>DURATION</strong><br><code>(&nbsp;duration&nbsp;--&nbsp;)</code><br>Emit a note-duration command.<br><a href="#terse-word-44-55-52-41-54-49-4f-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>DWAIT</strong><br><code>(&nbsp;limit&nbsp;--&nbsp;)</code><br>DWAIT runs nested loops with interrupts enabled and disables them on return;<br><a href="#terse-word-44-57-41-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>F=</strong><br><code>(&nbsp;--&nbsp;)</code><br>Declare a forward word with the game's source shorthand.<br><a href="#terse-word-46-3d" title="View implementation">📄</a></td></tr>
<tr><td><strong>F1STLS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Select the first-base left-side action.<br><a href="#terse-word-46-31-53-54-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>F1STRS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Select the first-base right-side action.<br><a href="#terse-word-46-31-53-54-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>F2NDLS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-46-32-4e-44-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>F2NDRS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-46-32-4e-44-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>F3RDLS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Select the third-base left-side action.<br><a href="#terse-word-46-33-52-44-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>F3RDRS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Select the third-base right-side action.<br><a href="#terse-word-46-33-52-44-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>FBLLS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-46-42-4c-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>FBLRS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-46-42-4c-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>FIELDWRT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Write field outline.<br><a href="#terse-word-46-49-45-4c-44-57-52-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>FL</strong><br><code>(&nbsp;--&nbsp;)</code><br>Set up all of background.<br><a href="#terse-word-46-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>FLDDST,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the fielder destination command.<br><a href="#terse-word-46-4c-44-44-53-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>FLFILL</strong><br><code>(&nbsp;--&nbsp;)</code><br>FLFILL fills the background while allowing interrupts;<br><a href="#terse-word-46-4c-46-49-4c-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>FLSHME</strong><br><code>(&nbsp;--&nbsp;)</code><br>FLSHME executes only a nonzero address whose top two bits are clear;<br><a href="#terse-word-46-4c-53-48-4d-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>FLSHTON</strong><br><code>(&nbsp;--&nbsp;)</code><br>FLSHTON saves a callback and starts its timer.<br><a href="#terse-word-46-4c-53-48-54-4f-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>FOULTIME</strong><br><code>(&nbsp;--&nbsp;)</code><br>Foulball process.<br><a href="#terse-word-46-4f-55-4c-54-49-4d-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>FOWR</strong><br><code>(&nbsp;--&nbsp;)</code><br>Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.<br><a href="#terse-word-46-4f-57-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>FSSLS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-46-53-53-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>FSSRS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-46-53-53-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>GETF</strong><br><code>(&nbsp;--&nbsp;index&nbsp;field-byte&nbsp;)</code><br>GETF fetches FIELD bytes sequentially;<br><a href="#terse-word-47-45-54-46" title="View implementation">📄</a></td></tr>
<tr><td><strong>GRNDRACTION</strong><br><code>(&nbsp;sector&nbsp;--&nbsp;)</code><br>Consumes a selected hit-sector index, executes its `GSTBL` word, then installs the appropriate fielder playaction addresses.<br><a href="#terse-word-47-52-4e-44-52-41-43-54-49-4f-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>GRNDRHIT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Computes a ground-ball sector from randomized timing and pitch direction, dispatches `GRNDRACTION`, then sets ball destination.<br><a href="#terse-word-47-52-4e-44-52-48-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>HITDST</strong><br><code>(&nbsp;--&nbsp;)</code><br>Chooses hit location.<br><a href="#terse-word-48-49-54-44-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>HLLS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-48-4c-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>HLS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-48-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>HMS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-48-4d-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>HOM</strong><br><code>(&nbsp;--&nbsp;)</code><br>HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;<br><a href="#terse-word-48-4f-4d" title="View implementation">📄</a></td></tr>
<tr><td><strong>HRBY2</strong><br><code>(&nbsp;--&nbsp;)</code><br>HRBY2 halves HRAT.<br><a href="#terse-word-48-52-42-59-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>HRLS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-48-52-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>HRS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BONE to compose game logic.<br><a href="#terse-word-48-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>I'</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the target's indexed immediate reference.<br><a href="#terse-word-49-27" title="View implementation">📄</a></td></tr>
<tr><td><strong>ICODE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Defines the native interrupt handler and emits its Z80 register-save prologue in the host compiler.<br><a href="#terse-word-49-43-4f-44-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>INEXT</strong><br><code>(&nbsp;--&nbsp;)</code><br>INEXT emits a jump to IEX;<br><a href="#terse-word-49-4e-45-58-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>INLOG</strong><br><code>(&nbsp;--&nbsp;)</code><br>Infield master logic.<br><a href="#terse-word-49-4e-4c-4f-47" title="View implementation">📄</a></td></tr>
<tr><td><strong>INNODDS</strong><br><code>(&nbsp;--&nbsp;)</code><br>INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state;<br><a href="#terse-word-49-4e-4e-4f-44-44-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>INSCN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Insert coin call.<br><a href="#terse-word-49-4e-53-43-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>INSTRC</strong><br><code>(&nbsp;--&nbsp;)</code><br>Instructions.<br><a href="#terse-word-49-4e-53-54-52-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>INSWAIT</strong><br><code>(&nbsp;count&nbsp;--&nbsp;)</code><br>INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.<br><a href="#terse-word-49-4e-53-57-41-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>INTERRUPTS&gt;</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the interrupt-vector dispatch jump.<br><a href="#terse-word-49-4e-54-45-52-52-55-50-54-53-3e" title="View implementation">📄</a></td></tr>
<tr><td><strong>INTHIGHRES</strong><br><code>(&nbsp;--&nbsp;)</code><br>Intialize screen for commercial mode.<br><a href="#terse-word-49-4e-54-48-49-47-48-52-45-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>ISCN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Display the V15 instruction message.<br><a href="#terse-word-49-53-43-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>LABLE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Provide the original source's label-definition alias.<br><a href="#terse-word-4c-41-42-4c-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>LCB,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses ACT, and DEACT, to compose game logic.<br><a href="#terse-word-4c-43-42-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>LDINFLDPA</strong><br><code>(&nbsp;--&nbsp;)</code><br>LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.<br><a href="#terse-word-4c-44-49-4e-46-4c-44-50-41" title="View implementation">📄</a></td></tr>
<tr><td><strong>LDPC</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit/load the music program-counter value.<br><a href="#terse-word-4c-44-50-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>LDPCC</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit/load a music program-counter command.<br><a href="#terse-word-4c-44-50-43-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>LK,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BACT, and DEACT, to compose game logic.<br><a href="#terse-word-4c-4b-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>LSETTFCOOR</strong><br><code>(&nbsp;--&nbsp;)</code><br>Set take field coor & status -active , xpand.<br><a href="#terse-word-4c-53-45-54-54-46-43-4f-4f-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>MASTER</strong><br><code>(&nbsp;--&nbsp;)</code><br>Define the game's master music stream.<br><a href="#terse-word-4d-41-53-54-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>MBALL</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-42-41-4c-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>MCANNON</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-43-41-4e-4e-4f-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>MCOIN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-43-4f-49-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>MCVOLS</strong><br><code>(&nbsp;volume&nbsp;--&nbsp;)</code><br>Emit music-channel volume values.<br><a href="#terse-word-4d-43-56-4f-4c-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>MFENCE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-46-45-4e-43-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>MFOUL</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-46-4f-55-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>MHIT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-48-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>MLINN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Mark last inning.<br><a href="#terse-word-4d-4c-49-4e-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>MOPENERS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses PMUSIC to compose game logic.<br><a href="#terse-word-4d-4f-50-45-4e-45-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>MOUT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-4f-55-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>MSAFE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-53-41-46-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>MSTRIKE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-53-54-52-49-4b-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>MYAH</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses BMUSIC to compose game logic.<br><a href="#terse-word-4d-59-41-48" title="View implementation">📄</a></td></tr>
<tr><td><strong>NOISE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit a noise/sound command.<br><a href="#terse-word-4e-4f-49-53-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>NOTES</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses ATONE and BTONE to compose game logic.<br><a href="#terse-word-4e-4f-54-45-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>NPOST</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;address&nbsp;length&nbsp;--&nbsp;)</code><br>Post a bcd number on the screen ; see options.<br><a href="#terse-word-4e-50-4f-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>OFFDST,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the outfielder destination command.<br><a href="#terse-word-4f-46-46-44-53-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>OFMOT,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the outfield motion command.<br><a href="#terse-word-4f-46-4d-4f-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>ON1ST,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the first-base playaction command.<br><a href="#terse-word-4f-4e-31-53-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>ON2ND,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the second-base playaction command.<br><a href="#terse-word-4f-4e-32-4e-44-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>ON3RD,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the third-base playaction command.<br><a href="#terse-word-4f-4e-33-52-44-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>OUTFLDHIT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Fly ball.<br><a href="#terse-word-4f-55-54-46-4c-44-48-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>OUTLINE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;--&nbsp;)</code><br>Creates rectanguler outline.<br><a href="#terse-word-4f-55-54-4c-49-4e-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>OUTTIME</strong><br><code>(&nbsp;--&nbsp;)</code><br>Out prc.<br><a href="#terse-word-4f-55-54-54-49-4d-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>PLRCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br>PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL;<br><a href="#terse-word-50-4c-52-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>PLRSELECT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Select singel player or 2 player.<br><a href="#terse-word-50-4c-52-53-45-4c-45-43-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>PPOST</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;string&nbsp;--&nbsp;x&nbsp;y&nbsp;options&nbsp;)</code><br>Draw a counted string and keep drawing coordinates.<br><a href="#terse-word-50-50-4f-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>PUP</strong><br><code>(&nbsp;--&nbsp;)</code><br>Power up routine.<br><a href="#terse-word-50-55-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>PX0</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit zero/white pixel patterns and define PX1/PX0 to select them.<br><a href="#terse-word-50-58-30" title="View implementation">📄</a></td></tr>
<tr><td><strong>PX1</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit zero/white pixel patterns and define PX1/PX0 to select them.<br><a href="#terse-word-50-58-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>QUIET</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses ABVOLS and MCVOLS to compose game logic.<br><a href="#terse-word-51-55-49-45-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>QUIT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses HERE and LDPC to compose game logic.<br><a href="#terse-word-51-55-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>RCB,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses ACT, and DEACT, to compose game logic.<br><a href="#terse-word-52-43-42-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>RDRNDNTE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit a randomized note with a rest interval.<br><a href="#terse-word-52-44-52-4e-44-4e-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>RECLINE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;options&nbsp;--&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;options&nbsp;)</code><br>Draws a horizontal rectangle row without consuming the five retained rectangle arguments.<br><a href="#terse-word-52-45-43-4c-49-4e-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>RECTAN</strong><br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;--&nbsp;)</code><br>In X, Y, X length, Y length, pxtype set.<br><a href="#terse-word-52-45-43-54-41-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>REST</strong><br><code>(&nbsp;duration&nbsp;--&nbsp;)</code><br>Insert a silent music interval.<br><a href="#terse-word-52-45-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>REST,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit a resting playaction record.<br><a href="#terse-word-52-45-53-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>RETPA</strong><br><code>(&nbsp;--&nbsp;)</code><br>Return to position pa.<br><a href="#terse-word-52-45-54-50-41" title="View implementation">📄</a></td></tr>
<tr><td><strong>RNDNTE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit a randomized musical note.<br><a href="#terse-word-52-4e-44-4e-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>RRRNDNTE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit a sequence of randomized notes.<br><a href="#terse-word-52-52-52-4e-44-4e-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>RUN1CHK1ST</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code><br>Selects the runner vector for an occupied first-base slot, or delegates to the next occupancy test.<br><a href="#terse-word-52-55-4e-31-43-48-4b-31-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>RUN1CHK2ND</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code><br>Chooses the next runner vector according to runner 1's second-base occupancy.<br><a href="#terse-word-52-55-4e-31-43-48-4b-32-4e-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>RUN2CHK</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code><br>Returns the runner code and vector for the next open base.<br><a href="#terse-word-52-55-4e-32-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>RUN2CHK12ND</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code><br>Returns runner 2 or 3 vector based on second-base occupancy.<br><a href="#terse-word-52-55-4e-32-43-48-4b-31-32-4e-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>RUN2CHK1ST</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code><br>Chooses runner 3 or delegates according to runner 2's first-base state.<br><a href="#terse-word-52-55-4e-32-43-48-4b-31-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>RUN3CHK</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code><br>Returns runner 3 or 4 code/vector from third runner's occupancy.<br><a href="#terse-word-52-55-4e-33-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>RUNDST,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the runner destination command.<br><a href="#terse-word-52-55-4e-44-53-54-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>S!</strong><br><code>(&nbsp;address&nbsp;value&nbsp;--&nbsp;)</code><br>Store cell with address-first arguments.<br><a href="#terse-word-53-21" title="View implementation">📄</a></td></tr>
<tr><td><strong>S10</strong><br><code>(&nbsp;--&nbsp;)</code><br>S10 starts INTERRUPTS0 through ISTART;<br><a href="#terse-word-53-31-30" title="View implementation">📄</a></td></tr>
<tr><td><strong>S11</strong><br><code>(&nbsp;--&nbsp;)</code><br>S11 starts INTERRUPTS1.<br><a href="#terse-word-53-31-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>SB!</strong><br><code>(&nbsp;address&nbsp;value&nbsp;--&nbsp;)</code><br>Store byte with address-first arguments.<br><a href="#terse-word-53-42-21" title="View implementation">📄</a></td></tr>
<tr><td><strong>SBALL1</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Draw the BALL 1 message.<br><a href="#terse-word-53-42-41-4c-4c-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>SBALL2</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Draw the BALL 2 message.<br><a href="#terse-word-53-42-41-4c-4c-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>SBALL3</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Draw the BALL 3 message.<br><a href="#terse-word-53-42-41-4c-4c-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>SBO</strong><br><code>(&nbsp;--&nbsp;)</code><br>SBO posts the three $30-based count characters at their fixed positions.<br><a href="#terse-word-53-42-4f" title="View implementation">📄</a></td></tr>
<tr><td><strong>SCOREME</strong><br><code>(&nbsp;--&nbsp;)</code><br>Plop scores up.<br><a href="#terse-word-53-43-4f-52-45-4d-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>SCRERASE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Erase entire screen.<br><a href="#terse-word-53-43-52-45-52-41-53-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>SCRS</strong><br><code>(&nbsp;--&nbsp;)</code><br>SCRS clears two score rectangles and draws zero score characters.<br><a href="#terse-word-53-43-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>SETFDST</strong><br><code>(&nbsp;--&nbsp;)</code><br>Set up fielder destination values.<br><a href="#terse-word-53-45-54-46-44-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>SETTF</strong><br><code>(&nbsp;--&nbsp;)</code><br>SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.<br><a href="#terse-word-53-45-54-54-46" title="View implementation">📄</a></td></tr>
<tr><td><strong>SETTFPA</strong><br><code>(&nbsp;--&nbsp;)</code><br>Take field pa.<br><a href="#terse-word-53-45-54-54-46-50-41" title="View implementation">📄</a></td></tr>
<tr><td><strong>SFOUL</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses ROT and SPOST to compose game logic.<br><a href="#terse-word-53-46-4f-55-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>SGO</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses SPOST to compose game logic.<br><a href="#terse-word-53-47-4f" title="View implementation">📄</a></td></tr>
<tr><td><strong>SHOMER</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses ROT and SPOST to compose game logic.<br><a href="#terse-word-53-48-4f-4d-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>SORRY</strong><br><code>(&nbsp;--&nbsp;)</code><br>Display the losing-player prompt.<br><a href="#terse-word-53-4f-52-52-59" title="View implementation">📄</a></td></tr>
<tr><td><strong>SOUT1</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Draw the 1 OUT message.<br><a href="#terse-word-53-4f-55-54-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>SOUT2</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Draw the 2 OUT message.<br><a href="#terse-word-53-4f-55-54-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>SOUT3</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Draw the 3 OUT message.<br><a href="#terse-word-53-4f-55-54-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>SPLR</strong><br><code>(&nbsp;--&nbsp;)</code><br>SPLR12/SPLR display available player choices;<br><a href="#terse-word-53-50-4c-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>SPLR12</strong><br><code>(&nbsp;--&nbsp;)</code><br>SPLR12/SPLR display available player choices;<br><a href="#terse-word-53-50-4c-52-31-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>SPOST</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;string&nbsp;--&nbsp;)</code><br>Draw a string.<br><a href="#terse-word-53-50-4f-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>SSAFE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>SSAFE also redraws counts with SBO.<br><a href="#terse-word-53-53-41-46-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>SSTRIKE1</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Draw the STRIKE 1 message.<br><a href="#terse-word-53-53-54-52-49-4b-45-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>SSTRIKE2</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Draw the STRIKE 2 message.<br><a href="#terse-word-53-53-54-52-49-4b-45-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>STFLD</strong><br><code>(&nbsp;--&nbsp;)</code><br>STFLD installs RETPA and TAKEFIELD.<br><a href="#terse-word-53-54-46-4c-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>STP,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit a standing-action record.<br><a href="#terse-word-53-54-50-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>STRIKETIME</strong><br><code>(&nbsp;--&nbsp;)</code><br>Strike process.<br><a href="#terse-word-53-54-52-49-4b-45-54-49-4d-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>STRINGGO</strong><br><code>(&nbsp;string&nbsp;erase-flag&nbsp;--&nbsp;)</code><br>Given string , stringerase.<br><a href="#terse-word-53-54-52-49-4e-47-47-4f" title="View implementation">📄</a></td></tr>
<tr><td><strong>STRINGPRC</strong><br><code>(&nbsp;--&nbsp;)</code><br>String display.<br><a href="#terse-word-53-54-52-49-4e-47-50-52-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>STRTBALL</strong><br><code>(&nbsp;--&nbsp;)</code><br>STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music.<br><a href="#terse-word-53-54-52-54-42-41-4c-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>SUP</strong><br><code>(&nbsp;--&nbsp;)</code><br>SUP posts UP.<br><a href="#terse-word-53-55-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>SW-30</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code><br>Maps a −30° swing and horizontal direction into a baseball sector code.<br><a href="#terse-word-53-57-2d-33-30" title="View implementation">📄</a></td></tr>
<tr><td><strong>SW-45</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code><br>Maps a −45° swing and horizontal direction into a baseball sector code.<br><a href="#terse-word-53-57-2d-34-35" title="View implementation">📄</a></td></tr>
<tr><td><strong>SW-90</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;)</code><br>SW-90 ignores direction/random inputs and returns the far-right foul sector.<br><a href="#terse-word-53-57-2d-39-30" title="View implementation">📄</a></td></tr>
<tr><td><strong>SW+30</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code><br>Maps a +30° swing and horizontal direction into a baseball sector code.<br><a href="#terse-word-53-57-2b-33-30" title="View implementation">📄</a></td></tr>
<tr><td><strong>SW+45</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code><br>Maps a +45° swing and horizontal direction into a baseball sector code.<br><a href="#terse-word-53-57-2b-34-35" title="View implementation">📄</a></td></tr>
<tr><td><strong>SW+90</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;)</code><br>SW+90 always returns foul-left after dropping its inputs.<br><a href="#terse-word-53-57-2b-39-30" title="View implementation">📄</a></td></tr>
<tr><td><strong>SW0</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code><br>Maps a central swing and horizontal direction into a baseball sector code.<br><a href="#terse-word-53-57-30" title="View implementation">📄</a></td></tr>
<tr><td><strong>SWALK</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code><br>Uses ROT and SPOST to compose game logic.<br><a href="#terse-word-53-57-41-4c-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>TCNT</strong><br><code>(&nbsp;--&nbsp;)</code><br>TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits.<br><a href="#terse-word-54-43-4e-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>TERSECHK</strong><br><code>(&nbsp;--&nbsp;)</code><br>Look at terse routine flags.<br><a href="#terse-word-54-45-52-53-45-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>TF</strong><br><code>(&nbsp;--&nbsp;)</code><br>Take the field.<br><a href="#terse-word-54-46" title="View implementation">📄</a></td></tr>
<tr><td><strong>THW,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the throw command.<br><a href="#terse-word-54-48-57-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>TWAIT</strong><br><code>(&nbsp;count&nbsp;--&nbsp;)</code><br>Terse wait period.<br><a href="#terse-word-54-57-41-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>V</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses VARIABLE to compose game logic.<br><a href="#terse-word-56" title="View implementation">📄</a></td></tr>
<tr><td><strong>V=</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses V and VARIABLE to compose game logic.<br><a href="#terse-word-56-3d" title="View implementation">📄</a></td></tr>
<tr><td><strong>VIBS</strong><br><code>(&nbsp;value&nbsp;--&nbsp;)</code><br>Emit a vibrato setting.<br><a href="#terse-word-56-49-42-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>VIS</strong><br><code>(&nbsp;--&nbsp;)</code><br>HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;<br><a href="#terse-word-56-49-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>WHBODDS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Sets who is on base calculates play odds.<br><a href="#terse-word-57-48-42-4f-44-44-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>WTHW,</strong><br><code>(&nbsp;--&nbsp;)</code><br>Emit the wait-for-throw command.<br><a href="#terse-word-57-54-48-57-2c" title="View implementation">📄</a></td></tr>
<tr><td><strong>WUPGO</strong><br><code>(&nbsp;--&nbsp;)</code><br>WUPGO activates WHOSUP with runner/automatic-forward flags;<br><a href="#terse-word-57-55-50-47-4f" title="View implementation">📄</a></td></tr>
<tr><td><strong>WUPTON</strong><br><code>(&nbsp;--&nbsp;)</code><br>WUPTON installs WUPWRT.<br><a href="#terse-word-57-55-50-54-4f-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>WUPWRT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Write whos up for flash.<br><a href="#terse-word-57-55-50-57-52-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>YOU1ST</strong><br><code>(&nbsp;--&nbsp;)</code><br>YOU1ST posts the greeting/extra-inning challenge, then continues to 306.<br><a href="#terse-word-59-4f-55-31-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>ZERORAM</strong><br><code>(&nbsp;--&nbsp;)</code><br>ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT.<br><a href="#terse-word-5a-45-52-4f-52-41-4d" title="View implementation">📄</a></td></tr>
</tbody>
</table>

## Extra Bases native CODE words (85)

<table>
<tbody>
<tr><td><strong>+LOOP</strong><br><code>(&nbsp;increment&nbsp;--&nbsp;)</code><br>Uses LOOP to process game state.<br><a href="#terse-word-2b-4c-4f-4f-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>ALLFLDACT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Sets all fielders active.<br><a href="#terse-word-41-4c-4c-46-4c-44-41-43-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>ANMSEQLOAD</strong><br><code>(&nbsp;--&nbsp;)</code><br>Finds proper anm seq by per=#.<br><a href="#terse-word-41-4e-4d-53-45-51-4c-4f-41-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>BALLERASE</strong><br><code>(&nbsp;--&nbsp;)</code><br>BALLERASE preserves BC/IY around native BLERASE and returns to TERSE.<br><a href="#terse-word-42-41-4c-4c-45-52-41-53-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>BATHIT</strong><br><code>(&nbsp;--&nbsp;)</code><br>He hit it time to get em running.<br><a href="#terse-word-42-41-54-48-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>BATHITCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br>Check window for hit.<br><a href="#terse-word-42-41-54-48-49-54-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>BATSWING</strong><br><code>(&nbsp;--&nbsp;)</code><br>Swings bat if appropriate.<br><a href="#terse-word-42-41-54-53-57-49-4e-47" title="View implementation">📄</a></td></tr>
<tr><td><strong>BATWRITE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Xor bat from swingtype.<br><a href="#terse-word-42-41-54-57-52-49-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>BCD+</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;bcd-sum&nbsp;)</code><br>Binary to decimal arithmatic.<br><a href="#terse-word-42-43-44-2b" title="View implementation">📄</a></td></tr>
<tr><td><strong>BLDST</strong><br><code>(&nbsp;--&nbsp;)</code><br>Ball thrown or hit.<br><a href="#terse-word-42-4c-44-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>BLMOTION</strong><br><code>(&nbsp;--&nbsp;)</code><br>Set pc for ram pa table -tractor ball.<br><a href="#terse-word-42-4c-4d-4f-54-49-4f-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>BLPOSCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br>BLPOSCHK branches on HITYET.<br><a href="#terse-word-42-4c-50-4f-53-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>BMUSIC</strong><br><code>(&nbsp;music-address&nbsp;--&nbsp;)</code><br>BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.<br><a href="#terse-word-42-4d-55-53-49-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>BUTTONCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br>Reads buttons for swing run & pitch it.<br><a href="#terse-word-42-55-54-54-4f-4e-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHKCAUGHT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Caught set in interrupt.<br><a href="#terse-word-43-48-4b-43-41-55-47-48-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHKGROUNDER</strong><br><code>(&nbsp;--&nbsp;)</code><br>If grounder adjust ball direction.<br><a href="#terse-word-43-48-4b-47-52-4f-55-4e-44-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHKSCRTIME</strong><br><code>(&nbsp;--&nbsp;)</code><br>Score process.<br><a href="#terse-word-43-48-4b-53-43-52-54-49-4d-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>CLRBLST</strong><br><code>(&nbsp;--&nbsp;)</code><br>CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.<br><a href="#terse-word-43-4c-52-42-4c-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>cnline</strong><br><code>(&nbsp;--&nbsp;)</code><br>Calls vector line write.<br><a href="#terse-word-63-6e-6c-69-6e-65" title="View implementation">📄</a></td></tr>
<tr><td><strong>COMPDE</strong><br><code>(&nbsp;--&nbsp;)</code><br>COMPDE applies the same operation to DE while preserving HL.<br><a href="#terse-word-43-4f-4d-50-44-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>COMPHL</strong><br><code>(&nbsp;--&nbsp;)</code><br>Compliments HL.<br><a href="#terse-word-43-4f-4d-50-48-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>COUNT</strong><br><code>(&nbsp;address&nbsp;--&nbsp;address+1&nbsp;character&nbsp;)</code><br>Read the next character of a counted/high-bit-terminated string.<br><a href="#terse-word-43-4f-55-4e-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>cpost</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;char&nbsp;--&nbsp;x'&nbsp;y&nbsp;options&nbsp;)</code><br>Post an ascii-character on the screen ; see opt.<br><a href="#terse-word-63-70-6f-73-74" title="View implementation">📄</a></td></tr>
<tr><td><strong>DEACTIVATE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Reset active bit in status.<br><a href="#terse-word-44-45-41-43-54-49-56-41-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>DI</strong><br><code>(&nbsp;--&nbsp;)</code><br>Disable maskable Z80 interrupts.<br><a href="#terse-word-44-49" title="View implementation">📄</a></td></tr>
<tr><td><strong>DIVHLBY4</strong><br><code>(&nbsp;--&nbsp;)</code><br>Divide HL by 4.<br><a href="#terse-word-44-49-56-48-4c-42-59-34" title="View implementation">📄</a></td></tr>
<tr><td><strong>DO</strong><br><code>(&nbsp;limit&nbsp;start&nbsp;--&nbsp;)</code><br>Enter a counted loop using a three-cell return-stack frame.<br><a href="#terse-word-44-4f" title="View implementation">📄</a></td></tr>
<tr><td><strong>DSTCALC</strong><br><code>(&nbsp;--&nbsp;)</code><br>Calc deltas to destination.<br><a href="#terse-word-44-53-54-43-41-4c-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>DSTLD</strong><br><code>(&nbsp;--&nbsp;)</code><br>DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.<br><a href="#terse-word-44-53-54-4c-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>EI</strong><br><code>(&nbsp;--&nbsp;)</code><br>Enable maskable Z80 interrupts.<br><a href="#terse-word-45-49" title="View implementation">📄</a></td></tr>
<tr><td><strong>EIDI</strong><br><code>(&nbsp;--&nbsp;)</code><br>EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers.<br><a href="#terse-word-45-49-44-49" title="View implementation">📄</a></td></tr>
<tr><td><strong>EMUSIC</strong><br><code>(&nbsp;--&nbsp;)</code><br>EMUSIC selects ENDMUSIC and initializes timing/repetition to one;<br><a href="#terse-word-45-4d-55-53-49-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>EX</strong><br><code>(&nbsp;--&nbsp;)</code><br>EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.<br><a href="#terse-word-45-58" title="View implementation">📄</a></td></tr>
<tr><td><strong>FILL</strong><br><code>(&nbsp;value&nbsp;address&nbsp;count&nbsp;--&nbsp;)</code><br>Fill consecutive bytes with a specified value.<br><a href="#terse-word-46-49-4c-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>FLDDST</strong><br><code>(&nbsp;--&nbsp;)</code><br>Fielders take position logic.<br><a href="#terse-word-46-4c-44-44-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>FLSHOFF</strong><br><code>(&nbsp;--&nbsp;)</code><br>FLSHOFF disables flashing and services cleanup under DI.<br><a href="#terse-word-46-4c-53-48-4f-46-46" title="View implementation">📄</a></td></tr>
<tr><td><strong>FMIRROR</strong><br><code>(&nbsp;--&nbsp;)</code><br>FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order.<br><a href="#terse-word-46-4d-49-52-52-4f-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>HITRUN</strong><br><code>(&nbsp;--&nbsp;)</code><br>Activate proper runners and set trwbase.<br><a href="#terse-word-48-49-54-52-55-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>HOMERCHK</strong><br><code>(&nbsp;y&nbsp;x&nbsp;hit-type&nbsp;random-x&nbsp;random-y&nbsp;--&nbsp;)</code><br>Consumes two random offsets, hit type and ball coordinates from the TERSE parameter stack; sets fence/homer state and ball destination.<br><a href="#terse-word-48-4f-4d-45-52-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>I</strong><br><code>(&nbsp;--&nbsp;index&nbsp;)</code><br>Fetch the innermost counted-loop index.<br><a href="#terse-word-49" title="View implementation">📄</a></td></tr>
<tr><td><strong>IEX</strong><br><code>(&nbsp;saved-interrupt-frame&nbsp;--&nbsp;)</code><br>Restores two saved Z80 register banks, enables interrupts, then returns from the interrupt bridge; this is an interrupt-frame convention, not an ordinary TERSE data-word call.<br><a href="#terse-word-49-45-58" title="View implementation">📄</a></td></tr>
<tr><td><strong>INDEXW</strong><br><code>(&nbsp;--&nbsp;)</code><br>Call routine A- disp HL- table add.<br><a href="#terse-word-49-4e-44-45-58-57" title="View implementation">📄</a></td></tr>
<tr><td><strong>INFIELD</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses IFSPAN to process game state.<br><a href="#terse-word-49-4e-46-49-45-4c-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>INFLDACT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Set infielders active.<br><a href="#terse-word-49-4e-46-4c-44-41-43-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>ISTART</strong><br><code>(&nbsp;interrupt-address&nbsp;--&nbsp;)</code><br>ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.<br><a href="#terse-word-49-53-54-41-52-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>KILLOF</strong><br><code>(&nbsp;--&nbsp;)</code><br>Stop outfield tractor ball control.<br><a href="#terse-word-4b-49-4c-4c-4f-46" title="View implementation">📄</a></td></tr>
<tr><td><strong>LOADANM</strong><br><code>(&nbsp;--&nbsp;)</code><br>Loads magic & anm HL-top of playact table.<br><a href="#terse-word-4c-4f-41-44-41-4e-4d" title="View implementation">📄</a></td></tr>
<tr><td><strong>LOOP</strong><br><code>(&nbsp;--&nbsp;)</code><br>Advance a counted loop and test its termination.<br><a href="#terse-word-4c-4f-4f-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>MULTHLBY4</strong><br><code>(&nbsp;--&nbsp;)</code><br>MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign.<br><a href="#terse-word-4d-55-4c-54-48-4c-42-59-34" title="View implementation">📄</a></td></tr>
<tr><td><strong>MUSCPU</strong><br><code>(&nbsp;--&nbsp;)</code><br>Declare cross-screen dispatch labels and begin assembling MUSCPU.<br><a href="#terse-word-4d-55-53-43-50-55" title="View implementation">📄</a></td></tr>
<tr><td><strong>NDUP</strong><br><code>(&nbsp;x1&nbsp;…&nbsp;xn&nbsp;n&nbsp;--&nbsp;x1&nbsp;…&nbsp;xn&nbsp;x1&nbsp;…&nbsp;xn&nbsp;)</code><br>Duplicate the top n parameter-stack cells.<br><a href="#terse-word-4e-44-55-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>OFFFDST</strong><br><code>(&nbsp;--&nbsp;)</code><br>All player off field control.<br><a href="#terse-word-4f-46-46-46-44-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>OFLDTBL</strong><br><code>(&nbsp;--&nbsp;)</code><br>OFLDTBL gives all three outfielders OFTBLPA, activates them and returns;<br><a href="#terse-word-4f-46-4c-44-54-42-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>OFMOTION</strong><br><code>(&nbsp;--&nbsp;)</code><br>Set pc for ram pa table -tractor ball.<br><a href="#terse-word-4f-46-4d-4f-54-49-4f-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>ON1ST</strong><br><code>(&nbsp;--&nbsp;)</code><br>ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;<br><a href="#terse-word-4f-4e-31-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>ON2ND</strong><br><code>(&nbsp;--&nbsp;)</code><br>ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;<br><a href="#terse-word-4f-4e-32-4e-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>ON3RD</strong><br><code>(&nbsp;--&nbsp;)</code><br>ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;<br><a href="#terse-word-4f-4e-33-52-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>OPCODECHK</strong><br><code>(&nbsp;--&nbsp;)</code><br>Called by plyactupdate.<br><a href="#terse-word-4f-50-43-4f-44-45-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>OUTFLDACT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Sets outfielders active.<br><a href="#terse-word-4f-55-54-46-4c-44-41-43-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>PACTLOAD</strong><br><code>(&nbsp;--&nbsp;)</code><br>Loads vect from plyact.<br><a href="#terse-word-50-41-43-54-4c-4f-41-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>PATFETCH</strong><br><code>(&nbsp;--&nbsp;)</code><br>Loads actual pattern IX-vector.<br><a href="#terse-word-50-41-54-46-45-54-43-48" title="View implementation">📄</a></td></tr>
<tr><td><strong>PERSPECTIVE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Pattern size determined by y.<br><a href="#terse-word-50-45-52-53-50-45-43-54-49-56-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>PLAYACT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Called in intterupt does update prc.<br><a href="#terse-word-50-4c-41-59-41-43-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>PMUSIC</strong><br><code>(&nbsp;music-address&nbsp;--&nbsp;)</code><br>PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer.<br><a href="#terse-word-50-4d-55-53-49-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>PTAUTOTM</strong><br><code>(&nbsp;--&nbsp;)</code><br>Pitch auto timer.<br><a href="#terse-word-50-54-41-55-54-4f-54-4d" title="View implementation">📄</a></td></tr>
<tr><td><strong>RESETRUNNERS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Reset runners to order of on base.<br><a href="#terse-word-52-45-53-45-54-52-55-4e-4e-45-52-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>RND</strong><br><code>(&nbsp;upper-bound&nbsp;--&nbsp;random-value&nbsp;)</code><br>Produce a random value scaled to the supplied bound.<br><a href="#terse-word-52-4e-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>RUNDST</strong><br><code>(&nbsp;--&nbsp;)</code><br>Runner base running control.<br><a href="#terse-word-52-55-4e-44-53-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>SENTRY</strong><br><code>(&nbsp;--&nbsp;)</code><br>Game loop.<br><a href="#terse-word-53-45-4e-54-52-59" title="View implementation">📄</a></td></tr>
<tr><td><strong>SETACT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Sets avtive bit in status.<br><a href="#terse-word-53-45-54-41-43-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>STARTMUSIC</strong><br><code>(&nbsp;--&nbsp;)</code><br>STARTMUSIC clears its request.<br><a href="#terse-word-53-54-41-52-54-4d-55-53-49-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>strtline</strong><br><code>(&nbsp;x&nbsp;y&nbsp;--&nbsp;)</code><br>Given X Y sets up start of line.<br><a href="#terse-word-73-74-72-74-6c-69-6e-65" title="View implementation">📄</a></td></tr>
<tr><td><strong>SWAN</strong><br><code>(&nbsp;value&nbsp;--&nbsp;nibble-swapped-value&nbsp;)</code><br>Exchange the high and low nibbles of the low byte.<br><a href="#terse-word-53-57-41-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>TBALLPITCH</strong><br><code>(&nbsp;--&nbsp;)</code><br>Loads pitch velocities.<br><a href="#terse-word-54-42-41-4c-4c-50-49-54-43-48" title="View implementation">📄</a></td></tr>
<tr><td><strong>THROWANIM</strong><br><code>(&nbsp;--&nbsp;)</code><br>Sets up BLDST and player anim.<br><a href="#terse-word-54-48-52-4f-57-41-4e-49-4d" title="View implementation">📄</a></td></tr>
<tr><td><strong>THROWBALL</strong><br><code>(&nbsp;--&nbsp;)</code><br>Finish scoring first.<br><a href="#terse-word-54-48-52-4f-57-42-41-4c-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>THWANMSET</strong><br><code>(&nbsp;--&nbsp;)</code><br>Set up throw animation.<br><a href="#terse-word-54-48-57-41-4e-4d-53-45-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>TIMER</strong><br><code>(&nbsp;--&nbsp;)</code><br>Interrupt timer routine.<br><a href="#terse-word-54-49-4d-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>VECTOR</strong><br><code>(&nbsp;--&nbsp;)</code><br>Vectors and limit checks.<br><a href="#terse-word-56-45-43-54-4f-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>VERASE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Does pattern board erase from vector IX.<br><a href="#terse-word-56-45-52-41-53-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>VWRITE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Does reloff relabs patbrd from vector IX.<br><a href="#terse-word-56-57-52-49-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>WAIT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Given A wait period stop every thing.<br><a href="#terse-word-57-41-49-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>WAITTHRW</strong><br><code>(&nbsp;--&nbsp;)</code><br>Sets flag for 1stbaseman to wait throw.<br><a href="#terse-word-57-41-49-54-54-48-52-57" title="View implementation">📄</a></td></tr>
<tr><td><strong>WRITE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;pattern&nbsp;dimensions&nbsp;options&nbsp;--&nbsp;)</code><br>Write with X Y sizes ; pattern with no header.<br><a href="#terse-word-57-52-49-54-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>WRITR</strong><br><code>(&nbsp;x&nbsp;y&nbsp;relative-pattern&nbsp;options&nbsp;--&nbsp;)</code><br>Write with a relative pattern.<br><a href="#terse-word-57-52-49-54-52" title="View implementation">📄</a></td></tr>
</tbody>
</table>

## Native SUBR helpers (47)

<table>
<tbody>
<tr><td><strong>AUTOR1</strong><br><code>(&nbsp;--&nbsp;)</code><br>AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.<br><a href="#terse-word-41-55-54-4f-52-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>AUTOR2</strong><br><code>(&nbsp;--&nbsp;)</code><br>Run second-runner automation logic.<br><a href="#terse-word-41-55-54-4f-52-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>AUTOR3</strong><br><code>(&nbsp;--&nbsp;)</code><br>Run third-runner automation logic.<br><a href="#terse-word-41-55-54-4f-52-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>BLERASE</strong><br><code>(&nbsp;--&nbsp;)</code><br>Erases ball.<br><a href="#terse-word-42-4c-45-52-41-53-45" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHKATBS</strong><br><code>(&nbsp;--&nbsp;)</code><br>Check if active player at base in- A vstatus.<br><a href="#terse-word-43-48-4b-41-54-42-53" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHKCOIN1</strong><br><code>(&nbsp;--&nbsp;)</code><br>Chk door 1 for coin drop.<br><a href="#terse-word-43-48-4b-43-4f-49-4e-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>CHKCOIN2</strong><br><code>(&nbsp;--&nbsp;)</code><br>Chk door 2 for coin drop.<br><a href="#terse-word-43-48-4b-43-4f-49-4e-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>CMPOF</strong><br><code>(&nbsp;--&nbsp;)</code><br>Calculates proper deltas and patterns.<br><a href="#terse-word-43-4d-50-4f-46" title="View implementation">📄</a></td></tr>
<tr><td><strong>COLORBAND</strong><br><code>(&nbsp;saved-interrupt-frame&nbsp;--&nbsp;)</code><br>COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled.<br><a href="#terse-word-43-4f-4c-4f-52-42-41-4e-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>debounce</strong><br><code>(&nbsp;--&nbsp;)</code><br>Debounce input transitions.<br><a href="#terse-word-64-65-62-6f-75-6e-63-65" title="View implementation">📄</a></td></tr>
<tr><td><strong>FETCH</strong><br><code>(&nbsp;--&nbsp;)</code><br>FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.<br><a href="#terse-word-46-45-54-43-48" title="View implementation">📄</a></td></tr>
<tr><td><strong>FLSHWUP</strong><br><code>(&nbsp;--&nbsp;)</code><br>Handle flash callback.<br><a href="#terse-word-46-4c-53-48-57-55-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>FNBB</strong><br><code>(&nbsp;--&nbsp;)</code><br>Native game routine; source body below.<br><a href="#terse-word-46-4e-42-42" title="View implementation">📄</a></td></tr>
<tr><td><strong>FONTUNPACK</strong><br><code>(&nbsp;--&nbsp;)</code><br>FONTUNPACK reads two packed bytes and starts a five-row unpack loop.<br><a href="#terse-word-46-4f-4e-54-55-4e-50-41-43-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>FRO1</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses AUTOR1 to process game state.<br><a href="#terse-word-46-52-4f-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>FRO12</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses AUTOR1 and AUTOR2 to process game state.<br><a href="#terse-word-46-52-4f-31-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>FRO123</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses AUTOR1 and AUTOR2 to process game state.<br><a href="#terse-word-46-52-4f-31-32-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>FRO13</strong><br><code>(&nbsp;--&nbsp;)</code><br>Uses AUTOR2 to process game state.<br><a href="#terse-word-46-52-4f-31-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>FRO2</strong><br><code>(&nbsp;--&nbsp;)</code><br>Native game routine; source body below.<br><a href="#terse-word-46-52-4f-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>FRO23</strong><br><code>(&nbsp;--&nbsp;)</code><br>Native game routine; source body below.<br><a href="#terse-word-46-52-4f-32-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>FRO3</strong><br><code>(&nbsp;--&nbsp;)</code><br>Native game routine; source body below.<br><a href="#terse-word-46-52-4f-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>HLOAD</strong><br><code>(&nbsp;--&nbsp;)</code><br>FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.<br><a href="#terse-word-48-4c-4f-41-44" title="View implementation">📄</a></td></tr>
<tr><td><strong>IFSPAN</strong><br><code>(&nbsp;--&nbsp;)</code><br>IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value.<br><a href="#terse-word-49-46-53-50-41-4e" title="View implementation">📄</a></td></tr>
<tr><td><strong>INCPC</strong><br><code>(&nbsp;--&nbsp;)</code><br>FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.<br><a href="#terse-word-49-4e-43-50-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>loadpc</strong><br><code>(&nbsp;--&nbsp;)</code><br>loadpc installs MUSPC and STARTPC.<br><a href="#terse-word-6c-6f-61-64-70-63" title="View implementation">📄</a></td></tr>
<tr><td><strong>LVRSTAT</strong><br><code>(&nbsp;--&nbsp;)</code><br>Load vstat for all runners in- A value.<br><a href="#terse-word-4c-56-52-53-54-41-54" title="View implementation">📄</a></td></tr>
<tr><td><strong>NBB</strong><br><code>(&nbsp;--&nbsp;)</code><br>NBB is the empty-bases no-op.<br><a href="#terse-word-4e-42-42" title="View implementation">📄</a></td></tr>
<tr><td><strong>OFBLCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br>Chk for catch or close when cmsw.<br><a href="#terse-word-4f-46-42-4c-43-48-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>PCJUMP</strong><br><code>(&nbsp;--&nbsp;)</code><br>FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.<br><a href="#terse-word-50-43-4a-55-4d-50" title="View implementation">📄</a></td></tr>
<tr><td><strong>relabs</strong><br><code>(&nbsp;--&nbsp;)</code><br>Relative X Y to magic address conversion.<br><a href="#terse-word-72-65-6c-61-62-73" title="View implementation">📄</a></td></tr>
<tr><td><strong>reloff</strong><br><code>(&nbsp;--&nbsp;)</code><br>Compute relative offset of x , y of pattern.<br><a href="#terse-word-72-65-6c-6f-66-66" title="View implementation">📄</a></td></tr>
<tr><td><strong>RO1</strong><br><code>(&nbsp;--&nbsp;)</code><br>RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.<br><a href="#terse-word-52-4f-31" title="View implementation">📄</a></td></tr>
<tr><td><strong>RO12</strong><br><code>(&nbsp;--&nbsp;)</code><br>RO12 activates both forced runners, selecting a double-play or ordinary target;<br><a href="#terse-word-52-4f-31-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>RO123</strong><br><code>(&nbsp;--&nbsp;)</code><br>RO23 and RO123 choose forced advancement and double-play targets for their base combinations.<br><a href="#terse-word-52-4f-31-32-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>RO13</strong><br><code>(&nbsp;--&nbsp;)</code><br>RO13 handles first-and-third occupancy and may branch through SETDBLPLAY.<br><a href="#terse-word-52-4f-31-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>RO2</strong><br><code>(&nbsp;--&nbsp;)</code><br>RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.<br><a href="#terse-word-52-4f-32" title="View implementation">📄</a></td></tr>
<tr><td><strong>RO23</strong><br><code>(&nbsp;--&nbsp;)</code><br>RO23 and RO123 choose forced advancement and double-play targets for their base combinations.<br><a href="#terse-word-52-4f-32-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>RO3</strong><br><code>(&nbsp;--&nbsp;)</code><br>RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.<br><a href="#terse-word-52-4f-33" title="View implementation">📄</a></td></tr>
<tr><td><strong>SETDBLPLAY</strong><br><code>(&nbsp;--&nbsp;)</code><br>Sets up double play HL-guy on 1st.<br><a href="#terse-word-53-45-54-44-42-4c-50-4c-41-59" title="View implementation">📄</a></td></tr>
<tr><td><strong>TAKEOFF</strong><br><code>(&nbsp;--&nbsp;)</code><br>Turn proper runners on.<br><a href="#terse-word-54-41-4b-45-4f-46-46" title="View implementation">📄</a></td></tr>
<tr><td><strong>TBALLPRC</strong><br><code>(&nbsp;--&nbsp;)</code><br>Pitch or control outfield.<br><a href="#terse-word-54-42-41-4c-4c-50-52-43" title="View implementation">📄</a></td></tr>
<tr><td><strong>TBLVEL</strong><br><code>(&nbsp;--&nbsp;)</code><br>Tractorball vel HL-# add. D-max vel.<br><a href="#terse-word-54-42-4c-56-45-4c" title="View implementation">📄</a></td></tr>
<tr><td><strong>TIMEDCR</strong><br><code>(&nbsp;--&nbsp;)</code><br>HL-timer add if goes to zero return 1 else 0.<br><a href="#terse-word-54-49-4d-45-44-43-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>TOOFCK</strong><br><code>(&nbsp;--&nbsp;)</code><br>Time out outfield check.<br><a href="#terse-word-54-4f-4f-46-43-4b" title="View implementation">📄</a></td></tr>
<tr><td><strong>WALKOVER</strong><br><code>(&nbsp;--&nbsp;)</code><br>Walked runner at base.<br><a href="#terse-word-57-41-4c-4b-4f-56-45-52" title="View implementation">📄</a></td></tr>
<tr><td><strong>write</strong><br><code>(&nbsp;--&nbsp;)</code><br>Software write with x y size.<br><a href="#terse-word-77-72-69-74-65" title="View implementation">📄</a></td></tr>
<tr><td><strong>writep</strong><br><code>(&nbsp;IY=patadr&nbsp;BC=ex/mag+shf&nbsp;HL=scradr&nbsp;---&nbsp;)</code><br>Software write with pattern size on pattern.<br><a href="#terse-word-77-72-69-74-65-70" title="View implementation">📄</a></td></tr>
</tbody>
</table>

## Host and cross-compiler definitions (2)

<table>
<tbody>
<tr><td><strong>BASE!</strong><br><code>(&nbsp;base&nbsp;--&nbsp;)</code><br>Set the number base.<br><a href="#terse-word-42-41-53-45-21" title="View implementation">📄</a></td></tr>
<tr><td><strong>BASE@</strong><br><code>(&nbsp;--&nbsp;base&nbsp;)</code><br>Fetch the current number base.<br><a href="#terse-word-42-41-53-45-40" title="View implementation">📄</a></td></tr>
</tbody>
</table>

## Implementations

### <a name="terse-word-2d"></a>`-`

`( a b -- difference )`

Subtract the top value from the preceding value.

```text
_minus:
            pop     de                  ; Pop subtrahend from parameter stack
            pop     hl                  ; Pop minuend from parameter stack
            xor     a                   ; Clear carry flag
            sbc     hl,de               ; Subtract subtrahend from minuend
            push    hl                  ; Push difference onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

### <a name="terse-word-21"></a>`!`

`( value address -- )`

Store one 16-bit cell.

```text
_bang:
            pop     hl                  ; Pop target memory address
            pop     de                  ; Pop 16-bit word value
            ld      (hl),e              ; Write LSB to memory address
            inc     hl                  ; Advance memory pointer
            ld      (hl),d              ; Write MSB to memory address
            jp      (iy)                ; Return to TERSE inner interpreter
```

### <a name="terse-word-40"></a>`@`

`( address -- value )`

Fetch one 16-bit cell.

```text
_at:
            pop     hl                  ; Pop target memory address from stack
            ld      e,(hl)              ; Read low byte from memory address
            inc     hl                  ; Advance memory pointer
            ld      d,(hl)              ; Read high byte from memory address
            push    de                  ; Push 16-bit fetched word onto stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

### <a name="terse-word-2a"></a>`*`

`( m n -- product )`

16-bit signed multiplication; result = m × n (16-bit cell).

**DNA TERSE 81 Glossary, page 2.** The DNA TERSE 81 Glossary specifies signed 16-bit multiplication. Its host-native instruction body is not given in the glossary.


### <a name="terse-word-2f"></a>`/`

`( a b -- quotient )`

Divide the preceding stack value by the top value.

**DNA TERSE 81 Glossary, page 3:** Defined as `/MOD DROP`.

```terse
: / /MOD DROP ;
```

### <a name="terse-word-2b"></a>`+`

`( a b -- sum )`

Add two stack values.

```text
_plus:
            pop     de                  ; Pop second operand from parameter stack
            pop     hl                  ; Pop first operand from parameter stack
            add     hl,de               ; Calculate 16-bit sum
            push    hl                  ; Push sum onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

### <a name="terse-word-3c"></a>`<`

`( a b -- flag )`

Compare whether the preceding value is less than the top value.

```text
_less:
```

### <a name="terse-word-3d"></a>`=`

`( a b -- flag )`

Compare two values for equality.

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

### <a name="terse-word-3e"></a>`>`

`( a b -- flag )`

Compare whether the preceding value is greater than the top value.

```text
_gt:
```

### <a name="terse-word-30-3d"></a>`0=`

`( n -- flag )`

Return a condition indicating zero.

```text
_zeroequal:
            ld      de,$0000            ; Load 0 as second operand
            jp      $00F7               ; Jump into equal comparison routine
```

### <a name="terse-word-32-44-55-50"></a>`2DUP`

`( a b -- a b a b )`

Duplicate the top two stack cells.

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

### <a name="terse-word-41-4e-44"></a>`AND`

`( a b -- result )`

Bitwise AND of two values.

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

**Used by:** `CREDARROW`, `FLSHME`, `INSWAIT`, `OUTTIME`, `PLRCHK`, `RETPA`, `TBALLPRC`, `TF`, `dpost`.

### <a name="terse-word-41-52-52-41-59"></a>`ARRAY`

`( size -- )`

Allocate/name an indexed cell array from a the size.

```text
_ARRAY:
            pop     hl                  ; Pop array index from parameter stack
            add     hl,hl               ; Double index for 16-bit word offset
            jp      $0062               ; Jump to add inline base address and push
```

**Used by:** `NDUP`.

### <a name="terse-word-42-21"></a>`B!`

`( byte address -- )`

Store one byte.

```text
_Bbang:
            pop     hl                  ; Pop target byte-address
            pop     de                  ; Pop byte value
            ld      (hl),e              ; Store low-order byte to memory
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `BALLTIME`, `CREDARROW`, `DOGOVER`, `DPCN`, `FL`, `FOULTIME`, `GETF`, `GRNDRACTION`, `GRNDRHIT`, `HITDST`, `HRBY2`, `INLOG`, `INNODDS`, `LSETTFCOOR`, `OUTFLDHIT`, `OUTTIME`, `SB!`, `STRIKETIME`, `STRINGGO`, `STRINGPRC`, `TF`, `WHBODDS`, `ZERORAM`.

### <a name="terse-word-42-40"></a>`B@`

`( address -- byte )`

Fetch one byte.

```text
_Bat:
            pop     hl                  ; Pop memory address from parameter stack
            ld      e,(hl)              ; Fetch byte from memory address
            ld      d,$00               ; Zero-extend high byte
            push    de                  ; Push 16-bit zero-extended value
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `BALLTIME`, `CHKFLSHSTAY`, `CHKGMCNT`, `CREDARROW`, `DOGOVER`, `DOSBALL`, `DOSOUT`, `DOSSTRIKE`, `DP12CN`, `DPCN`, `FOULTIME`, `GETF`, `GRNDRHIT`, `HRBY2`, `INLOG`, `INNODDS`, `INSCN`, `INSTRC`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTFLDHIT`, `OUTTIME`, `PLRCHK`, `PPOST`, `RETPA`, `RUN1CHK1ST`, `RUN1CHK2ND`, `RUN2CHK`, `RUN2CHK12ND`, `RUN2CHK1ST`, `RUN3CHK`, `SBO`, `SCOREME`, `SPLR`, `STRIKETIME`, `STRINGPRC`, `STRTBALL`, `TCNT`, `TERSECHK`, `TF`, `TWAIT`, `WHBODDS`, `WUPWRT`.

### <a name="terse-word-42-41-52-52-41-59"></a>`BARRAY`

`( size -- )`

Create a named array of size uninitialized bytes; indexing the resulting word returns the byte address.

**DNA TERSE 81 Glossary, page 8.** Defining form: `size BARRAY name`. At use: `index name` leaves the address of byte `index` (no bounds check).


```text
size BARRAY name
index name  ( -- byte-address )
```


### <a name="terse-word-42-45-47-49-4e"></a>`BEGIN`

`( -- )`

Immediate XC wrapper that records a loop's object address.

```terse
: BEGIN } XC-BEGIN { ;
```

**Used by:** `INSTRC`, `INSWAIT`, `RECTAN`, `TWAIT`.

### <a name="terse-word-43-4f-44-45"></a>`CODE`

`( -- )`

Create a dictionary word implemented in assembler; enter assembler vocabulary for the definition.

**DNA TERSE 81 Glossary, page 11.** Defining form: `CODE name` followed by assembler instructions. A named native word is entered into the host dictionary.


```text
CODE name
  ... Z80 assembler instructions ...
  NEXT
```


### <a name="terse-word-43-4f-4e-53-54-41-4e-54"></a>`CONSTANT`

`( value -- )`

Create a named word whose execution pushes its defining value.

**DNA TERSE 81 Glossary, page 11.** Defining form: `value CONSTANT name`. Runtime effect of `name`: `( -- value )`.


```text
value CONSTANT name
name  ( -- value )
```


### <a name="terse-word-44-45-43-49-4d-41-4c"></a>`DECIMAL`

`( -- )`

Select decimal numeric conversion base.

**DNA TERSE 81 Glossary, page 12.** Sets the host's number conversion base to decimal (10). It acts on the development host, not as a game target instruction.


### <a name="terse-word-44-52-4f-50"></a>`DROP`

`( x -- )`

Discard the top stack cell.

```text
_DROP:
            pop     hl                  ; Pop and discard top value from stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `CPOST`, `CREDARROW`, `DOGOVER`, `DOSBALL`, `DOSOUT`, `FOULTIME`, `GRNDRHIT`, `INNODDS`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTLINE`, `OUTTIME`, `PLRCHK`, `RECTAN`, `RETPA`, `SPOST`, `STRINGGO`, `SW+30`, `SW+45`, `SW+90`, `SW-30`, `SW-45`, `SW-90`, `SW0`, `TERSECHK`, `TF`, `TWAIT`, `WHBODDS`, `dpost`.

### <a name="terse-word-44-55-50"></a>`DUP`

`( x -- x x )`

Duplicate the top stack cell.

```text
_DUP:
            pop     hl                  ; Pop top value from parameter stack
            push    hl                  ; Push first copy back onto stack
            push    hl                  ; Push second copy onto stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `BALLTIME`, `CREDARROW`, `DLINE`, `DOSBALL`, `DOSOUT`, `FL`, `FLSHME`, `FOULTIME`, `GRNDRACTION`, `GRNDRHIT`, `INLOG`, `INNODDS`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `OUTTIME`, `PLRCHK`, `PUP`, `RECLINE`, `RECTAN`, `RETPA`, `SCOREME`, `STRIKETIME`, `STRINGPRC`, `SW+30`, `SW+45`, `SW-30`, `SW-45`, `SW0`, `TF`, `TWAIT`, `WHBODDS`, `WUPGO`.

### <a name="terse-word-45-4c-53-45"></a>`ELSE`

`( -- )`

Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch.

```terse
: ELSE } XC-ELSE { ;
```

### <a name="terse-word-45-4e-44"></a>`END`

`( flag -- )`

Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true.

```terse
: END } XC-END { ;
```

**Used by:** `INSTRC`, `INSWAIT`, `RECTAN`, `TWAIT`.

### <a name="terse-word-48-45-58"></a>`HEX`

`( -- )`

Select hexadecimal numeric conversion base.

**DNA TERSE 81 Glossary, page 15.** Sets the host's number conversion base to hexadecimal (16). It acts on the development host, not as a game target instruction.


### <a name="terse-word-49-46"></a>`IF`

`( flag -- )`

Immediate XC wrapper that emits a conditional target branch through XC-IF.

```terse
: IF } XC-IF { ;
```

### <a name="terse-word-4c-49-54"></a>`LIT`

`( -- value )`

Fetch the next inline dictionary cell and push it as a 16-bit literal.

**DNA TERSE 81 Glossary, page 16.** Automatically compiled before a literal in a colon definition. `LIT` reads the following cell when executed; the original Extra Bases target ROM implementation is shown below.

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


### <a name="terse-word-4f-52"></a>`OR`

`( a b -- result )`

Bitwise inclusive OR of two values.

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

**Used by:** `OUTTIME`, `RETPA`, `dpost`.

### <a name="terse-word-4f-56-45-52"></a>`OVER`

`( a b -- a b a )`

Copy the second stack cell to the top.

```text
_OVER:
            pop     hl                  ; Pop top value from parameter stack
            pop     de                  ; Pop second value from parameter stack
            push    de                  ; Push second value back
            push    hl                  ; Push top value back
            push    de                  ; Push copy of second value onto stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `FLSHME`, `NPOST`, `OUTLINE`, `PPOST`, `dpost`.

### <a name="terse-word-52-4f-54"></a>`ROT`

`( a b c -- b c a )`

Rotate the top three stack cells.

```text
_ROT:
            pop     de                  ; Pop top value (first item)
            pop     hl                  ; Pop second value
            ex      (sp),hl             ; Swap second value with third value on stack
            push    de                  ; Push top value into second position
            push    hl                  ; Push third value into top position
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `RECTAN`, `SBALL1`, `SBALL2`, `SBALL3`, `SFOUL`, `SHOMER`, `SOUT1`, `SOUT2`, `SOUT3`, `SSAFE`, `SSTRIKE1`, `SSTRIKE2`, `SWALK`, `TF`.

### <a name="terse-word-53-57-41-50"></a>`SWAP`

`( a b -- b a )`

Exchange the top two stack cells.

```text
_SWAP:
            pop     hl                  ; Pop top value from parameter stack
            pop     de                  ; Pop second value from parameter stack
            push    hl                  ; Push top value into second position
            push    de                  ; Push second value into top position
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `MLINN`, `NPOST`, `PPOST`, `RECLINE`, `S!`, `SB!`, `WHBODDS`, `dpost`.

### <a name="terse-word-54-48-45-4e"></a>`THEN`

`( -- )`

Immediate XC wrapper that resolves a saved target branch destination.

```terse
: THEN } XC-THEN { ;
```

### <a name="terse-word-56-41-52-49-41-42-4c-45"></a>`VARIABLE`

`( initial-value -- )`

Create a named initialized 16-bit variable.

**DNA TERSE 81 Glossary, page 22.** Defining form: `initial-value VARIABLE name`. Runtime effect of `name`: `( -- address )`.


```text
initial-value VARIABLE name
name  ( -- address )
```


### <a name="terse-word-58-4f-52"></a>`XOR`

`( a b -- result )`

Bitwise exclusive OR of two values.

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

**Used by:** `PLRCHK`, `TF`, `dpost`.

### <a name="terse-word-5d-27-5b"></a>`]'[`

`( -- )`

Source-level compiler/TERSE definition shown below.

```text
: ]'[ [COMPILE] ' ;
```

### <a name="terse-word-5e"></a>`^`

`( -- )`

Uses ABVOLS and MCVOLS to compose game logic.

```text
{ : ^ } EF ABVOLS 0F MCVOLS { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`.

### <a name="terse-word-3c-49-4e-54-45-52-52-55-50-54-53"></a>`<INTERRUPTS`

`( -- )`

Mark the start of interrupt data.

```text
{ : <INTERRUPTS } DATA HERE { ; }
```

**Calls:** `HERE`.

### <a name="terse-word-41-42-56-4f-4c-53"></a>`ABVOLS`

`( volume -- )`

Emit the music volume command.

```text
{ : ABVOLS } 16 B, B, { ; }
```

**Used by:** `CMAJOR`, `QUIET`, `REST`, `^`.

### <a name="terse-word-41-43-54-2c"></a>`ACT,`

`( -- )`

Emit a playaction record.

```text
{ : ACT, } , B, , , { ; }
```

**Used by:** `BACT,`, `LCB,`, `RCB,`, `STP,`.

### <a name="terse-word-41-4e-4f-54-45"></a>`ANOTE`

`( duration tone -- )`

Emit a channel A note followed by its duration.

```text
{ : ANOTE } ATONE DURATION { ; }
```

**Calls:** `ATONE`, `DURATION`.

### <a name="terse-word-41-54-4f-4e-45"></a>`ATONE`

`( tone -- )`

Emit tone setting for channel A.

```text
{ : ATONE } 11 B,
B, { ; }
```

**Used by:** `ANOTE`, `NOTES`, `QUIET`.

### <a name="terse-word-42-41-43-54-2c"></a>`BACT,`

`( -- )`

Emit a ball-action record.

```text
{ : BACT, } BAL ACT, { ; }
```

**Calls:** `ACT,`.

**Used by:** `LK,`.

### <a name="terse-word-42-41-4c-4c-54-49-4d-45"></a>`BALLTIME`

`( -- )`

Balls process.

```text
: BALLTIME ( balls process )
BALLS DUP 1+B! B@ 34 = IF SWALK MYAH WLKCNT 1+B!
CWALK OLDSTRING B! LBASE BONE 40 WALK B!
1 HLSIDE B! WHBODDS HITRUN ( start runners ) WUPGO
CLRBLST ELSE MBALL DOSBALL THEN SBO ;
```

**Calls:** `DUP`, `B!`, `B@`, `SWALK`, `MYAH`, `BONE`, `WHBODDS`, `HITRUN`, `WUPGO`, `CLRBLST`, `MBALL`, `DOSBALL`, `SBO`.

### <a name="terse-word-42-4c-44-53-54-2c"></a>`BLDST,`

`( -- )`

Emit the ball destination command.

```text
{ : BLDST, } OPBLDST B, { ; }
```

### <a name="terse-word-42-4c-4d-4f-54-2c"></a>`BLMOT,`

`( -- )`

Emit the ball motion command.

```text
{ : BLMOT, } OPBLMOT B, { ; }
```

### <a name="terse-word-42-4e-4f-54-45"></a>`BNOTE`

`( duration tone -- )`

Emit a channel B note followed by its duration.

```text
{ : BNOTE } BTONE DURATION
{ ; }
```

**Calls:** `BTONE`, `DURATION`.

### <a name="terse-word-42-4f-4e-45"></a>`BONE`

`( address -- )`

Store byte value 1.

```text
: BONE ( cange byte memory cell to 1 ) 1 SB! ;
```

**Calls:** `SB!`.

**Used by:** `BALLTIME`, `CREDARROW`, `DOGOVER`, `DPCN`, `F2NDLS`, `F2NDRS`, `FBLLS`, `FBLRS`, `FLSHTON`, `FSSLS`, `FSSRS`, `GRNDRHIT`, `HLLS`, `HLS`, `HMS`, `HRLS`, `HRS`, `INLOG`, `INSWAIT`, `OUTFLDHIT`, `OUTTIME`, `PLRCHK`, `PLRSELECT`, `PUP`, `SPLR`, `STFLD`, `STRTBALL`, `TF`.

### <a name="terse-word-42-54-4f-4e-45"></a>`BTONE`

`( tone -- )`

Emit tone setting for channel B.

```text
{ : BTONE } 12 B, B, { ; }
```

**Used by:** `BNOTE`, `NOTES`, `QUIET`.

### <a name="terse-word-42-56"></a>`BV`

`( -- )`

Define a named byte variable.

```text
{ : BV } BVARIABLE { ; }
```

**Used by:** `BV=`.

### <a name="terse-word-42-56-3d"></a>`BV=`

`( -- )`

Uses BV to compose game logic.

```text
{ : BV= } 0 BVARIABLE { ; }
```

**Calls:** `BV`.

### <a name="terse-word-42-5a-45-52-4f"></a>`BZERO`

`( address -- )`

Store byte value 0.

```text
: BZERO ( change byte memory cell to 0 ) 0 SB! ;
```

**Calls:** `SB!`.

**Used by:** `CHKFLSHSTAY`, `CREDARROW`, `DOCHGS`, `DOGOVER`, `DOHOMER`, `DPCN`, `FIELDWRT`, `GRNDRACTION`, `HITDST`, `INLOG`, `INSTRC`, `PLRSELECT`, `SCOREME`, `STRINGPRC`, `STRTBALL`, `TF`.

### <a name="terse-word-43-3d"></a>`C=`

`( value -- )`

Uses CONSTANT to compose game logic.

```text
{ : C= } CONSTANT { ; }
```

**Calls:** `CONSTANT`.

### <a name="terse-word-43-48-47-53"></a>`CHGS`

`( -- )`

CHGS posts CHANGE SIDES;

```text
: CHGS 1C00 2000 828 A" CHANGE SIDES" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DOCHGS`.

### <a name="terse-word-43-48-4b-46-4c-53-48-53-54-41-59"></a>`CHKFLSHSTAY`

`( -- )`

When isccp turn off check for wupwrt.

```text
: CHKFLSHSTAY ( when isccp turn off check for wupwrt )
FLSHSTAY B@ IF FLSHSTAY BZERO FLSHCNT B@ FLSHOFF IF
DOWUP B@ IF WUPWRT WUPTON ELSE WUPFLSH B@ IF WUPWRT WUPTON
THEN THEN ELSE ( not flshcnt ) DOWUP B@ IF WUPTON ELSE
WUPFLSH B@ IF WUPTON THEN THEN THEN WUPFLSH BZERO
DOWUP BZERO THEN ;
```

**Calls:** `B@`, `BZERO`, `FLSHOFF`, `WUPWRT`, `WUPTON`.

**Used by:** `CREDARROW`.

### <a name="terse-word-43-48-4b-47-4d-43-4e-54"></a>`CHKGMCNT`

`( -- credits )`

CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte.

```text
: CHKGMCNT DP12CN C0 TWAIT DP12CN CREDITS B@ ;
```

**Calls:** `DP12CN`, `TWAIT`, `B@`.

**Used by:** `TF`.

### <a name="terse-word-43-4d-41-4a-4f-52"></a>`CMAJOR`

`( -- )`

Initialize the C-major sound pattern.

```text
{ : CMAJOR } 1C MASTER 0 NOISE EF ABVOLS 0F MCVOLS { ; }
```

**Calls:** `MASTER`, `NOISE`, `ABVOLS`, `MCVOLS`.

### <a name="terse-word-43-4e-4c-49-4e-45"></a>`CNLINE`

`( -- )`

CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state.

```text
: CNLINE ( continue line to this point , given X Y )
YIN ! XIN ! cnline ;
```

**Calls:** `cnline`.

**Used by:** `FIELDWRT`, `OUTLINE`.

### <a name="terse-word-43-4e-4f-54-45"></a>`CNOTE`

`( duration tone -- )`

Emit a channel C note followed by its duration.

```text
{ : CNOTE } CTONE DURATION { ; }
```

**Calls:** `CTONE`, `DURATION`.

**Used by:** `NOTES`.

### <a name="terse-word-43-4f-4e-47-52"></a>`CONGR`

`( -- )`

Display the congratulatory prompt.

```text
: CONGR 700 1000 828 A" CONGRATULATIONS YOU ARE VERY GOOD"
SPOST 0E00 2800 828 A" LETS PLAY AGAIN I WILL BUY" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `TF`.

### <a name="terse-word-43-50-4f-53-54"></a>`CPOST`

`( x y options char -- )`

Draw one character at the specified position.

```text
: CPOST ( post an ascii-character on the screen ; see options )
( in- x , y , opt+ex/mag , ascii-char )
( out- character on screen )
cpost 3DROP ;
```

**Calls:** `cpost`, `DROP`.

**Used by:** `FL`, `HOM`, `SBO`, `SCRS`, `VIS`.

### <a name="terse-word-43-52-45-44-41-52-52-4f-57"></a>`CREDARROW`

`( -- )`

Update last inning arrow.

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

**Calls:** `DI`, `BZERO`, `B@`, `BONE`, `DUP`, `B!`, `AND`, `MLINN`, `CHKFLSHSTAY`, `DROP`, `EI`.

**Used by:** `STRTBALL`, `TERSECHK`.

### <a name="terse-word-43-54-4f-4e-45"></a>`CTONE`

`( tone -- )`

Emit tone setting for channel C.

```text
{ : CTONE } 13 B, B, { ; }
```

**Used by:** `CNOTE`, `QUIET`.

### <a name="terse-word-44-45-41-43-54-2c"></a>`DEACT,`

`( -- )`

Emit vector-deactivation command.

```text
{ : DEACT, } 0C B, { ; }
```

**Used by:** `LCB,`, `LK,`, `RCB,`, `STP,`.

### <a name="terse-word-44-4c-49-4e-45"></a>`DLINE`

`( x1 y1 x2 y2 -- )`

Draw a line , given X Y start coor X Y ending coor.

```text
: DLINE ( draw a line , given X Y start coor X Y ending coor )
YIN ! XIN ! 2DUP Y-AXIS ! X-AXIS !
SWAB ( set y for relabs ) strtline cnline ;
```

**Calls:** `DUP`, `strtline`, `cnline`.

**Used by:** `FIELDWRT`, `OUTLINE`, `RECLINE`.

### <a name="terse-word-44-4f-43-48-47-53"></a>`DOCHGS`

`( -- )`

DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER;

```text
: DOCHGS ' CHGS FLSHTON 28 DWAIT FLSHOFF GAMEOVER BZERO ;
```

**Calls:** `CHGS`, `FLSHTON`, `DWAIT`, `FLSHOFF`, `BZERO`.

**Used by:** `TF`.

### <a name="terse-word-44-4f-45-48-4f-4d-45-52"></a>`DOEHOMER`

`( -- )`

DOEHOMER only posts the text.

```text
: DOEHOMER SHOMER ;
```

**Calls:** `SHOMER`.

### <a name="terse-word-44-4f-47-4f-56-45-52"></a>`DOGOVER`

`( -- )`

Do game over.

```text
: DOGOVER ( do game over )
SGO 32 OUTS B! CMSW BONE CMPT BONE PX0 2A B6 4D 8 RECTAN EIDI
8C0 INNX ! INN# BZERO GAMEOVER BZERO 9 LINN B! MLINN DI
GAMEOVER BONE LINN BZERO SCORE1 ZERO PX1 SCRS CMPLR BZERO
FLSHSTAY B@ IF FLSHSTAY BZERO FLSHOFF THEN 10 TWAIT INSCN
80 TWAIT INSCN CREDITS B@ IF SGO THEN SHILL BONE
FLSHOFF DROP 0 PLYR1UP BZERO ( plyr1up 0 ) EIDI ;
```

**Calls:** `SGO`, `B!`, `BONE`, `PX0`, `RECTAN`, `EIDI`, `BZERO`, `MLINN`, `DI`, `PX1`, `SCRS`, `B@`, `FLSHOFF`, `TWAIT`, `INSCN`, `DROP`.

**Used by:** `TF`.

### <a name="terse-word-44-4f-48-4f-4d-45-52"></a>`DOHOMER`

`( -- )`

DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer;

```text
: DOHOMER BALLERASE SHOMER CLRBLST SBO STRINGOFFTIMER BZERO ;
```

**Calls:** `BALLERASE`, `SHOMER`, `CLRBLST`, `SBO`, `BZERO`.

### <a name="terse-word-44-4f-53-41-46-45"></a>`DOSAFE`

`( -- )`

DOSAFE combines music/text.

```text
: DOSAFE MSAFE SSAFE ;
```

**Calls:** `MSAFE`, `SSAFE`.

### <a name="terse-word-44-4f-53-42-41-4c-4c"></a>`DOSBALL`

`( x y options -- )`

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSBALL BALLS B@ DUP 31 = IF DROP SBALL1 ELSE 32 = IF SBALL2
ELSE SBALL3 THEN THEN ;
```

**Calls:** `B@`, `DUP`, `DROP`, `SBALL1`, `SBALL2`, `SBALL3`.

**Used by:** `BALLTIME`.

### <a name="terse-word-44-4f-53-4f-55-54"></a>`DOSOUT`

`( x y options -- )`

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSOUT OUTS B@ DUP 31 = IF DROP SOUT1 ELSE 32 = IF SOUT2
ELSE SOUT3 THEN THEN ;
```

**Calls:** `B@`, `DUP`, `DROP`, `SOUT1`, `SOUT2`, `SOUT3`.

**Used by:** `OUTTIME`.

### <a name="terse-word-44-4f-53-53-54-52-49-4b-45"></a>`DOSSTRIKE`

`( x y options -- )`

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSSTRIKE STRIKES B@ 31 = IF SSTRIKE1 ELSE SSTRIKE2 THEN ;
```

**Calls:** `B@`, `SSTRIKE1`, `SSTRIKE2`.

**Used by:** `STRIKETIME`.

### <a name="terse-word-44-50-31"></a>`DP1`

`( -- )`

Display the one-coin deposit prompt.

```text
: DP1 1A00 2C00 828 A" DEPOSIT 1 COIN" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `TCNT`.

### <a name="terse-word-44-50-31-32-43-4e"></a>`DP12CN`

`( -- )`

Uses B@ and SPOST to compose game logic.

```text
: DP12CN CNSW1 B@ IF 300 2800 828
A" DEPOSIT 2 COINS TO CONTINUE THIS GAME" SPOST
ELSE DP1CN THEN ;
```

**Calls:** `B@`, `SPOST`, `DP1CN`.

**Used by:** `CHKGMCNT`.

### <a name="terse-word-44-50-31-43-4e"></a>`DP1CN`

`( -- )`

Uses SPOST to compose game logic.

```text
: DP1CN 400 2800 828 A" DEPOSIT 1 COIN TO CONTINUE THIS GAME"
SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DP12CN`, `DPCN`, `SORRY`.

### <a name="terse-word-44-50-43-4e"></a>`DPCN`

`( -- )`

Wait for next coin.

```text
: DPCN ( wait for next coin )
DP1CN CREDITS BZERO FF TWAIT FF TWAIT DP1CN CREDITS B@ IF
GAMEOVER BZERO ELSE LINN BZERO UPCRED BONE THEN CREDITS 1+B! ;
```

**Calls:** `DP1CN`, `BZERO`, `TWAIT`, `B@`, `BONE`, `B!`.

**Used by:** `TF`.

### <a name="terse-word-64-70-6f-73-74"></a>`dpost`

`( x y options nibble -- x y options )`

dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.

```text
: dpost 0F AND OVER 4000 AND 4000 XOR OVER OR IF 30 +
SWAP BFFF AND SWAP ELSE DROP 20 THEN cpost ;
```

**Calls:** `AND`, `OVER`, `XOR`, `OR`, `SWAP`, `DROP`, `cpost`.

**Used by:** `NPOST`.

### <a name="terse-word-44-54-43"></a>`DTC`

`( -- )`

DTC selects decimal and invokes the host editor.

```text
{ : DTC } DECIMAL EDIT { ; }
```

**Calls:** `DECIMAL`.

### <a name="terse-word-44-55-52-41-54-49-4f-4e"></a>`DURATION`

`( duration -- )`

Emit a note-duration command.

```text
{ : DURATION } 1 B, B, { ; }
```

**Used by:** `ANOTE`, `BNOTE`, `CNOTE`, `REST`.

### <a name="terse-word-44-57-41-49-54"></a>`DWAIT`

`( limit -- )`

DWAIT runs nested loops with interrupts enabled and disables them on return;

```text
: DWAIT EI 0 DO FF 0 DO LOOP LOOP DI ;
```

**Calls:** `EI`, `DO`, `LOOP`, `DI`.

**Used by:** `DOCHGS`, `STRTBALL`.

### <a name="terse-word-46-3d"></a>`F=`

`( -- )`

Declare a forward word with the game's source shorthand.

```text
{ : F= } FORWARD { ; }
```

### <a name="terse-word-46-31-53-54-4c-53"></a>`F1STLS`

`( -- )`

Select the first-base left-side action.

```text
: F1STLS F1STPT F1STL1ST NOACTPA 0 ;
```

### <a name="terse-word-46-31-53-54-52-53"></a>`F1STRS`

`( -- )`

Select the first-base right-side action.

```text
: F1STRS F1STPT F1STR1ST NOACTPA 0 ;
```

### <a name="terse-word-46-32-4e-44-4c-53"></a>`F2NDLS`

`( -- )`

Uses BONE to compose game logic.

```text
: F2NDLS DPHIT BONE HRPT HL1ST F2NDL2ND 0 ;
```

**Calls:** `BONE`.

### <a name="terse-word-46-32-4e-44-52-53"></a>`F2NDRS`

`( -- )`

Uses BONE to compose game logic.

```text
: F2NDRS DPHIT BONE HRPT HL1ST F2NDR2ND 0 ;
```

**Calls:** `BONE`.

### <a name="terse-word-46-33-52-44-4c-53"></a>`F3RDLS`

`( -- )`

Select the third-base left-side action.

```text
: F3RDLS F3RDLSS F3RDL3RD 1 ;
```

### <a name="terse-word-46-33-52-44-52-53"></a>`F3RDRS`

`( -- )`

Select the third-base right-side action.

```text
: F3RDRS NOACTPA F3RDR3RD 1 ;
```

### <a name="terse-word-46-42-4c-4c-53"></a>`FBLLS`

`( -- )`

Uses BONE to compose game logic.

```text
: FBLLS NOACTPA FBLL3RD
1 THROWAROUND BONE FOUL BONE ;
```

**Calls:** `BONE`.

### <a name="terse-word-46-42-4c-52-53"></a>`FBLRS`

`( -- )`

Uses BONE to compose game logic.

```text
: FBLRS FOUL BONE THROWAROUND BONE NOACTPA
FBLR1ST NOACTPA 0 ;
```

**Calls:** `BONE`.

### <a name="terse-word-46-49-45-4c-44-57-52-54"></a>`FIELDWRT`

`( -- )`

Write field outline.

```text
: FIELDWRT ( write field outline )
FINDEX BZERO GETF GETF GETF GETF DLINE
8 0 DO GETF GETF CNLINE LOOP ;
```

**Calls:** `BZERO`, `GETF`, `DLINE`, `DO`, `CNLINE`, `LOOP`.

**Used by:** `FL`.

### <a name="terse-word-46-4c"></a>`FL`

`( -- )`

Set up all of background.

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

**Calls:** `OUTP`, `ZERORAM`, `FLFILL`, `EI`, `INFIELD`, `PX1`, `FIELDWRT`, `WRITR`, `FMIRROR`, `OUTLINE`, `SPOST`, `CPOST`, `RECTAN`, `EIDI`, `HOM`, `VIS`, `SCRS`, `DUP`, `B!`, `SBO`, `SUP`.

**Used by:** `PLRSELECT`, `PUP`, `STRTBALL`.

### <a name="terse-word-46-4c-44-44-53-54-2c"></a>`FLDDST,`

`( -- )`

Emit the fielder destination command.

```text
{ : FLDDST, } 7 B, { ; }
```

### <a name="terse-word-46-4c-46-49-4c-4c"></a>`FLFILL`

`( -- )`

FLFILL fills the background while allowing interrupts;

```text
: FLFILL EI 0 4000 3C00 FILL DI ;
```

**Calls:** `EI`, `FILL`, `DI`.

**Used by:** `FL`, `INSTRC`.

### <a name="terse-word-46-4c-53-48-4d-45"></a>`FLSHME`

`( -- )`

FLSHME executes only a nonzero address whose top two bits are clear;

```text
: FLSHME FLSHWHO @ DUP 0C000 AND 0= OVER 0 <> AND IF EX
```

**Calls:** `DUP`, `AND`, `OVER`, `EX`.

**Used by:** `FLSHWUP`.

### <a name="terse-word-46-4c-53-48-54-4f-4e"></a>`FLSHTON`

`( -- )`

FLSHTON saves a callback and starts its timer.

```text
: FLSHTON FLSHWHO ! FLSHON BONE FLSHTIME BONE ;
```

**Calls:** `BONE`.

**Used by:** `DOCHGS`, `INSCN`, `WUPTON`.

### <a name="terse-word-46-4f-55-4c-54-49-4d-45"></a>`FOULTIME`

`( -- )`

Foulball process.

```text
: FOULTIME ( foulball process )
SFOUL STRIKES DUP B@ 32 = IF DROP
ELSE 1+B! SBO THEN ;
```

**Calls:** `SFOUL`, `DUP`, `B@`, `DROP`, `B!`, `SBO`.

### <a name="terse-word-46-4f-57-52"></a>`FOWR`

`( -- )`

Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.

```text
{ : FOWR } FORWARD { ; }
```

### <a name="terse-word-46-53-53-4c-53"></a>`FSSLS`

`( -- )`

Uses BONE to compose game logic.

```text
: FSSLS DPHIT BONE FSSLSS HR3RD 1 ;
```

**Calls:** `BONE`.

### <a name="terse-word-46-53-53-52-53"></a>`FSSRS`

`( -- )`

Uses BONE to compose game logic.

```text
: FSSRS DPHIT BONE FSSRSS HR3RD 1 ;
```

**Calls:** `BONE`.

### <a name="terse-word-47-45-54-46"></a>`GETF`

`( -- index field-byte )`

GETF fetches FIELD bytes sequentially;

```text
: GETF FINDEX B@ FIELD B@ FINDEX 1+B! ;
```

**Calls:** `B@`, `B!`.

**Used by:** `FIELDWRT`.

### <a name="terse-word-47-52-4e-44-52-41-43-54-49-4f-4e"></a>`GRNDRACTION`

`( sector -- )`

Consumes a selected hit-sector index, executes its `GSTBL` word, then installs the appropriate fielder playaction addresses.

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

**Calls:** `BZERO`, `EX`, `DUP`, `B!`, `LDINFLDPA`.

**Used by:** `GRNDRHIT`.

### <a name="terse-word-47-52-4e-44-52-48-49-54"></a>`GRNDRHIT`

`( -- )`

Computes a ground-ball sector from randomized timing and pitch direction, dispatches `GRNDRACTION`, then sets ball destination.

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

**Calls:** `BONE`, `B!`, `RND`, `B@`, `EX`, `DUP`, `GRNDRACTION`, `MFOUL`, `DROP`, `WUPGO`, `HITRUN`, `HITDST`.

**Used by:** `INLOG`.

### <a name="terse-word-48-49-54-44-53-54"></a>`HITDST`

`( -- )`

Chooses hit location.

```text
: HITDST ( chooses hit location ) VUPDATE# BL BZERO
THWBLPA VPLAYACTPC BL ! 82 VSTATUS BL B! ( vact )
BAL THWPA ! 2800 VX BL ! AD00 VY BL ! ;
```

**Calls:** `BZERO`, `B!`.

**Used by:** `GRNDRHIT`, `OUTFLDHIT`.

### <a name="terse-word-48-4c-4c-53"></a>`HLLS`

`( -- )`

Uses BONE to compose game logic.

```text
: HLLS HITOF BONE NOACTPA HLL3RD 1 ;
```

**Calls:** `BONE`.

### <a name="terse-word-48-4c-53"></a>`HLS`

`( -- )`

Uses BONE to compose game logic.

```text
: HLS HITOF BONE HLSS HL3RD 1 ;
```

**Calls:** `BONE`.

### <a name="terse-word-48-4d-53"></a>`HMS`

`( -- )`

Uses BONE to compose game logic.

```text
: HMS HITOF BONE HMSS HR3RD 1 ;
```

**Calls:** `BONE`.

### <a name="terse-word-48-4f-4d"></a>`HOM`

`( -- )`

HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;

```text
: HOM 4200 7A00 828 48 CPOST 4400 7F00 8828 A" OME" SPOST ;
```

**Calls:** `CPOST`, `SPOST`.

**Used by:** `FL`, `WUPWRT`.

### <a name="terse-word-48-52-42-59-32"></a>`HRBY2`

`( -- )`

HRBY2 halves HRAT.

```text
: HRBY2 HRAT B@ 2/ HRAT B! ;
```

**Calls:** `B@`, `B!`.

**Used by:** `WHBODDS`.

### <a name="terse-word-48-52-4c-53"></a>`HRLS`

`( -- )`

Uses BONE to compose game logic.

```text
: HRLS HITOF BONE HRPT HRL1ST NOACTPA 0 ;
```

**Calls:** `BONE`.

### <a name="terse-word-48-52-53"></a>`HRS`

`( -- )`

Uses BONE to compose game logic.

```text
: HRS HITOF BONE HRPT HR1ST HR2ND 0 ;
```

**Calls:** `BONE`.

### <a name="terse-word-49-27"></a>`I'`

`( -- )`

Emit the target's indexed immediate reference.

```text
{ : I' } 0CD B, ]'[ { 2+ } , B, { ; }
```

### <a name="terse-word-49-43-4f-44-45"></a>`ICODE`

`( -- )`

Defines the native interrupt handler and emits its Z80 register-save prologue in the host compiler.

```text
{ : ICODE } CODE { [ } ASM { ] } NEXT XTHL, D PUSH, B PUSH,
PSW PUSH, M A MOV, INLIN OUT, H INX, IPNT SHLD,
EXX, EXAF, H PUSH, D PUSH, B PUSH, PSW PUSH,
ASM { ; }
```

**Calls:** `ASM`.

### <a name="terse-word-49-4e-45-58-54"></a>`INEXT`

`( -- )`

INEXT emits a jump to IEX;

```text
{ : INEXT } { LIT [ } ' IEX { , } ASM { ] } JMP, { ; }
```

**Calls:** `LIT`, `IEX`, `ASM`.

### <a name="terse-word-49-4e-4c-4f-47"></a>`INLOG`

`( -- )`

Infield master logic.

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

**Calls:** `BZERO`, `BONE`, `MHIT`, `B@`, `RND`, `DUP`, `B!`, `OUTFLDHIT`, `GRNDRHIT`, `ALLFLDACT`.

**Used by:** `BATHIT`.

### <a name="terse-word-49-4e-4e-4f-44-44-53"></a>`INNODDS`

`( -- )`

INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state;

```text
: INNODDS
INN# B@ CMSW B@ IF DUP 6 > IF DROP 1 ELSE 1 > IF 2 ELSE 3
THEN THEN ( cmp player hit ratio ) SPBON B@ IF DROP 4 THEN
ELSE ( player ) SPBON B@ ( bonous inning ) IF 3 > IF 1 ELSE 2
THEN ELSE 1 - IODTBL B@ THEN THEN IODDS B! ;
```

**Calls:** `B@`, `DUP`, `DROP`, `B!`.

### <a name="terse-word-49-4e-53-43-4e"></a>`INSCN`

`( -- )`

Insert coin call.

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

**Calls:** `SGO`, `ISCN`, `FLSHTON`, `B@`, `SPOST`, `WRITR`.

**Used by:** `DOGOVER`.

### <a name="terse-word-49-4e-53-54-52-43"></a>`INSTRC`

`( -- )`

Instructions.

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

**Calls:** `BZERO`, `BEGIN`, `FLFILL`, `SPOST`, `INSWAIT`, `B@`, `END`.

**Used by:** `STRTBALL`.

### <a name="terse-word-49-4e-53-57-41-49-54"></a>`INSWAIT`

`( count -- )`

INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.

```text
: INSWAIT EI BEGIN FF 0 DO LOOP
14 INP 33 AND 33 < IF DROP 1 INSOUT BONE THEN
1- DUP 0= END DROP DI ;
```

**Calls:** `EI`, `BEGIN`, `DO`, `LOOP`, `INP`, `AND`, `DROP`, `BONE`, `DUP`, `END`, `DI`.

**Used by:** `INSTRC`.

### <a name="terse-word-49-4e-54-45-52-52-55-50-54-53-3e"></a>`INTERRUPTS>`

`( -- )`

Emit the interrupt-vector dispatch jump.

```text
{ : INTERRUPTS> } { [ } ASM { ] } JMP, { ; }
```

**Calls:** `ASM`.

### <a name="terse-word-49-4e-54-48-49-47-48-52-45-53"></a>`INTHIGHRES`

`( -- )`

Intialize screen for commercial mode.

```text
: INTHIGHRES ( intialize screen for commercial mode )
1 8 OUTP ( con,com port ) C0 0A OUTP ( vertbl )
0 9 OUTP ( horzcb ) ;
```

**Calls:** `OUTP`.

**Used by:** `PUP`.

### <a name="terse-word-49-53-43-4e"></a>`ISCN`

`( -- )`

Display the V15 instruction message.

```text
: ISCN 1C00 1000 828 A" V15" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `INSCN`.

### <a name="terse-word-4c-41-42-4c-45"></a>`LABLE`

`( -- )`

Provide the original source's label-definition alias.

```text
{ : LABLE } DATA { ; }
```

### <a name="terse-word-4c-43-42-2c"></a>`LCB,`

`( -- )`

Uses ACT, and DEACT, to compose game logic.

```text
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

### <a name="terse-word-4c-44-49-4e-46-4c-44-50-41"></a>`LDINFLDPA`

`( -- )`

LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.

```text
: LDINFLDPA VPLAYACTPC 3RD ! VPLAYACTPC SS ! VPLAYACTPC 2ND !
VPLAYACTPC 1ST ! VPLAYACTPC PT ! ;
```

**Used by:** `GRNDRACTION`, `OUTFLDHIT`.

### <a name="terse-word-4c-44-50-43"></a>`LDPC`

`( -- )`

Emit/load the music program-counter value.

```text
{ : LDPC } 3 B, , { ; }
```

**Used by:** `QUIT`.

### <a name="terse-word-4c-44-50-43-43"></a>`LDPCC`

`( -- )`

Emit/load a music program-counter command.

```text
{ : LDPCC } 2 B, , { ; }
```

### <a name="terse-word-4c-4b-2c"></a>`LK,`

`( -- )`

Uses BACT, and DEACT, to compose game logic.

```text
{ : LK, } 0 0 0 BACT, DEACT, { ; }
```

**Calls:** `BACT,`, `DEACT,`.

### <a name="terse-word-4c-53-45-54-54-46-43-4f-4f-52"></a>`LSETTFCOOR`

`( -- )`

Set take field coor & status -active , xpand.

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

**Calls:** `DO`, `DUP`, `SB!`, `S!`, `LOOP`, `B@`, `DROP`, `B!`.

**Used by:** `SETTF`.

### <a name="terse-word-4d-41-53-54-45-52"></a>`MASTER`

`( -- )`

Define the game's master music stream.

```text
{ : MASTER } 10 B, B, { ; }
```

**Used by:** `CMAJOR`.

### <a name="terse-word-4d-42-41-4c-4c"></a>`MBALL`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MBALL 0 BALLSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `BALLTIME`.

### <a name="terse-word-4d-43-41-4e-4e-4f-4e"></a>`MCANNON`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MCANNON 0 CANNONSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `SCOREME`, `STARTMUSIC`.

### <a name="terse-word-4d-43-4f-49-4e"></a>`MCOIN`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MCOIN 0 COINSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `CHKCOIN1`, `CHKCOIN2`.

### <a name="terse-word-4d-43-56-4f-4c-53"></a>`MCVOLS`

`( volume -- )`

Emit music-channel volume values.

```text
{ : MCVOLS } 15 B, B, { ; }
```

**Used by:** `CMAJOR`, `QUIET`, `REST`, `^`.

### <a name="terse-word-4d-46-45-4e-43-45"></a>`MFENCE`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MFENCE 0 FENCESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `STARTMUSIC`.

### <a name="terse-word-4d-46-4f-55-4c"></a>`MFOUL`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MFOUL 0 FOULSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `GRNDRHIT`.

### <a name="terse-word-4d-48-49-54"></a>`MHIT`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MHIT 0 CRACKSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `INLOG`.

### <a name="terse-word-4d-4c-49-4e-4e"></a>`MLINN`

`( -- )`

Mark last inning.

```text
: MLINN ( mark last inning ) DI PX0 2A A5 4D 3 RECTAN LINN B@
DUP DUP IF 0A < IF 8F0 SWAP 0 DO 200 + LOOP ELSE DROP 1CF0
THEN A500 IMRK 301 828 WRITE ELSE DROP DROP THEN EI ;
```

**Calls:** `DI`, `PX0`, `RECTAN`, `B@`, `DUP`, `SWAP`, `DO`, `LOOP`, `DROP`, `WRITE`, `EI`.

**Used by:** `CREDARROW`, `DOGOVER`, `PLRSELECT`, `STRTBALL`, `TF`.

### <a name="terse-word-4d-4f-50-45-4e-45-52-53"></a>`MOPENERS`

`( -- )`

Uses PMUSIC to compose game logic.

```text
: MOPENERS 0 TAKE-ME PMUSIC ;
```

**Calls:** `PMUSIC`.

**Used by:** `STRTBALL`.

### <a name="terse-word-4d-4f-55-54"></a>`MOUT`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MOUT 0 OUTSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `OUTTIME`.

### <a name="terse-word-4d-53-41-46-45"></a>`MSAFE`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MSAFE 0 SAFESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `DOSAFE`.

### <a name="terse-word-4d-53-54-52-49-4b-45"></a>`MSTRIKE`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MSTRIKE 0 STRIKESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `STRIKETIME`.

### <a name="terse-word-4d-59-41-48"></a>`MYAH`

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MYAH 0 CHEERSSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `BALLTIME`, `OUTTIME`, `SCOREME`, `STARTMUSIC`.

### <a name="terse-word-4e-4f-49-53-45"></a>`NOISE`

`( -- )`

Emit a noise/sound command.

```text
{ : NOISE } 17 B, B, { ; }
```

**Used by:** `CMAJOR`.

### <a name="terse-word-4e-4f-54-45-53"></a>`NOTES`

`( -- )`

Uses ATONE and BTONE to compose game logic.

```text
{ : NOTES } ATONE BTONE CNOTE { ; }
```

**Calls:** `ATONE`, `BTONE`, `CNOTE`.

### <a name="terse-word-4e-50-4f-53-54"></a>`NPOST`

`( x y options address length -- )`

Post a bcd number on the screen ; see options.

```text
: NPOST ( post a bcd number on the screen ; see options )
( in= x , y , opt+ex/mag , variable adr , # of bytes )
( out- character on screen )
OVER + SWAP DO I B@ SWAN dpost I B@ dpost LOOP
3DROP ;
```

**Calls:** `OVER`, `SWAP`, `DO`, `I`, `B@`, `SWAN`, `dpost`, `LOOP`, `DROP`.

**Used by:** `SCOREME`.

### <a name="terse-word-4f-46-46-44-53-54-2c"></a>`OFFDST,`

`( -- )`

Emit the outfielder destination command.

```text
{ : OFFDST, } 9 B, { ; }
```

### <a name="terse-word-4f-46-4d-4f-54-2c"></a>`OFMOT,`

`( -- )`

Emit the outfield motion command.

```text
{ : OFMOT, } 5 B, { ; }
```

### <a name="terse-word-4f-4e-31-53-54-2c"></a>`ON1ST,`

`( -- )`

Emit the first-base playaction command.

```text
{ : ON1ST, } 2 B, { ; }
```

### <a name="terse-word-4f-4e-32-4e-44-2c"></a>`ON2ND,`

`( -- )`

Emit the second-base playaction command.

```text
{ : ON2ND, } 3 B, { ; }
```

### <a name="terse-word-4f-4e-33-52-44-2c"></a>`ON3RD,`

`( -- )`

Emit the third-base playaction command.

```text
{ : ON3RD, } 4 B, { ; }
```

### <a name="terse-word-4f-55-54-46-4c-44-48-49-54"></a>`OUTFLDHIT`

`( -- )`

Fly ball.

```text
: OUTFLDHIT ( fly ball ) 18 TOTIMER B! HITOF BONE 3 VVEL BL B!
TOOF BONE 3 TOOF# B! INAIR BONE 3000 RND 700 + ( y )
SWINGTYPE B@ 1- FHTBL @ F00 RND + ( x )
0A RND HMHTBL B@ ( hit type ) 5FF RND 5FF RND
HOMERCHK WUPGO
HITDST HRPT HL1ST VDSTX BL @ 2800 < IF ( hit left )
HL2ND HLOUTSSPA ELSE HROUT2NDPA HRSS THEN HR3RD LDINFLDPA ;
```

**Calls:** `B!`, `BONE`, `RND`, `B@`, `HOMERCHK`, `WUPGO`, `HITDST`, `LDINFLDPA`.

**Used by:** `INLOG`.

### <a name="terse-word-4f-55-54-4c-49-4e-45"></a>`OUTLINE`

`( x y width height -- )`

Creates rectanguler outline.

```text
: OUTLINE ( creates rectanguler outline )
( in- X , Y , X length , Y length ; pxtype set )
4 NDUP DROP 3 PICK + OVER 4 NDUP DLINE 5 PICK + CNLINE
3 PICK + CNLINE DROP DROP CNLINE ;
```

**Calls:** `NDUP`, `DROP`, `OVER`, `DLINE`, `CNLINE`.

**Used by:** `FL`.

### <a name="terse-word-4f-55-54-54-49-4d-45"></a>`OUTTIME`

`( -- )`

Out prc.

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

**Calls:** `DUP`, `B!`, `B@`, `MYAH`, `DO`, `S!`, `OR`, `AND`, `SB!`, `LOOP`, `DROP`, `BONE`, `BALLERASE`, `SGO`, `FLSHOFF`, `MOUT`, `CLRBLST`, `SBO`, `DOSOUT`.

**Used by:** `STRIKETIME`.

### <a name="terse-word-50-4c-52-43-48-4b"></a>`PLRCHK`

`( -- )`

PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL;

```text
: PLRCHK 14 INP DUP 10 AND 10 XOR IF DROP CMPLR BONE STRTBALL
DI 800 7000 8828 A" YOU ARE" SPOST EI
ELSE STRT1 B@ IF DROP ELSE 20 AND 20 XOR IF CNSW1 B@ IF
CNSW12 BONE THEN STRTBALL THEN THEN THEN ;
```

**Calls:** `INP`, `DUP`, `AND`, `XOR`, `DROP`, `BONE`, `STRTBALL`, `DI`, `SPOST`, `EI`, `B@`.

**Used by:** `TERSECHK`.

### <a name="terse-word-50-4c-52-53-45-4c-45-43-54"></a>`PLRSELECT`

`( -- )`

Select singel player or 2 player.

```text
: PLRSELECT ( select singel player or 2 player )
DI FL CHKPLRS BONE
SPLR SELECT BZERO MLINN ;
```

**Calls:** `DI`, `FL`, `BONE`, `SPLR`, `BZERO`, `MLINN`.

**Used by:** `TERSECHK`.

### <a name="terse-word-50-50-4f-53-54"></a>`PPOST`

`( x y options string -- x y options )`

Draw a counted string and keep drawing coordinates.

```text
: PPOST ( post an ascii-string on the screen leaving x y and
options for next string ; see options )
( in= x , y , opt+ex/mag , string )
( i.e. 0 0 8828 28 A" STRING" PPOST )
( out- character on screen ; x , y , opt+ex/mag )
COUNT OVER + SWAP DO I B@ cpost LOOP ;
```

**Calls:** `COUNT`, `OVER`, `SWAP`, `DO`, `I`, `B@`, `cpost`, `LOOP`.

**Used by:** `SPOST`.

### <a name="terse-word-50-55-50"></a>`PUP`

`( -- )`

Power up routine.

```text
: PUP ( power up routine )
INTHIGHRES B1 DUP 0 OUTP 4 OUTP 7 2 OUTP
DI 0 RND# @ 1 RND# @ SCRERASE 1 RND# ! 0 RND# ! EMUSIC S10
SHILL BONE
DI FL SGO EI GAMEOVER BONE TF SENTRY ;
```

**Calls:** `INTHIGHRES`, `DUP`, `OUTP`, `DI`, `SCRERASE`, `EMUSIC`, `S10`, `BONE`, `FL`, `SGO`, `EI`, `TF`, `SENTRY`.

### <a name="terse-word-50-58-30"></a>`PX0`

`( -- )`

Emit zero/white pixel patterns and define PX1/PX0 to select them.

```text
: PX0 0 PXT0 PXTYPE ! ;
```

**Used by:** `DOGOVER`, `MLINN`.

### <a name="terse-word-50-58-31"></a>`PX1`

`( -- )`

Emit zero/white pixel patterns and define PX1/PX0 to select them.

```text
: PX1 0 PXT1 PXTYPE ! ;
```

**Used by:** `DOGOVER`, `FL`.

### <a name="terse-word-51-55-49-45-54"></a>`QUIET`

`( -- )`

Uses ABVOLS and MCVOLS to compose game logic.

```text
{ : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`, `ATONE`, `BTONE`, `CTONE`, `QUIT`.

### <a name="terse-word-51-55-49-54"></a>`QUIT`

`( -- )`

Uses HERE and LDPC to compose game logic.

```text
{ : QUIT } 4 B, HERE LDPC { ; }
```

**Calls:** `HERE`, `LDPC`.

**Used by:** `QUIET`.

### <a name="terse-word-52-43-42-2c"></a>`RCB,`

`( -- )`

Uses ACT, and DEACT, to compose game logic.

```text
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

### <a name="terse-word-52-44-52-4e-44-4e-54-45"></a>`RDRNDNTE`

`( -- )`

Emit a randomized note with a rest interval.

```text
{ : RDRNDNTE } 0 B, B, B, B, { ; }
```

### <a name="terse-word-52-45-43-4c-49-4e-45"></a>`RECLINE`

`( x y width height options -- x y width height options )`

Draws a horizontal rectangle row without consuming the five retained rectangle arguments.

```text
: RECLINE 4 PICK 4 PICK 2DUP SWAP 6 PICK + SWAP DLINE ;
```

**Calls:** `DUP`, `SWAP`, `DLINE`.

**Used by:** `RECTAN`.

### <a name="terse-word-52-45-43-54-41-4e"></a>`RECTAN`

`( x y width height -- )`

In X, Y, X length, Y length, pxtype set.

```text
: RECTAN ( in X, Y, X length, Y length, pxtype set )
BEGIN RECLINE ROT 1+ ROT ROT 1- DUP 0= END DROP DROP DROP
DROP ;
```

**Calls:** `BEGIN`, `RECLINE`, `ROT`, `DUP`, `END`, `DROP`.

**Used by:** `DOGOVER`, `FL`, `MLINN`, `SCRS`.

### <a name="terse-word-52-45-53-54"></a>`REST`

`( duration -- )`

Insert a silent music interval.

```text
{ : REST } 0 ABVOLS 0 MCVOLS 0A DURATION { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`, `DURATION`.

### <a name="terse-word-52-45-53-54-2c"></a>`REST,`

`( -- )`

Emit a resting playaction record.

```text
{ : REST, } NBD , B, 0 , 0 , { ; }
```

### <a name="terse-word-52-45-54-50-41"></a>`RETPA`

`( -- )`

Return to position pa.

```text
: RETPA ( return to position pa )
VMAGIC PT 8 0 DO DUP DUP VPLAYACTPC + TFPA S! VSTATUS + DUP
B@ 80 OR F7 AND SB! VLENGTH + LOOP DROP ;
```

**Calls:** `DO`, `DUP`, `S!`, `B@`, `OR`, `AND`, `SB!`, `LOOP`, `DROP`.

**Used by:** `STFLD`.

### <a name="terse-word-52-4e-44-4e-54-45"></a>`RNDNTE`

`( -- )`

Emit a randomized musical note.

```text
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
```

### <a name="terse-word-52-52-52-4e-44-4e-54-45"></a>`RRRNDNTE`

`( -- )`

Emit a sequence of randomized notes.

```text
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
```

### <a name="terse-word-52-55-4e-31-43-48-4b-31-53-54"></a>`RUN1CHK1ST`

`( -- occupancy-code vector-address )`

Selects the runner vector for an occupied first-base slot, or delegates to the next occupancy test.

```text
: RUN1CHK1ST VWBASE R1 B@ 1 = IF 1 VMAGIC R2
ELSE RUN1CHK2ND THEN ;
```

**Calls:** `B@`, `RUN1CHK2ND`.

**Used by:** `WHBODDS`.

### <a name="terse-word-52-55-4e-31-43-48-4b-32-4e-44"></a>`RUN1CHK2ND`

`( -- occupancy-code vector-address )`

Chooses the next runner vector according to runner 1's second-base occupancy.

```text
: RUN1CHK2ND VWBASE R1 B@ 2 = IF RUN2CHK12ND
ELSE RUN2CHK THEN ;
```

**Calls:** `B@`, `RUN2CHK12ND`, `RUN2CHK`.

**Used by:** `RUN1CHK1ST`.

### <a name="terse-word-52-55-4e-32-43-48-4b"></a>`RUN2CHK`

`( -- occupancy-code vector-address )`

Returns the runner code and vector for the next open base.

```text
: RUN2CHK VWBASE R2 B@ 0 = IF 3 VMAGIC R2
ELSE RUN2CHK1ST THEN ;
```

**Calls:** `B@`, `RUN2CHK1ST`.

**Used by:** `RUN1CHK2ND`.

### <a name="terse-word-52-55-4e-32-43-48-4b-31-32-4e-44"></a>`RUN2CHK12ND`

`( -- occupancy-code vector-address )`

Returns runner 2 or 3 vector based on second-base occupancy.

```text
: RUN2CHK12ND VWBASE R2 B@ 0 = IF 2 VMAGIC R2
ELSE 4 VMAGIC R3 THEN ;
```

**Calls:** `B@`.

**Used by:** `RUN1CHK2ND`.

### <a name="terse-word-52-55-4e-32-43-48-4b-31-53-54"></a>`RUN2CHK1ST`

`( -- occupancy-code vector-address )`

Chooses runner 3 or delegates according to runner 2's first-base state.

```text
: RUN2CHK1ST VWBASE R2 B@ 1 = IF 6 VMAGIC R3
ELSE RUN3CHK THEN ;
```

**Calls:** `B@`, `RUN3CHK`.

**Used by:** `RUN2CHK`.

### <a name="terse-word-52-55-4e-33-43-48-4b"></a>`RUN3CHK`

`( -- occupancy-code vector-address )`

Returns runner 3 or 4 code/vector from third runner's occupancy.

```text
: RUN3CHK VWBASE R3 B@ 0 = IF 7 VMAGIC R3 ELSE 5 VMAGIC R4
THEN ;
```

**Calls:** `B@`.

**Used by:** `RUN2CHK1ST`.

### <a name="terse-word-52-55-4e-44-53-54-2c"></a>`RUNDST,`

`( -- )`

Emit the runner destination command.

```text
{ : RUNDST, } 8 B, { ; }
```

### <a name="terse-word-53-21"></a>`S!`

`( address value -- )`

Store cell with address-first arguments.

```text
: S! SWAP ! ;
```

**Calls:** `SWAP`.

**Used by:** `LSETTFCOOR`, `OUTTIME`, `RETPA`.

### <a name="terse-word-53-31-30"></a>`S10`

`( -- )`

S10 starts INTERRUPTS0 through ISTART;

```text
: S10 INTERRUPTS0 ISTART ;
```

**Calls:** `ISTART`.

**Used by:** `PUP`, `STARTMUSIC`.

### <a name="terse-word-53-31-31"></a>`S11`

`( -- )`

S11 starts INTERRUPTS1.

```text
: S11 INTERRUPTS1 ISTART ;
```

**Calls:** `ISTART`.

**Used by:** `STARTMUSIC`.

### <a name="terse-word-53-42-21"></a>`SB!`

`( address value -- )`

Store byte with address-first arguments.

```text
: SB! SWAP B! ;
```

**Calls:** `SWAP`, `B!`.

**Used by:** `BONE`, `BZERO`, `LSETTFCOOR`, `OUTTIME`, `RETPA`, `WUPGO`.

### <a name="terse-word-53-42-41-4c-4c-31"></a>`SBALL1`

`( x y options -- )`

Draw the BALL 1 message.

```text
: SBALL1 2200 2ROT A" BALL 1" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

### <a name="terse-word-53-42-41-4c-4c-32"></a>`SBALL2`

`( x y options -- )`

Draw the BALL 2 message.

```text
: SBALL2 2200 2ROT A" BALL 2" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

### <a name="terse-word-53-42-41-4c-4c-33"></a>`SBALL3`

`( x y options -- )`

Draw the BALL 3 message.

```text
: SBALL3 2200 2ROT A" BALL 3" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

### <a name="terse-word-53-42-4f"></a>`SBO`

`( -- )`

SBO posts the three $30-based count characters at their fixed positions.

```text
: SBO 3700 B000 308 BALLS B@ CPOST 3F00 B000 308 STRIKES B@
CPOST 4700 B000 308 OUTS B@ CPOST ;
```

**Calls:** `B@`, `CPOST`.

**Used by:** `BALLTIME`, `DOHOMER`, `FL`, `FOULTIME`, `OUTTIME`, `SSAFE`, `STRIKETIME`.

### <a name="terse-word-53-43-4f-52-45-4d-45"></a>`SCOREME`

`( -- )`

Plop scores up.

```text
: SCOREME ( plop scores up )
SCORESHOW DUP B@ 2 = IF 900 8C00 4308 SCORE2
ELSE 4300 8C00 4308 SCORE1 THEN 1 NPOST BZERO
HOMERUN B@ IF MCANNON ELSE MYAH THEN ;
```

**Calls:** `DUP`, `B@`, `NPOST`, `BZERO`, `MCANNON`, `MYAH`.

### <a name="terse-word-53-43-52-45-52-41-53-45"></a>`SCRERASE`

`( -- )`

Erase entire screen.

```text
: SCRERASE ( erase entire screen )
0 4000 3F00 FILL ;
```

**Calls:** `FILL`.

**Used by:** `PUP`.

### <a name="terse-word-53-43-52-53"></a>`SCRS`

`( -- )`

SCRS clears two score rectangles and draws zero score characters.

```text
: SCRS 1F 8A 18 0E RECTAN 107 8A 18 0E RECTAN
B00 8C00 308 30 CPOST 4500 8C00 308 30 CPOST ;
```

**Calls:** `RECTAN`, `CPOST`.

**Used by:** `DOGOVER`, `FL`.

### <a name="terse-word-53-45-54-46-44-53-54"></a>`SETFDST`

`( -- )`

Set up fielder destination values.

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

### <a name="terse-word-53-45-54-54-46"></a>`SETTF`

`( -- )`

SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

```text
: SETTF DI LSETTFCOOR STFLD SETTFPA EI ;
```

**Calls:** `DI`, `LSETTFCOOR`, `STFLD`, `SETTFPA`, `EI`.

### <a name="terse-word-53-45-54-54-46-50-41"></a>`SETTFPA`

`( -- )`

Take field pa.

```text
: SETTFPA ( take field pa )
TFPA2 VPLAYACTPC PT ! TFPA1 VPLAYACTPC 1ST !
TFPA1 VPLAYACTPC 2ND ! TFPA1 VPLAYACTPC 3RD !
TFPA1 VPLAYACTPC SS !
RUNBPA VPLAYACTPC R1 ! RUNBPA VPLAYACTPC R2 !
RUNBPA VPLAYACTPC R3 ! RUNBPA VPLAYACTPC R4 !
TBLPA VPLAYACTPC BL ! ;
```

**Used by:** `SETTF`.

### <a name="terse-word-53-46-4f-55-4c"></a>`SFOUL`

`( -- )`

Uses ROT and SPOST to compose game logic.

```text
: SFOUL 2400 2ROT A" FOUL " SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `FOULTIME`.

### <a name="terse-word-53-47-4f"></a>`SGO`

`( -- )`

Uses SPOST to compose game logic.

```text
: SGO 2000 2D00 828 A" GAME OVER" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DOGOVER`, `INSCN`, `OUTTIME`, `PUP`, `TF`.

### <a name="terse-word-53-48-4f-4d-45-52"></a>`SHOMER`

`( -- )`

Uses ROT and SPOST to compose game logic.

```text
: SHOMER 2300 2ROT A" HOMER" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOEHOMER`, `DOHOMER`.

### <a name="terse-word-53-4f-52-52-59"></a>`SORRY`

`( -- )`

Display the losing-player prompt.

```text
: SORRY 1B00 1000 828 A" TOO BAD I WON" SPOST DP1CN ;
```

**Calls:** `SPOST`, `DP1CN`.

**Used by:** `TF`.

### <a name="terse-word-53-4f-55-54-31"></a>`SOUT1`

`( x y options -- )`

Draw the 1 OUT message.

```text
: SOUT1 2300 2ROT A" 1 OUT" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

### <a name="terse-word-53-4f-55-54-32"></a>`SOUT2`

`( x y options -- )`

Draw the 2 OUT message.

```text
: SOUT2 2200 2ROT A" 2 OUTS" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

### <a name="terse-word-53-4f-55-54-33"></a>`SOUT3`

`( x y options -- )`

Draw the 3 OUT message.

```text
: SOUT3 2200 2ROT A" 3 OUTS" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

### <a name="terse-word-53-50-4c-52"></a>`SPLR`

`( -- )`

SPLR12/SPLR display available player choices;

```text
: SPLR CNSW1 B@ IF CREDITS B@ 1 <> IF SPLR12 ELSE 0E00 2000 828
A" SELECT 1 PLAYER OR DEPOSIT" SPOST
0F00 3000 828 A" 1 MORE COIN FOR 2 PLAYERS"
SPOST STRT1 BONE THEN ELSE SPLR12 THEN ;
```

**Calls:** `B@`, `SPLR12`, `SPOST`, `BONE`.

**Used by:** `PLRSELECT`.

### <a name="terse-word-53-50-4c-52-31-32"></a>`SPLR12`

`( -- )`

SPLR12/SPLR display available player choices;

```text
: SPLR12 1400 2000 828 A" SELECT 1 OR 2 PLAYERS" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `SPLR`.

### <a name="terse-word-53-50-4f-53-54"></a>`SPOST`

`( x y options string -- )`

Draw a string.

```text
: SPOST ( post an ascii-string on the screen ; see options )
( in= x , y , opt+ex/mag , string )
( i.e. 0 0 8828 A" STRING" SPOST )
( out- character on screen )
PPOST 3DROP ;
```

**Calls:** `PPOST`, `DROP`.

**Used by:** `CHGS`, `CONGR`, `DP1`, `DP12CN`, `DP1CN`, `FL`, `HOM`, `INSCN`, `INSTRC`, `ISCN`, `PLRCHK`, `SBALL1`, `SBALL2`, `SBALL3`, `SFOUL`, `SGO`, `SHOMER`, `SORRY`, `SOUT1`, `SOUT2`, `SOUT3`, `SPLR`, `SPLR12`, `SSAFE`, `SSTRIKE1`, `SSTRIKE2`, `SUP`, `SWALK`, `TCNT`, `VIS`, `YOU1ST`.

### <a name="terse-word-53-53-41-46-45"></a>`SSAFE`

`( x y options -- )`

SSAFE also redraws counts with SBO.

```text
: SSAFE 2400 2ROT A" SAFE " SPOST SBO ;
```

**Calls:** `ROT`, `SPOST`, `SBO`.

**Used by:** `DOSAFE`.

### <a name="terse-word-53-53-54-52-49-4b-45-31"></a>`SSTRIKE1`

`( x y options -- )`

Draw the STRIKE 1 message.

```text
: SSTRIKE1 2000 2ROT A" STRIKE 1" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSSTRIKE`.

### <a name="terse-word-53-53-54-52-49-4b-45-32"></a>`SSTRIKE2`

`( x y options -- )`

Draw the STRIKE 2 message.

```text
: SSTRIKE2 2100 2ROT A" STRIKE 2" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSSTRIKE`.

### <a name="terse-word-53-54-46-4c-44"></a>`STFLD`

`( -- )`

STFLD installs RETPA and TAKEFIELD.

```text
: STFLD RETPA TAKEFIELD BONE ;
```

**Calls:** `RETPA`, `BONE`.

**Used by:** `SETTF`.

### <a name="terse-word-53-54-50-2c"></a>`STP,`

`( -- )`

Emit a standing-action record.

```text
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

### <a name="terse-word-53-54-52-49-4b-45-54-49-4d-45"></a>`STRIKETIME`

`( -- )`

Strike process.

```text
: STRIKETIME ( strike process )
STRIKES DUP 1+B! B@ 33 = IF OUTTIME COUT OLDSTRING B!
ELSE MSTRIKE DOSSTRIKE THEN SBO ;
```

**Calls:** `DUP`, `B!`, `B@`, `OUTTIME`, `MSTRIKE`, `DOSSTRIKE`, `SBO`.

### <a name="terse-word-53-54-52-49-4e-47-47-4f"></a>`STRINGGO`

`( string erase-flag -- )`

Given string , stringerase.

```text
: STRINGGO ( given string , stringerase )
7A00 ( y ) 828 ( ex/mg ) 4 PICK 4 PICK
IF STETBL ELSE
STTBL 50 STRINGOFFTIMER B! THEN @ EX
DROP DROP ;
```

**Calls:** `B!`, `EX`, `DROP`.

**Used by:** `STRINGPRC`.

### <a name="terse-word-53-54-52-49-4e-47-50-52-43"></a>`STRINGPRC`

`( -- )`

String display.

```text
: STRINGPRC ( string display )
STRING B@ DUP STRING BZERO
STRINGOFFTIMER B@ IF OLDSTRING B@ 1 STRINGGO OLDSTRING B!
0 ( erase or write ) STRINGGO
ELSE OLDSTRING B! ( one string ) STRINGERASE B@ STRINGGO
THEN STRINGERASE BZERO ;
```

**Calls:** `B@`, `DUP`, `BZERO`, `STRINGGO`, `B!`.

### <a name="terse-word-53-54-52-54-42-41-4c-4c"></a>`STRTBALL`

`( -- )`

STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music.

```text
: STRTBALL DI INSTRC FL F00 SUP 3F00 SUP
PLYR1UP BONE SCORE1 ZERO INN# BZERO STRT1 BZERO GAMEOVER BZERO
CNSW1 B@ IF CREDARROW ELSE MLINN DI THEN SHILL BZERO
CMPLR B@ IF YOU1ST 50 DWAIT YOU1ST THEN
8C0 INNX ! 1STINN BONE TF 1STINN BZERO MOPENERS ;
```

**Calls:** `DI`, `INSTRC`, `FL`, `SUP`, `BONE`, `BZERO`, `B@`, `CREDARROW`, `MLINN`, `YOU1ST`, `DWAIT`, `TF`, `MOPENERS`.

**Used by:** `PLRCHK`.

### <a name="terse-word-53-55-50"></a>`SUP`

`( -- )`

SUP posts UP.

```text
: SUP 8C00 8828 A" UP" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `FL`, `STRTBALL`.

### <a name="terse-word-53-57-2d-33-30"></a>`SW-30`

`( random dx -- sector )`

Maps a −30° swing and horizontal direction into a baseball sector code.

```text
: SW-30 DUP IF 1 = IF ( x=1 ) IF F1STR ELSE HR THEN
ELSE ( x=-1 ) IF HR ELSE F2NDL THEN THEN
ELSE ( x= 0 ) DROP DUP IF 1- IF F2NDL ELSE F2NDR THEN
ELSE DROP HR THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### <a name="terse-word-53-57-2d-34-35"></a>`SW-45`

`( random dx -- sector )`

Maps a −45° swing and horizontal direction into a baseball sector code.

```text
: SW-45 DUP IF 1 = IF ( x=1 ) DROP FBR
ELSE ( x = -1 ) IF HRL ELSE F1STL THEN THEN
ELSE ( X=0 ) DROP DUP IF 1- IF F1STL ELSE F1STR THEN
ELSE DROP HRL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### <a name="terse-word-53-57-2d-39-30"></a>`SW-90`

`( a b -- )`

SW-90 ignores direction/random inputs and returns the far-right foul sector.

```text
: SW-90 DROP DROP FBR ;
```

**Calls:** `DROP`.

### <a name="terse-word-53-57-2b-33-30"></a>`SW+30`

`( random dx -- sector )`

Maps a +30° swing and horizontal direction into a baseball sector code.

```text
: SW+30 DUP IF 1 = IF ( x=1 ) IF HL ELSE FSSR THEN
ELSE ( x= -1 ) IF F3RDL ELSE HL THEN THEN
ELSE ( x=0 ) DROP DUP IF 1- IF FSSR ELSE FSSL THEN
ELSE DROP HL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### <a name="terse-word-53-57-2b-34-35"></a>`SW+45`

`( random dx -- sector )`

Maps a +45° swing and horizontal direction into a baseball sector code.

```text
: SW+45 DUP IF 1 = IF ( x=1 ) IF HLL ELSE F3RDR THEN
ELSE ( x= -1 ) DROP FBL THEN
ELSE ( x=0 ) DROP DUP IF 1- IF F3RDR ELSE F3RDL THEN
ELSE DROP HLL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### <a name="terse-word-53-57-2b-39-30"></a>`SW+90`

`( a b -- )`

SW+90 always returns foul-left after dropping its inputs.

```text
: SW+90 DROP DROP FBL ;
```

**Calls:** `DROP`.

### <a name="terse-word-53-57-30"></a>`SW0`

`( random dx -- sector )`

Maps a central swing and horizontal direction into a baseball sector code.

```text
: SW0 DUP IF 1 = IF ( x=1 ) IF F2NDR ELSE HM THEN
ELSE ( x=-1 ) IF FSSL ELSE HM THEN THEN
ELSE ( x=0 ) DROP IF HM ELSE F2NDR THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### <a name="terse-word-53-57-41-4c-4b"></a>`SWALK`

`( x y options -- )`

Uses ROT and SPOST to compose game logic.

```text
: SWALK 2400 2ROT A" WALK" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `BALLTIME`.

### <a name="terse-word-54-43-4e-54"></a>`TCNT`

`( -- )`

TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits.

```text
: TCNT 700 1800 828 A" TO CONTINUE GAME AT END OF INNING" SPOST
CNSW12 B@ IF CREDITS B@ IF DP1 ELSE 0F00 2C00 828
A" DEPOSIT 1 COIN PER PLAYER" SPOST THEN ELSE DP1 THEN ;
```

**Calls:** `SPOST`, `B@`, `DP1`.

**Used by:** `TF`.

### <a name="terse-word-54-45-52-53-45-43-48-4b"></a>`TERSECHK`

`( -- )`

Look at terse routine flags.

```text
: TERSECHK ( look at terse routine flags ) 0 RND DROP
TFTIME B@ IF TF THEN SELECT B@ IF PLRSELECT THEN
CHKPLRS B@ IF PLRCHK THEN UPCRED B@ IF CREDARROW THEN ;
```

**Calls:** `RND`, `DROP`, `B@`, `TF`, `PLRSELECT`, `PLRCHK`, `CREDARROW`.

**Used by:** `SENTRY`.

### <a name="terse-word-54-46"></a>`TF`

`( -- )`

Take the field.

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

**Calls:** `DI`, `ZERORAM`, `EI`, `DUP`, `B!`, `INP`, `AND`, `XOR`, `B@`, `ROT`, `BONE`, `SGO`, `DOGOVER`, `CONGR`, `TWAIT`, `MLINN`, `BZERO`, `SORRY`, `DOCHGS`, `DPCN`, `CHKGMCNT`, `DROP`, `TCNT`.

**Used by:** `PUP`, `STRTBALL`, `TERSECHK`.

### <a name="terse-word-54-48-57-2c"></a>`THW,`

`( -- )`

Emit the throw command.

```text
{ : THW, } 0B B, { ; }
```

### <a name="terse-word-54-57-41-49-54"></a>`TWAIT`

`( count -- )`

Terse wait period.

```text
: TWAIT ( terse wait period )
EI BEGIN FF 0 DO LOOP CREDITS B@ DUP IF 1 = IF CNSW12 B@ IF
ELSE DROP 1 THEN ELSE DROP 1 THEN ELSE DROP THEN
50 0 DO LOOP 1 - DUP 0= END
DROP DI ;
```

**Calls:** `EI`, `BEGIN`, `DO`, `LOOP`, `B@`, `DUP`, `DROP`, `END`, `DI`.

**Used by:** `CHKGMCNT`, `DOGOVER`, `DPCN`, `TF`.

### <a name="terse-word-56"></a>`V`

`( -- )`

Uses VARIABLE to compose game logic.

```text
{ : V } VARIABLE { ; }
```

**Calls:** `VARIABLE`.

**Used by:** `V=`.

### <a name="terse-word-56-3d"></a>`V=`

`( -- )`

Uses V and VARIABLE to compose game logic.

```text
{ : V= } 0 VARIABLE { ; }
```

**Calls:** `V`, `VARIABLE`.

### <a name="terse-word-56-49-42-53"></a>`VIBS`

`( value -- )`

Emit a vibrato setting.

```text
{ : VIBS } 14 B, B, { ; }
```

### <a name="terse-word-56-49-53"></a>`VIS`

`( -- )`

HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;

```text
: VIS 700 7A00 828 56 CPOST 900 7F00 8828 A" ISITOR" SPOST ;
```

**Calls:** `CPOST`, `SPOST`.

**Used by:** `FL`, `WUPWRT`.

### <a name="terse-word-57-48-42-4f-44-44-53"></a>`WHBODDS`

`( -- )`

Sets who is on base calculates play odds.

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

**Calls:** `B@`, `RUN1CHK1ST`, `B!`, `RND`, `SWAP`, `DUP`, `HRBY2`, `DROP`.

**Used by:** `BALLTIME`, `THROWBALL`.

### <a name="terse-word-57-54-48-57-2c"></a>`WTHW,`

`( -- )`

Emit the wait-for-throw command.

```text
{ : WTHW, } 0D B, { ; }
```

### <a name="terse-word-57-55-50-47-4f"></a>`WUPGO`

`( -- )`

WUPGO activates WHOSUP with runner/automatic-forward flags;

```text
: WUPGO WHOSUP @ DUP VSTATUS + 81 SB! VRSTAT + 3 SB! ;
```

**Calls:** `DUP`, `SB!`.

**Used by:** `BALLTIME`, `GRNDRHIT`, `OUTFLDHIT`.

### <a name="terse-word-57-55-50-54-4f-4e"></a>`WUPTON`

`( -- )`

WUPTON installs WUPWRT.

```text
: WUPTON ' WUPWRT FLSHTON ;
```

**Calls:** `WUPWRT`, `FLSHTON`.

**Used by:** `CHKFLSHSTAY`.

### <a name="terse-word-57-55-50-57-52-54"></a>`WUPWRT`

`( -- )`

Write whos up for flash.

```text
: WUPWRT ( write whos up for flash )
PTAUTOTM PLYR1UP B@ IF HOM ELSE VIS THEN ;
```

**Calls:** `PTAUTOTM`, `B@`, `HOM`, `VIS`.

**Used by:** `BUTTONCHK`, `CHKFLSHSTAY`, `WUPTON`.

### <a name="terse-word-59-4f-55-31-53-54"></a>`YOU1ST`

`( -- )`

YOU1ST posts the greeting/extra-inning challenge, then continues to 306.

```text
: YOU1ST 1A00 1000 828 A" YOU ARE UP 1ST" SPOST 0F00 3000 828
A" BEAT ME FOR EXTRA INNING" SPOST 1F00 5000 828
A" GOOD LUCK" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `STRTBALL`.

### <a name="terse-word-5a-45-52-4f-52-41-4d"></a>`ZERORAM`

`( -- )`

ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT.

```text
: ZERORAM DI 0 7C30 270 FILL 3 OFTFCNT B! DI ;
```

**Calls:** `DI`, `FILL`, `B!`.

**Used by:** `FL`, `TF`.

### <a name="terse-word-2b-4c-4f-4f-50"></a>`+LOOP`

`( increment -- )`

Increment consumed; IX loop frame updated or released

Uses LOOP to process game state.

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

**Calls:** `LOOP`.

### <a name="terse-word-41-4c-4c-46-4c-44-41-43-54"></a>`ALLFLDACT`

`( -- )`

RAM: infield/outfield active flags set; returns NEXT

Sets all fielders active.

```text
CODE ALLFLDACT ( sets all fielders active )
' INFLDACT CALL, ' OUTFLDACT CALL, NEXT
```

**Calls:** `INFLDACT`, `OUTFLDACT`.

**Used by:** `INLOG`.

### <a name="terse-word-41-4e-4d-53-45-51-4c-4f-41-44"></a>`ANMSEQLOAD`

`( -- )`

IX: vector; RAM: VANMSEQH/L set; returns RET

Finds proper anm seq by per=#.

```text
CODE ANMSEQLOAD ( finds proper anm seq by per=# )
( IX-proper vector add )
VANMH X H LDX, VANML X L LDX, VPERS# X A LDX,
' INDEXW CALL, ( anm seq look up )
D VANMSEQH X STX, E VANMSEQL X STX, RET,
```

**Calls:** `INDEXW`.

**Used by:** `PLAYACT`.

### <a name="terse-word-42-41-4c-4c-45-52-41-53-45"></a>`BALLERASE`

`( -- )`

BC, IY preserved; ball cleared; returns NEXT

BALLERASE preserves BC/IY around native BLERASE and returns to TERSE.

```text
CODE BALLERASE B PUSH, Y PUSHX, BLERASE CALL,
Y POPX, B POP, NEXT
```

**Calls:** `BLERASE`.

**Used by:** `DOHOMER`, `OUTTIME`.

### <a name="terse-word-42-41-54-48-49-54"></a>`BATHIT`

`( -- )`

Updates hit, pitch and swing state; returns to native caller with 'RET'

He hit it time to get em running.

```text
CODE BATHIT ( he hit it time to get em running )
HITYET STA, DI, DOVERB INLOG
A XRA, HITTIME STA, PITCHTIME STA, ( tractor ball utfld)
SWINGGO STA, EI, RET,
```

**Calls:** `INLOG`.

**Used by:** `SENTRY`.

### <a name="terse-word-42-41-54-48-49-54-43-48-4b"></a>`BATHITCHK`

`( -- )`

HL = swing-state pointer; tests bat/ball overlap through table-selected hit window; returns to native caller

Check window for hit.

```text
CODE BATHITCHK ( check window for hit )
M A MOV, ( swing # ) A SLAR, BWTBL H LXI, ' INDEXW CALL,
VYH BL LDA, E SUB, D CMP, RNC, H INX, H INX, H PUSH,
VX BL LHLD, ' MULTHLBY4 CALL, H A MOV, H POP, M SUB, H INX,
M CMP, RNC, HITYET LDA, A ANA, RNZ, A INR,
HITTIME STA, HITGOING STA, BLERASE CALL, RET,
```

**Calls:** `INDEXW`, `MULTHLBY4`, `BLERASE`.

**Used by:** `BATSWING`.

### <a name="terse-word-42-41-54-53-57-49-4e-47"></a>`BATSWING`

`( -- )`

Reads swing counters from RAM, calls 'BATWRITE'/'BATHITCHK', updates swing/strike state

Swings bat if appropriate.

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

**Calls:** `BATWRITE`, `BATHITCHK`.

### <a name="terse-word-42-41-54-57-52-49-54-45"></a>`BATWRITE`

`( -- )`

HL = swing-state pointer; derives drawing parameters and calls native pattern writer; restores HL

Xor bat from swingtype.

```text
CODE BATWRITE ( xor bat from swingtype )
H PUSH, M A MOV, BSWINGTABLE H LXI, ' INDEXW CALL,
D PUSH, ( pattern add. ) Y POPX, 2600 D LXI, AF00 H LXI,
828 B LXI, ( exp/mag )
reloff CALL, relabs CALL, writep CALL,
H POP, RET,
```

**Calls:** `INDEXW`, `reloff`, `relabs`, `writep`.

**Used by:** `BATSWING`.

### <a name="terse-word-42-43-44-2b"></a>`BCD+`

`( a b -- bcd-sum )`

HL contains BCD sum, pushed onto parameter stack

Binary to decimal arithmatic.

```text
CODE BCD+ ( binary to decimal arithmatic )
( in- integer 1 , integer 2 )
( out- bcd sum of integer 1 and 2 )
H POP, D POP, E A MOV, L ADD, DAA, A L MOV,
D A MOV, H ADC, DAA, A H MOV, H PUSH, NEXT
```

### <a name="terse-word-42-4c-44-53-54"></a>`BLDST`

`( -- )`

Ball-vector update helper: computes motion/destination, handles catch/throw transitions

Ball thrown or hit.

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

**Calls:** `DSTLD`, `DSTCALC`, `CMPOF`, `KILLOF`.

### <a name="terse-word-42-4c-4d-4f-54-49-4f-4e"></a>`BLMOTION`

`( -- )`

Sets 'VECTPC' to 'TBLPA' via HL; native 'RET'

Set pc for ram pa table -tractor ball.

```text
CODE BLMOTION ( set pc for ram pa table -tractor ball )
TBLPA H LXI, VECTPC SHLD, RET,
```

### <a name="terse-word-42-4c-50-4f-53-43-48-4b"></a>`BLPOSCHK`

`( -- )`

IX = ball vector; checks ball/pitch position, collision flags and destination vector

BLPOSCHK branches on HITYET.

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

**Calls:** `OFBLCHK`, `LVRSTAT`.

### <a name="terse-word-42-4d-55-53-49-43"></a>`BMUSIC`

`( music-address -- )`

HL receives music address; note state conditionally initialized

BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

```text
CODE BMUSIC PRIORITY LDA, H POP, A ORA, 0=, IF, loadpc CALL,
NOTETIMER STA, A INR, MULTIPLE STA, THEN, NEXT
```

**Calls:** `loadpc`.

**Used by:** `MBALL`, `MCANNON`, `MCOIN`, `MFENCE`, `MFOUL`, `MHIT`, `MOUT`, `MSAFE`, `MSTRIKE`, `MYAH`.

### <a name="terse-word-42-55-54-54-4f-4e-43-48-4b"></a>`BUTTONCHK`

`( -- )`

Samples controls and updates pitch/run flags; saves/restores IX/IY on native calls

Reads buttons for swing run & pitch it.

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

**Calls:** `OFBLCHK`, `WUPWRT`.

**Used by:** `SENTRY`.

### <a name="terse-word-43-48-4b-43-41-55-47-48-54"></a>`CHKCAUGHT`

`( -- )`

Interrupt-side caught-ball handler; saves native vector registers and changes runner/score flags

Caught set in interrupt.

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

**Calls:** `LVRSTAT`.

**Used by:** `SENTRY`.

### <a name="terse-word-43-48-4b-47-52-4f-55-4e-44-45-52"></a>`CHKGROUNDER`

`( -- )`

IX = ball vector; adjusts velocity using grounder lookup; preserves HL across table lookup

If grounder adjust ball direction.

```text
CODE CHKGROUNDER ( if grounder adjust ball direction )
GRNDR LDA, A ANA, RZ,
GRNDRVALUE LDA, A INR, 0D CPI, >=, IF, A XRA, THEN,
GRNDRVALUE STA, H PUSH, GVTBL H LXI, ' INDEXW CALL,
VXH X A LDX, 0A0 CPI, ' COMPDE CC, H POP, D DAD, RET,
```

**Calls:** `INDEXW`, `COMPDE`.

**Used by:** `VECTOR`.

### <a name="terse-word-43-48-4b-53-43-52-54-49-4d-45"></a>`CHKSCRTIME`

`( -- )`

Scores play events from RAM, updates runner/base and score state; temporary IX stack saves balance on return

Score process.

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

**Used by:** `SENTRY`.

### <a name="terse-word-43-4c-52-42-4c-53-54"></a>`CLRBLST`

`( -- )`

Stores ASCII zero ($30) into ball and strike counters; 'NEXT'

CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.

```text
CODE CLRBLST 30 A MVI, BALLS STA, STRIKES STA, NEXT
```

**Used by:** `BALLTIME`, `DOHOMER`, `OUTTIME`.

### <a name="terse-word-63-6e-6c-69-6e-65"></a>`cnline`

`( -- )`

Saves BC, IX and IY around 'VECTOR'; restores registers before 'NEXT'

Calls vector line write.

```text
CODE cnline ( calls vector line write )
B PUSH, Y PUSHX, X PUSHX, 0ED B, 57 B, PSW PUSH, DI,
VECTOR CALL, PSW POP, X POPX, Y POPX, B POP,
PE, IF, EI, THEN, NEXT
```

**Calls:** `VECTOR`.

**Used by:** `CNLINE`, `DLINE`.

### <a name="terse-word-43-4f-4d-50-44-45"></a>`COMPDE`

`( -- )`

DE ← −DE; HL preserved

COMPDE applies the same operation to DE while preserving HL.

```text
CODE COMPDE H PUSH, XCHG, ' COMPHL CALL, XCHG, H POP, RET,
```

**Calls:** `COMPHL`.

**Used by:** `CHKGROUNDER`.

### <a name="terse-word-43-4f-4d-50-48-4c"></a>`COMPHL`

`( -- )`

HL ← −HL

Compliments HL.

```text
CODE COMPHL ( compliments HL )
H A MOV, CMA, A H MOV, L A MOV, CMA, A L MOV, H INX, RET,
```

**Used by:** `COMPDE`, `DIVHLBY4`, `DSTCALC`, `MULTHLBY4`, `OFBLCHK`, `TBLVEL`.

### <a name="terse-word-43-4f-55-4e-54"></a>`COUNT`

`( address -- address+1 character )`

Character returned with high-bit terminator stripped; address advanced by one

Read the next character of a counted/high-bit-terminated string.

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

**Used by:** `PPOST`.

### <a name="terse-word-63-70-6f-73-74"></a>`cpost`

`( x y options char -- x' y options )`

Consumes drawing position, options and character; returns updated x and retained state

Post an ascii-character on the screen ; see opt.

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

**Calls:** `FONTUNPACK`, `relabs`.

**Used by:** `CPOST`, `PPOST`, `dpost`.

### <a name="terse-word-44-45-41-43-54-49-56-41-54-45"></a>`DEACTIVATE`

`( -- )`

IX addresses vector; resets active status bit, writes 'SAMEDLT', returns

Reset active bit in status.

```text
CODE DEACTIVATE ( reset active bit in status )
VACT VSTATUS X RESX, 1 A MVI, SAMEDLT STA, RET,
```

### <a name="terse-word-44-49"></a>`DI`

`( -- )`

Maskable interrupts disabled; parameter stack unchanged

Disable maskable Z80 interrupts.

```z80
_DI:
            di                          ; Disable hardware interrupts
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `CREDARROW`, `DOGOVER`, `DWAIT`, `FLFILL`, `INSWAIT`, `MLINN`, `PLRCHK`, `PLRSELECT`, `PUP`, `SETTF`, `STRTBALL`, `TF`, `TWAIT`, `ZERORAM`.

### <a name="terse-word-44-49-56-48-4c-42-59-34"></a>`DIVHLBY4`

`( -- )`

HL ← signed(HL / 4)

Divide HL by 4.

```text
CODE DIVHLBY4 ( divide HL by 4 )
7 H BIT, PSW PUSH, ( dir )
' COMPHL CNZ, ( abs dy )
H SRLR, L RARR, H SRLR, L RARR, ( /4 )
PSW POP, ' COMPHL CNZ, RET,
```

**Calls:** `COMPHL`.

**Used by:** `VECTOR`.

### <a name="terse-word-44-4f"></a>`DO`

`( limit start -- )`

Two parameter-stack cells consumed; IX return stack holds start, limit and loop IP

Enter a counted loop using a three-cell return-stack frame.

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

**Used by:** `DWAIT`, `FIELDWRT`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTTIME`, `PPOST`, `RETPA`, `TWAIT`.

### <a name="terse-word-44-53-54-43-41-4c-43"></a>`DSTCALC`

`( -- )`

HL ← dy; DE ← dx; BC ← action selector

Calc deltas to destination.

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

**Calls:** `COMPHL`.

**Used by:** `BLDST`, `CMPOF`, `FLDDST`, `OFFFDST`.

### <a name="terse-word-44-53-54-4c-44"></a>`DSTLD`

`( -- )`

IX input vector; HL ← destination X; DE ← destination Y

DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.

```text
CODE DSTLD
VDSTXH X H LDX, VDSTXL X L LDX, VDSTYH X D LDX,
VDSTYL X E LDX,
RET,
```

**Used by:** `BLDST`, `FLDDST`.

### <a name="terse-word-45-49"></a>`EI`

`( -- )`

Maskable interrupts enabled; parameter stack unchanged

Enable maskable Z80 interrupts.

```z80
_EI:
            ei                          ; Enable hardware interrupts
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Calls:** `SWAN`.

**Used by:** `CREDARROW`, `DWAIT`, `FL`, `FLFILL`, `INSWAIT`, `MLINN`, `PLRCHK`, `PUP`, `SETTF`, `TF`, `TWAIT`.

### <a name="terse-word-45-49-44-49"></a>`EIDI`

`( -- )`

Emits 'EI' then 'DI', returns through 'NEXT'

EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers.

```text
CODE EIDI EI, DI, NEXT
```

**Used by:** `DOGOVER`, `FL`.

### <a name="terse-word-45-4d-55-53-49-43"></a>`EMUSIC`

`( -- )`

Initializes music state and returns through 'NEXT'

EMUSIC selects ENDMUSIC and initializes timing/repetition to one;

```text
CODE EMUSIC 0 ENDMUSIC H LXI, loadpc CALL, 1 A MVI, NOTETIMER
STA, MULTIPLE STA, NEXT ( CALL EMUSIC AS AN INIT IN PROGRAM )
```

**Calls:** `loadpc`.

**Used by:** `PUP`.

### <a name="terse-word-45-58"></a>`EX`

`( -- )`

Emits 'RET' instruction and continues through 'NEXT'

EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.

```text
CODE EX C9 B, NEXT
```

**Used by:** `FLSHME`, `GRNDRACTION`, `GRNDRHIT`, `STRINGGO`.

### <a name="terse-word-46-49-4c-4c"></a>`FILL`

`( value address count -- )`

Bytes [address..address+count−1] filled with value; parameter stack consumed

Fill consecutive bytes with a specified value.

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

**Used by:** `FLFILL`, `SCRERASE`, `ZERORAM`.

### <a name="terse-word-46-4c-44-44-53-54"></a>`FLDDST`

`( -- )`

IX = fielder vector; computes velocity/destination and updates playaction state through native helpers

Fielders take position logic.

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

**Calls:** `DSTLD`, `DSTCALC`.

### <a name="terse-word-46-4c-53-48-4f-46-46"></a>`FLSHOFF`

`( -- )`

Preserves BC; clears flash state and calls 'FLSHWUP' before 'NEXT'

FLSHOFF disables flashing and services cleanup under DI.

```text
CODE FLSHOFF B PUSH, A XRA, FLSHON STA, DI, FLSHWUP CALL,
B POP, NEXT
```

**Calls:** `FLSHWUP`.

**Used by:** `CHKFLSHSTAY`, `DOCHGS`, `DOGOVER`, `OUTTIME`.

### <a name="terse-word-46-4d-49-52-52-4f-52"></a>`FMIRROR`

`( -- )`

Preserves BC while mirroring field graphics and returns through 'NEXT'

FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order.

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

**Calls:** `DECIMAL`.

**Used by:** `FL`.

### <a name="terse-word-48-49-54-52-55-4e"></a>`HITRUN`

`( -- )`

Selects runner activation and throw target via indexed native dispatch; restores BC before 'NEXT'

Activate proper runners and set trwbase.

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

**Calls:** `INDEXW`, `DECIMAL`.

**Used by:** `BALLTIME`, `GRNDRHIT`.

### <a name="terse-word-48-4f-4d-45-52-43-48-4b"></a>`HOMERCHK`

`( y x hit-type random-x random-y -- )`

Five TERSE inputs consumed; ball/homer state updated

Consumes two random offsets, hit type and ball coordinates from the TERSE parameter stack; sets fence/homer state and ball destination.

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

**Calls:** `INDEXW`.

**Used by:** `OUTFLDHIT`.

### <a name="terse-word-49"></a>`I`

`( -- index )`

Loop index copied from IX return-stack frame to parameter stack; IX frame intact

Fetch the innermost counted-loop index.

```z80
_Rat:
            ld      l,(ix+$00)          ; Read Return Stack top LSB
            ld      h,(ix+$01)          ; Read Return Stack top MSB
            push    hl                  ; Push copied word onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `NPOST`, `PPOST`.

### <a name="terse-word-49-45-58"></a>`IEX`

`( saved-interrupt-frame -- )`

Saved interrupt register frame restored, interrupt enabled

Restores two saved Z80 register banks, enables interrupts, then returns from the interrupt bridge; this is an interrupt-frame convention, not an ordinary TERSE data-word call.

```text
CODE IEX PSW POP, B POP, D POP, H POP, EXX, EXAF,
PSW POP, B POP, D POP, H POP, EI, RET,
```

**Used by:** `INEXT`.

### <a name="terse-word-49-4e-44-45-58-57"></a>`INDEXW`

`( -- )`

A,HL input table index/base; DE ← indexed word

Call routine A- disp HL- table add.

```text
CODE INDEXW ( call routine A- disp HL- table add )
( for indexing into table only )
PSW PUSH, A SLAR, ( 2* A )
L ADD, A L MOV, 0 A MVI, H ADC, A H MOV,
M E MOV, H INX, M D MOV, H DCX, PSW POP, RET,
```

**Used by:** `ANMSEQLOAD`, `BATHITCHK`, `BATWRITE`, `CHKGROUNDER`, `HITRUN`, `HOMERCHK`, `LOADANM`, `OPCODECHK`, `PATFETCH`, `TAKEOFF`, `THROWANIM`, `THROWBALL`.

### <a name="terse-word-49-4e-46-49-45-4c-44"></a>`INFIELD`

`( -- )`

Draws infield stripes/pitcher mound; preserves BC and IX around row-rendering helpers

Uses IFSPAN to process game state.

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

**Calls:** `IFSPAN`.

**Used by:** `FL`.

### <a name="terse-word-49-4e-46-4c-44-41-43-54"></a>`INFLDACT`

`( -- )`

Sets HL to first infield vector, A to five records, and calls 'SETACT'

Set infielders active.

```text
CODE INFLDACT ( set infielders active )
VSTATUS PT H LXI, 5 A MVI, ' SETACT CALL, RET,
```

**Calls:** `SETACT`.

**Used by:** `ALLFLDACT`.

### <a name="terse-word-49-53-54-41-52-54"></a>`ISTART`

`( interrupt-address -- )`

RAM[IPNT] ← interrupt handler address; mode IM2

ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.

```text
CODE ISTART DI, H POP, IPNT SHLD, 8 A MVI, INMOD OUT,
IPNT { SWAB } A MVI, STAI, IPNT A MVI,
INFBK OUT, IM2, EI, NEXT
```

**Used by:** `S10`, `S11`.

### <a name="terse-word-4b-49-4c-4c-4f-46"></a>`KILLOF`

`( -- )`

Clears outfield delta words and control flag; selects standing playaction

Stop outfield tractor ball control.

```text
CODE KILLOF ( stop outfield tractor ball control )
0 H LXI, OFDX SHLD, OFDY SHLD, STND H LXI, OFPA SHLD,
A XRA, OFTBLGO STA, RET,
```

**Used by:** `BLDST`.

### <a name="terse-word-4c-4f-41-44-41-4e-4d"></a>`LOADANM`

`( -- )`

HL ← next playaction cursor; IX vector updated

Loads magic & anm HL-top of playact table.

```text
CODE LOADANM ( loads magic & anm HL-top of playact table )
( IX-proper vector add )
M A MOV, A VMAGIC X STX, ( load magic )
H INX, M A MOV, H PUSH, PATTERNS H LXI, ' INDEXW CALL,
D VANMH X STX, E VANML X STX, ( load anm )
H POP, ( pc ) H INX, RET, ( returns updated pc in HL )
```

**Calls:** `INDEXW`.

**Used by:** `PACTLOAD`.

### <a name="terse-word-4c-4f-4f-50"></a>`LOOP`

`( -- )`

Parameter stack unchanged; IX loop index incremented, loop frame retained or released

Advance a counted loop and test its termination.

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

**Used by:** `+LOOP`, `DWAIT`, `FIELDWRT`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTTIME`, `PPOST`, `RETPA`, `TWAIT`.

### <a name="terse-word-4d-55-4c-54-48-4c-42-59-34"></a>`MULTHLBY4`

`( -- )`

HL ← signed(4×HL)

MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign.

```text
CODE MULTHLBY4
7 H BIT, PSW PUSH, ' COMPHL CNZ, L SLAR, H RALR,
L SLAR, H RALR, PSW POP, ' COMPHL CNZ, RET,
```

**Calls:** `COMPHL`.

**Used by:** `BATHITCHK`, `OFBLCHK`.

### <a name="terse-word-4d-55-53-43-50-55"></a>`MUSCPU`

`( -- )`

Music tick handler; updates note timer, decodes music commands and drives sound ports

Declare cross-screen dispatch labels and begin assembling MUSCPU.

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

**Calls:** `FETCH`, `INCPC`, `HLOAD`, `RND`, `PCJUMP`.

### <a name="terse-word-4e-44-55-50"></a>`NDUP`

`( x1 … xn n -- x1 … xn x1 … xn )`

Parameter stack retains original n cells and appends a copy; count removed

Duplicate the top n parameter-stack cells.

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

**Calls:** `ARRAY`.

**Used by:** `OUTLINE`.

### <a name="terse-word-4f-46-46-46-44-53-54"></a>`OFFFDST`

`( -- )`

IX = active fielder vector; selects off-field destination, computes movement deltas

All player off field control.

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

**Calls:** `DSTCALC`.

### <a name="terse-word-4f-46-4c-44-54-42-4c"></a>`OFLDTBL`

`( -- )`

Assigns outfielder playaction table, invokes 'OUTFLDACT', and returns

OFLDTBL gives all three outfielders OFTBLPA, activates them and returns;

```text
CODE OFLDTBL OFTBLPA H LXI, A XRA, OFTOTBL STA,
DI, VPLAYACTPC RF SHLD, VPLAYACTPC CF SHLD, VPLAYACTPC LF SHLD,
' OUTFLDACT CALL, EI, RET,
```

**Calls:** `OUTFLDACT`.

**Used by:** `SENTRY`.

### <a name="terse-word-4f-46-4d-4f-54-49-4f-4e"></a>`OFMOTION`

`( -- )`

Sets 'VECTPC' from 'OFPA', conditional on action opcode and IX status

Set pc for ram pa table -tractor ball.

```text
CODE OFMOTION ( set pc for ram pa table -tractor ball )
OFPA { 1+ } LDA, 4 CPI, ( stnd ? )
=, IF, VACT VSTATUS X RESX, THEN,
OFPA H LXI, VECTPC SHLD, RET,
```

### <a name="terse-word-4f-4e-31-53-54"></a>`ON1ST`

`( -- )`

RAM[FLDON1ST] ← IX

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON1ST X PUSHX, H POP, FLDON1ST SHLD, RET,
```

### <a name="terse-word-4f-4e-32-4e-44"></a>`ON2ND`

`( -- )`

RAM[FLDON2ND] ← IX

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON2ND X PUSHX, H POP, FLDON2ND SHLD, RET,
```

### <a name="terse-word-4f-4e-33-52-44"></a>`ON3RD`

`( -- )`

RAM[FLDON3RD] ← IX

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON3RD X PUSHX, H POP, FLDON3RD SHLD, RET,
```

### <a name="terse-word-4f-50-43-4f-44-45-43-48-4b"></a>`OPCODECHK`

`( -- )`

HL = playaction cursor; looks up opcode handler and executes with a native return trampoline

Called by plyactupdate.

```text
CODE OPCODECHK ( called by plyactupdate ) <ASSEMBLE
M A MOV, 28 CPI, <, A DCR, A DCR, ( check if opcode )
IF, H INX, VECTPC SHLD, ( save pc )
OPTBL H LXI, ' INDEXW CALL, ( which opcode )
OPRET H LXI, H PUSH, ( save ret add. ) XCHG, ( H-opcd )
PCHL, LABEL OPRET ( ex opcode return here )
VECTPC LHLD, THEN, RET, ASSEMBLE>
```

**Calls:** `INDEXW`.

**Used by:** `PACTLOAD`.

### <a name="terse-word-4f-55-54-46-4c-44-41-43-54"></a>`OUTFLDACT`

`( -- )`

Sets HL to first outfield vector, A to three records, and calls 'SETACT'

Sets outfielders active.

```text
CODE OUTFLDACT ( sets outfielders active )
VSTATUS LF H LXI, 3 A MVI, ' SETACT CALL, RET,
```

**Calls:** `SETACT`.

**Used by:** `ALLFLDACT`, `CMPOF`, `OFLDTBL`.

### <a name="terse-word-50-41-43-54-4c-4f-41-44"></a>`PACTLOAD`

`( -- )`

IX = target vector; reads playaction stream, dispatches opcodes, advances vector PC

Loads vect from plyact.

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

**Calls:** `OPCODECHK`, `LOADANM`.

**Used by:** `PLAYACT`.

### <a name="terse-word-50-41-54-46-45-54-43-48"></a>`PATFETCH`

`( -- )`

IX = vector; selects animation-frame pattern from sequence table and stores its address

Loads actual pattern IX-vector.

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

**Calls:** `INDEXW`.

**Used by:** `PLAYACT`.

### <a name="terse-word-50-45-52-53-50-45-43-54-49-56-45"></a>`PERSPECTIVE`

`( -- )`

IX = vector; derives perspective class from Y and updates redraw flag if class changed

Pattern size determined by y.

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

### <a name="terse-word-50-4c-41-59-41-43-54"></a>`PLAYACT`

`( -- )`

Reads 'VECTIX', preserves BC/IX, advances vector animation/update through helper routines

Called in intterupt does update prc.

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

**Calls:** `PACTLOAD`, `ANMSEQLOAD`, `PATFETCH`.

### <a name="terse-word-50-4d-55-53-49-43"></a>`PMUSIC`

`( music-address -- )`

HL consumes music address; RAM priority/timers updated

PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer.

```text
CODE PMUSIC H POP, loadpc CALL, 1 A MVI, MULTIPLE STA,
PRIORITY STA, NOTETIMER STA, NEXT
```

**Calls:** `loadpc`.

**Used by:** `MOPENERS`.

### <a name="terse-word-50-54-41-55-54-4f-54-4d"></a>`PTAUTOTM`

`( -- )`

Calls 'TIMEDCR' for pitch timeout and returns through 'NEXT'

Pitch auto timer.

```text
CODE PTAUTOTM ( pitch auto timer )
TIMEOUT H LXI, FLDCLR LDA, A ANA, TIMEDCR CZ, NEXT
```

**Calls:** `TIMEDCR`.

**Used by:** `WUPWRT`.

### <a name="terse-word-52-45-53-45-54-52-55-4e-4e-45-52-53"></a>`RESETRUNNERS`

`( -- )`

Reorders runner vector records by occupancy and resets final runner slot

Reset runners to order of on base.

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

**Used by:** `THROWBALL`.

### <a name="terse-word-52-4e-44"></a>`RND`

`( upper-bound -- random-value )`

Upper bound consumed and scaled random result pushed; random seed advanced

Produce a random value scaled to the supplied bound.

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

**Used by:** `GRNDRHIT`, `INLOG`, `MUSCPU`, `OUTFLDHIT`, `TERSECHK`, `WHBODDS`.

### <a name="terse-word-52-55-4e-44-53-54"></a>`RUNDST`

`( -- )`

IX = runner record; processes base occupancy, auto-forward and movement state

Runner base running control.

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

**Calls:** `LVRSTAT`.

### <a name="terse-word-53-45-4e-54-52-59"></a>`SENTRY`

`( -- )`

Native game scheduler; calls tick services, invokes 'TERSECHK', then loops

Game loop.

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

**Calls:** `BUTTONCHK`, `TBALLPITCH`, `OFLDTBL`, `THROWBALL`, `THROWANIM`, `BATHIT`, `CHKCAUGHT`, `CHKSCRTIME`, `STARTMUSIC`, `TERSECHK`.

**Used by:** `PUP`.

### <a name="terse-word-53-45-54-41-43-54"></a>`SETACT`

`( -- )`

HL,A input vector/count; VACT set across records

Sets avtive bit in status.

```text
CODE SETACT ( sets avtive bit in status )
( in HL-status 1st guy A- # of guys )
VLENGTH D LXI,
BEGIN, VACT M SET, D DAD, A DCR, 0=, END, RET,
```

**Used by:** `INFLDACT`, `OUTFLDACT`.

### <a name="terse-word-53-54-41-52-54-4d-55-53-49-43"></a>`STARTMUSIC`

`( -- )`

Selects event music from state flags and dispatches music requests

STARTMUSIC clears its request.

```text
CODE STARTMUSIC A XRA, STMUSIC STA,
CHEERME LDA, A ANA, 0<>, IF, DOVERB MYAH A XRA, CHEERME STA,
DOVERB S10 7 A MVI, 1 OUT, 2 OUT, 3 OUT, A XRA, 0 OUT, 4 OUT,
ELSE, HOMERUN LDA, A ANA, 0=, IF, DOVERB MFENCE
ELSE, DOVERB MCANNON DOVERB S11 THEN, THEN, RET,
```

**Calls:** `MYAH`, `S10`, `MFENCE`, `MCANNON`, `S11`.

**Used by:** `SENTRY`.

### <a name="terse-word-73-74-72-74-6c-69-6e-65"></a>`strtline`

`( x y -- )`

Pops X and Y to native registers, computes address/line setup; returns via 'NEXT'

Given X Y sets up start of line.

```text
CODE strtline ( given X Y sets up start of line )
H POP, ( y ) D POP, ( x ) E SLAR, D RALR, E SLAR, D RALR,
E SLAR, D RALR, E SLAR, D RALR, E SLAR, D RALR,
E SLAR, D RALR, ( adjust x for relabs ) B PUSH,
0 C MVI,
relabs CALL, 3 ANI, BIT-POS STA, 4000 D LXI, D DAD,
SADR SHLD, B POP, NEXT
```

**Calls:** `relabs`.

**Used by:** `DLINE`.

### <a name="terse-word-53-57-41-4e"></a>`SWAN`

`( value -- nibble-swapped-value )`

High byte unchanged; low byte rotated four bits; result replaces input

Exchange the high and low nibbles of the low byte.

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

**Used by:** `EI`, `NPOST`.

### <a name="terse-word-54-42-41-4c-4c-50-49-54-43-48"></a>`TBALLPITCH`

`( -- )`

Computes pitcher/trackball velocity updates and writes movement fields

Loads pitch velocities.

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

**Used by:** `SENTRY`.

### <a name="terse-word-54-48-52-4f-57-41-4e-49-4d"></a>`THROWANIM`

`( -- )`

Prepares ball/throw vector data; saves/restores IX and IY around native update

Sets up BLDST and player anim.

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

**Calls:** `CHKATBS`, `INDEXW`.

**Used by:** `SENTRY`.

### <a name="terse-word-54-48-52-4f-57-42-41-4c-4c"></a>`THROWBALL`

`( -- )`

Builds the pitch or throw state, updates ball vector and runner decisions

Finish scoring first.

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

**Calls:** `RESETRUNNERS`, `WHBODDS`, `INDEXW`.

**Used by:** `SENTRY`.

### <a name="terse-word-54-48-57-41-4e-4d-53-45-54"></a>`THWANMSET`

`( -- )`

Reads thrower vector from IX and stores 'WHOTHROWS'; initializes animation flags

Set up throw animation.

```text
CODE THWANMSET ( set up throw animation )
X PUSHX, H POP, WHOTHROWS SHLD, ( save who throws )
BLERASE CALL, 1 A MVI, INAIR STA,
THROWANM STA, RET, ( set for sentry call )
```

**Calls:** `BLERASE`.

**Used by:** `WAITTHRW`.

### <a name="terse-word-54-49-4d-45-52"></a>`TIMER`

`( -- )`

Scans game timers with 'TIMEDCR' and invokes native event handlers

Interrupt timer routine.

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

**Calls:** `TIMEDCR`, `CMPOF`, `FLSHWUP`, `TAKEOFF`, `WALKOVER`, `TOOFCK`.

### <a name="terse-word-56-45-43-54-4f-52"></a>`VECTOR`

`( -- )`

IX = vector record; advances positions and applies hardware limits

Vectors and limit checks.

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

**Calls:** `DIVHLBY4`, `CHKGROUNDER`.

**Used by:** `cnline`.

### <a name="terse-word-56-45-52-41-53-45"></a>`VERASE`

`( -- )`

IX = vector record; derives previous pattern/screen address and calls native 'writep'

Does pattern board erase from vector IX.

```text
CODE VERASE ( does pattern board erase from vector IX )
VXPAND X B LDX, VMAGIC X C LDX, VPATH X H LDX, VPATL X L LDX,
H INX, H INX, ( abs ) H PUSH, Y POPX,
VSCRADRH X H LDX, VSCRADRL X L LDX,
writep CALL, RET,
```

**Calls:** `writep`.

**Used by:** `BLERASE`.

### <a name="terse-word-56-57-52-49-54-45"></a>`VWRITE`

`( -- )`

IX = vector record; derives pattern position, calls 'reloff'/'relabs'/'writep', saves erase address

Does reloff relabs patbrd from vector IX.

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

**Calls:** `reloff`, `relabs`, `writep`.

### <a name="terse-word-57-41-49-54"></a>`WAIT`

`( -- )`

A = native delay count; preserves value over inner wait loop and returns

Given A wait period stop every thing.

```text
CODE WAIT ( given A wait period stop every thing )
BEGIN, PSW PUSH, 0FF A MVI, BEGIN, A DCR, 0=, END,
PSW POP, A DCR, 0=, END, RET,
```

### <a name="terse-word-57-41-49-54-54-48-52-57"></a>`WAITTHRW`

`( -- )`

Configures throw animation and wait state; A used for flags, native 'RET'

Sets flag for 1stbaseman to wait throw.

```text
CODE WAITTHRW ( sets flag for 1stbaseman to wait throw )
' THWANMSET CALL, BASESTATUS LDA, 5 CPI, RZ, A XRA,
THROWANM STA, 20 A MVI, WAITTHROW STA, RET,
```

**Calls:** `THWANMSET`.

### <a name="terse-word-57-52-49-54-45"></a>`WRITE`

`( x y pattern dimensions options -- )`

Stack consumes x,y,pattern,dimensions,options; framebuffer updated

Write with X Y sizes ; pattern with no header.

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

**Calls:** `relabs`, `write`.

**Used by:** `MLINN`.

### <a name="terse-word-57-52-49-54-52"></a>`WRITR`

`( x y relative-pattern options -- )`

Stack consumes x,y,relative-pattern,options; framebuffer updated

Write with a relative pattern.

```text
CODE WRITR ( write with a relative pattern )
( in- x , y , relpatadr , ex/mag )
( WRTSYS set for pattern board res for software write )
( out- pattern on screen )
Y PUSHX, H POP, EXX, B POP, Y POPX, H POP, D POP,
reloff CALL, relabs CALL,
writep CALL, EXX, H PUSH, Y POPX, NEXT
```

**Calls:** `reloff`, `relabs`, `writep`.

**Used by:** `FL`, `INSCN`.

### <a name="terse-word-41-55-54-4f-52-31"></a>`AUTOR1`

`( -- )`

Writes automatic-run and active flags into runner 1 status fields

AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

```text
SUBR AUTOR1 3 A MVI, VRSTAT R1 STA, 81 A MVI, VSTATUS R1 STA,
RET, ( sets vauto , vforw , vact , vrun )
```

**Used by:** `FRO1`, `FRO12`, `FRO123`, `RO1`, `RO12`, `RO123`, `RO13`, `RO2`, `RO23`, `RO3`.

### <a name="terse-word-41-55-54-4f-52-32"></a>`AUTOR2`

`( -- )`

Writes automatic-run and active flags into runner 2 status fields

Run second-runner automation logic.

```text
SUBR AUTOR2 3 A MVI, VRSTAT R2 STA, 81 A MVI, VSTATUS R2 STA,
RET,
```

**Used by:** `FRO12`, `FRO123`, `FRO13`, `RO12`, `RO123`, `RO13`, `RO23`.

### <a name="terse-word-41-55-54-4f-52-33"></a>`AUTOR3`

`( -- )`

Writes automatic-run and active flags into runner 3 status fields

Run third-runner automation logic.

```text
SUBR AUTOR3 3 A MVI, VRSTAT R3 STA, 81 A MVI, VSTATUS R3 STA,
RET,
```

**Used by:** `FRO123`, `RO123`.

### <a name="terse-word-42-4c-45-52-41-53-45"></a>`BLERASE`

`( -- )`

Saves/restores IX; addresses ball vector, erases image, clears active bit

Erases ball.

```text
SUBR BLERASE ( erases ball )
X PUSHX, VMAGIC BL X LXIX, ' VERASE CALL, VACT VSTATUS X RESX,
X POPX, ( stop ball ) NOBOD H LXI, VPAT BL SHLD, RET,
```

**Calls:** `VERASE`.

**Used by:** `BALLERASE`, `BATHITCHK`, `THWANMSET`.

### <a name="terse-word-43-48-4b-41-54-42-53"></a>`CHKATBS`

`( -- )`

A = vector status flags, E = accumulator; increments E if active and not at base

Check if active player at base in- A vstatus.

```text
SUBR CHKATBS ( check if active player at base in- A vstatus )
VACT A BIT, RZ, VATBS A BIT, RNZ, E INR, RET,
```

**Used by:** `THROWANIM`.

### <a name="terse-word-43-48-4b-43-4f-49-4e-31"></a>`CHKCOIN1`

`( -- )`

Reads coin-door 1 via 'debounce'; updates credits and signals coin event

Chk door 1 for coin drop.

```text
SUBR CHKCOIN1 ( chk door 1 for coin drop )
CNTM1 LDA, A ANA, 0=, IF, ( waiting for coin )
1 A MVI, 1020 D LXI, 11FE H LXI, debounce CALL,
A ANA, RZ, CNTM1 STA, 20 OUT, CREDITS H LXI, M INR,
UPCRED STA, A XRA, SPBON STA, DOVERB MCOIN RET,
```

**Calls:** `debounce`, `MCOIN`.

### <a name="terse-word-43-48-4b-43-4f-49-4e-32"></a>`CHKCOIN2`

`( -- )`

Reads coin-door 2 via 'debounce'; updates credits with door/DIP-specific increments

Chk door 2 for coin drop.

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

**Calls:** `debounce`, `MCOIN`.

### <a name="terse-word-43-4d-50-4f-46"></a>`CMPOF`

`( -- )`

Selects outfielder vector in IX, computes deltas and activates outfield control

Calculates proper deltas and patterns.

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

**Calls:** `DSTCALC`, `OUTFLDACT`.

**Used by:** `BLDST`, `TIMER`, `TOOFCK`.

### <a name="terse-word-43-4f-4c-4f-52-42-41-4e-44"></a>`COLORBAND`

`( saved-interrupt-frame -- )`

Interrupt state restored, palette ports written

COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled.

```text
SUBR COLORBAND NEXT XTHL, PSW PUSH, M A MOV, INLIN OUT,
H INX, IPNT SHLD, FLSHSTAY LDA, A ANA, 0=, IF,
6C A MVI, 3 OUT, 7 A MVI, 1 OUT, THEN,
PSW POP, H POP, EI, RET, ( palette only: preserve AF/HL )
```

### <a name="terse-word-64-65-62-6f-75-6e-63-65"></a>`debounce`

`( -- )`

A = input port, HL = bit mask, DE = sampling duration; returns A = accepted pulse/zero

Debounce input transitions.

```text
SUBR debounce <ASSEMBLE
B PUSH, H C MOV, E B MOV, A H MOV, LABEL READPORT
A INP, L XRA, H ANA, 0=, IF, E DCR, 0=, IF, ( good ) A INR,
B POP, RET, THEN, READPORT JMP,
THEN, D DCR, 0=, IF, A XRA, B POP, RET, THEN,
B E MOV, ( try again ) READPORT JMP, ASSEMBLE>
( BB coin routine    CHKCOIN1 )
```

**Used by:** `CHKCOIN1`, `CHKCOIN2`.

### <a name="terse-word-46-45-54-43-48"></a>`FETCH`

`( -- )`

HL ← MUSICPC; A ← byte at HL

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR FETCH MUSPC LHLD, M A MOV, RET,
```

**Used by:** `HLOAD`, `MUSCPU`.

### <a name="terse-word-46-4c-53-48-57-55-50"></a>`FLSHWUP`

`( -- )`

Saves/restores IX and IY while updating flash timer and callback

Handle flash callback.

```text
SUBR FLSHWUP ( handle flash callback )
X PUSHX, Y PUSHX,
FLSHCNT H LXI, FLSHON LDA, A ANA, M A MOV, 0<>, IF,
A ANA, 0=, IF, 1 M MVI, 28 A MVI, ELSE, 0 M MVI, 8 A MVI,
THEN, FLSHTIME STA, DOVERB FLSHME
ELSE, A ANA, 0<>, IF, 0 M MVI, DOVERB FLSHME THEN,
THEN, Y POPX, X POPX, RET,
```

**Calls:** `FLSHME`.

**Used by:** `FLSHOFF`, `TIMER`.

### <a name="terse-word-46-4e-42-42"></a>`FNBB`

`( -- )`

Native no-op helper; immediate 'RET'

Native game routine; source body below.

```text
SUBR FNBB RET,
```

### <a name="terse-word-46-4f-4e-54-55-4e-50-41-43-4b"></a>`FONTUNPACK`

`( -- )`

HL = packed font source; expands bytes into 'FONTWORK'; HL returns its address

FONTUNPACK reads two packed bytes and starts a five-row unpack loop.

```text
SUBR FONTUNPACK B PUSH, M E MOV, H INX, M D MOV,
0 FONTWORK H LXI, 5 B MVI, LABEL FNTLP E A MOV, 7 ANI,
RRC, RRC, RRC, A M MOV, H INX,
D SRLR, E RARR, D SRLR, E RARR, D SRLR, E RARR,
FNTLP DJNZ, B POP, 0 FONTWORK H LXI, RET,
```

**Used by:** `cpost`.

### <a name="terse-word-46-52-4f-31"></a>`FRO1`

`( -- )`

Calls 'AUTOR1'; native 'RET'

Uses AUTOR1 to process game state.

```text
SUBR FRO1 AUTOR1 CALL, RET,
```

**Calls:** `AUTOR1`.

### <a name="terse-word-46-52-4f-31-32"></a>`FRO12`

`( -- )`

Calls 'AUTOR1', 'AUTOR2'; native 'RET'

Uses AUTOR1 and AUTOR2 to process game state.

```text
SUBR FRO12 AUTOR1 CALL, AUTOR2 CALL, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`.

### <a name="terse-word-46-52-4f-31-32-33"></a>`FRO123`

`( -- )`

Calls 'AUTOR1', 'AUTOR2', 'AUTOR3'; native 'RET'

Uses AUTOR1 and AUTOR2 to process game state.

```text
SUBR FRO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `AUTOR3`.

### <a name="terse-word-46-52-4f-31-33"></a>`FRO13`

`( -- )`

Writes runner-1 status and calls 'AUTOR2'; native 'RET'

Uses AUTOR2 to process game state.

```text
SUBR FRO13 VSTATUS R1 STA, AUTOR2 CALL, RET,
```

**Calls:** `AUTOR2`.

### <a name="terse-word-46-52-4f-32"></a>`FRO2`

`( -- )`

Writes runner-1 status field; native 'RET'

Native game routine; source body below.

```text
SUBR FRO2 VSTATUS R1 STA, RET,
```

### <a name="terse-word-46-52-4f-32-33"></a>`FRO23`

`( -- )`

Writes runner-1 and runner-2 status; native 'RET'

Native game routine; source body below.

```text
SUBR FRO23 VSTATUS R1 STA, VSTATUS R2 STA, RET,
```

### <a name="terse-word-46-52-4f-33"></a>`FRO3`

`( -- )`

Writes runner-1 status field; native 'RET'

Native game routine; source body below.

```text
SUBR FRO3 VSTATUS R1 STA, RET,
```

### <a name="terse-word-48-4c-4f-41-44"></a>`HLOAD`

`( -- )`

HL ← zero-extended music byte

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR HLOAD FETCH CALL, INCPC CALL, 0 H MVI, A L MOV, RET,
```

**Calls:** `FETCH`, `INCPC`.

**Used by:** `MUSCPU`.

### <a name="terse-word-49-46-53-50-41-4e"></a>`IFSPAN`

`( -- )`

Uses incoming A and C for fielder span calculation; returns native register results

IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value.

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

**Used by:** `INFIELD`.

### <a name="terse-word-49-4e-43-50-43"></a>`INCPC`

`( -- )`

RAM[MUSPC] ← RAM[MUSPC]+1

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR INCPC MUSPC LHLD, H INX, MUSPC SHLD, RET,
```

**Used by:** `HLOAD`, `MUSCPU`.

### <a name="terse-word-6c-6f-61-64-70-63"></a>`loadpc`

`( -- )`

RAM[MUSPC], RAM[STARTPC] ← HL

loadpc installs MUSPC and STARTPC.

```text
SUBR loadpc MUSPC SHLD, STARTPC SHLD, RET,
```

**Used by:** `BMUSIC`, `EMUSIC`, `PMUSIC`.

### <a name="terse-word-4c-56-52-53-54-41-54"></a>`LVRSTAT`

`( -- )`

A = desired runner status byte; stores it across all four runner status fields

Load vstat for all runners in- A value.

```text
SUBR LVRSTAT ( load vstat for all runners in- A value )
VRSTAT R1 STA, VRSTAT R2 STA, VRSTAT R3 STA, VRSTAT R4 STA,
RET,
```

**Used by:** `BLPOSCHK`, `CHKCAUGHT`, `RUNDST`.

### <a name="terse-word-4e-42-42"></a>`NBB`

`( -- )`

Native no-op helper; immediate 'RET'

NBB is the empty-bases no-op.

```text
SUBR NBB RET,
```

### <a name="terse-word-4f-46-42-4c-43-48-4b"></a>`OFBLCHK`

`( -- )`

D = maximum catch distance; checks nearby ball/player vectors, returns native result in A

Chk for catch or close when cmsw.

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

**Calls:** `COMPHL`, `MULTHLBY4`.

**Used by:** `BLPOSCHK`, `BUTTONCHK`.

### <a name="terse-word-50-43-4a-55-4d-50"></a>`PCJUMP`

`( -- )`

RAM[MUSPC] ← 16-bit branch target

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR PCJUMP MUSPC LHLD, M E MOV, H INX, M D MOV,
MUSPC SDED, RET,
```

**Used by:** `MUSCPU`.

### <a name="terse-word-72-65-6c-61-62-73"></a>`relabs`

`( -- )`

BC ← expansion/shift; HL ← screen address

Relative X Y to magic address conversion.

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

**Used by:** `BATWRITE`, `VWRITE`, `WRITE`, `WRITR`, `cpost`, `strtline`.

### <a name="terse-word-72-65-6c-6f-66-66"></a>`reloff`

`( -- )`

DE ← x offset; HL ← y offset; IY ← absolute pattern

Compute relative offset of x , y of pattern.

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

**Used by:** `BATWRITE`, `VWRITE`, `WRITR`.

### <a name="terse-word-52-4f-31"></a>`RO1`

`( -- )`

Activates runner 1 and selects a native runner pointer in BC, conditional on double-play state

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO1 AUTOR1 CALL, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R2 B LXI, RET,
```

**Calls:** `AUTOR1`, `SETDBLPLAY`.

### <a name="terse-word-52-4f-31-32"></a>`RO12`

`( -- )`

Activates runners 1 and 2; selects the next runner pointer in BC

RO12 activates both forced runners, selecting a double-play or ordinary target;

```text
SUBR RO12 AUTOR1 CALL, AUTOR2 CALL,
VMAGIC R2 B LXI, DPHIT LDA, A ANA, SETDBLPLAY JNZ,
VMAGIC R3 B LXI, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `SETDBLPLAY`.

### <a name="terse-word-52-4f-31-32-33"></a>`RO123`

`( -- )`

Activates runners 1–3; selects runner pointer in BC, conditional on double play

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
SUBR RO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL,
VMAGIC R3 B LXI, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R1 B LXI, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `AUTOR3`, `SETDBLPLAY`.

### <a name="terse-word-52-4f-31-33"></a>`RO13`

`( -- )`

Activates runner 2, then chooses runner pointer and double-play path

RO13 handles first-and-third occupancy and may branch through SETDBLPLAY.

```text
SUBR RO13 AUTOR2 CALL, DPHIT LDA, A ANA,
VMAGIC R2 B LXI,
0<>, IF, AUTOR1 CALL, SETDBLPLAY JMP, THEN,
VMAGIC R3 B LXI, RET,
```

**Calls:** `AUTOR2`, `AUTOR1`, `SETDBLPLAY`.

### <a name="terse-word-52-4f-32"></a>`RO2`

`( -- )`

Activates runner 1 conditionally; returns BC = runner 2 vector

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO2 HLSIDE LDA, A ANA, 0=, IF,
AUTOR1 CALL, THEN, VMAGIC R2 B LXI, RET,
```

**Calls:** `AUTOR1`.

### <a name="terse-word-52-4f-32-33"></a>`RO23`

`( -- )`

Selects runner 3 in BC, conditionally activating runners 1 and 2

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
SUBR RO23 VMAGIC R3 B LXI, DPHIT LDA, A ANA,
0<>, IF, AUTOR1 CALL, HLSIDE LDA, A ANA, AUTOR2 CZ, THEN,
RET,
```

**Calls:** `AUTOR1`, `AUTOR2`.

### <a name="terse-word-52-4f-33"></a>`RO3`

`( -- )`

Selects runner 2 in BC, conditionally activates runner 1

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO3 VMAGIC R2 B LXI, DPHIT LDA, A ANA,
AUTOR1 CNZ, RET,
```

**Calls:** `AUTOR1`.

### <a name="terse-word-53-45-54-44-42-4c-50-4c-41-59"></a>`SETDBLPLAY`

`( -- )`

HL identifies runner on first; sets 'DBLPLAY' flag

Sets up double play HL-guy on 1st.

```text
SUBR SETDBLPLAY ( sets up double play HL-guy on 1st )
1 A MVI, DBLPLAY STA, RET,
```

**Used by:** `RO1`, `RO12`, `RO123`, `RO13`.

### <a name="terse-word-54-41-4b-45-4f-46-46"></a>`TAKEOFF`

`( -- )`

Dispatches runner-activation handler via BC/table and native return trampoline

Turn proper runners on.

```text
SUBR TAKEOFF ( turn proper runners on ) <ASSEMBLE
BASESTATUS LDA, WBSFTBL H LXI, ' INDEXW CALL, TORET H LXI,
81 A MVI, ( vact & vrun ) H PUSH, ( ret add.) XCHG, PCHL,
LABEL TORET RET, ASSEMBLE>
( BB hit run and throw for infield grounder )
```

**Calls:** `INDEXW`.

**Used by:** `TIMER`.

### <a name="terse-word-54-42-41-4c-4c-50-52-43"></a>`TBALLPRC`

`( -- )`

Samples trackball port and computes tractor-ball/outfielder velocity state

Pitch or control outfield.

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

**Calls:** `AND`, `TBLVEL`.

### <a name="terse-word-54-42-4c-56-45-4c"></a>`TBLVEL`

`( -- )`

HL addresses current velocity byte, D = maximum; returns signed velocity increment in HL

Tractorball vel HL-# add. D-max vel.

```text
SUBR TBLVEL ( tractorball vel HL-# add. D-max vel )
M A MOV, 0 H LXI, A ANA, RZ,
7 A BIT, PSW PUSH, 0<>, IF, NEG, THEN, ( abs. )
80 H LXI, 3 CPI, >=, IF, 1B0 H LXI, THEN,
PSW POP, ' COMPHL CNZ, RET,
```

**Calls:** `COMPHL`.

**Used by:** `TBALLPRC`.

### <a name="terse-word-54-49-4d-45-44-43-52"></a>`TIMEDCR`

`( -- )`

A ← 1 if timer reached zero, otherwise 0

HL-timer add if goes to zero return 1 else 0.

```text
SUBR TIMEDCR ( HL-timer add if goes to zero return 1 else 0 )
M A MOV, A ANA, RZ, ( allready zero returns false change )
A DCR, A M MOV, A ANA, 0=, IF, A INR, ( true change )
ELSE, A XRA, THEN, RET,
```

**Used by:** `PTAUTOTM`, `TIMER`.

### <a name="terse-word-54-4f-4f-46-43-4b"></a>`TOOFCK`

`( -- )`

Decrements outfielder timeout and invokes 'CMPOF' if still active

Time out outfield check.

```text
SUBR TOOFCK ( time out outfield check )
TOOF# H LXI, M DCR, 0<>, IF, FF A MVI, TOOF STA,
ELSE, CMPOF CALL, EI, 1 A MVI, TOOFF STA, THEN, RET,
```

**Calls:** `CMPOF`.

**Used by:** `TIMER`.

### <a name="terse-word-57-41-4c-4b-4f-56-45-52"></a>`WALKOVER`

`( -- )`

Sets 'CAUGHT' and 'THROWAROUND' flags to one

Walked runner at base.

```text
SUBR WALKOVER ( walked runner at base )
1 A MVI, CAUGHT STA, THROWAROUND STA, RET,
```

**Used by:** `TIMER`.

### <a name="terse-word-77-72-69-74-65"></a>`write`

`( -- )`

IY,BC,DE,HL input drawing state; frame buffer updated

Software write with x y size.

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

**Used by:** `WRITE`, `writep`.

### <a name="terse-word-77-72-69-74-65-70"></a>`writep`

`( IY=patadr BC=ex/mag+shf HL=scradr --- )`

Native register outcome requires further verification.

Software write with pattern size on pattern.

```text
SUBR writep ( software write with pattern size on pattern )
( IY=patadr BC=ex/mag+shf HL=scradr --- )
0 Y E LDX, ( X size ) Y INXX,
0 Y D LDX, ( Y size ) Y INXX, write JMP,
```

**Calls:** `write`.

**Used by:** `BATWRITE`, `VERASE`, `VWRITE`, `WRITR`.

### <a name="terse-word-42-41-53-45-21"></a>`BASE!`

`( base -- )`

Set the number base.

```text
{ : BASE! } BASE ! { ; }
```

### <a name="terse-word-42-41-53-45-40"></a>`BASE@`

`( -- base )`

Fetch the current number base.

```text
{ : BASE@ } BASE @ { ; }
```

## Source notes

The catalog reproduces source implementations where present, including native Z80 routines and TERSE colon definitions. Stack signatures are taken from documented or source-verifiable behavior; native words show their parameter-stack effects and the observed Z80 register/memory outcomes together; entries lacking full register preservation verification must be read as observed effects, not a complete clobber contract. Source callers are static references, not runtime execution counts.
