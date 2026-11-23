# Extra Bases — TERSE Word Catalog

This catalog identifies TERSE words used or defined in Extra Bases, with their stack effects, functions, implementations, and references in DNA documentation.

## TERSE runtime and inherited words (34)

| Word / stack | Function | DNA docs |
| --- | --- | --- |
| [`-`](#---shared)<br><sub><code>( a b -- difference )</code></sub> | Subtract the top value from the preceding value. | Glossary |
| [`!`](#--shared)<br><sub><code>( value address -- )</code></sub> | Store one 16-bit cell. | Glossary |
| [`@`](#--shared-1)<br><sub><code>( address -- value )</code></sub> | Fetch one 16-bit cell. | Glossary |
| [`*`](#--shared-2)<br><sub><code>( a b -- product )</code></sub> | Multiply two stack values. | Glossary |
| [`/`](#--shared-3)<br><sub><code>( a b -- quotient )</code></sub> | Divide the preceding stack value by the top value. | Glossary |
| [`+`](#--shared-4)<br><sub><code>( a b -- sum )</code></sub> | Add two stack values. | Glossary |
| [`<`](#--shared-5)<br><sub><code>( a b -- flag )</code></sub> | Compare whether the preceding value is less than the top value. | Glossary |
| [`=`](#--shared-6)<br><sub><code>( a b -- flag )</code></sub> | Compare two values for equality. | Glossary |
| [`>`](#--shared-7)<br><sub><code>( a b -- flag )</code></sub> | Compare whether the preceding value is greater than the top value. | Glossary |
| [`0=`](#0--shared)<br><sub><code>( n -- flag )</code></sub> | Return a condition indicating zero. | Glossary |
| [`2DUP`](#2dup--shared)<br><sub><code>( a b -- a b a b )</code></sub> | Duplicate the top two stack cells. | Glossary |
| [`AND`](#and--shared)<br><sub><code>( a b -- result )</code></sub> | Bitwise AND of two values. | Glossary |
| [`ARRAY`](#array--shared)<br><sub><code>—</code></sub> | Allocate/name an indexed cell array from a the size. | Glossary |
| [`B!`](#b--shared)<br><sub><code>( byte address -- )</code></sub> | Store one byte. | Glossary |
| [`B@`](#b--shared-1)<br><sub><code>( address -- byte )</code></sub> | Fetch one byte. | Glossary |
| [`BARRAY`](#barray--shared)<br><sub><code>( size -- )</code></sub> | Allocate/name an indexed byte array from a the size. | Glossary |
| [`BEGIN`](#begin--shared)<br><sub><code>( -- )</code></sub> | Immediate XC wrapper that records a loop's object address. | Glossary |
| [`CODE`](#code--shared)<br><sub><code>—</code></sub> | Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry. | Glossary |
| [`CONSTANT`](#constant--shared)<br><sub><code>( value -- )</code></sub> | Define a constant from a value. | Glossary |
| [`DECIMAL`](#decimal--shared)<br><sub><code>( -- )</code></sub> | Select radix ten for parsing subsequent source numbers. | Glossary |
| [`DROP`](#drop--shared)<br><sub><code>( x -- )</code></sub> | Discard the top stack cell. | Glossary |
| [`DUP`](#dup--shared)<br><sub><code>( x -- x x )</code></sub> | Duplicate the top stack cell. | Glossary |
| [`ELSE`](#else--shared)<br><sub><code>( -- )</code></sub> | Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch. | Glossary |
| [`END`](#end--shared)<br><sub><code>( flag -- )</code></sub> | Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true. | Glossary |
| [`HEX`](#hex--shared)<br><sub><code>( -- )</code></sub> | Select radix sixteen for parsing subsequent source numbers. | Glossary |
| [`IF`](#if--shared)<br><sub><code>( flag -- )</code></sub> | Immediate XC wrapper that emits a conditional target branch through XC-IF. | Glossary |
| [`LIT`](#lit--shared)<br><sub><code>( -- value; inline cell )</code></sub> | Compiler literal mechanism used by INEXT's host macro. | Glossary |
| [`OR`](#or--shared)<br><sub><code>( a b -- result )</code></sub> | Bitwise inclusive OR of two values. | Glossary |
| [`OVER`](#over--shared)<br><sub><code>( a b -- a b a )</code></sub> | Copy the second stack cell to the top. | Glossary |
| [`ROT`](#rot--shared)<br><sub><code>( a b c -- b c a )</code></sub> | Rotate the top three stack cells. | Glossary |
| [`SWAP`](#swap--shared)<br><sub><code>( a b -- b a )</code></sub> | Exchange the top two stack cells. | Glossary |
| [`THEN`](#then--shared)<br><sub><code>( -- )</code></sub> | Immediate XC wrapper that resolves a saved target branch destination. | Glossary |
| [`VARIABLE`](#variable--shared)<br><sub><code>( -- )</code></sub> | Allocate/name a cell variable with the initial value in this dialect. | Glossary |
| [`XOR`](#xor--shared)<br><sub><code>( a b -- result )</code></sub> | Bitwise exclusive OR of two values. | Glossary |

## Extra Bases colon definitions (201)

| Word / stack | Function | DNA docs |
| --- | --- | --- |
| [`]'[`](#--terse)<br><sub><code>( -- )</code></sub> | Game-defined operation; source body below. | — |
| [`^`](#--terse-1)<br><sub><code>( -- )</code></sub> | Uses ABVOLS and MCVOLS to compose game logic. | — |
| [`<INTERRUPTS`](#interrupts--terse)<br><sub><code>( -- )</code></sub> | Mark the start of interrupt data. | — |
| [`ABVOLS`](#abvols--terse)<br><sub><code>( volume -- )</code></sub> | Emit the music volume command. | — |
| [`ACT,`](#act--terse)<br><sub><code>( -- )</code></sub> | Emit a playaction record. | — |
| [`ANOTE`](#anote--terse)<br><sub><code>( -- )</code></sub> | Uses ATONE and DURATION to compose game logic. | — |
| [`ATONE`](#atone--terse)<br><sub><code>( tone -- )</code></sub> | Emit tone setting for channel A. | — |
| [`BACT,`](#bact--terse)<br><sub><code>( -- )</code></sub> | Emit a ball-action record. | — |
| [`BALLTIME`](#balltime--terse)<br><sub><code>—</code></sub> | Balls process. | — |
| [`BLDST,`](#bldst--terse)<br><sub><code>( -- )</code></sub> | Emit the ball destination command. | — |
| [`BLMOT,`](#blmot--terse)<br><sub><code>( -- )</code></sub> | Emit the ball motion command. | — |
| [`BNOTE`](#bnote--terse)<br><sub><code>—</code></sub> | Uses BTONE and DURATION to compose game logic. | — |
| [`BONE`](#bone--terse)<br><sub><code>( address -- )</code></sub> | Store byte value 1. | — |
| [`BTONE`](#btone--terse)<br><sub><code>( tone -- )</code></sub> | Emit tone setting for channel B. | — |
| [`BV`](#bv--terse)<br><sub><code>( -- )</code></sub> | Define a named byte variable. | — |
| [`BV=`](#bv--terse-1)<br><sub><code>( -- )</code></sub> | Uses BV to compose game logic. | — |
| [`BZERO`](#bzero--terse)<br><sub><code>( address -- )</code></sub> | Store byte value 0. | — |
| [`C=`](#c--terse)<br><sub><code>( value -- )</code></sub> | Uses CONSTANT to compose game logic. | — |
| [`CHGS`](#chgs--terse)<br><sub><code>—</code></sub> | CHGS posts CHANGE SIDES; | — |
| [`CHKFLSHSTAY`](#chkflshstay--terse)<br><sub><code>—</code></sub> | When isccp turn off check for wupwrt. | — |
| [`CHKGMCNT`](#chkgmcnt--terse)<br><sub><code>—</code></sub> | CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte. | — |
| [`CMAJOR`](#cmajor--terse)<br><sub><code>( -- )</code></sub> | Initialize the C-major sound pattern. | — |
| [`CNLINE`](#cnline--terse)<br><sub><code>( -- )</code></sub> | CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state. | — |
| [`CNOTE`](#cnote--terse)<br><sub><code>( -- )</code></sub> | Uses CTONE and DURATION to compose game logic. | — |
| [`CONGR`](#congr--terse)<br><sub><code>( -- )</code></sub> | Display the congratulatory prompt. | — |
| [`CPOST`](#cpost--terse)<br><sub><code>( x y options char -- )</code></sub> | Draw one character at the specified position. | — |
| [`CREDARROW`](#credarrow--terse)<br><sub><code>—</code></sub> | Update last inning arrow. | — |
| [`CTONE`](#ctone--terse)<br><sub><code>( tone -- )</code></sub> | Emit tone setting for channel C. | — |
| [`DEACT,`](#deact--terse)<br><sub><code>( -- )</code></sub> | Emit vector-deactivation command. | — |
| [`DLINE`](#dline--terse)<br><sub><code>—</code></sub> | Draw a line , given X Y start coor X Y ending coor. | — |
| [`DOCHGS`](#dochgs--terse)<br><sub><code>( -- )</code></sub> | DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; | — |
| [`DOEHOMER`](#doehomer--terse)<br><sub><code>( -- )</code></sub> | DOEHOMER only posts the text. | — |
| [`DOGOVER`](#dogover--terse)<br><sub><code>—</code></sub> | Do game over. | — |
| [`DOHOMER`](#dohomer--terse)<br><sub><code>( -- )</code></sub> | DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; | — |
| [`DOSAFE`](#dosafe--terse)<br><sub><code>( -- )</code></sub> | DOSAFE combines music/text. | — |
| [`DOSBALL`](#dosball--terse)<br><sub><code>—</code></sub> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. | — |
| [`DOSOUT`](#dosout--terse)<br><sub><code>—</code></sub> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. | — |
| [`DOSSTRIKE`](#dosstrike--terse)<br><sub><code>—</code></sub> | DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. | — |
| [`DP1`](#dp1--terse)<br><sub><code>( -- )</code></sub> | Display the one-coin deposit prompt. | — |
| [`DP12CN`](#dp12cn--terse)<br><sub><code>—</code></sub> | Uses B@ and SPOST to compose game logic. | — |
| [`DP1CN`](#dp1cn--terse)<br><sub><code>—</code></sub> | Uses SPOST to compose game logic. | — |
| [`DPCN`](#dpcn--terse)<br><sub><code>—</code></sub> | Wait for next coin. | — |
| [`dpost`](#dpost--terse)<br><sub><code>—</code></sub> | dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit. | — |
| [`DTC`](#dtc--terse)<br><sub><code>( -- )</code></sub> | DTC selects decimal and invokes the host editor. | — |
| [`DURATION`](#duration--terse)<br><sub><code>( duration -- )</code></sub> | Emit a note-duration command. | — |
| [`DWAIT`](#dwait--terse)<br><sub><code>—</code></sub> | DWAIT runs nested loops with interrupts enabled and disables them on return; | — |
| [`F=`](#f--terse)<br><sub><code>( -- )</code></sub> | Declare a forward word with the game's source shorthand. | — |
| [`F1STLS`](#f1stls--terse)<br><sub><code>( -- )</code></sub> | Select the first-base left-side action. | — |
| [`F1STRS`](#f1strs--terse)<br><sub><code>( -- )</code></sub> | Select the first-base right-side action. | — |
| [`F2NDLS`](#f2ndls--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`F2NDRS`](#f2ndrs--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`F3RDLS`](#f3rdls--terse)<br><sub><code>( -- )</code></sub> | Select the third-base left-side action. | — |
| [`F3RDRS`](#f3rdrs--terse)<br><sub><code>( -- )</code></sub> | Select the third-base right-side action. | — |
| [`FBLLS`](#fblls--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`FBLRS`](#fblrs--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`FIELDWRT`](#fieldwrt--terse)<br><sub><code>—</code></sub> | Write field outline. | — |
| [`FL`](#fl--terse)<br><sub><code>—</code></sub> | Set up all of background. | — |
| [`FLDDST,`](#flddst--terse)<br><sub><code>( -- )</code></sub> | Emit the fielder destination command. | — |
| [`FLFILL`](#flfill--terse)<br><sub><code>( -- )</code></sub> | FLFILL fills the background while allowing interrupts; | — |
| [`FLSHME`](#flshme--terse)<br><sub><code>—</code></sub> | FLSHME executes only a nonzero address whose top two bits are clear; | — |
| [`FLSHTON`](#flshton--terse)<br><sub><code>( -- )</code></sub> | FLSHTON saves a callback and starts its timer. | — |
| [`FOULTIME`](#foultime--terse)<br><sub><code>—</code></sub> | Foulball process. | — |
| [`FOWR`](#fowr--terse)<br><sub><code>( -- )</code></sub> | Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells. | — |
| [`FSSLS`](#fssls--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`FSSRS`](#fssrs--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`GETF`](#getf--terse)<br><sub><code>—</code></sub> | GETF fetches FIELD bytes sequentially; | — |
| [`GRNDRACTION`](#grndraction--terse)<br><sub><code>—</code></sub> | Given sectnm set up infield action. | — |
| [`GRNDRHIT`](#grndrhit--terse)<br><sub><code>—</code></sub> | Grounder. | — |
| [`HITDST`](#hitdst--terse)<br><sub><code>—</code></sub> | Chooses hit location. | — |
| [`HLLS`](#hlls--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`HLS`](#hls--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`HMS`](#hms--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`HOM`](#hom--terse)<br><sub><code>—</code></sub> | HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; | — |
| [`HRBY2`](#hrby2--terse)<br><sub><code>—</code></sub> | HRBY2 halves HRAT. | — |
| [`HRLS`](#hrls--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`HRS`](#hrs--terse)<br><sub><code>( -- )</code></sub> | Uses BONE to compose game logic. | — |
| [`I'`](#i--terse)<br><sub><code>( -- )</code></sub> | Emit the target's indexed immediate reference. | — |
| [`ICODE`](#icode--terse)<br><sub><code>—</code></sub> | ICODE starts a CODE definition and emits the scheduler/register-save prologue: set INLIN/IPNT, swap alternate register banks and preserve the active register sets. | — |
| [`INEXT`](#inext--terse)<br><sub><code>( -- )</code></sub> | INEXT emits a jump to IEX; | — |
| [`INLOG`](#inlog--terse)<br><sub><code>—</code></sub> | Infield master logic. | — |
| [`INNODDS`](#innodds--terse)<br><sub><code>—</code></sub> | INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state; | — |
| [`INSCN`](#inscn--terse)<br><sub><code>—</code></sub> | Insert coin call. | — |
| [`INSTRC`](#instrc--terse)<br><sub><code>—</code></sub> | Instructions. | — |
| [`INSWAIT`](#inswait--terse)<br><sub><code>—</code></sub> | INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return. | — |
| [`INTERRUPTS>`](#interrupts--terse-1)<br><sub><code>( -- )</code></sub> | Emit the interrupt-vector dispatch jump. | — |
| [`INTHIGHRES`](#inthighres--terse)<br><sub><code>( -- )</code></sub> | Intialize screen for commercial mode. | — |
| [`ISCN`](#iscn--terse)<br><sub><code>( -- )</code></sub> | Display the V15 instruction message. | — |
| [`LABLE`](#lable--terse)<br><sub><code>( -- )</code></sub> | Provide the original source's label-definition alias. | — |
| [`LCB,`](#lcb--terse)<br><sub><code>( -- )</code></sub> | Uses ACT, and DEACT, to compose game logic. | — |
| [`LDINFLDPA`](#ldinfldpa--terse)<br><sub><code>( -- )</code></sub> | LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain. | — |
| [`LDPC`](#ldpc--terse)<br><sub><code>( -- )</code></sub> | Emit/load the music program-counter value. | — |
| [`LDPCC`](#ldpcc--terse)<br><sub><code>( -- )</code></sub> | Emit/load a music program-counter command. | — |
| [`LK,`](#lk--terse)<br><sub><code>( -- )</code></sub> | Uses BACT, and DEACT, to compose game logic. | — |
| [`LSETTFCOOR`](#lsettfcoor--terse)<br><sub><code>—</code></sub> | Set take field coor & status -active , xpand. | — |
| [`MASTER`](#master--terse)<br><sub><code>( -- )</code></sub> | Define the game's master music stream. | — |
| [`MBALL`](#mball--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MCANNON`](#mcannon--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MCOIN`](#mcoin--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MCVOLS`](#mcvols--terse)<br><sub><code>( volume -- )</code></sub> | Emit music-channel volume values. | — |
| [`MFENCE`](#mfence--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MFOUL`](#mfoul--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MHIT`](#mhit--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MLINN`](#mlinn--terse)<br><sub><code>—</code></sub> | Mark last inning. | — |
| [`MOPENERS`](#mopeners--terse)<br><sub><code>( -- )</code></sub> | Uses PMUSIC to compose game logic. | — |
| [`MOUT`](#mout--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MSAFE`](#msafe--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MSTRIKE`](#mstrike--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`MYAH`](#myah--terse)<br><sub><code>( -- )</code></sub> | Uses BMUSIC to compose game logic. | — |
| [`NOISE`](#noise--terse)<br><sub><code>( -- )</code></sub> | Emit a noise/sound command. | — |
| [`NOTES`](#notes--terse)<br><sub><code>( -- )</code></sub> | Uses ATONE and BTONE to compose game logic. | — |
| [`NPOST`](#npost--terse)<br><sub><code>—</code></sub> | Post a bcd number on the screen ; see options. | — |
| [`OFFDST,`](#offdst--terse)<br><sub><code>( -- )</code></sub> | Emit the outfielder destination command. | — |
| [`OFMOT,`](#ofmot--terse)<br><sub><code>( -- )</code></sub> | Emit the outfield motion command. | — |
| [`ON1ST,`](#on1st--terse)<br><sub><code>( -- )</code></sub> | Emit the first-base playaction command. | — |
| [`ON2ND,`](#on2nd--terse)<br><sub><code>( -- )</code></sub> | Emit the second-base playaction command. | — |
| [`ON3RD,`](#on3rd--terse)<br><sub><code>( -- )</code></sub> | Emit the third-base playaction command. | — |
| [`OUTFLDHIT`](#outfldhit--terse)<br><sub><code>—</code></sub> | Fly ball. | — |
| [`OUTLINE`](#outline--terse)<br><sub><code>—</code></sub> | Creates rectanguler outline. | — |
| [`OUTTIME`](#outtime--terse)<br><sub><code>—</code></sub> | Out prc. | — |
| [`PLRCHK`](#plrchk--terse)<br><sub><code>—</code></sub> | PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL; | — |
| [`PLRSELECT`](#plrselect--terse)<br><sub><code>( -- )</code></sub> | Select singel player or 2 player. | — |
| [`PPOST`](#ppost--terse)<br><sub><code>( x y options string -- x y options )</code></sub> | Draw a counted string and keep drawing coordinates. | — |
| [`PUP`](#pup--terse)<br><sub><code>—</code></sub> | Power up routine. | — |
| [`PX0`](#px0--terse)<br><sub><code>( -- )</code></sub> | Emit zero/white pixel patterns and define PX1/PX0 to select them. | — |
| [`PX1`](#px1--terse)<br><sub><code>( -- )</code></sub> | Emit zero/white pixel patterns and define PX1/PX0 to select them. | — |
| [`QUIET`](#quiet--terse)<br><sub><code>( -- )</code></sub> | Uses ABVOLS and MCVOLS to compose game logic. | — |
| [`QUIT`](#quit--terse)<br><sub><code>( -- )</code></sub> | Uses HERE and LDPC to compose game logic. | — |
| [`RCB,`](#rcb--terse)<br><sub><code>( -- )</code></sub> | Uses ACT, and DEACT, to compose game logic. | — |
| [`RDRNDNTE`](#rdrndnte--terse)<br><sub><code>( -- )</code></sub> | Emit a randomized note with a rest interval. | — |
| [`RECLINE`](#recline--terse)<br><sub><code>—</code></sub> | RECLINE derives one horizontal row from retained rectangle arguments. | — |
| [`RECTAN`](#rectan--terse)<br><sub><code>—</code></sub> | In X, Y, X length, Y length, pxtype set. | — |
| [`REST`](#rest--terse)<br><sub><code>( duration -- )</code></sub> | Insert a silent music interval. | — |
| [`REST,`](#rest--terse-1)<br><sub><code>( -- )</code></sub> | Emit a resting playaction record. | — |
| [`RETPA`](#retpa--terse)<br><sub><code>—</code></sub> | Return to position pa. | — |
| [`RNDNTE`](#rndnte--terse)<br><sub><code>( -- )</code></sub> | Emit a randomized musical note. | — |
| [`RRRNDNTE`](#rrrndnte--terse)<br><sub><code>( -- )</code></sub> | Emit a sequence of randomized notes. | — |
| [`RUN1CHK1ST`](#run1chk1st--terse)<br><sub><code>—</code></sub> | RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; | — |
| [`RUN1CHK2ND`](#run1chk2nd--terse)<br><sub><code>—</code></sub> | RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; | — |
| [`RUN2CHK`](#run2chk--terse)<br><sub><code>—</code></sub> | RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. | — |
| [`RUN2CHK12ND`](#run2chk12nd--terse)<br><sub><code>—</code></sub> | RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; | — |
| [`RUN2CHK1ST`](#run2chk1st--terse)<br><sub><code>—</code></sub> | RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. | — |
| [`RUN3CHK`](#run3chk--terse)<br><sub><code>—</code></sub> | RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. | — |
| [`RUNDST,`](#rundst--terse)<br><sub><code>( -- )</code></sub> | Emit the runner destination command. | — |
| [`S!`](#s--terse)<br><sub><code>( address value -- )</code></sub> | Store cell with address-first arguments. | — |
| [`S10`](#s10--terse)<br><sub><code>( -- )</code></sub> | S10 starts INTERRUPTS0 through ISTART; | — |
| [`S11`](#s11--terse)<br><sub><code>( -- )</code></sub> | S11 starts INTERRUPTS1. | — |
| [`SB!`](#sb--terse)<br><sub><code>( address value -- )</code></sub> | Store byte with address-first arguments. | — |
| [`SBALL1`](#sball1--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SBALL2`](#sball2--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SBALL3`](#sball3--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SBO`](#sbo--terse)<br><sub><code>—</code></sub> | SBO posts the three $30-based count characters at their fixed positions. | — |
| [`SCOREME`](#scoreme--terse)<br><sub><code>—</code></sub> | Plop scores up. | — |
| [`SCRERASE`](#screrase--terse)<br><sub><code>( -- )</code></sub> | Erase entire screen. | — |
| [`SCRS`](#scrs--terse)<br><sub><code>—</code></sub> | SCRS clears two score rectangles and draws zero score characters. | — |
| [`SETFDST`](#setfdst--terse)<br><sub><code>—</code></sub> | Set up fielder destination values. | — |
| [`SETTF`](#settf--terse)<br><sub><code>( -- )</code></sub> | SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading. | — |
| [`SETTFPA`](#settfpa--terse)<br><sub><code>—</code></sub> | Take field pa. | — |
| [`SFOUL`](#sfoul--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SGO`](#sgo--terse)<br><sub><code>—</code></sub> | Uses SPOST to compose game logic. | — |
| [`SHOMER`](#shomer--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SORRY`](#sorry--terse)<br><sub><code>( -- )</code></sub> | Display the losing-player prompt. | — |
| [`SOUT1`](#sout1--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SOUT2`](#sout2--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SOUT3`](#sout3--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SPLR`](#splr--terse)<br><sub><code>—</code></sub> | SPLR12/SPLR display available player choices; | — |
| [`SPLR12`](#splr12--terse)<br><sub><code>—</code></sub> | SPLR12/SPLR display available player choices; | — |
| [`SPOST`](#spost--terse)<br><sub><code>( x y options string -- )</code></sub> | Draw a string. | — |
| [`SSAFE`](#ssafe--terse)<br><sub><code>—</code></sub> | SSAFE also redraws counts with SBO. | — |
| [`SSTRIKE1`](#sstrike1--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`SSTRIKE2`](#sstrike2--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`STFLD`](#stfld--terse)<br><sub><code>( -- )</code></sub> | STFLD installs RETPA and TAKEFIELD. | — |
| [`STP,`](#stp--terse)<br><sub><code>( -- )</code></sub> | Emit a standing-action record. | — |
| [`STRIKETIME`](#striketime--terse)<br><sub><code>—</code></sub> | Strike process. | — |
| [`STRINGGO`](#stringgo--terse)<br><sub><code>—</code></sub> | Given string , stringerase. | — |
| [`STRINGPRC`](#stringprc--terse)<br><sub><code>—</code></sub> | String display. | — |
| [`STRTBALL`](#strtball--terse)<br><sub><code>—</code></sub> | STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music. | — |
| [`SUP`](#sup--terse)<br><sub><code>—</code></sub> | SUP posts UP. | — |
| [`SW-30`](#sw-30--terse)<br><sub><code>—</code></sub> | X=1. | — |
| [`SW-45`](#sw-45--terse)<br><sub><code>—</code></sub> | X=1. | — |
| [`SW-90`](#sw-90--terse)<br><sub><code>—</code></sub> | SW-90 ignores direction/random inputs and returns the far-right foul sector. | — |
| [`SW+30`](#sw30--terse)<br><sub><code>—</code></sub> | X=1. | — |
| [`SW+45`](#sw45--terse)<br><sub><code>—</code></sub> | X=1. | — |
| [`SW+90`](#sw90--terse)<br><sub><code>—</code></sub> | SW+90 always returns foul-left after dropping its inputs. | — |
| [`SW0`](#sw0--terse)<br><sub><code>—</code></sub> | X=1. | — |
| [`SWALK`](#swalk--terse)<br><sub><code>—</code></sub> | Uses ROT and SPOST to compose game logic. | — |
| [`TCNT`](#tcnt--terse)<br><sub><code>—</code></sub> | TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits. | — |
| [`TERSECHK`](#tersechk--terse)<br><sub><code>—</code></sub> | Look at terse routine flags. | — |
| [`TF`](#tf--terse)<br><sub><code>—</code></sub> | Take the field. | — |
| [`THW,`](#thw--terse)<br><sub><code>( -- )</code></sub> | Emit the throw command. | — |
| [`TWAIT`](#twait--terse)<br><sub><code>—</code></sub> | Terse wait period. | — |
| [`V`](#v--terse)<br><sub><code>( -- )</code></sub> | Uses VARIABLE to compose game logic. | — |
| [`V=`](#v--terse-1)<br><sub><code>( -- )</code></sub> | Uses V and VARIABLE to compose game logic. | — |
| [`VIBS`](#vibs--terse)<br><sub><code>( value -- )</code></sub> | Emit a vibrato setting. | — |
| [`VIS`](#vis--terse)<br><sub><code>—</code></sub> | HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; | — |
| [`WHBODDS`](#whbodds--terse)<br><sub><code>—</code></sub> | Sets who is on base calculates play odds. | — |
| [`WTHW,`](#wthw--terse)<br><sub><code>( -- )</code></sub> | Emit the wait-for-throw command. | — |
| [`WUPGO`](#wupgo--terse)<br><sub><code>—</code></sub> | WUPGO activates WHOSUP with runner/automatic-forward flags; | — |
| [`WUPTON`](#wupton--terse)<br><sub><code>( -- )</code></sub> | WUPTON installs WUPWRT. | — |
| [`WUPWRT`](#wupwrt--terse)<br><sub><code>—</code></sub> | Write whos up for flash. | — |
| [`YOU1ST`](#you1st--terse)<br><sub><code>—</code></sub> | YOU1ST posts the greeting/extra-inning challenge, then continues to 306. | — |
| [`ZERORAM`](#zeroram--terse)<br><sub><code>—</code></sub> | ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. | — |

## Extra Bases native CODE words (85)

| Word / stack | Function | DNA docs |
| --- | --- | --- |
| [`+LOOP`](#loop--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Uses LOOP to process game state. | Glossary |
| [`ALLFLDACT`](#allfldact--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Sets all fielders active. | — |
| [`ANMSEQLOAD`](#anmseqload--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Finds proper anm seq by per=#. | — |
| [`BALLERASE`](#ballerase--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | BALLERASE preserves BC/IY around native BLERASE and returns to TERSE. | — |
| [`BATHIT`](#bathit--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | He hit it time to get em running. | — |
| [`BATHITCHK`](#bathitchk--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Check window for hit. | — |
| [`BATSWING`](#batswing--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Swings bat if appropriate. | — |
| [`BATWRITE`](#batwrite--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Xor bat from swingtype. | — |
| [`BCD+`](#bcd--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Binary to decimal arithmatic. | — |
| [`BLDST`](#bldst--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Ball thrown or hit. | — |
| [`BLMOTION`](#blmotion--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Set pc for ram pa table -tractor ball. | — |
| [`BLPOSCHK`](#blposchk--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | BLPOSCHK branches on HITYET. | — |
| [`BMUSIC`](#bmusic--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay. | — |
| [`BUTTONCHK`](#buttonchk--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Reads buttons for swing run & pitch it. | — |
| [`CHKCAUGHT`](#chkcaught--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Caught set in interrupt. | — |
| [`CHKGROUNDER`](#chkgrounder--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | If grounder adjust ball direction. | — |
| [`CHKSCRTIME`](#chkscrtime--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Score process. | — |
| [`CLRBLST`](#clrblst--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading. | — |
| [`cnline`](#cnline--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Calls vector line write. | — |
| [`COMPDE`](#compde--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | COMPDE applies the same operation to DE while preserving HL. | — |
| [`COMPHL`](#comphl--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Compliments HL. | — |
| [`COUNT`](#count--native-code)<br><sub><code>( address -- address+1 length )</code></sub> | Fetch the address and length of a counted string. | Glossary |
| [`cpost`](#cpost--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Post an ascii-character on the screen ; see opt. | — |
| [`DEACTIVATE`](#deactivate--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Reset active bit in status. | — |
| [`DI`](#di--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Disable interrupts. | — |
| [`DIVHLBY4`](#divhlby4--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Divide HL by 4. | — |
| [`DO`](#do--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Enter a counted loop. | Glossary |
| [`DSTCALC`](#dstcalc--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Calc deltas to destination. | — |
| [`DSTLD`](#dstld--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively. | — |
| [`EI`](#ei--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Uses SWAN to process game state. | — |
| [`EIDI`](#eidi--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. | — |
| [`EMUSIC`](#emusic--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | EMUSIC selects ENDMUSIC and initializes timing/repetition to one; | — |
| [`EX`](#ex--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation. | — |
| [`FILL`](#fill--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Fill a memory/screen range. | Glossary |
| [`FLDDST`](#flddst--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Fielders take position logic. | — |
| [`FLSHOFF`](#flshoff--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | FLSHOFF disables flashing and services cleanup under DI. | — |
| [`FMIRROR`](#fmirror--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order. | — |
| [`HITRUN`](#hitrun--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Activate proper runners and set trwbase. | — |
| [`HOMERCHK`](#homerchk--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Chk for homer or fence hit. | — |
| [`I`](#i--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Native game routine; source body below. | — |
| [`IEX`](#iex--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | IEX restores saved registers, enables interrupts and returns. | — |
| [`INDEXW`](#indexw--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Call routine A- disp HL- table add. | — |
| [`INFIELD`](#infield--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Uses IFSPAN to process game state. | — |
| [`INFLDACT`](#infldact--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Set infielders active. | — |
| [`ISTART`](#istart--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT. | — |
| [`KILLOF`](#killof--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Stop outfield tractor ball control. | — |
| [`LOADANM`](#loadanm--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Loads magic & anm HL-top of playact table. | — |
| [`LOOP`](#loop--native-code-1)<br><sub><code>Z80 register / stack ABI</code></sub> | Advance or terminate a counted loop. | Glossary |
| [`MULTHLBY4`](#multhlby4--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign. | — |
| [`MUSCPU`](#muscpu--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Declare cross-screen dispatch labels and begin assembling MUSCPU. | — |
| [`NDUP`](#ndup--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Uses ARRAY to process game state. | — |
| [`OFFFDST`](#offfdst--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | All player off field control. | — |
| [`OFLDTBL`](#ofldtbl--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | OFLDTBL gives all three outfielders OFTBLPA, activates them and returns; | — |
| [`OFMOTION`](#ofmotion--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Set pc for ram pa table -tractor ball. | — |
| [`ON1ST`](#on1st--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; | — |
| [`ON2ND`](#on2nd--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; | — |
| [`ON3RD`](#on3rd--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; | — |
| [`OPCODECHK`](#opcodechk--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Called by plyactupdate. | — |
| [`OUTFLDACT`](#outfldact--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Sets outfielders active. | — |
| [`PACTLOAD`](#pactload--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Loads vect from plyact. | — |
| [`PATFETCH`](#patfetch--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Loads actual pattern IX-vector. | — |
| [`PERSPECTIVE`](#perspective--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Pattern size determined by y. | — |
| [`PLAYACT`](#playact--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Called in intterupt does update prc. | — |
| [`PMUSIC`](#pmusic--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer. | — |
| [`PTAUTOTM`](#ptautotm--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Pitch auto timer. | — |
| [`RESETRUNNERS`](#resetrunners--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Reset runners to order of on base. | — |
| [`RND`](#rnd--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Generate a random number. | — |
| [`RUNDST`](#rundst--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Runner base running control. | — |
| [`SENTRY`](#sentry--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Game loop. | — |
| [`SETACT`](#setact--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Sets avtive bit in status. | — |
| [`STARTMUSIC`](#startmusic--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | STARTMUSIC clears its request. | — |
| [`strtline`](#strtline--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Given X Y sets up start of line. | — |
| [`SWAN`](#swan--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Transfer interrupt/screen execution state. | — |
| [`TBALLPITCH`](#tballpitch--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Loads pitch velocities. | — |
| [`THROWANIM`](#throwanim--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Sets up BLDST and player anim. | — |
| [`THROWBALL`](#throwball--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Finish scoring first. | — |
| [`THWANMSET`](#thwanmset--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Set up throw animation. | — |
| [`TIMER`](#timer--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Interrupt timer routine. | — |
| [`VECTOR`](#vector--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Vectors and limit checks. | — |
| [`VERASE`](#verase--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Does pattern board erase from vector IX. | — |
| [`VWRITE`](#vwrite--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Does reloff relabs patbrd from vector IX. | — |
| [`WAIT`](#wait--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Given A wait period stop every thing. | — |
| [`WAITTHRW`](#waitthrw--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Sets flag for 1stbaseman to wait throw. | — |
| [`WRITE`](#write--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Write with X Y sizes ; pattern with no header. | — |
| [`WRITR`](#writr--native-code)<br><sub><code>Z80 register / stack ABI</code></sub> | Write with a relative pattern. | — |

## Native SUBR helpers (47)

| Word / stack | Function | DNA docs |
| --- | --- | --- |
| [`AUTOR1`](#autor1--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners. | — |
| [`AUTOR2`](#autor2--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Run second-runner automation logic. | — |
| [`AUTOR3`](#autor3--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Run third-runner automation logic. | — |
| [`BLERASE`](#blerase--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Erases ball. | — |
| [`CHKATBS`](#chkatbs--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Check if active player at base in- A vstatus. | — |
| [`CHKCOIN1`](#chkcoin1--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Chk door 1 for coin drop. | — |
| [`CHKCOIN2`](#chkcoin2--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Chk door 2 for coin drop. | — |
| [`CMPOF`](#cmpof--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Calculates proper deltas and patterns. | — |
| [`COLORBAND`](#colorband--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled. | — |
| [`debounce`](#debounce--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Debounce input transitions. | — |
| [`FETCH`](#fetch--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. | — |
| [`FLSHWUP`](#flshwup--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Handle flash callback. | — |
| [`FNBB`](#fnbb--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Native game routine; source body below. | — |
| [`FONTUNPACK`](#fontunpack--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | FONTUNPACK reads two packed bytes and starts a five-row unpack loop. | — |
| [`FRO1`](#fro1--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Uses AUTOR1 to process game state. | — |
| [`FRO12`](#fro12--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Uses AUTOR1 and AUTOR2 to process game state. | — |
| [`FRO123`](#fro123--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Uses AUTOR1 and AUTOR2 to process game state. | — |
| [`FRO13`](#fro13--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Uses AUTOR2 to process game state. | — |
| [`FRO2`](#fro2--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Native game routine; source body below. | — |
| [`FRO23`](#fro23--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Native game routine; source body below. | — |
| [`FRO3`](#fro3--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Native game routine; source body below. | — |
| [`HLOAD`](#hload--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. | — |
| [`IFSPAN`](#ifspan--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value. | — |
| [`INCPC`](#incpc--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. | — |
| [`loadpc`](#loadpc--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | loadpc installs MUSPC and STARTPC. | — |
| [`LVRSTAT`](#lvrstat--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Load vstat for all runners in- A value. | — |
| [`NBB`](#nbb--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | NBB is the empty-bases no-op. | — |
| [`OFBLCHK`](#ofblchk--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Chk for catch or close when cmsw. | — |
| [`PCJUMP`](#pcjump--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. | — |
| [`relabs`](#relabs--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Relative X Y to magic address conversion. | — |
| [`reloff`](#reloff--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Compute relative offset of x , y of pattern. | — |
| [`RO1`](#ro1--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. | — |
| [`RO12`](#ro12--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | RO12 activates both forced runners, selecting a double-play or ordinary target; | — |
| [`RO123`](#ro123--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | RO23 and RO123 choose forced advancement and double-play targets for their base combinations. | — |
| [`RO13`](#ro13--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | RO13 handles first-and-third occupancy and may branch through SETDBLPLAY. | — |
| [`RO2`](#ro2--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. | — |
| [`RO23`](#ro23--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | RO23 and RO123 choose forced advancement and double-play targets for their base combinations. | — |
| [`RO3`](#ro3--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. | — |
| [`SETDBLPLAY`](#setdblplay--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Sets up double play HL-guy on 1st. | — |
| [`TAKEOFF`](#takeoff--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Turn proper runners on. | — |
| [`TBALLPRC`](#tballprc--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Pitch or control outfield. | — |
| [`TBLVEL`](#tblvel--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Tractorball vel HL-# add. D-max vel. | — |
| [`TIMEDCR`](#timedcr--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | HL-timer add if goes to zero return 1 else 0. | — |
| [`TOOFCK`](#toofck--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Time out outfield check. | — |
| [`WALKOVER`](#walkover--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Walked runner at base. | — |
| [`write`](#write--native-subr)<br><sub><code>Z80 register / stack ABI</code></sub> | Software write with x y size. | — |
| [`writep`](#writep--native-subr)<br><sub><code>( IY=patadr BC=ex/mag+shf HL=scradr --- )</code></sub> | Software write with pattern size on pattern. | — |

## Host and cross-compiler definitions (2)

| Word / stack | Function | DNA docs |
| --- | --- | --- |
| [`BASE!`](#base--terse)<br><sub><code>( -- )</code></sub> | Set the number base. | — |
| [`BASE@`](#base--terse-1)<br><sub><code>( -- )</code></sub> | Fetch the current number base. | — |

## Implementations

### `-` — shared

`( a b -- difference )`

Subtract the top value from the preceding value.

[Source block 87, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `!` — shared

`( value address -- )`

Store one 16-bit cell.

[Source block 87, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `@` — shared

`( address -- value )`

Fetch one 16-bit cell.

[Source block 87, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `*` — shared

`( a b -- product )`

Multiply two stack values.

[Source block 87, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `/` — shared

`( a b -- quotient )`

Divide the preceding stack value by the top value.

[Source block 86, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-86)

### `+` — shared

`( a b -- sum )`

Add two stack values.

[Source block 87, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `<` — shared

`( a b -- flag )`

Compare whether the preceding value is less than the top value.

[Source block 88, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-88)

### `=` — shared

`( a b -- flag )`

Compare two values for equality.

[Source block 88, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-88)

### `>` — shared

`( a b -- flag )`

Compare whether the preceding value is greater than the top value.

[Source block 88, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-88)

### `0=` — shared

`( n -- flag )`

Return a condition indicating zero.

[Source block 88, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-88)

### `2DUP` — shared

`( a b -- a b a b )`

Duplicate the top two stack cells.

[Source block 87, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `AND` — shared

`( a b -- result )`

Bitwise AND of two values.

**Used by:** `CREDARROW`, `FLSHME`, `INSWAIT`, `OUTTIME`, `PLRCHK`, `RETPA`, `TBALLPRC`, `TF`, `dpost`.

[Source block 88, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-88)

### `ARRAY` — shared

Allocate/name an indexed cell array from a the size.

**Used by:** `NDUP`.

[Source block 152, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-152)

### `B!` — shared

`( byte address -- )`

Store one byte.

**Used by:** `BALLTIME`, `CREDARROW`, `DOGOVER`, `DPCN`, `FL`, `FOULTIME`, `GETF`, `GRNDRACTION`, `GRNDRHIT`, `HITDST`, `HRBY2`, `INLOG`, `INNODDS`, `LSETTFCOOR`, `OUTFLDHIT`, `OUTTIME`, `SB!`, `STRIKETIME`, `STRINGGO`, `STRINGPRC`, `TF`, `WHBODDS`, `ZERORAM`.

[Source block 87, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `B@` — shared

`( address -- byte )`

Fetch one byte.

**Used by:** `BALLTIME`, `CHKFLSHSTAY`, `CHKGMCNT`, `CREDARROW`, `DOGOVER`, `DOSBALL`, `DOSOUT`, `DOSSTRIKE`, `DP12CN`, `DPCN`, `FOULTIME`, `GETF`, `GRNDRHIT`, `HRBY2`, `INLOG`, `INNODDS`, `INSCN`, `INSTRC`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTFLDHIT`, `OUTTIME`, `PLRCHK`, `PPOST`, `RETPA`, `RUN1CHK1ST`, `RUN1CHK2ND`, `RUN2CHK`, `RUN2CHK12ND`, `RUN2CHK1ST`, `RUN3CHK`, `SBO`, `SCOREME`, `SPLR`, `STRIKETIME`, `STRINGPRC`, `STRTBALL`, `TCNT`, `TERSECHK`, `TF`, `TWAIT`, `WHBODDS`, `WUPWRT`.

[Source block 87, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `BARRAY` — shared

`( size -- )`

Allocate/name an indexed byte array from a the size.

[Source block 102, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-102)

### `BEGIN` — shared

`( -- )`

Immediate XC wrapper that records a loop's object address.

**Used by:** `INSTRC`, `INSWAIT`, `RECTAN`, `TWAIT`.

[Source block 100, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-100)

### `CODE` — shared

Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry.

[Source block 149, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-149)

### `CONSTANT` — shared

`( value -- )`

Define a constant from a value.

**Used by:** `C=`.

[Source block 276, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276)

### `DECIMAL` — shared

`( -- )`

Select radix ten for parsing subsequent source numbers.

**Used by:** `DTC`, `FMIRROR`, `HITRUN`.

[Source block 89, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-89)

### `DROP` — shared

`( x -- )`

Discard the top stack cell.

**Used by:** `CPOST`, `CREDARROW`, `DOGOVER`, `DOSBALL`, `DOSOUT`, `FOULTIME`, `GRNDRHIT`, `INNODDS`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTLINE`, `OUTTIME`, `PLRCHK`, `RECTAN`, `RETPA`, `SPOST`, `STRINGGO`, `SW+30`, `SW+45`, `SW+90`, `SW-30`, `SW-45`, `SW-90`, `SW0`, `TERSECHK`, `TF`, `TWAIT`, `WHBODDS`, `dpost`.

[Source block 87, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `DUP` — shared

`( x -- x x )`

Duplicate the top stack cell.

**Used by:** `BALLTIME`, `CREDARROW`, `DLINE`, `DOSBALL`, `DOSOUT`, `FL`, `FLSHME`, `FOULTIME`, `GRNDRACTION`, `GRNDRHIT`, `INLOG`, `INNODDS`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `OUTTIME`, `PLRCHK`, `PUP`, `RECLINE`, `RECTAN`, `RETPA`, `SCOREME`, `STRIKETIME`, `STRINGPRC`, `SW+30`, `SW+45`, `SW-30`, `SW-45`, `SW0`, `TF`, `TWAIT`, `WHBODDS`, `WUPGO`.

[Source block 87, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `ELSE` — shared

`( -- )`

Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch.

[Source block 100, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-100)

### `END` — shared

`( flag -- )`

Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true.

**Used by:** `INSTRC`, `INSWAIT`, `RECTAN`, `TWAIT`.

[Source block 100, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-100)

### `HEX` — shared

`( -- )`

Select radix sixteen for parsing subsequent source numbers.

[Source block 152, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-152)

### `IF` — shared

`( flag -- )`

Immediate XC wrapper that emits a conditional target branch through XC-IF.

[Source block 100, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-100)

### `LIT` — shared

`( -- value; inline cell )`

Compiler literal mechanism used by INEXT's host macro.

**Used by:** `INEXT`.

[Source block 229, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-229)

### `OR` — shared

`( a b -- result )`

Bitwise inclusive OR of two values.

**Used by:** `OUTTIME`, `RETPA`, `dpost`.

[Source block 88, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-88)

### `OVER` — shared

`( a b -- a b a )`

Copy the second stack cell to the top.

**Used by:** `FLSHME`, `NPOST`, `OUTLINE`, `PPOST`, `dpost`.

[Source block 89, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-89)

### `ROT` — shared

`( a b c -- b c a )`

Rotate the top three stack cells.

**Used by:** `RECTAN`, `SBALL1`, `SBALL2`, `SBALL3`, `SFOUL`, `SHOMER`, `SOUT1`, `SOUT2`, `SOUT3`, `SSAFE`, `SSTRIKE1`, `SSTRIKE2`, `SWALK`, `TF`.

[Source block 89, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-89)

### `SWAP` — shared

`( a b -- b a )`

Exchange the top two stack cells.

**Used by:** `MLINN`, `NPOST`, `PPOST`, `RECLINE`, `S!`, `SB!`, `WHBODDS`, `dpost`.

[Source block 87, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-87)

### `THEN` — shared

`( -- )`

Immediate XC wrapper that resolves a saved target branch destination.

[Source block 100, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-100)

### `VARIABLE` — shared

`( -- )`

Allocate/name a cell variable with the initial value in this dialect.

**Used by:** `V`, `V=`.

[Source block 147, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-147)

### `XOR` — shared

`( a b -- result )`

Bitwise exclusive OR of two values.

**Used by:** `PLRCHK`, `TF`, `dpost`.

[Source block 88, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-88)

### `]'[` — TERSE

`( -- )`

Game-defined operation; source body below.

```text
: ]'[ [COMPILE] ' ;
```

[Source block 291, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291)

### `^` — TERSE

`( -- )`

Uses ABVOLS and MCVOLS to compose game logic.

```text
: ^ } EF ABVOLS 0F MCVOLS { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`.

[Source block 136, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-136)

### `<INTERRUPTS` — TERSE

`( -- )`

Mark the start of interrupt data.

```text
: <INTERRUPTS } DATA HERE { ; }
```

**Calls:** `HERE`.

[Source block 291, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291)

### `ABVOLS` — TERSE

`( volume -- )`

Emit the music volume command.

```text
: ABVOLS } 16 B, B, { ; }
```

**Used by:** `CMAJOR`, `QUIET`, `REST`, `^`.

[Source block 141, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `ACT,` — TERSE

`( -- )`

Emit a playaction record.

```text
: ACT, } , B, , , { ; }
```

**Used by:** `BACT,`, `LCB,`, `RCB,`, `STP,`.

[Source block 225, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `ANOTE` — TERSE

`( -- )`

Uses ATONE and DURATION to compose game logic.

```text
: ANOTE } ATONE DURATION { ; }
```

**Calls:** `ATONE`, `DURATION`.

[Source block 141, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `ATONE` — TERSE

`( tone -- )`

Emit tone setting for channel A.

```text
: ATONE } 11 B,
```

**Used by:** `ANOTE`, `NOTES`, `QUIET`.

[Source block 141, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `BACT,` — TERSE

`( -- )`

Emit a ball-action record.

```text
: BACT, } BAL ACT, { ; }
```

**Calls:** `ACT,`.

**Used by:** `LK,`.

[Source block 229, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-229)

### `BALLTIME` — TERSE

Balls process.

```text
: BALLTIME ( balls process )
BALLS DUP 1+B! B@ 34 = IF SWALK MYAH WLKCNT 1+B!
CWALK OLDSTRING B! LBASE BONE 40 WALK B!
1 HLSIDE B! WHBODDS HITRUN ( start runners ) WUPGO
CLRBLST ELSE MBALL DOSBALL THEN SBO ;
```

**Calls:** `DUP`, `B!`, `B@`, `SWALK`, `MYAH`, `BONE`, `WHBODDS`, `HITRUN`, `WUPGO`, `CLRBLST`, `MBALL`, `DOSBALL`, `SBO`.

[Source block 182, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-182)

### `BLDST,` — TERSE

`( -- )`

Emit the ball destination command.

```text
: BLDST, } OPBLDST B, { ; }
```

[Source block 225, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `BLMOT,` — TERSE

`( -- )`

Emit the ball motion command.

```text
: BLMOT, } OPBLMOT B, { ; }
```

[Source block 225, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `BNOTE` — TERSE

Uses BTONE and DURATION to compose game logic.

```text
: BNOTE } BTONE DURATION
```

**Calls:** `BTONE`, `DURATION`.

[Source block 141, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `BONE` — TERSE

`( address -- )`

Store byte value 1.

```text
: BONE ( cange byte memory cell to 1 ) 1 SB! ;
```

**Calls:** `SB!`.

**Used by:** `BALLTIME`, `CREDARROW`, `DOGOVER`, `DPCN`, `F2NDLS`, `F2NDRS`, `FBLLS`, `FBLRS`, `FLSHTON`, `FSSLS`, `FSSRS`, `GRNDRHIT`, `HLLS`, `HLS`, `HMS`, `HRLS`, `HRS`, `INLOG`, `INSWAIT`, `OUTFLDHIT`, `OUTTIME`, `PLRCHK`, `PLRSELECT`, `PUP`, `SPLR`, `STFLD`, `STRTBALL`, `TF`.

[Source block 233, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233)

### `BTONE` — TERSE

`( tone -- )`

Emit tone setting for channel B.

```text
: BTONE } 12 B, B, { ; }
```

**Used by:** `BNOTE`, `NOTES`, `QUIET`.

[Source block 141, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `BV` — TERSE

`( -- )`

Define a named byte variable.

```text
: BV } BVARIABLE { ; }
```

**Used by:** `BV=`.

[Source block 142, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-142)

### `BV=` — TERSE

`( -- )`

Uses BV to compose game logic.

```text
: BV= } 0 BVARIABLE { ; }
```

**Calls:** `BV`.

[Source block 304, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304)

### `BZERO` — TERSE

`( address -- )`

Store byte value 0.

```text
: BZERO ( change byte memory cell to 0 ) 0 SB! ;
```

**Calls:** `SB!`.

**Used by:** `CHKFLSHSTAY`, `CREDARROW`, `DOCHGS`, `DOGOVER`, `DOHOMER`, `DPCN`, `FIELDWRT`, `GRNDRACTION`, `HITDST`, `INLOG`, `INSTRC`, `PLRSELECT`, `SCOREME`, `STRINGPRC`, `STRTBALL`, `TF`.

[Source block 233, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233)

### `C=` — TERSE

`( value -- )`

Uses CONSTANT to compose game logic.

```text
: C= } CONSTANT { ; }
```

**Calls:** `CONSTANT`.

[Source block 304, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304)

### `CHGS` — TERSE

CHGS posts CHANGE SIDES;

```text
: CHGS 1C00 2000 828 A" CHANGE SIDES" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DOCHGS`.

[Source block 238, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238)

### `CHKFLSHSTAY` — TERSE

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

[Source block 240, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-240)

### `CHKGMCNT` — TERSE

CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte.

```text
: CHKGMCNT DP12CN C0 TWAIT DP12CN CREDITS B@ ;
```

**Calls:** `DP12CN`, `TWAIT`, `B@`.

**Used by:** `TF`.

[Source block 305, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305)

### `CMAJOR` — TERSE

`( -- )`

Initialize the C-major sound pattern.

```text
: CMAJOR } 1C MASTER 0 NOISE EF ABVOLS 0F MCVOLS { ; }
```

**Calls:** `MASTER`, `NOISE`, `ABVOLS`, `MCVOLS`.

[Source block 136, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-136)

### `CNLINE` — TERSE

`( -- )`

CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state.

```text
: CNLINE ( continue line to this point , given X Y )
YIN ! XIN ! cnline ;
```

**Calls:** `cnline`.

**Used by:** `FIELDWRT`, `OUTLINE`.

[Source block 271, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-271)

### `CNOTE` — TERSE

`( -- )`

Uses CTONE and DURATION to compose game logic.

```text
: CNOTE } CTONE DURATION { ; }
```

**Calls:** `CTONE`, `DURATION`.

**Used by:** `NOTES`.

[Source block 141, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `CONGR` — TERSE

`( -- )`

Display the congratulatory prompt.

```text
: CONGR 700 1000 828 A" CONGRATULATIONS YOU ARE VERY GOOD"
SPOST 0E00 2800 828 A" LETS PLAY AGAIN I WILL BUY" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `TF`.

[Source block 127, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127)

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

[Source block 248, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-248)

### `CREDARROW` — TERSE

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

[Source block 121, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-121)

### `CTONE` — TERSE

`( tone -- )`

Emit tone setting for channel C.

```text
: CTONE } 13 B, B, { ; }
```

**Used by:** `CNOTE`, `QUIET`.

[Source block 141, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `DEACT,` — TERSE

`( -- )`

Emit vector-deactivation command.

```text
: DEACT, } 0C B, { ; }
```

**Used by:** `LCB,`, `LK,`, `RCB,`, `STP,`.

[Source block 225, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `DLINE` — TERSE

Draw a line , given X Y start coor X Y ending coor.

```text
: DLINE ( draw a line , given X Y start coor X Y ending coor )
YIN ! XIN ! 2DUP Y-AXIS ! X-AXIS !
SWAB ( set y for relabs ) strtline cnline ;
```

**Calls:** `DUP`, `strtline`, `cnline`.

**Used by:** `FIELDWRT`, `OUTLINE`, `RECLINE`.

[Source block 271, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-271)

### `DOCHGS` — TERSE

`( -- )`

DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER;

```text
: DOCHGS ' CHGS FLSHTON 28 DWAIT FLSHOFF GAMEOVER BZERO ;
```

**Calls:** `CHGS`, `FLSHTON`, `DWAIT`, `FLSHOFF`, `BZERO`.

**Used by:** `TF`.

[Source block 239, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239)

### `DOEHOMER` — TERSE

`( -- )`

DOEHOMER only posts the text.

```text
: DOEHOMER SHOMER ;
```

**Calls:** `SHOMER`.

[Source block 180, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-180)

### `DOGOVER` — TERSE

Do game over.

```text
: DOGOVER ( do game over )
SGO 32 OUTS B! CMSW BONE CMPT BONE PX0 2A B6 4D 8 RECTAN EIDI
8C0 INNX ! INN# BZERO GAMEOVER BZERO 9 LINN B! MLINN DI
GAMEOVER BONE LINN BZERO SCORE1 ZERO PX1 SCRS CMPLR BZERO
FLSHSTAY B@ IF FLSHSTAY BZERO FLSHOFF THEN 10 TWAIT INSCN
80 TWAIT INSCN CREDITS B@ IF SGO THEN SHILL BONE
FLSHOFF DROP 0 PLYR1UP BZERO ( plyr1up 0 ) EIDI ; -->
( BB sentry definitions    TF )
```

**Calls:** `SGO`, `B!`, `BONE`, `PX0`, `RECTAN`, `EIDI`, `BZERO`, `MLINN`, `DI`, `PX1`, `SCRS`, `B@`, `FLSHOFF`, `TWAIT`, `INSCN`, `DROP`.

**Used by:** `TF`.

[Source block 128, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-128)

### `DOHOMER` — TERSE

`( -- )`

DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer;

```text
: DOHOMER BALLERASE SHOMER CLRBLST SBO STRINGOFFTIMER BZERO ;
```

**Calls:** `BALLERASE`, `SHOMER`, `CLRBLST`, `SBO`, `BZERO`.

[Source block 180, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-180)

### `DOSAFE` — TERSE

`( -- )`

DOSAFE combines music/text.

```text
: DOSAFE MSAFE SSAFE ;
```

**Calls:** `MSAFE`, `SSAFE`.

[Source block 183, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-183)

### `DOSBALL` — TERSE

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSBALL BALLS B@ DUP 31 = IF DROP SBALL1 ELSE 32 = IF SBALL2
ELSE SBALL3 THEN THEN ;
```

**Calls:** `B@`, `DUP`, `DROP`, `SBALL1`, `SBALL2`, `SBALL3`.

**Used by:** `BALLTIME`.

[Source block 179, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179)

### `DOSOUT` — TERSE

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSOUT OUTS B@ DUP 31 = IF DROP SOUT1 ELSE 32 = IF SOUT2
ELSE SOUT3 THEN THEN ;
```

**Calls:** `B@`, `DUP`, `DROP`, `SOUT1`, `SOUT2`, `SOUT3`.

**Used by:** `OUTTIME`.

[Source block 179, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179)

### `DOSSTRIKE` — TERSE

DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```text
: DOSSTRIKE STRIKES B@ 31 = IF SSTRIKE1 ELSE SSTRIKE2 THEN ;
```

**Calls:** `B@`, `SSTRIKE1`, `SSTRIKE2`.

**Used by:** `STRIKETIME`.

[Source block 179, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179)

### `DP1` — TERSE

`( -- )`

Display the one-coin deposit prompt.

```text
: DP1 1A00 2C00 828 A" DEPOSIT 1 COIN" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `TCNT`.

[Source block 127, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127)

### `DP12CN` — TERSE

Uses B@ and SPOST to compose game logic.

```text
: DP12CN CNSW1 B@ IF 300 2800 828
A" DEPOSIT 2 COINS TO CONTINUE THIS GAME" SPOST
ELSE DP1CN THEN ;
```

**Calls:** `B@`, `SPOST`, `DP1CN`.

**Used by:** `CHKGMCNT`.

[Source block 305, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305)

### `DP1CN` — TERSE

Uses SPOST to compose game logic.

```text
: DP1CN 400 2800 828 A" DEPOSIT 1 COIN TO CONTINUE THIS GAME"
SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DP12CN`, `DPCN`, `SORRY`.

[Source block 305, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305)

### `DPCN` — TERSE

Wait for next coin.

```text
: DPCN ( wait for next coin )
DP1CN CREDITS BZERO FF TWAIT FF TWAIT DP1CN CREDITS B@ IF
GAMEOVER BZERO ELSE LINN BZERO UPCRED BONE THEN CREDITS 1+B! ;
```

**Calls:** `DP1CN`, `BZERO`, `TWAIT`, `B@`, `BONE`, `B!`.

**Used by:** `TF`.

[Source block 305, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305)

### `dpost` — TERSE

dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.

```text
: dpost 0F AND OVER 4000 AND 4000 XOR OVER OR IF 30 +
SWAP BFFF AND SWAP ELSE DROP 20 THEN cpost ;
```

**Calls:** `AND`, `OVER`, `XOR`, `OR`, `SWAP`, `DROP`, `cpost`.

**Used by:** `NPOST`.

[Source block 249, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-249)

### `DTC` — TERSE

`( -- )`

DTC selects decimal and invokes the host editor.

```text
: DTC } DECIMAL EDIT { ; }
```

**Calls:** `DECIMAL`.

[Source block 304, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304)

### `DURATION` — TERSE

`( duration -- )`

Emit a note-duration command.

```text
: DURATION } 1 B, B, { ; }
```

**Used by:** `ANOTE`, `BNOTE`, `CNOTE`, `REST`.

[Source block 141, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `DWAIT` — TERSE

DWAIT runs nested loops with interrupts enabled and disables them on return;

```text
: DWAIT EI 0 DO FF 0 DO LOOP LOOP DI ;
```

**Calls:** `EI`, `DO`, `LOOP`, `DI`.

**Used by:** `DOCHGS`, `STRTBALL`.

[Source block 238, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238)

### `F=` — TERSE

`( -- )`

Declare a forward word with the game's source shorthand.

```text
: F= } FORWARD { ; }
```

[Source block 304, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304)

### `F1STLS` — TERSE

`( -- )`

Select the first-base left-side action.

```text
: F1STLS F1STPT F1STL1ST NOACTPA 0 ;
```

[Source block 156, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156)

### `F1STRS` — TERSE

`( -- )`

Select the first-base right-side action.

```text
: F1STRS F1STPT F1STR1ST NOACTPA 0 ;
```

[Source block 156, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156)

### `F2NDLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: F2NDLS DPHIT BONE HRPT HL1ST F2NDL2ND 0 ;
```

**Calls:** `BONE`.

[Source block 155, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `F2NDRS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: F2NDRS DPHIT BONE HRPT HL1ST F2NDR2ND 0 ;
```

**Calls:** `BONE`.

[Source block 155, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `F3RDLS` — TERSE

`( -- )`

Select the third-base left-side action.

```text
: F3RDLS F3RDLSS F3RDL3RD 1 ;
```

[Source block 155, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `F3RDRS` — TERSE

`( -- )`

Select the third-base right-side action.

```text
: F3RDRS NOACTPA F3RDR3RD 1 ;
```

[Source block 155, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `FBLLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: FBLLS NOACTPA FBLL3RD
1 THROWAROUND BONE FOUL BONE ;
```

**Calls:** `BONE`.

[Source block 155, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `FBLRS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: FBLRS FOUL BONE THROWAROUND BONE NOACTPA
FBLR1ST NOACTPA 0 ;
```

**Calls:** `BONE`.

[Source block 156, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156)

### `FIELDWRT` — TERSE

Write field outline.

```text
: FIELDWRT ( write field outline )
FINDEX BZERO GETF GETF GETF GETF DLINE
8 0 DO GETF GETF CNLINE LOOP ;
```

**Calls:** `BZERO`, `GETF`, `DLINE`, `DO`, `CNLINE`, `LOOP`.

**Used by:** `FL`.

[Source block 273, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273)

### `FL` — TERSE

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
… (continues in source block 274)
```

**Calls:** `OUTP`, `ZERORAM`, `FLFILL`, `EI`, `INFIELD`, `PX1`, `FIELDWRT`, `WRITR`, `FMIRROR`, `OUTLINE`, `SPOST`, `CPOST`, `RECTAN`, `EIDI`, `HOM`, `VIS`, `SCRS`, `DUP`, `B!`, `SBO`, `SUP`.

**Used by:** `PLRSELECT`, `PUP`, `STRTBALL`.

[Source block 274, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-274)

### `FLDDST,` — TERSE

`( -- )`

Emit the fielder destination command.

```text
: FLDDST, } 7 B, { ; }
```

[Source block 225, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `FLFILL` — TERSE

`( -- )`

FLFILL fills the background while allowing interrupts;

```text
: FLFILL EI 0 4000 3C00 FILL DI ;
```

**Calls:** `EI`, `FILL`, `DI`.

**Used by:** `FL`, `INSTRC`.

[Source block 273, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273)

### `FLSHME` — TERSE

FLSHME executes only a nonzero address whose top two bits are clear;

```text
: FLSHME FLSHWHO @ DUP 0C000 AND 0= OVER 0 <> AND IF EX
```

**Calls:** `DUP`, `AND`, `OVER`, `EX`.

**Used by:** `FLSHWUP`.

[Source block 239, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239)

### `FLSHTON` — TERSE

`( -- )`

FLSHTON saves a callback and starts its timer.

```text
: FLSHTON FLSHWHO ! FLSHON BONE FLSHTIME BONE ;
```

**Calls:** `BONE`.

**Used by:** `DOCHGS`, `INSCN`, `WUPTON`.

[Source block 239, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239)

### `FOULTIME` — TERSE

Foulball process.

```text
: FOULTIME ( foulball process )
SFOUL STRIKES DUP B@ 32 = IF DROP
ELSE 1+B! SBO THEN ;
```

**Calls:** `SFOUL`, `DUP`, `B@`, `DROP`, `B!`, `SBO`.

[Source block 182, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-182)

### `FOWR` — TERSE

`( -- )`

Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.

```text
: FOWR } FORWARD { ; }
```

[Source block 280, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-280)

### `FSSLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: FSSLS DPHIT BONE FSSLSS HR3RD 1 ;
```

**Calls:** `BONE`.

[Source block 155, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `FSSRS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: FSSRS DPHIT BONE FSSRSS HR3RD 1 ;
```

**Calls:** `BONE`.

[Source block 155, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `GETF` — TERSE

GETF fetches FIELD bytes sequentially;

```text
: GETF FINDEX B@ FIELD B@ FINDEX 1+B! ;
```

**Calls:** `B@`, `B!`.

**Used by:** `FIELDWRT`.

[Source block 273, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273)

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

[Source block 157, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-157)

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

[Source block 158, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-158)

### `HITDST` — TERSE

Chooses hit location.

```text
: HITDST ( chooses hit location ) VUPDATE# BL BZERO
THWBLPA VPLAYACTPC BL ! 82 VSTATUS BL B! ( vact )
BAL THWPA ! 2800 VX BL ! AD00 VY BL ! ;
```

**Calls:** `BZERO`, `B!`.

**Used by:** `GRNDRHIT`, `OUTFLDHIT`.

[Source block 154, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-154)

### `HLLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HLLS HITOF BONE NOACTPA HLL3RD 1 ;
```

**Calls:** `BONE`.

[Source block 155, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `HLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HLS HITOF BONE HLSS HL3RD 1 ;
```

**Calls:** `BONE`.

[Source block 155, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `HMS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HMS HITOF BONE HMSS HR3RD 1 ;
```

**Calls:** `BONE`.

[Source block 155, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155)

### `HOM` — TERSE

HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;

```text
: HOM 4200 7A00 828 48 CPOST 4400 7F00 8828 A" OME" SPOST ;
```

**Calls:** `CPOST`, `SPOST`.

**Used by:** `FL`, `WUPWRT`.

[Source block 237, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237)

### `HRBY2` — TERSE

HRBY2 halves HRAT.

```text
: HRBY2 HRAT B@ 2/ HRAT B! ;
```

**Calls:** `B@`, `B!`.

**Used by:** `WHBODDS`.

[Source block 169, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-169)

### `HRLS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HRLS HITOF BONE HRPT HRL1ST NOACTPA 0 ;
```

**Calls:** `BONE`.

[Source block 156, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156)

### `HRS` — TERSE

`( -- )`

Uses BONE to compose game logic.

```text
: HRS HITOF BONE HRPT HR1ST HR2ND 0 ;
```

**Calls:** `BONE`.

[Source block 156, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156)

### `I'` — TERSE

`( -- )`

Emit the target's indexed immediate reference.

```text
: I' } 0CD B, ]'[ { 2+ } , B, { ; }
```

[Source block 291, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291)

### `ICODE` — TERSE

ICODE starts a CODE definition and emits the scheduler/register-save prologue: set INLIN/IPNT, swap alternate register banks and preserve the active register sets.

```text
: ICODE } CODE { [ } ASM { ] } NEXT XTHL, D PUSH, B PUSH,
PSW PUSH, M A MOV, INLIN OUT, H INX, IPNT SHLD,
EXX, EXAF, H PUSH, D PUSH, B PUSH, PSW PUSH,
ASM { ; }
```

**Calls:** `ASM`.

[Source block 291, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291)

### `INEXT` — TERSE

`( -- )`

INEXT emits a jump to IEX;

```text
: INEXT } { LIT [ } ' IEX { , } ASM { ] } JMP, { ; }
```

**Calls:** `LIT`, `IEX`, `ASM`.

[Source block 291, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291)

### `INLOG` — TERSE

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

[Source block 162, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-162)

### `INNODDS` — TERSE

INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state;

```text
: INNODDS
INN# B@ CMSW B@ IF DUP 6 > IF DROP 1 ELSE 1 > IF 2 ELSE 3
THEN THEN ( cmp player hit ratio ) SPBON B@ IF DROP 4 THEN
ELSE ( player ) SPBON B@ ( bonous inning ) IF 3 > IF 1 ELSE 2
THEN ELSE 1 - IODTBL B@ THEN THEN IODDS B! ;
```

**Calls:** `B@`, `DUP`, `DROP`, `B!`.

[Source block 123, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-123)

### `INSCN` — TERSE

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

[Source block 127, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127)

### `INSTRC` — TERSE

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

[Source block 306, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-306)

### `INSWAIT` — TERSE

INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.

```text
: INSWAIT EI BEGIN FF 0 DO LOOP
14 INP 33 AND 33 < IF DROP 1 INSOUT BONE THEN
1- DUP 0= END DROP DI ;
```

**Calls:** `EI`, `BEGIN`, `DO`, `LOOP`, `INP`, `AND`, `DROP`, `BONE`, `DUP`, `END`, `DI`.

**Used by:** `INSTRC`.

[Source block 305, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305)

### `INTERRUPTS>` — TERSE

`( -- )`

Emit the interrupt-vector dispatch jump.

```text
: INTERRUPTS> } { [ } ASM { ] } JMP, { ; }
```

**Calls:** `ASM`.

[Source block 291, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291)

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

[Source block 293, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-293)

### `ISCN` — TERSE

`( -- )`

Display the V15 instruction message.

```text
: ISCN 1C00 1000 828 A" V15" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `INSCN`.

[Source block 127, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127)

### `LABLE` — TERSE

`( -- )`

Provide the original source's label-definition alias.

```text
: LABLE } DATA { ; }
```

[Source block 304, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304)

### `LCB,` — TERSE

`( -- )`

Uses ACT, and DEACT, to compose game logic.

```text
: LCB, } 0 0 0 LCB ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

[Source block 225, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `LDINFLDPA` — TERSE

`( -- )`

LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.

```text
: LDINFLDPA VPLAYACTPC 3RD ! VPLAYACTPC SS ! VPLAYACTPC 2ND !
VPLAYACTPC 1ST ! VPLAYACTPC PT ! ;
```

**Used by:** `GRNDRACTION`, `OUTFLDHIT`.

[Source block 153, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-153)

### `LDPC` — TERSE

`( -- )`

Emit/load the music program-counter value.

```text
: LDPC } 3 B, , { ; }
```

**Used by:** `QUIT`.

[Source block 141, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `LDPCC` — TERSE

`( -- )`

Emit/load a music program-counter command.

```text
: LDPCC } 2 B, , { ; }
```

[Source block 141, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `LK,` — TERSE

`( -- )`

Uses BACT, and DEACT, to compose game logic.

```text
: LK, } 0 0 0 BACT, DEACT, { ; }
```

**Calls:** `BACT,`, `DEACT,`.

[Source block 229, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-229)

### `LSETTFCOOR` — TERSE

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

[Source block 212, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-212)

### `MASTER` — TERSE

`( -- )`

Define the game's master music stream.

```text
: MASTER } 10 B, B, { ; }
```

**Used by:** `CMAJOR`.

[Source block 141, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `MBALL` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MBALL 0 BALLSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `BALLTIME`.

[Source block 146, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MCANNON` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MCANNON 0 CANNONSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `SCOREME`, `STARTMUSIC`.

[Source block 146, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MCOIN` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MCOIN 0 COINSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `CHKCOIN1`, `CHKCOIN2`.

[Source block 146, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MCVOLS` — TERSE

`( volume -- )`

Emit music-channel volume values.

```text
: MCVOLS } 15 B, B, { ; }
```

**Used by:** `CMAJOR`, `QUIET`, `REST`, `^`.

[Source block 141, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `MFENCE` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MFENCE 0 FENCESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `STARTMUSIC`.

[Source block 146, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MFOUL` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MFOUL 0 FOULSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `GRNDRHIT`.

[Source block 146, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MHIT` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MHIT 0 CRACKSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `INLOG`.

[Source block 146, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MLINN` — TERSE

Mark last inning.

```text
: MLINN ( mark last inning ) DI PX0 2A A5 4D 3 RECTAN LINN B@
DUP DUP IF 0A < IF 8F0 SWAP 0 DO 200 + LOOP ELSE DROP 1CF0
THEN A500 IMRK 301 828 WRITE ELSE DROP DROP THEN EI ;
```

**Calls:** `DI`, `PX0`, `RECTAN`, `B@`, `DUP`, `SWAP`, `DO`, `LOOP`, `DROP`, `WRITE`, `EI`.

**Used by:** `CREDARROW`, `DOGOVER`, `PLRSELECT`, `STRTBALL`, `TF`.

[Source block 121, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-121)

### `MOPENERS` — TERSE

`( -- )`

Uses PMUSIC to compose game logic.

```text
: MOPENERS 0 TAKE-ME PMUSIC ;
```

**Calls:** `PMUSIC`.

**Used by:** `STRTBALL`.

[Source block 146, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MOUT` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MOUT 0 OUTSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `OUTTIME`.

[Source block 146, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MSAFE` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MSAFE 0 SAFESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `DOSAFE`.

[Source block 146, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MSTRIKE` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MSTRIKE 0 STRIKESCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `STRIKETIME`.

[Source block 146, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `MYAH` — TERSE

`( -- )`

Uses BMUSIC to compose game logic.

```text
: MYAH 0 CHEERSSCORE BMUSIC ;
```

**Calls:** `BMUSIC`.

**Used by:** `BALLTIME`, `OUTTIME`, `SCOREME`, `STARTMUSIC`.

[Source block 146, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146)

### `NOISE` — TERSE

`( -- )`

Emit a noise/sound command.

```text
: NOISE } 17 B, B, { ; }
```

**Used by:** `CMAJOR`.

[Source block 141, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `NOTES` — TERSE

`( -- )`

Uses ATONE and BTONE to compose game logic.

```text
: NOTES } ATONE BTONE CNOTE { ; }
```

**Calls:** `ATONE`, `BTONE`, `CNOTE`.

[Source block 141, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `NPOST` — TERSE

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

[Source block 249, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-249)

### `OFFDST,` — TERSE

`( -- )`

Emit the outfielder destination command.

```text
: OFFDST, } 9 B, { ; }
```

[Source block 225, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `OFMOT,` — TERSE

`( -- )`

Emit the outfield motion command.

```text
: OFMOT, } 5 B, { ; }
```

[Source block 225, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `ON1ST,` — TERSE

`( -- )`

Emit the first-base playaction command.

```text
: ON1ST, } 2 B, { ; }
```

[Source block 225, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `ON2ND,` — TERSE

`( -- )`

Emit the second-base playaction command.

```text
: ON2ND, } 3 B, { ; }
```

[Source block 225, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `ON3RD,` — TERSE

`( -- )`

Emit the third-base playaction command.

```text
: ON3RD, } 4 B, { ; }
```

[Source block 225, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `OUTFLDHIT` — TERSE

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

[Source block 161, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-161)

### `OUTLINE` — TERSE

Creates rectanguler outline.

```text
: OUTLINE ( creates rectanguler outline )
( in- X , Y , X length , Y length ; pxtype set )
4 NDUP DROP 3 PICK + OVER 4 NDUP DLINE 5 PICK + CNLINE
3 PICK + CNLINE DROP DROP CNLINE ;
```

**Calls:** `NDUP`, `DROP`, `OVER`, `DLINE`, `CNLINE`.

**Used by:** `FL`.

[Source block 272, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-272)

### `OUTTIME` — TERSE

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

[Source block 181, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-181)

### `PLRCHK` — TERSE

PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL;

```text
: PLRCHK 14 INP DUP 10 AND 10 XOR IF DROP CMPLR BONE STRTBALL
DI 800 7000 8828 A" YOU ARE" SPOST EI
ELSE STRT1 B@ IF DROP ELSE 20 AND 20 XOR IF CNSW1 B@ IF
CNSW12 BONE THEN STRTBALL THEN THEN THEN ;
```

**Calls:** `INP`, `DUP`, `AND`, `XOR`, `DROP`, `BONE`, `STRTBALL`, `DI`, `SPOST`, `EI`, `B@`.

**Used by:** `TERSECHK`.

[Source block 131, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-131)

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

[Source block 131, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-131)

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

[Source block 248, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-248)

### `PUP` — TERSE

Power up routine.

```text
: PUP ( power up routine )
INTHIGHRES B1 DUP 0 OUTP 4 OUTP 7 2 OUTP
DI 0 RND# @ 1 RND# @ SCRERASE 1 RND# ! 0 RND# ! EMUSIC S10
SHILL BONE
DI FL SGO EI GAMEOVER BONE TF SENTRY ;
```

**Calls:** `INTHIGHRES`, `DUP`, `OUTP`, `DI`, `SCRERASE`, `EMUSIC`, `S10`, `BONE`, `FL`, `SGO`, `EI`, `TF`, `SENTRY`.

[Source block 133, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-133)

### `PX0` — TERSE

`( -- )`

Emit zero/white pixel patterns and define PX1/PX0 to select them.

```text
: PX0 0 PXT0 PXTYPE ! ;
```

**Used by:** `DOGOVER`, `MLINN`.

[Source block 280, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-280)

### `PX1` — TERSE

`( -- )`

Emit zero/white pixel patterns and define PX1/PX0 to select them.

```text
: PX1 0 PXT1 PXTYPE ! ;
```

**Used by:** `DOGOVER`, `FL`.

[Source block 280, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-280)

### `QUIET` — TERSE

`( -- )`

Uses ABVOLS and MCVOLS to compose game logic.

```text
: QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`, `ATONE`, `BTONE`, `CTONE`, `QUIT`.

[Source block 141, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `QUIT` — TERSE

`( -- )`

Uses HERE and LDPC to compose game logic.

```text
: QUIT } 4 B, HERE LDPC { ; }
```

**Calls:** `HERE`, `LDPC`.

**Used by:** `QUIET`.

[Source block 141, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `RCB,` — TERSE

`( -- )`

Uses ACT, and DEACT, to compose game logic.

```text
: RCB, } 0 0 0 RCB ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

[Source block 225, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `RDRNDNTE` — TERSE

`( -- )`

Emit a randomized note with a rest interval.

```text
: RDRNDNTE } 0 B, B, B, B, { ; }
```

[Source block 141, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `RECLINE` — TERSE

RECLINE derives one horizontal row from retained rectangle arguments.

```text
: RECLINE 4 PICK 4 PICK 2DUP SWAP 6 PICK + SWAP DLINE ;
```

**Calls:** `DUP`, `SWAP`, `DLINE`.

**Used by:** `RECTAN`.

[Source block 272, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-272)

### `RECTAN` — TERSE

In X, Y, X length, Y length, pxtype set.

```text
: RECTAN ( in X, Y, X length, Y length, pxtype set )
BEGIN RECLINE ROT 1+ ROT ROT 1- DUP 0= END DROP DROP DROP
DROP ;
```

**Calls:** `BEGIN`, `RECLINE`, `ROT`, `DUP`, `END`, `DROP`.

**Used by:** `DOGOVER`, `FL`, `MLINN`, `SCRS`.

[Source block 272, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-272)

### `REST` — TERSE

`( duration -- )`

Insert a silent music interval.

```text
: REST } 0 ABVOLS 0 MCVOLS 0A DURATION { ; }
```

**Calls:** `ABVOLS`, `MCVOLS`, `DURATION`.

[Source block 136, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-136)

### `REST,` — TERSE

`( -- )`

Emit a resting playaction record.

```text
: REST, } NBD , B, 0 , 0 , { ; }
```

[Source block 225, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `RETPA` — TERSE

Return to position pa.

```text
: RETPA ( return to position pa )
VMAGIC PT 8 0 DO DUP DUP VPLAYACTPC + TFPA S! VSTATUS + DUP
B@ 80 OR F7 AND SB! VLENGTH + LOOP DROP ;
```

**Calls:** `DO`, `DUP`, `S!`, `B@`, `OR`, `AND`, `SB!`, `LOOP`, `DROP`.

**Used by:** `STFLD`.

[Source block 213, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-213)

### `RNDNTE` — TERSE

`( -- )`

Emit a randomized musical note.

```text
: RNDNTE } 0 B, B, 0 B, FF B, { ; }
```

[Source block 141, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `RRRNDNTE` — TERSE

`( -- )`

Emit a sequence of randomized notes.

```text
: RRRNDNTE } 0 B, B, 0 B, B, { ; }
```

[Source block 141, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `RUN1CHK1ST` — TERSE

RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy;

```text
: RUN1CHK1ST VWBASE R1 B@ 1 = IF 1 VMAGIC R2
ELSE RUN1CHK2ND THEN ;
```

**Calls:** `B@`, `RUN1CHK2ND`.

**Used by:** `WHBODDS`.

[Source block 168, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168)

### `RUN1CHK2ND` — TERSE

RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy;

```text
: RUN1CHK2ND VWBASE R1 B@ 2 = IF RUN2CHK12ND
ELSE RUN2CHK THEN ;
```

**Calls:** `B@`, `RUN2CHK12ND`, `RUN2CHK`.

**Used by:** `RUN1CHK1ST`.

[Source block 168, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168)

### `RUN2CHK` — TERSE

RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```text
: RUN2CHK VWBASE R2 B@ 0 = IF 3 VMAGIC R2
ELSE RUN2CHK1ST THEN ;
```

**Calls:** `B@`, `RUN2CHK1ST`.

**Used by:** `RUN1CHK2ND`.

[Source block 168, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168)

### `RUN2CHK12ND` — TERSE

RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy;

```text
: RUN2CHK12ND VWBASE R2 B@ 0 = IF 2 VMAGIC R2
ELSE 4 VMAGIC R3 THEN ;
```

**Calls:** `B@`.

**Used by:** `RUN1CHK2ND`.

[Source block 168, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168)

### `RUN2CHK1ST` — TERSE

RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```text
: RUN2CHK1ST VWBASE R2 B@ 1 = IF 6 VMAGIC R3
ELSE RUN3CHK THEN ;
```

**Calls:** `B@`, `RUN3CHK`.

**Used by:** `RUN2CHK`.

[Source block 168, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168)

### `RUN3CHK` — TERSE

RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```text
: RUN3CHK VWBASE R3 B@ 0 = IF 7 VMAGIC R3 ELSE 5 VMAGIC R4
THEN ;
```

**Calls:** `B@`.

**Used by:** `RUN2CHK1ST`.

[Source block 168, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168)

### `RUNDST,` — TERSE

`( -- )`

Emit the runner destination command.

```text
: RUNDST, } 8 B, { ; }
```

[Source block 225, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `S!` — TERSE

`( address value -- )`

Store cell with address-first arguments.

```text
: S! SWAP ! ;
```

**Calls:** `SWAP`.

**Used by:** `LSETTFCOOR`, `OUTTIME`, `RETPA`.

[Source block 304, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304)

### `S10` — TERSE

`( -- )`

S10 starts INTERRUPTS0 through ISTART;

```text
: S10 INTERRUPTS0 ISTART ;
```

**Calls:** `ISTART`.

**Used by:** `PUP`, `STARTMUSIC`.

[Source block 289, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-289)

### `S11` — TERSE

`( -- )`

S11 starts INTERRUPTS1.

```text
: S11 INTERRUPTS1 ISTART ;
```

**Calls:** `ISTART`.

**Used by:** `STARTMUSIC`.

[Source block 289, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-289)

### `SB!` — TERSE

`( address value -- )`

Store byte with address-first arguments.

```text
: SB! SWAP B! ;
```

**Calls:** `SWAP`, `B!`.

**Used by:** `BONE`, `BZERO`, `LSETTFCOOR`, `OUTTIME`, `RETPA`, `WUPGO`.

[Source block 304, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304)

### `SBALL1` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SBALL1 2200 2ROT A" BALL 1" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

[Source block 179, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179)

### `SBALL2` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SBALL2 2200 2ROT A" BALL 2" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

[Source block 179, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179)

### `SBALL3` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SBALL3 2200 2ROT A" BALL 3" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSBALL`.

[Source block 179, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179)

### `SBO` — TERSE

SBO posts the three $30-based count characters at their fixed positions.

```text
: SBO 3700 B000 308 BALLS B@ CPOST 3F00 B000 308 STRIKES B@
CPOST 4700 B000 308 OUTS B@ CPOST ;
```

**Calls:** `B@`, `CPOST`.

**Used by:** `BALLTIME`, `DOHOMER`, `FL`, `FOULTIME`, `OUTTIME`, `SSAFE`, `STRIKETIME`.

[Source block 272, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-272)

### `SCOREME` — TERSE

Plop scores up.

```text
: SCOREME ( plop scores up )
SCORESHOW DUP B@ 2 = IF 900 8C00 4308 SCORE2
ELSE 4300 8C00 4308 SCORE1 THEN 1 NPOST BZERO
HOMERUN B@ IF MCANNON ELSE MYAH THEN ;
```

**Calls:** `DUP`, `B@`, `NPOST`, `BZERO`, `MCANNON`, `MYAH`.

[Source block 183, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-183)

### `SCRERASE` — TERSE

`( -- )`

Erase entire screen.

```text
: SCRERASE ( erase entire screen )
0 4000 3F00 FILL ;
```

**Calls:** `FILL`.

**Used by:** `PUP`.

[Source block 293, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-293)

### `SCRS` — TERSE

SCRS clears two score rectangles and draws zero score characters.

```text
: SCRS 1F 8A 18 0E RECTAN 107 8A 18 0E RECTAN
B00 8C00 308 30 CPOST 4500 8C00 308 30 CPOST ;
```

**Calls:** `RECTAN`, `CPOST`.

**Used by:** `DOGOVER`, `FL`.

[Source block 273, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273)

### `SETFDST` — TERSE

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

[Source block 211, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-211)

### `SETTF` — TERSE

`( -- )`

SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

```text
: SETTF DI LSETTFCOOR STFLD SETTFPA EI ;
```

**Calls:** `DI`, `LSETTFCOOR`, `STFLD`, `SETTFPA`, `EI`.

[Source block 214, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-214)

### `SETTFPA` — TERSE

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

[Source block 213, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-213)

### `SFOUL` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SFOUL 2400 2ROT A" FOUL " SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `FOULTIME`.

[Source block 178, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178)

### `SGO` — TERSE

Uses SPOST to compose game logic.

```text
: SGO 2000 2D00 828 A" GAME OVER" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `DOGOVER`, `INSCN`, `OUTTIME`, `PUP`, `TF`.

[Source block 181, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-181)

### `SHOMER` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SHOMER 2300 2ROT A" HOMER" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOEHOMER`, `DOHOMER`.

[Source block 179, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179)

### `SORRY` — TERSE

`( -- )`

Display the losing-player prompt.

```text
: SORRY 1B00 1000 828 A" TOO BAD I WON" SPOST DP1CN ;
```

**Calls:** `SPOST`, `DP1CN`.

**Used by:** `TF`.

[Source block 127, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127)

### `SOUT1` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SOUT1 2300 2ROT A" 1 OUT" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

[Source block 178, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178)

### `SOUT2` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SOUT2 2200 2ROT A" 2 OUTS" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

[Source block 178, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178)

### `SOUT3` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SOUT3 2200 2ROT A" 3 OUTS" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSOUT`.

[Source block 178, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178)

### `SPLR` — TERSE

SPLR12/SPLR display available player choices;

```text
: SPLR CNSW1 B@ IF CREDITS B@ 1 <> IF SPLR12 ELSE 0E00 2000 828
A" SELECT 1 PLAYER OR DEPOSIT" SPOST
0F00 3000 828 A" 1 MORE COIN FOR 2 PLAYERS"
SPOST STRT1 BONE THEN ELSE SPLR12 THEN ;
```

**Calls:** `B@`, `SPLR12`, `SPOST`, `BONE`.

**Used by:** `PLRSELECT`.

[Source block 128, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-128)

### `SPLR12` — TERSE

SPLR12/SPLR display available player choices;

```text
: SPLR12 1400 2000 828 A" SELECT 1 OR 2 PLAYERS" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `SPLR`.

[Source block 128, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-128)

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

[Source block 249, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-249)

### `SSAFE` — TERSE

SSAFE also redraws counts with SBO.

```text
: SSAFE 2400 2ROT A" SAFE " SPOST SBO ;
```

**Calls:** `ROT`, `SPOST`, `SBO`.

**Used by:** `DOSAFE`.

[Source block 178, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178)

### `SSTRIKE1` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SSTRIKE1 2000 2ROT A" STRIKE 1" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSSTRIKE`.

[Source block 178, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178)

### `SSTRIKE2` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SSTRIKE2 2100 2ROT A" STRIKE 2" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `DOSSTRIKE`.

[Source block 178, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178)

### `STFLD` — TERSE

`( -- )`

STFLD installs RETPA and TAKEFIELD.

```text
: STFLD RETPA TAKEFIELD BONE ;
```

**Calls:** `RETPA`, `BONE`.

**Used by:** `SETTF`.

[Source block 214, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-214)

### `STP,` — TERSE

`( -- )`

Emit a standing-action record.

```text
: STP, } 0 0 0 STND ACT, DEACT, { ; }
```

**Calls:** `ACT,`, `DEACT,`.

[Source block 225, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `STRIKETIME` — TERSE

Strike process.

```text
: STRIKETIME ( strike process )
STRIKES DUP 1+B! B@ 33 = IF OUTTIME COUT OLDSTRING B!
ELSE MSTRIKE DOSSTRIKE THEN SBO ;
```

**Calls:** `DUP`, `B!`, `B@`, `OUTTIME`, `MSTRIKE`, `DOSSTRIKE`, `SBO`.

[Source block 182, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-182)

### `STRINGGO` — TERSE

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

[Source block 184, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-184)

### `STRINGPRC` — TERSE

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

[Source block 184, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-184)

### `STRTBALL` — TERSE

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

[Source block 131, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-131)

### `SUP` — TERSE

SUP posts UP.

```text
: SUP 8C00 8828 A" UP" SPOST ;
```

**Calls:** `SPOST`.

**Used by:** `FL`, `STRTBALL`.

[Source block 273, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273)

### `SW-30` — TERSE

X=1.

```text
: SW-30 DUP IF 1 = IF ( x=1 ) IF F1STR ELSE HR THEN
ELSE ( x=-1 ) IF HR ELSE F2NDL THEN THEN
ELSE ( x= 0 ) DROP DUP IF 1- IF F2NDL ELSE F2NDR THEN
ELSE DROP HR THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

[Source block 170, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-170)

### `SW-45` — TERSE

X=1.

```text
: SW-45 DUP IF 1 = IF ( x=1 ) DROP FBR
ELSE ( x = -1 ) IF HRL ELSE F1STL THEN THEN
ELSE ( X=0 ) DROP DUP IF 1- IF F1STL ELSE F1STR THEN
ELSE DROP HRL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

[Source block 170, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-170)

### `SW-90` — TERSE

SW-90 ignores direction/random inputs and returns the far-right foul sector.

```text
: SW-90 DROP DROP FBR ;
```

**Calls:** `DROP`.

[Source block 170, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-170)

### `SW+30` — TERSE

X=1.

```text
: SW+30 DUP IF 1 = IF ( x=1 ) IF HL ELSE FSSR THEN
ELSE ( x= -1 ) IF F3RDL ELSE HL THEN THEN
ELSE ( x=0 ) DROP DUP IF 1- IF FSSR ELSE FSSL THEN
ELSE DROP HL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

[Source block 171, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-171)

### `SW+45` — TERSE

X=1.

```text
: SW+45 DUP IF 1 = IF ( x=1 ) IF HLL ELSE F3RDR THEN
ELSE ( x= -1 ) DROP FBL THEN
ELSE ( x=0 ) DROP DUP IF 1- IF F3RDR ELSE F3RDL THEN
ELSE DROP HLL THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

[Source block 171, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-171)

### `SW+90` — TERSE

SW+90 always returns foul-left after dropping its inputs.

```text
: SW+90 DROP DROP FBL ;
```

**Calls:** `DROP`.

[Source block 171, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-171)

### `SW0` — TERSE

X=1.

```text
: SW0 DUP IF 1 = IF ( x=1 ) IF F2NDR ELSE HM THEN
ELSE ( x=-1 ) IF FSSL ELSE HM THEN THEN
ELSE ( x=0 ) DROP IF HM ELSE F2NDR THEN THEN ;
```

**Calls:** `DUP`, `DROP`.

[Source block 170, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-170)

### `SWALK` — TERSE

Uses ROT and SPOST to compose game logic.

```text
: SWALK 2400 2ROT A" WALK" SPOST ;
```

**Calls:** `ROT`, `SPOST`.

**Used by:** `BALLTIME`.

[Source block 179, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179)

### `TCNT` — TERSE

TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits.

```text
: TCNT 700 1800 828 A" TO CONTINUE GAME AT END OF INNING" SPOST
CNSW12 B@ IF CREDITS B@ IF DP1 ELSE 0F00 2C00 828
A" DEPOSIT 1 COIN PER PLAYER" SPOST THEN ELSE DP1 THEN ;
```

**Calls:** `SPOST`, `B@`, `DP1`.

**Used by:** `TF`.

[Source block 128, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-128)

### `TERSECHK` — TERSE

Look at terse routine flags.

```text
: TERSECHK ( look at terse routine flags ) 0 RND DROP
TFTIME B@ IF TF THEN SELECT B@ IF PLRSELECT THEN
CHKPLRS B@ IF PLRCHK THEN UPCRED B@ IF CREDARROW THEN ;
```

**Calls:** `RND`, `DROP`, `B@`, `TF`, `PLRSELECT`, `PLRCHK`, `CREDARROW`.

**Used by:** `SENTRY`.

[Source block 132, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-132)

### `TF` — TERSE

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
… (continues in source block 129)
```

**Calls:** `DI`, `ZERORAM`, `EI`, `DUP`, `B!`, `INP`, `AND`, `XOR`, `B@`, `ROT`, `BONE`, `SGO`, `DOGOVER`, `CONGR`, `TWAIT`, `MLINN`, `BZERO`, `SORRY`, `DOCHGS`, `DPCN`, `CHKGMCNT`, `DROP`, `TCNT`.

**Used by:** `PUP`, `STRTBALL`, `TERSECHK`.

[Source block 129, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-129)

### `THW,` — TERSE

`( -- )`

Emit the throw command.

```text
: THW, } 0B B, { ; }
```

[Source block 225, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `TWAIT` — TERSE

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

[Source block 236, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-236)

### `V` — TERSE

`( -- )`

Uses VARIABLE to compose game logic.

```text
: V } VARIABLE { ; }
```

**Calls:** `VARIABLE`.

**Used by:** `V=`.

[Source block 142, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-142)

### `V=` — TERSE

`( -- )`

Uses V and VARIABLE to compose game logic.

```text
: V= } 0 VARIABLE { ; }
```

**Calls:** `V`, `VARIABLE`.

[Source block 304, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304)

### `VIBS` — TERSE

`( value -- )`

Emit a vibrato setting.

```text
: VIBS } 14 B, B, { ; }
```

[Source block 141, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141)

### `VIS` — TERSE

HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string;

```text
: VIS 700 7A00 828 56 CPOST 900 7F00 8828 A" ISITOR" SPOST ;
```

**Calls:** `CPOST`, `SPOST`.

**Used by:** `FL`, `WUPWRT`.

[Source block 237, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237)

### `WHBODDS` — TERSE

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

[Source block 169, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-169)

### `WTHW,` — TERSE

`( -- )`

Emit the wait-for-throw command.

```text
: WTHW, } 0D B, { ; }
```

[Source block 225, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225)

### `WUPGO` — TERSE

WUPGO activates WHOSUP with runner/automatic-forward flags;

```text
: WUPGO WHOSUP @ DUP VSTATUS + 81 SB! VRSTAT + 3 SB! ;
```

**Calls:** `DUP`, `SB!`.

**Used by:** `BALLTIME`, `GRNDRHIT`, `OUTFLDHIT`.

[Source block 233, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233)

### `WUPTON` — TERSE

`( -- )`

WUPTON installs WUPWRT.

```text
: WUPTON ' WUPWRT FLSHTON ;
```

**Calls:** `WUPWRT`, `FLSHTON`.

**Used by:** `CHKFLSHSTAY`.

[Source block 240, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-240)

### `WUPWRT` — TERSE

Write whos up for flash.

```text
: WUPWRT ( write whos up for flash )
PTAUTOTM PLYR1UP B@ IF HOM ELSE VIS THEN ;
```

**Calls:** `PTAUTOTM`, `B@`, `HOM`, `VIS`.

**Used by:** `BUTTONCHK`, `CHKFLSHSTAY`, `WUPTON`.

[Source block 238, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238)

### `YOU1ST` — TERSE

YOU1ST posts the greeting/extra-inning challenge, then continues to 306.

```text
: YOU1ST 1A00 1000 828 A" YOU ARE UP 1ST" SPOST 0F00 3000 828
A" BEAT ME FOR EXTRA INNING" SPOST 1F00 5000 828
A" GOOD LUCK" SPOST ; -->
( BB sentry string routines INSTRC )
```

**Calls:** `SPOST`.

**Used by:** `STRTBALL`.

[Source block 305, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305)

### `ZERORAM` — TERSE

ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT.

```text
: ZERORAM DI 0 7C30 270 FILL 3 OFTFCNT B! DI ;
```

**Calls:** `DI`, `FILL`, `B!`.

**Used by:** `FL`, `TF`.

[Source block 273, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273)

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

[Source block 276, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `ALLFLDACT` — native CODE

`Z80 register / stack ABI`

Sets all fielders active.

```text
CODE ALLFLDACT ( sets all fielders active )
' INFLDACT CALL, ' OUTFLDACT CALL, NEXT
```

**Calls:** `INFLDACT`, `OUTFLDACT`.

**Used by:** `INLOG`.

[Source block 237, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 201, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-201) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `BALLERASE` — native CODE

`Z80 register / stack ABI`

BALLERASE preserves BC/IY around native BLERASE and returns to TERSE.

```text
CODE BALLERASE B PUSH, Y PUSHX, BLERASE CALL,
Y POPX, B POP, NEXT
```

**Calls:** `BLERASE`.

**Used by:** `DOHOMER`, `OUTTIME`.

[Source block 180, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-180) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 124, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-124) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 258, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-258) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 259, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-259) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 259, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-259) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 250, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-250) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
```

**Calls:** `DSTLD`, `DSTCALC`, `CMPOF`, `KILLOF`.

[Source block 192, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-192) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `BLMOTION` — native CODE

`Z80 register / stack ABI`

Set pc for ram pa table -tractor ball.

```text
CODE BLMOTION ( set pc for ram pa table -tractor ball )
TBLPA H LXI, VECTPC SHLD, RET,
```

[Source block 199, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-199) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 262)
```

**Calls:** `OFBLCHK`, `LVRSTAT`.

[Source block 262, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-262) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `BMUSIC` — native CODE

`Z80 register / stack ABI`

BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

```text
CODE BMUSIC PRIORITY LDA, H POP, A ORA, 0=, IF, loadpc CALL,
NOTETIMER STA, A INR, MULTIPLE STA, THEN, NEXT
```

**Calls:** `loadpc`.

**Used by:** `MBALL`, `MCANNON`, `MCOIN`, `MFENCE`, `MFOUL`, `MHIT`, `MOUT`, `MSAFE`, `MSTRIKE`, `MYAH`.

[Source block 145, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-145) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
```

**Calls:** `OFBLCHK`, `WUPWRT`.

**Used by:** `SENTRY`.

[Source block 125, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-125) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 116)
```

**Calls:** `LVRSTAT`.

**Used by:** `SENTRY`.

[Source block 116, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-116) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 253, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-253) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 114, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-114) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `CLRBLST` — native CODE

`Z80 register / stack ABI`

CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.

```text
CODE CLRBLST 30 A MVI, BALLS STA, STRIKES STA, NEXT
```

**Used by:** `BALLTIME`, `DOHOMER`, `OUTTIME`.

[Source block 179, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 270, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-270) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `COMPDE` — native CODE

`Z80 register / stack ABI`

COMPDE applies the same operation to DE while preserving HL.

```text
CODE COMPDE H PUSH, XCHG, ' COMPHL CALL, XCHG, H POP, RET,
```

**Calls:** `COMPHL`.

**Used by:** `CHKGROUNDER`.

[Source block 233, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `COMPHL` — native CODE

`Z80 register / stack ABI`

Compliments HL.

```text
CODE COMPHL ( compliments HL )
H A MOV, CMA, A H MOV, L A MOV, CMA, A L MOV, H INX, RET,
```

**Used by:** `COMPDE`, `DIVHLBY4`, `DSTCALC`, `MULTHLBY4`, `OFBLCHK`, `TBLVEL`.

[Source block 233, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `COUNT` — native CODE

`( address -- address+1 length )`

Fetch the address and length of a counted string.

```text
CODE COUNT ROMHERE !
( COUNT uses the native counted-string routine )
```

**Used by:** `PPOST`.

[Source block 276, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 246)
```

**Calls:** `FONTUNPACK`, `relabs`.

**Used by:** `CPOST`, `PPOST`, `dpost`.

[Source block 246, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-246) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `DEACTIVATE` — native CODE

`Z80 register / stack ABI`

Reset active bit in status.

```text
CODE DEACTIVATE ( reset active bit in status )
VACT VSTATUS X RESX, 1 A MVI, SAMEDLT STA, RET,
```

[Source block 190, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-190) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `DI` — native CODE

`Z80 register / stack ABI`

Disable interrupts.

```text
CODE DI
```

**Used by:** `CREDARROW`, `DOGOVER`, `DWAIT`, `FLFILL`, `INSWAIT`, `MLINN`, `PLRCHK`, `PLRSELECT`, `PUP`, `SETTF`, `STRTBALL`, `TF`, `TWAIT`, `ZERORAM`.

[Source block 292, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-292) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 234, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-234) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `DO` — native CODE

`Z80 register / stack ABI`

Enter a counted loop.

```text
CODE DO
```

**Used by:** `DWAIT`, `FIELDWRT`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTTIME`, `PPOST`, `RETPA`, `TWAIT`.

[Source block 276, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 230)
```

**Calls:** `COMPHL`.

**Used by:** `BLDST`, `CMPOF`, `FLDDST`, `OFFFDST`.

[Source block 230, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-230) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 232, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-232) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 292, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-292) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `EIDI` — native CODE

`Z80 register / stack ABI`

EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers.

```text
CODE EIDI EI, DI, NEXT
```

**Used by:** `DOGOVER`, `FL`.

[Source block 304, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `EMUSIC` — native CODE

`Z80 register / stack ABI`

EMUSIC selects ENDMUSIC and initializes timing/repetition to one;

```text
CODE EMUSIC 0 ENDMUSIC H LXI, loadpc CALL, 1 A MVI, NOTETIMER
STA, MULTIPLE STA, NEXT ( CALL EMUSIC AS AN INIT IN PROGRAM )
```

**Calls:** `loadpc`.

**Used by:** `PUP`.

[Source block 145, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-145) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `EX` — native CODE

`Z80 register / stack ABI`

EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.

```text
CODE EX C9 B, NEXT
```

**Used by:** `FLSHME`, `GRNDRACTION`, `GRNDRHIT`, `STRINGGO`.

[Source block 234, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-234) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FILL` — native CODE

`Z80 register / stack ABI`

Fill a memory/screen range.

```text
CODE FILL ROMHERE !
```

**Used by:** `FLFILL`, `SCRERASE`, `ZERORAM`.

[Source block 293, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-293) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 194, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-194) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FLSHOFF` — native CODE

`Z80 register / stack ABI`

FLSHOFF disables flashing and services cleanup under DI.

```text
CODE FLSHOFF B PUSH, A XRA, FLSHON STA, DI, FLSHWUP CALL,
B POP, NEXT
```

**Calls:** `FLSHWUP`.

**Used by:** `CHKFLSHSTAY`, `DOCHGS`, `DOGOVER`, `OUTTIME`.

[Source block 239, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 207, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-207) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 167, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-167) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 159)
```

**Calls:** `INDEXW`.

**Used by:** `OUTFLDHIT`.

[Source block 159, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-159) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `I` — native CODE

`Z80 register / stack ABI`

Native game routine; source body below.

```text
CODE I
ROMHERE !
FORWARD PLPOS FORWARD PLBACK FORWARD PLDONE
```

**Used by:** `NPOST`, `PPOST`.

[Source block 276, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `IEX` — native CODE

`Z80 register / stack ABI`

IEX restores saved registers, enables interrupts and returns.

```text
CODE IEX PSW POP, B POP, D POP, H POP, EXX, EXAF,
PSW POP, B POP, D POP, H POP, EI, RET,
```

**Used by:** `INEXT`.

[Source block 291, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 234, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-234) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 208, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-208) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `INFLDACT` — native CODE

`Z80 register / stack ABI`

Set infielders active.

```text
CODE INFLDACT ( set infielders active )
VSTATUS PT H LXI, 5 A MVI, ' SETACT CALL, RET,
```

**Calls:** `SETACT`.

**Used by:** `ALLFLDACT`.

[Source block 237, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `ISTART` — native CODE

`Z80 register / stack ABI`

ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.

```text
CODE ISTART DI, H POP, IPNT SHLD, 8 A MVI, INMOD OUT,
IPNT { SWAB } A MVI, STAI, IPNT A MVI,
INFBK OUT, IM2, EI, NEXT
```

**Used by:** `S10`, `S11`.

[Source block 292, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-292) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `KILLOF` — native CODE

`Z80 register / stack ABI`

Stop outfield tractor ball control.

```text
CODE KILLOF ( stop outfield tractor ball control )
0 H LXI, OFDX SHLD, OFDY SHLD, STND H LXI, OFPA SHLD,
A XRA, OFTBLGO STA, RET,
```

**Used by:** `BLDST`.

[Source block 236, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-236) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 200, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-200) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `LOOP` — native CODE

`Z80 register / stack ABI`

Advance or terminate a counted loop.

```text
CODE LOOP
```

**Used by:** `+LOOP`, `DWAIT`, `FIELDWRT`, `INSWAIT`, `LSETTFCOOR`, `MLINN`, `NPOST`, `OUTTIME`, `PPOST`, `RETPA`, `TWAIT`.

[Source block 276, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 236, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-236) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 143)
```

**Calls:** `FETCH`, `INCPC`, `HLOAD`, `RND`, `PCJUMP`.

[Source block 143, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 294, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-294) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 195)
```

**Calls:** `DSTCALC`.

[Source block 195, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-195) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 124, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-124) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `OFMOTION` — native CODE

`Z80 register / stack ABI`

Set pc for ram pa table -tractor ball.

```text
CODE OFMOTION ( set pc for ram pa table -tractor ball )
OFPA { 1+ } LDA, 4 CPI, ( stnd ? )
=, IF, VACT VSTATUS X RESX, THEN,
OFPA H LXI, VECTPC SHLD, RET,
```

[Source block 199, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-199) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `ON1ST` — native CODE

`Z80 register / stack ABI`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON1ST X PUSHX, H POP, FLDON1ST SHLD, RET,
```

[Source block 191, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-191) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `ON2ND` — native CODE

`Z80 register / stack ABI`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON2ND X PUSHX, H POP, FLDON2ND SHLD, RET,
```

[Source block 191, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-191) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `ON3RD` — native CODE

`Z80 register / stack ABI`

ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell;

```text
CODE ON3RD X PUSHX, H POP, FLDON3RD SHLD, RET,
```

[Source block 191, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-191) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 200, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-200) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `OUTFLDACT` — native CODE

`Z80 register / stack ABI`

Sets outfielders active.

```text
CODE OUTFLDACT ( sets outfielders active )
VSTATUS LF H LXI, 3 A MVI, ' SETACT CALL, RET,
```

**Calls:** `SETACT`.

**Used by:** `ALLFLDACT`, `CMPOF`, `OFLDTBL`.

[Source block 237, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 201, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-201) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 202, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-202) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 255, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-255) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 203, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-203) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `PMUSIC` — native CODE

`Z80 register / stack ABI`

PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer.

```text
CODE PMUSIC H POP, loadpc CALL, 1 A MVI, MULTIPLE STA,
PRIORITY STA, NOTETIMER STA, NEXT
```

**Calls:** `loadpc`.

**Used by:** `MOPENERS`.

[Source block 145, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-145) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `PTAUTOTM` — native CODE

`Z80 register / stack ABI`

Pitch auto timer.

```text
CODE PTAUTOTM ( pitch auto timer )
TIMEOUT H LXI, FLDCLR LDA, A ANA, TIMEDCR CZ, NEXT
```

**Calls:** `TIMEDCR`.

**Used by:** `WUPWRT`.

[Source block 238, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 115, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-115) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
```

**Used by:** `GRNDRHIT`, `INLOG`, `MUSCPU`, `OUTFLDHIT`, `TERSECHK`, `WHBODDS`.

[Source block 295, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-295) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 196)
```

**Calls:** `LVRSTAT`.

[Source block 196, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-196) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 132, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-132) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 237, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 124, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-124) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 271, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-271) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `SWAN` — native CODE

`Z80 register / stack ABI`

Transfer interrupt/screen execution state.

```text
CODE SWAN
ROMHERE !
( VGS screen handeling verbs INTCOMMERCIAL , FILL , SCRERASE )
```

**Used by:** `EI`, `NPOST`.

[Source block 292, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-292) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 177, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-177) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
… (continues in source block 119)
```

**Calls:** `CHKATBS`, `INDEXW`.

**Used by:** `SENTRY`.

[Source block 119, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-119) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 122, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-122) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 191, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-191) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 254, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-254) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 257, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-257) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 252, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-252) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 251, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-251) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `WAIT` — native CODE

`Z80 register / stack ABI`

Given A wait period stop every thing.

```text
CODE WAIT ( given A wait period stop every thing )
BEGIN, PSW PUSH, 0FF A MVI, BEGIN, A DCR, 0=, END,
PSW POP, A DCR, 0=, END, RET,
```

[Source block 236, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-236) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `WAITTHRW` — native CODE

`Z80 register / stack ABI`

Sets flag for 1stbaseman to wait throw.

```text
CODE WAITTHRW ( sets flag for 1stbaseman to wait throw )
' THWANMSET CALL, BASESTATUS LDA, 5 CPI, RZ, A XRA,
THROWANM STA, 20 A MVI, WAITTHROW STA, RET,
```

**Calls:** `THWANMSET`.

[Source block 199, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-199) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 244, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-244) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 245, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-245) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `AUTOR1` — native SUBR

`Z80 register / stack ABI`

AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

```text
SUBR AUTOR1 3 A MVI, VRSTAT R1 STA, 81 A MVI, VSTATUS R1 STA,
RET, ( sets vauto , vforw , vact , vrun )
```

**Used by:** `FRO1`, `FRO12`, `FRO123`, `RO1`, `RO12`, `RO123`, `RO13`, `RO2`, `RO23`, `RO3`.

[Source block 235, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `AUTOR2` — native SUBR

`Z80 register / stack ABI`

Run second-runner automation logic.

```text
SUBR AUTOR2 3 A MVI, VRSTAT R2 STA, 81 A MVI, VSTATUS R2 STA,
RET,
```

**Used by:** `FRO12`, `FRO123`, `FRO13`, `RO12`, `RO123`, `RO13`, `RO23`.

[Source block 235, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `AUTOR3` — native SUBR

`Z80 register / stack ABI`

Run third-runner automation logic.

```text
SUBR AUTOR3 3 A MVI, VRSTAT R3 STA, 81 A MVI, VSTATUS R3 STA,
RET,
```

**Used by:** `FRO123`, `RO123`.

[Source block 235, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 238, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `CHKATBS` — native SUBR

`Z80 register / stack ABI`

Check if active player at base in- A vstatus.

```text
SUBR CHKATBS ( check if active player at base in- A vstatus )
VACT A BIT, RZ, VATBS A BIT, RNZ, E INR, RET,
```

**Used by:** `THROWANIM`.

[Source block 119, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-119) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 287, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-287) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 288, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-288) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 173, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-173) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `COLORBAND` — native SUBR

`Z80 register / stack ABI`

COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled.

```text
SUBR COLORBAND NEXT XTHL, PSW PUSH, M A MOV, INLIN OUT,
H INX, IPNT SHLD, FLSHSTAY LDA, A ANA, 0=, IF,
6C A MVI, 3 OUT, 7 A MVI, 1 OUT, THEN,
PSW POP, H POP, EI, RET, ( palette only: preserve AF/HL )
```

[Source block 269, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-269) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 286, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-286) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FETCH` — native SUBR

`Z80 register / stack ABI`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR FETCH MUSPC LHLD, M A MOV, RET,
```

**Used by:** `HLOAD`, `MUSCPU`.

[Source block 143, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 239, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FNBB` — native SUBR

`Z80 register / stack ABI`

Native game routine; source body below.

```text
SUBR FNBB RET,
```

[Source block 163, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 207, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-207) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FRO1` — native SUBR

`Z80 register / stack ABI`

Uses AUTOR1 to process game state.

```text
SUBR FRO1 AUTOR1 CALL, RET,
```

**Calls:** `AUTOR1`.

[Source block 163, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FRO12` — native SUBR

`Z80 register / stack ABI`

Uses AUTOR1 and AUTOR2 to process game state.

```text
SUBR FRO12 AUTOR1 CALL, AUTOR2 CALL, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`.

[Source block 163, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FRO123` — native SUBR

`Z80 register / stack ABI`

Uses AUTOR1 and AUTOR2 to process game state.

```text
SUBR FRO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `AUTOR3`.

[Source block 163, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FRO13` — native SUBR

`Z80 register / stack ABI`

Uses AUTOR2 to process game state.

```text
SUBR FRO13 VSTATUS R1 STA, AUTOR2 CALL, RET,
```

**Calls:** `AUTOR2`.

[Source block 163, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FRO2` — native SUBR

`Z80 register / stack ABI`

Native game routine; source body below.

```text
SUBR FRO2 VSTATUS R1 STA, RET,
```

[Source block 163, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FRO23` — native SUBR

`Z80 register / stack ABI`

Native game routine; source body below.

```text
SUBR FRO23 VSTATUS R1 STA, VSTATUS R2 STA, RET,
```

[Source block 163, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `FRO3` — native SUBR

`Z80 register / stack ABI`

Native game routine; source body below.

```text
SUBR FRO3 VSTATUS R1 STA, RET,
```

[Source block 163, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `HLOAD` — native SUBR

`Z80 register / stack ABI`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR HLOAD FETCH CALL, INCPC CALL, 0 H MVI, A L MOV, RET,
```

**Calls:** `FETCH`, `INCPC`.

**Used by:** `MUSCPU`.

[Source block 143, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 279, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-279) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `INCPC` — native SUBR

`Z80 register / stack ABI`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR INCPC MUSPC LHLD, H INX, MUSPC SHLD, RET,
```

**Used by:** `HLOAD`, `MUSCPU`.

[Source block 143, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `loadpc` — native SUBR

`Z80 register / stack ABI`

loadpc installs MUSPC and STARTPC.

```text
SUBR loadpc MUSPC SHLD, STARTPC SHLD, RET,
```

**Used by:** `BMUSIC`, `EMUSIC`, `PMUSIC`.

[Source block 145, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-145) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `LVRSTAT` — native SUBR

`Z80 register / stack ABI`

Load vstat for all runners in- A value.

```text
SUBR LVRSTAT ( load vstat for all runners in- A value )
VRSTAT R1 STA, VRSTAT R2 STA, VRSTAT R3 STA, VRSTAT R4 STA,
RET,
```

**Used by:** `BLPOSCHK`, `CHKCAUGHT`, `RUNDST`.

[Source block 235, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `NBB` — native SUBR

`Z80 register / stack ABI`

NBB is the empty-bases no-op.

```text
SUBR NBB RET,
```

[Source block 165, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 261, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-261) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `PCJUMP` — native SUBR

`Z80 register / stack ABI`

FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```text
SUBR PCJUMP MUSPC LHLD, M E MOV, H INX, M D MOV,
MUSPC SDED, RET,
```

**Used by:** `MUSCPU`.

[Source block 143, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 241, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-241) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 242, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-242) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `RO1` — native SUBR

`Z80 register / stack ABI`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO1 AUTOR1 CALL, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R2 B LXI, RET,
```

**Calls:** `AUTOR1`, `SETDBLPLAY`.

[Source block 165, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `RO12` — native SUBR

`Z80 register / stack ABI`

RO12 activates both forced runners, selecting a double-play or ordinary target;

```text
SUBR RO12 AUTOR1 CALL, AUTOR2 CALL,
VMAGIC R2 B LXI, DPHIT LDA, A ANA, SETDBLPLAY JNZ,
VMAGIC R3 B LXI, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `SETDBLPLAY`.

[Source block 165, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `RO123` — native SUBR

`Z80 register / stack ABI`

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
SUBR RO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL,
VMAGIC R3 B LXI, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R1 B LXI, RET,
```

**Calls:** `AUTOR1`, `AUTOR2`, `AUTOR3`, `SETDBLPLAY`.

[Source block 166, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-166) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 166, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-166) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `RO2` — native SUBR

`Z80 register / stack ABI`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO2 HLSIDE LDA, A ANA, 0=, IF,
AUTOR1 CALL, THEN, VMAGIC R2 B LXI, RET,
```

**Calls:** `AUTOR1`.

[Source block 165, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `RO23` — native SUBR

`Z80 register / stack ABI`

RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```text
SUBR RO23 VMAGIC R3 B LXI, DPHIT LDA, A ANA,
0<>, IF, AUTOR1 CALL, HLSIDE LDA, A ANA, AUTOR2 CZ, THEN,
RET,
```

**Calls:** `AUTOR1`, `AUTOR2`.

[Source block 166, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-166) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `RO3` — native SUBR

`Z80 register / stack ABI`

RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```text
SUBR RO3 VMAGIC R2 B LXI, DPHIT LDA, A ANA,
AUTOR1 CNZ, RET,
```

**Calls:** `AUTOR1`.

[Source block 165, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `SETDBLPLAY` — native SUBR

`Z80 register / stack ABI`

Sets up double play HL-guy on 1st.

```text
SUBR SETDBLPLAY ( sets up double play HL-guy on 1st )
1 A MVI, DBLPLAY STA, RET,
```

**Used by:** `RO1`, `RO12`, `RO123`, `RO13`.

[Source block 165, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 164, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-164) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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
```

**Calls:** `AND`, `TBLVEL`.

[Source block 174, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-174) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 174, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-174) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 233, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 173, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-173) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `WALKOVER` — native SUBR

`Z80 register / stack ABI`

Walked runner at base.

```text
SUBR WALKOVER ( walked runner at base )
1 A MVI, CAUGHT STA, THROWAROUND STA, RET,
```

**Used by:** `TIMER`.

[Source block 235, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 243, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-243) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

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

[Source block 244, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-244) · [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm)

### `BASE!` — TERSE

`( -- )`

Set the number base.

```text
: BASE! } BASE ! { ; }
```

[Source block 102, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-102)

### `BASE@` — TERSE

`( -- )`

Fetch the current number base.

```text
: BASE@ } BASE @ { ; }
```

[Source block 102, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-102)

## DNA source references and catalog method

The third column identifies exact-spelling documentation matches from the supplied **TERSE Standard Glossary**, **Z80 Assembler**, and **TERSE Verbs** scans. A dash means a match was not established in these documents. `Z80 Assembler` names are instruction emitters; they are not automatically executable game TERSE words. The source screens contain dated Extra Bases words together with later source/XC work. A native routine may take or return parameters via Z80 registers; `Z80 register / stack ABI` means the exact interface must be read from its implementation, not guessed as a TERSE stack signature. A dash in a stack field likewise means no complete stack signature has been established. Caller lists are references between the extracted named definitions and should not be confused with measured runtime invocation frequency. The [original source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse) and [ROM disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) remain the authoritative implementation evidence.
