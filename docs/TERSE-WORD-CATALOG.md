# Extra Bases — TERSE Word Catalog

This catalog identifies TERSE words used or defined in Extra Bases, with their stack effects, functions, and implementations.

## TERSE runtime and inherited words (34)

| Word / stack | | Function |
| --- | ---: | --- |
| <strong>-</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;difference&nbsp;)</code> | <a href="#---shared" title="View implementation">📄</a> | Subtract the top value from the preceding value. |
| <strong>!</strong><br><code>(&nbsp;value&nbsp;address&nbsp;--&nbsp;)</code> | <a href="#--shared" title="View implementation">📄</a> | Store one 16-bit cell. |
| <strong>@</strong><br><code>(&nbsp;address&nbsp;--&nbsp;value&nbsp;)</code> | <a href="#--shared-1" title="View implementation">📄</a> | Fetch one 16-bit cell. |
| <strong>*</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;product&nbsp;)</code> | <a href="#--shared-2" title="View implementation">📄</a> | Multiply two stack values. |
| <strong>/</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;quotient&nbsp;)</code> | <a href="#--shared-3" title="View implementation">📄</a> | Divide the preceding stack value by the top value. |
| <strong>+</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;sum&nbsp;)</code> | <a href="#--shared-4" title="View implementation">📄</a> | Add two stack values. |
| <strong>&lt;</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code> | <a href="#--shared-5" title="View implementation">📄</a> | Compare whether the preceding value is less than the top value. |
| <strong>=</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code> | <a href="#--shared-6" title="View implementation">📄</a> | Compare two values for equality. |
| <strong>&gt;</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code> | <a href="#--shared-7" title="View implementation">📄</a> | Compare whether the preceding value is greater than the top value. |
| <strong>0=</strong><br><code>(&nbsp;n&nbsp;--&nbsp;flag&nbsp;)</code> | <a href="#0--shared" title="View implementation">📄</a> | Return a condition indicating zero. |
| <strong>2DUP</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;a&nbsp;b&nbsp;a&nbsp;b&nbsp;)</code> | <a href="#2dup--shared" title="View implementation">📄</a> | Duplicate the top two stack cells. |
| <strong>AND</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code> | <a href="#and--shared" title="View implementation">📄</a> | Bitwise AND of two values. |
| <strong>ARRAY</strong><br><code>(&nbsp;size&nbsp;--&nbsp;)</code> | <a href="#array--shared" title="View implementation">📄</a> | Allocate/name an indexed cell array from a the size. |
| <strong>B!</strong><br><code>(&nbsp;byte&nbsp;address&nbsp;--&nbsp;)</code> | <a href="#b--shared" title="View implementation">📄</a> | Store one byte. |
| <strong>B@</strong><br><code>(&nbsp;address&nbsp;--&nbsp;byte&nbsp;)</code> | <a href="#b--shared-1" title="View implementation">📄</a> | Fetch one byte. |
| <strong>BARRAY</strong><br><code>(&nbsp;size&nbsp;--&nbsp;)</code> | <a href="#barray--shared" title="View implementation">📄</a> | Allocate/name an indexed byte array from a the size. |
| <strong>BEGIN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#begin--shared" title="View implementation">📄</a> | Immediate XC wrapper that records a loop's object address. |
| <strong>CODE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#code--shared" title="View implementation">📄</a> | Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry. |
| <strong>CONSTANT</strong><br><code>(&nbsp;value&nbsp;--&nbsp;)</code> | <a href="#constant--shared" title="View implementation">📄</a> | Define a constant from a value. |
| <strong>DECIMAL</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#decimal--shared" title="View implementation">📄</a> | Select radix ten for parsing subsequent source numbers. |
| <strong>DROP</strong><br><code>(&nbsp;x&nbsp;--&nbsp;)</code> | <a href="#drop--shared" title="View implementation">📄</a> | Discard the top stack cell. |
| <strong>DUP</strong><br><code>(&nbsp;x&nbsp;--&nbsp;x&nbsp;x&nbsp;)</code> | <a href="#dup--shared" title="View implementation">📄</a> | Duplicate the top stack cell. |
| <strong>ELSE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#else--shared" title="View implementation">📄</a> | Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch. |
| <strong>END</strong><br><code>(&nbsp;flag&nbsp;--&nbsp;)</code> | <a href="#end--shared" title="View implementation">📄</a> | Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true. |
| <strong>HEX</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hex--shared" title="View implementation">📄</a> | Select radix sixteen for parsing subsequent source numbers. |
| <strong>IF</strong><br><code>(&nbsp;flag&nbsp;--&nbsp;)</code> | <a href="#if--shared" title="View implementation">📄</a> | Immediate XC wrapper that emits a conditional target branch through XC-IF. |
| <strong>LIT</strong><br><code>(&nbsp;--&nbsp;value;&nbsp;inline&nbsp;cell&nbsp;)</code> | <a href="#lit--shared" title="View implementation">📄</a> | Compiler literal mechanism used by INEXT's host macro. |
| <strong>OR</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code> | <a href="#or--shared" title="View implementation">📄</a> | Bitwise inclusive OR of two values. |
| <strong>OVER</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;a&nbsp;b&nbsp;a&nbsp;)</code> | <a href="#over--shared" title="View implementation">📄</a> | Copy the second stack cell to the top. |
| <strong>ROT</strong><br><code>(&nbsp;a&nbsp;b&nbsp;c&nbsp;--&nbsp;b&nbsp;c&nbsp;a&nbsp;)</code> | <a href="#rot--shared" title="View implementation">📄</a> | Rotate the top three stack cells. |
| <strong>SWAP</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;b&nbsp;a&nbsp;)</code> | <a href="#swap--shared" title="View implementation">📄</a> | Exchange the top two stack cells. |
| <strong>THEN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#then--shared" title="View implementation">📄</a> | Immediate XC wrapper that resolves a saved target branch destination. |
| <strong>VARIABLE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#variable--shared" title="View implementation">📄</a> | Allocate/name a cell variable with the initial value in this dialect. |
| <strong>XOR</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code> | <a href="#xor--shared" title="View implementation">📄</a> | Bitwise exclusive OR of two values. |

## Extra Bases colon definitions (201)

| Word / stack | | Function |
| --- | ---: | --- |
| <strong>]'[</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#--terse" title="View implementation">📄</a> | Source-level compiler/TERSE definition shown below. |
| <strong>^</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#--terse-1" title="View implementation">📄</a> | Uses ABVOLS and MCVOLS to compose game logic. |
| <strong>&lt;INTERRUPTS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#interrupts--terse" title="View implementation">📄</a> | Mark the start of interrupt data. |
| <strong>ABVOLS</strong><br><code>(&nbsp;volume&nbsp;--&nbsp;)</code> | <a href="#abvols--terse" title="View implementation">📄</a> | Emit the music volume command. |
| <strong>ACT,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#act--terse" title="View implementation">📄</a> | Emit a playaction record. |
| <strong>ANOTE</strong><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code> | <a href="#anote--terse" title="View implementation">📄</a> | Emit a channel A note followed by its duration. |
| <strong>ATONE</strong><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code> | <a href="#atone--terse" title="View implementation">📄</a> | Emit tone setting for channel A. |
| <strong>BACT,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#bact--terse" title="View implementation">📄</a> | Emit a ball-action record. |
| <strong>BALLTIME</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#balltime--terse" title="View implementation">📄</a> | Balls process. |
| <strong>BLDST,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#bldst--terse" title="View implementation">📄</a> | Emit the ball destination command. |
| <strong>BLMOT,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#blmot--terse" title="View implementation">📄</a> | Emit the ball motion command. |
| <strong>BNOTE</strong><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code> | <a href="#bnote--terse" title="View implementation">📄</a> | Emit a channel B note followed by its duration. |
| <strong>BONE</strong><br><code>(&nbsp;address&nbsp;--&nbsp;)</code> | <a href="#bone--terse" title="View implementation">📄</a> | Store byte value 1. |
| <strong>BTONE</strong><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code> | <a href="#btone--terse" title="View implementation">📄</a> | Emit tone setting for channel B. |
| <strong>BV</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#bv--terse" title="View implementation">📄</a> | Define a named byte variable. |
| <strong>BV=</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#bv--terse-1" title="View implementation">📄</a> | Uses BV to compose game logic. |
| <strong>BZERO</strong><br><code>(&nbsp;address&nbsp;--&nbsp;)</code> | <a href="#bzero--terse" title="View implementation">📄</a> | Store byte value 0. |
| <strong>C=</strong><br><code>(&nbsp;value&nbsp;--&nbsp;)</code> | <a href="#c--terse" title="View implementation">📄</a> | Uses CONSTANT to compose game logic. |
| <strong>CHGS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#chgs--terse" title="View implementation">📄</a> | CHGS posts CHANGE SIDES; |
| <strong>CHKFLSHSTAY</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#chkflshstay--terse" title="View implementation">📄</a> | When isccp turn off check for wupwrt. |
| <strong>CHKGMCNT</strong><br><code>(&nbsp;--&nbsp;credits&nbsp;)</code> | <a href="#chkgmcnt--terse" title="View implementation">📄</a> | CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte. |
| <strong>CMAJOR</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#cmajor--terse" title="View implementation">📄</a> | Initialize the C-major sound pattern. |
| <strong>CNLINE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#cnline--terse" title="View implementation">📄</a> | CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state. |
| <strong>CNOTE</strong><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code> | <a href="#cnote--terse" title="View implementation">📄</a> | Emit a channel C note followed by its duration. |
| <strong>CONGR</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#congr--terse" title="View implementation">📄</a> | Display the congratulatory prompt. |
| <strong>CPOST</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;char&nbsp;--&nbsp;)</code> | <a href="#cpost--terse" title="View implementation">📄</a> | Draw one character at the specified position. |
| <strong>CREDARROW</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#credarrow--terse" title="View implementation">📄</a> | Update last inning arrow. |
| <strong>CTONE</strong><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code> | <a href="#ctone--terse" title="View implementation">📄</a> | Emit tone setting for channel C. |
| <strong>DEACT,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#deact--terse" title="View implementation">📄</a> | Emit vector-deactivation command. |
| <strong>DLINE</strong><br><code>(&nbsp;x1&nbsp;y1&nbsp;x2&nbsp;y2&nbsp;--&nbsp;)</code> | <a href="#dline--terse" title="View implementation">📄</a> | Draw a line , given X Y start coor X Y ending coor. |
| <strong>DOCHGS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dochgs--terse" title="View implementation">📄</a> | DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; |
| <strong>DOEHOMER</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#doehomer--terse" title="View implementation">📄</a> | DOEHOMER only posts the text. |
| <strong>DOGOVER</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dogover--terse" title="View implementation">📄</a> | Do game over. |
| <strong>DOHOMER</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dohomer--terse" title="View implementation">📄</a> | DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; |
| <strong>DOSAFE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dosafe--terse" title="View implementation">📄</a> | DOSAFE combines music/text. |
| <strong>DOSBALL</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#dosball--terse" title="View implementation">📄</a> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. |
| <strong>DOSOUT</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#dosout--terse" title="View implementation">📄</a> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. |
| <strong>DOSSTRIKE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#dosstrike--terse" title="View implementation">📄</a> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. |
| <strong>DP1</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dp1--terse" title="View implementation">📄</a> | Display the one-coin deposit prompt. |
| <strong>DP12CN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dp12cn--terse" title="View implementation">📄</a> | Uses B@ and SPOST to compose game logic. |
| <strong>DP1CN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dp1cn--terse" title="View implementation">📄</a> | Uses SPOST to compose game logic. |
| <strong>DPCN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dpcn--terse" title="View implementation">📄</a> | Wait for next coin. |
| <strong>dpost</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;nibble&nbsp;--&nbsp;x&nbsp;y&nbsp;options&nbsp;)</code> | <a href="#dpost--terse" title="View implementation">📄</a> | dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit. |
| <strong>DTC</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#dtc--terse" title="View implementation">📄</a> | DTC selects decimal and invokes the host editor. |
| <strong>DURATION</strong><br><code>(&nbsp;duration&nbsp;--&nbsp;)</code> | <a href="#duration--terse" title="View implementation">📄</a> | Emit a note-duration command. |
| <strong>DWAIT</strong><br><code>(&nbsp;limit&nbsp;--&nbsp;)</code> | <a href="#dwait--terse" title="View implementation">📄</a> | DWAIT runs nested loops with interrupts enabled and disables them on return; |
| <strong>F=</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#f--terse" title="View implementation">📄</a> | Declare a forward word with the game's source shorthand. |
| <strong>F1STLS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#f1stls--terse" title="View implementation">📄</a> | Select the first-base left-side action. |
| <strong>F1STRS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#f1strs--terse" title="View implementation">📄</a> | Select the first-base right-side action. |
| <strong>F2NDLS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#f2ndls--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>F2NDRS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#f2ndrs--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>F3RDLS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#f3rdls--terse" title="View implementation">📄</a> | Select the third-base left-side action. |
| <strong>F3RDRS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#f3rdrs--terse" title="View implementation">📄</a> | Select the third-base right-side action. |
| <strong>FBLLS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#fblls--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>FBLRS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#fblrs--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>FIELDWRT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#fieldwrt--terse" title="View implementation">📄</a> | Write field outline. |
| <strong>FL</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#fl--terse" title="View implementation">📄</a> | Set up all of background. |
| <strong>FLDDST,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#flddst--terse" title="View implementation">📄</a> | Emit the fielder destination command. |
| <strong>FLFILL</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#flfill--terse" title="View implementation">📄</a> | FLFILL fills the background while allowing interrupts; |
| <strong>FLSHME</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#flshme--terse" title="View implementation">📄</a> | FLSHME executes only a nonzero address whose top two bits are clear; |
| <strong>FLSHTON</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#flshton--terse" title="View implementation">📄</a> | FLSHTON saves a callback and starts its timer. |
| <strong>FOULTIME</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#foultime--terse" title="View implementation">📄</a> | Foulball process. |
| <strong>FOWR</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#fowr--terse" title="View implementation">📄</a> | Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells. |
| <strong>FSSLS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#fssls--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>FSSRS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#fssrs--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>GETF</strong><br><code>(&nbsp;--&nbsp;index&nbsp;field-byte&nbsp;)</code> | <a href="#getf--terse" title="View implementation">📄</a> | GETF fetches FIELD bytes sequentially; |
| <strong>GRNDRACTION</strong><br><code>(&nbsp;sector&nbsp;--&nbsp;)</code> | <a href="#grndraction--terse" title="View implementation">📄</a> | Consumes a selected hit-sector index, executes its `GSTBL` word, then installs the appropriate fielder playaction addresses. |
| <strong>GRNDRHIT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#grndrhit--terse" title="View implementation">📄</a> | Computes a ground-ball sector from randomized timing and pitch direction, dispatches `GRNDRACTION`, then sets ball destination. |
| <strong>HITDST</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hitdst--terse" title="View implementation">📄</a> | Chooses hit location. |
| <strong>HLLS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hlls--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>HLS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hls--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>HMS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hms--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>HOM</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hom--terse" title="View implementation">📄</a> | HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; |
| <strong>HRBY2</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hrby2--terse" title="View implementation">📄</a> | HRBY2 halves HRAT. |
| <strong>HRLS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hrls--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>HRS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#hrs--terse" title="View implementation">📄</a> | Uses BONE to compose game logic. |
| <strong>I'</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#i--terse" title="View implementation">📄</a> | Emit the target's indexed immediate reference. |
| <strong>ICODE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#icode--terse" title="View implementation">📄</a> | Defines the native interrupt handler and emits its Z80 register-save prologue in the host compiler. |
| <strong>INEXT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#inext--terse" title="View implementation">📄</a> | INEXT emits a jump to IEX; |
| <strong>INLOG</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#inlog--terse" title="View implementation">📄</a> | Infield master logic. |
| <strong>INNODDS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#innodds--terse" title="View implementation">📄</a> | INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state; |
| <strong>INSCN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#inscn--terse" title="View implementation">📄</a> | Insert coin call. |
| <strong>INSTRC</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#instrc--terse" title="View implementation">📄</a> | Instructions. |
| <strong>INSWAIT</strong><br><code>(&nbsp;count&nbsp;--&nbsp;)</code> | <a href="#inswait--terse" title="View implementation">📄</a> | INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return. |
| <strong>INTERRUPTS&gt;</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#interrupts--terse-1" title="View implementation">📄</a> | Emit the interrupt-vector dispatch jump. |
| <strong>INTHIGHRES</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#inthighres--terse" title="View implementation">📄</a> | Intialize screen for commercial mode. |
| <strong>ISCN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#iscn--terse" title="View implementation">📄</a> | Display the V15 instruction message. |
| <strong>LABLE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#lable--terse" title="View implementation">📄</a> | Provide the original source's label-definition alias. |
| <strong>LCB,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#lcb--terse" title="View implementation">📄</a> | Uses ACT, and DEACT, to compose game logic. |
| <strong>LDINFLDPA</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#ldinfldpa--terse" title="View implementation">📄</a> | LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain. |
| <strong>LDPC</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#ldpc--terse" title="View implementation">📄</a> | Emit/load the music program-counter value. |
| <strong>LDPCC</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#ldpcc--terse" title="View implementation">📄</a> | Emit/load a music program-counter command. |
| <strong>LK,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#lk--terse" title="View implementation">📄</a> | Uses BACT, and DEACT, to compose game logic. |
| <strong>LSETTFCOOR</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#lsettfcoor--terse" title="View implementation">📄</a> | Set take field coor & status -active , xpand. |
| <strong>MASTER</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#master--terse" title="View implementation">📄</a> | Define the game's master music stream. |
| <strong>MBALL</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mball--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MCANNON</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mcannon--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MCOIN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mcoin--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MCVOLS</strong><br><code>(&nbsp;volume&nbsp;--&nbsp;)</code> | <a href="#mcvols--terse" title="View implementation">📄</a> | Emit music-channel volume values. |
| <strong>MFENCE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mfence--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MFOUL</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mfoul--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MHIT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mhit--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MLINN</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mlinn--terse" title="View implementation">📄</a> | Mark last inning. |
| <strong>MOPENERS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mopeners--terse" title="View implementation">📄</a> | Uses PMUSIC to compose game logic. |
| <strong>MOUT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mout--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MSAFE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#msafe--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MSTRIKE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#mstrike--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>MYAH</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#myah--terse" title="View implementation">📄</a> | Uses BMUSIC to compose game logic. |
| <strong>NOISE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#noise--terse" title="View implementation">📄</a> | Emit a noise/sound command. |
| <strong>NOTES</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#notes--terse" title="View implementation">📄</a> | Uses ATONE and BTONE to compose game logic. |
| <strong>NPOST</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;address&nbsp;length&nbsp;--&nbsp;)</code> | <a href="#npost--terse" title="View implementation">📄</a> | Post a bcd number on the screen ; see options. |
| <strong>OFFDST,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#offdst--terse" title="View implementation">📄</a> | Emit the outfielder destination command. |
| <strong>OFMOT,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#ofmot--terse" title="View implementation">📄</a> | Emit the outfield motion command. |
| <strong>ON1ST,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#on1st--terse" title="View implementation">📄</a> | Emit the first-base playaction command. |
| <strong>ON2ND,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#on2nd--terse" title="View implementation">📄</a> | Emit the second-base playaction command. |
| <strong>ON3RD,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#on3rd--terse" title="View implementation">📄</a> | Emit the third-base playaction command. |
| <strong>OUTFLDHIT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#outfldhit--terse" title="View implementation">📄</a> | Fly ball. |
| <strong>OUTLINE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;--&nbsp;)</code> | <a href="#outline--terse" title="View implementation">📄</a> | Creates rectanguler outline. |
| <strong>OUTTIME</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#outtime--terse" title="View implementation">📄</a> | Out prc. |
| <strong>PLRCHK</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#plrchk--terse" title="View implementation">📄</a> | PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL; |
| <strong>PLRSELECT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#plrselect--terse" title="View implementation">📄</a> | Select singel player or 2 player. |
| <strong>PPOST</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;string&nbsp;--&nbsp;x&nbsp;y&nbsp;options&nbsp;)</code> | <a href="#ppost--terse" title="View implementation">📄</a> | Draw a counted string and keep drawing coordinates. |
| <strong>PUP</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#pup--terse" title="View implementation">📄</a> | Power up routine. |
| <strong>PX0</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#px0--terse" title="View implementation">📄</a> | Emit zero/white pixel patterns and define PX1/PX0 to select them. |
| <strong>PX1</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#px1--terse" title="View implementation">📄</a> | Emit zero/white pixel patterns and define PX1/PX0 to select them. |
| <strong>QUIET</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#quiet--terse" title="View implementation">📄</a> | Uses ABVOLS and MCVOLS to compose game logic. |
| <strong>QUIT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#quit--terse" title="View implementation">📄</a> | Uses HERE and LDPC to compose game logic. |
| <strong>RCB,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#rcb--terse" title="View implementation">📄</a> | Uses ACT, and DEACT, to compose game logic. |
| <strong>RDRNDNTE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#rdrndnte--terse" title="View implementation">📄</a> | Emit a randomized note with a rest interval. |
| <strong>RECLINE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;options&nbsp;--&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;options&nbsp;)</code> | <a href="#recline--terse" title="View implementation">📄</a> | Draws a horizontal rectangle row without consuming the five retained rectangle arguments. |
| <strong>RECTAN</strong><br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;--&nbsp;)</code> | <a href="#rectan--terse" title="View implementation">📄</a> | In X, Y, X length, Y length, pxtype set. |
| <strong>REST</strong><br><code>(&nbsp;duration&nbsp;--&nbsp;)</code> | <a href="#rest--terse" title="View implementation">📄</a> | Insert a silent music interval. |
| <strong>REST,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#rest--terse-1" title="View implementation">📄</a> | Emit a resting playaction record. |
| <strong>RETPA</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#retpa--terse" title="View implementation">📄</a> | Return to position pa. |
| <strong>RNDNTE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#rndnte--terse" title="View implementation">📄</a> | Emit a randomized musical note. |
| <strong>RRRNDNTE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#rrrndnte--terse" title="View implementation">📄</a> | Emit a sequence of randomized notes. |
| <strong>RUN1CHK1ST</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code> | <a href="#run1chk1st--terse" title="View implementation">📄</a> | Selects the runner vector for an occupied first-base slot, or delegates to the next occupancy test. |
| <strong>RUN1CHK2ND</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code> | <a href="#run1chk2nd--terse" title="View implementation">📄</a> | Chooses the next runner vector according to runner 1's second-base occupancy. |
| <strong>RUN2CHK</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code> | <a href="#run2chk--terse" title="View implementation">📄</a> | Returns the runner code and vector for the next open base. |
| <strong>RUN2CHK12ND</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code> | <a href="#run2chk12nd--terse" title="View implementation">📄</a> | Returns runner 2 or 3 vector based on second-base occupancy. |
| <strong>RUN2CHK1ST</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code> | <a href="#run2chk1st--terse" title="View implementation">📄</a> | Chooses runner 3 or delegates according to runner 2's first-base state. |
| <strong>RUN3CHK</strong><br><code>(&nbsp;--&nbsp;occupancy-code&nbsp;vector-address&nbsp;)</code> | <a href="#run3chk--terse" title="View implementation">📄</a> | Returns runner 3 or 4 code/vector from third runner's occupancy. |
| <strong>RUNDST,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#rundst--terse" title="View implementation">📄</a> | Emit the runner destination command. |
| <strong>S!</strong><br><code>(&nbsp;address&nbsp;value&nbsp;--&nbsp;)</code> | <a href="#s--terse" title="View implementation">📄</a> | Store cell with address-first arguments. |
| <strong>S10</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#s10--terse" title="View implementation">📄</a> | S10 starts INTERRUPTS0 through ISTART; |
| <strong>S11</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#s11--terse" title="View implementation">📄</a> | S11 starts INTERRUPTS1. |
| <strong>SB!</strong><br><code>(&nbsp;address&nbsp;value&nbsp;--&nbsp;)</code> | <a href="#sb--terse" title="View implementation">📄</a> | Store byte with address-first arguments. |
| <strong>SBALL1</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#sball1--terse" title="View implementation">📄</a> | Draw the BALL 1 message. |
| <strong>SBALL2</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#sball2--terse" title="View implementation">📄</a> | Draw the BALL 2 message. |
| <strong>SBALL3</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#sball3--terse" title="View implementation">📄</a> | Draw the BALL 3 message. |
| <strong>SBO</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#sbo--terse" title="View implementation">📄</a> | SBO posts the three $30-based count characters at their fixed positions. |
| <strong>SCOREME</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#scoreme--terse" title="View implementation">📄</a> | Plop scores up. |
| <strong>SCRERASE</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#screrase--terse" title="View implementation">📄</a> | Erase entire screen. |
| <strong>SCRS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#scrs--terse" title="View implementation">📄</a> | SCRS clears two score rectangles and draws zero score characters. |
| <strong>SETFDST</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#setfdst--terse" title="View implementation">📄</a> | Set up fielder destination values. |
| <strong>SETTF</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#settf--terse" title="View implementation">📄</a> | SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading. |
| <strong>SETTFPA</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#settfpa--terse" title="View implementation">📄</a> | Take field pa. |
| <strong>SFOUL</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#sfoul--terse" title="View implementation">📄</a> | Uses ROT and SPOST to compose game logic. |
| <strong>SGO</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#sgo--terse" title="View implementation">📄</a> | Uses SPOST to compose game logic. |
| <strong>SHOMER</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#shomer--terse" title="View implementation">📄</a> | Uses ROT and SPOST to compose game logic. |
| <strong>SORRY</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#sorry--terse" title="View implementation">📄</a> | Display the losing-player prompt. |
| <strong>SOUT1</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#sout1--terse" title="View implementation">📄</a> | Draw the 1 OUT message. |
| <strong>SOUT2</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#sout2--terse" title="View implementation">📄</a> | Draw the 2 OUT message. |
| <strong>SOUT3</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#sout3--terse" title="View implementation">📄</a> | Draw the 3 OUT message. |
| <strong>SPLR</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#splr--terse" title="View implementation">📄</a> | SPLR12/SPLR display available player choices; |
| <strong>SPLR12</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#splr12--terse" title="View implementation">📄</a> | SPLR12/SPLR display available player choices; |
| <strong>SPOST</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;string&nbsp;--&nbsp;)</code> | <a href="#spost--terse" title="View implementation">📄</a> | Draw a string. |
| <strong>SSAFE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#ssafe--terse" title="View implementation">📄</a> | SSAFE also redraws counts with SBO. |
| <strong>SSTRIKE1</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#sstrike1--terse" title="View implementation">📄</a> | Draw the STRIKE 1 message. |
| <strong>SSTRIKE2</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#sstrike2--terse" title="View implementation">📄</a> | Draw the STRIKE 2 message. |
| <strong>STFLD</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#stfld--terse" title="View implementation">📄</a> | STFLD installs RETPA and TAKEFIELD. |
| <strong>STP,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#stp--terse" title="View implementation">📄</a> | Emit a standing-action record. |
| <strong>STRIKETIME</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#striketime--terse" title="View implementation">📄</a> | Strike process. |
| <strong>STRINGGO</strong><br><code>(&nbsp;string&nbsp;erase-flag&nbsp;--&nbsp;)</code> | <a href="#stringgo--terse" title="View implementation">📄</a> | Given string , stringerase. |
| <strong>STRINGPRC</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#stringprc--terse" title="View implementation">📄</a> | String display. |
| <strong>STRTBALL</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#strtball--terse" title="View implementation">📄</a> | STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music. |
| <strong>SUP</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#sup--terse" title="View implementation">📄</a> | SUP posts UP. |
| <strong>SW-30</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code> | <a href="#sw-30--terse" title="View implementation">📄</a> | Maps a −30° swing and horizontal direction into a baseball sector code. |
| <strong>SW-45</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code> | <a href="#sw-45--terse" title="View implementation">📄</a> | Maps a −45° swing and horizontal direction into a baseball sector code. |
| <strong>SW-90</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;)</code> | <a href="#sw-90--terse" title="View implementation">📄</a> | SW-90 ignores direction/random inputs and returns the far-right foul sector. |
| <strong>SW+30</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code> | <a href="#sw30--terse" title="View implementation">📄</a> | Maps a +30° swing and horizontal direction into a baseball sector code. |
| <strong>SW+45</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code> | <a href="#sw45--terse" title="View implementation">📄</a> | Maps a +45° swing and horizontal direction into a baseball sector code. |
| <strong>SW+90</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;)</code> | <a href="#sw90--terse" title="View implementation">📄</a> | SW+90 always returns foul-left after dropping its inputs. |
| <strong>SW0</strong><br><code>(&nbsp;random&nbsp;dx&nbsp;--&nbsp;sector&nbsp;)</code> | <a href="#sw0--terse" title="View implementation">📄</a> | Maps a central swing and horizontal direction into a baseball sector code. |
| <strong>SWALK</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | <a href="#swalk--terse" title="View implementation">📄</a> | Uses ROT and SPOST to compose game logic. |
| <strong>TCNT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#tcnt--terse" title="View implementation">📄</a> | TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits. |
| <strong>TERSECHK</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#tersechk--terse" title="View implementation">📄</a> | Look at terse routine flags. |
| <strong>TF</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#tf--terse" title="View implementation">📄</a> | Take the field. |
| <strong>THW,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#thw--terse" title="View implementation">📄</a> | Emit the throw command. |
| <strong>TWAIT</strong><br><code>(&nbsp;count&nbsp;--&nbsp;)</code> | <a href="#twait--terse" title="View implementation">📄</a> | Terse wait period. |
| <strong>V</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#v--terse" title="View implementation">📄</a> | Uses VARIABLE to compose game logic. |
| <strong>V=</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#v--terse-1" title="View implementation">📄</a> | Uses V and VARIABLE to compose game logic. |
| <strong>VIBS</strong><br><code>(&nbsp;value&nbsp;--&nbsp;)</code> | <a href="#vibs--terse" title="View implementation">📄</a> | Emit a vibrato setting. |
| <strong>VIS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#vis--terse" title="View implementation">📄</a> | HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; |
| <strong>WHBODDS</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#whbodds--terse" title="View implementation">📄</a> | Sets who is on base calculates play odds. |
| <strong>WTHW,</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#wthw--terse" title="View implementation">📄</a> | Emit the wait-for-throw command. |
| <strong>WUPGO</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#wupgo--terse" title="View implementation">📄</a> | WUPGO activates WHOSUP with runner/automatic-forward flags; |
| <strong>WUPTON</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#wupton--terse" title="View implementation">📄</a> | WUPTON installs WUPWRT. |
| <strong>WUPWRT</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#wupwrt--terse" title="View implementation">📄</a> | Write whos up for flash. |
| <strong>YOU1ST</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#you1st--terse" title="View implementation">📄</a> | YOU1ST posts the greeting/extra-inning challenge, then continues to 306. |
| <strong>ZERORAM</strong><br><code>(&nbsp;--&nbsp;)</code> | <a href="#zeroram--terse" title="View implementation">📄</a> | ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. |

## Extra Bases native CODE words (85)

| Word / stack | | Function |
| --- | ---: | --- |
| <strong>+LOOP</strong><br><code>(&nbsp;increment&nbsp;--&nbsp;)</code><br><sub>Z80 after: Increment consumed; IX loop frame updated or released</sub> | <a href="#loop--native-code" title="View implementation">📄</a> | Uses LOOP to process game state. |
| <strong>ALLFLDACT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: RAM: infield/outfield active flags set; returns NEXT</sub> | <a href="#allfldact--native-code" title="View implementation">📄</a> | Sets all fielders active. |
| <strong>ANMSEQLOAD</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX: vector; RAM: VANMSEQH/L set; returns RET</sub> | <a href="#anmseqload--native-code" title="View implementation">📄</a> | Finds proper anm seq by per=#. |
| <strong>BALLERASE</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: BC, IY preserved; ball cleared; returns NEXT</sub> | <a href="#ballerase--native-code" title="View implementation">📄</a> | BALLERASE preserves BC/IY around native BLERASE and returns to TERSE. |
| <strong>BATHIT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Updates hit, pitch and swing state; returns to native caller with RET</sub> | <a href="#bathit--native-code" title="View implementation">📄</a> | He hit it time to get em running. |
| <strong>BATHITCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL = swing-state pointer; tests bat/ball overlap through table-selected hit window; returns to…</sub> | <a href="#bathitchk--native-code" title="View implementation">📄</a> | Check window for hit. |
| <strong>BATSWING</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Reads swing counters from RAM, calls BATWRITE/BATHITCHK, updates swing/strike state</sub> | <a href="#batswing--native-code" title="View implementation">📄</a> | Swings bat if appropriate. |
| <strong>BATWRITE</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL = swing-state pointer; derives drawing parameters and calls native pattern writer; restores HL</sub> | <a href="#batwrite--native-code" title="View implementation">📄</a> | Xor bat from swingtype. |
| <strong>BCD+</strong><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;bcd-sum&nbsp;)</code><br><sub>Z80 after: HL contains BCD sum, pushed onto parameter stack</sub> | <a href="#bcd--native-code" title="View implementation">📄</a> | Binary to decimal arithmatic. |
| <strong>BLDST</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Ball-vector update helper: computes motion/destination, handles catch/throw transitions</sub> | <a href="#bldst--native-code" title="View implementation">📄</a> | Ball thrown or hit. |
| <strong>BLMOTION</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Sets VECTPC to TBLPA via HL; native RET</sub> | <a href="#blmotion--native-code" title="View implementation">📄</a> | Set pc for ram pa table -tractor ball. |
| <strong>BLPOSCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = ball vector; checks ball/pitch position, collision flags and destination vector</sub> | <a href="#blposchk--native-code" title="View implementation">📄</a> | BLPOSCHK branches on HITYET. |
| <strong>BMUSIC</strong><br><code>(&nbsp;music-address&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL receives music address; note state conditionally initialized</sub> | <a href="#bmusic--native-code" title="View implementation">📄</a> | BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay. |
| <strong>BUTTONCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Samples controls and updates pitch/run flags; saves/restores IX/IY on native calls</sub> | <a href="#buttonchk--native-code" title="View implementation">📄</a> | Reads buttons for swing run & pitch it. |
| <strong>CHKCAUGHT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Interrupt-side caught-ball handler; saves native vector registers and changes runner/score flags</sub> | <a href="#chkcaught--native-code" title="View implementation">📄</a> | Caught set in interrupt. |
| <strong>CHKGROUNDER</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = ball vector; adjusts velocity using grounder lookup; preserves HL across table lookup</sub> | <a href="#chkgrounder--native-code" title="View implementation">📄</a> | If grounder adjust ball direction. |
| <strong>CHKSCRTIME</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Scores play events from RAM, updates runner/base and score state; temporary IX stack saves…</sub> | <a href="#chkscrtime--native-code" title="View implementation">📄</a> | Score process. |
| <strong>CLRBLST</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Stores ASCII zero ($30) into ball and strike counters; NEXT</sub> | <a href="#clrblst--native-code" title="View implementation">📄</a> | CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading. |
| <strong>cnline</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Saves BC, IX and IY around VECTOR; restores registers before NEXT</sub> | <a href="#cnline--native-code" title="View implementation">📄</a> | Calls vector line write. |
| <strong>COMPDE</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: DE ← −DE; HL preserved</sub> | <a href="#compde--native-code" title="View implementation">📄</a> | COMPDE applies the same operation to DE while preserving HL. |
| <strong>COMPHL</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL ← −HL</sub> | <a href="#comphl--native-code" title="View implementation">📄</a> | Compliments HL. |
| <strong>COUNT</strong><br><code>(&nbsp;address&nbsp;--&nbsp;address+1&nbsp;character&nbsp;)</code><br><sub>Z80 after: Character returned with high-bit terminator stripped; address advanced by one</sub> | <a href="#count--native-code" title="View implementation">📄</a> | Read the next character of a counted/high-bit-terminated string. |
| <strong>cpost</strong><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;char&nbsp;--&nbsp;x'&nbsp;y&nbsp;options&nbsp;)</code><br><sub>Z80 after: Consumes drawing position, options and character; returns updated x and retained state</sub> | <a href="#cpost--native-code" title="View implementation">📄</a> | Post an ascii-character on the screen ; see opt. |
| <strong>DEACTIVATE</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX addresses vector; resets active status bit, writes SAMEDLT, returns</sub> | <a href="#deactivate--native-code" title="View implementation">📄</a> | Reset active bit in status. |
| <strong>DI</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Maskable interrupts disabled; parameter stack unchanged</sub> | <a href="#di--native-code" title="View implementation">📄</a> | Disable maskable Z80 interrupts. |
| <strong>DIVHLBY4</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL ← signed(HL / 4)</sub> | <a href="#divhlby4--native-code" title="View implementation">📄</a> | Divide HL by 4. |
| <strong>DO</strong><br><code>(&nbsp;limit&nbsp;start&nbsp;--&nbsp;)</code><br><sub>Z80 after: Two parameter-stack cells consumed; IX return stack holds start, limit and loop IP</sub> | <a href="#do--native-code" title="View implementation">📄</a> | Enter a counted loop using a three-cell return-stack frame. |
| <strong>DSTCALC</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL ← dy; DE ← dx; BC ← action selector</sub> | <a href="#dstcalc--native-code" title="View implementation">📄</a> | Calc deltas to destination. |
| <strong>DSTLD</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX input vector; HL ← destination X; DE ← destination Y</sub> | <a href="#dstld--native-code" title="View implementation">📄</a> | DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively. |
| <strong>EI</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Maskable interrupts enabled; parameter stack unchanged</sub> | <a href="#ei--native-code" title="View implementation">📄</a> | Enable maskable Z80 interrupts. |
| <strong>EIDI</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Emits EI then DI, returns through NEXT</sub> | <a href="#eidi--native-code" title="View implementation">📄</a> | EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. |
| <strong>EMUSIC</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Initializes music state and returns through NEXT</sub> | <a href="#emusic--native-code" title="View implementation">📄</a> | EMUSIC selects ENDMUSIC and initializes timing/repetition to one; |
| <strong>EX</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Emits RET instruction and continues through NEXT</sub> | <a href="#ex--native-code" title="View implementation">📄</a> | EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation. |
| <strong>FILL</strong><br><code>(&nbsp;value&nbsp;address&nbsp;count&nbsp;--&nbsp;)</code><br><sub>Z80 after: Bytes [address..address+count−1] filled with value; parameter stack consumed</sub> | <a href="#fill--native-code" title="View implementation">📄</a> | Fill consecutive bytes with a specified value. |
| <strong>FLDDST</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = fielder vector; computes velocity/destination and updates playaction state through native…</sub> | <a href="#flddst--native-code" title="View implementation">📄</a> | Fielders take position logic. |
| <strong>FLSHOFF</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Preserves BC; clears flash state and calls FLSHWUP before NEXT</sub> | <a href="#flshoff--native-code" title="View implementation">📄</a> | FLSHOFF disables flashing and services cleanup under DI. |
| <strong>FMIRROR</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Preserves BC while mirroring field graphics and returns through NEXT</sub> | <a href="#fmirror--native-code" title="View implementation">📄</a> | FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order. |
| <strong>HITRUN</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Selects runner activation and throw target via indexed native dispatch; restores BC before NEXT</sub> | <a href="#hitrun--native-code" title="View implementation">📄</a> | Activate proper runners and set trwbase. |
| <strong>HOMERCHK</strong><br><code>(&nbsp;y&nbsp;x&nbsp;hit-type&nbsp;random-x&nbsp;random-y&nbsp;--&nbsp;)</code><br><sub>Z80 after: Five TERSE inputs consumed; ball/homer state updated</sub> | <a href="#homerchk--native-code" title="View implementation">📄</a> | Consumes two random offsets, hit type and ball coordinates from the TERSE parameter stack; sets fence/homer state and ball destination. |
| <strong>I</strong><br><code>(&nbsp;--&nbsp;index&nbsp;)</code><br><sub>Z80 after: Loop index copied from IX return-stack frame to parameter stack; IX frame intact</sub> | <a href="#i--native-code" title="View implementation">📄</a> | Fetch the innermost counted-loop index. |
| <strong>IEX</strong><br><code>(&nbsp;saved-interrupt-frame&nbsp;--&nbsp;)</code><br><sub>Z80 after: Saved interrupt register frame restored, interrupt enabled</sub> | <a href="#iex--native-code" title="View implementation">📄</a> | Restores two saved Z80 register banks, enables interrupts, then returns from the interrupt bridge; this is an interrupt-frame convention, not an ordinary TERSE data-word call. |
| <strong>INDEXW</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: A,HL input table index/base; DE ← indexed word</sub> | <a href="#indexw--native-code" title="View implementation">📄</a> | Call routine A- disp HL- table add. |
| <strong>INFIELD</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Draws infield stripes/pitcher mound; preserves BC and IX around row-rendering helpers</sub> | <a href="#infield--native-code" title="View implementation">📄</a> | Uses IFSPAN to process game state. |
| <strong>INFLDACT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Sets HL to first infield vector, A to five records, and calls SETACT</sub> | <a href="#infldact--native-code" title="View implementation">📄</a> | Set infielders active. |
| <strong>ISTART</strong><br><code>(&nbsp;interrupt-address&nbsp;--&nbsp;)</code><br><sub>Z80 after: RAM[IPNT] ← interrupt handler address; mode IM2</sub> | <a href="#istart--native-code" title="View implementation">📄</a> | ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT. |
| <strong>KILLOF</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Clears outfield delta words and control flag; selects standing playaction</sub> | <a href="#killof--native-code" title="View implementation">📄</a> | Stop outfield tractor ball control. |
| <strong>LOADANM</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL ← next playaction cursor; IX vector updated</sub> | <a href="#loadanm--native-code" title="View implementation">📄</a> | Loads magic & anm HL-top of playact table. |
| <strong>LOOP</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Parameter stack unchanged; IX loop index incremented, loop frame retained or released</sub> | <a href="#loop--native-code-1" title="View implementation">📄</a> | Advance a counted loop and test its termination. |
| <strong>MULTHLBY4</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL ← signed(4×HL)</sub> | <a href="#multhlby4--native-code" title="View implementation">📄</a> | MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign. |
| <strong>MUSCPU</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Music tick handler; updates note timer, decodes music commands and drives sound ports</sub> | <a href="#muscpu--native-code" title="View implementation">📄</a> | Declare cross-screen dispatch labels and begin assembling MUSCPU. |
| <strong>NDUP</strong><br><code>(&nbsp;x1&nbsp;…&nbsp;xn&nbsp;n&nbsp;--&nbsp;x1&nbsp;…&nbsp;xn&nbsp;x1&nbsp;…&nbsp;xn&nbsp;)</code><br><sub>Z80 after: Parameter stack retains original n cells and appends a copy; count removed</sub> | <a href="#ndup--native-code" title="View implementation">📄</a> | Duplicate the top n parameter-stack cells. |
| <strong>OFFFDST</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = active fielder vector; selects off-field destination, computes movement deltas</sub> | <a href="#offfdst--native-code" title="View implementation">📄</a> | All player off field control. |
| <strong>OFLDTBL</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Assigns outfielder playaction table, invokes OUTFLDACT, and returns</sub> | <a href="#ofldtbl--native-code" title="View implementation">📄</a> | OFLDTBL gives all three outfielders OFTBLPA, activates them and returns; |
| <strong>OFMOTION</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Sets VECTPC from OFPA, conditional on action opcode and IX status</sub> | <a href="#ofmotion--native-code" title="View implementation">📄</a> | Set pc for ram pa table -tractor ball. |
| <strong>ON1ST</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: RAM[FLDON1ST] ← IX</sub> | <a href="#on1st--native-code" title="View implementation">📄</a> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; |
| <strong>ON2ND</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: RAM[FLDON2ND] ← IX</sub> | <a href="#on2nd--native-code" title="View implementation">📄</a> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; |
| <strong>ON3RD</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: RAM[FLDON3RD] ← IX</sub> | <a href="#on3rd--native-code" title="View implementation">📄</a> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; |
| <strong>OPCODECHK</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL = playaction cursor; looks up opcode handler and executes with a native return trampoline</sub> | <a href="#opcodechk--native-code" title="View implementation">📄</a> | Called by plyactupdate. |
| <strong>OUTFLDACT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Sets HL to first outfield vector, A to three records, and calls SETACT</sub> | <a href="#outfldact--native-code" title="View implementation">📄</a> | Sets outfielders active. |
| <strong>PACTLOAD</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = target vector; reads playaction stream, dispatches opcodes, advances vector PC</sub> | <a href="#pactload--native-code" title="View implementation">📄</a> | Loads vect from plyact. |
| <strong>PATFETCH</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = vector; selects animation-frame pattern from sequence table and stores its address</sub> | <a href="#patfetch--native-code" title="View implementation">📄</a> | Loads actual pattern IX-vector. |
| <strong>PERSPECTIVE</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = vector; derives perspective class from Y and updates redraw flag if class changed</sub> | <a href="#perspective--native-code" title="View implementation">📄</a> | Pattern size determined by y. |
| <strong>PLAYACT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Reads VECTIX, preserves BC/IX, advances vector animation/update through helper routines</sub> | <a href="#playact--native-code" title="View implementation">📄</a> | Called in intterupt does update prc. |
| <strong>PMUSIC</strong><br><code>(&nbsp;music-address&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL consumes music address; RAM priority/timers updated</sub> | <a href="#pmusic--native-code" title="View implementation">📄</a> | PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer. |
| <strong>PTAUTOTM</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Calls TIMEDCR for pitch timeout and returns through NEXT</sub> | <a href="#ptautotm--native-code" title="View implementation">📄</a> | Pitch auto timer. |
| <strong>RESETRUNNERS</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Reorders runner vector records by occupancy and resets final runner slot</sub> | <a href="#resetrunners--native-code" title="View implementation">📄</a> | Reset runners to order of on base. |
| <strong>RND</strong><br><code>(&nbsp;upper-bound&nbsp;--&nbsp;random-value&nbsp;)</code><br><sub>Z80 after: Upper bound consumed and scaled random result pushed; random seed advanced</sub> | <a href="#rnd--native-code" title="View implementation">📄</a> | Produce a random value scaled to the supplied bound. |
| <strong>RUNDST</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = runner record; processes base occupancy, auto-forward and movement state</sub> | <a href="#rundst--native-code" title="View implementation">📄</a> | Runner base running control. |
| <strong>SENTRY</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Native game scheduler; calls tick services, invokes TERSECHK, then loops</sub> | <a href="#sentry--native-code" title="View implementation">📄</a> | Game loop. |
| <strong>SETACT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL,A input vector/count; VACT set across records</sub> | <a href="#setact--native-code" title="View implementation">📄</a> | Sets avtive bit in status. |
| <strong>STARTMUSIC</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Selects event music from state flags and dispatches music requests</sub> | <a href="#startmusic--native-code" title="View implementation">📄</a> | STARTMUSIC clears its request. |
| <strong>strtline</strong><br><code>(&nbsp;x&nbsp;y&nbsp;--&nbsp;)</code><br><sub>Z80 after: Pops X and Y to native registers, computes address/line setup; returns via NEXT</sub> | <a href="#strtline--native-code" title="View implementation">📄</a> | Given X Y sets up start of line. |
| <strong>SWAN</strong><br><code>(&nbsp;value&nbsp;--&nbsp;nibble-swapped-value&nbsp;)</code><br><sub>Z80 after: High byte unchanged; low byte rotated four bits; result replaces input</sub> | <a href="#swan--native-code" title="View implementation">📄</a> | Exchange the high and low nibbles of the low byte. |
| <strong>TBALLPITCH</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Computes pitcher/trackball velocity updates and writes movement fields</sub> | <a href="#tballpitch--native-code" title="View implementation">📄</a> | Loads pitch velocities. |
| <strong>THROWANIM</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Prepares ball/throw vector data; saves/restores IX and IY around native update</sub> | <a href="#throwanim--native-code" title="View implementation">📄</a> | Sets up BLDST and player anim. |
| <strong>THROWBALL</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Builds the pitch or throw state, updates ball vector and runner decisions</sub> | <a href="#throwball--native-code" title="View implementation">📄</a> | Finish scoring first. |
| <strong>THWANMSET</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Reads thrower vector from IX and stores WHOTHROWS; initializes animation flags</sub> | <a href="#thwanmset--native-code" title="View implementation">📄</a> | Set up throw animation. |
| <strong>TIMER</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Scans game timers with TIMEDCR and invokes native event handlers</sub> | <a href="#timer--native-code" title="View implementation">📄</a> | Interrupt timer routine. |
| <strong>VECTOR</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = vector record; advances positions and applies hardware limits</sub> | <a href="#vector--native-code" title="View implementation">📄</a> | Vectors and limit checks. |
| <strong>VERASE</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = vector record; derives previous pattern/screen address and calls native writep</sub> | <a href="#verase--native-code" title="View implementation">📄</a> | Does pattern board erase from vector IX. |
| <strong>VWRITE</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IX = vector record; derives pattern position, calls reloff/relabs/writep, saves erase address</sub> | <a href="#vwrite--native-code" title="View implementation">📄</a> | Does reloff relabs patbrd from vector IX. |
| <strong>WAIT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: A = native delay count; preserves value over inner wait loop and returns</sub> | <a href="#wait--native-code" title="View implementation">📄</a> | Given A wait period stop every thing. |
| <strong>WAITTHRW</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Configures throw animation and wait state; A used for flags, native RET</sub> | <a href="#waitthrw--native-code" title="View implementation">📄</a> | Sets flag for 1stbaseman to wait throw. |
| <strong>WRITE</strong><br><code>(&nbsp;x&nbsp;y&nbsp;pattern&nbsp;dimensions&nbsp;options&nbsp;--&nbsp;)</code><br><sub>Z80 after: Stack consumes x,y,pattern,dimensions,options; framebuffer updated</sub> | <a href="#write--native-code" title="View implementation">📄</a> | Write with X Y sizes ; pattern with no header. |
| <strong>WRITR</strong><br><code>(&nbsp;x&nbsp;y&nbsp;relative-pattern&nbsp;options&nbsp;--&nbsp;)</code><br><sub>Z80 after: Stack consumes x,y,relative-pattern,options; framebuffer updated</sub> | <a href="#writr--native-code" title="View implementation">📄</a> | Write with a relative pattern. |

## Native SUBR helpers (47)

| Word / stack | | Function |
| --- | ---: | --- |
| <strong>AUTOR1</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Writes automatic-run and active flags into runner 1 status fields</sub> | <a href="#autor1--native-subr" title="View implementation">📄</a> | AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners. |
| <strong>AUTOR2</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Writes automatic-run and active flags into runner 2 status fields</sub> | <a href="#autor2--native-subr" title="View implementation">📄</a> | Run second-runner automation logic. |
| <strong>AUTOR3</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Writes automatic-run and active flags into runner 3 status fields</sub> | <a href="#autor3--native-subr" title="View implementation">📄</a> | Run third-runner automation logic. |
| <strong>BLERASE</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Saves/restores IX; addresses ball vector, erases image, clears active bit</sub> | <a href="#blerase--native-subr" title="View implementation">📄</a> | Erases ball. |
| <strong>CHKATBS</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: A = vector status flags, E = accumulator; increments E if active and not at base</sub> | <a href="#chkatbs--native-subr" title="View implementation">📄</a> | Check if active player at base in- A vstatus. |
| <strong>CHKCOIN1</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Reads coin-door 1 via debounce; updates credits and signals coin event</sub> | <a href="#chkcoin1--native-subr" title="View implementation">📄</a> | Chk door 1 for coin drop. |
| <strong>CHKCOIN2</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Reads coin-door 2 via debounce; updates credits with door/DIP-specific increments</sub> | <a href="#chkcoin2--native-subr" title="View implementation">📄</a> | Chk door 2 for coin drop. |
| <strong>CMPOF</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Selects outfielder vector in IX, computes deltas and activates outfield control</sub> | <a href="#cmpof--native-subr" title="View implementation">📄</a> | Calculates proper deltas and patterns. |
| <strong>COLORBAND</strong><br><code>(&nbsp;saved-interrupt-frame&nbsp;--&nbsp;)</code><br><sub>Z80 after: Interrupt state restored, palette ports written</sub> | <a href="#colorband--native-subr" title="View implementation">📄</a> | COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled. |
| <strong>debounce</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: A = input port, HL = bit mask, DE = sampling duration; returns A = accepted pulse/zero</sub> | <a href="#debounce--native-subr" title="View implementation">📄</a> | Debounce input transitions. |
| <strong>FETCH</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL ← MUSICPC; A ← byte at HL</sub> | <a href="#fetch--native-subr" title="View implementation">📄</a> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. |
| <strong>FLSHWUP</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Saves/restores IX and IY while updating flash timer and callback</sub> | <a href="#flshwup--native-subr" title="View implementation">📄</a> | Handle flash callback. |
| <strong>FNBB</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Native no-op helper; immediate RET</sub> | <a href="#fnbb--native-subr" title="View implementation">📄</a> | Native game routine; source body below. |
| <strong>FONTUNPACK</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL = packed font source; expands bytes into FONTWORK; HL returns its address</sub> | <a href="#fontunpack--native-subr" title="View implementation">📄</a> | FONTUNPACK reads two packed bytes and starts a five-row unpack loop. |
| <strong>FRO1</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Calls AUTOR1; native RET</sub> | <a href="#fro1--native-subr" title="View implementation">📄</a> | Uses AUTOR1 to process game state. |
| <strong>FRO12</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Calls AUTOR1, AUTOR2; native RET</sub> | <a href="#fro12--native-subr" title="View implementation">📄</a> | Uses AUTOR1 and AUTOR2 to process game state. |
| <strong>FRO123</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Calls AUTOR1, AUTOR2, AUTOR3; native RET</sub> | <a href="#fro123--native-subr" title="View implementation">📄</a> | Uses AUTOR1 and AUTOR2 to process game state. |
| <strong>FRO13</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Writes runner-1 status and calls AUTOR2; native RET</sub> | <a href="#fro13--native-subr" title="View implementation">📄</a> | Uses AUTOR2 to process game state. |
| <strong>FRO2</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Writes runner-1 status field; native RET</sub> | <a href="#fro2--native-subr" title="View implementation">📄</a> | Native game routine; source body below. |
| <strong>FRO23</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Writes runner-1 and runner-2 status; native RET</sub> | <a href="#fro23--native-subr" title="View implementation">📄</a> | Native game routine; source body below. |
| <strong>FRO3</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Writes runner-1 status field; native RET</sub> | <a href="#fro3--native-subr" title="View implementation">📄</a> | Native game routine; source body below. |
| <strong>HLOAD</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL ← zero-extended music byte</sub> | <a href="#hload--native-subr" title="View implementation">📄</a> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. |
| <strong>IFSPAN</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Uses incoming A and C for fielder span calculation; returns native register results</sub> | <a href="#ifspan--native-subr" title="View implementation">📄</a> | IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value. |
| <strong>INCPC</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: RAM[MUSPC] ← RAM[MUSPC]+1</sub> | <a href="#incpc--native-subr" title="View implementation">📄</a> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. |
| <strong>loadpc</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: RAM[MUSPC], RAM[STARTPC] ← HL</sub> | <a href="#loadpc--native-subr" title="View implementation">📄</a> | loadpc installs MUSPC and STARTPC. |
| <strong>LVRSTAT</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: A = desired runner status byte; stores it across all four runner status fields</sub> | <a href="#lvrstat--native-subr" title="View implementation">📄</a> | Load vstat for all runners in- A value. |
| <strong>NBB</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Native no-op helper; immediate RET</sub> | <a href="#nbb--native-subr" title="View implementation">📄</a> | NBB is the empty-bases no-op. |
| <strong>OFBLCHK</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: D = maximum catch distance; checks nearby ball/player vectors, returns native result in A</sub> | <a href="#ofblchk--native-subr" title="View implementation">📄</a> | Chk for catch or close when cmsw. |
| <strong>PCJUMP</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: RAM[MUSPC] ← 16-bit branch target</sub> | <a href="#pcjump--native-subr" title="View implementation">📄</a> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. |
| <strong>relabs</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: BC ← expansion/shift; HL ← screen address</sub> | <a href="#relabs--native-subr" title="View implementation">📄</a> | Relative X Y to magic address conversion. |
| <strong>reloff</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: DE ← x offset; HL ← y offset; IY ← absolute pattern</sub> | <a href="#reloff--native-subr" title="View implementation">📄</a> | Compute relative offset of x , y of pattern. |
| <strong>RO1</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Activates runner 1 and selects a native runner pointer in BC, conditional on double-play state</sub> | <a href="#ro1--native-subr" title="View implementation">📄</a> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. |
| <strong>RO12</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Activates runners 1 and 2; selects the next runner pointer in BC</sub> | <a href="#ro12--native-subr" title="View implementation">📄</a> | RO12 activates both forced runners, selecting a double-play or ordinary target; |
| <strong>RO123</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Activates runners 1–3; selects runner pointer in BC, conditional on double play</sub> | <a href="#ro123--native-subr" title="View implementation">📄</a> | RO23 and RO123 choose forced advancement and double-play targets for their base combinations. |
| <strong>RO13</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Activates runner 2, then chooses runner pointer and double-play path</sub> | <a href="#ro13--native-subr" title="View implementation">📄</a> | RO13 handles first-and-third occupancy and may branch through SETDBLPLAY. |
| <strong>RO2</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Activates runner 1 conditionally; returns BC = runner 2 vector</sub> | <a href="#ro2--native-subr" title="View implementation">📄</a> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. |
| <strong>RO23</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Selects runner 3 in BC, conditionally activating runners 1 and 2</sub> | <a href="#ro23--native-subr" title="View implementation">📄</a> | RO23 and RO123 choose forced advancement and double-play targets for their base combinations. |
| <strong>RO3</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Selects runner 2 in BC, conditionally activates runner 1</sub> | <a href="#ro3--native-subr" title="View implementation">📄</a> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. |
| <strong>SETDBLPLAY</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL identifies runner on first; sets DBLPLAY flag</sub> | <a href="#setdblplay--native-subr" title="View implementation">📄</a> | Sets up double play HL-guy on 1st. |
| <strong>TAKEOFF</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Dispatches runner-activation handler via BC/table and native return trampoline</sub> | <a href="#takeoff--native-subr" title="View implementation">📄</a> | Turn proper runners on. |
| <strong>TBALLPRC</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Samples trackball port and computes tractor-ball/outfielder velocity state</sub> | <a href="#tballprc--native-subr" title="View implementation">📄</a> | Pitch or control outfield. |
| <strong>TBLVEL</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: HL addresses current velocity byte, D = maximum; returns signed velocity increment in HL</sub> | <a href="#tblvel--native-subr" title="View implementation">📄</a> | Tractorball vel HL-# add. D-max vel. |
| <strong>TIMEDCR</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: A ← 1 if timer reached zero, otherwise 0</sub> | <a href="#timedcr--native-subr" title="View implementation">📄</a> | HL-timer add if goes to zero return 1 else 0. |
| <strong>TOOFCK</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Decrements outfielder timeout and invokes CMPOF if still active</sub> | <a href="#toofck--native-subr" title="View implementation">📄</a> | Time out outfield check. |
| <strong>WALKOVER</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: Sets CAUGHT and THROWAROUND flags to one</sub> | <a href="#walkover--native-subr" title="View implementation">📄</a> | Walked runner at base. |
| <strong>write</strong><br><code>(&nbsp;--&nbsp;)</code><br><sub>Z80 after: IY,BC,DE,HL input drawing state; frame buffer updated</sub> | <a href="#write--native-subr" title="View implementation">📄</a> | Software write with x y size. |
| <strong>writep</strong><br><code>(&nbsp;IY=patadr&nbsp;BC=ex/mag+shf&nbsp;HL=scradr&nbsp;---&nbsp;)</code><br><sub>Z80 after: native return; register outputs not established from this entry</sub> | <a href="#writep--native-subr" title="View implementation">📄</a> | Software write with pattern size on pattern. |

## Host and cross-compiler definitions (2)

| Word / stack | | Function |
| --- | ---: | --- |
| <strong>BASE!</strong><br><code>(&nbsp;base&nbsp;--&nbsp;)</code> | <a href="#base--terse" title="View implementation">📄</a> | Set the number base. |
| <strong>BASE@</strong><br><code>(&nbsp;--&nbsp;base&nbsp;)</code> | <a href="#base--terse-1" title="View implementation">📄</a> | Fetch the current number base. |

## Implementations

### `-` — shared

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

### `!` — shared

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

### `@` — shared

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

### `*` — shared

`( a b -- product )`

Multiply two stack values.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
I 0400 * + 0400 UNPROT BMOVE PROT LOOP DROP R> + ;
```

### `/` — shared

`( a b -- quotient )`

Divide the preceding stack value by the top value.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
TBALLDX 100 / H MVI, D M MOV, -->
```

### `+` — shared

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

### `<` — shared

`( a b -- flag )`

Compare whether the preceding value is less than the top value.

```text
_less:
```

### `=` — shared

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

### `>` — shared

`( a b -- flag )`

Compare whether the preceding value is greater than the top value.

```text
_gt:
```

### `0=` — shared

`( n -- flag )`

Return a condition indicating zero.

```text
_zeroequal:
            ld      de,$0000            ; Load 0 as second operand
            jp      $00F7               ; Jump into equal comparison routine
```

### `2DUP` — shared

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

### `AND` — shared

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

### `ARRAY` — shared

`( size -- )`

Allocate/name an indexed cell array from a the size.

```text
_ARRAY:
            pop     hl                  ; Pop array index from parameter stack
            add     hl,hl               ; Double index for 16-bit word offset
            jp      $0062               ; Jump to add inline base address and push
```

**Used by:** `NDUP`.

### `B!` — shared

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

### `B@` — shared

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

### `BARRAY` — shared

`( size -- )`

Allocate/name an indexed byte array from a the size.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
VLENGTH BARRAY BL
```

### `BEGIN` — shared

`( -- )`

Immediate XC wrapper that records a loop's object address.

```terse
: BEGIN } XC-BEGIN { ;
```

**Used by:** `INSTRC`, `INSWAIT`, `RECTAN`, `TWAIT`.

### `CODE` — shared

`( -- )`

Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
CODE CHKSCRTIME ( score process ) DI,
```

### `CONSTANT` — shared

`( value -- )`

Define a constant from a value.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
28 CONSTANT RRUN 68 CONSTANT LRUN
```

**Used by:** `C=`.

### `DECIMAL` — shared

`( -- )`

Select radix ten for parsing subsequent source numbers.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
XCBEG DECIMAL xcsys xc ASM .OPS
```

**Used by:** `DTC`, `FMIRROR`, `HITRUN`.

### `DROP` — shared

`( x -- )`

Discard the top stack cell.

```text
_DROP:
            pop     hl                  ; Pop and discard top value from stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `CPOST`, `CREDARROW`, `DOGOVER`, `DOSBALL`, `DOSOUT`, `FOULTIME`, `GRNDRHIT`, `INNODDS`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTLINE`, `OUTTIME`, `PLRCHK`, `RECTAN`, `RETPA`, `SPOST`, `STRINGGO`, `SW+30`, `SW+45`, `SW+90`, `SW-30`, `SW-45`, `SW-90`, `SW0`, `TERSECHK`, `TF`, `TWAIT`, `WHBODDS`, `dpost`.

### `DUP` — shared

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

### `ELSE` — shared

`( -- )`

Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch.

```terse
: ELSE } XC-ELSE { ;
```

### `END` — shared

`( flag -- )`

Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true.

```terse
: END } XC-END { ;
```

**Used by:** `INSTRC`, `INSWAIT`, `RECTAN`, `TWAIT`.

### `HEX` — shared

`( -- )`

Select radix sixteen for parsing subsequent source numbers.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
HEX 0 ROMSTART ! 7F80 PSTACK !
```

### `IF` — shared

`( flag -- )`

Immediate XC wrapper that emits a conditional target branch through XC-IF.

```terse
: IF } XC-IF { ;
```

### `LIT` — shared

`( -- value; inline cell )`

Compiler literal mechanism used by INEXT's host macro.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
{ : INEXT } { LIT [ } ' IEX { , } ASM { ] } JMP, { ; }
```

**Used by:** `INEXT`.

### `OR` — shared

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

### `OVER` — shared

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

### `ROT` — shared

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

### `SWAP` — shared

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

### `THEN` — shared

`( -- )`

Immediate XC wrapper that resolves a saved target branch destination.

```terse
: THEN } XC-THEN { ;
```

### `VARIABLE` — shared

`( -- )`

Allocate/name a cell variable with the initial value in this dialect.

**Extra Bases source use:** The source below demonstrates this host/development word. Its own host implementation is not included in the supplied Extra Bases source screens.

```terse
0 VARIABLE MUSPC { : MASTER } 10 B, B, { ; } { : ATONE } 11 B,
```

**Used by:** `V`, `V=`.

### `XOR` — shared

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

### `]'[` — TERSE

`( -- )`

Source-level compiler/TERSE definition shown below.

```text
: ]'[ [COMPILE] ' ;
```

### `^` — TERSE

`( -- )`

Uses ABVOLS and MCVOLS to compose game logic.

```text
{ : ^ } EF ABVOLS 0F MCVOLS { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`.

### `<INTERRUPTS` — TERSE

`( -- )`

Mark the start of interrupt data.

```text
{ : <INTERRUPTS } DATA HERE { ; }
```

**Calls:** `HERE`.

### `ABVOLS` — TERSE

`( volume -- )`

Emit the music volume command.

```text
{ : ABVOLS } 16 B, B, { ; }
```

**Used by:** `CMAJOR`, `QUIET`, `REST`, `^`.

### `ACT,` — TERSE

`( -- )`

Emit a playaction record.

```text
{ : ACT, } , B, , , { ; }
```

**Used by:** `BACT,`, `LCB,`, `RCB,`, `STP,`.

### `ANOTE` — TERSE

`( duration tone -- )`

Emit a channel A note followed by its duration.

```text
{ : ANOTE } ATONE DURATION { ; }
```

**Calls:** `ATONE`, `DURATION`.

### `ATONE` — TERSE

`( tone -- )`

Emit tone setting for channel A.

```text
{ : ATONE } 11 B,
B, { ; }
```

**Used by:** `ANOTE`, `NOTES`, `QUIET`.

### `BACT,` — TERSE

`( -- )`

Emit a ball-action record.

```text
{ : BACT, } BAL ACT, { ; }
```

**Calls:** `ACT,`.

**Used by:** `LK,`.

### `BALLTIME` — TERSE

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

### `BLDST,` — TERSE

`( -- )`

Emit the ball destination command.

```text
{ : BLDST, } OPBLDST B, { ; }
```

### `BLMOT,` — TERSE

`( -- )`

Emit the ball motion command.

```text
{ : BLMOT, } OPBLMOT B, { ; }
```

### `BNOTE` — TERSE

`( duration tone -- )`

Emit a channel B note followed by its duration.

```text
{ : BNOTE } BTONE DURATION
{ ; }
```

**Calls:** `BTONE`, `DURATION`.

### `BONE` — TERSE

`( address -- )`

Store byte value 1.

```text
: BONE ( cange byte memory cell to 1 ) 1 SB! ;
```

**Calls:** `SB!`.

**Used by:** `BALLTIME`, `CREDARROW`, `DOGOVER`, `DPCN`, `F2NDLS`, `F2NDRS`, `FBLLS`, `FBLRS`, `FLSHTON`, `FSSLS`, `FSSRS`, `GRNDRHIT`, `HLLS`, `HLS`, `HMS`, `HRLS`, `HRS`, `INLOG`, `INSWAIT`, `OUTFLDHIT`, `OUTTIME`, `PLRCHK`, `PLRSELECT`, `PUP`, `SPLR`, `STFLD`, `STRTBALL`, `TF`.

### `BTONE` — TERSE

`( tone -- )`

Emit tone setting for channel B.

```text
{ : BTONE } 12 B, B, { ; }
```

**Used by:** `BNOTE`, `NOTES`, `QUIET`.

### `BV` — TERSE

`( -- )`

Define a named byte variable.

```text
{ : BV } BVARIABLE { ; }
```

**Used by:** `BV=`.

### `BV=` — TERSE

`( -- )`

Uses BV to compose game logic.

```text
{ : BV= } 0 BVARIABLE { ; }
```

**Calls:** `BV`.

### `BZERO` — TERSE

`( address -- )`

Store byte value 0.

```text
: BZERO ( change byte memory cell to 0 ) 0 SB! ;
```

**Calls:** `SB!`.

**Used by:** `CHKFLSHSTAY`, `CREDARROW`, `DOCHGS`, `DOGOVER`, `DOHOMER`, `DPCN`, `FIELDWRT`, `GRNDRACTION`, `HITDST`, `INLOG`, `INSTRC`, `PLRSELECT`, `SCOREME`, `STRINGPRC`, `STRTBALL`, `TF`.

### `C=` — TERSE

`( value -- )`

Uses CONSTANT to compose game logic.

```text
{ : C= } CONSTANT { ; }
```

**Calls:** `CONSTANT`.

### `CHGS` — TERSE

`( -- )`

CHGS posts CHANGE SIDES;

```text
: CHGS 1C00 2000 828 A" CHANGE SIDES" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DOCHGS`.

### `CHKFLSHSTAY` — TERSE

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

### `CHKGMCNT` — TERSE

`( -- credits )`

CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte.

```text
: CHKGMCNT DP12CN C0 TWAIT DP12CN CREDITS B@ ;
```

**Calls:** `DP12CN`, `TWAIT`, `B@`.

**Used by:** `TF`.

### `CMAJOR` — TERSE

`( -- )`

Initialize the C-major sound pattern.

```text
{ : CMAJOR } 1C MASTER 0 NOISE EF ABVOLS 0F MCVOLS { ; }
```

**Calls:** `MASTER`, `NOISE`, `ABVOLS`, `MCVOLS`.

### `CNLINE` — TERSE

`( -- )`

CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state.

```text
: CNLINE ( continue line to this point , given X Y )
YIN ! XIN ! cnline ;
```

**Calls:** `cnline`.

**Used by:** `FIELDWRT`, `OUTLINE`.

### `CNOTE` — TERSE

`( duration tone -- )`

Emit a channel C note followed by its duration.

```text
{ : CNOTE } CTONE DURATION { ; }
```

**Calls:** `CTONE`, `DURATION`.

**Used by:** `NOTES`.

### `CONGR` — TERSE

`( -- )`

Display the congratulatory prompt.

```text
: CONGR 700 1000 828 A" CONGRATULATIONS YOU ARE VERY GOOD"
SPOST 0E00 2800 828 A" LETS PLAY AGAIN I WILL BUY" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `TF`.

### `CPOST` — TERSE

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

### `CREDARROW` — TERSE

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

### `CTONE` — TERSE

`( tone -- )`

Emit tone setting for channel C.

```text
{ : CTONE } 13 B, B, { ; }
```

**Used by:** `CNOTE`, `QUIET`.

### `DEACT,` — TERSE

`( -- )`

Emit vector-deactivation command.

```text
{ : DEACT, } 0C B, { ; }
```

**Used by:** `LCB,`, `LK,`, `RCB,`, `STP,`.

### `DLINE` — TERSE

`( x1 y1 x2 y2 -- )`

Draw a line , given X Y start coor X Y ending coor.

```text
: DLINE ( draw a line , given X Y start coor X Y ending coor )
YIN ! XIN ! 2DUP Y-AXIS ! X-AXIS !
SWAB ( set y for relabs ) strtline cnline ;
```

**Calls:** `DUP`, `strtline`, `cnline`.

**Used by:** `FIELDWRT`, `OUTLINE`, `RECLINE`.

### `DOCHGS` — TERSE

`( -- )`

DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER;

```text
: DOCHGS ' CHGS FLSHTON 28 DWAIT FLSHOFF GAMEOVER BZERO ;
```

**Calls:** `CHGS`, `FLSHTON`, `DWAIT`, `FLSHOFF`, `BZERO`.

**Used by:** `TF`.

### `DOEHOMER` — TERSE

`( -- )`

DOEHOMER only posts the text.

```text
: DOEHOMER SHOMER ;
```

**Calls:** `SHOMER`.

### `DOGOVER` — TERSE

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

### `DOHOMER` — TERSE

`( -- )`

DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer;

```text
: DOHOMER BALLERASE SHOMER CLRBLST SBO STRINGOFFTIMER BZERO ;
```

**Calls:** `BALLERASE`, `SHOMER`, `CLRBLST`, `SBO`, `BZERO`.

### `DOSAFE` — TERSE

`( -- )`

DOSAFE combines music/text.

```text
: DOSAFE MSAFE SSAFE ;
```

**Calls:** `MSAFE`, `SSAFE`.

### `DOSBALL` — TERSE

`( x y options -- )`

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSBALL BALLS B@ DUP 31 = IF DROP SBALL1 ELSE 32 = IF SBALL2
ELSE SBALL3 THEN THEN ;
```

**Calls:** `B@`, `DUP`, `DROP`, `SBALL1`, `SBALL2`, `SBALL3`.

**Used by:** `BALLTIME`.

### `DOSOUT` — TERSE

`( x y options -- )`

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSOUT OUTS B@ DUP 31 = IF DROP SOUT1 ELSE 32 = IF SOUT2
ELSE SOUT3 THEN THEN ;
```

**Calls:** `B@`, `DUP`, `DROP`, `SOUT1`, `SOUT2`, `SOUT3`.

**Used by:** `OUTTIME`.

### `DOSSTRIKE` — TERSE

`( x y options -- )`

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSSTRIKE STRIKES B@ 31 = IF SSTRIKE1 ELSE SSTRIKE2 THEN ;
```

**Calls:** `B@`, `SSTRIKE1`, `SSTRIKE2`.

**Used by:** `STRIKETIME`.

### `DP1` — TERSE

`( -- )`

Display the one-coin deposit prompt.

```text
: DP1 1A00 2C00 828 A" DEPOSIT 1 COIN" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `TCNT`.

### `DP12CN` — TERSE

`( -- )`

Uses B@ and SPOST to compose game logic.

```text
: DP12CN CNSW1 B@ IF 300 2800 828
A" DEPOSIT 2 COINS TO CONTINUE THIS GAME" SPOST
ELSE DP1CN THEN ;
```

**Calls:** `B@`, `SPOST`, `DP1CN`.

**Used by:** `CHKGMCNT`.

### `DP1CN` — TERSE

`( -- )`

Uses SPOST to compose game logic.

```text
: DP1CN 400 2800 828 A" DEPOSIT 1 COIN TO CONTINUE THIS GAME"
SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DP12CN`, `DPCN`, `SORRY`.

### `DPCN` — TERSE

`( -- )`

Wait for next coin.

```text
: DPCN ( wait for next coin )
DP1CN CREDITS BZERO FF TWAIT FF TWAIT DP1CN CREDITS B@ IF
GAMEOVER BZERO ELSE LINN BZERO UPCRED BONE THEN CREDITS 1+B! ;
```

**Calls:** `DP1CN`, `BZERO`, `TWAIT`, `B@`, `BONE`, `B!`.

**Used by:** `TF`.

### `dpost` — TERSE

`( x y options nibble -- x y options )`

dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.

```text
: dpost 0F AND OVER 4000 AND 4000 XOR OVER OR IF 30 +
SWAP BFFF AND SWAP ELSE DROP 20 THEN cpost ;
```

**Calls:** `AND`, `OVER`, `XOR`, `OR`, `SWAP`, `DROP`, `cpost`.

**Used by:** `NPOST`.

### `DTC` — TERSE

`( -- )`

DTC selects decimal and invokes the host editor.

```text
{ : DTC } DECIMAL EDIT { ; }
```

**Calls:** `DECIMAL`.

### `DURATION` — TERSE

`( duration -- )`

Emit a note-duration command.

```text
{ : DURATION } 1 B, B, { ; }
```

**Used by:** `ANOTE`, `BNOTE`, `CNOTE`, `REST`.

### `DWAIT` — TERSE

`( limit -- )`

DWAIT runs nested loops with interrupts enabled and disables them on return;

```text
: DWAIT EI 0 DO FF 0 DO LOOP LOOP DI ;
```

**Calls:** `EI`, `DO`, `LOOP`, `DI`.

**Used by:** `DOCHGS`, `STRTBALL`.

### `F=` — TERSE

`( -- )`

Declare a forward word with the game's source shorthand.

```text
{ : F= } FORWARD { ; }
```

### `F1STLS` — TERSE

`( -- )`

Select the first-base left-side action.

```text
: F1STLS F1STPT F1STL1ST NOACTPA 0 ;
```

### `F1STRS` — TERSE

`( -- )`

Select the first-base right-side action.

```text
: F1STRS F1STPT F1STR1ST NOACTPA 0 ;
```

### `F2NDLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: F2NDLS DPHIT BONE HRPT HL1ST F2NDL2ND 0 ;
```

**Calls:** `BONE`.

### `F2NDRS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: F2NDRS DPHIT BONE HRPT HL1ST F2NDR2ND 0 ;
```

**Calls:** `BONE`.

### `F3RDLS` — TERSE

`( -- )`

Select the third-base left-side action.

```text
: F3RDLS F3RDLSS F3RDL3RD 1 ;
```

### `F3RDRS` — TERSE

`( -- )`

Select the third-base right-side action.

```text
: F3RDRS NOACTPA F3RDR3RD 1 ;
```

### `FBLLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: FBLLS NOACTPA FBLL3RD
1 THROWAROUND BONE FOUL BONE ;
```

**Calls:** `BONE`.

### `FBLRS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: FBLRS FOUL BONE THROWAROUND BONE NOACTPA
FBLR1ST NOACTPA 0 ;
```

**Calls:** `BONE`.

### `FIELDWRT` — TERSE

`( -- )`

Write field outline.

```text
: FIELDWRT ( write field outline )
FINDEX BZERO GETF GETF GETF GETF DLINE
8 0 DO GETF GETF CNLINE LOOP ;
```

**Calls:** `BZERO`, `GETF`, `DLINE`, `DO`, `CNLINE`, `LOOP`.

**Used by:** `FL`.

### `FL` — TERSE

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

### `FLDDST,` — TERSE

`( -- )`

Emit the fielder destination command.

```text
{ : FLDDST, } 7 B, { ; }
```

### `FLFILL` — TERSE

`( -- )`

FLFILL fills the background while allowing interrupts;

```text
: FLFILL EI 0 4000 3C00 FILL DI ;
```

**Calls:** `EI`, `FILL`, `DI`.

**Used by:** `FL`, `INSTRC`.

### `FLSHME` — TERSE

`( -- )`

FLSHME executes only a nonzero address whose top two bits are clear;

```text
: FLSHME FLSHWHO @ DUP 0C000 AND 0= OVER 0 <> AND IF EX
```

**Calls:** `DUP`, `AND`, `OVER`, `EX`.

**Used by:** `FLSHWUP`.

### `FLSHTON` — TERSE

`( -- )`

FLSHTON saves a callback and starts its timer.

```text
: FLSHTON FLSHWHO ! FLSHON BONE FLSHTIME BONE ;
```

**Calls:** `BONE`.

**Used by:** `DOCHGS`, `INSCN`, `WUPTON`.

### `FOULTIME` — TERSE

`( -- )`

Foulball process.

```text
: FOULTIME ( foulball process )
SFOUL STRIKES DUP B@ 32 = IF DROP
ELSE 1+B! SBO THEN ;
```

**Calls:** `SFOUL`, `DUP`, `B@`, `DROP`, `B!`, `SBO`.

### `FOWR` — TERSE

`( -- )`

Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.

```text
{ : FOWR } FORWARD { ; }
```

### `FSSLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: FSSLS DPHIT BONE FSSLSS HR3RD 1 ;
```

**Calls:** `BONE`.

### `FSSRS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: FSSRS DPHIT BONE FSSRSS HR3RD 1 ;
```

**Calls:** `BONE`.

### `GETF` — TERSE

`( -- index field-byte )`

GETF fetches FIELD bytes sequentially;

```text
: GETF FINDEX B@ FIELD B@ FINDEX 1+B! ;
```

**Calls:** `B@`, `B!`.

**Used by:** `FIELDWRT`.

### `GRNDRACTION` — TERSE

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

### `GRNDRHIT` — TERSE

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

### `HITDST` — TERSE

`( -- )`

Chooses hit location.

```text
: HITDST ( chooses hit location ) VUPDATE# BL BZERO
THWBLPA VPLAYACTPC BL ! 82 VSTATUS BL B! ( vact )
BAL THWPA ! 2800 VX BL ! AD00 VY BL ! ;
```

**Calls:** `BZERO`, `B!`.

**Used by:** `GRNDRHIT`, `OUTFLDHIT`.

### `HLLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HLLS HITOF BONE NOACTPA HLL3RD 1 ;
```

**Calls:** `BONE`.

### `HLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HLS HITOF BONE HLSS HL3RD 1 ;
```

**Calls:** `BONE`.

### `HMS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HMS HITOF BONE HMSS HR3RD 1 ;
```

**Calls:** `BONE`.

### `HOM` — TERSE

`( -- )`

HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;

```text
: HOM 4200 7A00 828 48 CPOST 4400 7F00 8828 A" OME" SPOST ;
```

**Calls:** `CPOST`, `SPOST`.

**Used by:** `FL`, `WUPWRT`.

### `HRBY2` — TERSE

`( -- )`

HRBY2 halves HRAT.

```text
: HRBY2 HRAT B@ 2/ HRAT B! ;
```

**Calls:** `B@`, `B!`.

**Used by:** `WHBODDS`.

### `HRLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HRLS HITOF BONE HRPT HRL1ST NOACTPA 0 ;
```

**Calls:** `BONE`.

### `HRS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HRS HITOF BONE HRPT HR1ST HR2ND 0 ;
```

**Calls:** `BONE`.

### `I'` — TERSE

`( -- )`

Emit the target's indexed immediate reference.

```text
{ : I' } 0CD B, ]'[ { 2+ } , B, { ; }
```

### `ICODE` — TERSE

`( -- )`

Defines the native interrupt handler and emits its Z80 register-save prologue in the host compiler.

```text
{ : ICODE } CODE { [ } ASM { ] } NEXT XTHL, D PUSH, B PUSH,
PSW PUSH, M A MOV, INLIN OUT, H INX, IPNT SHLD,
EXX, EXAF, H PUSH, D PUSH, B PUSH, PSW PUSH,
ASM { ; }
```

**Calls:** `ASM`.

### `INEXT` — TERSE

`( -- )`

INEXT emits a jump to IEX;

```text
{ : INEXT } { LIT [ } ' IEX { , } ASM { ] } JMP, { ; }
```

**Calls:** `LIT`, `IEX`, `ASM`.

### `INLOG` — TERSE

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

### `INNODDS` — TERSE

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

### `INSCN` — TERSE

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

### `INSTRC` — TERSE

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

### `INSWAIT` — TERSE

`( count -- )`

INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.

```text
: INSWAIT EI BEGIN FF 0 DO LOOP
14 INP 33 AND 33 < IF DROP 1 INSOUT BONE THEN
1- DUP 0= END DROP DI ;
```

**Calls:** `EI`, `BEGIN`, `DO`, `LOOP`, `INP`, `AND`, `DROP`, `BONE`, `DUP`, `END`, `DI`.

**Used by:** `INSTRC`.

### `INTERRUPTS>` — TERSE

`( -- )`

Emit the interrupt-vector dispatch jump.

```text
{ : INTERRUPTS> } { [ } ASM { ] } JMP, { ; }
```

**Calls:** `ASM`.

### `INTHIGHRES` — TERSE

`( -- )`

Intialize screen for commercial mode.

```text
: INTHIGHRES ( intialize screen for commercial mode )
1 8 OUTP ( con,com port ) C0 0A OUTP ( vertbl )
0 9 OUTP ( horzcb ) ;
```

**Calls:** `OUTP`.

**Used by:** `PUP`.

### `ISCN` — TERSE

`( -- )`

Display the V15 instruction message.

```text
: ISCN 1C00 1000 828 A" V15" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `INSCN`.

### `LABLE` — TERSE

`( -- )`

Provide the original source's label-definition alias.

```text
{ : LABLE } DATA { ; }
```

### `LCB,` — TERSE

`( -- )`

Uses ACT, and DEACT, to compose game logic.

```text
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

### `LDINFLDPA` — TERSE

`( -- )`

LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.

```text
: LDINFLDPA VPLAYACTPC 3RD ! VPLAYACTPC SS ! VPLAYACTPC 2ND !
VPLAYACTPC 1ST ! VPLAYACTPC PT ! ;
```

**Used by:** `GRNDRACTION`, `OUTFLDHIT`.

### `LDPC` — TERSE

`( -- )`

Emit/load the music program-counter value.

```text
{ : LDPC } 3 B, , { ; }
```

**Used by:** `QUIT`.

### `LDPCC` — TERSE

`( -- )`

Emit/load a music program-counter command.

```text
{ : LDPCC } 2 B, , { ; }
```

### `LK,` — TERSE

`( -- )`

Uses BACT, and DEACT, to compose game logic.

```text
{ : LK, } 0 0 0 BACT, DEACT, { ; }
```

**Calls:** `BACT,`, `DEACT,`.

### `LSETTFCOOR` — TERSE

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

### `MASTER` — TERSE

`( -- )`

Define the game's master music stream.

```text
{ : MASTER } 10 B, B, { ; }
```

**Used by:** `CMAJOR`.

### `MBALL` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MBALL 0 BALLSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `BALLTIME`.

### `MCANNON` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MCANNON 0 CANNONSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `SCOREME`, `STARTMUSIC`.

### `MCOIN` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MCOIN 0 COINSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `CHKCOIN1`, `CHKCOIN2`.

### `MCVOLS` — TERSE

`( volume -- )`

Emit music-channel volume values.

```text
{ : MCVOLS } 15 B, B, { ; }
```

**Used by:** `CMAJOR`, `QUIET`, `REST`, `^`.

### `MFENCE` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MFENCE 0 FENCESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `STARTMUSIC`.

### `MFOUL` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MFOUL 0 FOULSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `GRNDRHIT`.

### `MHIT` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MHIT 0 CRACKSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `INLOG`.

### `MLINN` — TERSE

`( -- )`

Mark last inning.

```text
: MLINN ( mark last inning ) DI PX0 2A A5 4D 3 RECTAN LINN B@
DUP DUP IF 0A < IF 8F0 SWAP 0 DO 200 + LOOP ELSE DROP 1CF0
THEN A500 IMRK 301 828 WRITE ELSE DROP DROP THEN EI ;
```

**Calls:** `DI`, `PX0`, `RECTAN`, `B@`, `DUP`, `SWAP`, `DO`, `LOOP`, `DROP`, `WRITE`, `EI`.

**Used by:** `CREDARROW`, `DOGOVER`, `PLRSELECT`, `STRTBALL`, `TF`.

### `MOPENERS` — TERSE

`( -- )`

Uses PMUSIC to compose game logic.

```text
: MOPENERS 0 TAKE-ME PMUSIC ;
```

**Calls:** `PMUSIC`.

**Used by:** `STRTBALL`.

### `MOUT` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MOUT 0 OUTSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `OUTTIME`.

### `MSAFE` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MSAFE 0 SAFESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `DOSAFE`.

### `MSTRIKE` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MSTRIKE 0 STRIKESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `STRIKETIME`.

### `MYAH` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MYAH 0 CHEERSSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `BALLTIME`, `OUTTIME`, `SCOREME`, `STARTMUSIC`.

### `NOISE` — TERSE

`( -- )`

Emit a noise/sound command.

```text
{ : NOISE } 17 B, B, { ; }
```

**Used by:** `CMAJOR`.

### `NOTES` — TERSE

`( -- )`

Uses ATONE and BTONE to compose game logic.

```text
{ : NOTES } ATONE BTONE CNOTE { ; }
```

**Calls:** `ATONE`, `BTONE`, `CNOTE`.

### `NPOST` — TERSE

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

### `OFFDST,` — TERSE

`( -- )`

Emit the outfielder destination command.

```text
{ : OFFDST, } 9 B, { ; }
```

### `OFMOT,` — TERSE

`( -- )`

Emit the outfield motion command.

```text
{ : OFMOT, } 5 B, { ; }
```

### `ON1ST,` — TERSE

`( -- )`

Emit the first-base playaction command.

```text
{ : ON1ST, } 2 B, { ; }
```

### `ON2ND,` — TERSE

`( -- )`

Emit the second-base playaction command.

```text
{ : ON2ND, } 3 B, { ; }
```

### `ON3RD,` — TERSE

`( -- )`

Emit the third-base playaction command.

```text
{ : ON3RD, } 4 B, { ; }
```

### `OUTFLDHIT` — TERSE

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

### `OUTLINE` — TERSE

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

### `OUTTIME` — TERSE

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

### `PLRCHK` — TERSE

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

### `PLRSELECT` — TERSE

`( -- )`

Select singel player or 2 player.

```text
: PLRSELECT ( select singel player or 2 player )
DI FL CHKPLRS BONE
SPLR SELECT BZERO MLINN ;
```

**Calls:** `DI`, `FL`, `BONE`, `SPLR`, `BZERO`, `MLINN`.

**Used by:** `TERSECHK`.

### `PPOST` — TERSE

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

### `PUP` — TERSE

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

### `PX0` — TERSE

`( -- )`

Emit zero/white pixel patterns and define PX1/PX0 to select them.

```text
: PX0 0 PXT0 PXTYPE ! ;
```

**Used by:** `DOGOVER`, `MLINN`.

### `PX1` — TERSE

`( -- )`

Emit zero/white pixel patterns and define PX1/PX0 to select them.

```text
: PX1 0 PXT1 PXTYPE ! ;
```

**Used by:** `DOGOVER`, `FL`.

### `QUIET` — TERSE

`( -- )`

Uses ABVOLS and MCVOLS to compose game logic.

```text
{ : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`, `ATONE`, `BTONE`, `CTONE`, `QUIT`.

### `QUIT` — TERSE

`( -- )`

Uses HERE and LDPC to compose game logic.

```text
{ : QUIT } 4 B, HERE LDPC { ; }
```

**Calls:** `HERE`, `LDPC`.

**Used by:** `QUIET`.

### `RCB,` — TERSE

`( -- )`

Uses ACT, and DEACT, to compose game logic.

```text
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

### `RDRNDNTE` — TERSE

`( -- )`

Emit a randomized note with a rest interval.

```text
{ : RDRNDNTE } 0 B, B, B, B, { ; }
```

### `RECLINE` — TERSE

`( x y width height options -- x y width height options )`

Draws a horizontal rectangle row without consuming the five retained rectangle arguments.

```text
: RECLINE 4 PICK 4 PICK 2DUP SWAP 6 PICK + SWAP DLINE ;
```

**Calls:** `DUP`, `SWAP`, `DLINE`.

**Used by:** `RECTAN`.

### `RECTAN` — TERSE

`( x y width height -- )`

In X, Y, X length, Y length, pxtype set.

```text
: RECTAN ( in X, Y, X length, Y length, pxtype set )
BEGIN RECLINE ROT 1+ ROT ROT 1- DUP 0= END DROP DROP DROP
DROP ;
```

**Calls:** `BEGIN`, `RECLINE`, `ROT`, `DUP`, `END`, `DROP`.

**Used by:** `DOGOVER`, `FL`, `MLINN`, `SCRS`.

### `REST` — TERSE

`( duration -- )`

Insert a silent music interval.

```text
{ : REST } 0 ABVOLS 0 MCVOLS 0A DURATION { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`, `DURATION`.

### `REST,` — TERSE

`( -- )`

Emit a resting playaction record.

```text
{ : REST, } NBD , B, 0 , 0 , { ; }
```

### `RETPA` — TERSE

`( -- )`

Return to position pa.

```text
: RETPA ( return to position pa )
VMAGIC PT 8 0 DO DUP DUP VPLAYACTPC + TFPA S! VSTATUS + DUP
B@ 80 OR F7 AND SB! VLENGTH + LOOP DROP ;
```

**Calls:** `DO`, `DUP`, `S!`, `B@`, `OR`, `AND`, `SB!`, `LOOP`, `DROP`.

**Used by:** `STFLD`.

### `RNDNTE` — TERSE

`( -- )`

Emit a randomized musical note.

```text
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
```

### `RRRNDNTE` — TERSE

`( -- )`

Emit a sequence of randomized notes.

```text
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
```

### `RUN1CHK1ST` — TERSE

`( -- occupancy-code vector-address )`

Selects the runner vector for an occupied first-base slot, or delegates to the next occupancy test.

```text
: RUN1CHK1ST VWBASE R1 B@ 1 = IF 1 VMAGIC R2
ELSE RUN1CHK2ND THEN ;
```

**Calls:** `B@`, `RUN1CHK2ND`.

**Used by:** `WHBODDS`.

### `RUN1CHK2ND` — TERSE

`( -- occupancy-code vector-address )`

Chooses the next runner vector according to runner 1's second-base occupancy.

```text
: RUN1CHK2ND VWBASE R1 B@ 2 = IF RUN2CHK12ND
ELSE RUN2CHK THEN ;
```

**Calls:** `B@`, `RUN2CHK12ND`, `RUN2CHK`.

**Used by:** `RUN1CHK1ST`.

### `RUN2CHK` — TERSE

`( -- occupancy-code vector-address )`

Returns the runner code and vector for the next open base.

```text
: RUN2CHK VWBASE R2 B@ 0 = IF 3 VMAGIC R2
ELSE RUN2CHK1ST THEN ;
```

**Calls:** `B@`, `RUN2CHK1ST`.

**Used by:** `RUN1CHK2ND`.

### `RUN2CHK12ND` — TERSE

`( -- occupancy-code vector-address )`

Returns runner 2 or 3 vector based on second-base occupancy.

```text
: RUN2CHK12ND VWBASE R2 B@ 0 = IF 2 VMAGIC R2
ELSE 4 VMAGIC R3 THEN ;
```

**Calls:** `B@`.

**Used by:** `RUN1CHK2ND`.

### `RUN2CHK1ST` — TERSE

`( -- occupancy-code vector-address )`

Chooses runner 3 or delegates according to runner 2's first-base state.

```text
: RUN2CHK1ST VWBASE R2 B@ 1 = IF 6 VMAGIC R3
ELSE RUN3CHK THEN ;
```

**Calls:** `B@`, `RUN3CHK`.

**Used by:** `RUN2CHK`.

### `RUN3CHK` — TERSE

`( -- occupancy-code vector-address )`

Returns runner 3 or 4 code/vector from third runner's occupancy.

```text
: RUN3CHK VWBASE R3 B@ 0 = IF 7 VMAGIC R3 ELSE 5 VMAGIC R4
THEN ;
```

**Calls:** `B@`.

**Used by:** `RUN2CHK1ST`.

### `RUNDST,` — TERSE

`( -- )`

Emit the runner destination command.

```text
{ : RUNDST, } 8 B, { ; }
```

### `S!` — TERSE

`( address value -- )`

Store cell with address-first arguments.

```text
: S! SWAP ! ;
```

**Calls:** `SWAP`.

**Used by:** `LSETTFCOOR`, `OUTTIME`, `RETPA`.

### `S10` — TERSE

`( -- )`

S10 starts INTERRUPTS0 through ISTART;

```text
: S10 INTERRUPTS0 ISTART ;
```

**Calls:** `ISTART`.

**Used by:** `PUP`, `STARTMUSIC`.

### `S11` — TERSE

`( -- )`

S11 starts INTERRUPTS1.

```text
: S11 INTERRUPTS1 ISTART ;
```

**Calls:** `ISTART`.

**Used by:** `STARTMUSIC`.

### `SB!` — TERSE

`( address value -- )`

Store byte with address-first arguments.

```text
: SB! SWAP B! ;
```

**Calls:** `SWAP`, `B!`.

**Used by:** `BONE`, `BZERO`, `LSETTFCOOR`, `OUTTIME`, `RETPA`, `WUPGO`.

### `SBALL1` — TERSE

`( x y options -- )`

Draw the BALL 1 message.

```text
: SBALL1 2200 2ROT A" BALL 1" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

### `SBALL2` — TERSE

`( x y options -- )`

Draw the BALL 2 message.

```text
: SBALL2 2200 2ROT A" BALL 2" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

### `SBALL3` — TERSE

`( x y options -- )`

Draw the BALL 3 message.

```text
: SBALL3 2200 2ROT A" BALL 3" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

### `SBO` — TERSE

`( -- )`

SBO posts the three $30-based count characters at their fixed positions.

```text
: SBO 3700 B000 308 BALLS B@ CPOST 3F00 B000 308 STRIKES B@
CPOST 4700 B000 308 OUTS B@ CPOST ;
```

**Calls:** `B@`, `CPOST`.

**Used by:** `BALLTIME`, `DOHOMER`, `FL`, `FOULTIME`, `OUTTIME`, `SSAFE`, `STRIKETIME`.

### `SCOREME` — TERSE

`( -- )`

Plop scores up.

```text
: SCOREME ( plop scores up )
SCORESHOW DUP B@ 2 = IF 900 8C00 4308 SCORE2
ELSE 4300 8C00 4308 SCORE1 THEN 1 NPOST BZERO
HOMERUN B@ IF MCANNON ELSE MYAH THEN ;
```

**Calls:** `DUP`, `B@`, `NPOST`, `BZERO`, `MCANNON`, `MYAH`.

### `SCRERASE` — TERSE

`( -- )`

Erase entire screen.

```text
: SCRERASE ( erase entire screen )
0 4000 3F00 FILL ;
```

**Calls:** `FILL`.

**Used by:** `PUP`.

### `SCRS` — TERSE

`( -- )`

SCRS clears two score rectangles and draws zero score characters.

```text
: SCRS 1F 8A 18 0E RECTAN 107 8A 18 0E RECTAN
B00 8C00 308 30 CPOST 4500 8C00 308 30 CPOST ;
```

**Calls:** `RECTAN`, `CPOST`.

**Used by:** `DOGOVER`, `FL`.

### `SETFDST` — TERSE

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

### `SETTF` — TERSE

`( -- )`

SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

```text
: SETTF DI LSETTFCOOR STFLD SETTFPA EI ;
```

**Calls:** `DI`, `LSETTFCOOR`, `STFLD`, `SETTFPA`, `EI`.

### `SETTFPA` — TERSE

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

### `SFOUL` — TERSE

`( -- )`

Uses ROT and SPOST to compose game logic.

```text
: SFOUL 2400 2ROT A" FOUL " SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `FOULTIME`.

### `SGO` — TERSE

`( -- )`

Uses SPOST to compose game logic.

```text
: SGO 2000 2D00 828 A" GAME OVER" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DOGOVER`, `INSCN`, `OUTTIME`, `PUP`, `TF`.

### `SHOMER` — TERSE

`( -- )`

Uses ROT and SPOST to compose game logic.

```text
: SHOMER 2300 2ROT A" HOMER" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOEHOMER`, `DOHOMER`.

### `SORRY` — TERSE

`( -- )`

Display the losing-player prompt.

```text
: SORRY 1B00 1000 828 A" TOO BAD I WON" SPOST DP1CN ;
```

**Calls:** `SPOST`, `DP1CN`.

**Used by:** `TF`.

### `SOUT1` — TERSE

`( x y options -- )`

Draw the 1 OUT message.

```text
: SOUT1 2300 2ROT A" 1 OUT" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

### `SOUT2` — TERSE

`( x y options -- )`

Draw the 2 OUT message.

```text
: SOUT2 2200 2ROT A" 2 OUTS" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

### `SOUT3` — TERSE

`( x y options -- )`

Draw the 3 OUT message.

```text
: SOUT3 2200 2ROT A" 3 OUTS" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

### `SPLR` — TERSE

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

### `SPLR12` — TERSE

`( -- )`

SPLR12/SPLR display available player choices;

```text
: SPLR12 1400 2000 828 A" SELECT 1 OR 2 PLAYERS" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `SPLR`.

### `SPOST` — TERSE

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

### `SSAFE` — TERSE

`( x y options -- )`

SSAFE also redraws counts with SBO.

```text
: SSAFE 2400 2ROT A" SAFE " SPOST SBO ;
```

**Calls:** `ROT`, `SPOST`, `SBO`.

**Used by:** `DOSAFE`.

### `SSTRIKE1` — TERSE

`( x y options -- )`

Draw the STRIKE 1 message.

```text
: SSTRIKE1 2000 2ROT A" STRIKE 1" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSSTRIKE`.

### `SSTRIKE2` — TERSE

`( x y options -- )`

Draw the STRIKE 2 message.

```text
: SSTRIKE2 2100 2ROT A" STRIKE 2" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSSTRIKE`.

### `STFLD` — TERSE

`( -- )`

STFLD installs RETPA and TAKEFIELD.

```text
: STFLD RETPA TAKEFIELD BONE ;
```

**Calls:** `RETPA`, `BONE`.

**Used by:** `SETTF`.

### `STP,` — TERSE

`( -- )`

Emit a standing-action record.

```text
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

### `STRIKETIME` — TERSE

`( -- )`

Strike process.

```text
: STRIKETIME ( strike process )
STRIKES DUP 1+B! B@ 33 = IF OUTTIME COUT OLDSTRING B!
ELSE MSTRIKE DOSSTRIKE THEN SBO ;
```

**Calls:** `DUP`, `B!`, `B@`, `OUTTIME`, `MSTRIKE`, `DOSSTRIKE`, `SBO`.

### `STRINGGO` — TERSE

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

### `STRINGPRC` — TERSE

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

### `STRTBALL` — TERSE

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

### `SUP` — TERSE

`( -- )`

SUP posts UP.

```text
: SUP 8C00 8828 A" UP" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `FL`, `STRTBALL`.

### `SW-30` — TERSE

`( random dx -- sector )`

Maps a −30° swing and horizontal direction into a baseball sector code.

```text
: SW-30 DUP IF 1 = IF ( x=1 ) IF F1STR ELSE HR THEN
ELSE ( x=-1 ) IF HR ELSE F2NDL THEN THEN
ELSE ( x= 0 ) DROP DUP IF 1- IF F2NDL ELSE F2NDR THEN
ELSE DROP HR THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### `SW-45` — TERSE

`( random dx -- sector )`

Maps a −45° swing and horizontal direction into a baseball sector code.

```text
: SW-45 DUP IF 1 = IF ( x=1 ) DROP FBR
ELSE ( x = -1 ) IF HRL ELSE F1STL THEN THEN
ELSE ( X=0 ) DROP DUP IF 1- IF F1STL ELSE F1STR THEN
ELSE DROP HRL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### `SW-90` — TERSE

`( a b -- )`

SW-90 ignores direction/random inputs and returns the far-right foul sector.

```text
: SW-90 DROP DROP FBR ;
```

**Calls:** `DROP`.

### `SW+30` — TERSE

`( random dx -- sector )`

Maps a +30° swing and horizontal direction into a baseball sector code.

```text
: SW+30 DUP IF 1 = IF ( x=1 ) IF HL ELSE FSSR THEN
ELSE ( x= -1 ) IF F3RDL ELSE HL THEN THEN
ELSE ( x=0 ) DROP DUP IF 1- IF FSSR ELSE FSSL THEN
ELSE DROP HL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### `SW+45` — TERSE

`( random dx -- sector )`

Maps a +45° swing and horizontal direction into a baseball sector code.

```text
: SW+45 DUP IF 1 = IF ( x=1 ) IF HLL ELSE F3RDR THEN
ELSE ( x= -1 ) DROP FBL THEN
ELSE ( x=0 ) DROP DUP IF 1- IF F3RDR ELSE F3RDL THEN
ELSE DROP HLL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### `SW+90` — TERSE

`( a b -- )`

SW+90 always returns foul-left after dropping its inputs.

```text
: SW+90 DROP DROP FBL ;
```

**Calls:** `DROP`.

### `SW0` — TERSE

`( random dx -- sector )`

Maps a central swing and horizontal direction into a baseball sector code.

```text
: SW0 DUP IF 1 = IF ( x=1 ) IF F2NDR ELSE HM THEN
ELSE ( x=-1 ) IF FSSL ELSE HM THEN THEN
ELSE ( x=0 ) DROP IF HM ELSE F2NDR THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### `SWALK` — TERSE

`( x y options -- )`

Uses ROT and SPOST to compose game logic.

```text
: SWALK 2400 2ROT A" WALK" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `BALLTIME`.

### `TCNT` — TERSE

`( -- )`

TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits.

```text
: TCNT 700 1800 828 A" TO CONTINUE GAME AT END OF INNING" SPOST
CNSW12 B@ IF CREDITS B@ IF DP1 ELSE 0F00 2C00 828
A" DEPOSIT 1 COIN PER PLAYER" SPOST THEN ELSE DP1 THEN ;
```

**Calls:** `SPOST`, `B@`, `DP1`.

**Used by:** `TF`.

### `TERSECHK` — TERSE

`( -- )`

Look at terse routine flags.

```text
: TERSECHK ( look at terse routine flags ) 0 RND DROP
TFTIME B@ IF TF THEN SELECT B@ IF PLRSELECT THEN
CHKPLRS B@ IF PLRCHK THEN UPCRED B@ IF CREDARROW THEN ;
```

**Calls:** `RND`, `DROP`, `B@`, `TF`, `PLRSELECT`, `PLRCHK`, `CREDARROW`.

**Used by:** `SENTRY`.

### `TF` — TERSE

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

### `THW,` — TERSE

`( -- )`

Emit the throw command.

```text
{ : THW, } 0B B, { ; }
```

### `TWAIT` — TERSE

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

### `V` — TERSE

`( -- )`

Uses VARIABLE to compose game logic.

```text
{ : V } VARIABLE { ; }
```

**Calls:** `VARIABLE`.

**Used by:** `V=`.

### `V=` — TERSE

`( -- )`

Uses V and VARIABLE to compose game logic.

```text
{ : V= } 0 VARIABLE { ; }
```

**Calls:** `V`, `VARIABLE`.

### `VIBS` — TERSE

`( value -- )`

Emit a vibrato setting.

```text
{ : VIBS } 14 B, B, { ; }
```

### `VIS` — TERSE

`( -- )`

HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;

```text
: VIS 700 7A00 828 56 CPOST 900 7F00 8828 A" ISITOR" SPOST ;
```

**Calls:** `CPOST`, `SPOST`.

**Used by:** `FL`, `WUPWRT`.

### `WHBODDS` — TERSE

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

### `WTHW,` — TERSE

`( -- )`

Emit the wait-for-throw command.

```text
{ : WTHW, } 0D B, { ; }
```

### `WUPGO` — TERSE

`( -- )`

WUPGO activates WHOSUP with runner/automatic-forward flags;

```text
: WUPGO WHOSUP @ DUP VSTATUS + 81 SB! VRSTAT + 3 SB! ;
```

**Calls:** `DUP`, `SB!`.

**Used by:** `BALLTIME`, `GRNDRHIT`, `OUTFLDHIT`.

### `WUPTON` — TERSE

`( -- )`

WUPTON installs WUPWRT.

```text
: WUPTON ' WUPWRT FLSHTON ;
```

**Calls:** `WUPWRT`, `FLSHTON`.

**Used by:** `CHKFLSHSTAY`.

### `WUPWRT` — TERSE

`( -- )`

Write whos up for flash.

```text
: WUPWRT ( write whos up for flash )
PTAUTOTM PLYR1UP B@ IF HOM ELSE VIS THEN ;
```

**Calls:** `PTAUTOTM`, `B@`, `HOM`, `VIS`.

**Used by:** `BUTTONCHK`, `CHKFLSHSTAY`, `WUPTON`.

### `YOU1ST` — TERSE

`( -- )`

YOU1ST posts the greeting/extra-inning challenge, then continues to 306.

```text
: YOU1ST 1A00 1000 828 A" YOU ARE UP 1ST" SPOST 0F00 3000 828
A" BEAT ME FOR EXTRA INNING" SPOST 1F00 5000 828
A" GOOD LUCK" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `STRTBALL`.

### `ZERORAM` — TERSE

`( -- )`

ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT.

```text
: ZERORAM DI 0 7C30 270 FILL 3 OFTFCNT B! DI ;
```

**Calls:** `DI`, `FILL`, `B!`.

**Used by:** `FL`, `TF`.

### `+LOOP` — native CODE

`( increment -- )`

`Z80 after: Increment consumed; IX loop frame updated or released`

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

### `ALLFLDACT` — native CODE

`( -- )`

`Z80 after: RAM: infield/outfield active flags set; returns NEXT`

Sets all fielders active.

```text
CODE ALLFLDACT ( sets all fielders active )
' INFLDACT CALL, ' OUTFLDACT CALL, NEXT
```

**Calls:** `INFLDACT`, `OUTFLDACT`.

**Used by:** `INLOG`.

### `ANMSEQLOAD` — native CODE

`( -- )`

`Z80 after: IX: vector; RAM: VANMSEQH/L set; returns RET`

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

### `BALLERASE` — native CODE

`( -- )`

`Z80 after: BC, IY preserved; ball cleared; returns NEXT`

BALLERASE preserves BC/IY around native BLERASE and returns to TERSE.

```text
CODE BALLERASE B PUSH, Y PUSHX, BLERASE CALL,
Y POPX, B POP, NEXT
```

**Calls:** `BLERASE`.

**Used by:** `DOHOMER`, `OUTTIME`.

### `BATHIT` — native CODE

`( -- )`

`Z80 after: Updates hit, pitch and swing state; returns to native caller with 'RET'`

He hit it time to get em running.

```text
CODE BATHIT ( he hit it time to get em running )
HITYET STA, DI, DOVERB INLOG
A XRA, HITTIME STA, PITCHTIME STA, ( tractor ball utfld)
SWINGGO STA, EI, RET,
```

**Calls:** `INLOG`.

**Used by:** `SENTRY`.

### `BATHITCHK` — native CODE

`( -- )`

`Z80 after: HL = swing-state pointer; tests bat/ball overlap through table-selected hit window; returns to native caller`

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

### `BATSWING` — native CODE

`( -- )`

`Z80 after: Reads swing counters from RAM, calls 'BATWRITE'/'BATHITCHK', updates swing/strike state`

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

### `BATWRITE` — native CODE

`( -- )`

`Z80 after: HL = swing-state pointer; derives drawing parameters and calls native pattern writer; restores HL`

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

### `BCD+` — native CODE

`( a b -- bcd-sum )`

`Z80 after: HL contains BCD sum, pushed onto parameter stack`

Binary to decimal arithmatic.

```text
CODE BCD+ ( binary to decimal arithmatic )
( in- integer 1 , integer 2 )
( out- bcd sum of integer 1 and 2 )
H POP, D POP, E A MOV, L ADD, DAA, A L MOV,
D A MOV, H ADC, DAA, A H MOV, H PUSH, NEXT
```

### `BLDST` — native CODE

`( -- )`

`Z80 after: Ball-vector update helper: computes motion/destination, handles catch/throw transitions`

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

### `BLMOTION` — native CODE

`( -- )`

`Z80 after: Sets 'VECTPC' to 'TBLPA' via HL; native 'RET'`

Set pc for ram pa table -tractor ball.

```text
CODE BLMOTION ( set pc for ram pa table -tractor ball )
TBLPA H LXI, VECTPC SHLD, RET,
```

### `BLPOSCHK` — native CODE

`( -- )`

`Z80 after: IX = ball vector; checks ball/pitch position, collision flags and destination vector`

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

### `BMUSIC` — native CODE

`( music-address -- )`

`Z80 after: HL receives music address; note state conditionally initialized`

BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

```text
CODE BMUSIC PRIORITY LDA, H POP, A ORA, 0=, IF, loadpc CALL,
NOTETIMER STA, A INR, MULTIPLE STA, THEN, NEXT
```

**Calls:** `loadpc`.

**Used by:** `MBALL`, `MCANNON`, `MCOIN`, `MFENCE`, `MFOUL`, `MHIT`, `MOUT`, `MSAFE`, `MSTRIKE`, `MYAH`.

### `BUTTONCHK` — native CODE

`( -- )`

`Z80 after: Samples controls and updates pitch/run flags; saves/restores IX/IY on native calls`

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

### `CHKCAUGHT` — native CODE

`( -- )`

`Z80 after: Interrupt-side caught-ball handler; saves native vector registers and changes runner/score flags`

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

### `CHKGROUNDER` — native CODE

`( -- )`

`Z80 after: IX = ball vector; adjusts velocity using grounder lookup; preserves HL across table lookup`

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

### `CHKSCRTIME` — native CODE

`( -- )`

`Z80 after: Scores play events from RAM, updates runner/base and score state; temporary IX stack saves balance on return`

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

### `CLRBLST` — native CODE

`( -- )`

`Z80 after: Stores ASCII zero ($30) into ball and strike counters; 'NEXT'`

CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.

```text
CODE CLRBLST 30 A MVI, BALLS STA, STRIKES STA, NEXT
```

**Used by:** `BALLTIME`, `DOHOMER`, `OUTTIME`.

### `cnline` — native CODE

`( -- )`

`Z80 after: Saves BC, IX and IY around 'VECTOR'; restores registers before 'NEXT'`

Calls vector line write.

```text
CODE cnline ( calls vector line write )
B PUSH, Y PUSHX, X PUSHX, 0ED B, 57 B, PSW PUSH, DI,
VECTOR CALL, PSW POP, X POPX, Y POPX, B POP,
PE, IF, EI, THEN, NEXT
```

**Calls:** `VECTOR`.

**Used by:** `CNLINE`, `DLINE`.

### `COMPDE` — native CODE

`( -- )`

`Z80 after: DE ← −DE; HL preserved`

COMPDE applies the same operation to DE while preserving HL.

```text
CODE COMPDE H PUSH, XCHG, ' COMPHL CALL, XCHG, H POP, RET,
```

**Calls:** `COMPHL`.

**Used by:** `CHKGROUNDER`.

### `COMPHL` — native CODE

`( -- )`

`Z80 after: HL ← −HL`

Compliments HL.

```text
CODE COMPHL ( compliments HL )
H A MOV, CMA, A H MOV, L A MOV, CMA, A L MOV, H INX, RET,
```

**Used by:** `COMPDE`, `DIVHLBY4`, `DSTCALC`, `MULTHLBY4`, `OFBLCHK`, `TBLVEL`.

### `COUNT` — native CODE

`( address -- address+1 character )`

`Z80 after: Character returned with high-bit terminator stripped; address advanced by one`

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

### `cpost` — native CODE

`( x y options char -- x' y options )`

`Z80 after: Consumes drawing position, options and character; returns updated x and retained state`

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

### `DEACTIVATE` — native CODE

`( -- )`

`Z80 after: IX addresses vector; resets active status bit, writes 'SAMEDLT', returns`

Reset active bit in status.

```text
CODE DEACTIVATE ( reset active bit in status )
VACT VSTATUS X RESX, 1 A MVI, SAMEDLT STA, RET,
```

### `DI` — native CODE

`( -- )`

`Z80 after: Maskable interrupts disabled; parameter stack unchanged`

Disable maskable Z80 interrupts.

```z80
_DI:
            di                          ; Disable hardware interrupts
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `CREDARROW`, `DOGOVER`, `DWAIT`, `FLFILL`, `INSWAIT`, `MLINN`, `PLRCHK`, `PLRSELECT`, `PUP`, `SETTF`, `STRTBALL`, `TF`, `TWAIT`, `ZERORAM`.

### `DIVHLBY4` — native CODE

`( -- )`

`Z80 after: HL ← signed(HL / 4)`

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

### `DO` — native CODE

`( limit start -- )`

`Z80 after: Two parameter-stack cells consumed; IX return stack holds start, limit and loop IP`

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

### `DSTCALC` — native CODE

`( -- )`

`Z80 after: HL ← dy; DE ← dx; BC ← action selector`

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

### `DSTLD` — native CODE

`( -- )`

`Z80 after: IX input vector; HL ← destination X; DE ← destination Y`

DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.

```text
CODE DSTLD
VDSTXH X H LDX, VDSTXL X L LDX, VDSTYH X D LDX,
VDSTYL X E LDX,
RET,
```

**Used by:** `BLDST`, `FLDDST`.

### `EI` — native CODE

`( -- )`

`Z80 after: Maskable interrupts enabled; parameter stack unchanged`

Enable maskable Z80 interrupts.

```z80
_EI:
            ei                          ; Enable hardware interrupts
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Calls:** `SWAN`.

**Used by:** `CREDARROW`, `DWAIT`, `FL`, `FLFILL`, `INSWAIT`, `MLINN`, `PLRCHK`, `PUP`, `SETTF`, `TF`, `TWAIT`.

### `EIDI` — native CODE

`( -- )`

`Z80 after: Emits 'EI' then 'DI', returns through 'NEXT'`

EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers.

```text
CODE EIDI EI, DI, NEXT
```

**Used by:** `DOGOVER`, `FL`.

### `EMUSIC` — native CODE

`( -- )`

`Z80 after: Initializes music state and returns through 'NEXT'`

EMUSIC selects ENDMUSIC and initializes timing/repetition to one;

```text
CODE EMUSIC 0 ENDMUSIC H LXI, loadpc CALL, 1 A MVI, NOTETIMER
STA, MULTIPLE STA, NEXT ( CALL EMUSIC AS AN INIT IN PROGRAM )
```

**Calls:** `loadpc`.

**Used by:** `PUP`.

### `EX` — native CODE

`( -- )`

`Z80 after: Emits 'RET' instruction and continues through 'NEXT'`

EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.

```text
CODE EX C9 B, NEXT
```

**Used by:** `FLSHME`, `GRNDRACTION`, `GRNDRHIT`, `STRINGGO`.

### `FILL` — native CODE

`( value address count -- )`

`Z80 after: Bytes [address..address+count−1] filled with value; parameter stack consumed`

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

### `FLDDST` — native CODE

`( -- )`

`Z80 after: IX = fielder vector; computes velocity/destination and updates playaction state through native helpers`

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

### `FLSHOFF` — native CODE

`( -- )`

`Z80 after: Preserves BC; clears flash state and calls 'FLSHWUP' before 'NEXT'`

FLSHOFF disables flashing and services cleanup under DI.

```text
CODE FLSHOFF B PUSH, A XRA, FLSHON STA, DI, FLSHWUP CALL,
B POP, NEXT
```

**Calls:** `FLSHWUP`.

**Used by:** `CHKFLSHSTAY`, `DOCHGS`, `DOGOVER`, `OUTTIME`.

### `FMIRROR` — native CODE

`( -- )`

`Z80 after: Preserves BC while mirroring field graphics and returns through 'NEXT'`

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

### `HITRUN` — native CODE

`( -- )`

`Z80 after: Selects runner activation and throw target via indexed native dispatch; restores BC before 'NEXT'`

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

### `HOMERCHK` — native CODE

`( y x hit-type random-x random-y -- )`

`Z80 after: Five TERSE inputs consumed; ball/homer state updated`

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

### `I` — native CODE

`( -- index )`

`Z80 after: Loop index copied from IX return-stack frame to parameter stack; IX frame intact`

Fetch the innermost counted-loop index.

```z80
_Rat:
            ld      l,(ix+$00)          ; Read Return Stack top LSB
            ld      h,(ix+$01)          ; Read Return Stack top MSB
            push    hl                  ; Push copied word onto parameter stack
            jp      (iy)                ; Return to TERSE inner interpreter
```

**Used by:** `NPOST`, `PPOST`.

### `IEX` — native CODE

`( saved-interrupt-frame -- )`

`Z80 after: Saved interrupt register frame restored, interrupt enabled`

Restores two saved Z80 register banks, enables interrupts, then returns from the interrupt bridge; this is an interrupt-frame convention, not an ordinary TERSE data-word call.

```text
CODE IEX PSW POP, B POP, D POP, H POP, EXX, EXAF,
PSW POP, B POP, D POP, H POP, EI, RET,
```

**Used by:** `INEXT`.

### `INDEXW` — native CODE

`( -- )`

`Z80 after: A,HL input table index/base; DE ← indexed word`

Call routine A- disp HL- table add.

```text
CODE INDEXW ( call routine A- disp HL- table add )
( for indexing into table only )
PSW PUSH, A SLAR, ( 2* A )
L ADD, A L MOV, 0 A MVI, H ADC, A H MOV,
M E MOV, H INX, M D MOV, H DCX, PSW POP, RET,
```

**Used by:** `ANMSEQLOAD`, `BATHITCHK`, `BATWRITE`, `CHKGROUNDER`, `HITRUN`, `HOMERCHK`, `LOADANM`, `OPCODECHK`, `PATFETCH`, `TAKEOFF`, `THROWANIM`, `THROWBALL`.

### `INFIELD` — native CODE

`( -- )`

`Z80 after: Draws infield stripes/pitcher mound; preserves BC and IX around row-rendering helpers`

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

### `INFLDACT` — native CODE

`( -- )`

`Z80 after: Sets HL to first infield vector, A to five records, and calls 'SETACT'`

Set infielders active.

```text
CODE INFLDACT ( set infielders active )
VSTATUS PT H LXI, 5 A MVI, ' SETACT CALL, RET,
```

**Calls:** `SETACT`.

**Used by:** `ALLFLDACT`.

### `ISTART` — native CODE

`( interrupt-address -- )`

`Z80 after: RAM[IPNT] ← interrupt handler address; mode IM2`

ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.

```text
CODE ISTART DI, H POP, IPNT SHLD, 8 A MVI, INMOD OUT,
IPNT { SWAB } A MVI, STAI, IPNT A MVI,
INFBK OUT, IM2, EI, NEXT
```

**Used by:** `S10`, `S11`.

### `KILLOF` — native CODE

`( -- )`

`Z80 after: Clears outfield delta words and control flag; selects standing playaction`

Stop outfield tractor ball control.

```text
CODE KILLOF ( stop outfield tractor ball control )
0 H LXI, OFDX SHLD, OFDY SHLD, STND H LXI, OFPA SHLD,
A XRA, OFTBLGO STA, RET,
```

**Used by:** `BLDST`.

### `LOADANM` — native CODE

`( -- )`

`Z80 after: HL ← next playaction cursor; IX vector updated`

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

### `LOOP` — native CODE

`( -- )`

`Z80 after: Parameter stack unchanged; IX loop index incremented, loop frame retained or released`

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

### `MULTHLBY4` — native CODE

`( -- )`

`Z80 after: HL ← signed(4×HL)`

MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign.

```text
CODE MULTHLBY4
7 H BIT, PSW PUSH, ' COMPHL CNZ, L SLAR, H RALR,
L SLAR, H RALR, PSW POP, ' COMPHL CNZ, RET,
```

**Calls:** `COMPHL`.

**Used by:** `BATHITCHK`, `OFBLCHK`.

### `MUSCPU` — native CODE

`( -- )`

`Z80 after: Music tick handler; updates note timer, decodes music commands and drives sound ports`

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

### `NDUP` — native CODE

`( x1 … xn n -- x1 … xn x1 … xn )`

`Z80 after: Parameter stack retains original n cells and appends a copy; count removed`

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

### `OFFFDST` — native CODE

`( -- )`

`Z80 after: IX = active fielder vector; selects off-field destination, computes movement deltas`

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

### `OFLDTBL` — native CODE

`( -- )`

`Z80 after: Assigns outfielder playaction table, invokes 'OUTFLDACT', and returns`

OFLDTBL gives all three outfielders OFTBLPA, activates them and returns;

```text
CODE OFLDTBL OFTBLPA H LXI, A XRA, OFTOTBL STA,
DI, VPLAYACTPC RF SHLD, VPLAYACTPC CF SHLD, VPLAYACTPC LF SHLD,
' OUTFLDACT CALL, EI, RET,
```

**Calls:** `OUTFLDACT`.

**Used by:** `SENTRY`.

### `OFMOTION` — native CODE

`( -- )`

`Z80 after: Sets 'VECTPC' from 'OFPA', conditional on action opcode and IX status`

Set pc for ram pa table -tractor ball.

```text
CODE OFMOTION ( set pc for ram pa table -tractor ball )
OFPA { 1+ } LDA, 4 CPI, ( stnd ? )
=, IF, VACT VSTATUS X RESX, THEN,
OFPA H LXI, VECTPC SHLD, RET,
```

### `ON1ST` — native CODE

`( -- )`

`Z80 after: RAM[FLDON1ST] ← IX`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON1ST X PUSHX, H POP, FLDON1ST SHLD, RET,
```

### `ON2ND` — native CODE

`( -- )`

`Z80 after: RAM[FLDON2ND] ← IX`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON2ND X PUSHX, H POP, FLDON2ND SHLD, RET,
```

### `ON3RD` — native CODE

`( -- )`

`Z80 after: RAM[FLDON3RD] ← IX`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON3RD X PUSHX, H POP, FLDON3RD SHLD, RET,
```

### `OPCODECHK` — native CODE

`( -- )`

`Z80 after: HL = playaction cursor; looks up opcode handler and executes with a native return trampoline`

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

### `OUTFLDACT` — native CODE

`( -- )`

`Z80 after: Sets HL to first outfield vector, A to three records, and calls 'SETACT'`

Sets outfielders active.

```text
CODE OUTFLDACT ( sets outfielders active )
VSTATUS LF H LXI, 3 A MVI, ' SETACT CALL, RET,
```

**Calls:** `SETACT`.

**Used by:** `ALLFLDACT`, `CMPOF`, `OFLDTBL`.

### `PACTLOAD` — native CODE

`( -- )`

`Z80 after: IX = target vector; reads playaction stream, dispatches opcodes, advances vector PC`

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

### `PATFETCH` — native CODE

`( -- )`

`Z80 after: IX = vector; selects animation-frame pattern from sequence table and stores its address`

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

### `PERSPECTIVE` — native CODE

`( -- )`

`Z80 after: IX = vector; derives perspective class from Y and updates redraw flag if class changed`

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

### `PLAYACT` — native CODE

`( -- )`

`Z80 after: Reads 'VECTIX', preserves BC/IX, advances vector animation/update through helper routines`

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

### `PMUSIC` — native CODE

`( music-address -- )`

`Z80 after: HL consumes music address; RAM priority/timers updated`

PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer.

```text
CODE PMUSIC H POP, loadpc CALL, 1 A MVI, MULTIPLE STA,
PRIORITY STA, NOTETIMER STA, NEXT
```

**Calls:** `loadpc`.

**Used by:** `MOPENERS`.

### `PTAUTOTM` — native CODE

`( -- )`

`Z80 after: Calls 'TIMEDCR' for pitch timeout and returns through 'NEXT'`

Pitch auto timer.

```text
CODE PTAUTOTM ( pitch auto timer )
TIMEOUT H LXI, FLDCLR LDA, A ANA, TIMEDCR CZ, NEXT
```

**Calls:** `TIMEDCR`.

**Used by:** `WUPWRT`.

### `RESETRUNNERS` — native CODE

`( -- )`

`Z80 after: Reorders runner vector records by occupancy and resets final runner slot`

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

### `RND` — native CODE

`( upper-bound -- random-value )`

`Z80 after: Upper bound consumed and scaled random result pushed; random seed advanced`

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

### `RUNDST` — native CODE

`( -- )`

`Z80 after: IX = runner record; processes base occupancy, auto-forward and movement state`

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

### `SENTRY` — native CODE

`( -- )`

`Z80 after: Native game scheduler; calls tick services, invokes 'TERSECHK', then loops`

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

### `SETACT` — native CODE

`( -- )`

`Z80 after: HL,A input vector/count; VACT set across records`

Sets avtive bit in status.

```text
CODE SETACT ( sets avtive bit in status )
( in HL-status 1st guy A- # of guys )
VLENGTH D LXI,
BEGIN, VACT M SET, D DAD, A DCR, 0=, END, RET,
```

**Used by:** `INFLDACT`, `OUTFLDACT`.

### `STARTMUSIC` — native CODE

`( -- )`

`Z80 after: Selects event music from state flags and dispatches music requests`

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

### `strtline` — native CODE

`( x y -- )`

`Z80 after: Pops X and Y to native registers, computes address/line setup; returns via 'NEXT'`

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

### `SWAN` — native CODE

`( value -- nibble-swapped-value )`

`Z80 after: High byte unchanged; low byte rotated four bits; result replaces input`

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

### `TBALLPITCH` — native CODE

`( -- )`

`Z80 after: Computes pitcher/trackball velocity updates and writes movement fields`

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

### `THROWANIM` — native CODE

`( -- )`

`Z80 after: Prepares ball/throw vector data; saves/restores IX and IY around native update`

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

### `THROWBALL` — native CODE

`( -- )`

`Z80 after: Builds the pitch or throw state, updates ball vector and runner decisions`

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

### `THWANMSET` — native CODE

`( -- )`

`Z80 after: Reads thrower vector from IX and stores 'WHOTHROWS'; initializes animation flags`

Set up throw animation.

```text
CODE THWANMSET ( set up throw animation )
X PUSHX, H POP, WHOTHROWS SHLD, ( save who throws )
BLERASE CALL, 1 A MVI, INAIR STA,
THROWANM STA, RET, ( set for sentry call )
```

**Calls:** `BLERASE`.

**Used by:** `WAITTHRW`.

### `TIMER` — native CODE

`( -- )`

`Z80 after: Scans game timers with 'TIMEDCR' and invokes native event handlers`

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

### `VECTOR` — native CODE

`( -- )`

`Z80 after: IX = vector record; advances positions and applies hardware limits`

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

### `VERASE` — native CODE

`( -- )`

`Z80 after: IX = vector record; derives previous pattern/screen address and calls native 'writep'`

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

### `VWRITE` — native CODE

`( -- )`

`Z80 after: IX = vector record; derives pattern position, calls 'reloff'/'relabs'/'writep', saves erase address`

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

### `WAIT` — native CODE

`( -- )`

`Z80 after: A = native delay count; preserves value over inner wait loop and returns`

Given A wait period stop every thing.

```text
CODE WAIT ( given A wait period stop every thing )
BEGIN, PSW PUSH, 0FF A MVI, BEGIN, A DCR, 0=, END,
PSW POP, A DCR, 0=, END, RET,
```

### `WAITTHRW` — native CODE

`( -- )`

`Z80 after: Configures throw animation and wait state; A used for flags, native 'RET'`

Sets flag for 1stbaseman to wait throw.

```text
CODE WAITTHRW ( sets flag for 1stbaseman to wait throw )
' THWANMSET CALL, BASESTATUS LDA, 5 CPI, RZ, A XRA,
THROWANM STA, 20 A MVI, WAITTHROW STA, RET,
```

**Calls:** `THWANMSET`.

### `WRITE` — native CODE

`( x y pattern dimensions options -- )`

`Z80 after: Stack consumes x,y,pattern,dimensions,options; framebuffer updated`

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

### `WRITR` — native CODE

`( x y relative-pattern options -- )`

`Z80 after: Stack consumes x,y,relative-pattern,options; framebuffer updated`

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

### `AUTOR1` — native SUBR

`( -- )`

`Z80 after: Writes automatic-run and active flags into runner 1 status fields`

AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

```text
SUBR AUTOR1 3 A MVI, VRSTAT R1 STA, 81 A MVI, VSTATUS R1 STA,
RET, ( sets vauto , vforw , vact , vrun )
```

**Used by:** `FRO1`, `FRO12`, `FRO123`, `RO1`, `RO12`, `RO123`, `RO13`, `RO2`, `RO23`, `RO3`.

### `AUTOR2` — native SUBR

`( -- )`

`Z80 after: Writes automatic-run and active flags into runner 2 status fields`

Run second-runner automation logic.

```text
SUBR AUTOR2 3 A MVI, VRSTAT R2 STA, 81 A MVI, VSTATUS R2 STA,
RET,
```

**Used by:** `FRO12`, `FRO123`, `FRO13`, `RO12`, `RO123`, `RO13`, `RO23`.

### `AUTOR3` — native SUBR

`( -- )`

`Z80 after: Writes automatic-run and active flags into runner 3 status fields`

Run third-runner automation logic.

```text
SUBR AUTOR3 3 A MVI, VRSTAT R3 STA, 81 A MVI, VSTATUS R3 STA,
RET,
```

**Used by:** `FRO123`, `RO123`.

### `BLERASE` — native SUBR

`( -- )`

`Z80 after: Saves/restores IX; addresses ball vector, erases image, clears active bit`

Erases ball.

```text
SUBR BLERASE ( erases ball )
X PUSHX, VMAGIC BL X LXIX, ' VERASE CALL, VACT VSTATUS X RESX,
X POPX, ( stop ball ) NOBOD H LXI, VPAT BL SHLD, RET,
```

**Calls:** `VERASE`.

**Used by:** `BALLERASE`, `BATHITCHK`, `THWANMSET`.

### `CHKATBS` — native SUBR

`( -- )`

`Z80 after: A = vector status flags, E = accumulator; increments E if active and not at base`

Check if active player at base in- A vstatus.

```text
SUBR CHKATBS ( check if active player at base in- A vstatus )
VACT A BIT, RZ, VATBS A BIT, RNZ, E INR, RET,
```

**Used by:** `THROWANIM`.

### `CHKCOIN1` — native SUBR

`( -- )`

`Z80 after: Reads coin-door 1 via 'debounce'; updates credits and signals coin event`

Chk door 1 for coin drop.

```text
SUBR CHKCOIN1 ( chk door 1 for coin drop )
CNTM1 LDA, A ANA, 0=, IF, ( waiting for coin )
1 A MVI, 1020 D LXI, 11FE H LXI, debounce CALL,
A ANA, RZ, CNTM1 STA, 20 OUT, CREDITS H LXI, M INR,
UPCRED STA, A XRA, SPBON STA, DOVERB MCOIN RET,
```

**Calls:** `debounce`, `MCOIN`.

### `CHKCOIN2` — native SUBR

`( -- )`

`Z80 after: Reads coin-door 2 via 'debounce'; updates credits with door/DIP-specific increments`

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

### `CMPOF` — native SUBR

`( -- )`

`Z80 after: Selects outfielder vector in IX, computes deltas and activates outfield control`

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

### `COLORBAND` — native SUBR

`( saved-interrupt-frame -- )`

`Z80 after: Interrupt state restored, palette ports written`

COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled.

```text
SUBR COLORBAND NEXT XTHL, PSW PUSH, M A MOV, INLIN OUT,
H INX, IPNT SHLD, FLSHSTAY LDA, A ANA, 0=, IF,
6C A MVI, 3 OUT, 7 A MVI, 1 OUT, THEN,
PSW POP, H POP, EI, RET, ( palette only: preserve AF/HL )
```

### `debounce` — native SUBR

`( -- )`

`Z80 after: A = input port, HL = bit mask, DE = sampling duration; returns A = accepted pulse/zero`

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

### `FETCH` — native SUBR

`( -- )`

`Z80 after: HL ← MUSICPC; A ← byte at HL`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR FETCH MUSPC LHLD, M A MOV, RET,
```

**Used by:** `HLOAD`, `MUSCPU`.

### `FLSHWUP` — native SUBR

`( -- )`

`Z80 after: Saves/restores IX and IY while updating flash timer and callback`

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

### `FNBB` — native SUBR

`( -- )`

`Z80 after: Native no-op helper; immediate 'RET'`

Native game routine; source body below.

```text
SUBR FNBB RET,
```

### `FONTUNPACK` — native SUBR

`( -- )`

`Z80 after: HL = packed font source; expands bytes into 'FONTWORK'; HL returns its address`

FONTUNPACK reads two packed bytes and starts a five-row unpack loop.

```text
SUBR FONTUNPACK B PUSH, M E MOV, H INX, M D MOV,
0 FONTWORK H LXI, 5 B MVI, LABEL FNTLP E A MOV, 7 ANI,
RRC, RRC, RRC, A M MOV, H INX,
D SRLR, E RARR, D SRLR, E RARR, D SRLR, E RARR,
FNTLP DJNZ, B POP, 0 FONTWORK H LXI, RET,
```

**Used by:** `cpost`.

### `FRO1` — native SUBR

`( -- )`

`Z80 after: Calls 'AUTOR1'; native 'RET'`

Uses AUTOR1 to process game state.

```text
SUBR FRO1 AUTOR1 CALL, RET,
```

**Calls:** `AUTOR1`.

### `FRO12` — native SUBR

`( -- )`

`Z80 after: Calls 'AUTOR1', 'AUTOR2'; native 'RET'`

Uses AUTOR1 and AUTOR2 to process game state.

```text
SUBR FRO12 AUTOR1 CALL, AUTOR2 CALL, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`.

### `FRO123` — native SUBR

`( -- )`

`Z80 after: Calls 'AUTOR1', 'AUTOR2', 'AUTOR3'; native 'RET'`

Uses AUTOR1 and AUTOR2 to process game state.

```text
SUBR FRO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `AUTOR3`.

### `FRO13` — native SUBR

`( -- )`

`Z80 after: Writes runner-1 status and calls 'AUTOR2'; native 'RET'`

Uses AUTOR2 to process game state.

```text
SUBR FRO13 VSTATUS R1 STA, AUTOR2 CALL, RET,
```

**Calls:** `AUTOR2`.

### `FRO2` — native SUBR

`( -- )`

`Z80 after: Writes runner-1 status field; native 'RET'`

Native game routine; source body below.

```text
SUBR FRO2 VSTATUS R1 STA, RET,
```

### `FRO23` — native SUBR

`( -- )`

`Z80 after: Writes runner-1 and runner-2 status; native 'RET'`

Native game routine; source body below.

```text
SUBR FRO23 VSTATUS R1 STA, VSTATUS R2 STA, RET,
```

### `FRO3` — native SUBR

`( -- )`

`Z80 after: Writes runner-1 status field; native 'RET'`

Native game routine; source body below.

```text
SUBR FRO3 VSTATUS R1 STA, RET,
```

### `HLOAD` — native SUBR

`( -- )`

`Z80 after: HL ← zero-extended music byte`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR HLOAD FETCH CALL, INCPC CALL, 0 H MVI, A L MOV, RET,
```

**Calls:** `FETCH`, `INCPC`.

**Used by:** `MUSCPU`.

### `IFSPAN` — native SUBR

`( -- )`

`Z80 after: Uses incoming A and C for fielder span calculation; returns native register results`

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

### `INCPC` — native SUBR

`( -- )`

`Z80 after: RAM[MUSPC] ← RAM[MUSPC]+1`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR INCPC MUSPC LHLD, H INX, MUSPC SHLD, RET,
```

**Used by:** `HLOAD`, `MUSCPU`.

### `loadpc` — native SUBR

`( -- )`

`Z80 after: RAM[MUSPC], RAM[STARTPC] ← HL`

loadpc installs MUSPC and STARTPC.

```text
SUBR loadpc MUSPC SHLD, STARTPC SHLD, RET,
```

**Used by:** `BMUSIC`, `EMUSIC`, `PMUSIC`.

### `LVRSTAT` — native SUBR

`( -- )`

`Z80 after: A = desired runner status byte; stores it across all four runner status fields`

Load vstat for all runners in- A value.

```text
SUBR LVRSTAT ( load vstat for all runners in- A value )
VRSTAT R1 STA, VRSTAT R2 STA, VRSTAT R3 STA, VRSTAT R4 STA,
RET,
```

**Used by:** `BLPOSCHK`, `CHKCAUGHT`, `RUNDST`.

### `NBB` — native SUBR

`( -- )`

`Z80 after: Native no-op helper; immediate 'RET'`

NBB is the empty-bases no-op.

```text
SUBR NBB RET,
```

### `OFBLCHK` — native SUBR

`( -- )`

`Z80 after: D = maximum catch distance; checks nearby ball/player vectors, returns native result in A`

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

### `PCJUMP` — native SUBR

`( -- )`

`Z80 after: RAM[MUSPC] ← 16-bit branch target`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR PCJUMP MUSPC LHLD, M E MOV, H INX, M D MOV,
MUSPC SDED, RET,
```

**Used by:** `MUSCPU`.

### `relabs` — native SUBR

`( -- )`

`Z80 after: BC ← expansion/shift; HL ← screen address`

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

### `reloff` — native SUBR

`( -- )`

`Z80 after: DE ← x offset; HL ← y offset; IY ← absolute pattern`

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

### `RO1` — native SUBR

`( -- )`

`Z80 after: Activates runner 1 and selects a native runner pointer in BC, conditional on double-play state`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO1 AUTOR1 CALL, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R2 B LXI, RET,
```

**Calls:** `AUTOR1`, `SETDBLPLAY`.

### `RO12` — native SUBR

`( -- )`

`Z80 after: Activates runners 1 and 2; selects the next runner pointer in BC`

RO12 activates both forced runners, selecting a double-play or ordinary target;

```text
SUBR RO12 AUTOR1 CALL, AUTOR2 CALL,
VMAGIC R2 B LXI, DPHIT LDA, A ANA, SETDBLPLAY JNZ,
VMAGIC R3 B LXI, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `SETDBLPLAY`.

### `RO123` — native SUBR

`( -- )`

`Z80 after: Activates runners 1–3; selects runner pointer in BC, conditional on double play`

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
SUBR RO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL,
VMAGIC R3 B LXI, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R1 B LXI, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `AUTOR3`, `SETDBLPLAY`.

### `RO13` — native SUBR

`( -- )`

`Z80 after: Activates runner 2, then chooses runner pointer and double-play path`

RO13 handles first-and-third occupancy and may branch through SETDBLPLAY.

```text
SUBR RO13 AUTOR2 CALL, DPHIT LDA, A ANA,
VMAGIC R2 B LXI,
0<>, IF, AUTOR1 CALL, SETDBLPLAY JMP, THEN,
VMAGIC R3 B LXI, RET,
```

**Calls:** `AUTOR2`, `AUTOR1`, `SETDBLPLAY`.

### `RO2` — native SUBR

`( -- )`

`Z80 after: Activates runner 1 conditionally; returns BC = runner 2 vector`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO2 HLSIDE LDA, A ANA, 0=, IF,
AUTOR1 CALL, THEN, VMAGIC R2 B LXI, RET,
```

**Calls:** `AUTOR1`.

### `RO23` — native SUBR

`( -- )`

`Z80 after: Selects runner 3 in BC, conditionally activating runners 1 and 2`

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
SUBR RO23 VMAGIC R3 B LXI, DPHIT LDA, A ANA,
0<>, IF, AUTOR1 CALL, HLSIDE LDA, A ANA, AUTOR2 CZ, THEN,
RET,
```

**Calls:** `AUTOR1`, `AUTOR2`.

### `RO3` — native SUBR

`( -- )`

`Z80 after: Selects runner 2 in BC, conditionally activates runner 1`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO3 VMAGIC R2 B LXI, DPHIT LDA, A ANA,
AUTOR1 CNZ, RET,
```

**Calls:** `AUTOR1`.

### `SETDBLPLAY` — native SUBR

`( -- )`

`Z80 after: HL identifies runner on first; sets 'DBLPLAY' flag`

Sets up double play HL-guy on 1st.

```text
SUBR SETDBLPLAY ( sets up double play HL-guy on 1st )
1 A MVI, DBLPLAY STA, RET,
```

**Used by:** `RO1`, `RO12`, `RO123`, `RO13`.

### `TAKEOFF` — native SUBR

`( -- )`

`Z80 after: Dispatches runner-activation handler via BC/table and native return trampoline`

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

### `TBALLPRC` — native SUBR

`( -- )`

`Z80 after: Samples trackball port and computes tractor-ball/outfielder velocity state`

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

### `TBLVEL` — native SUBR

`( -- )`

`Z80 after: HL addresses current velocity byte, D = maximum; returns signed velocity increment in HL`

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

### `TIMEDCR` — native SUBR

`( -- )`

`Z80 after: A ← 1 if timer reached zero, otherwise 0`

HL-timer add if goes to zero return 1 else 0.

```text
SUBR TIMEDCR ( HL-timer add if goes to zero return 1 else 0 )
M A MOV, A ANA, RZ, ( allready zero returns false change )
A DCR, A M MOV, A ANA, 0=, IF, A INR, ( true change )
ELSE, A XRA, THEN, RET,
```

**Used by:** `PTAUTOTM`, `TIMER`.

### `TOOFCK` — native SUBR

`( -- )`

`Z80 after: Decrements outfielder timeout and invokes 'CMPOF' if still active`

Time out outfield check.

```text
SUBR TOOFCK ( time out outfield check )
TOOF# H LXI, M DCR, 0<>, IF, FF A MVI, TOOF STA,
ELSE, CMPOF CALL, EI, 1 A MVI, TOOFF STA, THEN, RET,
```

**Calls:** `CMPOF`.

**Used by:** `TIMER`.

### `WALKOVER` — native SUBR

`( -- )`

`Z80 after: Sets 'CAUGHT' and 'THROWAROUND' flags to one`

Walked runner at base.

```text
SUBR WALKOVER ( walked runner at base )
1 A MVI, CAUGHT STA, THROWAROUND STA, RET,
```

**Used by:** `TIMER`.

### `write` — native SUBR

`( -- )`

`Z80 after: IY,BC,DE,HL input drawing state; frame buffer updated`

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

### `writep` — native SUBR

`( IY=patadr BC=ex/mag+shf HL=scradr --- )`

`Z80 after: native return; register outputs not established from this entry`

Software write with pattern size on pattern.

```text
SUBR writep ( software write with pattern size on pattern )
( IY=patadr BC=ex/mag+shf HL=scradr --- )
0 Y E LDX, ( X size ) Y INXX,
0 Y D LDX, ( Y size ) Y INXX, write JMP,
```

**Calls:** `write`.

**Used by:** `BATWRITE`, `VERASE`, `VWRITE`, `WRITR`.

### `BASE!` — TERSE

`( base -- )`

Set the number base.

```text
{ : BASE! } BASE ! { ; }
```

### `BASE@` — TERSE

`( -- base )`

Fetch the current number base.

```text
{ : BASE@ } BASE @ { ; }
```

## Source notes

The catalog reproduces source implementations where present, including native Z80 routines and TERSE colon definitions. Host/compiler words whose own implementation is outside the supplied Extra Bases source are shown with an actual Extra Bases usage example and explicitly identified as host vocabulary. Stack signatures are taken from documented or source-verifiable behavior; native words show their parameter-stack effects and the observed Z80 register/memory outcomes together; entries lacking full register preservation verification must be read as observed effects, not a complete clobber contract. Source callers are static references, not runtime execution counts.
