# Extra Bases — TERSE Word Catalog

This catalog identifies TERSE words used or defined in Extra Bases, with their stack effects, functions, and implementations.

## TERSE runtime and inherited words (34)

| Word / stack | Function |
| --- | --- |
| <a href="#---shared">-</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;difference&nbsp;)</code> | Subtract the top value from the preceding value. |
| <a href="#--shared">!</a><br><code>(&nbsp;value&nbsp;address&nbsp;--&nbsp;)</code> | Store one 16-bit cell. |
| <a href="#--shared-1">@</a><br><code>(&nbsp;address&nbsp;--&nbsp;value&nbsp;)</code> | Fetch one 16-bit cell. |
| <a href="#--shared-2">*</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;product&nbsp;)</code> | Multiply two stack values. |
| <a href="#--shared-3">/</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;quotient&nbsp;)</code> | Divide the preceding stack value by the top value. |
| <a href="#--shared-4">+</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;sum&nbsp;)</code> | Add two stack values. |
| <a href="#--shared-5">&lt;</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code> | Compare whether the preceding value is less than the top value. |
| <a href="#--shared-6">=</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code> | Compare two values for equality. |
| <a href="#--shared-7">&gt;</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;flag&nbsp;)</code> | Compare whether the preceding value is greater than the top value. |
| <a href="#0--shared">0=</a><br><code>(&nbsp;n&nbsp;--&nbsp;flag&nbsp;)</code> | Return a condition indicating zero. |
| <a href="#2dup--shared">2DUP</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;a&nbsp;b&nbsp;a&nbsp;b&nbsp;)</code> | Duplicate the top two stack cells. |
| <a href="#and--shared">AND</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code> | Bitwise AND of two values. |
| <a href="#array--shared">ARRAY</a><br><code>(&nbsp;size&nbsp;--&nbsp;)</code> | Allocate/name an indexed cell array from a the size. |
| <a href="#b--shared">B!</a><br><code>(&nbsp;byte&nbsp;address&nbsp;--&nbsp;)</code> | Store one byte. |
| <a href="#b--shared-1">B@</a><br><code>(&nbsp;address&nbsp;--&nbsp;byte&nbsp;)</code> | Fetch one byte. |
| <a href="#barray--shared">BARRAY</a><br><code>(&nbsp;size&nbsp;--&nbsp;)</code> | Allocate/name an indexed byte array from a the size. |
| <a href="#begin--shared">BEGIN</a><br><code>(&nbsp;--&nbsp;)</code> | Immediate XC wrapper that records a loop's object address. |
| <a href="#code--shared">CODE</a><br><code>(&nbsp;--&nbsp;)</code> | Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry. |
| <a href="#constant--shared">CONSTANT</a><br><code>(&nbsp;value&nbsp;--&nbsp;)</code> | Define a constant from a value. |
| <a href="#decimal--shared">DECIMAL</a><br><code>(&nbsp;--&nbsp;)</code> | Select radix ten for parsing subsequent source numbers. |
| <a href="#drop--shared">DROP</a><br><code>(&nbsp;x&nbsp;--&nbsp;)</code> | Discard the top stack cell. |
| <a href="#dup--shared">DUP</a><br><code>(&nbsp;x&nbsp;--&nbsp;x&nbsp;x&nbsp;)</code> | Duplicate the top stack cell. |
| <a href="#else--shared">ELSE</a><br><code>(&nbsp;--&nbsp;)</code> | Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch. |
| <a href="#end--shared">END</a><br><code>(&nbsp;flag&nbsp;--&nbsp;)</code> | Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true. |
| <a href="#hex--shared">HEX</a><br><code>(&nbsp;--&nbsp;)</code> | Select radix sixteen for parsing subsequent source numbers. |
| <a href="#if--shared">IF</a><br><code>(&nbsp;flag&nbsp;--&nbsp;)</code> | Immediate XC wrapper that emits a conditional target branch through XC-IF. |
| <a href="#lit--shared">LIT</a><br><code>(&nbsp;--&nbsp;value;&nbsp;inline&nbsp;cell&nbsp;)</code> | Compiler literal mechanism used by INEXT's host macro. |
| <a href="#or--shared">OR</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code> | Bitwise inclusive OR of two values. |
| <a href="#over--shared">OVER</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;a&nbsp;b&nbsp;a&nbsp;)</code> | Copy the second stack cell to the top. |
| <a href="#rot--shared">ROT</a><br><code>(&nbsp;a&nbsp;b&nbsp;c&nbsp;--&nbsp;b&nbsp;c&nbsp;a&nbsp;)</code> | Rotate the top three stack cells. |
| <a href="#swap--shared">SWAP</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;b&nbsp;a&nbsp;)</code> | Exchange the top two stack cells. |
| <a href="#then--shared">THEN</a><br><code>(&nbsp;--&nbsp;)</code> | Immediate XC wrapper that resolves a saved target branch destination. |
| <a href="#variable--shared">VARIABLE</a><br><code>(&nbsp;--&nbsp;)</code> | Allocate/name a cell variable with the initial value in this dialect. |
| <a href="#xor--shared">XOR</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;result&nbsp;)</code> | Bitwise exclusive OR of two values. |

## Extra Bases colon definitions (201)

| Word / stack | Function |
| --- | --- |
| <a href="#--terse">]'[</a><br><code>(&nbsp;--&nbsp;)</code> | Source-level compiler/TERSE definition shown below. |
| <a href="#--terse-1">^</a><br><code>(&nbsp;--&nbsp;)</code> | Uses ABVOLS and MCVOLS to compose game logic. |
| <a href="#interrupts--terse">&lt;INTERRUPTS</a><br><code>(&nbsp;--&nbsp;)</code> | Mark the start of interrupt data. |
| <a href="#abvols--terse">ABVOLS</a><br><code>(&nbsp;volume&nbsp;--&nbsp;)</code> | Emit the music volume command. |
| <a href="#act--terse">ACT,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit a playaction record. |
| <a href="#anote--terse">ANOTE</a><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code> | Emit a channel A note followed by its duration. |
| <a href="#atone--terse">ATONE</a><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code> | Emit tone setting for channel A. |
| <a href="#bact--terse">BACT,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit a ball-action record. |
| <a href="#balltime--terse">BALLTIME</a><br><code>(&nbsp;--&nbsp;)</code> | Balls process. |
| <a href="#bldst--terse">BLDST,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the ball destination command. |
| <a href="#blmot--terse">BLMOT,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the ball motion command. |
| <a href="#bnote--terse">BNOTE</a><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code> | Emit a channel B note followed by its duration. |
| <a href="#bone--terse">BONE</a><br><code>(&nbsp;address&nbsp;--&nbsp;)</code> | Store byte value 1. |
| <a href="#btone--terse">BTONE</a><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code> | Emit tone setting for channel B. |
| <a href="#bv--terse">BV</a><br><code>(&nbsp;--&nbsp;)</code> | Define a named byte variable. |
| <a href="#bv--terse-1">BV=</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BV to compose game logic. |
| <a href="#bzero--terse">BZERO</a><br><code>(&nbsp;address&nbsp;--&nbsp;)</code> | Store byte value 0. |
| <a href="#c--terse">C=</a><br><code>(&nbsp;value&nbsp;--&nbsp;)</code> | Uses CONSTANT to compose game logic. |
| <a href="#chgs--terse">CHGS</a><br><code>(&nbsp;--&nbsp;)</code> | CHGS posts CHANGE SIDES; |
| <a href="#chkflshstay--terse">CHKFLSHSTAY</a><br><code>(&nbsp;--&nbsp;)</code> | When isccp turn off check for wupwrt. |
| <a href="#chkgmcnt--terse">CHKGMCNT</a><br><code>(&nbsp;--&nbsp;credits&nbsp;)</code> | CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte. |
| <a href="#cmajor--terse">CMAJOR</a><br><code>(&nbsp;--&nbsp;)</code> | Initialize the C-major sound pattern. |
| <a href="#cnline--terse">CNLINE</a><br><code>(&nbsp;--&nbsp;)</code> | CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state. |
| <a href="#cnote--terse">CNOTE</a><br><code>(&nbsp;duration&nbsp;tone&nbsp;--&nbsp;)</code> | Emit a channel C note followed by its duration. |
| <a href="#congr--terse">CONGR</a><br><code>(&nbsp;--&nbsp;)</code> | Display the congratulatory prompt. |
| <a href="#cpost--terse">CPOST</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;char&nbsp;--&nbsp;)</code> | Draw one character at the specified position. |
| <a href="#credarrow--terse">CREDARROW</a><br><code>(&nbsp;--&nbsp;)</code> | Update last inning arrow. |
| <a href="#ctone--terse">CTONE</a><br><code>(&nbsp;tone&nbsp;--&nbsp;)</code> | Emit tone setting for channel C. |
| <a href="#deact--terse">DEACT,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit vector-deactivation command. |
| <a href="#dline--terse">DLINE</a><br><code>(&nbsp;x1&nbsp;y1&nbsp;x2&nbsp;y2&nbsp;--&nbsp;)</code> | Draw a line , given X Y start coor X Y ending coor. |
| <a href="#dochgs--terse">DOCHGS</a><br><code>(&nbsp;--&nbsp;)</code> | DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; |
| <a href="#doehomer--terse">DOEHOMER</a><br><code>(&nbsp;--&nbsp;)</code> | DOEHOMER only posts the text. |
| <a href="#dogover--terse">DOGOVER</a><br><code>(&nbsp;--&nbsp;)</code> | Do game over. |
| <a href="#dohomer--terse">DOHOMER</a><br><code>(&nbsp;--&nbsp;)</code> | DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; |
| <a href="#dosafe--terse">DOSAFE</a><br><code>(&nbsp;--&nbsp;)</code> | DOSAFE combines music/text. |
| <a href="#dosball--terse">DOSBALL</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. |
| <a href="#dosout--terse">DOSOUT</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. |
| <a href="#dosstrike--terse">DOSSTRIKE</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. |
| <a href="#dp1--terse">DP1</a><br><code>(&nbsp;--&nbsp;)</code> | Display the one-coin deposit prompt. |
| <a href="#dp12cn--terse">DP12CN</a><br><code>(&nbsp;--&nbsp;)</code> | Uses B@ and SPOST to compose game logic. |
| <a href="#dp1cn--terse">DP1CN</a><br><code>(&nbsp;--&nbsp;)</code> | Uses SPOST to compose game logic. |
| <a href="#dpcn--terse">DPCN</a><br><code>(&nbsp;--&nbsp;)</code> | Wait for next coin. |
| <a href="#dpost--terse">dpost</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;nibble&nbsp;--&nbsp;x&nbsp;y&nbsp;options&nbsp;)</code> | dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit. |
| <a href="#dtc--terse">DTC</a><br><code>(&nbsp;--&nbsp;)</code> | DTC selects decimal and invokes the host editor. |
| <a href="#duration--terse">DURATION</a><br><code>(&nbsp;duration&nbsp;--&nbsp;)</code> | Emit a note-duration command. |
| <a href="#dwait--terse">DWAIT</a><br><code>(&nbsp;limit&nbsp;--&nbsp;)</code> | DWAIT runs nested loops with interrupts enabled and disables them on return; |
| <a href="#f--terse">F=</a><br><code>(&nbsp;--&nbsp;)</code> | Declare a forward word with the game's source shorthand. |
| <a href="#f1stls--terse">F1STLS</a><br><code>(&nbsp;--&nbsp;)</code> | Select the first-base left-side action. |
| <a href="#f1strs--terse">F1STRS</a><br><code>(&nbsp;--&nbsp;)</code> | Select the first-base right-side action. |
| <a href="#f2ndls--terse">F2NDLS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#f2ndrs--terse">F2NDRS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#f3rdls--terse">F3RDLS</a><br><code>(&nbsp;--&nbsp;)</code> | Select the third-base left-side action. |
| <a href="#f3rdrs--terse">F3RDRS</a><br><code>(&nbsp;--&nbsp;)</code> | Select the third-base right-side action. |
| <a href="#fblls--terse">FBLLS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#fblrs--terse">FBLRS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#fieldwrt--terse">FIELDWRT</a><br><code>(&nbsp;--&nbsp;)</code> | Write field outline. |
| <a href="#fl--terse">FL</a><br><code>(&nbsp;--&nbsp;)</code> | Set up all of background. |
| <a href="#flddst--terse">FLDDST,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the fielder destination command. |
| <a href="#flfill--terse">FLFILL</a><br><code>(&nbsp;--&nbsp;)</code> | FLFILL fills the background while allowing interrupts; |
| <a href="#flshme--terse">FLSHME</a><br><code>(&nbsp;--&nbsp;)</code> | FLSHME executes only a nonzero address whose top two bits are clear; |
| <a href="#flshton--terse">FLSHTON</a><br><code>(&nbsp;--&nbsp;)</code> | FLSHTON saves a callback and starts its timer. |
| <a href="#foultime--terse">FOULTIME</a><br><code>(&nbsp;--&nbsp;)</code> | Foulball process. |
| <a href="#fowr--terse">FOWR</a><br><code>(&nbsp;--&nbsp;)</code> | Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells. |
| <a href="#fssls--terse">FSSLS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#fssrs--terse">FSSRS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#getf--terse">GETF</a><br><code>(&nbsp;--&nbsp;index&nbsp;field-byte&nbsp;)</code> | GETF fetches FIELD bytes sequentially; |
| <a href="#grndraction--terse">GRNDRACTION</a><br><code>—</code> | Given sectnm set up infield action. |
| <a href="#grndrhit--terse">GRNDRHIT</a><br><code>—</code> | Grounder. |
| <a href="#hitdst--terse">HITDST</a><br><code>(&nbsp;--&nbsp;)</code> | Chooses hit location. |
| <a href="#hlls--terse">HLLS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#hls--terse">HLS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#hms--terse">HMS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#hom--terse">HOM</a><br><code>(&nbsp;--&nbsp;)</code> | HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; |
| <a href="#hrby2--terse">HRBY2</a><br><code>(&nbsp;--&nbsp;)</code> | HRBY2 halves HRAT. |
| <a href="#hrls--terse">HRLS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#hrs--terse">HRS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BONE to compose game logic. |
| <a href="#i--terse">I'</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the target's indexed immediate reference. |
| <a href="#icode--terse">ICODE</a><br><code>—</code> | ICODE starts a CODE definition and emits the scheduler/register-save prologue: set INLIN/IPNT, swap alternate register banks and preserve the active register sets. |
| <a href="#inext--terse">INEXT</a><br><code>(&nbsp;--&nbsp;)</code> | INEXT emits a jump to IEX; |
| <a href="#inlog--terse">INLOG</a><br><code>(&nbsp;--&nbsp;)</code> | Infield master logic. |
| <a href="#innodds--terse">INNODDS</a><br><code>(&nbsp;--&nbsp;)</code> | INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state; |
| <a href="#inscn--terse">INSCN</a><br><code>(&nbsp;--&nbsp;)</code> | Insert coin call. |
| <a href="#instrc--terse">INSTRC</a><br><code>(&nbsp;--&nbsp;)</code> | Instructions. |
| <a href="#inswait--terse">INSWAIT</a><br><code>(&nbsp;count&nbsp;--&nbsp;)</code> | INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return. |
| <a href="#interrupts--terse-1">INTERRUPTS&gt;</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the interrupt-vector dispatch jump. |
| <a href="#inthighres--terse">INTHIGHRES</a><br><code>(&nbsp;--&nbsp;)</code> | Intialize screen for commercial mode. |
| <a href="#iscn--terse">ISCN</a><br><code>(&nbsp;--&nbsp;)</code> | Display the V15 instruction message. |
| <a href="#lable--terse">LABLE</a><br><code>(&nbsp;--&nbsp;)</code> | Provide the original source's label-definition alias. |
| <a href="#lcb--terse">LCB,</a><br><code>(&nbsp;--&nbsp;)</code> | Uses ACT, and DEACT, to compose game logic. |
| <a href="#ldinfldpa--terse">LDINFLDPA</a><br><code>(&nbsp;--&nbsp;)</code> | LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain. |
| <a href="#ldpc--terse">LDPC</a><br><code>(&nbsp;--&nbsp;)</code> | Emit/load the music program-counter value. |
| <a href="#ldpcc--terse">LDPCC</a><br><code>(&nbsp;--&nbsp;)</code> | Emit/load a music program-counter command. |
| <a href="#lk--terse">LK,</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BACT, and DEACT, to compose game logic. |
| <a href="#lsettfcoor--terse">LSETTFCOOR</a><br><code>(&nbsp;--&nbsp;)</code> | Set take field coor & status -active , xpand. |
| <a href="#master--terse">MASTER</a><br><code>(&nbsp;--&nbsp;)</code> | Define the game's master music stream. |
| <a href="#mball--terse">MBALL</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#mcannon--terse">MCANNON</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#mcoin--terse">MCOIN</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#mcvols--terse">MCVOLS</a><br><code>(&nbsp;volume&nbsp;--&nbsp;)</code> | Emit music-channel volume values. |
| <a href="#mfence--terse">MFENCE</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#mfoul--terse">MFOUL</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#mhit--terse">MHIT</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#mlinn--terse">MLINN</a><br><code>(&nbsp;--&nbsp;)</code> | Mark last inning. |
| <a href="#mopeners--terse">MOPENERS</a><br><code>(&nbsp;--&nbsp;)</code> | Uses PMUSIC to compose game logic. |
| <a href="#mout--terse">MOUT</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#msafe--terse">MSAFE</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#mstrike--terse">MSTRIKE</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#myah--terse">MYAH</a><br><code>(&nbsp;--&nbsp;)</code> | Uses BMUSIC to compose game logic. |
| <a href="#noise--terse">NOISE</a><br><code>(&nbsp;--&nbsp;)</code> | Emit a noise/sound command. |
| <a href="#notes--terse">NOTES</a><br><code>(&nbsp;--&nbsp;)</code> | Uses ATONE and BTONE to compose game logic. |
| <a href="#npost--terse">NPOST</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;address&nbsp;length&nbsp;--&nbsp;)</code> | Post a bcd number on the screen ; see options. |
| <a href="#offdst--terse">OFFDST,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the outfielder destination command. |
| <a href="#ofmot--terse">OFMOT,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the outfield motion command. |
| <a href="#on1st--terse">ON1ST,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the first-base playaction command. |
| <a href="#on2nd--terse">ON2ND,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the second-base playaction command. |
| <a href="#on3rd--terse">ON3RD,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the third-base playaction command. |
| <a href="#outfldhit--terse">OUTFLDHIT</a><br><code>(&nbsp;--&nbsp;)</code> | Fly ball. |
| <a href="#outline--terse">OUTLINE</a><br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;--&nbsp;)</code> | Creates rectanguler outline. |
| <a href="#outtime--terse">OUTTIME</a><br><code>(&nbsp;--&nbsp;)</code> | Out prc. |
| <a href="#plrchk--terse">PLRCHK</a><br><code>(&nbsp;--&nbsp;)</code> | PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL; |
| <a href="#plrselect--terse">PLRSELECT</a><br><code>(&nbsp;--&nbsp;)</code> | Select singel player or 2 player. |
| <a href="#ppost--terse">PPOST</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;string&nbsp;--&nbsp;x&nbsp;y&nbsp;options&nbsp;)</code> | Draw a counted string and keep drawing coordinates. |
| <a href="#pup--terse">PUP</a><br><code>(&nbsp;--&nbsp;)</code> | Power up routine. |
| <a href="#px0--terse">PX0</a><br><code>(&nbsp;--&nbsp;)</code> | Emit zero/white pixel patterns and define PX1/PX0 to select them. |
| <a href="#px1--terse">PX1</a><br><code>(&nbsp;--&nbsp;)</code> | Emit zero/white pixel patterns and define PX1/PX0 to select them. |
| <a href="#quiet--terse">QUIET</a><br><code>(&nbsp;--&nbsp;)</code> | Uses ABVOLS and MCVOLS to compose game logic. |
| <a href="#quit--terse">QUIT</a><br><code>(&nbsp;--&nbsp;)</code> | Uses HERE and LDPC to compose game logic. |
| <a href="#rcb--terse">RCB,</a><br><code>(&nbsp;--&nbsp;)</code> | Uses ACT, and DEACT, to compose game logic. |
| <a href="#rdrndnte--terse">RDRNDNTE</a><br><code>(&nbsp;--&nbsp;)</code> | Emit a randomized note with a rest interval. |
| <a href="#recline--terse">RECLINE</a><br><code>—</code> | RECLINE derives one horizontal row from retained rectangle arguments. |
| <a href="#rectan--terse">RECTAN</a><br><code>(&nbsp;x&nbsp;y&nbsp;width&nbsp;height&nbsp;--&nbsp;)</code> | In X, Y, X length, Y length, pxtype set. |
| <a href="#rest--terse">REST</a><br><code>(&nbsp;duration&nbsp;--&nbsp;)</code> | Insert a silent music interval. |
| <a href="#rest--terse-1">REST,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit a resting playaction record. |
| <a href="#retpa--terse">RETPA</a><br><code>(&nbsp;--&nbsp;)</code> | Return to position pa. |
| <a href="#rndnte--terse">RNDNTE</a><br><code>(&nbsp;--&nbsp;)</code> | Emit a randomized musical note. |
| <a href="#rrrndnte--terse">RRRNDNTE</a><br><code>(&nbsp;--&nbsp;)</code> | Emit a sequence of randomized notes. |
| <a href="#run1chk1st--terse">RUN1CHK1ST</a><br><code>—</code> | RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; |
| <a href="#run1chk2nd--terse">RUN1CHK2ND</a><br><code>—</code> | RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; |
| <a href="#run2chk--terse">RUN2CHK</a><br><code>—</code> | RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. |
| <a href="#run2chk12nd--terse">RUN2CHK12ND</a><br><code>—</code> | RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; |
| <a href="#run2chk1st--terse">RUN2CHK1ST</a><br><code>—</code> | RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. |
| <a href="#run3chk--terse">RUN3CHK</a><br><code>—</code> | RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. |
| <a href="#rundst--terse">RUNDST,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the runner destination command. |
| <a href="#s--terse">S!</a><br><code>(&nbsp;address&nbsp;value&nbsp;--&nbsp;)</code> | Store cell with address-first arguments. |
| <a href="#s10--terse">S10</a><br><code>(&nbsp;--&nbsp;)</code> | S10 starts INTERRUPTS0 through ISTART; |
| <a href="#s11--terse">S11</a><br><code>(&nbsp;--&nbsp;)</code> | S11 starts INTERRUPTS1. |
| <a href="#sb--terse">SB!</a><br><code>(&nbsp;address&nbsp;value&nbsp;--&nbsp;)</code> | Store byte with address-first arguments. |
| <a href="#sball1--terse">SBALL1</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Draw the BALL 1 message. |
| <a href="#sball2--terse">SBALL2</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Draw the BALL 2 message. |
| <a href="#sball3--terse">SBALL3</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Draw the BALL 3 message. |
| <a href="#sbo--terse">SBO</a><br><code>(&nbsp;--&nbsp;)</code> | SBO posts the three $30-based count characters at their fixed positions. |
| <a href="#scoreme--terse">SCOREME</a><br><code>(&nbsp;--&nbsp;)</code> | Plop scores up. |
| <a href="#screrase--terse">SCRERASE</a><br><code>(&nbsp;--&nbsp;)</code> | Erase entire screen. |
| <a href="#scrs--terse">SCRS</a><br><code>(&nbsp;--&nbsp;)</code> | SCRS clears two score rectangles and draws zero score characters. |
| <a href="#setfdst--terse">SETFDST</a><br><code>(&nbsp;--&nbsp;)</code> | Set up fielder destination values. |
| <a href="#settf--terse">SETTF</a><br><code>(&nbsp;--&nbsp;)</code> | SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading. |
| <a href="#settfpa--terse">SETTFPA</a><br><code>(&nbsp;--&nbsp;)</code> | Take field pa. |
| <a href="#sfoul--terse">SFOUL</a><br><code>(&nbsp;--&nbsp;)</code> | Uses ROT and SPOST to compose game logic. |
| <a href="#sgo--terse">SGO</a><br><code>(&nbsp;--&nbsp;)</code> | Uses SPOST to compose game logic. |
| <a href="#shomer--terse">SHOMER</a><br><code>(&nbsp;--&nbsp;)</code> | Uses ROT and SPOST to compose game logic. |
| <a href="#sorry--terse">SORRY</a><br><code>(&nbsp;--&nbsp;)</code> | Display the losing-player prompt. |
| <a href="#sout1--terse">SOUT1</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Draw the 1 OUT message. |
| <a href="#sout2--terse">SOUT2</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Draw the 2 OUT message. |
| <a href="#sout3--terse">SOUT3</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Draw the 3 OUT message. |
| <a href="#splr--terse">SPLR</a><br><code>(&nbsp;--&nbsp;)</code> | SPLR12/SPLR display available player choices; |
| <a href="#splr12--terse">SPLR12</a><br><code>(&nbsp;--&nbsp;)</code> | SPLR12/SPLR display available player choices; |
| <a href="#spost--terse">SPOST</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;string&nbsp;--&nbsp;)</code> | Draw a string. |
| <a href="#ssafe--terse">SSAFE</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | SSAFE also redraws counts with SBO. |
| <a href="#sstrike1--terse">SSTRIKE1</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Draw the STRIKE 1 message. |
| <a href="#sstrike2--terse">SSTRIKE2</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Draw the STRIKE 2 message. |
| <a href="#stfld--terse">STFLD</a><br><code>(&nbsp;--&nbsp;)</code> | STFLD installs RETPA and TAKEFIELD. |
| <a href="#stp--terse">STP,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit a standing-action record. |
| <a href="#striketime--terse">STRIKETIME</a><br><code>(&nbsp;--&nbsp;)</code> | Strike process. |
| <a href="#stringgo--terse">STRINGGO</a><br><code>(&nbsp;string&nbsp;erase-flag&nbsp;--&nbsp;)</code> | Given string , stringerase. |
| <a href="#stringprc--terse">STRINGPRC</a><br><code>(&nbsp;--&nbsp;)</code> | String display. |
| <a href="#strtball--terse">STRTBALL</a><br><code>(&nbsp;--&nbsp;)</code> | STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music. |
| <a href="#sup--terse">SUP</a><br><code>(&nbsp;--&nbsp;)</code> | SUP posts UP. |
| <a href="#sw-30--terse">SW-30</a><br><code>—</code> | X=1. |
| <a href="#sw-45--terse">SW-45</a><br><code>—</code> | X=1. |
| <a href="#sw-90--terse">SW-90</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;)</code> | SW-90 ignores direction/random inputs and returns the far-right foul sector. |
| <a href="#sw30--terse">SW+30</a><br><code>—</code> | X=1. |
| <a href="#sw45--terse">SW+45</a><br><code>—</code> | X=1. |
| <a href="#sw90--terse">SW+90</a><br><code>(&nbsp;a&nbsp;b&nbsp;--&nbsp;)</code> | SW+90 always returns foul-left after dropping its inputs. |
| <a href="#sw0--terse">SW0</a><br><code>—</code> | X=1. |
| <a href="#swalk--terse">SWALK</a><br><code>(&nbsp;x&nbsp;y&nbsp;options&nbsp;--&nbsp;)</code> | Uses ROT and SPOST to compose game logic. |
| <a href="#tcnt--terse">TCNT</a><br><code>(&nbsp;--&nbsp;)</code> | TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits. |
| <a href="#tersechk--terse">TERSECHK</a><br><code>(&nbsp;--&nbsp;)</code> | Look at terse routine flags. |
| <a href="#tf--terse">TF</a><br><code>(&nbsp;--&nbsp;)</code> | Take the field. |
| <a href="#thw--terse">THW,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the throw command. |
| <a href="#twait--terse">TWAIT</a><br><code>(&nbsp;count&nbsp;--&nbsp;)</code> | Terse wait period. |
| <a href="#v--terse">V</a><br><code>(&nbsp;--&nbsp;)</code> | Uses VARIABLE to compose game logic. |
| <a href="#v--terse-1">V=</a><br><code>(&nbsp;--&nbsp;)</code> | Uses V and VARIABLE to compose game logic. |
| <a href="#vibs--terse">VIBS</a><br><code>(&nbsp;value&nbsp;--&nbsp;)</code> | Emit a vibrato setting. |
| <a href="#vis--terse">VIS</a><br><code>(&nbsp;--&nbsp;)</code> | HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; |
| <a href="#whbodds--terse">WHBODDS</a><br><code>(&nbsp;--&nbsp;)</code> | Sets who is on base calculates play odds. |
| <a href="#wthw--terse">WTHW,</a><br><code>(&nbsp;--&nbsp;)</code> | Emit the wait-for-throw command. |
| <a href="#wupgo--terse">WUPGO</a><br><code>(&nbsp;--&nbsp;)</code> | WUPGO activates WHOSUP with runner/automatic-forward flags; |
| <a href="#wupton--terse">WUPTON</a><br><code>(&nbsp;--&nbsp;)</code> | WUPTON installs WUPWRT. |
| <a href="#wupwrt--terse">WUPWRT</a><br><code>(&nbsp;--&nbsp;)</code> | Write whos up for flash. |
| <a href="#you1st--terse">YOU1ST</a><br><code>(&nbsp;--&nbsp;)</code> | YOU1ST posts the greeting/extra-inning challenge, then continues to 306. |
| <a href="#zeroram--terse">ZERORAM</a><br><code>(&nbsp;--&nbsp;)</code> | ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. |

## Extra Bases native CODE words (85)

| Word / stack | Function |
| --- | --- |
| <a href="#loop--native-code">+LOOP</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Uses LOOP to process game state. |
| <a href="#allfldact--native-code">ALLFLDACT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Sets all fielders active. |
| <a href="#anmseqload--native-code">ANMSEQLOAD</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Finds proper anm seq by per=#. |
| <a href="#ballerase--native-code">BALLERASE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | BALLERASE preserves BC/IY around native BLERASE and returns to TERSE. |
| <a href="#bathit--native-code">BATHIT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | He hit it time to get em running. |
| <a href="#bathitchk--native-code">BATHITCHK</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Check window for hit. |
| <a href="#batswing--native-code">BATSWING</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Swings bat if appropriate. |
| <a href="#batwrite--native-code">BATWRITE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Xor bat from swingtype. |
| <a href="#bcd--native-code">BCD+</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Binary to decimal arithmatic. |
| <a href="#bldst--native-code">BLDST</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Ball thrown or hit. |
| <a href="#blmotion--native-code">BLMOTION</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Set pc for ram pa table -tractor ball. |
| <a href="#blposchk--native-code">BLPOSCHK</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | BLPOSCHK branches on HITYET. |
| <a href="#bmusic--native-code">BMUSIC</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay. |
| <a href="#buttonchk--native-code">BUTTONCHK</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Reads buttons for swing run & pitch it. |
| <a href="#chkcaught--native-code">CHKCAUGHT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Caught set in interrupt. |
| <a href="#chkgrounder--native-code">CHKGROUNDER</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | If grounder adjust ball direction. |
| <a href="#chkscrtime--native-code">CHKSCRTIME</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Score process. |
| <a href="#clrblst--native-code">CLRBLST</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading. |
| <a href="#cnline--native-code">cnline</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Calls vector line write. |
| <a href="#compde--native-code">COMPDE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | COMPDE applies the same operation to DE while preserving HL. |
| <a href="#comphl--native-code">COMPHL</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Compliments HL. |
| <a href="#count--native-code">COUNT</a><br><code>(&nbsp;address&nbsp;--&nbsp;address+1&nbsp;length&nbsp;)</code> | Fetch the address and length of a counted string. |
| <a href="#cpost--native-code">cpost</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Post an ascii-character on the screen ; see opt. |
| <a href="#deactivate--native-code">DEACTIVATE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Reset active bit in status. |
| <a href="#di--native-code">DI</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Disable interrupts. |
| <a href="#divhlby4--native-code">DIVHLBY4</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Divide HL by 4. |
| <a href="#do--native-code">DO</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Enter a counted loop. |
| <a href="#dstcalc--native-code">DSTCALC</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Calc deltas to destination. |
| <a href="#dstld--native-code">DSTLD</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively. |
| <a href="#ei--native-code">EI</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Uses SWAN to process game state. |
| <a href="#eidi--native-code">EIDI</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. |
| <a href="#emusic--native-code">EMUSIC</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | EMUSIC selects ENDMUSIC and initializes timing/repetition to one; |
| <a href="#ex--native-code">EX</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation. |
| <a href="#fill--native-code">FILL</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Fill a memory/screen range. |
| <a href="#flddst--native-code">FLDDST</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Fielders take position logic. |
| <a href="#flshoff--native-code">FLSHOFF</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | FLSHOFF disables flashing and services cleanup under DI. |
| <a href="#fmirror--native-code">FMIRROR</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order. |
| <a href="#hitrun--native-code">HITRUN</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Activate proper runners and set trwbase. |
| <a href="#homerchk--native-code">HOMERCHK</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Chk for homer or fence hit. |
| <a href="#i--native-code">I</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Native game routine; source body below. |
| <a href="#iex--native-code">IEX</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | IEX restores saved registers, enables interrupts and returns. |
| <a href="#indexw--native-code">INDEXW</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Call routine A- disp HL- table add. |
| <a href="#infield--native-code">INFIELD</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Uses IFSPAN to process game state. |
| <a href="#infldact--native-code">INFLDACT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Set infielders active. |
| <a href="#istart--native-code">ISTART</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT. |
| <a href="#killof--native-code">KILLOF</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Stop outfield tractor ball control. |
| <a href="#loadanm--native-code">LOADANM</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Loads magic & anm HL-top of playact table. |
| <a href="#loop--native-code-1">LOOP</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Advance or terminate a counted loop. |
| <a href="#multhlby4--native-code">MULTHLBY4</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign. |
| <a href="#muscpu--native-code">MUSCPU</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Declare cross-screen dispatch labels and begin assembling MUSCPU. |
| <a href="#ndup--native-code">NDUP</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Uses ARRAY to process game state. |
| <a href="#offfdst--native-code">OFFFDST</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | All player off field control. |
| <a href="#ofldtbl--native-code">OFLDTBL</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | OFLDTBL gives all three outfielders OFTBLPA, activates them and returns; |
| <a href="#ofmotion--native-code">OFMOTION</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Set pc for ram pa table -tractor ball. |
| <a href="#on1st--native-code">ON1ST</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; |
| <a href="#on2nd--native-code">ON2ND</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; |
| <a href="#on3rd--native-code">ON3RD</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; |
| <a href="#opcodechk--native-code">OPCODECHK</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Called by plyactupdate. |
| <a href="#outfldact--native-code">OUTFLDACT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Sets outfielders active. |
| <a href="#pactload--native-code">PACTLOAD</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Loads vect from plyact. |
| <a href="#patfetch--native-code">PATFETCH</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Loads actual pattern IX-vector. |
| <a href="#perspective--native-code">PERSPECTIVE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Pattern size determined by y. |
| <a href="#playact--native-code">PLAYACT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Called in intterupt does update prc. |
| <a href="#pmusic--native-code">PMUSIC</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer. |
| <a href="#ptautotm--native-code">PTAUTOTM</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Pitch auto timer. |
| <a href="#resetrunners--native-code">RESETRUNNERS</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Reset runners to order of on base. |
| <a href="#rnd--native-code">RND</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Generate a random number. |
| <a href="#rundst--native-code">RUNDST</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Runner base running control. |
| <a href="#sentry--native-code">SENTRY</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Game loop. |
| <a href="#setact--native-code">SETACT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Sets avtive bit in status. |
| <a href="#startmusic--native-code">STARTMUSIC</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | STARTMUSIC clears its request. |
| <a href="#strtline--native-code">strtline</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Given X Y sets up start of line. |
| <a href="#swan--native-code">SWAN</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Transfer interrupt/screen execution state. |
| <a href="#tballpitch--native-code">TBALLPITCH</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Loads pitch velocities. |
| <a href="#throwanim--native-code">THROWANIM</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Sets up BLDST and player anim. |
| <a href="#throwball--native-code">THROWBALL</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Finish scoring first. |
| <a href="#thwanmset--native-code">THWANMSET</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Set up throw animation. |
| <a href="#timer--native-code">TIMER</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Interrupt timer routine. |
| <a href="#vector--native-code">VECTOR</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Vectors and limit checks. |
| <a href="#verase--native-code">VERASE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Does pattern board erase from vector IX. |
| <a href="#vwrite--native-code">VWRITE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Does reloff relabs patbrd from vector IX. |
| <a href="#wait--native-code">WAIT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Given A wait period stop every thing. |
| <a href="#waitthrw--native-code">WAITTHRW</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Sets flag for 1stbaseman to wait throw. |
| <a href="#write--native-code">WRITE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Write with X Y sizes ; pattern with no header. |
| <a href="#writr--native-code">WRITR</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Write with a relative pattern. |

## Native SUBR helpers (47)

| Word / stack | Function |
| --- | --- |
| <a href="#autor1--native-subr">AUTOR1</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners. |
| <a href="#autor2--native-subr">AUTOR2</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Run second-runner automation logic. |
| <a href="#autor3--native-subr">AUTOR3</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Run third-runner automation logic. |
| <a href="#blerase--native-subr">BLERASE</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Erases ball. |
| <a href="#chkatbs--native-subr">CHKATBS</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Check if active player at base in- A vstatus. |
| <a href="#chkcoin1--native-subr">CHKCOIN1</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Chk door 1 for coin drop. |
| <a href="#chkcoin2--native-subr">CHKCOIN2</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Chk door 2 for coin drop. |
| <a href="#cmpof--native-subr">CMPOF</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Calculates proper deltas and patterns. |
| <a href="#colorband--native-subr">COLORBAND</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled. |
| <a href="#debounce--native-subr">debounce</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Debounce input transitions. |
| <a href="#fetch--native-subr">FETCH</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. |
| <a href="#flshwup--native-subr">FLSHWUP</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Handle flash callback. |
| <a href="#fnbb--native-subr">FNBB</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Native game routine; source body below. |
| <a href="#fontunpack--native-subr">FONTUNPACK</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | FONTUNPACK reads two packed bytes and starts a five-row unpack loop. |
| <a href="#fro1--native-subr">FRO1</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Uses AUTOR1 to process game state. |
| <a href="#fro12--native-subr">FRO12</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Uses AUTOR1 and AUTOR2 to process game state. |
| <a href="#fro123--native-subr">FRO123</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Uses AUTOR1 and AUTOR2 to process game state. |
| <a href="#fro13--native-subr">FRO13</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Uses AUTOR2 to process game state. |
| <a href="#fro2--native-subr">FRO2</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Native game routine; source body below. |
| <a href="#fro23--native-subr">FRO23</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Native game routine; source body below. |
| <a href="#fro3--native-subr">FRO3</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Native game routine; source body below. |
| <a href="#hload--native-subr">HLOAD</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. |
| <a href="#ifspan--native-subr">IFSPAN</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value. |
| <a href="#incpc--native-subr">INCPC</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. |
| <a href="#loadpc--native-subr">loadpc</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | loadpc installs MUSPC and STARTPC. |
| <a href="#lvrstat--native-subr">LVRSTAT</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Load vstat for all runners in- A value. |
| <a href="#nbb--native-subr">NBB</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | NBB is the empty-bases no-op. |
| <a href="#ofblchk--native-subr">OFBLCHK</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Chk for catch or close when cmsw. |
| <a href="#pcjump--native-subr">PCJUMP</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. |
| <a href="#relabs--native-subr">relabs</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Relative X Y to magic address conversion. |
| <a href="#reloff--native-subr">reloff</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Compute relative offset of x , y of pattern. |
| <a href="#ro1--native-subr">RO1</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. |
| <a href="#ro12--native-subr">RO12</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | RO12 activates both forced runners, selecting a double-play or ordinary target; |
| <a href="#ro123--native-subr">RO123</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | RO23 and RO123 choose forced advancement and double-play targets for their base combinations. |
| <a href="#ro13--native-subr">RO13</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | RO13 handles first-and-third occupancy and may branch through SETDBLPLAY. |
| <a href="#ro2--native-subr">RO2</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. |
| <a href="#ro23--native-subr">RO23</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | RO23 and RO123 choose forced advancement and double-play targets for their base combinations. |
| <a href="#ro3--native-subr">RO3</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. |
| <a href="#setdblplay--native-subr">SETDBLPLAY</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Sets up double play HL-guy on 1st. |
| <a href="#takeoff--native-subr">TAKEOFF</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Turn proper runners on. |
| <a href="#tballprc--native-subr">TBALLPRC</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Pitch or control outfield. |
| <a href="#tblvel--native-subr">TBLVEL</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Tractorball vel HL-# add. D-max vel. |
| <a href="#timedcr--native-subr">TIMEDCR</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | HL-timer add if goes to zero return 1 else 0. |
| <a href="#toofck--native-subr">TOOFCK</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Time out outfield check. |
| <a href="#walkover--native-subr">WALKOVER</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Walked runner at base. |
| <a href="#write--native-subr">write</a><br><code>Z80&nbsp;register&nbsp;/&nbsp;stack&nbsp;ABI</code> | Software write with x y size. |
| <a href="#writep--native-subr">writep</a><br><code>(&nbsp;IY=patadr&nbsp;BC=ex/mag+shf&nbsp;HL=scradr&nbsp;---&nbsp;)</code> | Software write with pattern size on pattern. |

## Host and cross-compiler definitions (2)

| Word / stack | Function |
| --- | --- |
| <a href="#base--terse">BASE!</a><br><code>(&nbsp;base&nbsp;--&nbsp;)</code> | Set the number base. |
| <a href="#base--terse-1">BASE@</a><br><code>(&nbsp;--&nbsp;base&nbsp;)</code> | Fetch the current number base. |

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

Given sectnm set up infield action.

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

Grounder.

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

ICODE starts a CODE definition and emits the scheduler/register-save prologue: set INLIN/IPNT, swap alternate register banks and preserve the active register sets.

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

RECLINE derives one horizontal row from retained rectangle arguments.

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

RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy;

```text
: RUN1CHK1ST VWBASE R1 B@ 1 = IF 1 VMAGIC R2
ELSE RUN1CHK2ND THEN ;
```

**Calls:** `B@`, `RUN1CHK2ND`.

**Used by:** `WHBODDS`.

### `RUN1CHK2ND` — TERSE

RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy;

```text
: RUN1CHK2ND VWBASE R1 B@ 2 = IF RUN2CHK12ND
ELSE RUN2CHK THEN ;
```

**Calls:** `B@`, `RUN2CHK12ND`, `RUN2CHK`.

**Used by:** `RUN1CHK1ST`.

### `RUN2CHK` — TERSE

RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```text
: RUN2CHK VWBASE R2 B@ 0 = IF 3 VMAGIC R2
ELSE RUN2CHK1ST THEN ;
```

**Calls:** `B@`, `RUN2CHK1ST`.

**Used by:** `RUN1CHK2ND`.

### `RUN2CHK12ND` — TERSE

RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy;

```text
: RUN2CHK12ND VWBASE R2 B@ 0 = IF 2 VMAGIC R2
ELSE 4 VMAGIC R3 THEN ;
```

**Calls:** `B@`.

**Used by:** `RUN1CHK2ND`.

### `RUN2CHK1ST` — TERSE

RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```text
: RUN2CHK1ST VWBASE R2 B@ 1 = IF 6 VMAGIC R3
ELSE RUN3CHK THEN ;
```

**Calls:** `B@`, `RUN3CHK`.

**Used by:** `RUN2CHK`.

### `RUN3CHK` — TERSE

RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

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

X=1.

```text
: SW-30 DUP IF 1 = IF ( x=1 ) IF F1STR ELSE HR THEN
ELSE ( x=-1 ) IF HR ELSE F2NDL THEN THEN
ELSE ( x= 0 ) DROP DUP IF 1- IF F2NDL ELSE F2NDR THEN
ELSE DROP HR THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### `SW-45` — TERSE

X=1.

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

X=1.

```text
: SW+30 DUP IF 1 = IF ( x=1 ) IF HL ELSE FSSR THEN
ELSE ( x= -1 ) IF F3RDL ELSE HL THEN THEN
ELSE ( x=0 ) DROP DUP IF 1- IF FSSR ELSE FSSL THEN
ELSE DROP HL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

### `SW+45` — TERSE

X=1.

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

X=1.

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Sets all fielders active.

```text
CODE ALLFLDACT ( sets all fielders active )
' INFLDACT CALL, ' OUTFLDACT CALL, NEXT
```

**Calls:** `INFLDACT`, `OUTFLDACT`.

**Used by:** `INLOG`.

### `ANMSEQLOAD` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

BALLERASE preserves BC/IY around native BLERASE and returns to TERSE.

```text
CODE BALLERASE B PUSH, Y PUSHX, BLERASE CALL,
Y POPX, B POP, NEXT
```

**Calls:** `BLERASE`.

**Used by:** `DOHOMER`, `OUTTIME`.

### `BATHIT` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Binary to decimal arithmatic.

```text
CODE BCD+ ( binary to decimal arithmatic )
( in- integer 1 , integer 2 )
( out- bcd sum of integer 1 and 2 )
H POP, D POP, E A MOV, L ADD, DAA, A L MOV,
D A MOV, H ADC, DAA, A H MOV, H PUSH, NEXT
```

### `BLDST` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Set pc for ram pa table -tractor ball.

```text
CODE BLMOTION ( set pc for ram pa table -tractor ball )
TBLPA H LXI, VECTPC SHLD, RET,
```

### `BLPOSCHK` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

```text
CODE BMUSIC PRIORITY LDA, H POP, A ORA, 0=, IF, loadpc CALL,
NOTETIMER STA, A INR, MULTIPLE STA, THEN, NEXT
```

**Calls:** `loadpc`.

**Used by:** `MBALL`, `MCANNON`, `MCOIN`, `MFENCE`, `MFOUL`, `MHIT`, `MOUT`, `MSAFE`, `MSTRIKE`, `MYAH`.

### `BUTTONCHK` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.

```text
CODE CLRBLST 30 A MVI, BALLS STA, STRIKES STA, NEXT
```

**Used by:** `BALLTIME`, `DOHOMER`, `OUTTIME`.

### `cnline` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

COMPDE applies the same operation to DE while preserving HL.

```text
CODE COMPDE H PUSH, XCHG, ' COMPHL CALL, XCHG, H POP, RET,
```

**Calls:** `COMPHL`.

**Used by:** `CHKGROUNDER`.

### `COMPHL` — native CODE

`Z80 register / stack ABI`

Compliments HL.

```text
CODE COMPHL ( compliments HL )
H A MOV, CMA, A H MOV, L A MOV, CMA, A L MOV, H INX, RET,
```

**Used by:** `COMPDE`, `DIVHLBY4`, `DSTCALC`, `MULTHLBY4`, `OFBLCHK`, `TBLVEL`.

### `COUNT` — native CODE

`( address -- address+1 length )`

Fetch the address and length of a counted string.

```text
CODE COUNT ROMHERE !
( COUNT uses the native counted-string routine )
```

**Used by:** `PPOST`.

### `cpost` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Reset active bit in status.

```text
CODE DEACTIVATE ( reset active bit in status )
VACT VSTATUS X RESX, 1 A MVI, SAMEDLT STA, RET,
```

### `DI` — native CODE

`Z80 register / stack ABI`

Disable interrupts.

```text
CODE DI
```

**Used by:** `CREDARROW`, `DOGOVER`, `DWAIT`, `FLFILL`, `INSWAIT`, `MLINN`, `PLRCHK`, `PLRSELECT`, `PUP`, `SETTF`, `STRTBALL`, `TF`, `TWAIT`, `ZERORAM`.

### `DIVHLBY4` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Enter a counted loop.

```text
CODE DO
```

**Used by:** `DWAIT`, `FIELDWRT`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTTIME`, `PPOST`, `RETPA`, `TWAIT`.

### `DSTCALC` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.

```text
CODE DSTLD
VDSTXH X H LDX, VDSTXL X L LDX, VDSTYH X D LDX,
VDSTYL X E LDX,
RET,
```

**Used by:** `BLDST`, `FLDDST`.

### `EI` — native CODE

`Z80 register / stack ABI`

Uses SWAN to process game state.

```text
CODE EI 0249 ROMHERE ! CODE SWAN
ROMHERE !
( VGS screen handeling verbs INTCOMMERCIAL , FILL , SCRERASE )
```

**Calls:** `SWAN`.

**Used by:** `CREDARROW`, `DWAIT`, `FL`, `FLFILL`, `INSWAIT`, `MLINN`, `PLRCHK`, `PUP`, `SETTF`, `TF`, `TWAIT`.

### `EIDI` — native CODE

`Z80 register / stack ABI`

EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers.

```text
CODE EIDI EI, DI, NEXT
```

**Used by:** `DOGOVER`, `FL`.

### `EMUSIC` — native CODE

`Z80 register / stack ABI`

EMUSIC selects ENDMUSIC and initializes timing/repetition to one;

```text
CODE EMUSIC 0 ENDMUSIC H LXI, loadpc CALL, 1 A MVI, NOTETIMER
STA, MULTIPLE STA, NEXT ( CALL EMUSIC AS AN INIT IN PROGRAM )
```

**Calls:** `loadpc`.

**Used by:** `PUP`.

### `EX` — native CODE

`Z80 register / stack ABI`

EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.

```text
CODE EX C9 B, NEXT
```

**Used by:** `FLSHME`, `GRNDRACTION`, `GRNDRHIT`, `STRINGGO`.

### `FILL` — native CODE

`Z80 register / stack ABI`

Fill a memory/screen range.

```text
CODE FILL ROMHERE !
```

**Used by:** `FLFILL`, `SCRERASE`, `ZERORAM`.

### `FLDDST` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

FLSHOFF disables flashing and services cleanup under DI.

```text
CODE FLSHOFF B PUSH, A XRA, FLSHON STA, DI, FLSHWUP CALL,
B POP, NEXT
```

**Calls:** `FLSHWUP`.

**Used by:** `CHKFLSHSTAY`, `DOCHGS`, `DOGOVER`, `OUTTIME`.

### `FMIRROR` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Chk for homer or fence hit.

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

`Z80 register / stack ABI`

Native game routine; source body below.

```text
CODE I
ROMHERE !
FORWARD PLPOS FORWARD PLBACK FORWARD PLDONE
CODE +LOOP <ASSEMBLE H POP, H A MOV, 0 X E LDX, 1 X D LDX,
D DAD, L 0 X STX, H 1 X STX,
2 X E LDX, 3 X D LDX, A ORA, D DSBC,
PSW PUSH, H POP, 7 A BIT, L A MOV, PLPOS JZ,
84 ANI, PLBACK JPE, PLDONE JMP,
( BB parameter control - reconstructed continuation )
LABEL PLPOS 84 ANI, PLBACK JPO,
LABEL PLDONE 6 D LXI, D DADX, NEXT
```

**Used by:** `NPOST`, `PPOST`.

### `IEX` — native CODE

`Z80 register / stack ABI`

IEX restores saved registers, enables interrupts and returns.

```text
CODE IEX PSW POP, B POP, D POP, H POP, EXX, EXAF,
PSW POP, B POP, D POP, H POP, EI, RET,
```

**Used by:** `INEXT`.

### `INDEXW` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Set infielders active.

```text
CODE INFLDACT ( set infielders active )
VSTATUS PT H LXI, 5 A MVI, ' SETACT CALL, RET,
```

**Calls:** `SETACT`.

**Used by:** `ALLFLDACT`.

### `ISTART` — native CODE

`Z80 register / stack ABI`

ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.

```text
CODE ISTART DI, H POP, IPNT SHLD, 8 A MVI, INMOD OUT,
IPNT { SWAB } A MVI, STAI, IPNT A MVI,
INFBK OUT, IM2, EI, NEXT
```

**Used by:** `S10`, `S11`.

### `KILLOF` — native CODE

`Z80 register / stack ABI`

Stop outfield tractor ball control.

```text
CODE KILLOF ( stop outfield tractor ball control )
0 H LXI, OFDX SHLD, OFDY SHLD, STND H LXI, OFPA SHLD,
A XRA, OFTBLGO STA, RET,
```

**Used by:** `BLDST`.

### `LOADANM` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Advance or terminate a counted loop.

```text
CODE LOOP
```

**Used by:** `+LOOP`, `DWAIT`, `FIELDWRT`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTTIME`, `PPOST`, `RETPA`, `TWAIT`.

### `MULTHLBY4` — native CODE

`Z80 register / stack ABI`

MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign.

```text
CODE MULTHLBY4
7 H BIT, PSW PUSH, ' COMPHL CNZ, L SLAR, H RALR,
L SLAR, H RALR, PSW POP, ' COMPHL CNZ, RET,
```

**Calls:** `COMPHL`.

**Used by:** `BATHITCHK`, `OFBLCHK`.

### `MUSCPU` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Uses ARRAY to process game state.

```text
CODE NDUP ROMHERE !
( HIGH SPEED RANDOM NUMBER - native kernel binding )
HEX VPTR @ 07C06 VPTR ! 2 ARRAY RND# VPTR !
```

**Calls:** `ARRAY`.

**Used by:** `OUTLINE`.

### `OFFFDST` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

OFLDTBL gives all three outfielders OFTBLPA, activates them and returns;

```text
CODE OFLDTBL OFTBLPA H LXI, A XRA, OFTOTBL STA,
DI, VPLAYACTPC RF SHLD, VPLAYACTPC CF SHLD, VPLAYACTPC LF SHLD,
' OUTFLDACT CALL, EI, RET,
```

**Calls:** `OUTFLDACT`.

**Used by:** `SENTRY`.

### `OFMOTION` — native CODE

`Z80 register / stack ABI`

Set pc for ram pa table -tractor ball.

```text
CODE OFMOTION ( set pc for ram pa table -tractor ball )
OFPA { 1+ } LDA, 4 CPI, ( stnd ? )
=, IF, VACT VSTATUS X RESX, THEN,
OFPA H LXI, VECTPC SHLD, RET,
```

### `ON1ST` — native CODE

`Z80 register / stack ABI`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON1ST X PUSHX, H POP, FLDON1ST SHLD, RET,
```

### `ON2ND` — native CODE

`Z80 register / stack ABI`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON2ND X PUSHX, H POP, FLDON2ND SHLD, RET,
```

### `ON3RD` — native CODE

`Z80 register / stack ABI`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON3RD X PUSHX, H POP, FLDON3RD SHLD, RET,
```

### `OPCODECHK` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Sets outfielders active.

```text
CODE OUTFLDACT ( sets outfielders active )
VSTATUS LF H LXI, 3 A MVI, ' SETACT CALL, RET,
```

**Calls:** `SETACT`.

**Used by:** `ALLFLDACT`, `CMPOF`, `OFLDTBL`.

### `PACTLOAD` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer.

```text
CODE PMUSIC H POP, loadpc CALL, 1 A MVI, MULTIPLE STA,
PRIORITY STA, NOTETIMER STA, NEXT
```

**Calls:** `loadpc`.

**Used by:** `MOPENERS`.

### `PTAUTOTM` — native CODE

`Z80 register / stack ABI`

Pitch auto timer.

```text
CODE PTAUTOTM ( pitch auto timer )
TIMEOUT H LXI, FLDCLR LDA, A ANA, TIMEDCR CZ, NEXT
```

**Calls:** `TIMEDCR`.

**Used by:** `WUPWRT`.

### `RESETRUNNERS` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Generate a random number.

```text
CODE RND ROMHERE !
( NUMBER TABLE FOR STRING DISPLAY ROUTINES )
BTABLE characters ( FILL IN CHARACTER TABLES )
( SPACE 0 1 2 3 4 5 6 7 8 9 )
00 B, 00 B, 00 B, 00 B, 00 B, 00 B, 00 B, 00 B, 00 B, 00 B,
3C B, 7E B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 3C B,
18 B, 38 B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B, 3C B, 3C B,
3C B, 7E B, 66 B, 06 B, 3E B, 7C B, 60 B, 60 B, 7E B, 7E B,
3C B, 7E B, 66 B, 06 B, 1C B, 1E B, 06 B, 66 B, 7E B, 3C B,
66 B, 66 B, 66 B, 66 B, 7E B, 7E B, 06 B, 06 B, 06 B, 06 B,
7C B, 7C B, 60 B, 60 B, 7C B, 7E B, 06 B, 66 B, 7E B, 3C B,
3C B, 7C B, 60 B, 60 B, 7C B, 7E B, 66 B, 66 B, 7E B, 3C B,
7E B, 7E B, 06 B, 0E B, 0C B, 1C B, 18 B, 38 B, 30 B, 30 B,
3C B, 7E B, 66 B, 66 B, 3C B, 7E B, 66 B, 66 B, 7E B, 3C B,
3C B, 7E B, 66 B, 66 B, 7E B, 3E B, 06 B, 06 B, 3E B, 3C B,
( CHARACTER PATTERN TABLE FOR DISPLAY )
( A B C D E F G H I J K L M )
18 B, 3C B, 7E B, 66 B, 66 B, 66 B, 7E B, 7E B, 66 B, 66 B,
7C B, 7E B, 66 B, 66 B, 7C B, 7E B, 66 B, 66 B, 7E B, 7C B,
3C B, 7E B, 66 B, 60 B, 60 B, 60 B, 60 B, 66 B, 7E B, 3C B,
7C B, 7E B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 7C B,
7E B, 7E B, 60 B, 60 B, 7C B, 7C B, 60 B, 60 B, 7E B, 7E B,
7E B, 7E B, 60 B, 60 B, 7C B, 7C B, 60 B, 60 B, 60 B, 60 B,
3C B, 7E B, 60 B, 60 B, 60 B, 6E B, 6E B, 66 B, 7E B, 3C B,
66 B, 66 B, 66 B, 66 B, 7E B, 7E B, 66 B, 66 B, 66 B, 66 B,
3C B, 3C B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B, 3C B, 3C B,
06 B, 06 B, 06 B, 06 B, 06 B, 06 B, 66 B, 66 B, 7E B, 3C B,
66 B, 66 B, 6C B, 7C B, 78 B, 78 B, 6C B, 6E B, 66 B, 66 B,
60 B, 60 B, 60 B, 60 B, 60 B, 60 B, 60 B, 60 B, 7E B, 7E B,
C3 B, E7 B, E7 B, DB B, DB B, C3 B, C3 B, C3 B, C3 B, C3 B,
( CHARACTER PATTERN TABLE CONT. )
( N O P Q R S T U V W X Y Z )
66 B, 66 B, 76 B, 7E B, 7E B, 6E B, 66 B, 66 B, 66 B, 66 B,
3C B, 7E B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 3C B,
7C B, 7E B, 66 B, 66 B, 7E B, 7C B, 60 B, 60 B, 60 B, 60 B,
3C B, 7E B, 66 B, 66 B, 66 B, 66 B, 66 B, 6E B, 64 B, 3A B,
7C B, 7E B, 66 B, 66 B, 7E B, 7C B, 6E B, 66 B, 66 B, 66 B,
3C B, 7E B, 66 B, 60 B, 7C B, 3E B, 06 B, 66 B, 7E B, 3C B,
7E B, 7E B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B,
66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 3C B,
66 B, 66 B, 66 B, 66 B, 66 B, 7E B, 3C B, 3C B, 18 B, 18 B,
C3 B, C3 B, C3 B, DB B, DB B, DB B, FF B, E7 B, C3 B, C3 B,
66 B, 66 B, 7E B, 3C B, 18 B, 18 B, 3C B, 7E B, 66 B, 66 B,
66 B, 66 B, 7E B, 3C B, 18 B, 18 B, 18 B, 18 B, 18 B, 18 B,
7E B, 7E B, 06 B, 0E B, 1C B, 38 B, 70 B, 60 B, 7E B, 7E B,
( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
BTABLE smallfont 00 B, 00 B, ( SPACE )
092 B, 020 B, ( ! )
02D B, 00 B, ( " )
07D B, 05F B, ( # )
03A B, 02F B, ( $ )
08C B, 018 B, ( % )
080 B, 05A B, ( & )
012 B, 00 B, ( ' )
022 B, 029 B, ( LEFT PAREN )
04A B, 022 B, ( RIGHT PAREN )
0A8 B, 0A B, ( * )
0D0 B, 05 B, ( + )
00 B, 044 B, ( , )
0C0 B, 01 B, ( - )
00 B, 020 B, ( . ) -->
( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
088 B, 08 B, ( / )
06A B, 02B B, ( 00 )
092 B, 024 B, ( 01 )
0CF B, 079 B, ( 2 )
0CF B, 072 B, ( 3 )
0ED B, 013 B, ( 4 )
0A7 B, 063 B, ( 5 )
0E7 B, 07B B, ( 6 )
08F B, 024 B, ( 7 )
0EF B, 07B B, ( 8 )
0EF B, 073 B, ( 9 )
010 B, 04 B, ( : )
010 B, 044 B, ( ; )
011 B, 015 B, ( < )
038 B, 0E B, ( = ) -->
( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
054 B, 044 B, ( > )
08F B, 020 B, ( ? )
0EF B, 069 B, ( @ )
0EF B, 05B B, ( A )
0AF B, 07B B, ( B )
027 B, 079 B, ( C )
06E B, 06B B, ( D )
0A7 B, 079 B, ( E )
0A7 B, 049 B, ( F )
067 B, 07B B, ( G )
0ED B, 05B B, ( H )
097 B, 074 B, ( I )
049 B, 07A B, ( J )
0AD B, 05B B, ( K )
024 B, 079 B, ( L ) -->
( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
0FD B, 05B B, ( M )
06E B, 05B B, ( N )
06F B, 07B B, ( O )
0EF B, 049 B, ( P )
06F B, 01F B, ( Q )
0AE B, 05B B, ( R )
0E7 B, 073 B, ( S )
097 B, 024 B, ( T )
06D B, 07B B, ( U )
06D B, 02B B, ( V )
0ED B, 05F B, ( W )
0AD B, 05A B, ( X )
0AD B, 024 B, ( Y )
08F B, 078 B, ( Z )
( VGS-SMALL FONT CHARACTER SET 3 BY 5 )
026 B, 069 B, ( [ )
0A0 B, 02 B, ( BACK SLASH )
04B B, 032 B, ( ] )
0BA B, 024 B, ( ^ )
0D1 B, 015 B, ( RIGHT )
BASE! ;S
( system verbs )
( Unused 1-B! omitted to fit the released infield )
```

**Used by:** `GRNDRHIT`, `INLOG`, `MUSCPU`, `OUTFLDHIT`, `TERSECHK`, `WHBODDS`.

### `RUNDST` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Sets avtive bit in status.

```text
CODE SETACT ( sets avtive bit in status )
( in HL-status 1st guy A- # of guys )
VLENGTH D LXI,
BEGIN, VACT M SET, D DAD, A DCR, 0=, END, RET,
```

**Used by:** `INFLDACT`, `OUTFLDACT`.

### `STARTMUSIC` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Transfer interrupt/screen execution state.

```text
CODE SWAN
ROMHERE !
( VGS screen handeling verbs INTCOMMERCIAL , FILL , SCRERASE )
```

**Used by:** `EI`, `NPOST`.

### `TBALLPITCH` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Given A wait period stop every thing.

```text
CODE WAIT ( given A wait period stop every thing )
BEGIN, PSW PUSH, 0FF A MVI, BEGIN, A DCR, 0=, END,
PSW POP, A DCR, 0=, END, RET,
```

### `WAITTHRW` — native CODE

`Z80 register / stack ABI`

Sets flag for 1stbaseman to wait throw.

```text
CODE WAITTHRW ( sets flag for 1stbaseman to wait throw )
' THWANMSET CALL, BASESTATUS LDA, 5 CPI, RZ, A XRA,
THROWANM STA, 20 A MVI, WAITTHROW STA, RET,
```

**Calls:** `THWANMSET`.

### `WRITE` — native CODE

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

```text
SUBR AUTOR1 3 A MVI, VRSTAT R1 STA, 81 A MVI, VSTATUS R1 STA,
RET, ( sets vauto , vforw , vact , vrun )
```

**Used by:** `FRO1`, `FRO12`, `FRO123`, `RO1`, `RO12`, `RO123`, `RO13`, `RO2`, `RO23`, `RO3`.

### `AUTOR2` — native SUBR

`Z80 register / stack ABI`

Run second-runner automation logic.

```text
SUBR AUTOR2 3 A MVI, VRSTAT R2 STA, 81 A MVI, VSTATUS R2 STA,
RET,
```

**Used by:** `FRO12`, `FRO123`, `FRO13`, `RO12`, `RO123`, `RO13`, `RO23`.

### `AUTOR3` — native SUBR

`Z80 register / stack ABI`

Run third-runner automation logic.

```text
SUBR AUTOR3 3 A MVI, VRSTAT R3 STA, 81 A MVI, VSTATUS R3 STA,
RET,
```

**Used by:** `FRO123`, `RO123`.

### `BLERASE` — native SUBR

`Z80 register / stack ABI`

Erases ball.

```text
SUBR BLERASE ( erases ball )
X PUSHX, VMAGIC BL X LXIX, ' VERASE CALL, VACT VSTATUS X RESX,
X POPX, ( stop ball ) NOBOD H LXI, VPAT BL SHLD, RET,
```

**Calls:** `VERASE`.

**Used by:** `BALLERASE`, `BATHITCHK`, `THWANMSET`.

### `CHKATBS` — native SUBR

`Z80 register / stack ABI`

Check if active player at base in- A vstatus.

```text
SUBR CHKATBS ( check if active player at base in- A vstatus )
VACT A BIT, RZ, VATBS A BIT, RNZ, E INR, RET,
```

**Used by:** `THROWANIM`.

### `CHKCOIN1` — native SUBR

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled.

```text
SUBR COLORBAND NEXT XTHL, PSW PUSH, M A MOV, INLIN OUT,
H INX, IPNT SHLD, FLSHSTAY LDA, A ANA, 0=, IF,
6C A MVI, 3 OUT, 7 A MVI, 1 OUT, THEN,
PSW POP, H POP, EI, RET, ( palette only: preserve AF/HL )
```

### `debounce` — native SUBR

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR FETCH MUSPC LHLD, M A MOV, RET,
```

**Used by:** `HLOAD`, `MUSCPU`.

### `FLSHWUP` — native SUBR

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Native game routine; source body below.

```text
SUBR FNBB RET,
```

### `FONTUNPACK` — native SUBR

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

Uses AUTOR1 to process game state.

```text
SUBR FRO1 AUTOR1 CALL, RET,
```

**Calls:** `AUTOR1`.

### `FRO12` — native SUBR

`Z80 register / stack ABI`

Uses AUTOR1 and AUTOR2 to process game state.

```text
SUBR FRO12 AUTOR1 CALL, AUTOR2 CALL, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`.

### `FRO123` — native SUBR

`Z80 register / stack ABI`

Uses AUTOR1 and AUTOR2 to process game state.

```text
SUBR FRO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `AUTOR3`.

### `FRO13` — native SUBR

`Z80 register / stack ABI`

Uses AUTOR2 to process game state.

```text
SUBR FRO13 VSTATUS R1 STA, AUTOR2 CALL, RET,
```

**Calls:** `AUTOR2`.

### `FRO2` — native SUBR

`Z80 register / stack ABI`

Native game routine; source body below.

```text
SUBR FRO2 VSTATUS R1 STA, RET,
```

### `FRO23` — native SUBR

`Z80 register / stack ABI`

Native game routine; source body below.

```text
SUBR FRO23 VSTATUS R1 STA, VSTATUS R2 STA, RET,
```

### `FRO3` — native SUBR

`Z80 register / stack ABI`

Native game routine; source body below.

```text
SUBR FRO3 VSTATUS R1 STA, RET,
```

### `HLOAD` — native SUBR

`Z80 register / stack ABI`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR HLOAD FETCH CALL, INCPC CALL, 0 H MVI, A L MOV, RET,
```

**Calls:** `FETCH`, `INCPC`.

**Used by:** `MUSCPU`.

### `IFSPAN` — native SUBR

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR INCPC MUSPC LHLD, H INX, MUSPC SHLD, RET,
```

**Used by:** `HLOAD`, `MUSCPU`.

### `loadpc` — native SUBR

`Z80 register / stack ABI`

loadpc installs MUSPC and STARTPC.

```text
SUBR loadpc MUSPC SHLD, STARTPC SHLD, RET,
```

**Used by:** `BMUSIC`, `EMUSIC`, `PMUSIC`.

### `LVRSTAT` — native SUBR

`Z80 register / stack ABI`

Load vstat for all runners in- A value.

```text
SUBR LVRSTAT ( load vstat for all runners in- A value )
VRSTAT R1 STA, VRSTAT R2 STA, VRSTAT R3 STA, VRSTAT R4 STA,
RET,
```

**Used by:** `BLPOSCHK`, `CHKCAUGHT`, `RUNDST`.

### `NBB` — native SUBR

`Z80 register / stack ABI`

NBB is the empty-bases no-op.

```text
SUBR NBB RET,
```

### `OFBLCHK` — native SUBR

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR PCJUMP MUSPC LHLD, M E MOV, H INX, M D MOV,
MUSPC SDED, RET,
```

**Used by:** `MUSCPU`.

### `relabs` — native SUBR

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO1 AUTOR1 CALL, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R2 B LXI, RET,
```

**Calls:** `AUTOR1`, `SETDBLPLAY`.

### `RO12` — native SUBR

`Z80 register / stack ABI`

RO12 activates both forced runners, selecting a double-play or ordinary target;

```text
SUBR RO12 AUTOR1 CALL, AUTOR2 CALL,
VMAGIC R2 B LXI, DPHIT LDA, A ANA, SETDBLPLAY JNZ,
VMAGIC R3 B LXI, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `SETDBLPLAY`.

### `RO123` — native SUBR

`Z80 register / stack ABI`

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
SUBR RO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL,
VMAGIC R3 B LXI, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R1 B LXI, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `AUTOR3`, `SETDBLPLAY`.

### `RO13` — native SUBR

`Z80 register / stack ABI`

RO13 handles first-and-third occupancy and may branch through SETDBLPLAY.

```text
SUBR RO13 AUTOR2 CALL, DPHIT LDA, A ANA,
VMAGIC R2 B LXI,
0<>, IF, AUTOR1 CALL, SETDBLPLAY JMP, THEN,
VMAGIC R3 B LXI, RET,
```

**Calls:** `AUTOR2`, `AUTOR1`, `SETDBLPLAY`.

### `RO2` — native SUBR

`Z80 register / stack ABI`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO2 HLSIDE LDA, A ANA, 0=, IF,
AUTOR1 CALL, THEN, VMAGIC R2 B LXI, RET,
```

**Calls:** `AUTOR1`.

### `RO23` — native SUBR

`Z80 register / stack ABI`

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
SUBR RO23 VMAGIC R3 B LXI, DPHIT LDA, A ANA,
0<>, IF, AUTOR1 CALL, HLSIDE LDA, A ANA, AUTOR2 CZ, THEN,
RET,
```

**Calls:** `AUTOR1`, `AUTOR2`.

### `RO3` — native SUBR

`Z80 register / stack ABI`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO3 VMAGIC R2 B LXI, DPHIT LDA, A ANA,
AUTOR1 CNZ, RET,
```

**Calls:** `AUTOR1`.

### `SETDBLPLAY` — native SUBR

`Z80 register / stack ABI`

Sets up double play HL-guy on 1st.

```text
SUBR SETDBLPLAY ( sets up double play HL-guy on 1st )
1 A MVI, DBLPLAY STA, RET,
```

**Used by:** `RO1`, `RO12`, `RO123`, `RO13`.

### `TAKEOFF` — native SUBR

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

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

`Z80 register / stack ABI`

HL-timer add if goes to zero return 1 else 0.

```text
SUBR TIMEDCR ( HL-timer add if goes to zero return 1 else 0 )
M A MOV, A ANA, RZ, ( allready zero returns false change )
A DCR, A M MOV, A ANA, 0=, IF, A INR, ( true change )
ELSE, A XRA, THEN, RET,
```

**Used by:** `PTAUTOTM`, `TIMER`.

### `TOOFCK` — native SUBR

`Z80 register / stack ABI`

Time out outfield check.

```text
SUBR TOOFCK ( time out outfield check )
TOOF# H LXI, M DCR, 0<>, IF, FF A MVI, TOOF STA,
ELSE, CMPOF CALL, EI, 1 A MVI, TOOFF STA, THEN, RET,
```

**Calls:** `CMPOF`.

**Used by:** `TIMER`.

### `WALKOVER` — native SUBR

`Z80 register / stack ABI`

Walked runner at base.

```text
SUBR WALKOVER ( walked runner at base )
1 A MVI, CAUGHT STA, THROWAROUND STA, RET,
```

**Used by:** `TIMER`.

### `write` — native SUBR

`Z80 register / stack ABI`

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

The catalog reproduces source implementations where present, including native Z80 routines and TERSE colon definitions. Host/compiler words whose own implementation is outside the supplied Extra Bases source are shown with an actual Extra Bases usage example and explicitly identified as host vocabulary. Stack signatures are taken from documented or source-verifiable behavior; native register-dependent routines retain their ABI designation pending individual register analysis. Source callers are static references, not runtime execution counts.
