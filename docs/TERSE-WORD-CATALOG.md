# Extra Bases — DNA TERSE word catalog

**Extra Bases (1979 source; 1980 arcade release)** · Catalog from the repository's source screens, target disassembly, and DNA period reference documents. **Catalog date:** 2026-11-22.
This is an index of **words found in the Extra Bases source**, not an assertion that every documented word is resident in the shipped target. The source collection includes original dated game screens and later host/XC and ROM reconstruction screens; the source-block links identify their provenance. The original 16 KB target ROM is verified by the repository's existing checksums. See [original source blocks](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse), [annotated block and word dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md), and [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm).
**Index format:** Word (first line) and stack effect (second line); brief function; **DNA documentation** (third column). A dash in the third column means no *exact-spelling match was confirmed in the supplied reference extracts*; it does **not** mean DNA never documented the word. The `TERSE Verbs` scan is a short native/floating-point listing, not a complete dictionary. The `Z80 Assembler` document describes **comma-suffixed emitters**; those are not game-level TERSE verbs. A description inherited from the annotated source is an RE annotation rather than a quotation of the 1979 source.
**Implementation:** Each index link goes to an entry below containing the recovered source excerpt, block and line, annotated source dictionary, available native target binding, and static source-use references. `Used in blocks` records lexical occurrence and **does not by itself prove runtime execution**. For longer multi-screen routines, consult the linked full source screen. Stack effects are stated where supported; `(see implementation)` deliberately avoids inferring a signature from a name alone.
## Game TERSE definitions (184)

| Word / stack | Function | DNA documentation |
| --- | --- | --- |
| [`ABVOLS`](#word-abvols)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`ACT`](#word-act)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`ANOTE`](#word-anote)<br><sub><code>(see implementation)</code></sub> | Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order. | — |
| [`ATONE`](#word-atone)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`BACT`](#word-bact)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`BALLTIME`](#word-balltime)<br><sub><code>(see implementation)</code></sub> | Definition. BALLTIME increments BALLS. At $34 display WALK, start forced runner movement and a WALK timer, update odds/base state and clear counts; otherwise play/post the ball count. | — |
| [`BLMOT`](#word-blmot)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`BNOTE`](#word-bnote)<br><sub><code>(see implementation)</code></sub> | Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order. | — |
| [`BONE`](#word-bone)<br><sub><code>( address -- )</code></sub> | Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue. | — |
| [`BTONE`](#word-btone)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`BV`](#word-bv)<br><sub><code>(see implementation)</code></sub> | Definition. Define V as VARIABLE and BV as BVARIABLE, then continue the music processor source. | — |
| [`BZERO`](#word-bzero)<br><sub><code>( address -- )</code></sub> | Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue. | — |
| [`CHGS`](#word-chgs)<br><sub><code>(see implementation)</code></sub> | Definition. CHGS posts CHANGE SIDES; DWAIT runs nested loops with interrupts enabled and disables them on return; continue. | — |
| [`CHKFLSHSTAY`](#word-chkflshstay)<br><sub><code>(see implementation)</code></sub> | Definition. WUPTON installs WUPWRT. CHKFLSHSTAY checks whether flashing was reserved and stops that special use while retaining its phase state. | — |
| [`CHKGMCNT`](#word-chkgmcnt)<br><sub><code>(see implementation)</code></sub> | Definition. CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte. | — |
| [`CMAJOR`](#word-cmajor)<br><sub><code>(see implementation)</code></sub> | Definition. Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato. | — |
| [`CNLINE`](#word-cnline)<br><sub><code>(see implementation)</code></sub> | Definition. CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state. | — |
| [`CNOTE`](#word-cnote)<br><sub><code>(see implementation)</code></sub> | Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order. | — |
| [`CONGR`](#word-congr)<br><sub><code>(see implementation)</code></sub> | Definition. Define congratulatory, loss and one-coin prompts and continue loading. | — |
| [`CPOST`](#word-cpost)<br><sub><code>( x y options char -- )</code></sub> | Definition. 3DROP discards three cells. CPOST calls lower-case cpost, then discards its returned X/Y/options. | — |
| [`CREDARROW`](#word-credarrow)<br><sub><code>(see implementation)</code></sub> | Definition. CREDARROW clears UPCRED and handles STRT1, the coin-mode switch, game-over/player-selection state and computer-player pricing. Some credits remain as a one-credit remainder in two-player mode. | — |
| [`CTONE`](#word-ctone)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`DEACT`](#word-deact)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`DLINE`](#word-dline)<br><sub><code>(see implementation)</code></sub> | Definition. DLINE saves endpoint and initial X/Y state, converts Y for strtline, draws through cnline and continues loading. | — |
| [`DOCHGS`](#word-dochgs)<br><sub><code>(see implementation)</code></sub> | Definition. FLSHOFF disables flashing and services cleanup under DI. DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; continue. | — |
| [`DOEHOMER`](#word-doehomer)<br><sub><code>(see implementation)</code></sub> | Definition. DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; DOEHOMER only posts the text. Continue. | — |
| [`DOGOVER`](#word-dogover)<br><sub><code>(see implementation)</code></sub> | Definition. DOGOVER resets innings, scores, computer control, flashing and selection state; shows pricing with timed waits and returns to SHILL attract mode. | — |
| [`DOHOMER`](#word-dohomer)<br><sub><code>(see implementation)</code></sub> | Definition. DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; DOEHOMER only posts the text. Continue. | — |
| [`DOSAFE`](#word-dosafe)<br><sub><code>(see implementation)</code></sub> | Definition. DOSAFE combines music/text. STETBL holds redraw addresses for erasing old XOR text, including the repeated SAFE entry and WALK. | — |
| [`DOSBALL`](#word-dosball)<br><sub><code>(see implementation)</code></sub> | Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. | — |
| [`DOSOUT`](#word-dosout)<br><sub><code>(see implementation)</code></sub> | Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. | — |
| [`DOSSTRIKE`](#word-dosstrike)<br><sub><code>(see implementation)</code></sub> | Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word. | — |
| [`DP1`](#word-dp1)<br><sub><code>(see implementation)</code></sub> | Definition. Define congratulatory, loss and one-coin prompts and continue loading. | — |
| [`DP12CN`](#word-dp12cn)<br><sub><code>(see implementation)</code></sub> | Definition. Define one-coin and switch-dependent two-coin prompts using SPOST. | — |
| [`DP1CN`](#word-dp1cn)<br><sub><code>(see implementation)</code></sub> | Definition. Define one-coin and switch-dependent two-coin prompts using SPOST. | — |
| [`DPCN`](#word-dpcn)<br><sub><code>(see implementation)</code></sub> | Definition. DPCN clears credits, performs two waits while displaying the prompt, clears GAMEOVER if a credit arrived or updates LINN/UPCRED otherwise, then increments CREDITS as the source explicitly specifies. | — |
| [`dpost`](#word-dpost)<br><sub><code>(see implementation)</code></sub> | Definition. dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit. | — |
| [`DTC`](#word-dtc)<br><sub><code>(see implementation)</code></sub> | Definition. EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. DTC selects decimal and invokes the host editor. | — |
| [`DURATION`](#word-duration)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`DWAIT`](#word-dwait)<br><sub><code>(see implementation)</code></sub> | Definition. CHGS posts CHANGE SIDES; DWAIT runs nested loops with interrupts enabled and disables them on return; continue. | — |
| [`F1STLS`](#word-f1stls)<br><sub><code>(see implementation)</code></sub> | Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag. | — |
| [`F1STRS`](#word-f1strs)<br><sub><code>(see implementation)</code></sub> | Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag. | — |
| [`F2NDLS`](#word-f2ndls)<br><sub><code>(see implementation)</code></sub> | Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue. | — |
| [`F2NDRS`](#word-f2ndrs)<br><sub><code>(see implementation)</code></sub> | Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue. | — |
| [`F3RDLS`](#word-f3rdls)<br><sub><code>(see implementation)</code></sub> | Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue. | — |
| [`F3RDRS`](#word-f3rdrs)<br><sub><code>(see implementation)</code></sub> | Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag. | — |
| [`FBLLS`](#word-fblls)<br><sub><code>(see implementation)</code></sub> | Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag. | — |
| [`FBLRS`](#word-fblrs)<br><sub><code>(see implementation)</code></sub> | Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag. | — |
| [`FIELDWRT`](#word-fieldwrt)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate FINDEX. GETF fetches FIELD bytes sequentially; FIELDWRT draws the initial segment and eight continuations. FMIRROR supplies the other half later. | — |
| [`FL`](#word-fl)<br><sub><code>(see implementation)</code></sub> | Definition. Select hex, hide the incomplete screen via port $0A, clear RAM/background, enable interrupts, select infield/line pixel patterns and paint INFIELD/FIELDWRT. | — |
| [`FLFILL`](#word-flfill)<br><sub><code>(see implementation)</code></sub> | Definition. FLFILL fills the background while allowing interrupts; ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. Continue loading. | — |
| [`FLSHME`](#word-flshme)<br><sub><code>(see implementation)</code></sub> | Definition. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line. | — |
| [`FLSHTON`](#word-flshton)<br><sub><code>(see implementation)</code></sub> | Definition. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line. | — |
| [`FOULTIME`](#word-foultime)<br><sub><code>(see implementation)</code></sub> | Definition. FOULTIME posts FOUL and increments strikes only below two, then redraws counts; continue. | — |
| [`FOWR`](#word-fowr)<br><sub><code>(see implementation)</code></sub> | Definition. Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells. | — |
| [`FSSLS`](#word-fssls)<br><sub><code>(see implementation)</code></sub> | Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue. | — |
| [`FSSRS`](#word-fssrs)<br><sub><code>(see implementation)</code></sub> | Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue. | — |
| [`GETF`](#word-getf)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate FINDEX. GETF fetches FIELD bytes sequentially; FIELDWRT draws the initial segment and eight continuations. FMIRROR supplies the other half later. | — |
| [`GRNDRACTION`](#word-grndraction)<br><sub><code>(see implementation)</code></sub> | Definition. GRNDRACTION clears prior hit/foul state, selects a GSTBL entry using the index and executes it with EX. | — |
| [`GRNDRHIT`](#word-grndrhit)<br><sub><code>(see implementation)</code></sub> | Definition. Mark a grounder and speed 2, combine a random choice with horizontal pitch direction and SWINGTYPE, save SECTNM and dispatch GRNDRACTION. | — |
| [`HITDST`](#word-hitdst)<br><sub><code>(see implementation)</code></sub> | Definition. HITDST resets the ball update count, gives it THWBLPA, activates its ball status, selects BAL and places it at the batter's starting coordinates. | — |
| [`HLLS`](#word-hlls)<br><sub><code>(see implementation)</code></sub> | Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag. | — |
| [`HLS`](#word-hls)<br><sub><code>(see implementation)</code></sub> | Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue. | — |
| [`HMS`](#word-hms)<br><sub><code>(see implementation)</code></sub> | Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue. | — |
| [`HOM`](#word-hom)<br><sub><code>(see implementation)</code></sub> | Definition. HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; continue. | — |
| [`HRBY2`](#word-hrby2)<br><sub><code>(see implementation)</code></sub> | Definition. HRBY2 halves HRAT. WHBODDS finds BASESTATUS and WHOSUP using the decision tree, treating an empty R1 as empty bases. | — |
| [`HRLS`](#word-hrls)<br><sub><code>(see implementation)</code></sub> | Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag. | — |
| [`HRS`](#word-hrs)<br><sub><code>(see implementation)</code></sub> | Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag. | — |
| [`ICODE`](#word-icode)<br><sub><code>(see implementation)</code></sub> | Definition. ICODE starts a CODE definition and emits the scheduler/register-save prologue: set INLIN/IPNT, swap alternate register banks and preserve the active register sets. | — |
| [`INEXT`](#word-inext)<br><sub><code>(see implementation)</code></sub> | Definition. IEX restores saved registers, enables interrupts and returns. INEXT emits a jump to IEX; continue loading. | — |
| [`INLOG`](#word-inlog)<br><sub><code>(see implementation)</code></sub> | Definition. Clear catch/base/walk/run/double-play and boundary flags, request the bat-crack sound, and set PLAYON to R1. | — |
| [`INNODDS`](#word-innodds)<br><sub><code>(see implementation)</code></sub> | Definition. INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state; continue loading. | — |
| [`INSCN`](#word-inscn)<br><sub><code>(see implementation)</code></sub> | Definition. INSCN shows GAME OVER, flashes ISCN and prints one of two pricing layouts according to CNSW1, then draws the second-base pattern. | — |
| [`INSTRC`](#word-instrc)<br><sub><code>(see implementation)</code></sub> | Definition. Clear INSOUT, fill the screen and post pitch-button/trackball/outfielder instructions. | — |
| [`INSWAIT`](#word-inswait)<br><sub><code>(see implementation)</code></sub> | Definition. INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return. | — |
| [`INTERRUPTS`](#word-interrupts)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`INTHIGHRES`](#word-inthighres)<br><sub><code>(see implementation)</code></sub> | Definition. INTHIGHRES sets commercial mode, $C0 vertical blanking and zero horizontal color boundary. | — |
| [`ISCN`](#word-iscn)<br><sub><code>(see implementation)</code></sub> | Definition. Define ISCN to post V15 at the given coordinates. | — |
| [`LABLE`](#word-lable)<br><sub><code>(see implementation)</code></sub> | Definition. Define zero-initialized cell/byte variable emitters V=/BV=, constant and forward shorthands C=/F=, and the deliberately spelled label alias LABLE for DATA. | — |
| [`LDINFLDPA`](#word-ldinfldpa)<br><sub><code>(see implementation)</code></sub> | Definition. LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain. | — |
| [`LDPC`](#word-ldpc)<br><sub><code>(see implementation)</code></sub> | Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending. | — |
| [`LDPCC`](#word-ldpcc)<br><sub><code>(see implementation)</code></sub> | Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending. | — |
| [`LK`](#word-lk)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`LSETTFCOOR`](#word-lsettfcoor)<br><sub><code>(see implementation)</code></sub> | Definition. LSETTFCOOR loops through four runners, setting magic, positions, expansion, runner status and invisible pattern pointers. | — |
| [`MASTER`](#word-master)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`MBALL`](#word-mball)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`MCANNON`](#word-mcannon)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`MCOIN`](#word-mcoin)<br><sub><code>(see implementation)</code></sub> | Definition. Use PMUSIC for the opening tune and BMUSIC for coin sound; stop loading. | — |
| [`MCVOLS`](#word-mcvols)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`MFENCE`](#word-mfence)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`MFOUL`](#word-mfoul)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`MHIT`](#word-mhit)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`MLINN`](#word-mlinn)<br><sub><code>(see implementation)</code></sub> | Definition. MLINN clears the marker region and, for a nonzero LINN, computes the arrow X coordinate with a cap before drawing IMRK. | — |
| [`MOPENERS`](#word-mopeners)<br><sub><code>(see implementation)</code></sub> | Definition. Use PMUSIC for the opening tune and BMUSIC for coin sound; stop loading. | — |
| [`MOUT`](#word-mout)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`MSAFE`](#word-msafe)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`MSTRIKE`](#word-mstrike)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`MYAH`](#word-myah)<br><sub><code>(see implementation)</code></sub> | Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention. | — |
| [`NOISE`](#word-noise)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`NOTES`](#word-notes)<br><sub><code>(see implementation)</code></sub> | Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order. | — |
| [`NPOST`](#word-npost)<br><sub><code>(see implementation)</code></sub> | Definition. NPOST iterates the requested byte count, posts each high then low nibble using SWAN and dpost, drops remaining drawing arguments and continues. | — |
| [`OFFDST`](#word-offdst)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`OFMOT`](#word-ofmot)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`OUTFLDHIT`](#word-outfldhit)<br><sub><code>(see implementation)</code></sub> | Definition. Set outfield, timer, speed and airborne flags; select randomized Y/X coordinates and a HMHTBL class, call HOMERCHK and start the batter. | — |
| [`OUTLINE`](#word-outline)<br><sub><code>(see implementation)</code></sub> | Definition. OUTLINE uses NDUP/PICK and line continuation to draw four edges from X/Y/width/height. | — |
| [`OUTTIME`](#word-outtime)<br><sub><code>(see implementation)</code></sub> | Definition. Define GAME OVER text. OUTTIME increments OUTS; reaching $33 enters the third-out path and requests cheer music. | — |
| [`PLRCHK`](#word-plrchk)<br><sub><code>(see implementation)</code></sub> | Definition. PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL; continue. | — |
| [`PLRSELECT`](#word-plrselect)<br><sub><code>(see implementation)</code></sub> | Definition. PLRSELECT redraws the field, enables player-choice polling and resets SELECT while updating the inning marker. | — |
| [`PPOST`](#word-ppost)<br><sub><code>( x y options string -- x y options )</code></sub> | Definition. PPOST obtains the counted string length/address using COUNT and calls cpost for every byte, leaving updated X/Y/options for the next string; continue. | — |
| [`PUP`](#word-pup)<br><sub><code>(see implementation)</code></sub> | Definition. Initialize high-resolution commercial video mode, select B1 and write the initial output values. | — |
| [`PX0`](#word-px0)<br><sub><code>(see implementation)</code></sub> | Definition. Emit zero/white pixel patterns and define PX1/PX0 to select them. | — |
| [`PX1`](#word-px1)<br><sub><code>(see implementation)</code></sub> | Definition. Emit zero/white pixel patterns and define PX1/PX0 to select them. | — |
| [`QUIET`](#word-quiet)<br><sub><code>(see implementation)</code></sub> | Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending. | — |
| [`QUIT`](#word-quit)<br><sub><code>(see implementation)</code></sub> | Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending. | — |
| [`RDRNDNTE`](#word-rdrndnte)<br><sub><code>(see implementation)</code></sub> | Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order. | — |
| [`RECLINE`](#word-recline)<br><sub><code>(see implementation)</code></sub> | Definition. RECLINE derives one horizontal row from retained rectangle arguments. RECTAN repeatedly draws rows, advances Y and decreases remaining height, then discards the arguments. | — |
| [`RECTAN`](#word-rectan)<br><sub><code>(see implementation)</code></sub> | Definition. RECLINE derives one horizontal row from retained rectangle arguments. RECTAN repeatedly draws rows, advances Y and decreases remaining height, then discards the arguments. | — |
| [`REST`](#word-rest)<br><sub><code>(see implementation)</code></sub> | Definition. Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato. | — |
| [`RETPA`](#word-retpa)<br><sub><code>(see implementation)</code></sub> | Definition. RETPA gives eight fielders TFPA, activates them and clears VGO. | — |
| [`RNDNTE`](#word-rndnte)<br><sub><code>(see implementation)</code></sub> | Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order. | — |
| [`RRRNDNTE`](#word-rrrndnte)<br><sub><code>(see implementation)</code></sub> | Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order. | — |
| [`RUN1CHK1ST`](#word-run1chk1st)<br><sub><code>(see implementation)</code></sub> | Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue. | — |
| [`RUN1CHK2ND`](#word-run1chk2nd)<br><sub><code>(see implementation)</code></sub> | Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue. | — |
| [`RUN2CHK`](#word-run2chk)<br><sub><code>(see implementation)</code></sub> | Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. | — |
| [`RUN2CHK12ND`](#word-run2chk12nd)<br><sub><code>(see implementation)</code></sub> | Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue. | — |
| [`RUN2CHK1ST`](#word-run2chk1st)<br><sub><code>(see implementation)</code></sub> | Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. | — |
| [`RUN3CHK`](#word-run3chk)<br><sub><code>(see implementation)</code></sub> | Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address. | — |
| [`S!`](#word-sx21)<br><sub><code>( address value -- )</code></sub> | Definition. S! swaps the value/address before cell store; SB! does the same for byte store. | — |
| [`S10`](#word-s10)<br><sub><code>(see implementation)</code></sub> | Definition. S10 starts INTERRUPTS0 through ISTART; S11 starts INTERRUPTS1. Restore the radix saved by the surrounding interrupt chain and stop. | — |
| [`S11`](#word-s11)<br><sub><code>(see implementation)</code></sub> | Definition. S10 starts INTERRUPTS0 through ISTART; S11 starts INTERRUPTS1. Restore the radix saved by the surrounding interrupt chain and stop. | — |
| [`SB!`](#word-sbx21)<br><sub><code>( address byte -- )</code></sub> | Definition. S! swaps the value/address before cell store; SB! does the same for byte store. | — |
| [`SBALL1`](#word-sball1)<br><sub><code>(see implementation)</code></sub> | Definition. Define BALL 1/2/3, HOMER and WALK string words. | — |
| [`SBALL2`](#word-sball2)<br><sub><code>(see implementation)</code></sub> | Definition. Define BALL 1/2/3, HOMER and WALK string words. | — |
| [`SBALL3`](#word-sball3)<br><sub><code>(see implementation)</code></sub> | Definition. Define BALL 1/2/3, HOMER and WALK string words. | — |
| [`SBO`](#word-sbo)<br><sub><code>(see implementation)</code></sub> | Definition. SBO posts the three $30-based count characters at their fixed positions. Select decimal and load the infield data chain at 278. | — |
| [`SCOREME`](#word-scoreme)<br><sub><code>(see implementation)</code></sub> | Definition. SCOREME selects SCORE1/SCORE2 and coordinates from SCORESHOW, posts one BCD byte, clears the display request and selects cannon or cheer music; continue. | — |
| [`SCRERASE`](#word-screrase)<br><sub><code>(see implementation)</code></sub> | Definition. SCRERASE fills $3F00 bytes starting at $4000 with zero; continue. | — |
| [`SCRS`](#word-scrs)<br><sub><code>(see implementation)</code></sub> | Definition. SUP posts UP. SCRS clears two score rectangles and draws zero score characters. | — |
| [`SETFDST`](#word-setfdst)<br><sub><code>(see implementation)</code></sub> | Definition. Save radix, select hex and write shortstop, first-base, third-base and second-base X/Y destination cells. | — |
| [`SETTF`](#word-settf)<br><sub><code>(see implementation)</code></sub> | Definition. STFLD installs RETPA and TAKEFIELD. SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading. | — |
| [`SETTFPA`](#word-settfpa)<br><sub><code>(see implementation)</code></sub> | Definition. SETTFPA assigns delayed take-field sequences to pitcher/infielders, RUNBPA to all runners and TBLPA to BL; continue. | — |
| [`SFOUL`](#word-sfoul)<br><sub><code>(see implementation)</code></sub> | Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue. | — |
| [`SGO`](#word-sgo)<br><sub><code>(see implementation)</code></sub> | Definition. Define GAME OVER text. OUTTIME increments OUTS; reaching $33 enters the third-out path and requests cheer music. | — |
| [`SHOMER`](#word-shomer)<br><sub><code>(see implementation)</code></sub> | Definition. Define BALL 1/2/3, HOMER and WALK string words. | — |
| [`SORRY`](#word-sorry)<br><sub><code>(see implementation)</code></sub> | Definition. Define congratulatory, loss and one-coin prompts and continue loading. | — |
| [`SOUT1`](#word-sout1)<br><sub><code>(see implementation)</code></sub> | Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue. | — |
| [`SOUT2`](#word-sout2)<br><sub><code>(see implementation)</code></sub> | Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue. | — |
| [`SOUT3`](#word-sout3)<br><sub><code>(see implementation)</code></sub> | Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue. | — |
| [`SPLR`](#word-splr)<br><sub><code>(see implementation)</code></sub> | Definition. SPLR12/SPLR display available player choices; when one more credit is needed for two players, set STRT1. | — |
| [`SPLR12`](#word-splr12)<br><sub><code>(see implementation)</code></sub> | Definition. SPLR12/SPLR display available player choices; when one more credit is needed for two players, set STRT1. | — |
| [`SPOST`](#word-spost)<br><sub><code>(see implementation)</code></sub> | Definition. SPOST calls PPOST then drops the three retained drawing arguments. | — |
| [`SSAFE`](#word-ssafe)<br><sub><code>(see implementation)</code></sub> | Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue. | — |
| [`SSTRIKE1`](#word-sstrike1)<br><sub><code>(see implementation)</code></sub> | Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue. | — |
| [`SSTRIKE2`](#word-sstrike2)<br><sub><code>(see implementation)</code></sub> | Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue. | — |
| [`STFLD`](#word-stfld)<br><sub><code>(see implementation)</code></sub> | Definition. STFLD installs RETPA and TAKEFIELD. SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading. | — |
| [`STP`](#word-stp)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`STRIKETIME`](#word-striketime)<br><sub><code>(see implementation)</code></sub> | Definition. STRIKETIME increments STRIKES. At $33 call OUTTIME and retain the OUT event code; otherwise play/post the new strike count. | — |
| [`STRINGGO`](#word-stringgo)<br><sub><code>(see implementation)</code></sub> | Definition. STRINGGO sets the shared Y/options, chooses STETBL for erase or STTBL for an event and initializes its expiry timer, executes the selected word and drops retained drawing parameters. | — |
| [`STRINGPRC`](#word-stringprc)<br><sub><code>(see implementation)</code></sub> | Definition. STRINGPRC takes and clears STRING, erases an existing timed message when necessary, records OLDSTRING, draws/processes the new event and clears STRINGERASE. | — |
| [`STRTBALL`](#word-strtball)<br><sub><code>(see implementation)</code></sub> | Definition. STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music. | — |
| [`SUP`](#word-sup)<br><sub><code>(see implementation)</code></sub> | Definition. SUP posts UP. SCRS clears two score rectangles and draws zero score characters. | — |
| [`SW-30`](#word-swx2d30)<br><sub><code>(see implementation)</code></sub> | Definition. SW-30 chooses right/second-base sectors by the same input convention. | — |
| [`SW-45`](#word-swx2d45)<br><sub><code>(see implementation)</code></sub> | Definition. SW-45 chooses among right/foul/first-base sectors using horizontal pitch direction and the random selector. | — |
| [`SW-90`](#word-swx2d90)<br><sub><code>(see implementation)</code></sub> | Definition. SW-90 ignores direction/random inputs and returns the far-right foul sector. | — |
| [`SW+30`](#word-swx2b30)<br><sub><code>(see implementation)</code></sub> | Definition. SW+30 chooses left/third-base/shortstop sectors. | — |
| [`SW+45`](#word-swx2b45)<br><sub><code>(see implementation)</code></sub> | Definition. SW+45 handles the left-edge choices; SW+90 always returns foul-left after dropping its inputs. | — |
| [`SW+90`](#word-swx2b90)<br><sub><code>(see implementation)</code></sub> | Definition. SW+45 handles the left-edge choices; SW+90 always returns foul-left after dropping its inputs. | — |
| [`SW0`](#word-sw0)<br><sub><code>(see implementation)</code></sub> | Definition. SW0 handles the central swing angle and middle/second-base/shortstop sectors; continue. | — |
| [`SWALK`](#word-swalk)<br><sub><code>(see implementation)</code></sub> | Definition. Define BALL 1/2/3, HOMER and WALK string words. | — |
| [`TCNT`](#word-tcnt)<br><sub><code>(see implementation)</code></sub> | Definition. TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits. | — |
| [`TERSECHK`](#word-tersechk)<br><sub><code>(see implementation)</code></sub> | Definition. TERSECHK advances the random generator and services pending take-field, player-selection, player-check and credit-update flags. | — |
| [`TF`](#word-tf)<br><sub><code>(see implementation)</code></sub> | Definition. TF clears transient RAM, initializes ball/strike/out character bytes to $30, reads and inverts the pricing DIP bit, switches PLYR1UP and adjusts computer control. | — |
| [`THW`](#word-thw)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`TWAIT`](#word-twait)<br><sub><code>(see implementation)</code></sub> | Definition. TWAIT performs a high-level delay with interrupts enabled, shortening it under the credit/pricing conditions shown, and finishes with interrupts disabled; continue. | — |
| [`V`](#word-v)<br><sub><code>(see implementation)</code></sub> | Definition. Define V as VARIABLE and BV as BVARIABLE, then continue the music processor source. | — |
| [`VIBS`](#word-vibs)<br><sub><code>(see implementation)</code></sub> | Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte. | — |
| [`VIS`](#word-vis)<br><sub><code>(see implementation)</code></sub> | Definition. HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; continue. | — |
| [`WHBODDS`](#word-whbodds)<br><sub><code>(see implementation)</code></sub> | Definition. HRBY2 halves HRAT. WHBODDS finds BASESTATUS and WHOSUP using the decision tree, treating an empty R1 as empty bases. | — |
| [`WTHW`](#word-wthw)<br><sub><code>(see implementation)</code></sub> | Original source definition or target word. | — |
| [`WUPGO`](#word-wupgo)<br><sub><code>(see implementation)</code></sub> | Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue. | — |
| [`WUPTON`](#word-wupton)<br><sub><code>(see implementation)</code></sub> | Definition. WUPTON installs WUPWRT. CHKFLSHSTAY checks whether flashing was reserved and stops that special use while retaining its phase state. | — |
| [`WUPWRT`](#word-wupwrt)<br><sub><code>(see implementation)</code></sub> | Definition. PTAUTOTM decrements TIMEOUT only when field clearing is idle; WUPWRT calls it and draws the currently batting team label. | — |
| [`YOU1ST`](#word-you1st)<br><sub><code>(see implementation)</code></sub> | Definition. YOU1ST posts the greeting/extra-inning challenge, then continues to 306. | — |
| [`ZERORAM`](#word-zeroram)<br><sub><code>(see implementation)</code></sub> | Definition. FLFILL fills the background while allowing interrupts; ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. Continue loading. | — |

## Native CODE words (84)

| Word / stack | Function | DNA documentation |
| --- | --- | --- |
| [`ALLFLDACT`](#word-allfldact)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE. | — |
| [`ANMSEQLOAD`](#word-anmseqload)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. ANMSEQLOAD indexes the current animation group by VPERS# and saves VANMSEQ. | — |
| [`BALLERASE`](#word-ballerase)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BALLERASE preserves BC/IY around native BLERASE and returns to TERSE. | — |
| [`BATHIT`](#word-bathit)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BATHIT marks HITYET, calls INLOG through DOVERB and clears hit/pitch/swing-go flags. | — |
| [`BATHITCHK`](#word-bathitchk)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BATHITCHK indexes by swing phase, rejects out-of-range Y and scaled X coordinates and preserves the table pointer as required. | — |
| [`BATSWING`](#word-batswing)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BATSWING marks a strike attempt, XOR-erases/redraws successive phases, checks contact until HITGOING is set and starts the reset delay at the last phase; continue. | — |
| [`BATWRITE`](#word-batwrite)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BATWRITE looks up the angle, uses fixed batter coordinates/options and draws the relative pattern, preserving its caller's pointer. | — |
| [`BCD+`](#word-bcdx2b)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BCD+ pops two cells, adds their low bytes with DAA, adds high bytes with carry and DAA, and pushes the resulting packed-BCD cell.  | — |
| [`BLDST`](#word-bldst)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BLDST preserves BC, reads the ball speed, loads its destination and calls DSTCALC; a LDFLAG result means retain the current motion. | — |
| [`BLMOTION`](#word-blmotion)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BLMOTION selects the writable pitch-ball RAM action record TBLPA. | — |
| [`BLPOSCHK`](#word-blposchk)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BLPOSCHK branches on HITYET. A pitch beyond Y=$BC enters pitch-completion handling unless contact is already pending. | — |
| [`BMUSIC`](#word-bmusic)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. loadpc installs MUSPC and STARTPC. BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay. | — |
| [`BUTTONCHK`](#word-buttonchk)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. BUTTONCHK branches on HITYET; after contact, CMSW selects computer control and enters a protected proximity test. | — |
| [`CHKCAUGHT`](#word-chkcaught)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Declare cross-screen labels, return during WALK, preserve IY/IX, clear flags through the zero accumulator and set NORUN. | — |
| [`CHKGROUNDER`](#word-chkgrounder)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. CHKGROUNDER returns unless GRNDR is set, advances/wraps GRNDRVALUE across thirteen entries, chooses/sign-adjusts the offset and adds it to HL; continue. | — |
| [`CHKSCRTIME`](#word-chkscrtime)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Disable interrupts and preserve IX. For outfield hits use PLAYON and advance it by VLENGTH unless already at R4 or in the double-play special case; for infield hits use R1. | — |
| [`CLRBLST`](#word-clrblst)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading. | — |
| [`cnline`](#word-cnline)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. cnline preserves BC/IY/IX and the interrupt-enable state captured by LD A,I, calls the line VECTOR routine under DI, restores registers and conditionally EI, then continues loading. | — |
| [`COMPDE`](#word-compde)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Save radix and select hex. COMPHL forms two's complement of HL; COMPDE applies the same operation to DE while preserving HL. | — |
| [`COMPHL`](#word-comphl)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Save radix and select hex. COMPHL forms two's complement of HL; COMPDE applies the same operation to DE while preserving HL. | — |
| [`COUNT`](#word-count)<br><sub><code>( address -- address+1 length )</code></sub> | Native counted-string helper at $00E6; used to obtain the address/length for PPOST. | TERSE Standard Glossary |
| [`cpost`](#word-cpost)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Define SMFONT and ZEROSP option-bit positions and document cpost's retained X/Y/options return values. | — |
| [`DEACTIVATE`](#word-deactivate)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. DEACTIVATE clears VACT in the IX vector record and sets SAMEDLT so playaction loading can retain existing motion; return and continue. | — |
| [`DI`](#word-di)<br><sub><code>(see implementation)</code></sub> | Target disable-interrupts primitive at $0243. | — |
| [`DIVHLBY4`](#word-divhlby4)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. DIVHLBY4 records the sign, negates to absolute magnitude, shifts right twice and reapplies the sign; this truncates the magnitude before sign restoration. | — |
| [`DO`](#word-do)<br><sub><code>(see implementation)</code></sub> | Native counted-loop entry at $0176. | TERSE Standard Glossary |
| [`DSTCALC`](#word-dstcalc)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Save radix, declare labels and document the register interface: destination X in HL, Y in DE, speed in A; result Y delta in HL, X delta in DE and pattern/magic in BC. | — |
| [`DSTLD`](#word-dstld)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively. | — |
| [`EI`](#word-ei)<br><sub><code>(see implementation)</code></sub> | Target enable-interrupts primitive at $0246. | — |
| [`EIDI`](#word-eidi)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. DTC selects decimal and invokes the host editor. | — |
| [`EMUSIC`](#word-emusic)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. EMUSIC selects ENDMUSIC and initializes timing/repetition to one; it is intended for startup. | — |
| [`EX`](#word-ex)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation. | — |
| [`FILL`](#word-fill)<br><sub><code>(see implementation)</code></sub> | Native byte fill at $0253, called as value/address/count in this source. | — |
| [`FLDDST`](#word-flddst)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. FLDDST calculates motion at speed 4. On pitcher arrival select STPT and initialize pitch/timeout/outfield-control state; other arrivals select STND. | — |
| [`FLSHOFF`](#word-flshoff)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. FLSHOFF disables flashing and services cleanup under DI. DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; continue. | — |
| [`FMIRROR`](#word-fmirror)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order. | — |
| [`HITRUN`](#word-hitrun)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Declare HRRET, define HITRUN, clear OFTBLGO so ordinary runners do not automatically advance two bases, and preserve BC. | — |
| [`HOMERCHK`](#word-homerchk)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. HOMERCHK takes stacked random values, hit class and coordinates, swaps register banks and derives FNCY/FNCX perturbations. | — |
| [`I`](#word-i)<br><sub><code>(see implementation)</code></sub> | Native loop-index access at $01BF. | — |
| [`IEX`](#word-iex)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. IEX restores saved registers, enables interrupts and returns. INEXT emits a jump to IEX; continue loading. | — |
| [`INDEXW`](#word-indexw)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. INDEXW preserves A/flags, calculates HL+2*A, loads the selected cell in DE, restores HL to the entry start and returns; continue. | — |
| [`INFIELD`](#word-infield)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Declare row-loop labels, preserve BC/IX, point IX to INFP and initialize the destination row and span endpoint state. Each INFP byte feeds IFSPAN. | — |
| [`INFLDACT`](#word-infldact)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE. | — |
| [`ISTART`](#word-istart)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT. | — |
| [`KILLOF`](#word-killof)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. KILLOF zeroes OF deltas, selects standing animation and clears OFTBLGO. | — |
| [`LOADANM`](#word-loadanm)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. LOADANM copies magic and animation-group fields from the stream into the IX vector record, selects PATTERNS and returns the advanced stream pointer; continue. | — |
| [`LOOP`](#word-loop)<br><sub><code>(see implementation)</code></sub> | Native counted-loop continuation at $0191. | TERSE Standard Glossary |
| [`MULTHLBY4`](#word-multhlby4)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign. | — |
| [`MUSCPU`](#word-muscpu)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Declare cross-screen dispatch labels and begin assembling MUSCPU. | — |
| [`NDUP`](#word-ndup)<br><sub><code>(see implementation)</code></sub> | Native multi-cell stack duplication helper bound to $0260, used by OUTLINE. | — |
| [`OFFFDST`](#word-offfdst)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. OFFFDST schedules a take-field delay for outfielders, chooses an exit side from team/runner status and calls DSTCALC for the off-field destination. | — |
| [`OFLDTBL`](#word-ofldtbl)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. OFLDTBL gives all three outfielders OFTBLPA, activates them and returns; continue. | — |
| [`OFMOTION`](#word-ofmotion)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. OFMOTION selects OFPA and deactivates a standing outfielder. | — |
| [`ON1ST`](#word-on1st)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue. | — |
| [`ON2ND`](#word-on2nd)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue. | — |
| [`ON3RD`](#word-on3rd)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue. | — |
| [`OPCODECHK`](#word-opcodechk)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. OPCODECHK treats bytes below $28 as commands, saves the next stream address in VECTPC, indexes OPTBL after adjusting the command index, dispatches via a synthetic native return and reloads VECTPC. | — |
| [`OUTFLDACT`](#word-outfldact)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE. | — |
| [`PACTLOAD`](#word-pactload)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. PACTLOAD fetches VPLAYACTPC, services a command and either skips the existing movement fields for SAMEDLT or calls LOADANM. | — |
| [`PATFETCH`](#word-patfetch)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. PATFETCH selects normal phase limits or a longer pitcher pre-hit sequence. | — |
| [`PERSPECTIVE`](#word-perspective)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. PERSPECTIVE compares integer Y against its thresholds and chooses size index 0–4. | — |
| [`PLAYACT`](#word-playact)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Preserve BC/IX, select the vector and fetch a new action when VUPDATE# is zero. | — |
| [`PMUSIC`](#word-pmusic)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer.  | — |
| [`PTAUTOTM`](#word-ptautotm)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. PTAUTOTM decrements TIMEOUT only when field clearing is idle; WUPWRT calls it and draws the currently batting team label. | — |
| [`RESETRUNNERS`](#word-resetrunners)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Declare copy-path labels, enter assembly, and set a four-pass loop while saving the loop accumulator/flags. | — |
| [`RND`](#word-rnd)<br><sub><code>(see implementation)</code></sub> | Native random-range helper at $0275. | — |
| [`RUNDST`](#word-rundst)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Declare its cross-screen branch labels and enter RUNDST assembly. | — |
| [`SENTRY`](#word-sentry)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. SENTRY preserves BC, polls the request flags and conditionally calls button, pitch, outfield, throw, hit, catch, scoring and music routines. | — |
| [`SETACT`](#word-setact)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. SETACT takes the first status address in HL and count in A, setting VACT at VLENGTH-byte strides. | — |
| [`STARTMUSIC`](#word-startmusic)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. STARTMUSIC clears its request. CHEERME selects crowd cheer and normal palette setup; otherwise choose fence or homer cannon music, with the homer palette schedule when needed. | — |
| [`strtline`](#word-strtline)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. strtline converts the X representation for relabs, derives BIT-POS and sets the actual framebuffer address SADR by adding $4000. | — |
| [`SWAN`](#word-swan)<br><sub><code>(see implementation)</code></sub> | Native nibble-swap binding used to post the high BCD digit before the low digit. | — |
| [`TBALLPITCH`](#word-tballpitch)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. TBALLPITCH adjusts TBALLYSR using signed Y input, clamps the positive progression to three and avoids reducing the negative-side state below the shown threshold; store the resulting cell in TBLDY. | — |
| [`THROWANIM`](#word-throwanim)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Preserve IX/IY, disable interrupts, select WHOTHROWS, clear throw-animation state and velocity, and copy the thrower's coordinates into BL with the shown X adjustment. | — |
| [`THROWBALL`](#word-throwball)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. THROWBALL waits while scoring is clearing, resets THROWTIME, selects BAL and, for a pitch, copies pitcher coordinates into BL with offsets under DI. | — |
| [`THWANMSET`](#word-thwanmset)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. THWANMSET saves the IX entity as WHOTHROWS, erases the ball and sets INAIR/THROWANM for the foreground sentry. | — |
| [`TIMER`](#word-timer)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. TIMER turns THROWTIMER expiry into THROWTIME. | — |
| [`VECTOR`](#word-vector)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Choose ordinary or restricted outfielder Y bounds, load X and divide its X delta by four for the horizontal resolution before adding it. | — |
| [`VERASE`](#word-verase)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. VERASE reads expansion/magic and pattern, skips its relative offsets to the size header and loads VSCRADR. | — |
| [`VWRITE`](#word-vwrite)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. VWRITE reads expansion/magic, X/Y and VPAT, converts relative offsets and calculates the magic-write destination. | — |
| [`WAIT`](#word-wait)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. WAIT runs nested accumulator countdowns and returns natively. | — |
| [`WAITTHRW`](#word-waitthrw)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. WAITTHRW starts throw setup, then for most occupancy cases defers THROWANM with a WAITTHROW timer. | — |
| [`WRITE`](#word-write)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Document WRITE's stack arguments. The WRTSYS comment describes historical options; this body calls software write directly. | — |
| [`WRITR`](#word-writr)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Document the stack interface and output. The heading says WRITER, but the actual defined name is WRITR. | — |

## Native SUBR helpers (47)

| Word / stack | Function | DNA documentation |
| --- | --- | --- |
| [`AUTOR1`](#word-autor1)<br><sub><code>(see implementation)</code></sub> | Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners. | — |
| [`AUTOR2`](#word-autor2)<br><sub><code>(see implementation)</code></sub> | Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners. | — |
| [`AUTOR3`](#word-autor3)<br><sub><code>(see implementation)</code></sub> | Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners. | — |
| [`BLERASE`](#word-blerase)<br><sub><code>(see implementation)</code></sub> | Native subroutine. BLERASE preserves IX, selects BL, erases it, clears active status and replaces its pattern with NOBOD. | — |
| [`CHKATBS`](#word-chkatbs)<br><sub><code>(see implementation)</code></sub> | Native subroutine. CHKATBS tests active/at-base bits and increments E when a player is active away from base. | — |
| [`CHKCOIN1`](#word-chkcoin1)<br><sub><code>(see implementation)</code></sub> | Native subroutine. When idle, debounce bit 0 from port $11; on acceptance latch CNTM1, pulse output $20, increment CREDITS, request UPCRED, clear bonus state and play coin music. | — |
| [`CHKCOIN2`](#word-chkcoin2)<br><sub><code>(see implementation)</code></sub> | Native subroutine. CHKCOIN2 debounces bit 1 of port $11, latches CNTM2, pulses output $20 and requests a credit update. | — |
| [`CMPOF`](#word-cmpof)<br><sub><code>(see implementation)</code></sub> | Native subroutine. CMPOF returns if outfield control is inactive; otherwise preserve IX, choose LF/CF/RF from destination X and save CMFLDR. | — |
| [`COLORBAND`](#word-colorband)<br><sub><code>(see implementation)</code></sub> | Native subroutine. COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled. Its unusual NEXT/XTHL entry follows the scheduler's calling convention. | — |
| [`debounce`](#word-debounce)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Preserve BC, move the port/mask into working registers and sample `(input XOR expected) AND mask`; return A=1 after enough consecutive matches. | — |
| [`FETCH`](#word-fetch)<br><sub><code>(see implementation)</code></sub> | Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. | — |
| [`FLSHWUP`](#word-flshwup)<br><sub><code>(see implementation)</code></sub> | Native subroutine. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line. | — |
| [`FNBB`](#word-fnbb)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,. | — |
| [`FONTUNPACK`](#word-fontunpack)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Allocate a five-byte FONTWORK buffer. FONTUNPACK reads two packed bytes and starts a five-row unpack loop. | — |
| [`FRO1`](#word-fro1)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,. | — |
| [`FRO12`](#word-fro12)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,. | — |
| [`FRO123`](#word-fro123)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,. | — |
| [`FRO13`](#word-fro13)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,. | — |
| [`FRO2`](#word-fro2)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,. | — |
| [`FRO23`](#word-fro23)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,. | — |
| [`FRO3`](#word-fro3)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,. | — |
| [`HLOAD`](#word-hload)<br><sub><code>(see implementation)</code></sub> | Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. | — |
| [`IFSPAN`](#word-ifspan)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Declare labels; IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value. | — |
| [`INCPC`](#word-incpc)<br><sub><code>(see implementation)</code></sub> | Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. | — |
| [`loadpc`](#word-loadpc)<br><sub><code>(see implementation)</code></sub> | Native subroutine. loadpc installs MUSPC and STARTPC. BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay. | — |
| [`LVRSTAT`](#word-lvrstat)<br><sub><code>(see implementation)</code></sub> | Native subroutine. LVRSTAT writes A to all four VRSTAT bytes. WALKOVER requests CAUGHT and THROWAROUND when the walk timer completes; continue. | — |
| [`NBB`](#word-nbb)<br><sub><code>(see implementation)</code></sub> | Native subroutine. SETDBLPLAY raises its flag; NBB is the empty-bases no-op. | — |
| [`OFBLCHK`](#word-ofblchk)<br><sub><code>(see implementation)</code></sub> | Native subroutine. OFBLCHK takes a maximum distance in D, loads BL coordinates and begins with LF in IY for a three-record search. | — |
| [`PCJUMP`](#word-pcjump)<br><sub><code>(see implementation)</code></sub> | Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address. | — |
| [`relabs`](#word-relabs)<br><sub><code>(see implementation)</code></sub> | Native subroutine. relabs converts Y's integer byte to an 80-byte scanline offset while preserving the expansion/magic settings. | — |
| [`reloff`](#word-reloff)<br><sub><code>(see implementation)</code></sub> | Native subroutine. reloff documents its BC/DE/HL/IY interface, loads the X offset and scales it with two arithmetic/right-through-carry shifts. | — |
| [`RO1`](#word-ro1)<br><sub><code>(see implementation)</code></sub> | Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. | — |
| [`RO12`](#word-ro12)<br><sub><code>(see implementation)</code></sub> | Native subroutine. RO12 activates both forced runners, selecting a double-play or ordinary target; continue. | — |
| [`RO123`](#word-ro123)<br><sub><code>(see implementation)</code></sub> | Native subroutine. RO23 and RO123 choose forced advancement and double-play targets for their base combinations. | — |
| [`RO13`](#word-ro13)<br><sub><code>(see implementation)</code></sub> | Native subroutine. RO13 handles first-and-third occupancy and may branch through SETDBLPLAY. | — |
| [`RO2`](#word-ro2)<br><sub><code>(see implementation)</code></sub> | Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. | — |
| [`RO23`](#word-ro23)<br><sub><code>(see implementation)</code></sub> | Native subroutine. RO23 and RO123 choose forced advancement and double-play targets for their base combinations. | — |
| [`RO3`](#word-ro3)<br><sub><code>(see implementation)</code></sub> | Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC. | — |
| [`SETDBLPLAY`](#word-setdblplay)<br><sub><code>(see implementation)</code></sub> | Native subroutine. SETDBLPLAY raises its flag; NBB is the empty-bases no-op. | — |
| [`TAKEOFF`](#word-takeoff)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Select hexadecimal, declare the return label and begin TAKEOFF assembly. | — |
| [`TBALLPRC`](#word-tballprc)<br><sub><code>(see implementation)</code></sub> | Native subroutine. TBALLPRC reads port $13, toggles its axis selector, combines it with PLYR1UP for port $28 and stores the sampled byte in the interleaved TBALL delta area. Continue the routine. | — |
| [`TBLVEL`](#word-tblvel)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Declare labels and define TBLVEL: zero gives zero velocity, small magnitudes give $0080, magnitudes at least three give $01B0, and the original sign is restored with COMPHL. | — |
| [`TIMEDCR`](#word-timedcr)<br><sub><code>(see implementation)</code></sub> | Native subroutine. TIMEDCR leaves zero timers unchanged; otherwise decrements the byte and returns A=1 only on the transition to zero. | — |
| [`TOOFCK`](#word-toofck)<br><sub><code>(see implementation)</code></sub> | Native subroutine. TOOFCK decrements TOOF#; while stages remain reload the timeout, otherwise start CMPOF and mark TOOFF. Return to decimal and stop loading. | — |
| [`WALKOVER`](#word-walkover)<br><sub><code>(see implementation)</code></sub> | Native subroutine. LVRSTAT writes A to all four VRSTAT bytes. WALKOVER requests CAUGHT and THROWAROUND when the walk timer completes; continue. | — |
| [`write`](#word-write)<br><sub><code>(see implementation)</code></sub> | Native subroutine. Document the pointer/size interface and absence of a shifter flush, then output XPAND and MAGIC settings. | — |
| [`writep`](#word-writep)<br><sub><code>(IY=patadr BC=ex/mag+shf HL=scradr ---)</code></sub> | Native subroutine. writep reads X/Y byte counts through IY and jumps to the shared write loop. | — |

## Game constants and storage words (27)

| Word / stack | Function | DNA documentation |
| --- | --- | --- |
| [`BAL`](#word-bal)<br><sub><code>(see implementation)</code></sub> | Constant BAL, assigned source expression/value `628` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`BL`](#word-bl)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for the ball. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`CF`](#word-cf)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for the center fielder. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`FONTWORK`](#word-fontwork)<br><sub><code>(see implementation)</code></sub> | Byte array. Allocate a five-byte FONTWORK buffer. FONTUNPACK reads two packed bytes and starts a five-row unpack loop. | — |
| [`IPNT`](#word-ipnt)<br><sub><code>(see implementation)</code></sub> | Interrupt schedule pointer programmed/advanced by the generated handlers. | — |
| [`LCB`](#word-lcb)<br><sub><code>(see implementation)</code></sub> | Constant LCB, assigned source expression/value `368` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`LF`](#word-lf)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for the left fielder. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`LFLD`](#word-lfld)<br><sub><code>(see implementation)</code></sub> | Constant LFLD, assigned source expression/value `168` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`LRUN`](#word-lrun)<br><sub><code>(see implementation)</code></sub> | Constant LRUN, assigned source expression/value `68` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`LTRW`](#word-ltrw)<br><sub><code>(see implementation)</code></sub> | Constant LTRW, assigned source expression/value `268` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`MUSPC`](#word-muspc)<br><sub><code>(see implementation)</code></sub> | Current music-bytecode stream pointer. | — |
| [`NBD`](#word-nbd)<br><sub><code>(see implementation)</code></sub> | Constant NBD, assigned source expression/value `528` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`PT`](#word-pt)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for the pitcher. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`R1`](#word-r1)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for runner slot 1. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`R2`](#word-r2)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for runner slot 2. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`R3`](#word-r3)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for runner slot 3. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`R4`](#word-r4)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for runner slot 4. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`RCB`](#word-rcb)<br><sub><code>(see implementation)</code></sub> | Constant RCB, assigned source expression/value `328` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`RF`](#word-rf)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for the right fielder. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`RFLD`](#word-rfld)<br><sub><code>(see implementation)</code></sub> | Constant RFLD, assigned source expression/value `128` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`RND#`](#word-rndx23)<br><sub><code>(see implementation)</code></sub> | Two-cell random-generator state array explicitly placed at $7C06. | — |
| [`RRUN`](#word-rrun)<br><sub><code>(see implementation)</code></sub> | Constant RRUN, assigned source expression/value `28` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`RTRW`](#word-rtrw)<br><sub><code>(see implementation)</code></sub> | Constant RTRW, assigned source expression/value `228` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`SCR`](#word-scr)<br><sub><code>(see implementation)</code></sub> | Constant SCR, assigned source expression/value `728` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | TERSE Standard Glossary |
| [`SS`](#word-ss)<br><sub><code>(see implementation)</code></sub> | VLENGTH-byte vector record for the shortstop. Record layout is defined in 148; allocation order is defined in 216. | — |
| [`STND`](#word-stnd)<br><sub><code>(see implementation)</code></sub> | Constant STND, assigned source expression/value `428` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |
| [`STPT`](#word-stpt)<br><sub><code>(see implementation)</code></sub> | Constant STPT, assigned source expression/value `828` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups. | — |

## Shared, target-bound and host/XC words (157)

| Word / stack | Function | DNA documentation |
| --- | --- | --- |
| [`-`](#word-x2d)<br><sub><code>( a b -- difference )</code></sub> | Subtract the top value from the preceding value. | TERSE Standard Glossary |
| [`;`](#word-x3b)<br><sub><code>(see implementation)</code></sub> | Finish a high-level definition in the applicable compilation context. | TERSE Standard Glossary |
| [`:`](#word-x3a)<br><sub><code>(see implementation)</code></sub> | Begin a high-level TERSE definition; brace wrappers in XC code distinguish host compilation from target compilation. | TERSE Standard Glossary |
| [`!`](#word-x21)<br><sub><code>( value address -- )</code></sub> | Store a cell at an address; target binding at $00A1. | TERSE Standard Glossary |
| [`@`](#word-x40)<br><sub><code>( address -- value )</code></sub> | Fetch a cell from an address; target binding at $0093. | TERSE Standard Glossary |
| [`*`](#word-x2a)<br><sub><code>( a b -- product )</code></sub> | Multiply two stack values. | TERSE Standard Glossary |
| [`/`](#word-x2f)<br><sub><code>( a b -- quotient )</code></sub> | Divide the preceding stack value by the top value. | TERSE Standard Glossary |
| [`+`](#word-x2b)<br><sub><code>( a b -- sum )</code></sub> | Add two stack values. | TERSE Standard Glossary |
| [`+!`](#word-x2bx21)<br><sub><code>(see implementation)</code></sub> | Add a value to the cell at the address (host use in VPTR alignment). | TERSE Standard Glossary |
| [`+LOOP`](#word-x2bloop)<br><sub><code>(see implementation)</code></sub> | Native word / kernel binding. Declare loop labels and assemble +LOOP: pop the increment, update the IX loop index, compare against its limit and use sign/parity flag tests to choose repeat versus completion. Continue its body in 277. | TERSE Standard Glossary |
| [`<`](#word-x3c)<br><sub><code>( a b -- flag )</code></sub> | Compare whether the preceding value is less than the top value. | TERSE Standard Glossary |
| [`<>`](#word-x3cx3e)<br><sub><code>(see implementation)</code></sub> | Compare two values for inequality. | TERSE Standard Glossary |
| [`=`](#word-x3d)<br><sub><code>( a b -- flag )</code></sub> | Compare two values for equality. | TERSE Standard Glossary |
| [`>`](#word-x3e)<br><sub><code>( a b -- flag )</code></sub> | Compare whether the preceding value is greater than the top value. | TERSE Standard Glossary |
| [`>R`](#word-x3er)<br><sub><code>(see implementation)</code></sub> | Move a parameter-stack value to the return stack in host TERSE. | TERSE Standard Glossary |
| [`0`](#word-0)<br><sub><code>(see implementation)</code></sub> | Target constant with value zero; ordinary source numeric literals share this spelling. | TERSE Standard Glossary |
| [`0=`](#word-0x3d)<br><sub><code>( x -- flag )</code></sub> | Return a condition indicating zero. | TERSE Standard Glossary |
| [`1`](#word-1)<br><sub><code>(see implementation)</code></sub> | Target constant with value one; ordinary source numeric literals share this spelling. | TERSE Standard Glossary |
| [`1-`](#word-1x2d)<br><sub><code>(see implementation)</code></sub> | Decrement the top value by one. | TERSE Standard Glossary |
| [`1+`](#word-1x2b)<br><sub><code>(see implementation)</code></sub> | Increment the top value by one. | TERSE Standard Glossary |
| [`2-`](#word-2x2d)<br><sub><code>(see implementation)</code></sub> | Subtract two from the top value. | TERSE Standard Glossary |
| [`2*`](#word-2x2a)<br><sub><code>(see implementation)</code></sub> | Double the top value. | TERSE Standard Glossary |
| [`2/`](#word-2x2f)<br><sub><code>(see implementation)</code></sub> | Halve the top value;  | TERSE Standard Glossary |
| [`2+`](#word-2x2b)<br><sub><code>(see implementation)</code></sub> | Add two to the top value. | TERSE Standard Glossary |
| [`2DUP`](#word-2dup)<br><sub><code>( x y -- x y x y )</code></sub> | Duplicate the top two stack cells. | TERSE Standard Glossary |
| [`ABORT`](#word-abort)<br><sub><code>(see implementation)</code></sub> | Terminate the host compilation/loading path on a failed runtime check. | TERSE Standard Glossary |
| [`ADC,`](#word-adcx2c)<br><sub><code>(see implementation)</code></sub> | Add operand plus carry to A. | Z80 Assembler |
| [`ADD,`](#word-addx2c)<br><sub><code>(see implementation)</code></sub> | Add operand to A. | Z80 Assembler |
| [`ADI,`](#word-adix2c)<br><sub><code>(see implementation)</code></sub> | Add an immediate byte to A. | Z80 Assembler |
| [`ANA,`](#word-anax2c)<br><sub><code>(see implementation)</code></sub> | AND an operand with A and set flags. | Z80 Assembler |
| [`AND`](#word-and)<br><sub><code>( a b -- result )</code></sub> | Bitwise AND of two values. | TERSE Standard Glossary |
| [`ANI,`](#word-anix2c)<br><sub><code>(see implementation)</code></sub> | AND an immediate byte with A. | Z80 Assembler |
| [`ARRAY`](#word-array)<br><sub><code>(see implementation)</code></sub> | Allocate/name an indexed cell array from a the size. | TERSE Standard Glossary |
| [`ASM`](#word-asm)<br><sub><code>(see implementation)</code></sub> | Select assembler context. | TERSE Standard Glossary |
| [`B!`](#word-bx21)<br><sub><code>( byte address -- )</code></sub> | Store one byte at an address; target binding at $00A8. | TERSE Standard Glossary |
| [`B@`](#word-bx40)<br><sub><code>( address -- byte )</code></sub> | Fetch one byte from an address; target binding at $009A. | TERSE Standard Glossary |
| [`BARRAY`](#word-barray)<br><sub><code>(see implementation)</code></sub> | Allocate/name an indexed byte array from a the size. | TERSE Standard Glossary |
| [`BASE`](#word-base)<br><sub><code>(see implementation)</code></sub> | Host numeric-radix variable. | TERSE Standard Glossary |
| [`BASE!`](#word-basex21)<br><sub><code>(see implementation)</code></sub> | Definition. Define BASE! and BASE@ as host-side radix save/restore shorthands using the compiler's brace syntax. | — |
| [`BASE@`](#word-basex40)<br><sub><code>(see implementation)</code></sub> | Definition. Define BASE! and BASE@ as host-side radix save/restore shorthands using the compiler's brace syntax. | — |
| [`BEGIN`](#word-begin)<br><sub><code>( control: -- begin )</code></sub> | Immediate XC wrapper that records a loop's object address. | TERSE Standard Glossary |
| [`BIT,`](#word-bitx2c)<br><sub><code>(see implementation)</code></sub> | Test a register bit. | Z80 Assembler |
| [`BITX,`](#word-bitxx2c)<br><sub><code>(see implementation)</code></sub> | Test a bit at an IX/IY-relative memory location. | Z80 Assembler |
| [`BLOCK`](#word-block)<br><sub><code>(see implementation)</code></sub> | Obtain the buffer address of a disk block; this source uses $400-byte blocks. | TERSE Standard Glossary |
| [`BMOVE`](#word-bmove)<br><sub><code>(see implementation)</code></sub> | Move a block of bytes between addresses; used by bload for $400-byte blocks. | TERSE Standard Glossary |
| [`BTABLE`](#word-btable)<br><sub><code>(see implementation)</code></sub> | Declare a byte table accessed with the game's indexed table syntax. | TERSE Standard Glossary |
| [`CALL,`](#word-callx2c)<br><sub><code>(see implementation)</code></sub> | Emit an absolute native subroutine call. | Z80 Assembler |
| [`CC,`](#word-ccx2c)<br><sub><code>(see implementation)</code></sub> | Assembler carry-set selector used before a conditional call mnemonic in this dialect. | Z80 Assembler |
| [`CMA,`](#word-cmax2c)<br><sub><code>(see implementation)</code></sub> | Complement A. | Z80 Assembler |
| [`CMP,`](#word-cmpx2c)<br><sub><code>(see implementation)</code></sub> | Compare A with an operand without retaining the subtraction result. | Z80 Assembler |
| [`CNZ,`](#word-cnzx2c)<br><sub><code>(see implementation)</code></sub> | Emit a call if the zero flag is clear. | Z80 Assembler |
| [`CODE`](#word-code)<br><sub><code>(see implementation)</code></sub> | Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry. | TERSE Standard Glossary |
| [`CONSTANT`](#word-constant)<br><sub><code>(see implementation)</code></sub> | Define a constant from a value. | TERSE Standard Glossary |
| [`COUT`](#word-cout)<br><sub><code>(see implementation)</code></sub> | Constant COUT, assigned source expression/value `2` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables. | TERSE Standard Glossary |
| [`CPI,`](#word-cpix2c)<br><sub><code>(see implementation)</code></sub> | Compare A with an immediate byte. | Z80 Assembler |
| [`CR`](#word-cr)<br><sub><code>(see implementation)</code></sub> | Output a newline on the host console. | TERSE Standard Glossary |
| [`CZ,`](#word-czx2c)<br><sub><code>(see implementation)</code></sub> | Emit a call if the zero flag is set. | Z80 Assembler |
| [`DAD,`](#word-dadx2c)<br><sub><code>(see implementation)</code></sub> | Add a register pair to HL. | Z80 Assembler |
| [`DADX,`](#word-dadxx2c)<br><sub><code>(see implementation)</code></sub> | Add a register pair to IX. | Z80 Assembler |
| [`DADY,`](#word-dadyx2c)<br><sub><code>(see implementation)</code></sub> | Add a register pair to IY. | Z80 Assembler |
| [`DCX,`](#word-dcxx2c)<br><sub><code>(see implementation)</code></sub> | Decrement a register pair. | Z80 Assembler |
| [`DECIMAL`](#word-decimal)<br><sub><code>(see implementation)</code></sub> | Select radix ten for parsing subsequent source numbers. | TERSE Standard Glossary |
| [`DELIM`](#word-delim)<br><sub><code>(see implementation)</code></sub> | Host parser delimiter variable; XC-STRING sets it to double quote. | TERSE Standard Glossary |
| [`DJNZ,`](#word-djnzx2c)<br><sub><code>(see implementation)</code></sub> | Decrement B and branch while it is nonzero. | Z80 Assembler |
| [`DP`](#word-dp)<br><sub><code>(see implementation)</code></sub> | Host dictionary allocation pointer. | TERSE Standard Glossary |
| [`DROP`](#word-drop)<br><sub><code>( x -- )</code></sub> | Discard the top stack cell. | TERSE Standard Glossary |
| [`DUP`](#word-dup)<br><sub><code>( x -- x x )</code></sub> | Duplicate the top stack cell. | TERSE Standard Glossary |
| [`ELSE`](#word-else)<br><sub><code>(see implementation)</code></sub> | Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch. | TERSE Standard Glossary |
| [`END`](#word-end)<br><sub><code>( flag -- )</code></sub> | Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true. | TERSE Standard Glossary |
| [`EXAF,`](#word-exafx2c)<br><sub><code>(see implementation)</code></sub> | Exchange AF with its alternate register pair. | Z80 Assembler |
| [`EXX,`](#word-exxx2c)<br><sub><code>(see implementation)</code></sub> | Exchange BC/DE/HL with their alternate register bank. | Z80 Assembler |
| [`HERE`](#word-here)<br><sub><code>(see implementation)</code></sub> | Current allocation/compilation address in the active dictionary/data context. | TERSE Standard Glossary |
| [`HEX`](#word-hex)<br><sub><code>(see implementation)</code></sub> | Select radix sixteen for parsing subsequent source numbers. | TERSE Standard Glossary |
| [`IF`](#word-if)<br><sub><code>( flag -- )</code></sub> | Immediate XC wrapper that emits a conditional target branch through XC-IF. | TERSE Standard Glossary |
| [`IN,`](#word-inx2c)<br><sub><code>(see implementation)</code></sub> | Definition. Define object emitters for immediate IN and subtract-with-borrow instructions. | Z80 Assembler |
| [`INP`](#word-inp)<br><sub><code>(see implementation)</code></sub> | Read a hardware input port; a target primitive distinct from assembler INP,. | TERSE Standard Glossary |
| [`INP,`](#word-inpx2c)<br><sub><code>(see implementation)</code></sub> | Emit register-port input using the assembler operand convention. | Z80 Assembler |
| [`INR,`](#word-inrx2c)<br><sub><code>(see implementation)</code></sub> | Increment a byte operand. | Z80 Assembler |
| [`INX,`](#word-inxx2c)<br><sub><code>(see implementation)</code></sub> | Increment a register pair. | Z80 Assembler |
| [`INXX,`](#word-inxxx2c)<br><sub><code>(see implementation)</code></sub> | Increment the selected index register. | Z80 Assembler |
| [`JC,`](#word-jcx2c)<br><sub><code>(see implementation)</code></sub> | Jump if carry is set. | Z80 Assembler |
| [`JMP,`](#word-jmpx2c)<br><sub><code>(see implementation)</code></sub> | Emit an unconditional absolute jump. | Z80 Assembler |
| [`JNZ,`](#word-jnzx2c)<br><sub><code>(see implementation)</code></sub> | Jump if zero is clear. | Z80 Assembler |
| [`JPE,`](#word-jpex2c)<br><sub><code>(see implementation)</code></sub> | Jump on parity even. | Z80 Assembler |
| [`JPO,`](#word-jpox2c)<br><sub><code>(see implementation)</code></sub> | Jump on parity odd. | Z80 Assembler |
| [`JZ,`](#word-jzx2c)<br><sub><code>(see implementation)</code></sub> | Jump if zero is set. | Z80 Assembler |
| [`LAST`](#word-last)<br><sub><code>(see implementation)</code></sub> | Host last-definition pointer restored after loading a saved environment. | TERSE Standard Glossary |
| [`LBCD,`](#word-lbcdx2c)<br><sub><code>(see implementation)</code></sub> | Load BC from a direct memory cell. | Z80 Assembler |
| [`LDA,`](#word-ldax2c)<br><sub><code>(see implementation)</code></sub> | Load A from a direct memory address. | Z80 Assembler |
| [`LDAX,`](#word-ldaxx2c)<br><sub><code>(see implementation)</code></sub> | Load A through a register-pair address. | Z80 Assembler |
| [`LDED,`](#word-ldedx2c)<br><sub><code>(see implementation)</code></sub> | Load DE from a direct memory cell. | Z80 Assembler |
| [`LDX,`](#word-ldxx2c)<br><sub><code>(see implementation)</code></sub> | Load a register from IX/IY plus the displacement. | Z80 Assembler |
| [`LHLD,`](#word-lhldx2c)<br><sub><code>(see implementation)</code></sub> | Load HL from a direct memory cell. | Z80 Assembler |
| [`LIT`](#word-lit)<br><sub><code>( -- value; inline word16 )</code></sub> | Compiler literal mechanism used by INEXT's host macro. | TERSE Standard Glossary |
| [`LIXD,`](#word-lixdx2c)<br><sub><code>(see implementation)</code></sub> | Load IX from a direct memory cell. | Z80 Assembler |
| [`LIYD,`](#word-liydx2c)<br><sub><code>(see implementation)</code></sub> | Load IY from a direct memory cell. | Z80 Assembler |
| [`LOAD`](#word-load)<br><sub><code>(see implementation)</code></sub> | Load a numbered source screen in the current disk/file context; exact translation belongs to the external loader. | TERSE Standard Glossary |
| [`LXI,`](#word-lxix2c)<br><sub><code>(see implementation)</code></sub> | Load an immediate cell into a register pair. | Z80 Assembler |
| [`LXIX,`](#word-lxixx2c)<br><sub><code>(see implementation)</code></sub> | Load an immediate value into the selected IX/IY register. | Z80 Assembler |
| [`MOV,`](#word-movx2c)<br><sub><code>(see implementation)</code></sub> | Copy source operand to destination operand; this source puts the source first. | Z80 Assembler |
| [`MVI,`](#word-mvix2c)<br><sub><code>(see implementation)</code></sub> | Load an immediate byte into the selected operand. | Z80 Assembler |
| [`NEG,`](#word-negx2c)<br><sub><code>(see implementation)</code></sub> | Two's-complement negate A. | Z80 Assembler |
| [`NEXT`](#word-next)<br><sub><code>(see implementation)</code></sub> | Native return to the byte-TERSE dispatcher; also appears in the scheduler entry convention. | TERSE Standard Glossary |
| [`NOT`](#word-not)<br><sub><code>(see implementation)</code></sub> | Invert a condition; used in the host unsigned RAM-range test. | TERSE Standard Glossary |
| [`OR`](#word-or)<br><sub><code>( a b -- result )</code></sub> | Bitwise inclusive OR of two values. | TERSE Standard Glossary |
| [`ORA,`](#word-orax2c)<br><sub><code>(see implementation)</code></sub> | OR an operand into A and set flags. | Z80 Assembler |
| [`ORI,`](#word-orix2c)<br><sub><code>(see implementation)</code></sub> | OR an immediate byte into A. | Z80 Assembler |
| [`OUT,`](#word-outx2c)<br><sub><code>(see implementation)</code></sub> | Output A to an immediate port; port numbers may appear directly before this word. | Z80 Assembler |
| [`OUTP`](#word-outp)<br><sub><code>(see implementation)</code></sub> | Write a hardware output port; a target primitive distinct from assembler OUTP,. | TERSE Standard Glossary |
| [`OUTP,`](#word-outpx2c)<br><sub><code>(see implementation)</code></sub> | Emit register-port output according to the assembler operand convention. | Z80 Assembler |
| [`OVER`](#word-over)<br><sub><code>( x y -- x y x )</code></sub> | Copy the second stack cell to the top. | TERSE Standard Glossary |
| [`PCHL,`](#word-pchlx2c)<br><sub><code>(see implementation)</code></sub> | Jump through HL. | Z80 Assembler |
| [`PICK`](#word-pick)<br><sub><code>(see implementation)</code></sub> | Copy an indexed parameter-stack cell; see the calling sequences for this dialect's index convention. | TERSE Standard Glossary |
| [`POP,`](#word-popx2c)<br><sub><code>(see implementation)</code></sub> | Pop a native stack cell into the selected pair. | Z80 Assembler |
| [`POPX,`](#word-popxx2c)<br><sub><code>(see implementation)</code></sub> | Pop a native stack cell into IX/IY. | Z80 Assembler |
| [`PROT`](#word-prot)<br><sub><code>(see implementation)</code></sub> | Reinstate host memory protection after bload's copy. | TERSE Standard Glossary |
| [`PUSH,`](#word-pushx2c)<br><sub><code>(see implementation)</code></sub> | Push the selected register pair on the native stack. | Z80 Assembler |
| [`PUSHX,`](#word-pushxx2c)<br><sub><code>(see implementation)</code></sub> | Push IX/IY on the native stack. | Z80 Assembler |
| [`R>`](#word-rx3e)<br><sub><code>(see implementation)</code></sub> | Move the top return-stack value to the parameter stack in host TERSE. | TERSE Standard Glossary |
| [`RALR,`](#word-ralrx2c)<br><sub><code>(see implementation)</code></sub> | Rotate a register left through carry. | Z80 Assembler |
| [`RARR,`](#word-rarrx2c)<br><sub><code>(see implementation)</code></sub> | Rotate a register right through carry. | Z80 Assembler |
| [`RC,`](#word-rcx2c)<br><sub><code>(see implementation)</code></sub> | Return if carry is set. | Z80 Assembler |
| [`RES,`](#word-resx2c)<br><sub><code>(see implementation)</code></sub> | Clear a register bit. | Z80 Assembler |
| [`RESX,`](#word-resxx2c)<br><sub><code>(see implementation)</code></sub> | Clear a bit in indexed memory. | Z80 Assembler |
| [`RET,`](#word-retx2c)<br><sub><code>(see implementation)</code></sub> | Emit native RET. | Z80 Assembler |
| [`RNC,`](#word-rncx2c)<br><sub><code>(see implementation)</code></sub> | Return if carry is clear. | Z80 Assembler |
| [`RNZ,`](#word-rnzx2c)<br><sub><code>(see implementation)</code></sub> | Return if the zero flag is clear. | Z80 Assembler |
| [`ROT`](#word-rot)<br><sub><code>( x y z -- y z x )</code></sub> | Rotate the top three stack cells. | TERSE Standard Glossary |
| [`RRC,`](#word-rrcx2c)<br><sub><code>(see implementation)</code></sub> | Rotate the accumulator right circularly in this dialect. | Z80 Assembler |
| [`RZ,`](#word-rzx2c)<br><sub><code>(see implementation)</code></sub> | Return if the zero flag is set. | Z80 Assembler |
| [`SBCD,`](#word-sbcdx2c)<br><sub><code>(see implementation)</code></sub> | Store BC in a direct memory cell. | Z80 Assembler |
| [`SBI,`](#word-sbix2c)<br><sub><code>(see implementation)</code></sub> | Definition. Define object emitters for immediate IN and subtract-with-borrow instructions. | Z80 Assembler |
| [`SDED,`](#word-sdedx2c)<br><sub><code>(see implementation)</code></sub> | Store DE in a direct memory cell. | Z80 Assembler |
| [`SET,`](#word-setx2c)<br><sub><code>(see implementation)</code></sub> | Set a register bit. | Z80 Assembler |
| [`SETX,`](#word-setxx2c)<br><sub><code>(see implementation)</code></sub> | Set a bit in indexed memory. | Z80 Assembler |
| [`SHLD,`](#word-shldx2c)<br><sub><code>(see implementation)</code></sub> | Store HL in a direct memory cell. | Z80 Assembler |
| [`SIXD,`](#word-sixdx2c)<br><sub><code>(see implementation)</code></sub> | Store IX in a direct memory cell. | Z80 Assembler |
| [`SRAR,`](#word-srarx2c)<br><sub><code>(see implementation)</code></sub> | Shift a register right retaining its sign (SRA). | Z80 Assembler |
| [`SRLR,`](#word-srlrx2c)<br><sub><code>(see implementation)</code></sub> | Shift a register right with zero fill (SRL). | Z80 Assembler |
| [`STA,`](#word-stax2c)<br><sub><code>(see implementation)</code></sub> | Store A at a direct memory address. | Z80 Assembler |
| [`STC,`](#word-stcx2c)<br><sub><code>(see implementation)</code></sub> | Set the carry flag. | Z80 Assembler |
| [`STX,`](#word-stxx2c)<br><sub><code>(see implementation)</code></sub> | Store a register into IX/IY plus the displacement. | Z80 Assembler |
| [`SUB,`](#word-subx2c)<br><sub><code>(see implementation)</code></sub> | Subtract an operand from A. | Z80 Assembler |
| [`SUI,`](#word-suix2c)<br><sub><code>(see implementation)</code></sub> | Subtract an immediate byte from A. | Z80 Assembler |
| [`SWAP`](#word-swap)<br><sub><code>( x y -- y x )</code></sub> | Exchange the top two stack cells. | TERSE Standard Glossary |
| [`TABLE`](#word-table)<br><sub><code>(see implementation)</code></sub> | Declare a cell table accessed with the game's indexed table syntax. | TERSE Standard Glossary |
| [`THEN`](#word-then)<br><sub><code>(see implementation)</code></sub> | Immediate XC wrapper that resolves a saved target branch destination. | TERSE Standard Glossary |
| [`UNPROT`](#word-unprot)<br><sub><code>(see implementation)</code></sub> | Lift host memory protection around bload's copy. | TERSE Standard Glossary |
| [`VARIABLE`](#word-variable)<br><sub><code>(see implementation)</code></sub> | Allocate/name a cell variable with the initial value in this dialect. | TERSE Standard Glossary |
| [`VPTR`](#word-vptr)<br><sub><code>(see implementation)</code></sub> | Variable allocation pointer; explicitly relocated by game variable/vector declarations. | TERSE Standard Glossary |
| [`WORD`](#word-word)<br><sub><code>(see implementation)</code></sub> | Host token/string parser used after selecting DELIM. | TERSE Standard Glossary |
| [`XCHG,`](#word-xchgx2c)<br><sub><code>(see implementation)</code></sub> | Exchange DE and HL. | Z80 Assembler |
| [`XOR`](#word-xor)<br><sub><code>( a b -- result )</code></sub> | Bitwise exclusive OR of two values. | TERSE Standard Glossary |
| [`XRA,`](#word-xrax2c)<br><sub><code>(see implementation)</code></sub> | Exclusive-OR an operand with A. | Z80 Assembler |
| [`XRI,`](#word-xrix2c)<br><sub><code>(see implementation)</code></sub> | Exclusive-OR an immediate byte with A. | Z80 Assembler |
| [`XTHL,`](#word-xthlx2c)<br><sub><code>(see implementation)</code></sub> | Exchange HL with the native top-of-stack cell. | Z80 Assembler |
| [`ZERO`](#word-zero)<br><sub><code>(see implementation)</code></sub> | Native cell-zeroing helper, used to clear paired score bytes; entry $00AD. | TERSE Standard Glossary |

## DNA Z80 assembler emitters (0)

| Word / stack | Function | DNA documentation |
| --- | --- | --- |

## Word implementations and usage

<a id="word-abvols"></a>

### `ABVOLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
{ : VIBS } 14 B, B, { ; } { : ABVOLS } 16 B, B, { ; }
{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:3](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-act"></a>

### `ACT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 225, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : ACT, } , B, , , { ; } ( given dx dy update# magic )
{ : ON1ST, } 2 B, { ; }
{ : ON2ND, } 3 B, { ; } { : ON3RD, } 4 B, { ; }
0A C= OPBLDST 6 C= OPBLMOT { : WTHW, } 0D B, { ; }
{ : OFMOT, } 5 B, { ; } { : BLMOT, } OPBLMOT B, { ; }
{ : RUNDST, } 8 B, { ; } { : OFFDST, } 9 B, { ; }
{ : BLDST, } OPBLDST B, { ; } { : FLDDST, } 7 B, { ; }
{ : THW, } 0B B, { ; } { : DEACT, } 0C B, { ; }
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }

( BB playaction tables -runners- )
LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
LABLE TFPA1 10 REST, FLDDST,
LABLE TFPA2 20 REST, FLDDST,
LABLE THWBLPA BLDST,
LABLE PITCHBLPA BLMOT,
LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,


( BB playaction tables fieldlogic -infielders- )
( Unused NOBODYPA action table omitted )
LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
LABLE RTHWPA 0 0 5 RTRW ACT, STP,
LABLE LTHWPA 0 0 5 LTRW ACT, STP,
LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
THW, STP,
LABLE NOACTPA STP,
LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
ON3RD, RCB,
LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
( BB playaction tables fieldlogic -infielders- )
LABLE HLSS -80 0 10 LFLD ACT, STP,
LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
LABLE HMSS 100 -40 0C RRUN ACT, STP,
LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-anote"></a>

### `ANOTE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

```terse
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:9](#block-141) (definition).

**Source usage:** [135](#block-135), [138](#block-138), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-atone"></a>

### `ATONE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
0 VARIABLE MUSPC { : MASTER } 10 B, B, { ; } { : ATONE } 11 B,
B, { ; } { : BTONE } 12 B, B, { ; } { : CTONE } 13 B, B, { ; }
{ : VIBS } 14 B, B, { ; } { : ABVOLS } 16 B, B, { ; }
{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:1](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bact"></a>

### `BACT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 229, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-229) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : BACT, } BAL ACT, { ; }
{ : LK, } 0 0 0 BACT, DEACT, { ; }
LABLE PFB 0 300 50 BACT,
LABLE PSB 0 100 80 BACT,
LABLE PSU 0 100 35 BACT, 0 300 50 BACT,
LABLE PSD 0 300 12 BACT, 0 100 50 BACT,
LABLE PCO 0 300 12 BACT, 100 200 9 BACT, 0 200 50 BACT,
( Unused PCI pitch table omitted; selected pitches retained )
LABLE PICI -10 200 1A BACT, -100 200 9 BACT, 0 200 50 BACT,
LABLE PICO -20 200 1A BACT, 60 200 9 BACT, 0 200 50 BACT,
DECIMAL ;S



( BB destination delta calculation    DSTCALC )
BASE@ HEX
FORWARD DSTSET FORWARD BTLP1 FORWARD BTLP2 FORWARD RSRDST
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-balltime"></a>

### `BALLTIME` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 182, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-182) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. BALLTIME increments BALLS. At $34 display WALK, start forced runner movement and a WALK timer, update odds/base state and clear counts; otherwise play/post the ball count.

```terse
: BALLTIME ( balls process )
BALLS DUP 1+B! B@ 34 = IF SWALK MYAH WLKCNT 1+B!
CWALK OLDSTRING B! LBASE BONE 40 WALK B!
1 HLSIDE B! WHBODDS HITRUN ( start runners ) WUPGO
CLRBLST ELSE MBALL DOSBALL THEN SBO ;
```

**Declaration:** [182:5](#block-182) (definition).

**Source usage:** [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-blmot"></a>

### `BLMOT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 225, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : OFMOT, } 5 B, { ; } { : BLMOT, } OPBLMOT B, { ; }
{ : RUNDST, } 8 B, { ; } { : OFFDST, } 9 B, { ; }
{ : BLDST, } OPBLDST B, { ; } { : FLDDST, } 7 B, { ; }
{ : THW, } 0B B, { ; } { : DEACT, } 0C B, { ; }
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }

( BB playaction tables -runners- )
LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
LABLE TFPA1 10 REST, FLDDST,
LABLE TFPA2 20 REST, FLDDST,
LABLE THWBLPA BLDST,
LABLE PITCHBLPA BLMOT,
LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,


( BB playaction tables fieldlogic -infielders- )
( Unused NOBODYPA action table omitted )
LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
LABLE RTHWPA 0 0 5 RTRW ACT, STP,
LABLE LTHWPA 0 0 5 LTRW ACT, STP,
LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
THW, STP,
LABLE NOACTPA STP,
LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
ON3RD, RCB,
LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
( BB playaction tables fieldlogic -infielders- )
LABLE HLSS -80 0 10 LFLD ACT, STP,
LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
LABLE HMSS 100 -40 0C RRUN ACT, STP,
LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
LABLE F2NDL2ND 80 0 0D RFLD ACT, THW, STP,
LABLE HR2ND 80 0 12 RFLD ACT, STP,
LABLE HR1ST -80 -40 12 LFLD ACT, 200 90 13 RRUN ACT, ON1ST, LCB,
LABLE F1STR1ST -40 30 0A LFLD ACT, WTHW, STP,
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bnote"></a>

### `BNOTE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

```terse
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:9](#block-141) (definition).

**Source usage:** [138](#block-138), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bone"></a>

### `BONE` — :

**Stack:** `( address -- )`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 233, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue.

```terse
: BONE ( cange byte memory cell to 1 ) 1 SB! ;
```

**Declaration:** [233:11](#block-233) (definition).

**Source usage:** [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [133](#block-133), [155](#block-155), [156](#block-156), [158](#block-158), [161](#block-161), [162](#block-162), [181](#block-181), [182](#block-182), [214](#block-214), [233](#block-233), [239](#block-239), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-btone"></a>

### `BTONE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
B, { ; } { : BTONE } 12 B, B, { ; } { : CTONE } 13 B, B, { ; }
{ : VIBS } 14 B, B, { ; } { : ABVOLS } 16 B, B, { ; }
{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:2](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [138](#block-138), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bv"></a>

### `BV` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 142, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-142) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define V as VARIABLE and BV as BVARIABLE, then continue the music processor source.

```terse
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [142:14](#block-142) (definition).

**Source usage:** [142](#block-142), [143](#block-143).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bzero"></a>

### `BZERO` — :

**Stack:** `( address -- )`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 233, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue.

```terse
: BZERO ( change byte memory cell to 0 ) 0 SB! ;
```

**Declaration:** [233:12](#block-233) (definition).

**Source usage:** [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [154](#block-154), [157](#block-157), [162](#block-162), [180](#block-180), [183](#block-183), [184](#block-184), [233](#block-233), [239](#block-239), [240](#block-240), [273](#block-273), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chgs"></a>

### `CHGS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 238, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. CHGS posts CHANGE SIDES; DWAIT runs nested loops with interrupts enabled and disables them on return; continue.

```terse
: CHGS 1C00 2000 828 A" CHANGE SIDES" SPOST ;
```

**Declaration:** [238:8](#block-238) (definition).

**Source usage:** [238](#block-238), [239](#block-239).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chkflshstay"></a>

### `CHKFLSHSTAY` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 240, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-240) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. WUPTON installs WUPWRT. CHKFLSHSTAY checks whether flashing was reserved and stops that special use while retaining its phase state.

```terse
: CHKFLSHSTAY ( when isccp turn off check for wupwrt )
FLSHSTAY B@ IF FLSHSTAY BZERO FLSHCNT B@ FLSHOFF IF
DOWUP B@ IF WUPWRT WUPTON ELSE WUPFLSH B@ IF WUPWRT WUPTON
THEN THEN ELSE ( not flshcnt ) DOWUP B@ IF WUPTON ELSE
WUPFLSH B@ IF WUPTON THEN THEN THEN WUPFLSH BZERO
DOWUP BZERO THEN ;
```

**Declaration:** [240:2](#block-240) (definition).

**Source usage:** [121](#block-121), [240](#block-240).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chkgmcnt"></a>

### `CHKGMCNT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 305, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. CHKGMCNT posts the appropriate prompt around a timed wait and returns the current credit byte.

```terse
: CHKGMCNT DP12CN C0 TWAIT DP12CN CREDITS B@ ;
```

**Declaration:** [305:9](#block-305) (definition).

**Source usage:** [129](#block-129), [130](#block-130), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cmajor"></a>

### `CMAJOR` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 136, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-136) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato.

```terse
{ : CMAJOR } 1C MASTER 0 NOISE EF ABVOLS 0F MCVOLS { ; }
{ : REST } 0 ABVOLS 0 MCVOLS 0A DURATION { ; }
{ : ^ } EF ABVOLS 0F MCVOLS { ; } BTABLE TAKE-ME CMAJOR 0 VIBS
14 #C1 #E1 #C2 NOTES 0A #E1 #G1 #C3 NOTES 0A #C1 #F1 #A2 NOTES
0A #C1 #E1 #G2 NOTES 0A #C1 #G1 #E2 NOTES
1E #B0 #D1 #G2 NOTES 1E #G0 #F1 #D2 NOTES 14 #C1 #E1 #C2 NOTES
0A #E1 #G1 #C3 NOTES 0A #F1 #C2 #A2 NOTES 0A #E1 #C2 #G2 NOTES
0A #C1 #G1 #E2 NOTES 3C #B0 #D1 #G2 NOTES 3C #C1 #E2 #C3 NOTES
0 CHEERSSCORE LDPCC -->
0A #C1 #G1 #E2 NOTES 14 #B0 #D1 #G2 NOTES 0A #C1 #E1 #G2 NOTES
0A #D1 #F1 #G2 NOTES 0A #DS1 #C2 #FS2 NOTES 0A #E1 #C2 #G2 NOTES
0A #F1 #C2 #A2 NOTES 0A #E1 #B1 3A NOTES 0A #F1 #C2 #A2 NOTES
0A #G1 #C2 #E2 NOTES 0A #A1 #C2 #F2 NOTES 0A #E1 #CS2 #G2 NOTES
0A #F1 #D2 #A2 NOTES REST 0A #D1 #A1 #F2 NOTES -->

( BB music - reconstructed continuation bridge )














( BASEBALL SOUNDS , SIREN CANNON ) HEX
BTABLE SIRENSCORE AB ABVOLS 0B MCVOLS
90 5E 11 RDRNDNTE 80 5E 13 RDRNDNTE 70 5E 12 RDRNDNTE
0 VIBS 10 MASTER 1 DURATION 0E MASTER 1 DURATION 0C MASTER
1 DURATION 0A MASTER 1 DURATION 8 MASTER 1 DURATION 6 MASTER
1 DURATION 4 MASTER 1 DURATION 2 MASTER 1 DURATION
12 SIRENSCORE LDPCC
( HOMER CONT. ) BTABLE CANNONSCORE
FF ABVOLS 1F MCVOLS 2 MASTER 8 NOISE
#D2 CTONE #FS2 BTONE 6 #GS2 ANOTE
#C2 CTONE 6 #E2 ANOTE #B1 CTONE 6 #D2 BNOTE
1D ABVOLS 1A MCVOLS #A1 CTONE 6 #C2 ANOTE
AA ABVOLS 17 MCVOLS #G1 CTONE 6 #B1 BNOTE
0 SIRENSCORE LDPCC

( BB music - reconstructed continuation bridge )


```

**Declaration:** [136:1](#block-136) (definition).

**Source usage:** [136](#block-136).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cnline"></a>

### `CNLINE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 271, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-271) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. CNLINE saves a new XIN/YIN endpoint and calls cnline from the current line state.

```terse
: CNLINE ( continue line to this point , given X Y )
YIN ! XIN ! cnline ;
```

**Declaration:** [271:9](#block-271) (definition).

**Source usage:** [271](#block-271), [272](#block-272), [273](#block-273).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cnote"></a>

### `CNOTE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

```terse
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:10](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-congr"></a>

### `CONGR` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 127, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define congratulatory, loss and one-coin prompts and continue loading.

```terse
: CONGR 700 1000 828 A" CONGRATULATIONS YOU ARE VERY GOOD"
SPOST 0E00 2800 828 A" LETS PLAY AGAIN I WILL BUY" SPOST ;
```

**Declaration:** [127:10](#block-127) (definition).

**Source usage:** [127](#block-127), [129](#block-129).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cpost"></a>

### `CPOST` — :

**Stack:** `( x y options char -- )`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 248, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-248) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. 3DROP discards three cells. CPOST calls lower-case cpost, then discards its returned X/Y/options.

```terse
: CPOST ( post an ascii-character on the screen ; see options )
( in- x , y , opt+ex/mag , ascii-char )
( out- character on screen )
cpost 3DROP ;
```

**Declaration:** [248:2](#block-248) (definition).

**Source usage:** [237](#block-237), [248](#block-248), [272](#block-272), [273](#block-273), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-credarrow"></a>

### `CREDARROW` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 121, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-121) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. CREDARROW clears UPCRED and handles STRT1, the coin-mode switch, game-over/player-selection state and computer-player pricing. Some credits remain as a one-credit remainder in two-player mode.

```terse
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

**Declaration:** [121:4](#block-121) (definition).

**Source usage:** [121](#block-121), [131](#block-131), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ctone"></a>

### `CTONE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
B, { ; } { : BTONE } 12 B, B, { ; } { : CTONE } 13 B, B, { ; }
{ : VIBS } 14 B, B, { ; } { : ABVOLS } 16 B, B, { ; }
{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:2](#block-141) (definition).

**Source usage:** [138](#block-138), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-deact"></a>

### `DEACT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 225, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : THW, } 0B B, { ; } { : DEACT, } 0C B, { ; }
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }

( BB playaction tables -runners- )
LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
LABLE TFPA1 10 REST, FLDDST,
LABLE TFPA2 20 REST, FLDDST,
LABLE THWBLPA BLDST,
LABLE PITCHBLPA BLMOT,
LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,


( BB playaction tables fieldlogic -infielders- )
( Unused NOBODYPA action table omitted )
LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
LABLE RTHWPA 0 0 5 RTRW ACT, STP,
LABLE LTHWPA 0 0 5 LTRW ACT, STP,
LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
THW, STP,
LABLE NOACTPA STP,
LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
ON3RD, RCB,
LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
( BB playaction tables fieldlogic -infielders- )
LABLE HLSS -80 0 10 LFLD ACT, STP,
LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
LABLE HMSS 100 -40 0C RRUN ACT, STP,
LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
LABLE F2NDL2ND 80 0 0D RFLD ACT, THW, STP,
LABLE HR2ND 80 0 12 RFLD ACT, STP,
LABLE HR1ST -80 -40 12 LFLD ACT, 200 90 13 RRUN ACT, ON1ST, LCB,
LABLE F1STR1ST -40 30 0A LFLD ACT, WTHW, STP,
LABLE F1STL1ST 140 -40 0B RFLD ACT, WTHW, STP,
LABLE HRL1ST 100 0 18 RFLD ACT, STP,
LABLE F1STPT 480 0 15 RRUN ACT, ON1ST, LCB,
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dline"></a>

### `DLINE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 271, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-271) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DLINE saves endpoint and initial X/Y state, converts Y for strtline, draws through cnline and continues loading.

```terse
: DLINE ( draw a line , given X Y start coor X Y ending coor )
YIN ! XIN ! 2DUP Y-AXIS ! X-AXIS !
SWAB ( set y for relabs ) strtline cnline ;
```

**Declaration:** [271:12](#block-271) (definition).

**Source usage:** [271](#block-271), [272](#block-272), [273](#block-273).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dochgs"></a>

### `DOCHGS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 239, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. FLSHOFF disables flashing and services cleanup under DI. DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; continue.

```terse
: DOCHGS ' CHGS FLSHTON 28 DWAIT FLSHOFF GAMEOVER BZERO ;
```

**Declaration:** [239:12](#block-239) (definition).

**Source usage:** [129](#block-129), [130](#block-130), [239](#block-239).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-doehomer"></a>

### `DOEHOMER` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 180, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-180) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; DOEHOMER only posts the text. Continue.

```terse
: DOEHOMER SHOMER ;
```

**Declaration:** [180:4](#block-180) (definition).

**Source usage:** [180](#block-180), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dogover"></a>

### `DOGOVER` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 128, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-128) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DOGOVER resets innings, scores, computer control, flashing and selection state; shows pricing with timed waits and returns to SHILL attract mode.

```terse
: DOGOVER ( do game over )
SGO 32 OUTS B! CMSW BONE CMPT BONE PX0 2A B6 4D 8 RECTAN EIDI
8C0 INNX ! INN# BZERO GAMEOVER BZERO 9 LINN B! MLINN DI
GAMEOVER BONE LINN BZERO SCORE1 ZERO PX1 SCRS CMPLR BZERO
FLSHSTAY B@ IF FLSHSTAY BZERO FLSHOFF THEN 10 TWAIT INSCN
80 TWAIT INSCN CREDITS B@ IF SGO THEN SHILL BONE
FLSHOFF DROP 0 PLYR1UP BZERO ( plyr1up 0 ) EIDI ; -->
( BB sentry definitions    TF )
```

**Declaration:** [128:9](#block-128) (definition).

**Source usage:** [128](#block-128), [129](#block-129), [130](#block-130).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dohomer"></a>

### `DOHOMER` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 180, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-180) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DOHOMER erases the ball, displays HOMER, resets counts and clears the event timer; DOEHOMER only posts the text. Continue.

```terse
: DOHOMER BALLERASE SHOMER CLRBLST SBO STRINGOFFTIMER BZERO ;
```

**Declaration:** [180:3](#block-180) (definition).

**Source usage:** [180](#block-180), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dosafe"></a>

### `DOSAFE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 183, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-183) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DOSAFE combines music/text. STETBL holds redraw addresses for erasing old XOR text, including the repeated SAFE entry and WALK.

```terse
: DOSAFE MSAFE SSAFE ;
```

**Declaration:** [183:1](#block-183) (definition).

**Source usage:** [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dosball"></a>

### `DOSBALL` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```terse
: DOSBALL BALLS B@ DUP 31 = IF DROP SBALL1 ELSE 32 = IF SBALL2
ELSE SBALL3 THEN THEN ;
```

**Declaration:** [179:11](#block-179) (definition).

**Source usage:** [179](#block-179), [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dosout"></a>

### `DOSOUT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```terse
: DOSOUT OUTS B@ DUP 31 = IF DROP SOUT1 ELSE 32 = IF SOUT2
ELSE SOUT3 THEN THEN ;
```

**Declaration:** [179:8](#block-179) (definition).

**Source usage:** [179](#block-179), [181](#block-181), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dosstrike"></a>

### `DOSSTRIKE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DOSOUT, DOSSTRIKE and DOSBALL inspect the $30-based count character and call the matching message word.

```terse
: DOSSTRIKE STRIKES B@ 31 = IF SSTRIKE1 ELSE SSTRIKE2 THEN ;
```

**Declaration:** [179:10](#block-179) (definition).

**Source usage:** [179](#block-179), [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dp1"></a>

### `DP1` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 127, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define congratulatory, loss and one-coin prompts and continue loading.

```terse
: DP1 1A00 2C00 828 A" DEPOSIT 1 COIN" SPOST ;
```

**Declaration:** [127:13](#block-127) (definition).

**Source usage:** [127](#block-127), [128](#block-128).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dp12cn"></a>

### `DP12CN` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 305, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define one-coin and switch-dependent two-coin prompts using SPOST.

```terse
: DP12CN CNSW1 B@ IF 300 2800 828
A" DEPOSIT 2 COINS TO CONTINUE THIS GAME" SPOST
ELSE DP1CN THEN ;
```

**Declaration:** [305:3](#block-305) (definition).

**Source usage:** [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dp1cn"></a>

### `DP1CN` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 305, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define one-coin and switch-dependent two-coin prompts using SPOST.

```terse
: DP1CN 400 2800 828 A" DEPOSIT 1 COIN TO CONTINUE THIS GAME"
SPOST ;
```

**Declaration:** [305:1](#block-305) (definition).

**Source usage:** [127](#block-127), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dpcn"></a>

### `DPCN` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 305, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. DPCN clears credits, performs two waits while displaying the prompt, clears GAMEOVER if a credit arrived or updates LINN/UPCRED otherwise, then increments CREDITS as the source explicitly specifies.

```terse
: DPCN ( wait for next coin )
DP1CN CREDITS BZERO FF TWAIT FF TWAIT DP1CN CREDITS B@ IF
GAMEOVER BZERO ELSE LINN BZERO UPCRED BONE THEN CREDITS 1+B! ;
```

**Declaration:** [305:6](#block-305) (definition).

**Source usage:** [129](#block-129), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dpost"></a>

### `dpost` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 249, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-249) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. dpost isolates a nibble, posts a digit or space according to ZEROSP/current nonzero state and clears suppression after the first significant digit.

```terse
: dpost 0F AND OVER 4000 AND 4000 XOR OVER OR IF 30 +
SWAP BFFF AND SWAP ELSE DROP 20 THEN cpost ;
```

**Declaration:** [249:7](#block-249) (definition).

**Source usage:** [249](#block-249).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dtc"></a>

### `DTC` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 304, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. DTC selects decimal and invokes the host editor.

```terse
{ : DTC } DECIMAL EDIT { ; }

BASE@ HEX ROMHERE @ 0F2 ROMHERE ! CODE 1+B! ROMHERE !
BASE! ;S





( BB sentry string routines DPCN CHKGMCNT ) HEX
```

**Declaration:** [304:7](#block-304) (definition).

**Source usage:** [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-duration"></a>

### `DURATION` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:5](#block-141) (definition).

**Source usage:** [135](#block-135), [136](#block-136), [138](#block-138), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dwait"></a>

### `DWAIT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 238, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. CHGS posts CHANGE SIDES; DWAIT runs nested loops with interrupts enabled and disables them on return; continue.

```terse
: DWAIT EI 0 DO FF 0 DO LOOP LOOP DI ;
```

**Declaration:** [238:9](#block-238) (definition).

**Source usage:** [131](#block-131), [238](#block-238), [239](#block-239).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-f1stls"></a>

### `F1STLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 156, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

```terse
: F1STLS F1STPT F1STL1ST NOACTPA 0 ;
```

**Declaration:** [156:3](#block-156) (definition).

**Source usage:** [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-f1strs"></a>

### `F1STRS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 156, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

```terse
: F1STRS F1STPT F1STR1ST NOACTPA 0 ;
```

**Declaration:** [156:2](#block-156) (definition).

**Source usage:** [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-f2ndls"></a>

### `F2NDLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

```terse
: F2NDLS DPHIT BONE HRPT HL1ST F2NDL2ND 0 ;
```

**Declaration:** [155:11](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-f2ndrs"></a>

### `F2NDRS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

```terse
: F2NDRS DPHIT BONE HRPT HL1ST F2NDR2ND 0 ;
```

**Declaration:** [155:10](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-f3rdls"></a>

### `F3RDLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

```terse
: F3RDLS F3RDLSS F3RDL3RD 1 ;
```

**Declaration:** [155:5](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-f3rdrs"></a>

### `F3RDRS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag.

```terse
: F3RDRS NOACTPA F3RDR3RD 1 ;
```

**Declaration:** [155:4](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fblls"></a>

### `FBLLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag.

```terse
: FBLLS NOACTPA FBLL3RD
1 THROWAROUND BONE FOUL BONE ;
```

**Declaration:** [155:1](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fblrs"></a>

### `FBLRS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 156, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

```terse
: FBLRS FOUL BONE THROWAROUND BONE NOACTPA
FBLR1ST NOACTPA 0 ;
```

**Declaration:** [156:5](#block-156) (definition).

**Source usage:** [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fieldwrt"></a>

### `FIELDWRT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 273, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate FINDEX. GETF fetches FIELD bytes sequentially; FIELDWRT draws the initial segment and eight continuations. FMIRROR supplies the other half later.

```terse
: FIELDWRT ( write field outline )
FINDEX BZERO GETF GETF GETF GETF DLINE
8 0 DO GETF GETF CNLINE LOOP ;
```

**Declaration:** [273:4](#block-273) (definition).

**Source usage:** [273](#block-273), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fl"></a>

### `FL` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 274, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-274) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Select hex, hide the incomplete screen via port $0A, clear RAM/background, enable interrupts, select infield/line pixel patterns and paint INFIELD/FIELDWRT.

```terse
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

**Declaration:** [274:2](#block-274) (definition).

**Source usage:** [131](#block-131), [133](#block-133), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-flfill"></a>

### `FLFILL` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 273, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. FLFILL fills the background while allowing interrupts; ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. Continue loading.

```terse
: FLFILL EI 0 4000 3C00 FILL DI ;
```

**Declaration:** [273:13](#block-273) (definition).

**Source usage:** [273](#block-273), [274](#block-274), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-flshme"></a>

### `FLSHME` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 239, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line.

```terse
: FLSHME FLSHWHO @ DUP 0C000 AND 0= OVER 0 <> AND IF EX
```

**Declaration:** [239:2](#block-239) (definition).

**Source usage:** [239](#block-239).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-flshton"></a>

### `FLSHTON` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 239, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line.

```terse
: FLSHTON FLSHWHO ! FLSHON BONE FLSHTIME BONE ;
```

**Declaration:** [239:1](#block-239) (definition).

**Source usage:** [127](#block-127), [239](#block-239), [240](#block-240).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-foultime"></a>

### `FOULTIME` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 182, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-182) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. FOULTIME posts FOUL and increments strikes only below two, then redraws counts; continue.

```terse
: FOULTIME ( foulball process )
SFOUL STRIKES DUP B@ 32 = IF DROP
ELSE 1+B! SBO THEN ;
```

**Declaration:** [182:11](#block-182) (definition).

**Source usage:** [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fowr"></a>

### `FOWR` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 280, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-280) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Save radix, select hex, define FOWR and allocate endpoint/current-coordinate, bit-position, framebuffer-address, pixel-type and mode cells.

```terse
{ : FOWR } FORWARD { ; }
V= PXTYPE V= XIN V= YIN V= Y-AXIS V= X-AXIS
V= BIT-POS V= SADR V= V-PXTYPE V= V-MODE ( 0= write 1= xor )
BTABLE PXT0 0 , 0 ,
BTABLE PXT1 80 B, 20 B, 8 B, 2 B, ( fixed white index 2 )
```

**Declaration:** [280:1](#block-280) (definition).

**Source usage:** [280](#block-280), [281](#block-281).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fssls"></a>

### `FSSLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

```terse
: FSSLS DPHIT BONE FSSLSS HR3RD 1 ;
```

**Declaration:** [155:8](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fssrs"></a>

### `FSSRS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

```terse
: FSSRS DPHIT BONE FSSRSS HR3RD 1 ;
```

**Declaration:** [155:7](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-getf"></a>

### `GETF` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 273, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate FINDEX. GETF fetches FIELD bytes sequentially; FIELDWRT draws the initial segment and eight continuations. FMIRROR supplies the other half later.

```terse
: GETF FINDEX B@ FIELD B@ FINDEX 1+B! ;
```

**Declaration:** [273:2](#block-273) (definition).

**Source usage:** [273](#block-273).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-grndraction"></a>

### `GRNDRACTION` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 157, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-157) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. GRNDRACTION clears prior hit/foul state, selects a GSTBL entry using the index and executes it with EX.

```terse
: GRNDRACTION ( given sectnm set up infield action )
( default values ) HITOF BZERO DPHIT BZERO
FOUL BZERO
GSTBL @ EX ( ret hlside and playact )
DUP HLSIDE B! IF VPLAYACTPC 3RD ! VPLAYACTPC SS !
HLPT VPLAYACTPC PT ! HL1ST VPLAYACTPC 1ST ! HL2ND
VPLAYACTPC 2ND ! ELSE ( hit right side )
HRSS HR3RD LDINFLDPA THEN ;
```

**Declaration:** [157:1](#block-157) (definition).

**Source usage:** [157](#block-157), [158](#block-158).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-grndrhit"></a>

### `GRNDRHIT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 158, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-158) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Mark a grounder and speed 2, combine a random choice with horizontal pitch direction and SWINGTYPE, save SECTNM and dispatch GRNDRACTION.

```terse
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

**Declaration:** [158:1](#block-158) (definition).

**Source usage:** [158](#block-158), [162](#block-162).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hitdst"></a>

### `HITDST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 154, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-154) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. HITDST resets the ball update count, gives it THWBLPA, activates its ball status, selects BAL and places it at the batter's starting coordinates.

```terse
: HITDST ( chooses hit location ) VUPDATE# BL BZERO
THWBLPA VPLAYACTPC BL ! 82 VSTATUS BL B! ( vact )
BAL THWPA ! 2800 VX BL ! AD00 VY BL ! ;
```

**Declaration:** [154:1](#block-154) (definition).

**Source usage:** [154](#block-154), [158](#block-158), [161](#block-161).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hlls"></a>

### `HLLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define foul-left, far-left and third-base sector handlers, setting HITOF or FOUL/THROWAROUND where appropriate and leaving playaction addresses plus a side flag.

```terse
: HLLS HITOF BONE NOACTPA HLL3RD 1 ;
```

**Declaration:** [155:3](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hls"></a>

### `HLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

```terse
: HLS HITOF BONE HLSS HL3RD 1 ;
```

**Declaration:** [155:6](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hms"></a>

### `HMS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 155, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-155) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define the remaining left/middle/second-base handlers, setting DPHIT for double-play opportunities and leaving the appropriate action pointers; continue.

```terse
: HMS HITOF BONE HMSS HR3RD 1 ;
```

**Declaration:** [155:9](#block-155) (definition).

**Source usage:** [155](#block-155), [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hom"></a>

### `HOM` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 237, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; continue.

```terse
: HOM 4200 7A00 828 48 CPOST 4400 7F00 8828 A" OME" SPOST ;
```

**Declaration:** [237:11](#block-237) (definition).

**Source usage:** [237](#block-237), [238](#block-238), [275](#block-275).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hrby2"></a>

### `HRBY2` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 169, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-169) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. HRBY2 halves HRAT. WHBODDS finds BASESTATUS and WHOSUP using the decision tree, treating an empty R1 as empty bases.

```terse
: HRBY2 HRAT B@ 2/ HRAT B! ;
```

**Declaration:** [169:1](#block-169) (definition).

**Source usage:** [169](#block-169).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hrls"></a>

### `HRLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 156, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

```terse
: HRLS HITOF BONE HRPT HRL1ST NOACTPA 0 ;
```

**Declaration:** [156:4](#block-156) (definition).

**Source usage:** [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hrs"></a>

### `HRS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 156, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-156) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define right, first-base, far-right and foul-right handlers; each leaves its defender actions and side flag.

```terse
: HRS HITOF BONE HRPT HR1ST HR2ND 0 ;
```

**Declaration:** [156:1](#block-156) (definition).

**Source usage:** [156](#block-156).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-icode"></a>

### `ICODE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 291, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. ICODE starts a CODE definition and emits the scheduler/register-save prologue: set INLIN/IPNT, swap alternate register banks and preserve the active register sets.

```terse
{ : ICODE } CODE { [ } ASM { ] } NEXT XTHL, D PUSH, B PUSH,
PSW PUSH, M A MOV, INLIN OUT, H INX, IPNT SHLD,
EXX, EXAF, H PUSH, D PUSH, B PUSH, PSW PUSH,
ASM { ; }
```

**Declaration:** [291:7](#block-291) (definition).

**Source usage:** [264](#block-264), [269](#block-269), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inext"></a>

### `INEXT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 291, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. IEX restores saved registers, enables interrupts and returns. INEXT emits a jump to IEX; continue loading.

```terse
{ : INEXT } { LIT [ } ' IEX { , } ASM { ] } JMP, { ; }

( Interrupt routines )
```

**Declaration:** [291:13](#block-291) (definition).

**Source usage:** [268](#block-268), [269](#block-269), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inlog"></a>

### `INLOG` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 162, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-162) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Clear catch/base/walk/run/double-play and boundary flags, request the bat-crack sound, and set PLAYON to R1.

```terse
: INLOG ( infield master logic ) NOCATCH BZERO LBASE BZERO
OFTBLGO BONE WLKCNT BZERO NORUN BZERO
MHIT VMAGIC R1 PLAYON ! GRNDR BZERO HOMER BZERO DBLFLAG BZERO
OFPU BZERO FENCE BZERO INAIR BZERO SWINGTYPE B@ 6 = IF 0
ELSE HRAT B@ 0A RND < IF 0 ( flyb ) ELSE 1 ( grndr ) THEN
DUP HITTYPE B! THEN
IF OUTFLDHIT CMPT B@ IF 30 CMOFTIMER B! THEN
ELSE GRNDRHIT THEN ALLFLDACT ;
```

**Declaration:** [162:1](#block-162) (definition).

**Source usage:** [124](#block-124), [162](#block-162).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-innodds"></a>

### `INNODDS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 123, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-123) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. INNODDS derives IODDS from inning, computer/player swing control and bonus-inning state; continue loading.

```terse
: INNODDS
INN# B@ CMSW B@ IF DUP 6 > IF DROP 1 ELSE 1 > IF 2 ELSE 3
THEN THEN ( cmp player hit ratio ) SPBON B@ IF DROP 4 THEN
ELSE ( player ) SPBON B@ ( bonous inning ) IF 3 > IF 1 ELSE 2
THEN ELSE 1 - IODTBL B@ THEN THEN IODDS B! ;
```

**Declaration:** [123:9](#block-123) (definition).

**Source usage:** [123](#block-123), [130](#block-130).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inscn"></a>

### `INSCN` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 127, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. INSCN shows GAME OVER, flashes ISCN and prints one of two pricing layouts according to CNSW1, then draws the second-base pattern.

```terse
: INSCN ( insert coin call )
SGO ' ISCN FLSHTON
CNSW1 B@ IF 0C00 2200 828 A" 1 COIN PER PLAYER 1ST INNING"
SPOST 1700 3400 828 A" 1 COIN PER PLAYER" SPOST 0F00 4600 828
A" EACH ADDITIONAL 2 INNINGS" SPOST
ELSE 1800 2600 828 A" 1 COIN 1ST INNING " SPOST
800 3C00 828 A" 1 COIN EACH ADDITIONAL 2 INNINGS " SPOST
THEN 2880 4C00 BASE2PAT 428 WRITR ;
```

**Declaration:** [127:2](#block-127) (definition).

**Source usage:** [127](#block-127), [128](#block-128).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-instrc"></a>

### `INSTRC` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 306, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-306) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Clear INSOUT, fill the screen and post pitch-button/trackball/outfielder instructions.

```terse
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

**Declaration:** [306:1](#block-306) (definition).

**Source usage:** [131](#block-131), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inswait"></a>

### `INSWAIT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 305, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. INSWAIT enables interrupts, loops until its count expires or any masked active-low button is pressed, sets INSOUT on input and disables interrupts on return.

```terse
: INSWAIT EI BEGIN FF 0 DO LOOP
14 INP 33 AND 33 < IF DROP 1 INSOUT BONE THEN
1- DUP 0= END DROP DI ;
```

**Declaration:** [305:10](#block-305) (definition).

**Source usage:** [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-interrupts"></a>

### `INTERRUPTS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 291, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : INTERRUPTS> } { [ } ASM { ] } JMP, { ; }
: ]'[ [COMPILE] ' ;
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inthighres"></a>

### `INTHIGHRES` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 293, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-293) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. INTHIGHRES sets commercial mode, $C0 vertical blanking and zero horizontal color boundary.

```terse
: INTHIGHRES ( intialize screen for commercial mode )
1 8 OUTP ( con,com port ) C0 0A OUTP ( vertbl )
0 9 OUTP ( horzcb ) ;
```

**Declaration:** [293:1](#block-293) (definition).

**Source usage:** [133](#block-133), [293](#block-293).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-iscn"></a>

### `ISCN` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 127, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define ISCN to post V15 at the given coordinates.

```terse
: ISCN 1C00 1000 828 A" V15" SPOST ;
```

**Declaration:** [127:1](#block-127) (definition).

**Source usage:** [127](#block-127).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lable"></a>

### `LABLE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 304, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define zero-initialized cell/byte variable emitters V=/BV=, constant and forward shorthands C=/F=, and the deliberately spelled label alias LABLE for DATA.

```terse
{ : LABLE } DATA { ; }
```

**Declaration:** [304:5](#block-304) (definition).

**Source usage:** [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [113](#block-113), [114](#block-114), [122](#block-122), [158](#block-158), [163](#block-163), [166](#block-166), [186](#block-186), [187](#block-187), [188](#block-188), [189](#block-189), [190](#block-190), [199](#block-199), [226](#block-226), [227](#block-227), [228](#block-228), [229](#block-229), [253](#block-253), [258](#block-258), [259](#block-259), [264](#block-264), [270](#block-270), [278](#block-278), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ldinfldpa"></a>

### `LDINFLDPA` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 153, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-153) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. LDINFLDPA consumes stacked action pointers and installs them for third base, shortstop, second base, first base and pitcher, then continues the source chain.

```terse
: LDINFLDPA VPLAYACTPC 3RD ! VPLAYACTPC SS ! VPLAYACTPC 2ND !
VPLAYACTPC 1ST ! VPLAYACTPC PT ! ;
```

**Declaration:** [153:3](#block-153) (definition).

**Source usage:** [153](#block-153), [157](#block-157), [161](#block-161).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ldpc"></a>

### `LDPC` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

```terse
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:6](#block-141) (definition).

**Source usage:** [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ldpcc"></a>

### `LDPCC` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

```terse
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:7](#block-141) (definition).

**Source usage:** [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lk"></a>

### `LK` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 229, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-229) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : LK, } 0 0 0 BACT, DEACT, { ; }
LABLE PFB 0 300 50 BACT,
LABLE PSB 0 100 80 BACT,
LABLE PSU 0 100 35 BACT, 0 300 50 BACT,
LABLE PSD 0 300 12 BACT, 0 100 50 BACT,
LABLE PCO 0 300 12 BACT, 100 200 9 BACT, 0 200 50 BACT,
( Unused PCI pitch table omitted; selected pitches retained )
LABLE PICI -10 200 1A BACT, -100 200 9 BACT, 0 200 50 BACT,
LABLE PICO -20 200 1A BACT, 60 200 9 BACT, 0 200 50 BACT,
DECIMAL ;S



( BB destination delta calculation    DSTCALC )
BASE@ HEX
FORWARD DSTSET FORWARD BTLP1 FORWARD BTLP2 FORWARD RSRDST
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lsettfcoor"></a>

### `LSETTFCOOR` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 212, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-212) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. LSETTFCOOR loops through four runners, setting magic, positions, expansion, runner status and invisible pattern pointers.

```terse
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

**Declaration:** [212:1](#block-212) (definition).

**Source usage:** [212](#block-212), [214](#block-214).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-master"></a>

### `MASTER` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
0 VARIABLE MUSPC { : MASTER } 10 B, B, { ; } { : ATONE } 11 B,
B, { ; } { : BTONE } 12 B, B, { ; } { : CTONE } 13 B, B, { ; }
{ : VIBS } 14 B, B, { ; } { : ABVOLS } 16 B, B, { ; }
{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:1](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mball"></a>

### `MBALL` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MSTRIKE 0 STRIKESCORE BMUSIC ; : MBALL 0 BALLSCORE BMUSIC ;
```

**Declaration:** [146:6](#block-146) (definition).

**Source usage:** [146](#block-146), [182](#block-182).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mcannon"></a>

### `MCANNON` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MCANNON 0 CANNONSCORE BMUSIC ;
```

**Declaration:** [146:2](#block-146) (definition).

**Source usage:** [124](#block-124), [146](#block-146), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mcoin"></a>

### `MCOIN` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Use PMUSIC for the opening tune and BMUSIC for coin sound; stop loading.

```terse
: MCOIN 0 COINSCORE BMUSIC ;
```

**Declaration:** [146:10](#block-146) (definition).

**Source usage:** [146](#block-146), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mcvols"></a>

### `MCVOLS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:4](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mfence"></a>

### `MFENCE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MHIT 0 CRACKSCORE BMUSIC ; : MFENCE 0 FENCESCORE BMUSIC ;
```

**Declaration:** [146:5](#block-146) (definition).

**Source usage:** [124](#block-124), [146](#block-146).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mfoul"></a>

### `MFOUL` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MFOUL 0 FOULSCORE BMUSIC ;
```

**Declaration:** [146:7](#block-146) (definition).

**Source usage:** [146](#block-146), [158](#block-158).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mhit"></a>

### `MHIT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MHIT 0 CRACKSCORE BMUSIC ; : MFENCE 0 FENCESCORE BMUSIC ;
```

**Declaration:** [146:5](#block-146) (definition).

**Source usage:** [146](#block-146), [162](#block-162).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mlinn"></a>

### `MLINN` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 121, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-121) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. MLINN clears the marker region and, for a nonzero LINN, computes the arrow X coordinate with a cap before drawing IMRK.

```terse
: MLINN ( mark last inning ) DI PX0 2A A5 4D 3 RECTAN LINN B@
DUP DUP IF 0A < IF 8F0 SWAP 0 DO 200 + LOOP ELSE DROP 1CF0
THEN A500 IMRK 301 828 WRITE ELSE DROP DROP THEN EI ;
```

**Declaration:** [121:1](#block-121) (definition).

**Source usage:** [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mopeners"></a>

### `MOPENERS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Use PMUSIC for the opening tune and BMUSIC for coin sound; stop loading.

```terse
: MOPENERS 0 TAKE-ME PMUSIC ;
```

**Declaration:** [146:9](#block-146) (definition).

**Source usage:** [131](#block-131), [146](#block-146).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mout"></a>

### `MOUT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MSAFE 0 SAFESCORE BMUSIC ; : MOUT 0 OUTSCORE BMUSIC ;
```

**Declaration:** [146:8](#block-146) (definition).

**Source usage:** [146](#block-146), [181](#block-181).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-msafe"></a>

### `MSAFE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MSAFE 0 SAFESCORE BMUSIC ; : MOUT 0 OUTSCORE BMUSIC ;
```

**Declaration:** [146:8](#block-146) (definition).

**Source usage:** [146](#block-146), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mstrike"></a>

### `MSTRIKE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MSTRIKE 0 STRIKESCORE BMUSIC ; : MBALL 0 BALLSCORE BMUSIC ;
```

**Declaration:** [146:6](#block-146) (definition).

**Source usage:** [146](#block-146), [182](#block-182).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-myah"></a>

### `MYAH` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 146, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-146) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Wrap cannon, crowd, hit, fence, strike, ball, foul, safe and out streams with BMUSIC. Each wrapper pushes zero before the stream address. BMUSIC’s visible body pops the stream pointer; the leading zero’s wider role depends on the native runtime calling convention.

```terse
: MYAH 0 CHEERSSCORE BMUSIC ;
```

**Declaration:** [146:4](#block-146) (definition).

**Source usage:** [124](#block-124), [130](#block-130), [146](#block-146), [181](#block-181), [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-noise"></a>

### `NOISE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:4](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-notes"></a>

### `NOTES` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

```terse
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:14](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [136](#block-136), [140](#block-140), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-npost"></a>

### `NPOST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 249, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-249) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. NPOST iterates the requested byte count, posts each high then low nibble using SWAN and dpost, drops remaining drawing arguments and continues.

```terse
: NPOST ( post a bcd number on the screen ; see options )
( in= x , y , opt+ex/mag , variable adr , # of bytes )
( out- character on screen )
OVER + SWAP DO I B@ SWAN dpost I B@ dpost LOOP
3DROP ;
```

**Declaration:** [249:10](#block-249) (definition).

**Source usage:** [183](#block-183), [249](#block-249).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-offdst"></a>

### `OFFDST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 225, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : RUNDST, } 8 B, { ; } { : OFFDST, } 9 B, { ; }
{ : BLDST, } OPBLDST B, { ; } { : FLDDST, } 7 B, { ; }
{ : THW, } 0B B, { ; } { : DEACT, } 0C B, { ; }
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }

( BB playaction tables -runners- )
LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
LABLE TFPA1 10 REST, FLDDST,
LABLE TFPA2 20 REST, FLDDST,
LABLE THWBLPA BLDST,
LABLE PITCHBLPA BLMOT,
LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,


( BB playaction tables fieldlogic -infielders- )
( Unused NOBODYPA action table omitted )
LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
LABLE RTHWPA 0 0 5 RTRW ACT, STP,
LABLE LTHWPA 0 0 5 LTRW ACT, STP,
LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
THW, STP,
LABLE NOACTPA STP,
LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
ON3RD, RCB,
LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
( BB playaction tables fieldlogic -infielders- )
LABLE HLSS -80 0 10 LFLD ACT, STP,
LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
LABLE HMSS 100 -40 0C RRUN ACT, STP,
LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
LABLE F2NDL2ND 80 0 0D RFLD ACT, THW, STP,
LABLE HR2ND 80 0 12 RFLD ACT, STP,
LABLE HR1ST -80 -40 12 LFLD ACT, 200 90 13 RRUN ACT, ON1ST, LCB,
LABLE F1STR1ST -40 30 0A LFLD ACT, WTHW, STP,
LABLE F1STL1ST 140 -40 0B RFLD ACT, WTHW, STP,
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ofmot"></a>

### `OFMOT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 225, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : OFMOT, } 5 B, { ; } { : BLMOT, } OPBLMOT B, { ; }
{ : RUNDST, } 8 B, { ; } { : OFFDST, } 9 B, { ; }
{ : BLDST, } OPBLDST B, { ; } { : FLDDST, } 7 B, { ; }
{ : THW, } 0B B, { ; } { : DEACT, } 0C B, { ; }
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }

( BB playaction tables -runners- )
LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
LABLE TFPA1 10 REST, FLDDST,
LABLE TFPA2 20 REST, FLDDST,
LABLE THWBLPA BLDST,
LABLE PITCHBLPA BLMOT,
LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,


( BB playaction tables fieldlogic -infielders- )
( Unused NOBODYPA action table omitted )
LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
LABLE RTHWPA 0 0 5 RTRW ACT, STP,
LABLE LTHWPA 0 0 5 LTRW ACT, STP,
LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
THW, STP,
LABLE NOACTPA STP,
LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
ON3RD, RCB,
LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
( BB playaction tables fieldlogic -infielders- )
LABLE HLSS -80 0 10 LFLD ACT, STP,
LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
LABLE HMSS 100 -40 0C RRUN ACT, STP,
LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
LABLE F2NDL2ND 80 0 0D RFLD ACT, THW, STP,
LABLE HR2ND 80 0 12 RFLD ACT, STP,
LABLE HR1ST -80 -40 12 LFLD ACT, 200 90 13 RRUN ACT, ON1ST, LCB,
LABLE F1STR1ST -40 30 0A LFLD ACT, WTHW, STP,
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-outfldhit"></a>

### `OUTFLDHIT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 161, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-161) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Set outfield, timer, speed and airborne flags; select randomized Y/X coordinates and a HMHTBL class, call HOMERCHK and start the batter.

```terse
: OUTFLDHIT ( fly ball ) 18 TOTIMER B! HITOF BONE 3 VVEL BL B!
TOOF BONE 3 TOOF# B! INAIR BONE 3000 RND 700 + ( y )
SWINGTYPE B@ 1- FHTBL @ F00 RND + ( x )
0A RND HMHTBL B@ ( hit type ) 5FF RND 5FF RND
HOMERCHK WUPGO
HITDST HRPT HL1ST VDSTX BL @ 2800 < IF ( hit left )
HL2ND HLOUTSSPA ELSE HROUT2NDPA HRSS THEN HR3RD LDINFLDPA ;
```

**Declaration:** [161:1](#block-161) (definition).

**Source usage:** [161](#block-161), [162](#block-162).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-outline"></a>

### `OUTLINE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 272, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-272) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. OUTLINE uses NDUP/PICK and line continuation to draw four edges from X/Y/width/height.

```terse
: OUTLINE ( creates rectanguler outline )
( in- X , Y , X length , Y length ; pxtype set )
4 NDUP DROP 3 PICK + OVER 4 NDUP DLINE 5 PICK + CNLINE
3 PICK + CNLINE DROP DROP CNLINE ;
```

**Declaration:** [272:6](#block-272) (definition).

**Source usage:** [272](#block-272), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-outtime"></a>

### `OUTTIME` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 181, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-181) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define GAME OVER text. OUTTIME increments OUTS; reaching $33 enters the third-out path and requests cheer music.

```terse
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

**Declaration:** [181:2](#block-181) (definition).

**Source usage:** [181](#block-181), [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-plrchk"></a>

### `PLRCHK` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 131, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-131) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. PLRCHK reads active-low start bits from port $14, chooses one-player/computer or two-player mode and invokes STRTBALL; continue.

```terse
: PLRCHK 14 INP DUP 10 AND 10 XOR IF DROP CMPLR BONE STRTBALL
DI 800 7000 8828 A" YOU ARE" SPOST EI
ELSE STRT1 B@ IF DROP ELSE 20 AND 20 XOR IF CNSW1 B@ IF
CNSW12 BONE THEN STRTBALL THEN THEN THEN ;
```

**Declaration:** [131:9](#block-131) (definition).

**Source usage:** [131](#block-131), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-plrselect"></a>

### `PLRSELECT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 131, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-131) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. PLRSELECT redraws the field, enables player-choice polling and resets SELECT while updating the inning marker.

```terse
: PLRSELECT ( select singel player or 2 player )
DI FL CHKPLRS BONE
SPLR SELECT BZERO MLINN ;
```

**Declaration:** [131:1](#block-131) (definition).

**Source usage:** [131](#block-131), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ppost"></a>

### `PPOST` — :

**Stack:** `( x y options string -- x y options )`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 248, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-248) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. PPOST obtains the counted string length/address using COUNT and calls cpost for every byte, leaving updated X/Y/options for the next string; continue.

```terse
: PPOST ( post an ascii-string on the screen leaving x y and
options for next string ; see options )
( in= x , y , opt+ex/mag , string )
( i.e. 0 0 8828 28 A" STRING" PPOST )
( out- character on screen ; x , y , opt+ex/mag )
COUNT OVER + SWAP DO I B@ cpost LOOP ;
```

**Declaration:** [248:7](#block-248) (definition).

**Source usage:** [248](#block-248), [249](#block-249).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pup"></a>

### `PUP` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 133, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-133) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Initialize high-resolution commercial video mode, select B1 and write the initial output values.

```terse
: PUP ( power up routine )
INTHIGHRES B1 DUP 0 OUTP 4 OUTP 7 2 OUTP
DI 0 RND# @ 1 RND# @ SCRERASE 1 RND# ! 0 RND# ! EMUSIC S10
SHILL BONE
DI FL SGO EI GAMEOVER BONE TF SENTRY ;
```

**Declaration:** [133:1](#block-133) (definition).

**Source usage:** [133](#block-133).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-px0"></a>

### `PX0` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 280, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-280) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Emit zero/white pixel patterns and define PX1/PX0 to select them.

```terse
: PX0 0 PXT0 PXTYPE ! ;
```

**Declaration:** [280:7](#block-280) (definition).

**Source usage:** [121](#block-121), [128](#block-128), [130](#block-130), [280](#block-280).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-px1"></a>

### `PX1` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 280, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-280) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Emit zero/white pixel patterns and define PX1/PX0 to select them.

```terse
: PX1 0 PXT1 PXTYPE ! ;
```

**Declaration:** [280:6](#block-280) (definition).

**Source usage:** [128](#block-128), [274](#block-274), [280](#block-280).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-quiet"></a>

### `QUIET` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

```terse
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:7](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [140](#block-140), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-quit"></a>

### `QUIT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define LDPC (opcode 3), QUIT (opcode 4 with an embedded loop address), LDPCC (opcode 2) and QUIET, which clears tone/volume settings before ending.

```terse
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:6](#block-141) (definition).

**Source usage:** [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rdrndnte"></a>

### `RDRNDNTE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

```terse
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:11](#block-141) (definition).

**Source usage:** [138](#block-138), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-recline"></a>

### `RECLINE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 272, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-272) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RECLINE derives one horizontal row from retained rectangle arguments. RECTAN repeatedly draws rows, advances Y and decreases remaining height, then discards the arguments.

```terse
: RECLINE 4 PICK 4 PICK 2DUP SWAP 6 PICK + SWAP DLINE ;
```

**Declaration:** [272:1](#block-272) (definition).

**Source usage:** [272](#block-272).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rectan"></a>

### `RECTAN` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 272, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-272) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RECLINE derives one horizontal row from retained rectangle arguments. RECTAN repeatedly draws rows, advances Y and decreases remaining height, then discards the arguments.

```terse
: RECTAN ( in X, Y, X length, Y length, pxtype set )
BEGIN RECLINE ROT 1+ ROT ROT 1- DUP 0= END DROP DROP DROP
DROP ;
```

**Declaration:** [272:2](#block-272) (definition).

**Source usage:** [121](#block-121), [128](#block-128), [130](#block-130), [272](#block-272), [273](#block-273), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rest"></a>

### `REST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 136, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-136) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define CMAJOR for the default tone/volume setup, REST for a silent duration, and ^ for restoring volumes; begin TAKE-ME with CMAJOR and no vibrato.

```terse
{ : REST } 0 ABVOLS 0 MCVOLS 0A DURATION { ; }
{ : ^ } EF ABVOLS 0F MCVOLS { ; } BTABLE TAKE-ME CMAJOR 0 VIBS
14 #C1 #E1 #C2 NOTES 0A #E1 #G1 #C3 NOTES 0A #C1 #F1 #A2 NOTES
0A #C1 #E1 #G2 NOTES 0A #C1 #G1 #E2 NOTES
1E #B0 #D1 #G2 NOTES 1E #G0 #F1 #D2 NOTES 14 #C1 #E1 #C2 NOTES
0A #E1 #G1 #C3 NOTES 0A #F1 #C2 #A2 NOTES 0A #E1 #C2 #G2 NOTES
0A #C1 #G1 #E2 NOTES 3C #B0 #D1 #G2 NOTES 3C #C1 #E2 #C3 NOTES
0 CHEERSSCORE LDPCC -->
0A #C1 #G1 #E2 NOTES 14 #B0 #D1 #G2 NOTES 0A #C1 #E1 #G2 NOTES
0A #D1 #F1 #G2 NOTES 0A #DS1 #C2 #FS2 NOTES 0A #E1 #C2 #G2 NOTES
0A #F1 #C2 #A2 NOTES 0A #E1 #B1 3A NOTES 0A #F1 #C2 #A2 NOTES
0A #G1 #C2 #E2 NOTES 0A #A1 #C2 #F2 NOTES 0A #E1 #CS2 #G2 NOTES
0A #F1 #D2 #A2 NOTES REST 0A #D1 #A1 #F2 NOTES -->

( BB music - reconstructed continuation bridge )














( BASEBALL SOUNDS , SIREN CANNON ) HEX
BTABLE SIRENSCORE AB ABVOLS 0B MCVOLS
90 5E 11 RDRNDNTE 80 5E 13 RDRNDNTE 70 5E 12 RDRNDNTE
0 VIBS 10 MASTER 1 DURATION 0E MASTER 1 DURATION 0C MASTER
1 DURATION 0A MASTER 1 DURATION 8 MASTER 1 DURATION 6 MASTER
1 DURATION 4 MASTER 1 DURATION 2 MASTER 1 DURATION
12 SIRENSCORE LDPCC
( HOMER CONT. ) BTABLE CANNONSCORE
FF ABVOLS 1F MCVOLS 2 MASTER 8 NOISE
#D2 CTONE #FS2 BTONE 6 #GS2 ANOTE
#C2 CTONE 6 #E2 ANOTE #B1 CTONE 6 #D2 BNOTE
1D ABVOLS 1A MCVOLS #A1 CTONE 6 #C2 ANOTE
AA ABVOLS 17 MCVOLS #G1 CTONE 6 #B1 BNOTE
0 SIRENSCORE LDPCC

( BB music - reconstructed continuation bridge )



```

**Declaration:** [136:2](#block-136) (definition).

**Source usage:** [136](#block-136).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-retpa"></a>

### `RETPA` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 213, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-213) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RETPA gives eight fielders TFPA, activates them and clears VGO.

```terse
: RETPA ( return to position pa )
VMAGIC PT 8 0 DO DUP DUP VPLAYACTPC + TFPA S! VSTATUS + DUP
B@ 80 OR F7 AND SB! VLENGTH + LOOP DROP ;
```

**Declaration:** [213:3](#block-213) (definition).

**Source usage:** [213](#block-213), [214](#block-214).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rndnte"></a>

### `RNDNTE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

```terse
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:13](#block-141) (definition).

**Source usage:** [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rrrndnte"></a>

### `RRRNDNTE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define timed individual notes, randomized-note variants and three-voice NOTES. Their repeated B, calls consume stack arguments in reverse push order.

```terse
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:12](#block-141) (definition).

**Source usage:** [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-run1chk1st"></a>

### `RUN1CHK1ST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 168, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue.

```terse
: RUN1CHK1ST VWBASE R1 B@ 1 = IF 1 VMAGIC R2
ELSE RUN1CHK2ND THEN ;
```

**Declaration:** [168:11](#block-168) (definition).

**Source usage:** [168](#block-168), [169](#block-169).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-run1chk2nd"></a>

### `RUN1CHK2ND` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 168, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue.

```terse
: RUN1CHK2ND VWBASE R1 B@ 2 = IF RUN2CHK12ND
ELSE RUN2CHK THEN ;
```

**Declaration:** [168:9](#block-168) (definition).

**Source usage:** [168](#block-168).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-run2chk"></a>

### `RUN2CHK` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 168, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```terse
: RUN2CHK VWBASE R2 B@ 0 = IF 3 VMAGIC R2
ELSE RUN2CHK1ST THEN ;
```

**Declaration:** [168:5](#block-168) (definition).

**Source usage:** [168](#block-168).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-run2chk12nd"></a>

### `RUN2CHK12ND` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 168, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RUN2CHK12ND, RUN1CHK2ND and RUN1CHK1ST complete the decision tree for first/second occupancy; continue.

```terse
: RUN2CHK12ND VWBASE R2 B@ 0 = IF 2 VMAGIC R2
ELSE 4 VMAGIC R3 THEN ;
```

**Declaration:** [168:7](#block-168) (definition).

**Source usage:** [168](#block-168).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-run2chk1st"></a>

### `RUN2CHK1ST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 168, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```terse
: RUN2CHK1ST VWBASE R2 B@ 1 = IF 6 VMAGIC R3
ELSE RUN3CHK THEN ;
```

**Declaration:** [168:3](#block-168) (definition).

**Source usage:** [168](#block-168).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-run3chk"></a>

### `RUN3CHK` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 168, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-168) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. RUN3CHK, RUN2CHK1ST and RUN2CHK distinguish the later runner records' base bytes and leave an occupancy code plus the next available runner address.

```terse
: RUN3CHK VWBASE R3 B@ 0 = IF 7 VMAGIC R3 ELSE 5 VMAGIC R4
THEN ;
```

**Declaration:** [168:1](#block-168) (definition).

**Source usage:** [168](#block-168).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sx21"></a>

### `S!` — :

**Stack:** `( address value -- )`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 304, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. S! swaps the value/address before cell store; SB! does the same for byte store.

```terse
: S! SWAP ! ; : SB! SWAP B! ;
```

**Declaration:** [304:2](#block-304) (definition).

**Source usage:** [181](#block-181), [212](#block-212), [213](#block-213), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-s10"></a>

### `S10` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 289, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-289) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. S10 starts INTERRUPTS0 through ISTART; S11 starts INTERRUPTS1. Restore the radix saved by the surrounding interrupt chain and stop.

```terse
: S10 INTERRUPTS0 ISTART ; : S11 INTERRUPTS1 ISTART ;
```

**Declaration:** [289:1](#block-289) (definition).

**Source usage:** [124](#block-124), [130](#block-130), [133](#block-133), [289](#block-289).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-s11"></a>

### `S11` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 289, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-289) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. S10 starts INTERRUPTS0 through ISTART; S11 starts INTERRUPTS1. Restore the radix saved by the surrounding interrupt chain and stop.

```terse
: S10 INTERRUPTS0 ISTART ; : S11 INTERRUPTS1 ISTART ;
```

**Declaration:** [289:1](#block-289) (definition).

**Source usage:** [124](#block-124), [289](#block-289).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sbx21"></a>

### `SB!` — :

**Stack:** `( address byte -- )`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 304, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. S! swaps the value/address before cell store; SB! does the same for byte store.

```terse
: S! SWAP ! ; : SB! SWAP B! ;
```

**Declaration:** [304:2](#block-304) (definition).

**Source usage:** [130](#block-130), [181](#block-181), [212](#block-212), [213](#block-213), [233](#block-233), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sball1"></a>

### `SBALL1` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define BALL 1/2/3, HOMER and WALK string words.

```terse
: SBALL1 2200 2ROT A" BALL 1" SPOST ;
```

**Declaration:** [179:1](#block-179) (definition).

**Source usage:** [179](#block-179).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sball2"></a>

### `SBALL2` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define BALL 1/2/3, HOMER and WALK string words.

```terse
: SBALL2 2200 2ROT A" BALL 2" SPOST ;
```

**Declaration:** [179:2](#block-179) (definition).

**Source usage:** [179](#block-179).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sball3"></a>

### `SBALL3` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define BALL 1/2/3, HOMER and WALK string words.

```terse
: SBALL3 2200 2ROT A" BALL 3" SPOST ;
```

**Declaration:** [179:3](#block-179) (definition).

**Source usage:** [179](#block-179).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sbo"></a>

### `SBO` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 272, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-272) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SBO posts the three $30-based count characters at their fixed positions. Select decimal and load the infield data chain at 278.

```terse
: SBO 3700 B000 308 BALLS B@ CPOST 3F00 B000 308 STRIKES B@
CPOST 4700 B000 308 OUTS B@ CPOST ;
```

**Declaration:** [272:11](#block-272) (definition).

**Source usage:** [130](#block-130), [178](#block-178), [180](#block-180), [181](#block-181), [182](#block-182), [272](#block-272), [275](#block-275).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-scoreme"></a>

### `SCOREME` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 183, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-183) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SCOREME selects SCORE1/SCORE2 and coordinates from SCORESHOW, posts one BCD byte, clears the display request and selects cannon or cheer music; continue.

```terse
: SCOREME ( plop scores up )
SCORESHOW DUP B@ 2 = IF 900 8C00 4308 SCORE2
ELSE 4300 8C00 4308 SCORE1 THEN 1 NPOST BZERO
HOMERUN B@ IF MCANNON ELSE MYAH THEN ;
```

**Declaration:** [183:8](#block-183) (definition).

**Source usage:** [183](#block-183), [268](#block-268).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-screrase"></a>

### `SCRERASE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 293, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-293) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SCRERASE fills $3F00 bytes starting at $4000 with zero; continue.

```terse
: SCRERASE ( erase entire screen )
0 4000 3F00 FILL ;
```

**Declaration:** [293:8](#block-293) (definition).

**Source usage:** [133](#block-133), [293](#block-293).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-scrs"></a>

### `SCRS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 273, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SUP posts UP. SCRS clears two score rectangles and draws zero score characters.

```terse
: SCRS 1F 8A 18 0E RECTAN 107 8A 18 0E RECTAN
B00 8C00 308 30 CPOST 4500 8C00 308 30 CPOST ;
```

**Declaration:** [273:11](#block-273) (definition).

**Source usage:** [128](#block-128), [273](#block-273), [275](#block-275).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-setfdst"></a>

### `SETFDST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 211, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-211) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Save radix, select hex and write shortstop, first-base, third-base and second-base X/Y destination cells.

```terse
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

**Declaration:** [211:2](#block-211) (definition).

**Source usage:** [130](#block-130), [211](#block-211).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-settf"></a>

### `SETTF` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 214, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-214) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. STFLD installs RETPA and TAKEFIELD. SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

```terse
: SETTF DI LSETTFCOOR STFLD SETTFPA EI ;
```

**Declaration:** [214:3](#block-214) (definition).

**Source usage:** [130](#block-130), [214](#block-214).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-settfpa"></a>

### `SETTFPA` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 213, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-213) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SETTFPA assigns delayed take-field sequences to pitcher/infielders, RUNBPA to all runners and TBLPA to BL; continue.

```terse
: SETTFPA ( take field pa )
TFPA2 VPLAYACTPC PT ! TFPA1 VPLAYACTPC 1ST !
TFPA1 VPLAYACTPC 2ND ! TFPA1 VPLAYACTPC 3RD !
TFPA1 VPLAYACTPC SS !
RUNBPA VPLAYACTPC R1 ! RUNBPA VPLAYACTPC R2 !
RUNBPA VPLAYACTPC R3 ! RUNBPA VPLAYACTPC R4 !
TBLPA VPLAYACTPC BL ! ;
```

**Declaration:** [213:6](#block-213) (definition).

**Source usage:** [213](#block-213), [214](#block-214).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sfoul"></a>

### `SFOUL` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 178, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

```terse
: SFOUL 2400 2ROT A" FOUL " SPOST ;
```

**Declaration:** [178:4](#block-178) (definition).

**Source usage:** [178](#block-178), [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sgo"></a>

### `SGO` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 181, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-181) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define GAME OVER text. OUTTIME increments OUTS; reaching $33 enters the third-out path and requests cheer music.

```terse
: SGO 2000 2D00 828 A" GAME OVER" SPOST ;
```

**Declaration:** [181:1](#block-181) (definition).

**Source usage:** [127](#block-127), [128](#block-128), [129](#block-129), [133](#block-133), [181](#block-181).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-shomer"></a>

### `SHOMER` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define BALL 1/2/3, HOMER and WALK string words.

```terse
: SHOMER 2300 2ROT A" HOMER" SPOST ;
```

**Declaration:** [179:4](#block-179) (definition).

**Source usage:** [179](#block-179), [180](#block-180).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sorry"></a>

### `SORRY` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 127, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-127) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define congratulatory, loss and one-coin prompts and continue loading.

```terse
: SORRY 1B00 1000 828 A" TOO BAD I WON" SPOST DP1CN ;
```

**Declaration:** [127:12](#block-127) (definition).

**Source usage:** [127](#block-127), [129](#block-129).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sout1"></a>

### `SOUT1` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 178, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

```terse
: SOUT1 2300 2ROT A" 1 OUT" SPOST ;
```

**Declaration:** [178:5](#block-178) (definition).

**Source usage:** [178](#block-178), [179](#block-179).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sout2"></a>

### `SOUT2` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 178, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

```terse
: SOUT2 2200 2ROT A" 2 OUTS" SPOST ;
```

**Declaration:** [178:6](#block-178) (definition).

**Source usage:** [178](#block-178), [179](#block-179).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sout3"></a>

### `SOUT3` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 178, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

```terse
: SOUT3 2200 2ROT A" 3 OUTS" SPOST ;
```

**Declaration:** [178:7](#block-178) (definition).

**Source usage:** [178](#block-178), [179](#block-179).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-splr"></a>

### `SPLR` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 128, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-128) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SPLR12/SPLR display available player choices; when one more credit is needed for two players, set STRT1.

```terse
: SPLR CNSW1 B@ IF CREDITS B@ 1 <> IF SPLR12 ELSE 0E00 2000 828
A" SELECT 1 PLAYER OR DEPOSIT" SPOST
0F00 3000 828 A" 1 MORE COIN FOR 2 PLAYERS"
SPOST STRT1 BONE THEN ELSE SPLR12 THEN ;
```

**Declaration:** [128:5](#block-128) (definition).

**Source usage:** [128](#block-128), [131](#block-131).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-splr12"></a>

### `SPLR12` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 128, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-128) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SPLR12/SPLR display available player choices; when one more credit is needed for two players, set STRT1.

```terse
: SPLR12 1400 2000 828 A" SELECT 1 OR 2 PLAYERS" SPOST ;
```

**Declaration:** [128:4](#block-128) (definition).

**Source usage:** [128](#block-128).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-spost"></a>

### `SPOST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 249, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-249) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SPOST calls PPOST then drops the three retained drawing arguments.

```terse
: SPOST ( post an ascii-string on the screen ; see options )
( in= x , y , opt+ex/mag , string )
( i.e. 0 0 8828 A" STRING" SPOST )
( out- character on screen )
PPOST 3DROP ;
```

**Declaration:** [249:1](#block-249) (definition).

**Source usage:** [127](#block-127), [128](#block-128), [131](#block-131), [178](#block-178), [179](#block-179), [181](#block-181), [237](#block-237), [238](#block-238), [249](#block-249), [273](#block-273), [274](#block-274), [275](#block-275), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ssafe"></a>

### `SSAFE` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 178, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

```terse
: SSAFE 2400 2ROT A" SAFE " SPOST SBO ;
```

**Declaration:** [178:3](#block-178) (definition).

**Source usage:** [178](#block-178), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sstrike1"></a>

### `SSTRIKE1` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 178, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

```terse
: SSTRIKE1 2000 2ROT A" STRIKE 1" SPOST ;
```

**Declaration:** [178:8](#block-178) (definition).

**Source usage:** [178](#block-178), [179](#block-179).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sstrike2"></a>

### `SSTRIKE2` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 178, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-178) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define SAFE, FOUL, one/two/three OUT and first/second STRIKE display words. Each supplies its X coordinate and text to SPOST; SSAFE also redraws counts with SBO. Continue.

```terse
: SSTRIKE2 2100 2ROT A" STRIKE 2" SPOST ;
```

**Declaration:** [178:9](#block-178) (definition).

**Source usage:** [178](#block-178), [179](#block-179).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stfld"></a>

### `STFLD` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 214, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-214) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. STFLD installs RETPA and TAKEFIELD. SETTF performs coordinate/action initialization under DI/EI, then restores the compile-time radix and stops loading.

```terse
: STFLD RETPA TAKEFIELD BONE ;
```

**Declaration:** [214:2](#block-214) (definition).

**Source usage:** [118](#block-118), [214](#block-214).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stp"></a>

### `STP` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 225, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }

( BB playaction tables -runners- )
LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
LABLE TFPA1 10 REST, FLDDST,
LABLE TFPA2 20 REST, FLDDST,
LABLE THWBLPA BLDST,
LABLE PITCHBLPA BLMOT,
LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,


( BB playaction tables fieldlogic -infielders- )
( Unused NOBODYPA action table omitted )
LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
LABLE RTHWPA 0 0 5 RTRW ACT, STP,
LABLE LTHWPA 0 0 5 LTRW ACT, STP,
LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
THW, STP,
LABLE NOACTPA STP,
LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
ON3RD, RCB,
LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
( BB playaction tables fieldlogic -infielders- )
LABLE HLSS -80 0 10 LFLD ACT, STP,
LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
LABLE HMSS 100 -40 0C RRUN ACT, STP,
LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
LABLE F2NDL2ND 80 0 0D RFLD ACT, THW, STP,
LABLE HR2ND 80 0 12 RFLD ACT, STP,
LABLE HR1ST -80 -40 12 LFLD ACT, 200 90 13 RRUN ACT, ON1ST, LCB,
LABLE F1STR1ST -40 30 0A LFLD ACT, WTHW, STP,
LABLE F1STL1ST 140 -40 0B RFLD ACT, WTHW, STP,
LABLE HRL1ST 100 0 18 RFLD ACT, STP,
LABLE F1STPT 480 0 15 RRUN ACT, ON1ST, LCB,
LABLE HLOUTSSPA -20 -80 10 LRUN ACT, STP,
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-striketime"></a>

### `STRIKETIME` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 182, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-182) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. STRIKETIME increments STRIKES. At $33 call OUTTIME and retain the OUT event code; otherwise play/post the new strike count.

```terse
: STRIKETIME ( strike process )
STRIKES DUP 1+B! B@ 33 = IF OUTTIME COUT OLDSTRING B!
ELSE MSTRIKE DOSSTRIKE THEN SBO ;
```

**Declaration:** [182:1](#block-182) (definition).

**Source usage:** [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stringgo"></a>

### `STRINGGO` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 184, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-184) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. STRINGGO sets the shared Y/options, chooses STETBL for erase or STTBL for an event and initializes its expiry timer, executes the selected word and drops retained drawing parameters.

```terse
: STRINGGO ( given string , stringerase )
7A00 ( y ) 828 ( ex/mg ) 4 PICK 4 PICK
IF STETBL ELSE
STTBL 50 STRINGOFFTIMER B! THEN @ EX
DROP DROP ;
```

**Declaration:** [184:1](#block-184) (definition).

**Source usage:** [184](#block-184).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stringprc"></a>

### `STRINGPRC` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 184, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-184) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. STRINGPRC takes and clears STRING, erases an existing timed message when necessary, records OLDSTRING, draws/processes the new event and clears STRINGERASE.

```terse
: STRINGPRC ( string display )
STRING B@ DUP STRING BZERO
STRINGOFFTIMER B@ IF OLDSTRING B@ 1 STRINGGO OLDSTRING B!
0 ( erase or write ) STRINGGO
ELSE OLDSTRING B! ( one string ) STRINGERASE B@ STRINGGO
THEN STRINGERASE BZERO ;
```

**Declaration:** [184:6](#block-184) (definition).

**Source usage:** [184](#block-184), [268](#block-268).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-strtball"></a>

### `STRTBALL` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 131, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-131) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. STRTBALL runs instructions, redraws the field, clears scores and game state, applies credit handling, shows the computer-game greeting, starts TF and opening music.

```terse
: STRTBALL DI INSTRC FL F00 SUP 3F00 SUP
PLYR1UP BONE SCORE1 ZERO INN# BZERO STRT1 BZERO GAMEOVER BZERO
CNSW1 B@ IF CREDARROW ELSE MLINN DI THEN SHILL BZERO
CMPLR B@ IF YOU1ST 50 DWAIT YOU1ST THEN
8C0 INNX ! 1STINN BONE TF 1STINN BZERO MOPENERS ;
```

**Declaration:** [131:4](#block-131) (definition).

**Source usage:** [131](#block-131).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sup"></a>

### `SUP` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 273, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SUP posts UP. SCRS clears two score rectangles and draws zero score characters.

```terse
: SUP 8C00 8828 A" UP" SPOST ;
```

**Declaration:** [273:10](#block-273) (definition).

**Source usage:** [130](#block-130), [131](#block-131), [273](#block-273), [275](#block-275).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swx2d30"></a>

### `SW-30` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 170, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-170) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SW-30 chooses right/second-base sectors by the same input convention.

```terse
: SW-30 DUP IF 1 = IF ( x=1 ) IF F1STR ELSE HR THEN
ELSE ( x=-1 ) IF HR ELSE F2NDL THEN THEN
ELSE ( x= 0 ) DROP DUP IF 1- IF F2NDL ELSE F2NDR THEN
ELSE DROP HR THEN THEN ;
```

**Declaration:** [170:7](#block-170) (definition).

**Source usage:** [170](#block-170), [171](#block-171).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swx2d45"></a>

### `SW-45` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 170, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-170) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SW-45 chooses among right/foul/first-base sectors using horizontal pitch direction and the random selector.

```terse
: SW-45 DUP IF 1 = IF ( x=1 ) DROP FBR
ELSE ( x = -1 ) IF HRL ELSE F1STL THEN THEN
ELSE ( X=0 ) DROP DUP IF 1- IF F1STL ELSE F1STR THEN
ELSE DROP HRL THEN THEN ;
```

**Declaration:** [170:3](#block-170) (definition).

**Source usage:** [170](#block-170), [171](#block-171).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swx2d90"></a>

### `SW-90` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 170, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-170) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SW-90 ignores direction/random inputs and returns the far-right foul sector.

```terse
: SW-90 DROP DROP FBR ;
```

**Declaration:** [170:2](#block-170) (definition).

**Source usage:** [170](#block-170), [171](#block-171).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swx2b30"></a>

### `SW+30` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 171, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-171) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SW+30 chooses left/third-base/shortstop sectors.

```terse
: SW+30 DUP IF 1 = IF ( x=1 ) IF HL ELSE FSSR THEN
ELSE ( x= -1 ) IF F3RDL ELSE HL THEN THEN
ELSE ( x=0 ) DROP DUP IF 1- IF FSSR ELSE FSSL THEN
ELSE DROP HL THEN THEN ;
```

**Declaration:** [171:1](#block-171) (definition).

**Source usage:** [171](#block-171).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swx2b45"></a>

### `SW+45` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 171, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-171) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SW+45 handles the left-edge choices; SW+90 always returns foul-left after dropping its inputs.

```terse
: SW+45 DUP IF 1 = IF ( x=1 ) IF HLL ELSE F3RDR THEN
ELSE ( x= -1 ) DROP FBL THEN
ELSE ( x=0 ) DROP DUP IF 1- IF F3RDR ELSE F3RDL THEN
ELSE DROP HLL THEN THEN ;
```

**Declaration:** [171:5](#block-171) (definition).

**Source usage:** [171](#block-171).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swx2b90"></a>

### `SW+90` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 171, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-171) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SW+45 handles the left-edge choices; SW+90 always returns foul-left after dropping its inputs.

```terse
: SW+90 DROP DROP FBL ;
```

**Declaration:** [171:9](#block-171) (definition).

**Source usage:** [171](#block-171).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sw0"></a>

### `SW0` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 170, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-170) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. SW0 handles the central swing angle and middle/second-base/shortstop sectors; continue.

```terse
: SW0 DUP IF 1 = IF ( x=1 ) IF F2NDR ELSE HM THEN
ELSE ( x=-1 ) IF FSSL ELSE HM THEN THEN
ELSE ( x=0 ) DROP IF HM ELSE F2NDR THEN THEN ;
```

**Declaration:** [170:11](#block-170) (definition).

**Source usage:** [170](#block-170), [171](#block-171).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swalk"></a>

### `SWALK` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define BALL 1/2/3, HOMER and WALK string words.

```terse
: SWALK 2400 2ROT A" WALK" SPOST ;
```

**Declaration:** [179:5](#block-179) (definition).

**Source usage:** [179](#block-179), [182](#block-182), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-tcnt"></a>

### `TCNT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 128, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-128) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. TCNT chooses one-coin versus per-player continuation wording from CNSW12 and current credits.

```terse
: TCNT 700 1800 828 A" TO CONTINUE GAME AT END OF INNING" SPOST
CNSW12 B@ IF CREDITS B@ IF DP1 ELSE 0F00 2C00 828
A" DEPOSIT 1 COIN PER PLAYER" SPOST THEN ELSE DP1 THEN ;
```

**Declaration:** [128:1](#block-128) (definition).

**Source usage:** [128](#block-128), [130](#block-130).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-tersechk"></a>

### `TERSECHK` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 132, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-132) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. TERSECHK advances the random generator and services pending take-field, player-selection, player-check and credit-update flags.

```terse
: TERSECHK ( look at terse routine flags ) 0 RND DROP
TFTIME B@ IF TF THEN SELECT B@ IF PLRSELECT THEN
CHKPLRS B@ IF PLRCHK THEN UPCRED B@ IF CREDARROW THEN ;
```

**Declaration:** [132:1](#block-132) (definition).

**Source usage:** [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-tf"></a>

### `TF` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 129, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-129) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. TF clears transient RAM, initializes ball/strike/out character bytes to $30, reads and inverts the pricing DIP bit, switches PLYR1UP and adjusts computer control.

```terse
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

**Declaration:** [129:1](#block-129) (definition).

**Source usage:** [129](#block-129), [131](#block-131), [132](#block-132), [133](#block-133).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-thw"></a>

### `THW` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 225, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
{ : THW, } 0B B, { ; } { : DEACT, } 0C B, { ; }
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }

( BB playaction tables -runners- )
LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
LABLE TFPA1 10 REST, FLDDST,
LABLE TFPA2 20 REST, FLDDST,
LABLE THWBLPA BLDST,
LABLE PITCHBLPA BLMOT,
LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,


( BB playaction tables fieldlogic -infielders- )
( Unused NOBODYPA action table omitted )
LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
LABLE RTHWPA 0 0 5 RTRW ACT, STP,
LABLE LTHWPA 0 0 5 LTRW ACT, STP,
LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
THW, STP,
LABLE NOACTPA STP,
LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
ON3RD, RCB,
LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
( BB playaction tables fieldlogic -infielders- )
LABLE HLSS -80 0 10 LFLD ACT, STP,
LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
LABLE HMSS 100 -40 0C RRUN ACT, STP,
LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
LABLE F2NDL2ND 80 0 0D RFLD ACT, THW, STP,
LABLE HR2ND 80 0 12 RFLD ACT, STP,
LABLE HR1ST -80 -40 12 LFLD ACT, 200 90 13 RRUN ACT, ON1ST, LCB,
LABLE F1STR1ST -40 30 0A LFLD ACT, WTHW, STP,
LABLE F1STL1ST 140 -40 0B RFLD ACT, WTHW, STP,
LABLE HRL1ST 100 0 18 RFLD ACT, STP,
LABLE F1STPT 480 0 15 RRUN ACT, ON1ST, LCB,
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-twait"></a>

### `TWAIT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 236, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-236) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. TWAIT performs a high-level delay with interrupts enabled, shortening it under the credit/pricing conditions shown, and finishes with interrupts disabled; continue.

```terse
: TWAIT ( terse wait period )
EI BEGIN FF 0 DO LOOP CREDITS B@ DUP IF 1 = IF CNSW12 B@ IF
ELSE DROP 1 THEN ELSE DROP 1 THEN ELSE DROP THEN
50 0 DO LOOP 1 - DUP 0= END
DROP DI ;
```

**Declaration:** [236:10](#block-236) (definition).

**Source usage:** [128](#block-128), [129](#block-129), [130](#block-130), [236](#block-236), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-v"></a>

### `V` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 142, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-142) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define V as VARIABLE and BV as BVARIABLE, then continue the music processor source.

```terse
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [142:14](#block-142) (definition).

**Source usage:** [142](#block-142), [143](#block-143).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-vibs"></a>

### `VIBS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Allocate MUSPC and define emitters for sound-register writes and duration opcode 1. A command typically emits its opcode followed by the byte.

```terse
{ : VIBS } 14 B, B, { ; } { : ABVOLS } 16 B, B, { ; }
{ : MCVOLS } 15 B, B, { ; } { : NOISE } 17 B, B, { ; }
{ : DURATION } 1 B, B, { ; }
{ : LDPC } 3 B, , { ; } { : QUIT } 4 B, HERE LDPC { ; }
{ : LDPCC } 2 B, , { ; } { : QUIET } 0 ABVOLS
0 MCVOLS 0 ATONE 0 BTONE 0 CTONE QUIT { ; }
{ : ANOTE } ATONE DURATION { ; } { : BNOTE } BTONE DURATION
{ ; } { : CNOTE } CTONE DURATION { ; }
{ : RDRNDNTE } 0 B, B, B, B, { ; }
{ : RRRNDNTE } 0 B, B, 0 B, B, { ; }
{ : RNDNTE } 0 B, B, 0 B, FF B, { ; }
{ : NOTES } ATONE BTONE CNOTE { ; }
BTABLE ENDMUSIC QUIET -->
( NOTE CONSTANTS )
FD C= #G0 EE C= #GS0 E1 C= #A0 D4 C= #AS0 C8 C= #B0
BD C= #C1 B2 C= #CS1 A8 C= #D1 9F C= #DS1 96 C= #E1
8D C= #F1 85 C= #FS1 7E C= #G1 77 C= #GS1 70 C= #A1
6A C= #AS1 64 C= #B1 5E C= #C2 59 C= #CS2 54 C= #D2
4F C= #DS2 4A C= #E2 46 C= #F2 42 C= #FS2 3E C= #G2
3B C= #GS2 37 C= #A2 34 C= #AS2 31 C= #B2 2E C= #C3
2C C= #CS3 29 C= #D3 27 C= #DS3 25 C= #E3 22 C= #F3
20 C= #FS3 1F C= #G3 1D C= #GS3 1B C= #A3 1A C= #AS3
18 C= #B3 17 C= #C4 15 C= #CS4 14 C= #D4 13 C= #DS4
12 C= #E4 11 C= #F4 10 C= #FS4 0F C= #G4 0E C= #GS4
0D C= #A4 0B C= #C5 0A C= #CS5 09 C= #DS5 08 C= #F5
07 C= #G5 06 C= #A5 05 C= #C6 04 C= #DS6 03 C= #G6
02 C= #C7 01 C= #G7 00 C= #G8
{ : V } VARIABLE { ; } { : BV } BVARIABLE { ; }
( MUSIC PROCESSOR IN ASSEMBLY )
0 BV MULTIPLE 0 V STARTPC 0 BV NOTETIMER 0 BV PRIORITY
```

**Declaration:** [141:3](#block-141) (definition).

**Source usage:** [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-vis"></a>

### `VIS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 237, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. HOM and VIS draw HOME/VISITOR using a large initial character and the remaining string; continue.

```terse
: VIS 700 7A00 828 56 CPOST 900 7F00 8828 A" ISITOR" SPOST ;
```

**Declaration:** [237:12](#block-237) (definition).

**Source usage:** [237](#block-237), [238](#block-238), [275](#block-275).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-whbodds"></a>

### `WHBODDS` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 169, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-169) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. HRBY2 halves HRAT. WHBODDS finds BASESTATUS and WHOSUP using the decision tree, treating an empty R1 as empty bases.

```terse
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

**Declaration:** [169:2](#block-169) (definition).

**Source usage:** [122](#block-122), [169](#block-169), [182](#block-182).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-wthw"></a>

### `WTHW` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 225, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-225) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition identified in Extra Bases source.

```terse
0A C= OPBLDST 6 C= OPBLMOT { : WTHW, } 0D B, { ; }
{ : OFMOT, } 5 B, { ; } { : BLMOT, } OPBLMOT B, { ; }
{ : RUNDST, } 8 B, { ; } { : OFFDST, } 9 B, { ; }
{ : BLDST, } OPBLDST B, { ; } { : FLDDST, } 7 B, { ; }
{ : THW, } 0B B, { ; } { : DEACT, } 0C B, { ; }
{ : STP, } 0 0 0 STND ACT, DEACT, { ; }
{ : RCB, } 0 0 0 RCB ACT, DEACT, { ; }
{ : LCB, } 0 0 0 LCB ACT, DEACT, { ; }

( BB playaction tables -runners- )
LABLE RUNBPA RUNDST, LABLE OFFFPA OFFDST,
LABLE TFPA FLDDST, LABLE OFTBLPA OFMOT,
LABLE TFPA1 10 REST, FLDDST,
LABLE TFPA2 20 REST, FLDDST,
LABLE THWBLPA BLDST,
LABLE PITCHBLPA BLMOT,
LABLE HL1ST 200 60 0E RRUN ACT, ON1ST, LCB,
LABLE HL2ND -300 0 0A LRUN ACT, ON2ND, LCB,
LABLE HRSS 300 -20 0D RRUN ACT, ON2ND, RCB,
LABLE HR3RD -200 B0 0A LRUN ACT, ON3RD, RCB,
LABLE HLPT -100 0 12 LRUN ACT, 0 0 0 STPT ACT, DEACT,
LABLE HRPT 100 0 12 RRUN ACT, 0 0 0 STPT ACT, DEACT,


( BB playaction tables fieldlogic -infielders- )
( Unused NOBODYPA action table omitted )
LABLE PITCHPA 0 0 12 PTTHW ACT, 0 0 0 STPT ACT, DEACT,
LABLE RTHWPA 0 0 5 RTRW ACT, STP,
LABLE LTHWPA 0 0 5 LTRW ACT, STP,
LABLE FBLR1ST 220 60 16 RRUN ACT, 100 40 2 RFLD ACT, THW, STP,
LABLE FBLL3RD -1F0 80 12 LRUN ACT, -80 40 2 LFLD ACT,
THW, STP,
LABLE NOACTPA STP,
LABLE HLL3RD -100 0 12 LFLD ACT, 0 100 5 LRUN ACT,
ON3RD, RCB,
LABLE F3RDR3RD -30 40 0A LFLD ACT, THW, STP,
LABLE F3RDL3RD 80 40 0A RFLD ACT, THW, STP,
LABLE F3RDLSS -100 40 12 LRUN ACT, STP,
LABLE HL3RD 80 -40 12 RFLD ACT, -200 C0 0E LRUN ACT, ON3RD, RCB,
( BB playaction tables fieldlogic -infielders- )
LABLE HLSS -80 0 10 LFLD ACT, STP,
LABLE FSSRSS -80 80 0C LFLD ACT, THW, STP,
LABLE FSSLSS 180 80 0C RFLD ACT, THW, STP,
LABLE HMSS 100 -40 0C RRUN ACT, STP,
LABLE F2NDR2ND -E0 A0 0C LFLD ACT, THW, STP,
LABLE F2NDL2ND 80 0 0D RFLD ACT, THW, STP,
LABLE HR2ND 80 0 12 RFLD ACT, STP,
LABLE HR1ST -80 -40 12 LFLD ACT, 200 90 13 RRUN ACT, ON1ST, LCB,
```

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-wupgo"></a>

### `WUPGO` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 233, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. BONE/BZERO store one/zero through SB!. WUPGO activates WHOSUP with runner/automatic-forward flags; continue.

```terse
: WUPGO WHOSUP @ DUP VSTATUS + 81 SB! VRSTAT + 3 SB! ;
```

**Declaration:** [233:14](#block-233) (definition).

**Source usage:** [158](#block-158), [161](#block-161), [182](#block-182), [233](#block-233).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-wupton"></a>

### `WUPTON` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 240, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-240) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. WUPTON installs WUPWRT. CHKFLSHSTAY checks whether flashing was reserved and stops that special use while retaining its phase state.

```terse
: WUPTON ' WUPWRT FLSHTON ;
```

**Declaration:** [240:1](#block-240) (definition).

**Source usage:** [130](#block-130), [240](#block-240).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-wupwrt"></a>

### `WUPWRT` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 238, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. PTAUTOTM decrements TIMEOUT only when field clearing is idle; WUPWRT calls it and draws the currently batting team label.

```terse
: WUPWRT ( write whos up for flash )
PTAUTOTM PLYR1UP B@ IF HOM ELSE VIS THEN ;
```

**Declaration:** [238:6](#block-238) (definition).

**Source usage:** [118](#block-118), [126](#block-126), [130](#block-130), [238](#block-238), [240](#block-240).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-you1st"></a>

### `YOU1ST` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 305, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-305) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. YOU1ST posts the greeting/extra-inning challenge, then continues to 306.

```terse
: YOU1ST 1A00 1000 828 A" YOU ARE UP 1ST" SPOST 0F00 3000 828
A" BEAT ME FOR EXTRA INNING" SPOST 1F00 5000 828
A" GOOD LUCK" SPOST ; -->
( BB sentry string routines INSTRC )
```

**Declaration:** [305:13](#block-305) (definition).

**Source usage:** [131](#block-131), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-zeroram"></a>

### `ZERORAM` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 273, line 14](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-273) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. FLFILL fills the background while allowing interrupts; ZERORAM clears $270 bytes starting at $7C30 and resets OFTFCNT. Continue loading.

```terse
: ZERORAM DI 0 7C30 270 FILL 3 OFTFCNT B! DI ;
```

**Declaration:** [273:14](#block-273) (definition).

**Source usage:** [129](#block-129), [273](#block-273), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-allfldact"></a>

### `ALLFLDACT` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 237, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE.

```terse
CODE ALLFLDACT ( sets all fielders active )
' INFLDACT CALL, ' OUTFLDACT CALL, NEXT
```

**Declaration:** [237:9](#block-237) (native word / kernel binding).

**Source usage:** [162](#block-162), [237](#block-237).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-anmseqload"></a>

### `ANMSEQLOAD` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 201, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-201) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. ANMSEQLOAD indexes the current animation group by VPERS# and saves VANMSEQ.

```terse
CODE ANMSEQLOAD ( finds proper anm seq by per=# )
( IX-proper vector add )
VANMH X H LDX, VANML X L LDX, VPERS# X A LDX,
' INDEXW CALL, ( anm seq look up )
D VANMSEQH X STX, E VANMSEQL X STX, RET,
```

**Declaration:** [201:1](#block-201) (native word / kernel binding).

**Source usage:** [201](#block-201), [203](#block-203).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ballerase"></a>

### `BALLERASE` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 180, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-180) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BALLERASE preserves BC/IY around native BLERASE and returns to TERSE.

```terse
CODE BALLERASE B PUSH, Y PUSHX, BLERASE CALL,
Y POPX, B POP, NEXT
```

**Declaration:** [180:1](#block-180) (native word / kernel binding).

**Source usage:** [180](#block-180), [181](#block-181).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bathit"></a>

### `BATHIT` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 124, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-124) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BATHIT marks HITYET, calls INLOG through DOVERB and clears hit/pitch/swing-go flags.

```terse
CODE BATHIT ( he hit it time to get em running )
HITYET STA, DI, DOVERB INLOG
A XRA, HITTIME STA, PITCHTIME STA, ( tractor ball utfld)
SWINGGO STA, EI, RET,
```

**Declaration:** [124:1](#block-124) (native word / kernel binding).

**Source usage:** [124](#block-124), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bathitchk"></a>

### `BATHITCHK` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 258, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-258) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BATHITCHK indexes by swing phase, rejects out-of-range Y and scaled X coordinates and preserves the table pointer as required.

```terse
CODE BATHITCHK ( check window for hit )
M A MOV, ( swing # ) A SLAR, BWTBL H LXI, ' INDEXW CALL,
VYH BL LDA, E SUB, D CMP, RNC, H INX, H INX, H PUSH,
VX BL LHLD, ' MULTHLBY4 CALL, H A MOV, H POP, M SUB, H INX,
M CMP, RNC, HITYET LDA, A ANA, RNZ, A INR,
HITTIME STA, HITGOING STA, BLERASE CALL, RET,
```

**Declaration:** [258:4](#block-258) (native word / kernel binding).

**Source usage:** [258](#block-258), [259](#block-259).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-batswing"></a>

### `BATSWING` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 259, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-259) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BATSWING marks a strike attempt, XOR-erases/redraws successive phases, checks contact until HITGOING is set and starts the reset delay at the last phase; continue.

```terse
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

**Declaration:** [259:9](#block-259) (native word / kernel binding).

**Source usage:** [259](#block-259), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-batwrite"></a>

### `BATWRITE` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 259, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-259) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BATWRITE looks up the angle, uses fixed batter coordinates/options and draws the relative pattern, preserving its caller's pointer.

```terse
CODE BATWRITE ( xor bat from swingtype )
H PUSH, M A MOV, BSWINGTABLE H LXI, ' INDEXW CALL,
D PUSH, ( pattern add. ) Y POPX, 2600 D LXI, AF00 H LXI,
828 B LXI, ( exp/mag )
reloff CALL, relabs CALL, writep CALL,
H POP, RET,
```

**Declaration:** [259:3](#block-259) (native word / kernel binding).

**Source usage:** [259](#block-259), [260](#block-260).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bcdx2b"></a>

### `BCD+` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 250, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-250) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BCD+ pops two cells, adds their low bytes with DAA, adds high bytes with carry and DAA, and pushes the resulting packed-BCD cell. 

```terse
CODE BCD+ ( binary to decimal arithmatic )
( in- integer 1 , integer 2 )
( out- bcd sum of integer 1 and 2 )
H POP, D POP, E A MOV, L ADD, DAA, A L MOV,
D A MOV, H ADC, DAA, A H MOV, H PUSH, NEXT
```

**Declaration:** [250:1](#block-250) (native word / kernel binding).

**Source usage:** [250](#block-250).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bldst"></a>

### `BLDST` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 192, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-192) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BLDST preserves BC, reads the ball speed, loads its destination and calls DSTCALC; a LDFLAG result means retain the current motion.

```terse
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

**Declaration:** [192:1](#block-192) (native word / kernel binding).

**Source usage:** [192](#block-192), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-blmotion"></a>

### `BLMOTION` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 199, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-199) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BLMOTION selects the writable pitch-ball RAM action record TBLPA.

```terse
CODE BLMOTION ( set pc for ram pa table -tractor ball )
TBLPA H LXI, VECTPC SHLD, RET,
```

**Declaration:** [199:8](#block-199) (native word / kernel binding).

**Source usage:** [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-blposchk"></a>

### `BLPOSCHK` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 262, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-262) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BLPOSCHK branches on HITYET. A pitch beyond Y=$BC enters pitch-completion handling unless contact is already pending.

```terse
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

**Declaration:** [262:1](#block-262) (native word / kernel binding).

**Source usage:** [262](#block-262), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bmusic"></a>

### `BMUSIC` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 145, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-145) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. loadpc installs MUSPC and STARTPC. BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

```terse
CODE BMUSIC PRIORITY LDA, H POP, A ORA, 0=, IF, loadpc CALL,
NOTETIMER STA, A INR, MULTIPLE STA, THEN, NEXT
```

**Declaration:** [145:2](#block-145) (native word / kernel binding).

**Source usage:** [145](#block-145), [146](#block-146).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-buttonchk"></a>

### `BUTTONCHK` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 125, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-125) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. BUTTONCHK branches on HITYET; after contact, CMSW selects computer control and enters a protected proximity test.

```terse
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

**Declaration:** [125:1](#block-125) (native word / kernel binding).

**Source usage:** [125](#block-125), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chkcaught"></a>

### `CHKCAUGHT` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 116, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-116) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Declare cross-screen labels, return during WALK, preserve IY/IX, clear flags through the zero accumulator and set NORUN.

```terse
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
```

**Declaration:** [116:2](#block-116) (native word / kernel binding).

**Source usage:** [116](#block-116), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chkgrounder"></a>

### `CHKGROUNDER` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 253, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-253) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. CHKGROUNDER returns unless GRNDR is set, advances/wraps GRNDRVALUE across thirteen entries, chooses/sign-adjusts the offset and adds it to HL; continue.

```terse
CODE CHKGROUNDER ( if grounder adjust ball direction )
GRNDR LDA, A ANA, RZ,
GRNDRVALUE LDA, A INR, 0D CPI, >=, IF, A XRA, THEN,
GRNDRVALUE STA, H PUSH, GVTBL H LXI, ' INDEXW CALL,
VXH X A LDX, 0A0 CPI, ' COMPDE CC, H POP, D DAD, RET,
```

**Declaration:** [253:5](#block-253) (native word / kernel binding).

**Source usage:** [253](#block-253), [257](#block-257).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chkscrtime"></a>

### `CHKSCRTIME` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 114, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-114) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Disable interrupts and preserve IX. For outfield hits use PLAYON and advance it by VLENGTH unless already at R4 or in the double-play special case; for infield hits use R1.

```terse
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

**Declaration:** [114:5](#block-114) (native word / kernel binding).

**Source usage:** [114](#block-114), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-clrblst"></a>

### `CLRBLST` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 179, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-179) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. CLRBLST resets ball and strike bytes to ASCII zero ($30), returns to TERSE and continues loading.

```terse
CODE CLRBLST 30 A MVI, BALLS STA, STRIKES STA, NEXT
```

**Declaration:** [179:13](#block-179) (native word / kernel binding).

**Source usage:** [179](#block-179), [180](#block-180), [181](#block-181), [182](#block-182).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cnline"></a>

### `cnline` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 270, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-270) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. cnline preserves BC/IY/IX and the interrupt-enable state captured by LD A,I, calls the line VECTOR routine under DI, restores registers and conditionally EI, then continues loading.

```terse
CODE cnline ( calls vector line write )
B PUSH, Y PUSHX, X PUSHX, 0ED B, 57 B, PSW PUSH, DI,
VECTOR CALL, PSW POP, X POPX, Y POPX, B POP,
PE, IF, EI, THEN, NEXT
```

**Declaration:** [270:10](#block-270) (native word / kernel binding).

**Source usage:** [270](#block-270), [271](#block-271).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-compde"></a>

### `COMPDE` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 233, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Save radix and select hex. COMPHL forms two's complement of HL; COMPDE applies the same operation to DE while preserving HL.

```terse
CODE COMPDE H PUSH, XCHG, ' COMPHL CALL, XCHG, H POP, RET,
```

**Declaration:** [233:4](#block-233) (native word / kernel binding).

**Source usage:** [231](#block-231), [233](#block-233), [253](#block-253).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-comphl"></a>

### `COMPHL` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 233, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Save radix and select hex. COMPHL forms two's complement of HL; COMPDE applies the same operation to DE while preserving HL.

```terse
CODE COMPHL ( compliments HL )
H A MOV, CMA, A H MOV, L A MOV, CMA, A L MOV, H INX, RET,
```

**Declaration:** [233:2](#block-233) (native word / kernel binding).

**Source usage:** [174](#block-174), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [261](#block-261).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-count"></a>

### `COUNT` — CODE

**Stack:** `( address -- address+1 length )`. **DNA documentation:** TERSE Standard Glossary.

**Source:** [block 276, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native counted-string helper at $00E6; used to obtain the address/length for PPOST.

```terse
ROMHERE @ 0E6 ROMHERE ! CODE COUNT ROMHERE !
( COUNT uses the native counted-string routine )

```

**Declaration:** [276:2](#block-276) (native word / kernel binding).

**Source usage:** [248](#block-248), [276](#block-276).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cpost"></a>

### `cpost` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 246, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-246) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Define SMFONT and ZEROSP option-bit positions and document cpost's retained X/Y/options return values.

```terse
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

**Declaration:** [246:4](#block-246) (native word / kernel binding).

**Source usage:** [246](#block-246), [248](#block-248), [249](#block-249).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-deactivate"></a>

### `DEACTIVATE` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 190, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-190) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. DEACTIVATE clears VACT in the IX vector record and sets SAMEDLT so playaction loading can retain existing motion; return and continue.

```terse
CODE DEACTIVATE ( reset active bit in status )
VACT VSTATUS X RESX, 1 A MVI, SAMEDLT STA, RET,
```

**Declaration:** [190:4](#block-190) (native word / kernel binding).

**Source usage:** [190](#block-190), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-di"></a>

### `DI` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 292, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-292) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Target disable-interrupts primitive at $0243.

```terse
ROMHERE @ HEX 0243 ROMHERE ! CODE DI
```

**Declaration:** [89:9](#block-89) (native word / kernel binding), [292:4](#block-292) (native word / kernel binding).

**Source usage:** [89](#block-89), [121](#block-121), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [133](#block-133), [214](#block-214), [236](#block-236), [238](#block-238), [273](#block-273), [292](#block-292), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-divhlby4"></a>

### `DIVHLBY4` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 234, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-234) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. DIVHLBY4 records the sign, negates to absolute magnitude, shifts right twice and reapplies the sign; this truncates the magnitude before sign restoration.

```terse
CODE DIVHLBY4 ( divide HL by 4 )
7 H BIT, PSW PUSH, ( dir )
' COMPHL CNZ, ( abs dy )
H SRLR, L RARR, H SRLR, L RARR, ( /4 )
PSW POP, ' COMPHL CNZ, RET,
```

**Declaration:** [234:2](#block-234) (native word / kernel binding).

**Source usage:** [234](#block-234), [257](#block-257).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-do"></a>

### `DO` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.

**Source:** [block 276, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native counted-loop entry at $0176.

```terse
ROMHERE @ 0176 ROMHERE ! CODE DO
```

**Declaration:** [276:5](#block-276) (native word / kernel binding).

**Source usage:** [10](#block-10), [98](#block-98), [99](#block-99), [121](#block-121), [181](#block-181), [212](#block-212), [213](#block-213), [236](#block-236), [238](#block-238), [248](#block-248), [249](#block-249), [273](#block-273), [276](#block-276), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dstcalc"></a>

### `DSTCALC` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 230, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-230) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Save radix, declare labels and document the register interface: destination X in HL, Y in DE, speed in A; result Y delta in HL, X delta in DE and pattern/magic in BC.

```terse
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

**Declaration:** [230:3](#block-230) (native word / kernel binding).

**Source usage:** [173](#block-173), [192](#block-192), [194](#block-194), [195](#block-195), [198](#block-198), [230](#block-230).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dstld"></a>

### `DSTLD` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 232, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-232) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. DSTLD reads VDSTX and VDSTY low/high bytes into HL and DE and returns natively.

```terse
CODE DSTLD
VDSTXH X H LDX, VDSTXL X L LDX, VDSTYH X D LDX,
VDSTYL X E LDX,
RET,
```

**Declaration:** [232:1](#block-232) (native word / kernel binding).

**Source usage:** [192](#block-192), [194](#block-194), [232](#block-232).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ei"></a>

### `EI` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 292, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-292) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Target enable-interrupts primitive at $0246.

```terse
0246 ROMHERE ! CODE EI 0249 ROMHERE ! CODE SWAN
ROMHERE !








( VGS screen handeling verbs INTCOMMERCIAL , FILL , SCRERASE )
```

**Declaration:** [89:10](#block-89) (native word / kernel binding), [292:5](#block-292) (native word / kernel binding).

**Source usage:** [89](#block-89), [121](#block-121), [129](#block-129), [131](#block-131), [133](#block-133), [214](#block-214), [236](#block-236), [238](#block-238), [273](#block-273), [274](#block-274), [292](#block-292), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-eidi"></a>

### `EIDI` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 304, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-304) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. EIDI executes EI then DI, providing the Z80 interrupt opportunity used by callers. DTC selects decimal and invokes the host editor.

```terse
CODE EIDI EI, DI, NEXT
```

**Declaration:** [304:6](#block-304) (native word / kernel binding).

**Source usage:** [128](#block-128), [130](#block-130), [274](#block-274), [275](#block-275), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-emusic"></a>

### `EMUSIC` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 145, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-145) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. EMUSIC selects ENDMUSIC and initializes timing/repetition to one; it is intended for startup.

```terse
CODE EMUSIC 0 ENDMUSIC H LXI, loadpc CALL, 1 A MVI, NOTETIMER
STA, MULTIPLE STA, NEXT ( CALL EMUSIC AS AN INIT IN PROGRAM )
```

**Declaration:** [145:4](#block-145) (native word / kernel binding).

**Source usage:** [133](#block-133), [145](#block-145).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ex"></a>

### `EX` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 234, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-234) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. EX emits $C9 (RET) before NEXT, allowing an address on the parameter stack to become a native execution transfer in this target implementation.

```terse
CODE EX C9 B, NEXT
```

**Declaration:** [234:1](#block-234) (native word / kernel binding).

**Source usage:** [33](#block-33), [94](#block-94), [157](#block-157), [158](#block-158), [184](#block-184), [234](#block-234), [239](#block-239).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fill"></a>

### `FILL` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 293, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-293) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native byte fill at $0253, called as value/address/count in this source.

```terse
ROMHERE @ HEX 0253 ROMHERE ! CODE FILL ROMHERE !



```

**Declaration:** [293:4](#block-293) (native word / kernel binding).

**Source usage:** [273](#block-273), [293](#block-293).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-flddst"></a>

### `FLDDST` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 194, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-194) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. FLDDST calculates motion at speed 4. On pitcher arrival select STPT and initialize pitch/timeout/outfield-control state; other arrivals select STND.

```terse
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

**Declaration:** [194:1](#block-194) (native word / kernel binding).

**Source usage:** [194](#block-194), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-flshoff"></a>

### `FLSHOFF` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 239, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. FLSHOFF disables flashing and services cleanup under DI. DOCHGS flashes CHANGE SIDES during a delay, stops it and clears GAMEOVER; continue.

```terse
CODE FLSHOFF B PUSH, A XRA, FLSHON STA, DI, FLSHWUP CALL,
B POP, NEXT
```

**Declaration:** [239:10](#block-239) (native word / kernel binding).

**Source usage:** [128](#block-128), [181](#block-181), [239](#block-239), [240](#block-240).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fmirror"></a>

### `FMIRROR` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 207, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-207) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. FMIRROR selects expansion/magic settings and copies $50 bytes per row through the magic-write area for $C0 rows, reversing horizontal byte order.

```terse
CODE FMIRROR B PUSH, 0C A MVI, XPAND OUT,
50 A MVI, MAGIC OUT, 0C050 D LXI, 4000 B LXI,
4F H LXI, BEGIN, D PUSH, H PUSH, BEGIN, B LDAX,
A M MOV, H DCX, B INX, E DCR, 0=, END,
H POP, 50 D LXI, D DAD, D POP, D DCR, 0=, END,
B POP, NEXT DECIMAL ;S



( Native RAM fill; palette interrupts remain enabled ) HEX
FORWARD IFMAIN FORWARD IFMOUND
```

**Declaration:** [207:7](#block-207) (native word / kernel binding).

**Source usage:** [207](#block-207), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hitrun"></a>

### `HITRUN` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 167, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-167) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Declare HRRET, define HITRUN, clear OFTBLGO so ordinary runners do not automatically advance two bases, and preserve BC.

```terse
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

**Declaration:** [167:2](#block-167) (native word / kernel binding).

**Source usage:** [158](#block-158), [167](#block-167), [182](#block-182).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-homerchk"></a>

### `HOMERCHK` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 159, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-159) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. HOMERCHK takes stacked random values, hit class and coordinates, swaps register banks and derives FNCY/FNCX perturbations.

```terse
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

**Declaration:** [159:1](#block-159) (native word / kernel binding).

**Source usage:** [159](#block-159), [161](#block-161).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-i"></a>

### `I` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 276, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native loop-index access at $01BF.

```terse
01BF ROMHERE ! CODE I
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

**Declaration:** [276:7](#block-276) (native word / kernel binding).

**Source usage:** [10](#block-10), [98](#block-98), [99](#block-99), [248](#block-248), [249](#block-249), [276](#block-276).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-iex"></a>

### `IEX` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 291, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. IEX restores saved registers, enables interrupts and returns. INEXT emits a jump to IEX; continue loading.

```terse
CODE IEX PSW POP, B POP, D POP, H POP, EXX, EXAF,
PSW POP, B POP, D POP, H POP, EI, RET,
```

**Declaration:** [291:11](#block-291) (native word / kernel binding).

**Source usage:** [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-indexw"></a>

### `INDEXW` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 234, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-234) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. INDEXW preserves A/flags, calculates HL+2*A, loads the selected cell in DE, restores HL to the entry start and returns; continue.

```terse
CODE INDEXW ( call routine A- disp HL- table add )
( for indexing into table only )
PSW PUSH, A SLAR, ( 2* A )
L ADD, A L MOV, 0 A MVI, H ADC, A H MOV,
M E MOV, H INX, M D MOV, H DCX, PSW POP, RET,
```

**Declaration:** [234:7](#block-234) (native word / kernel binding).

**Source usage:** [117](#block-117), [120](#block-120), [123](#block-123), [159](#block-159), [164](#block-164), [167](#block-167), [197](#block-197), [200](#block-200), [201](#block-201), [202](#block-202), [234](#block-234), [253](#block-253), [258](#block-258), [259](#block-259), [265](#block-265).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-infield"></a>

### `INFIELD` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 208, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-208) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Declare row-loop labels, preserve BC/IX, point IX to INFP and initialize the destination row and span endpoint state. Each INFP byte feeds IFSPAN.

```terse
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

**Declaration:** [208:2](#block-208) (native word / kernel binding).

**Source usage:** [208](#block-208), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-infldact"></a>

### `INFLDACT` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 237, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE.

```terse
CODE INFLDACT ( set infielders active )
VSTATUS PT H LXI, 5 A MVI, ' SETACT CALL, RET,
```

**Declaration:** [237:5](#block-237) (native word / kernel binding).

**Source usage:** [237](#block-237).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-istart"></a>

### `ISTART` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 292, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-292) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. ISTART disables interrupts, pops a schedule pointer into IPNT, programs INMOD/INFBK and the Z80 I register, selects IM 2 and re-enables interrupts before NEXT.

```terse
CODE ISTART DI, H POP, IPNT SHLD, 8 A MVI, INMOD OUT,
IPNT { SWAB } A MVI, STAI, IPNT A MVI,
INFBK OUT, IM2, EI, NEXT
```

**Declaration:** [292:1](#block-292) (native word / kernel binding).

**Source usage:** [289](#block-289), [292](#block-292).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-killof"></a>

### `KILLOF` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 236, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-236) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. KILLOF zeroes OF deltas, selects standing animation and clears OFTBLGO.

```terse
CODE KILLOF ( stop outfield tractor ball control )
0 H LXI, OFDX SHLD, OFDY SHLD, STND H LXI, OFPA SHLD,
A XRA, OFTBLGO STA, RET,
```

**Declaration:** [236:4](#block-236) (native word / kernel binding).

**Source usage:** [126](#block-126), [193](#block-193), [236](#block-236), [263](#block-263).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-loadanm"></a>

### `LOADANM` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 200, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-200) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. LOADANM copies magic and animation-group fields from the stream into the IX vector record, selects PATTERNS and returns the advanced stream pointer; continue.

```terse
CODE LOADANM ( loads magic & anm HL-top of playact table )
( IX-proper vector add )
M A MOV, A VMAGIC X STX, ( load magic )
H INX, M A MOV, H PUSH, PATTERNS H LXI, ' INDEXW CALL,
D VANMH X STX, E VANML X STX, ( load anm )
H POP, ( pc ) H INX, RET, ( returns updated pc in HL )
```

**Declaration:** [200:9](#block-200) (native word / kernel binding).

**Source usage:** [200](#block-200), [201](#block-201).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-loop"></a>

### `LOOP` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.

**Source:** [block 276, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-276) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native counted-loop continuation at $0191.

```terse
0191 ROMHERE ! CODE LOOP
```

**Declaration:** [276:6](#block-276) (native word / kernel binding).

**Source usage:** [10](#block-10), [98](#block-98), [99](#block-99), [121](#block-121), [181](#block-181), [212](#block-212), [213](#block-213), [236](#block-236), [238](#block-238), [248](#block-248), [249](#block-249), [273](#block-273), [276](#block-276), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-multhlby4"></a>

### `MULTHLBY4` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 236, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-236) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. MULTHLBY4 multiplies the magnitude of HL by four through shifts, then restores its sign.

```terse
CODE MULTHLBY4
7 H BIT, PSW PUSH, ' COMPHL CNZ, L SLAR, H RALR,
L SLAR, H RALR, PSW POP, ' COMPHL CNZ, RET,
```

**Declaration:** [236:1](#block-236) (native word / kernel binding).

**Source usage:** [236](#block-236), [258](#block-258), [261](#block-261).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-muscpu"></a>

### `MUSCPU` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 143, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Declare cross-screen dispatch labels and begin assembling MUSCPU.

```terse
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

**Declaration:** [143:10](#block-143) (native word / kernel binding).

**Source usage:** [143](#block-143), [268](#block-268).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ndup"></a>

### `NDUP` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 294, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-294) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native multi-cell stack duplication helper bound to $0260, used by OUTLINE.

```terse
ROMHERE @ HEX 0260 ROMHERE ! CODE NDUP ROMHERE !













( HIGH SPEED RANDOM NUMBER - native kernel binding )
HEX VPTR @ 07C06 VPTR ! 2 ARRAY RND# VPTR !
```

**Declaration:** [294:1](#block-294) (native word / kernel binding).

**Source usage:** [272](#block-272), [294](#block-294).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-offfdst"></a>

### `OFFFDST` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 195, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-195) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. OFFFDST schedules a take-field delay for outfielders, chooses an exit side from team/runner status and calls DSTCALC for the off-field destination.

```terse
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

**Declaration:** [195:2](#block-195) (native word / kernel binding).

**Source usage:** [195](#block-195), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ofldtbl"></a>

### `OFLDTBL` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 124, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-124) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. OFLDTBL gives all three outfielders OFTBLPA, activates them and returns; continue.

```terse
CODE OFLDTBL OFTBLPA H LXI, A XRA, OFTOTBL STA,
DI, VPLAYACTPC RF SHLD, VPLAYACTPC CF SHLD, VPLAYACTPC LF SHLD,
' OUTFLDACT CALL, EI, RET,
```

**Declaration:** [124:12](#block-124) (native word / kernel binding).

**Source usage:** [124](#block-124), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ofmotion"></a>

### `OFMOTION` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 199, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-199) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. OFMOTION selects OFPA and deactivates a standing outfielder.

```terse
CODE OFMOTION ( set pc for ram pa table -tractor ball )
OFPA { 1+ } LDA, 4 CPI, ( stnd ? )
=, IF, VACT VSTATUS X RESX, THEN,
OFPA H LXI, VECTPC SHLD, RET,
```

**Declaration:** [199:1](#block-199) (native word / kernel binding).

**Source usage:** [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-on1st"></a>

### `ON1ST` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 191, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-191) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue.

```terse
CODE ON1ST X PUSHX, H POP, FLDON1ST SHLD, RET,
```

**Declaration:** [191:5](#block-191) (native word / kernel binding).

**Source usage:** [191](#block-191), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-on2nd"></a>

### `ON2ND` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 191, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-191) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue.

```terse
CODE ON2ND X PUSHX, H POP, FLDON2ND SHLD, RET,
```

**Declaration:** [191:6](#block-191) (native word / kernel binding).

**Source usage:** [191](#block-191), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-on3rd"></a>

### `ON3RD` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 191, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-191) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. ON1ST/ON2ND/ON3RD save IX into the corresponding defender-pointer cell; continue.

```terse
CODE ON3RD X PUSHX, H POP, FLDON3RD SHLD, RET,
```

**Declaration:** [191:7](#block-191) (native word / kernel binding).

**Source usage:** [191](#block-191), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-opcodechk"></a>

### `OPCODECHK` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 200, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-200) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. OPCODECHK treats bytes below $28 as commands, saves the next stream address in VECTPC, indexes OPTBL after adjusting the command index, dispatches via a synthetic native return and reloads VECTPC.

```terse
CODE OPCODECHK ( called by plyactupdate ) <ASSEMBLE
M A MOV, 28 CPI, <, A DCR, A DCR, ( check if opcode )
IF, H INX, VECTPC SHLD, ( save pc )
OPTBL H LXI, ' INDEXW CALL, ( which opcode )
OPRET H LXI, H PUSH, ( save ret add. ) XCHG, ( H-opcd )
PCHL, LABEL OPRET ( ex opcode return here )
VECTPC LHLD, THEN, RET, ASSEMBLE>
```

**Declaration:** [200:2](#block-200) (native word / kernel binding).

**Source usage:** [200](#block-200), [201](#block-201).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-outfldact"></a>

### `OUTFLDACT` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 237, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. INFLDACT activates five infielders; OUTFLDACT activates three outfielders; ALLFLDACT calls both and returns to TERSE.

```terse
CODE OUTFLDACT ( sets outfielders active )
VSTATUS LF H LXI, 3 A MVI, ' SETACT CALL, RET,
```

**Declaration:** [237:7](#block-237) (native word / kernel binding).

**Source usage:** [124](#block-124), [173](#block-173), [176](#block-176), [237](#block-237).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pactload"></a>

### `PACTLOAD` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 201, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-201) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. PACTLOAD fetches VPLAYACTPC, services a command and either skips the existing movement fields for SAMEDLT or calls LOADANM.

```terse
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

**Declaration:** [201:6](#block-201) (native word / kernel binding).

**Source usage:** [201](#block-201), [203](#block-203).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-patfetch"></a>

### `PATFETCH` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 202, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-202) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. PATFETCH selects normal phase limits or a longer pitcher pre-hit sequence.

```terse
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

**Declaration:** [202:1](#block-202) (native word / kernel binding).

**Source usage:** [202](#block-202), [203](#block-203).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-perspective"></a>

### `PERSPECTIVE` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 255, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-255) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. PERSPECTIVE compares integer Y against its thresholds and chooses size index 0–4.

```terse
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

**Declaration:** [255:3](#block-255) (native word / kernel binding).

**Source usage:** [255](#block-255), [266](#block-266).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-playact"></a>

### `PLAYACT` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 203, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-203) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Preserve BC/IX, select the vector and fetch a new action when VUPDATE# is zero.

```terse
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

**Declaration:** [203:1](#block-203) (native word / kernel binding).

**Source usage:** [203](#block-203), [266](#block-266), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pmusic"></a>

### `PMUSIC` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 145, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-145) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. PMUSIC installs a stream unconditionally and sets priority, repeat count and note timer. 

```terse
CODE PMUSIC H POP, loadpc CALL, 1 A MVI, MULTIPLE STA,
PRIORITY STA, NOTETIMER STA, NEXT
```

**Declaration:** [145:6](#block-145) (native word / kernel binding).

**Source usage:** [145](#block-145), [146](#block-146).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ptautotm"></a>

### `PTAUTOTM` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 238, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. PTAUTOTM decrements TIMEOUT only when field clearing is idle; WUPWRT calls it and draws the currently batting team label.

```terse
CODE PTAUTOTM ( pitch auto timer )
TIMEOUT H LXI, FLDCLR LDA, A ANA, TIMEDCR CZ, NEXT
```

**Declaration:** [238:4](#block-238) (native word / kernel binding).

**Source usage:** [238](#block-238).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-resetrunners"></a>

### `RESETRUNNERS` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 115, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-115) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Declare copy-path labels, enter assembly, and set a four-pass loop while saving the loop accumulator/flags.

```terse
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

**Declaration:** [115:2](#block-115) (native word / kernel binding).

**Source usage:** [115](#block-115), [122](#block-122).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rnd"></a>

### `RND` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 295, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-295) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native random-range helper at $0275.

```terse
ROMHERE @ 0275 ROMHERE ! CODE RND ROMHERE !












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
```

**Declaration:** [295:2](#block-295) (native word / kernel binding).

**Source usage:** [132](#block-132), [143](#block-143), [158](#block-158), [161](#block-161), [162](#block-162), [169](#block-169), [295](#block-295).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rundst"></a>

### `RUNDST` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 196, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-196) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Declare its cross-screen branch labels and enter RUNDST assembly.

```terse
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

**Declaration:** [196:3](#block-196) (native word / kernel binding).

**Source usage:** [196](#block-196), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sentry"></a>

### `SENTRY` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 132, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-132) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. SENTRY preserves BC, polls the request flags and conditionally calls button, pitch, outfield, throw, hit, catch, scoring and music routines.

```terse
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

**Declaration:** [132:4](#block-132) (native word / kernel binding).

**Source usage:** [132](#block-132), [133](#block-133).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-setact"></a>

### `SETACT` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 237, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-237) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. SETACT takes the first status address in HL and count in A, setting VACT at VLENGTH-byte strides.

```terse
CODE SETACT ( sets avtive bit in status )
( in HL-status 1st guy A- # of guys )
VLENGTH D LXI,
BEGIN, VACT M SET, D DAD, A DCR, 0=, END, RET,
```

**Declaration:** [237:1](#block-237) (native word / kernel binding).

**Source usage:** [237](#block-237).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-startmusic"></a>

### `STARTMUSIC` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 124, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-124) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. STARTMUSIC clears its request. CHEERME selects crowd cheer and normal palette setup; otherwise choose fence or homer cannon music, with the homer palette schedule when needed.

```terse
CODE STARTMUSIC A XRA, STMUSIC STA,
CHEERME LDA, A ANA, 0<>, IF, DOVERB MYAH A XRA, CHEERME STA,
DOVERB S10 7 A MVI, 1 OUT, 2 OUT, 3 OUT, A XRA, 0 OUT, 4 OUT,
ELSE, HOMERUN LDA, A ANA, 0=, IF, DOVERB MFENCE
ELSE, DOVERB MCANNON DOVERB S11 THEN, THEN, RET,
```

**Declaration:** [124:6](#block-124) (native word / kernel binding).

**Source usage:** [124](#block-124), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-strtline"></a>

### `strtline` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 271, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-271) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. strtline converts the X representation for relabs, derives BIT-POS and sets the actual framebuffer address SADR by adding $4000.

```terse
CODE strtline ( given X Y sets up start of line )
H POP, ( y ) D POP, ( x ) E SLAR, D RALR, E SLAR, D RALR,
E SLAR, D RALR, E SLAR, D RALR, E SLAR, D RALR,
E SLAR, D RALR, ( adjust x for relabs ) B PUSH,
0 C MVI,
relabs CALL, 3 ANI, BIT-POS STA, 4000 D LXI, D DAD,
SADR SHLD, B POP, NEXT
```

**Declaration:** [271:1](#block-271) (native word / kernel binding).

**Source usage:** [271](#block-271).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swan"></a>

### `SWAN` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 292, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-292) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native nibble-swap binding used to post the high BCD digit before the low digit.

```terse
0246 ROMHERE ! CODE EI 0249 ROMHERE ! CODE SWAN
ROMHERE !








( VGS screen handeling verbs INTCOMMERCIAL , FILL , SCRERASE )
```

**Declaration:** [292:5](#block-292) (native word / kernel binding).

**Source usage:** [249](#block-249), [292](#block-292).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-tballpitch"></a>

### `TBALLPITCH` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 177, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-177) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. TBALLPITCH adjusts TBALLYSR using signed Y input, clamps the positive progression to three and avoids reducing the negative-side state below the shown threshold; store the resulting cell in TBLDY.

```terse
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

**Declaration:** [177:1](#block-177) (native word / kernel binding).

**Source usage:** [132](#block-132), [177](#block-177).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-throwanim"></a>

### `THROWANIM` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 119, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-119) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Preserve IX/IY, disable interrupts, select WHOTHROWS, clear throw-animation state and velocity, and copy the thrower's coordinates into BL with the shown X adjustment.

```terse
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

**Declaration:** [119:3](#block-119) (native word / kernel binding).

**Source usage:** [119](#block-119), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-throwball"></a>

### `THROWBALL` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 122, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-122) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. THROWBALL waits while scoring is clearing, resets THROWTIME, selects BAL and, for a pitch, copies pitcher coordinates into BL with offsets under DI.

```terse
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

**Declaration:** [122:5](#block-122) (native word / kernel binding).

**Source usage:** [122](#block-122), [132](#block-132).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-thwanmset"></a>

### `THWANMSET` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 191, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-191) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. THWANMSET saves the IX entity as WHOTHROWS, erases the ball and sets INAIR/THROWANM for the foreground sentry.

```terse
CODE THWANMSET ( set up throw animation )
X PUSHX, H POP, WHOTHROWS SHLD, ( save who throws )
BLERASE CALL, 1 A MVI, INAIR STA,
THROWANM STA, RET, ( set for sentry call )
```

**Declaration:** [191:1](#block-191) (native word / kernel binding).

**Source usage:** [191](#block-191), [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-timer"></a>

### `TIMER` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 254, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-254) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. TIMER turns THROWTIMER expiry into THROWTIME.

```terse
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

**Declaration:** [254:1](#block-254) (native word / kernel binding).

**Source usage:** [254](#block-254), [268](#block-268).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-vector"></a>

### `VECTOR` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 257, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-257) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Choose ordinary or restricted outfielder Y bounds, load X and divide its X delta by four for the horizontal resolution before adding it.

```terse
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

**Declaration:** [257:1](#block-257) (native word / kernel binding), [283:3](#block-283) (assembler label), [281:1](#block-281) (forward declaration).

**Source usage:** [257](#block-257), [266](#block-266), [267](#block-267), [270](#block-270), [281](#block-281), [283](#block-283).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-verase"></a>

### `VERASE` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 252, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-252) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. VERASE reads expansion/magic and pattern, skips its relative offsets to the size header and loads VSCRADR.

```terse
CODE VERASE ( does pattern board erase from vector IX )
VXPAND X B LDX, VMAGIC X C LDX, VPATH X H LDX, VPATL X L LDX,
H INX, H INX, ( abs ) H PUSH, Y POPX,
VSCRADRH X H LDX, VSCRADRL X L LDX,
writep CALL, RET,
```

**Declaration:** [252:1](#block-252) (native word / kernel binding).

**Source usage:** [238](#block-238), [252](#block-252), [266](#block-266), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-vwrite"></a>

### `VWRITE` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 251, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-251) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. VWRITE reads expansion/magic, X/Y and VPAT, converts relative offsets and calculates the magic-write destination.

```terse
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

**Declaration:** [251:1](#block-251) (native word / kernel binding).

**Source usage:** [251](#block-251), [266](#block-266), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-wait"></a>

### `WAIT` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 236, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-236) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. WAIT runs nested accumulator countdowns and returns natively.

```terse
CODE WAIT ( given A wait period stop every thing )
BEGIN, PSW PUSH, 0FF A MVI, BEGIN, A DCR, 0=, END,
PSW POP, A DCR, 0=, END, RET,
```

**Declaration:** [236:7](#block-236) (native word / kernel binding).

**Source usage:** [236](#block-236), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-waitthrw"></a>

### `WAITTHRW` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 199, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-199) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. WAITTHRW starts throw setup, then for most occupancy cases defers THROWANM with a WAITTHROW timer.

```terse
CODE WAITTHRW ( sets flag for 1stbaseman to wait throw )
' THWANMSET CALL, BASESTATUS LDA, 5 CPI, RZ, A XRA,
THROWANM STA, 20 A MVI, WAITTHROW STA, RET,
```

**Declaration:** [199:5](#block-199) (native word / kernel binding).

**Source usage:** [199](#block-199).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-write"></a>

### `WRITE` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 244, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-244) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Document WRITE's stack arguments. The WRTSYS comment describes historical options; this body calls software write directly.

```terse
CODE WRITE ( write with X Y sizes ; pattern with no header )
( in- x , y , patadr , y/x size ex/mag )
( WRTSYS set for pattern board res for software write )
( out- pattern on screen )
Y PUSHX, H POP, EXX, B POP, ( ex/mag ) H POP, ( sizes )
Y POPX, ( patadr ) D POP, ( Y ) XTHL, ( H<-X S<-sizes )
XCHG, ( X<-Y ) relabs CALL, D POP, ( sizes )
write CALL, EXX, H PUSH, Y POPX, NEXT
```

**Declaration:** [244:5](#block-244) (native word / kernel binding).

**Source usage:** [121](#block-121), [130](#block-130), [244](#block-244).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-writr"></a>

### `WRITR` — CODE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 245, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-245) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native word / kernel binding. Document the stack interface and output. The heading says WRITER, but the actual defined name is WRITR.

```terse
CODE WRITR ( write with a relative pattern )
( in- x , y , relpatadr , ex/mag )
( WRTSYS set for pattern board res for software write )
( out- pattern on screen )
Y PUSHX, H POP, EXX, B POP, Y POPX, H POP, D POP,
reloff CALL, relabs CALL,
writep CALL, EXX, H PUSH, Y POPX, NEXT
```

**Declaration:** [245:1](#block-245) (native word / kernel binding).

**Source usage:** [127](#block-127), [245](#block-245), [274](#block-274).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-autor1"></a>

### `AUTOR1` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 235, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

```terse
SUBR AUTOR1 3 A MVI, VRSTAT R1 STA, 81 A MVI, VSTATUS R1 STA,
RET, ( sets vauto , vforw , vact , vrun )
```

**Declaration:** [235:1](#block-235) (native subroutine).

**Source usage:** [163](#block-163), [165](#block-165), [166](#block-166), [235](#block-235).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-autor2"></a>

### `AUTOR2` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 235, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

```terse
SUBR AUTOR2 3 A MVI, VRSTAT R2 STA, 81 A MVI, VSTATUS R2 STA,
RET,
```

**Declaration:** [235:3](#block-235) (native subroutine).

**Source usage:** [163](#block-163), [165](#block-165), [166](#block-166), [235](#block-235).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-autor3"></a>

### `AUTOR3` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 235, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. AUTOR1/2/3 set VRSTAT=3 and VSTATUS=$81 for their respective runners.

```terse
SUBR AUTOR3 3 A MVI, VRSTAT R3 STA, 81 A MVI, VSTATUS R3 STA,
RET,
```

**Declaration:** [235:5](#block-235) (native subroutine).

**Source usage:** [163](#block-163), [166](#block-166), [235](#block-235).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-blerase"></a>

### `BLERASE` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 238, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-238) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. BLERASE preserves IX, selects BL, erases it, clears active status and replaces its pattern with NOBOD.

```terse
SUBR BLERASE ( erases ball )
X PUSHX, VMAGIC BL X LXIX, ' VERASE CALL, VACT VSTATUS X RESX,
X POPX, ( stop ball ) NOBOD H LXI, VPAT BL SHLD, RET,
```

**Declaration:** [238:1](#block-238) (native subroutine).

**Source usage:** [180](#block-180), [191](#block-191), [238](#block-238), [258](#block-258), [263](#block-263).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chkatbs"></a>

### `CHKATBS` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 119, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-119) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. CHKATBS tests active/at-base bits and increments E when a player is active away from base.

```terse
SUBR CHKATBS ( check if active player at base in- A vstatus )
VACT A BIT, RZ, VATBS A BIT, RNZ, E INR, RET,
```

**Declaration:** [119:1](#block-119) (native subroutine).

**Source usage:** [119](#block-119), [120](#block-120).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chkcoin1"></a>

### `CHKCOIN1` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 287, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-287) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. When idle, debounce bit 0 from port $11; on acceptance latch CNTM1, pulse output $20, increment CREDITS, request UPCRED, clear bonus state and play coin music.

```terse
SUBR CHKCOIN1 ( chk door 1 for coin drop )
CNTM1 LDA, A ANA, 0=, IF, ( waiting for coin )
1 A MVI, 1020 D LXI, 11FE H LXI, debounce CALL,
A ANA, RZ, CNTM1 STA, 20 OUT, CREDITS H LXI, M INR,
UPCRED STA, A XRA, SPBON STA, DOVERB MCOIN RET,
```

**Declaration:** [287:1](#block-287) (native subroutine).

**Source usage:** [268](#block-268), [287](#block-287).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-chkcoin2"></a>

### `CHKCOIN2` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 288, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-288) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. CHKCOIN2 debounces bit 1 of port $11, latches CNTM2, pulses output $20 and requests a credit update.

```terse
SUBR CHKCOIN2 ( chk door 2 for coin drop )
CNTM2 LDA, A ANA, 0=, IF, ( waiting for coin )
2 A MVI, 1020 D LXI, 11FD H LXI, debounce CALL,
A ANA, RZ, CNTM2 STA, 20 OUT, UPCRED STA,
CREDITS H LXI, 12 IN, 1 A BIT, 0<>, IF, ( susan b dollar )
M INR, M INR, M INR, M INR, M INR, ELSE,
M INR, THEN,
A XRA, SPBON STA, DOVERB MCOIN RET,
```

**Declaration:** [288:1](#block-288) (native subroutine).

**Source usage:** [268](#block-268), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cmpof"></a>

### `CMPOF` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 173, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-173) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. CMPOF returns if outfield control is inactive; otherwise preserve IX, choose LF/CF/RF from destination X and save CMFLDR.

```terse
SUBR CMPOF ( calculates proper deltas and patterns )
DI, OFTBLGO LDA, A ANA, RZ, X PUSHX,
VDSTXH BL LDA, 1C CPI, >=, IF, 34 CPI, >=, IF, 0 RF X LXIX,
ELSE, 0 CF X LXIX, THEN, ELSE, 0 LF X LXIX, THEN,
CMFLDR SIXD,
VDSTX BL LHLD, VDSTY BL LDED, 20 A MVI, VGO VSTATUS X RESX,
' DSTCALC CALL, OFDX SDED, OFDY SHLD, OFPA SBCD,
' OUTFLDACT CALL, EI, X POPX, RET,
```

**Declaration:** [173:2](#block-173) (native subroutine).

**Source usage:** [173](#block-173), [193](#block-193), [254](#block-254).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-colorband"></a>

### `COLORBAND` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 269, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-269) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. COLORBAND schedules the next INLIN value via IPNT, conditionally changes palette entries, preserves AF/HL and returns with interrupts enabled. Its unusual NEXT/XTHL entry follows the scheduler's calling convention.

```terse
SUBR COLORBAND NEXT XTHL, PSW PUSH, M A MOV, INLIN OUT,
H INX, IPNT SHLD, FLSHSTAY LDA, A ANA, 0=, IF,
6C A MVI, 3 OUT, 7 A MVI, 1 OUT, THEN,
PSW POP, H POP, EI, RET, ( palette only: preserve AF/HL )
```

**Declaration:** [269:1](#block-269) (native subroutine).

**Source usage:** [269](#block-269).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-debounce"></a>

### `debounce` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 286, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-286) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Preserve BC, move the port/mask into working registers and sample `(input XOR expected) AND mask`; return A=1 after enough consecutive matches.

```terse
FORWARD READPORT SUBR debounce <ASSEMBLE
B PUSH, H C MOV, E B MOV, A H MOV, LABEL READPORT
A INP, L XRA, H ANA, 0=, IF, E DCR, 0=, IF, ( good ) A INR,
B POP, RET, THEN, READPORT JMP,
THEN, D DCR, 0=, IF, A XRA, B POP, RET, THEN,
B E MOV, ( try again ) READPORT JMP, ASSEMBLE>


( BB coin routine    CHKCOIN1 )
```

**Declaration:** [286:7](#block-286) (native subroutine).

**Source usage:** [286](#block-286), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fetch"></a>

### `FETCH` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 143, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```terse
SUBR FETCH MUSPC LHLD, M A MOV, RET,
```

**Declaration:** [143:2](#block-143) (native subroutine).

**Source usage:** [143](#block-143), [144](#block-144).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-flshwup"></a>

### `FLSHWUP` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 239, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-239) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. FLSHTON saves a callback and starts its timer. FLSHME executes only a nonzero address whose top two bits are clear; the separate FLSHWUP native subroutine follows on the same line.

```terse
ELSE DROP THEN ; SUBR FLSHWUP ( handle flash callback )
X PUSHX, Y PUSHX,
FLSHCNT H LXI, FLSHON LDA, A ANA, M A MOV, 0<>, IF,
A ANA, 0=, IF, 1 M MVI, 28 A MVI, ELSE, 0 M MVI, 8 A MVI,
THEN, FLSHTIME STA, DOVERB FLSHME
ELSE, A ANA, 0<>, IF, 0 M MVI, DOVERB FLSHME THEN,
THEN, Y POPX, X POPX, RET,
```

**Declaration:** [239:3](#block-239) (native subroutine).

**Source usage:** [239](#block-239), [254](#block-254).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fnbb"></a>

### `FNBB` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 163, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```terse
SUBR FNBB RET,
```

**Declaration:** [163:1](#block-163) (native subroutine).

**Source usage:** [163](#block-163).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fontunpack"></a>

### `FONTUNPACK` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 207, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-207) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Allocate a five-byte FONTWORK buffer. FONTUNPACK reads two packed bytes and starts a five-row unpack loop.

```terse
SUBR FONTUNPACK B PUSH, M E MOV, H INX, M D MOV,
0 FONTWORK H LXI, 5 B MVI, LABEL FNTLP E A MOV, 7 ANI,
RRC, RRC, RRC, A M MOV, H INX,
D SRLR, E RARR, D SRLR, E RARR, D SRLR, E RARR,
FNTLP DJNZ, B POP, 0 FONTWORK H LXI, RET,
```

**Declaration:** [207:2](#block-207) (native subroutine).

**Source usage:** [207](#block-207), [247](#block-247).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fro1"></a>

### `FRO1` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 163, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```terse
SUBR FRO1 AUTOR1 CALL, RET,
```

**Declaration:** [163:2](#block-163) (native subroutine).

**Source usage:** [163](#block-163).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fro12"></a>

### `FRO12` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 163, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```terse
SUBR FRO12 AUTOR1 CALL, AUTOR2 CALL, RET,
```

**Declaration:** [163:5](#block-163) (native subroutine).

**Source usage:** [163](#block-163).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fro123"></a>

### `FRO123` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 163, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```terse
SUBR FRO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL, RET,
```

**Declaration:** [163:7](#block-163) (native subroutine).

**Source usage:** [163](#block-163).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fro13"></a>

### `FRO13` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 163, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```terse
SUBR FRO13 VSTATUS R1 STA, AUTOR2 CALL, RET,
```

**Declaration:** [163:8](#block-163) (native subroutine).

**Source usage:** [163](#block-163).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fro2"></a>

### `FRO2` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 163, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```terse
SUBR FRO2 VSTATUS R1 STA, RET,
```

**Declaration:** [163:3](#block-163) (native subroutine).

**Source usage:** [163](#block-163).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fro23"></a>

### `FRO23` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 163, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```terse
SUBR FRO23 VSTATUS R1 STA, VSTATUS R2 STA, RET,
```

**Declaration:** [163:6](#block-163) (native subroutine).

**Source usage:** [163](#block-163).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fro3"></a>

### `FRO3` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 163, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-163) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Define the no-runner and FRO variants, starting forced runners or writing their status as appropriate. These are native subroutines and return with RET,.

```terse
SUBR FRO3 VSTATUS R1 STA, RET,
```

**Declaration:** [163:4](#block-163) (native subroutine).

**Source usage:** [163](#block-163).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hload"></a>

### `HLOAD` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 143, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```terse
SUBR HLOAD FETCH CALL, INCPC CALL, 0 H MVI, A L MOV, RET,
```

**Declaration:** [143:4](#block-143) (native subroutine).

**Source usage:** [143](#block-143).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ifspan"></a>

### `IFSPAN` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 279, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-279) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Declare labels; IFSPAN preserves the row address, captures the encoded endpoint and derives the optional gap count from its high bit/value.

```terse
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

**Declaration:** [279:2](#block-279) (native subroutine).

**Source usage:** [208](#block-208), [279](#block-279).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-incpc"></a>

### `INCPC` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 143, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```terse
SUBR INCPC MUSPC LHLD, H INX, MUSPC SHLD, RET,
```

**Declaration:** [143:3](#block-143) (native subroutine).

**Source usage:** [143](#block-143), [144](#block-144).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-loadpc"></a>

### `loadpc` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 145, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-145) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. loadpc installs MUSPC and STARTPC. BMUSIC consumes a stream pointer and installs it only when PRIORITY is zero, setting one repetition and clearing the note delay.

```terse
SUBR loadpc MUSPC SHLD, STARTPC SHLD, RET,
```

**Declaration:** [145:1](#block-145) (native subroutine).

**Source usage:** [145](#block-145).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lvrstat"></a>

### `LVRSTAT` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 235, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. LVRSTAT writes A to all four VRSTAT bytes. WALKOVER requests CAUGHT and THROWAROUND when the walk timer completes; continue.

```terse
SUBR LVRSTAT ( load vstat for all runners in- A value )
VRSTAT R1 STA, VRSTAT R2 STA, VRSTAT R3 STA, VRSTAT R4 STA,
RET,
```

**Declaration:** [235:9](#block-235) (native subroutine).

**Source usage:** [116](#block-116), [197](#block-197), [235](#block-235), [263](#block-263).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-nbb"></a>

### `NBB` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 165, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. SETDBLPLAY raises its flag; NBB is the empty-bases no-op.

```terse
SUBR NBB RET,
```

**Declaration:** [165:3](#block-165) (native subroutine).

**Source usage:** [165](#block-165), [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ofblchk"></a>

### `OFBLCHK` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 261, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-261) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. OFBLCHK takes a maximum distance in D, loads BL coordinates and begins with LF in IY for a three-record search.

```terse
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

**Declaration:** [261:1](#block-261) (native subroutine).

**Source usage:** [125](#block-125), [261](#block-261), [263](#block-263).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pcjump"></a>

### `PCJUMP` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 143, line 5](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-143) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. FETCH reads the current command byte, INCPC advances MUSPC, HLOAD reads/advances a byte into HL, and PCJUMP loads MUSPC from the following little-endian address.

```terse
SUBR PCJUMP MUSPC LHLD, M E MOV, H INX, M D MOV,
MUSPC SDED, RET,
```

**Declaration:** [143:5](#block-143) (native subroutine).

**Source usage:** [143](#block-143), [144](#block-144).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-relabs"></a>

### `relabs` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 241, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-241) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. relabs converts Y's integer byte to an 80-byte scanline offset while preserving the expansion/magic settings.

```terse
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

**Declaration:** [241:4](#block-241) (native subroutine).

**Source usage:** [241](#block-241), [244](#block-244), [245](#block-245), [247](#block-247), [251](#block-251), [259](#block-259), [271](#block-271).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-reloff"></a>

### `reloff` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 242, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-242) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. reloff documents its BC/DE/HL/IY interface, loads the X offset and scales it with two arithmetic/right-through-carry shifts.

```terse
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

**Declaration:** [242:1](#block-242) (native subroutine).

**Source usage:** [242](#block-242), [245](#block-245), [251](#block-251), [259](#block-259).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ro1"></a>

### `RO1` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 165, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```terse
SUBR RO1 AUTOR1 CALL, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R2 B LXI, RET,
```

**Declaration:** [165:4](#block-165) (native subroutine).

**Source usage:** [165](#block-165), [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ro12"></a>

### `RO12` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 165, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. RO12 activates both forced runners, selecting a double-play or ordinary target; continue.

```terse
SUBR RO12 AUTOR1 CALL, AUTOR2 CALL,
VMAGIC R2 B LXI, DPHIT LDA, A ANA, SETDBLPLAY JNZ,
VMAGIC R3 B LXI, RET,
```

**Declaration:** [165:10](#block-165) (native subroutine).

**Source usage:** [165](#block-165), [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ro123"></a>

### `RO123` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 166, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-166) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```terse
SUBR RO123 AUTOR1 CALL, AUTOR2 CALL, AUTOR3 CALL,
VMAGIC R3 B LXI, DPHIT LDA, A ANA,
SETDBLPLAY JNZ, VMAGIC R1 B LXI, RET,
```

**Declaration:** [166:4](#block-166) (native subroutine).

**Source usage:** [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ro13"></a>

### `RO13` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 166, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-166) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. RO13 handles first-and-third occupancy and may branch through SETDBLPLAY.

```terse
SUBR RO13 AUTOR2 CALL, DPHIT LDA, A ANA,
VMAGIC R2 B LXI,
0<>, IF, AUTOR1 CALL, SETDBLPLAY JMP, THEN,
VMAGIC R3 B LXI, RET,
```

**Declaration:** [166:7](#block-166) (native subroutine).

**Source usage:** [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ro2"></a>

### `RO2` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 165, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```terse
SUBR RO2 HLSIDE LDA, A ANA, 0=, IF,
AUTOR1 CALL, THEN, VMAGIC R2 B LXI, RET,
```

**Declaration:** [165:6](#block-165) (native subroutine).

**Source usage:** [165](#block-165), [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ro23"></a>

### `RO23` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 166, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-166) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. RO23 and RO123 choose forced advancement and double-play targets for their base combinations.

```terse
SUBR RO23 VMAGIC R3 B LXI, DPHIT LDA, A ANA,
0<>, IF, AUTOR1 CALL, HLSIDE LDA, A ANA, AUTOR2 CZ, THEN,
RET,
```

**Declaration:** [166:1](#block-166) (native subroutine).

**Source usage:** [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ro3"></a>

### `RO3` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 165, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. RO1/RO2/RO3 activate runners according to DPHIT and HLSIDE and return a candidate PLAYON record in BC.

```terse
SUBR RO3 VMAGIC R2 B LXI, DPHIT LDA, A ANA,
AUTOR1 CNZ, RET,
```

**Declaration:** [165:8](#block-165) (native subroutine).

**Source usage:** [165](#block-165), [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-setdblplay"></a>

### `SETDBLPLAY` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 165, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-165) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. SETDBLPLAY raises its flag; NBB is the empty-bases no-op.

```terse
SUBR SETDBLPLAY ( sets up double play HL-guy on 1st )
1 A MVI, DBLPLAY STA, RET,
```

**Declaration:** [165:1](#block-165) (native subroutine).

**Source usage:** [165](#block-165), [166](#block-166).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-takeoff"></a>

### `TAKEOFF` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 164, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-164) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Select hexadecimal, declare the return label and begin TAKEOFF assembly.

```terse
SUBR TAKEOFF ( turn proper runners on ) <ASSEMBLE
BASESTATUS LDA, WBSFTBL H LXI, ' INDEXW CALL, TORET H LXI,
81 A MVI, ( vact & vrun ) H PUSH, ( ret add.) XCHG, PCHL,
LABEL TORET RET, ASSEMBLE>








( BB hit run and throw for infield grounder )
```

**Declaration:** [164:3](#block-164) (native subroutine).

**Source usage:** [164](#block-164), [254](#block-254).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-tballprc"></a>

### `TBALLPRC` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 174, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-174) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. TBALLPRC reads port $13, toggles its axis selector, combines it with PLYR1UP for port $28 and stores the sampled byte in the interleaved TBALL delta area. Continue the routine.

```terse
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

**Declaration:** [174:10](#block-174) (native subroutine).

**Source usage:** [174](#block-174), [268](#block-268).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-tblvel"></a>

### `TBLVEL` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 174, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-174) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Declare labels and define TBLVEL: zero gives zero velocity, small magnitudes give $0080, magnitudes at least three give $01B0, and the original sign is restored with COMPHL.

```terse
SUBR TBLVEL ( tractorball vel HL-# add. D-max vel )
M A MOV, 0 H LXI, A ANA, RZ,
7 A BIT, PSW PUSH, 0<>, IF, NEG, THEN, ( abs. )
80 H LXI, 3 CPI, >=, IF, 1B0 H LXI, THEN,
PSW POP, ' COMPHL CNZ, RET,
```

**Declaration:** [174:2](#block-174) (native subroutine).

**Source usage:** [174](#block-174), [175](#block-175).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-timedcr"></a>

### `TIMEDCR` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 233, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-233) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. TIMEDCR leaves zero timers unchanged; otherwise decrements the byte and returns A=1 only on the transition to zero.

```terse
SUBR TIMEDCR ( HL-timer add if goes to zero return 1 else 0 )
M A MOV, A ANA, RZ, ( allready zero returns false change )
A DCR, A M MOV, A ANA, 0=, IF, A INR, ( true change )
ELSE, A XRA, THEN, RET,
```

**Declaration:** [233:6](#block-233) (native subroutine).

**Source usage:** [233](#block-233), [238](#block-238), [254](#block-254), [255](#block-255).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-toofck"></a>

### `TOOFCK` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 173, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-173) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. TOOFCK decrements TOOF#; while stages remain reload the timeout, otherwise start CMPOF and mark TOOFF. Return to decimal and stop loading.

```terse
SUBR TOOFCK ( time out outfield check )
TOOF# H LXI, M DCR, 0<>, IF, FF A MVI, TOOF STA,
ELSE, CMPOF CALL, EI, 1 A MVI, TOOFF STA, THEN, RET,
```

**Declaration:** [173:10](#block-173) (native subroutine).

**Source usage:** [173](#block-173), [255](#block-255).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-walkover"></a>

### `WALKOVER` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 235, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-235) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. LVRSTAT writes A to all four VRSTAT bytes. WALKOVER requests CAUGHT and THROWAROUND when the walk timer completes; continue.

```terse
SUBR WALKOVER ( walked runner at base )
1 A MVI, CAUGHT STA, THROWAROUND STA, RET,
```

**Declaration:** [235:12](#block-235) (native subroutine).

**Source usage:** [235](#block-235), [254](#block-254).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-write"></a>

### `write` — SUBR

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 243, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-243) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. Document the pointer/size interface and absence of a shifter flush, then output XPAND and MAGIC settings.

```terse
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

**Declaration:** [243:1](#block-243) (native subroutine).

**Source usage:** [243](#block-243), [244](#block-244), [247](#block-247).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-writep"></a>

### `writep` — SUBR

**Stack:** `(IY=patadr BC=ex/mag+shf HL=scradr ---)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 244, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-244) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Native subroutine. writep reads X/Y byte counts through IY and jumps to the shared write loop.

```terse
SUBR writep ( software write with pattern size on pattern )
( IY=patadr BC=ex/mag+shf HL=scradr --- )
0 Y E LDX, ( X size ) Y INXX,
0 Y D LDX, ( Y size ) Y INXX, write JMP,
```

**Declaration:** [244:1](#block-244) (native subroutine).

**Source usage:** [244](#block-244), [245](#block-245), [251](#block-251), [252](#block-252), [259](#block-259).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bal"></a>

### `BAL` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant BAL, assigned source expression/value `628` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
628 CONSTANT BAL 728 CONSTANT SCR
```

**Declaration:** [113:11](#block-113) (constant).

**Source usage:** [113](#block-113), [122](#block-122), [154](#block-154), [213](#block-213), [229](#block-229), [262](#block-262).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bl"></a>

### `BL` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for the ball. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY BL
```

**Declaration:** [216:1](#block-216) (byte array).

**Source usage:** [119](#block-119), [120](#block-120), [122](#block-122), [123](#block-123), [126](#block-126), [154](#block-154), [158](#block-158), [160](#block-160), [161](#block-161), [173](#block-173), [192](#block-192), [193](#block-193), [212](#block-212), [213](#block-213), [216](#block-216), [238](#block-238), [258](#block-258), [261](#block-261), [262](#block-262), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cf"></a>

### `CF` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 3](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for the center fielder. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY CF
```

**Declaration:** [216:3](#block-216) (byte array).

**Source usage:** [124](#block-124), [173](#block-173), [211](#block-211), [212](#block-212), [216](#block-216).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-fontwork"></a>

### `FONTWORK` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 207, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-207) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Byte array. Allocate a five-byte FONTWORK buffer. FONTUNPACK reads two packed bytes and starts a five-row unpack loop.

```terse
5 BARRAY FONTWORK FORWARD FNTLP
```

**Declaration:** [207:1](#block-207) (byte array).

**Source usage:** [207](#block-207).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ipnt"></a>

### `IPNT` — VARIABLE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 291, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-291) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Interrupt schedule pointer programmed/advanced by the generated handlers.

```terse
0 VARIABLE IPNT
```

**Declaration:** [291:2](#block-291) (cell variable).

**Source usage:** [269](#block-269), [291](#block-291), [292](#block-292).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lcb"></a>

### `LCB` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant LCB, assigned source expression/value `368` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
328 CONSTANT RCB 368 CONSTANT LCB ( 3 )
```

**Declaration:** [113:9](#block-113) (constant).

**Source usage:** [113](#block-113), [225](#block-225).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lf"></a>

### `LF` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 4](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for the left fielder. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY LF
```

**Declaration:** [216:4](#block-216) (byte array).

**Source usage:** [124](#block-124), [173](#block-173), [211](#block-211), [212](#block-212), [216](#block-216), [237](#block-237), [261](#block-261).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lfld"></a>

### `LFLD` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant LFLD, assigned source expression/value `168` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
128 CONSTANT RFLD 168 CONSTANT LFLD
```

**Declaration:** [113:7](#block-113) (constant).

**Source usage:** [113](#block-113), [227](#block-227), [228](#block-228).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lrun"></a>

### `LRUN` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant LRUN, assigned source expression/value `68` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
28 CONSTANT RRUN 68 CONSTANT LRUN
```

**Declaration:** [113:6](#block-113) (constant).

**Source usage:** [113](#block-113), [176](#block-176), [226](#block-226), [227](#block-227), [228](#block-228), [231](#block-231).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ltrw"></a>

### `LTRW` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant LTRW, assigned source expression/value `268` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
228 CONSTANT RTRW 268 CONSTANT LTRW ( 2 )
```

**Declaration:** [113:8](#block-113) (constant).

**Source usage:** [113](#block-113), [227](#block-227).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-muspc"></a>

### `MUSPC` — VARIABLE

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 141, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-141) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Current music-bytecode stream pointer.

```terse
0 VARIABLE MUSPC { : MASTER } 10 B, B, { ; } { : ATONE } 11 B,
```

**Declaration:** [141:1](#block-141) (cell variable).

**Source usage:** [141](#block-141), [143](#block-143), [144](#block-144), [145](#block-145).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-nbd"></a>

### `NBD` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant NBD, assigned source expression/value `528` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
428 CONSTANT STND 528 CONSTANT NBD
```

**Declaration:** [113:10](#block-113) (constant).

**Source usage:** [113](#block-113), [192](#block-192), [195](#block-195), [213](#block-213), [225](#block-225).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pt"></a>

### `PT` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for the pitcher. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY PT
```

**Declaration:** [216:9](#block-216) (byte array).

**Source usage:** [119](#block-119), [122](#block-122), [126](#block-126), [153](#block-153), [157](#block-157), [181](#block-181), [211](#block-211), [212](#block-212), [213](#block-213), [216](#block-216), [237](#block-237), [262](#block-262).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-r1"></a>

### `R1` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 13](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for runner slot 1. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY R1
```

**Declaration:** [216:13](#block-216) (byte array).

**Source usage:** [114](#block-114), [115](#block-115), [120](#block-120), [162](#block-162), [163](#block-163), [166](#block-166), [167](#block-167), [168](#block-168), [169](#block-169), [181](#block-181), [196](#block-196), [212](#block-212), [213](#block-213), [216](#block-216), [235](#block-235).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-r2"></a>

### `R2` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for runner slot 2. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY R2
```

**Declaration:** [216:12](#block-216) (byte array).

**Source usage:** [115](#block-115), [120](#block-120), [163](#block-163), [165](#block-165), [166](#block-166), [168](#block-168), [213](#block-213), [216](#block-216), [235](#block-235).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-r3"></a>

### `R3` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for runner slot 3. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY R3
```

**Declaration:** [216:11](#block-216) (byte array).

**Source usage:** [115](#block-115), [120](#block-120), [165](#block-165), [166](#block-166), [168](#block-168), [213](#block-213), [216](#block-216), [235](#block-235), [264](#block-264).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-r4"></a>

### `R4` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for runner slot 4. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY R4
```

**Declaration:** [216:10](#block-216) (byte array).

**Source usage:** [114](#block-114), [115](#block-115), [120](#block-120), [168](#block-168), [213](#block-213), [216](#block-216), [235](#block-235).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rcb"></a>

### `RCB` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 9](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant RCB, assigned source expression/value `328` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
328 CONSTANT RCB 368 CONSTANT LCB ( 3 )
```

**Declaration:** [113:9](#block-113) (constant).

**Source usage:** [113](#block-113), [225](#block-225).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rf"></a>

### `RF` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 2](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for the right fielder. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY RF
```

**Declaration:** [216:2](#block-216) (byte array).

**Source usage:** [124](#block-124), [173](#block-173), [211](#block-211), [212](#block-212), [216](#block-216), [264](#block-264).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rfld"></a>

### `RFLD` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 7](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant RFLD, assigned source expression/value `128` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
128 CONSTANT RFLD 168 CONSTANT LFLD
```

**Declaration:** [113:7](#block-113) (constant).

**Source usage:** [113](#block-113), [227](#block-227), [228](#block-228).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rndx23"></a>

### `RND#` — ARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 295, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-295) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Two-cell random-generator state array explicitly placed at $7C06.

```terse
HEX VPTR @ 07C06 VPTR ! 2 ARRAY RND# VPTR !
```

**Declaration:** [295:1](#block-295) (cell array).

**Source usage:** [133](#block-133), [295](#block-295).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rrun"></a>

### `RRUN` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant RRUN, assigned source expression/value `28` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
28 CONSTANT RRUN 68 CONSTANT LRUN
```

**Declaration:** [113:6](#block-113) (constant).

**Source usage:** [113](#block-113), [176](#block-176), [226](#block-226), [227](#block-227), [228](#block-228), [231](#block-231).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rtrw"></a>

### `RTRW` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 8](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant RTRW, assigned source expression/value `228` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
228 CONSTANT RTRW 268 CONSTANT LTRW ( 2 )
```

**Declaration:** [113:8](#block-113) (constant).

**Source usage:** [113](#block-113), [227](#block-227).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-scr"></a>

### `SCR` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.

**Source:** [block 113, line 11](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant SCR, assigned source expression/value `728` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
628 CONSTANT BAL 728 CONSTANT SCR
```

**Declaration:** [113:11](#block-113) (constant).

**Source usage:** [10](#block-10), [113](#block-113).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ss"></a>

### `SS` — BARRAY

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 216, line 6](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-216) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** VLENGTH-byte vector record for the shortstop. Record layout is defined in 148; allocation order is defined in 216.

```terse
VLENGTH BARRAY SS
```

**Declaration:** [216:6](#block-216) (byte array).

**Source usage:** [153](#block-153), [157](#block-157), [211](#block-211), [213](#block-213), [216](#block-216).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stnd"></a>

### `STND` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 10](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant STND, assigned source expression/value `428` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
428 CONSTANT STND 528 CONSTANT NBD
```

**Declaration:** [113:10](#block-113) (constant).

**Source usage:** [113](#block-113), [176](#block-176), [194](#block-194), [198](#block-198), [213](#block-213), [225](#block-225), [230](#block-230), [236](#block-236).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stpt"></a>

### `STPT` — CONSTANT

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 113, line 12](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-113) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Constant STPT, assigned source expression/value `828` (use the defining screen’s radix). Define RRUN/LRUN, fielding, throwing, covering, standing, invisible, ball, pitcher and on-base selectors. Their repeated low-byte values and changing high bytes select rendering mode and PATTERNS groups.

```terse
828 CONSTANT STPT 928 C= PTTHW
```

**Declaration:** [113:12](#block-113) (constant).

**Source usage:** [113](#block-113), [194](#block-194), [226](#block-226), [227](#block-227).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x2d"></a>

### `-` — reference

**Stack:** `( a b -- difference )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Subtract the top value from the preceding value.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:11](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [87](#block-87), [101](#block-101), [123](#block-123), [130](#block-130), [169](#block-169), [236](#block-236).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x3b"></a>

### `;` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Finish a high-level definition in the applicable compilation context.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [34](#block-34), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [107](#block-107), [109](#block-109), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [130](#block-130), [131](#block-131), [132](#block-132), [133](#block-133), [136](#block-136), [141](#block-141), [142](#block-142), [146](#block-146), [153](#block-153), [154](#block-154), [155](#block-155), [156](#block-156), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [178](#block-178), [179](#block-179), [180](#block-180), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [211](#block-211), [213](#block-213), [214](#block-214), [225](#block-225), [229](#block-229), [233](#block-233), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [240](#block-240), [248](#block-248), [249](#block-249), [271](#block-271), [272](#block-272), [273](#block-273), [275](#block-275), [280](#block-280), [289](#block-289), [291](#block-291), [293](#block-293), [304](#block-304), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x3a"></a>

### `:` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Begin a high-level TERSE definition; brace wrappers in XC code distinguish host compilation from target compilation.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [34](#block-34), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [107](#block-107), [109](#block-109), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [131](#block-131), [132](#block-132), [133](#block-133), [136](#block-136), [141](#block-141), [142](#block-142), [146](#block-146), [153](#block-153), [154](#block-154), [155](#block-155), [156](#block-156), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [178](#block-178), [179](#block-179), [180](#block-180), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [211](#block-211), [212](#block-212), [213](#block-213), [214](#block-214), [225](#block-225), [229](#block-229), [233](#block-233), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [240](#block-240), [248](#block-248), [249](#block-249), [271](#block-271), [272](#block-272), [273](#block-273), [274](#block-274), [280](#block-280), [289](#block-289), [291](#block-291), [293](#block-293), [304](#block-304), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x21"></a>

### `!` — kernel

**Stack:** `( value address -- )`. **DNA documentation:** TERSE Standard Glossary.

**Native entry:** `$00A1`. 

**Function:** Store a cell at an address; target binding at $00A1.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:7](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [89](#block-89), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [101](#block-101), [102](#block-102), [128](#block-128), [130](#block-130), [131](#block-131), [133](#block-133), [140](#block-140), [149](#block-149), [153](#block-153), [154](#block-154), [157](#block-157), [158](#block-158), [162](#block-162), [169](#block-169), [211](#block-211), [212](#block-212), [213](#block-213), [239](#block-239), [271](#block-271), [274](#block-274), [276](#block-276), [280](#block-280), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x40"></a>

### `@` — kernel

**Stack:** `( address -- value )`. **DNA documentation:** TERSE Standard Glossary.

**Native entry:** `$0093`. 

**Function:** Fetch a cell from an address; target binding at $0093.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:5](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [34](#block-34), [87](#block-87), [89](#block-89), [98](#block-98), [101](#block-101), [102](#block-102), [130](#block-130), [133](#block-133), [134](#block-134), [149](#block-149), [157](#block-157), [158](#block-158), [161](#block-161), [184](#block-184), [216](#block-216), [233](#block-233), [239](#block-239), [276](#block-276), [291](#block-291), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x2a"></a>

### `*` — reference

**Stack:** `( a b -- product )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Multiply two stack values.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [101](#block-101).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x2f"></a>

### `/` — reference

**Stack:** `( a b -- quotient )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Divide the preceding stack value by the top value.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [174](#block-174).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x2b"></a>

### `+` — reference

**Stack:** `( a b -- sum )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Add two stack values.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:10](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [87](#block-87), [98](#block-98), [99](#block-99), [101](#block-101), [121](#block-121), [130](#block-130), [161](#block-161), [181](#block-181), [212](#block-212), [213](#block-213), [233](#block-233), [248](#block-248), [249](#block-249), [272](#block-272).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x2bx21"></a>

### `+!` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Add a value to the cell at the address (host use in VPTR alignment).

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x2bloop"></a>

### `+LOOP` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Native word / kernel binding. Declare loop labels and assemble +LOOP: pop the increment, update the IX loop index, compare against its limit and use sign/parity flag tests to choose repeat versus completion. Continue its body in 277.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [276:10](#block-276) (native word / kernel binding).

**Source usage:** [276](#block-276).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x3c"></a>

### `<` — reference

**Stack:** `( a b -- flag )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Compare whether the preceding value is less than the top value.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:8](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [121](#block-121), [129](#block-129), [161](#block-161), [162](#block-162), [169](#block-169), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x3cx3e"></a>

### `<>` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Compare two values for inequality.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:7](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [128](#block-128), [239](#block-239).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x3d"></a>

### `=` — reference

**Stack:** `( a b -- flag )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Compare two values for equality.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:6](#block-88) (native word / kernel binding).

**Source usage:** [34](#block-34), [88](#block-88), [101](#block-101), [129](#block-129), [130](#block-130), [158](#block-158), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [236](#block-236).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x3e"></a>

### `>` — reference

**Stack:** `( a b -- flag )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Compare whether the preceding value is greater than the top value.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:10](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [123](#block-123), [169](#block-169).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-x3er"></a>

### `>R` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Move a parameter-stack value to the return stack in host TERSE.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [97](#block-97).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-0"></a>

### `0` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Target constant with value zero; ordinary source numeric literals share this spelling.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [86:13](#block-86) (constant).

**Source usage:** [10](#block-10), [86](#block-86), [94](#block-94), [98](#block-98), [99](#block-99), [100](#block-100), [107](#block-107), [108](#block-108), [109](#block-109), [110](#block-110), [111](#block-111), [112](#block-112), [113](#block-113), [120](#block-120), [121](#block-121), [124](#block-124), [128](#block-128), [132](#block-132), [133](#block-133), [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141), [143](#block-143), [145](#block-145), [146](#block-146), [147](#block-147), [148](#block-148), [154](#block-154), [155](#block-155), [156](#block-156), [160](#block-160), [162](#block-162), [168](#block-168), [169](#block-169), [173](#block-173), [174](#block-174), [177](#block-177), [181](#block-181), [184](#block-184), [198](#block-198), [207](#block-207), [208](#block-208), [212](#block-212), [213](#block-213), [225](#block-225), [226](#block-226), [227](#block-227), [228](#block-228), [229](#block-229), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [238](#block-238), [239](#block-239), [241](#block-241), [242](#block-242), [244](#block-244), [247](#block-247), [253](#block-253), [255](#block-255), [260](#block-260), [262](#block-262), [269](#block-269), [270](#block-270), [271](#block-271), [273](#block-273), [274](#block-274), [276](#block-276), [279](#block-279), [280](#block-280), [283](#block-283), [284](#block-284), [291](#block-291), [293](#block-293), [304](#block-304), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-0x3d"></a>

### `0=` — reference

**Stack:** `( x -- flag )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Return a condition indicating zero.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:11](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [98](#block-98), [101](#block-101), [236](#block-236), [239](#block-239), [272](#block-272), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-1"></a>

### `1` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Target constant with value one; ordinary source numeric literals share this spelling.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [86:14](#block-86) (constant).

**Source usage:** [10](#block-10), [34](#block-34), [35](#block-35), [86](#block-86), [101](#block-101), [107](#block-107), [108](#block-108), [110](#block-110), [111](#block-111), [112](#block-112), [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [120](#block-120), [121](#block-121), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [128](#block-128), [129](#block-129), [133](#block-133), [134](#block-134), [138](#block-138), [141](#block-141), [144](#block-144), [145](#block-145), [147](#block-147), [148](#block-148), [154](#block-154), [155](#block-155), [158](#block-158), [159](#block-159), [162](#block-162), [165](#block-165), [168](#block-168), [170](#block-170), [171](#block-171), [173](#block-173), [174](#block-174), [175](#block-175), [179](#block-179), [182](#block-182), [183](#block-183), [184](#block-184), [190](#block-190), [191](#block-191), [195](#block-195), [197](#block-197), [202](#block-202), [212](#block-212), [233](#block-233), [235](#block-235), [236](#block-236), [239](#block-239), [242](#block-242), [247](#block-247), [255](#block-255), [257](#block-257), [261](#block-261), [262](#block-262), [264](#block-264), [269](#block-269), [270](#block-270), [276](#block-276), [287](#block-287), [288](#block-288), [291](#block-291), [293](#block-293), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-1x2d"></a>

### `1-` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Decrement the top value by one.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:12](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [87](#block-87), [121](#block-121), [158](#block-158), [161](#block-161), [170](#block-170), [171](#block-171), [272](#block-272), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-1x2b"></a>

### `1+` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Increment the top value by one.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:13](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [87](#block-87), [99](#block-99), [121](#block-121), [158](#block-158), [159](#block-159), [160](#block-160), [199](#block-199), [272](#block-272).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-2x2d"></a>

### `2-` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Subtract two from the top value.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:1](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-2x2a"></a>

### `2*` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Double the top value.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:2](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [121](#block-121).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-2x2f"></a>

### `2/` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Halve the top value; 

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:3](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [169](#block-169).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-2x2b"></a>

### `2+` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Add two to the top value.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:14](#block-87) (native word / kernel binding).

**Source usage:** [87](#block-87), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-2dup"></a>

### `2DUP` — reference

**Stack:** `( x y -- x y x y )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Duplicate the top two stack cells.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:2](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [87](#block-87), [271](#block-271), [272](#block-272).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-abort"></a>

### `ABORT` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Terminate the host compilation/loading path on a failed runtime check.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [34](#block-34).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-adcx2c"></a>

### `ADC,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Add operand plus carry to A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [234](#block-234), [250](#block-250).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-addx2c"></a>

### `ADD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Add operand to A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [174](#block-174), [177](#block-177), [234](#block-234), [250](#block-250).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-adix2c"></a>

### `ADI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Add an immediate byte to A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [117](#block-117), [126](#block-126), [144](#block-144), [159](#block-159), [174](#block-174), [279](#block-279).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-anax2c"></a>

### `ANA,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** AND an operand with A and set flags.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [132](#block-132), [159](#block-159), [165](#block-165), [166](#block-166), [173](#block-173), [174](#block-174), [175](#block-175), [177](#block-177), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [201](#block-201), [202](#block-202), [203](#block-203), [233](#block-233), [238](#block-238), [239](#block-239), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [267](#block-267), [268](#block-268), [269](#block-269), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-and"></a>

### `AND` — reference

**Stack:** `( a b -- result )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Bitwise AND of two values.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:12](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [101](#block-101), [121](#block-121), [129](#block-129), [131](#block-131), [174](#block-174), [181](#block-181), [213](#block-213), [239](#block-239), [249](#block-249), [291](#block-291), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-anix2c"></a>

### `ANI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** AND an immediate byte with A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [125](#block-125), [126](#block-126), [207](#block-207), [241](#block-241), [271](#block-271), [276](#block-276), [277](#block-277), [279](#block-279), [285](#block-285).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-array"></a>

### `ARRAY` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Allocate/name an indexed cell array from a the size.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [295](#block-295).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-asm"></a>

### `ASM` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Select assembler context.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [33](#block-33), [34](#block-34), [94](#block-94), [97](#block-97), [99](#block-99), [100](#block-100), [101](#block-101), [281](#block-281), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bx21"></a>

### `B!` — kernel

**Stack:** `( byte address -- )`. **DNA documentation:** TERSE Standard Glossary.

**Native entry:** `$00A8`. 

**Function:** Store one byte at an address; target binding at $00A8.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:8](#block-87) (native word / kernel binding).

**Source usage:** [87](#block-87), [101](#block-101), [121](#block-121), [123](#block-123), [128](#block-128), [129](#block-129), [130](#block-130), [154](#block-154), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [169](#block-169), [182](#block-182), [184](#block-184), [212](#block-212), [213](#block-213), [273](#block-273), [275](#block-275), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bx40"></a>

### `B@` — kernel

**Stack:** `( address -- byte )`. **DNA documentation:** TERSE Standard Glossary.

**Native entry:** `$009A`. 

**Function:** Fetch one byte from an address; target binding at $009A.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:6](#block-87) (native word / kernel binding).

**Source usage:** [87](#block-87), [98](#block-98), [99](#block-99), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [132](#block-132), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [213](#block-213), [236](#block-236), [238](#block-238), [240](#block-240), [248](#block-248), [249](#block-249), [272](#block-272), [273](#block-273), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-barray"></a>

### `BARRAY` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Allocate/name an indexed byte array from a the size.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [207](#block-207), [216](#block-216).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-base"></a>

### `BASE` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Host numeric-radix variable.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [102](#block-102), [134](#block-134), [140](#block-140).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-basex21"></a>

### `BASE!` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 102, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-102) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define BASE! and BASE@ as host-side radix save/restore shorthands using the compiler's brace syntax.

```terse
{ : BASE! } BASE ! { ; } { : BASE@ } BASE @ { ; }
CR ." system verbs"        304 LOAD
CR ." vgs "                290 LOAD
CR ." patterns "           107 LOAD
CR ." HERE-" HERE H. HEX 8241 DP ! DECIMAL
CR ." BASE- " BASE? CR ." sysave at 310 load 103  " CR .







( MASTER LOADER SCREEN #2 )
CR ." music "              146 LOAD
CR ." variables " 147 LOAD 216 LOAD
CR ." pattern matrix "     186 LOAD
CR ." parameter control"   276 LOAD
CR ." vgs write routines" 207 LOAD 241 LOAD
CR ." playaction tables "  225 LOAD
CR ." short subroutines "  233 LOAD
CR ." dest calculation "   230 LOAD
CR ." cmp outfld control"  173 LOAD
CR ." line vector "        280 LOAD
CR ." field generartor "   270 LOAD
CR ." who's on base "      168 LOAD
CR ." run throw logic "    163 LOAD
CR ." hit logic "          170 LOAD
( MASTER LOADER SCREEN #3 )
CR ." string process "     178 LOAD
CR ." BASE- " BASE? CR ." sysave at 400 load 105  " CR .












( MASTER LOADER SCREEN #4 )
CR ." tractor ball logic"  174 LOAD
CR ." infield action "     153 LOAD
CR ." playaction process " 215 LOAD
CR ." BASE- " BASE? CR ." sysave at 450 load 106  " CR .
```

**Declaration:** [102:1](#block-102) (definition).

**Source usage:** [102](#block-102), [113](#block-113), [133](#block-133), [145](#block-145), [162](#block-162), [177](#block-177), [184](#block-184), [203](#block-203), [214](#block-214), [232](#block-232), [240](#block-240), [277](#block-277), [280](#block-280), [282](#block-282), [289](#block-289), [303](#block-303), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-basex40"></a>

### `BASE@` — :

**Stack:** `(see implementation)`. **DNA documentation:** No exact-spelling entry confirmed in the supplied reference extracts.

**Source:** [block 102, line 1](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md#block-102) · [source screens](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/extra-bases-11-20-79-v20261026-0001.terse). 

**Function:** Definition. Define BASE! and BASE@ as host-side radix save/restore shorthands using the compiler's brace syntax.

```terse
{ : BASE! } BASE ! { ; } { : BASE@ } BASE @ { ; }
CR ." system verbs"        304 LOAD
CR ." vgs "                290 LOAD
CR ." patterns "           107 LOAD
CR ." HERE-" HERE H. HEX 8241 DP ! DECIMAL
CR ." BASE- " BASE? CR ." sysave at 310 load 103  " CR .







( MASTER LOADER SCREEN #2 )
CR ." music "              146 LOAD
CR ." variables " 147 LOAD 216 LOAD
CR ." pattern matrix "     186 LOAD
CR ." parameter control"   276 LOAD
CR ." vgs write routines" 207 LOAD 241 LOAD
CR ." playaction tables "  225 LOAD
CR ." short subroutines "  233 LOAD
CR ." dest calculation "   230 LOAD
CR ." cmp outfld control"  173 LOAD
CR ." line vector "        280 LOAD
CR ." field generartor "   270 LOAD
CR ." who's on base "      168 LOAD
CR ." run throw logic "    163 LOAD
CR ." hit logic "          170 LOAD
( MASTER LOADER SCREEN #3 )
CR ." string process "     178 LOAD
CR ." BASE- " BASE? CR ." sysave at 400 load 105  " CR .












( MASTER LOADER SCREEN #4 )
CR ." tractor ball logic"  174 LOAD
CR ." infield action "     153 LOAD
CR ." playaction process " 215 LOAD
CR ." BASE- " BASE? CR ." sysave at 450 load 106  " CR .
```

**Declaration:** [102:1](#block-102) (definition).

**Source usage:** [102](#block-102), [107](#block-107), [114](#block-114), [141](#block-141), [153](#block-153), [174](#block-174), [178](#block-178), [190](#block-190), [211](#block-211), [230](#block-230), [233](#block-233), [253](#block-253), [276](#block-276), [280](#block-280), [282](#block-282), [290](#block-290), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-begin"></a>

### `BEGIN` — reference

**Stack:** `( control: -- begin )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Immediate XC wrapper that records a loop's object address.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [100:10](#block-100) (definition).

**Source usage:** [100](#block-100), [236](#block-236), [272](#block-272), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bitx2c"></a>

### `BIT,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Test a register bit.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [119](#block-119), [160](#block-160), [174](#block-174), [176](#block-176), [177](#block-177), [196](#block-196), [234](#block-234), [236](#block-236), [241](#block-241), [242](#block-242), [243](#block-243), [246](#block-246), [247](#block-247), [276](#block-276), [279](#block-279), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bitxx2c"></a>

### `BITX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Test a bit at an IX/IY-relative memory location.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [116](#block-116), [117](#block-117), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [202](#block-202), [231](#block-231), [257](#block-257), [266](#block-266), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-block"></a>

### `BLOCK` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Obtain the buffer address of a disk block; this source uses $400-byte blocks.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [98](#block-98).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-bmove"></a>

### `BMOVE` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Move a block of bytes between addresses; used by bload for $400-byte blocks.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [89:1](#block-89) (native word / kernel binding).

**Source usage:** [10](#block-10), [89](#block-89).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-btable"></a>

### `BTABLE` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Declare a byte table accessed with the game's indexed table syntax.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [123](#block-123), [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141), [154](#block-154), [270](#block-270), [280](#block-280), [296](#block-296), [299](#block-299).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-callx2c"></a>

### `CALL,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Emit an absolute native subroutine call.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [116](#block-116), [117](#block-117), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [159](#block-159), [163](#block-163), [164](#block-164), [165](#block-165), [166](#block-166), [167](#block-167), [173](#block-173), [175](#block-175), [176](#block-176), [180](#block-180), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [208](#block-208), [231](#block-231), [233](#block-233), [237](#block-237), [238](#block-238), [239](#block-239), [244](#block-244), [245](#block-245), [247](#block-247), [251](#block-251), [252](#block-252), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [263](#block-263), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [270](#block-270), [271](#block-271), [284](#block-284), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ccx2c"></a>

### `CC,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Assembler carry-set selector used before a conditional call mnemonic in this dialect.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [230](#block-230), [253](#block-253), [261](#block-261).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cmax2c"></a>

### `CMA,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Complement A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [233](#block-233), [283](#block-283).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cmpx2c"></a>

### `CMP,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Compare A with an operand without retaining the subtraction result.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [116](#block-116), [120](#block-120), [126](#block-126), [176](#block-176), [195](#block-195), [196](#block-196), [198](#block-198), [202](#block-202), [230](#block-230), [231](#block-231), [255](#block-255), [257](#block-257), [258](#block-258), [261](#block-261), [263](#block-263), [285](#block-285).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cnzx2c"></a>

### `CNZ,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Emit a call if the zero flag is clear.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [132](#block-132), [165](#block-165), [174](#block-174), [193](#block-193), [234](#block-234), [236](#block-236), [254](#block-254), [255](#block-255), [257](#block-257).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-code"></a>

### `CODE` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Declare a target/native word; with a temporary ROMHERE assignment it binds a name to an existing kernel entry.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [87](#block-87), [88](#block-88), [89](#block-89), [114](#block-114), [115](#block-115), [116](#block-116), [119](#block-119), [122](#block-122), [124](#block-124), [125](#block-125), [132](#block-132), [143](#block-143), [145](#block-145), [159](#block-159), [167](#block-167), [177](#block-177), [179](#block-179), [180](#block-180), [190](#block-190), [191](#block-191), [192](#block-192), [194](#block-194), [195](#block-195), [196](#block-196), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [207](#block-207), [208](#block-208), [230](#block-230), [232](#block-232), [233](#block-233), [234](#block-234), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [244](#block-244), [245](#block-245), [246](#block-246), [250](#block-250), [251](#block-251), [252](#block-252), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [262](#block-262), [270](#block-270), [271](#block-271), [276](#block-276), [291](#block-291), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-constant"></a>

### `CONSTANT` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Define a constant from a value.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [98](#block-98), [113](#block-113), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cout"></a>

### `COUT` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Constant COUT, assigned source expression/value `2` (use the defining screen’s radix). Assign message-event indices CSAFE through CWALK used by STRING and dispatch tables.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [179:6](#block-179) (constant).

**Source usage:** [117](#block-117), [179](#block-179), [182](#block-182).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cpix2c"></a>

### `CPI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Compare A with an immediate byte.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [117](#block-117), [126](#block-126), [159](#block-159), [160](#block-160), [173](#block-173), [174](#block-174), [177](#block-177), [192](#block-192), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [200](#block-200), [203](#block-203), [208](#block-208), [246](#block-246), [253](#block-253), [259](#block-259), [260](#block-260), [262](#block-262), [264](#block-264), [265](#block-265), [279](#block-279).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-cr"></a>

### `CR` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Output a newline on the host console.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [102](#block-102), [103](#block-103), [104](#block-104), [105](#block-105), [106](#block-106).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-czx2c"></a>

### `CZ,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Emit a call if the zero flag is set.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [132](#block-132), [166](#block-166), [238](#block-238), [259](#block-259), [268](#block-268).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dadx2c"></a>

### `DAD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Add a register pair to HL.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [117](#block-117), [122](#block-122), [144](#block-144), [193](#block-193), [207](#block-207), [237](#block-237), [241](#block-241), [242](#block-242), [243](#block-243), [247](#block-247), [253](#block-253), [257](#block-257), [271](#block-271), [276](#block-276), [279](#block-279), [282](#block-282), [283](#block-283), [284](#block-284).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dadxx2c"></a>

### `DADX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Add a register pair to IX.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [277](#block-277).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dadyx2c"></a>

### `DADY,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Add a register pair to IY.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [261](#block-261).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dcxx2c"></a>

### `DCX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Decrement a register pair.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [122](#block-122), [207](#block-207), [234](#block-234), [241](#block-241), [243](#block-243), [281](#block-281).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-decimal"></a>

### `DECIMAL` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Select radix ten for parsing subsequent source numbers.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [89](#block-89), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [146](#block-146), [147](#block-147), [148](#block-148), [149](#block-149), [167](#block-167), [173](#block-173), [207](#block-207), [208](#block-208), [229](#block-229), [250](#block-250), [252](#block-252), [269](#block-269), [272](#block-272), [275](#block-275), [279](#block-279), [282](#block-282), [288](#block-288), [304](#block-304), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-delim"></a>

### `DELIM` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Host parser delimiter variable; XC-STRING sets it to double quote.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [99](#block-99).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-djnzx2c"></a>

### `DJNZ,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Decrement B and branch while it is nonzero.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [207](#block-207), [208](#block-208), [231](#block-231), [279](#block-279).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dp"></a>

### `DP` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Host dictionary allocation pointer.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [102](#block-102).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-drop"></a>

### `DROP` — reference

**Stack:** `( x -- )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Discard the top stack cell.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:3](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [33](#block-33), [87](#block-87), [94](#block-94), [98](#block-98), [99](#block-99), [101](#block-101), [121](#block-121), [123](#block-123), [128](#block-128), [130](#block-130), [131](#block-131), [132](#block-132), [158](#block-158), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [184](#block-184), [212](#block-212), [213](#block-213), [236](#block-236), [239](#block-239), [248](#block-248), [249](#block-249), [272](#block-272), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-dup"></a>

### `DUP` — reference

**Stack:** `( x -- x x )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Duplicate the top stack cell.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:1](#block-87) (native word / kernel binding).

**Source usage:** [10](#block-10), [87](#block-87), [97](#block-97), [98](#block-98), [99](#block-99), [101](#block-101), [121](#block-121), [123](#block-123), [129](#block-129), [130](#block-130), [131](#block-131), [133](#block-133), [157](#block-157), [158](#block-158), [162](#block-162), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [213](#block-213), [233](#block-233), [236](#block-236), [239](#block-239), [272](#block-272), [275](#block-275), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-else"></a>

### `ELSE` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Immediate XC wrapper that emits an unconditional branch and resolves the preceding conditional branch.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [100:9](#block-100) (definition).

**Source usage:** [100](#block-100), [101](#block-101), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [236](#block-236), [238](#block-238), [239](#block-239), [240](#block-240), [249](#block-249), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-end"></a>

### `END` — reference

**Stack:** `( flag -- )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Immediate XC wrapper emitting a conditional back-branch; game loops repeat until the condition becomes true.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [100:11](#block-100) (definition).

**Source usage:** [100](#block-100), [236](#block-236), [272](#block-272), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-exafx2c"></a>

### `EXAF,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Exchange AF with its alternate register pair.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [177](#block-177), [230](#block-230), [231](#block-231), [246](#block-246), [247](#block-247), [261](#block-261), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-exxx2c"></a>

### `EXX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Exchange BC/DE/HL with their alternate register bank.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [159](#block-159), [160](#block-160), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [281](#block-281), [283](#block-283), [284](#block-284), [285](#block-285), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-here"></a>

### `HERE` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Current allocation/compilation address in the active dictionary/data context.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [98](#block-98), [99](#block-99), [102](#block-102), [106](#block-106), [141](#block-141), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-hex"></a>

### `HEX` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Select radix sixteen for parsing subsequent source numbers.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [89](#block-89), [90](#block-90), [91](#block-91), [92](#block-92), [94](#block-94), [97](#block-97), [98](#block-98), [99](#block-99), [100](#block-100), [101](#block-101), [102](#block-102), [107](#block-107), [114](#block-114), [134](#block-134), [135](#block-135), [136](#block-136), [138](#block-138), [140](#block-140), [141](#block-141), [149](#block-149), [153](#block-153), [164](#block-164), [173](#block-173), [174](#block-174), [178](#block-178), [190](#block-190), [207](#block-207), [208](#block-208), [211](#block-211), [225](#block-225), [229](#block-229), [230](#block-230), [233](#block-233), [241](#block-241), [253](#block-253), [270](#block-270), [274](#block-274), [276](#block-276), [278](#block-278), [279](#block-279), [280](#block-280), [286](#block-286), [289](#block-289), [290](#block-290), [291](#block-291), [292](#block-292), [293](#block-293), [294](#block-294), [295](#block-295), [304](#block-304), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-if"></a>

### `IF` — reference

**Stack:** `( flag -- )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Immediate XC wrapper that emits a conditional target branch through XC-IF.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [100:7](#block-100) (definition).

**Source usage:** [34](#block-34), [98](#block-98), [100](#block-100), [101](#block-101), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [132](#block-132), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [236](#block-236), [238](#block-238), [239](#block-239), [240](#block-240), [249](#block-249), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inx2c"></a>

### `IN,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Definition. Define object emitters for immediate IN and subtract-with-borrow instructions.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Declaration:** [98:11](#block-98) (definition).

**Source usage:** [98](#block-98), [125](#block-125), [126](#block-126), [174](#block-174), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inp"></a>

### `INP` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Read a hardware input port; a target primitive distinct from assembler INP,.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [89:6](#block-89) (native word / kernel binding).

**Source usage:** [89](#block-89), [129](#block-129), [131](#block-131), [305](#block-305).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inpx2c"></a>

### `INP,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Emit register-port input using the assembler operand convention.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [286](#block-286).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inrx2c"></a>

### `INR,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Increment a byte operand.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [117](#block-117), [119](#block-119), [145](#block-145), [198](#block-198), [202](#block-202), [230](#block-230), [231](#block-231), [233](#block-233), [253](#block-253), [258](#block-258), [259](#block-259), [261](#block-261), [263](#block-263), [264](#block-264), [265](#block-265), [279](#block-279), [282](#block-282), [283](#block-283), [286](#block-286), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inxx2c"></a>

### `INX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Increment a register pair.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [119](#block-119), [120](#block-120), [143](#block-143), [197](#block-197), [200](#block-200), [201](#block-201), [207](#block-207), [233](#block-233), [234](#block-234), [243](#block-243), [252](#block-252), [258](#block-258), [269](#block-269), [279](#block-279), [281](#block-281), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-inxxx2c"></a>

### `INXX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Increment the selected index register.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [208](#block-208), [242](#block-242), [244](#block-244).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-jcx2c"></a>

### `JC,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Jump if carry is set.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [230](#block-230), [231](#block-231), [283](#block-283).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-jmpx2c"></a>

### `JMP,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Emit an unconditional absolute jump.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [115](#block-115), [116](#block-116), [117](#block-117), [132](#block-132), [144](#block-144), [166](#block-166), [176](#block-176), [196](#block-196), [197](#block-197), [198](#block-198), [244](#block-244), [276](#block-276), [279](#block-279), [281](#block-281), [283](#block-283), [284](#block-284), [286](#block-286), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-jnzx2c"></a>

### `JNZ,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Jump if zero is clear.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [143](#block-143), [144](#block-144), [165](#block-165), [166](#block-166), [176](#block-176), [196](#block-196), [197](#block-197), [198](#block-198), [230](#block-230), [268](#block-268), [285](#block-285).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-jpex2c"></a>

### `JPE,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Jump on parity even.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [276](#block-276).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-jpox2c"></a>

### `JPO,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Jump on parity odd.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [277](#block-277).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-jzx2c"></a>

### `JZ,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Jump if zero is set.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [115](#block-115), [143](#block-143), [144](#block-144), [196](#block-196), [197](#block-197), [276](#block-276).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-last"></a>

### `LAST` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Host last-definition pointer restored after loading a saved environment.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lbcdx2c"></a>

### `LBCD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load BC from a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [284](#block-284).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ldax2c"></a>

### `LDA,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load A from a direct memory address.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [125](#block-125), [126](#block-126), [132](#block-132), [143](#block-143), [144](#block-144), [145](#block-145), [160](#block-160), [164](#block-164), [165](#block-165), [166](#block-166), [167](#block-167), [173](#block-173), [174](#block-174), [175](#block-175), [177](#block-177), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [201](#block-201), [202](#block-202), [238](#block-238), [239](#block-239), [253](#block-253), [254](#block-254), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [267](#block-267), [268](#block-268), [269](#block-269), [283](#block-283), [285](#block-285), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ldaxx2c"></a>

### `LDAX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load A through a register-pair address.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [207](#block-207), [243](#block-243).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ldedx2c"></a>

### `LDED,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load DE from a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [119](#block-119), [173](#block-173), [193](#block-193), [283](#block-283), [285](#block-285).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ldxx2c"></a>

### `LDX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load a register from IX/IY plus the displacement.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [116](#block-116), [119](#block-119), [120](#block-120), [196](#block-196), [198](#block-198), [201](#block-201), [202](#block-202), [203](#block-203), [208](#block-208), [230](#block-230), [232](#block-232), [242](#block-242), [244](#block-244), [251](#block-251), [252](#block-252), [253](#block-253), [255](#block-255), [257](#block-257), [261](#block-261), [262](#block-262), [263](#block-263), [276](#block-276), [277](#block-277).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lhldx2c"></a>

### `LHLD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load HL from a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [119](#block-119), [122](#block-122), [143](#block-143), [144](#block-144), [173](#block-173), [193](#block-193), [200](#block-200), [258](#block-258), [261](#block-261), [262](#block-262), [263](#block-263), [281](#block-281), [282](#block-282), [283](#block-283), [284](#block-284), [285](#block-285).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lit"></a>

### `LIT` — reference

**Stack:** `( -- value; inline word16 )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Compiler literal mechanism used by INEXT's host macro.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lixdx2c"></a>

### `LIXD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load IX from a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [119](#block-119), [203](#block-203).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-liydx2c"></a>

### `LIYD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load IY from a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [116](#block-116), [119](#block-119).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-load"></a>

### `LOAD` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Load a numbered source screen in the current disk/file context; exact translation belongs to the external loader.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [33](#block-33), [34](#block-34), [35](#block-35), [86](#block-86), [87](#block-87), [88](#block-88), [94](#block-94), [98](#block-98), [102](#block-102), [103](#block-103), [104](#block-104), [105](#block-105), [106](#block-106), [114](#block-114), [146](#block-146), [208](#block-208), [215](#block-215), [250](#block-250), [269](#block-269), [272](#block-272), [279](#block-279).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lxix2c"></a>

### `LXI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load an immediate cell into a register pair.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [120](#block-120), [122](#block-122), [123](#block-123), [124](#block-124), [126](#block-126), [145](#block-145), [159](#block-159), [164](#block-164), [165](#block-165), [166](#block-166), [167](#block-167), [173](#block-173), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [199](#block-199), [200](#block-200), [202](#block-202), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [243](#block-243), [247](#block-247), [253](#block-253), [254](#block-254), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [261](#block-261), [262](#block-262), [265](#block-265), [266](#block-266), [269](#block-269), [271](#block-271), [277](#block-277), [279](#block-279), [282](#block-282), [283](#block-283), [284](#block-284), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-lxixx2c"></a>

### `LXIX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load an immediate value into the selected IX/IY register.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [173](#block-173), [208](#block-208), [238](#block-238), [261](#block-261), [267](#block-267), [268](#block-268), [283](#block-283).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-movx2c"></a>

### `MOV,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Copy source operand to destination operand; this source puts the source first.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [120](#block-120), [126](#block-126), [143](#block-143), [144](#block-144), [159](#block-159), [160](#block-160), [174](#block-174), [177](#block-177), [196](#block-196), [197](#block-197), [200](#block-200), [201](#block-201), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [239](#block-239), [241](#block-241), [243](#block-243), [246](#block-246), [247](#block-247), [250](#block-250), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [269](#block-269), [276](#block-276), [279](#block-279), [283](#block-283), [284](#block-284), [285](#block-285), [286](#block-286), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-mvix2c"></a>

### `MVI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Load an immediate byte into the selected operand.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [124](#block-124), [125](#block-125), [126](#block-126), [143](#block-143), [145](#block-145), [164](#block-164), [165](#block-165), [173](#block-173), [174](#block-174), [175](#block-175), [177](#block-177), [179](#block-179), [190](#block-190), [191](#block-191), [193](#block-193), [194](#block-194), [195](#block-195), [196](#block-196), [197](#block-197), [199](#block-199), [202](#block-202), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [234](#block-234), [235](#block-235), [236](#block-236), [237](#block-237), [239](#block-239), [241](#block-241), [242](#block-242), [247](#block-247), [255](#block-255), [257](#block-257), [259](#block-259), [260](#block-260), [261](#block-261), [262](#block-262), [263](#block-263), [264](#block-264), [266](#block-266), [267](#block-267), [269](#block-269), [271](#block-271), [279](#block-279), [283](#block-283), [287](#block-287), [288](#block-288), [292](#block-292).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-negx2c"></a>

### `NEG,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Two's-complement negate A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [117](#block-117), [159](#block-159), [160](#block-160), [174](#block-174), [241](#block-241), [261](#block-261).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-next"></a>

### `NEXT` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Native return to the byte-TERSE dispatcher; also appears in the scheduler entry convention.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [145](#block-145), [160](#block-160), [167](#block-167), [179](#block-179), [180](#block-180), [207](#block-207), [208](#block-208), [234](#block-234), [237](#block-237), [238](#block-238), [239](#block-239), [244](#block-244), [245](#block-245), [247](#block-247), [250](#block-250), [269](#block-269), [270](#block-270), [271](#block-271), [277](#block-277), [291](#block-291), [292](#block-292), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-not"></a>

### `NOT` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Invert a condition; used in the host unsigned RAM-range test.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [101](#block-101).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-or"></a>

### `OR` — reference

**Stack:** `( a b -- result )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Bitwise inclusive OR of two values.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:13](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [181](#block-181), [213](#block-213), [249](#block-249).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-orax2c"></a>

### `ORA,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** OR an operand into A and set flags.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [120](#block-120), [143](#block-143), [144](#block-144), [145](#block-145), [174](#block-174), [241](#block-241), [242](#block-242), [276](#block-276), [279](#block-279), [283](#block-283), [285](#block-285).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-orix2c"></a>

### `ORI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** OR an immediate byte into A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [144](#block-144).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-outx2c"></a>

### `OUT,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Output A to an immediate port; port numbers may appear directly before this word.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [124](#block-124), [174](#block-174), [207](#block-207), [243](#block-243), [264](#block-264), [269](#block-269), [287](#block-287), [288](#block-288), [291](#block-291), [292](#block-292).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-outp"></a>

### `OUTP` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Write a hardware output port; a target primitive distinct from assembler OUTP,.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [89:5](#block-89) (native word / kernel binding).

**Source usage:** [89](#block-89), [133](#block-133), [274](#block-274), [275](#block-275), [293](#block-293).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-outpx2c"></a>

### `OUTP,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Emit register-port output according to the assembler operand convention.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [144](#block-144).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-over"></a>

### `OVER` — reference

**Stack:** `( x y -- x y x )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Copy the second stack cell to the top.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [89:3](#block-89) (native word / kernel binding).

**Source usage:** [89](#block-89), [101](#block-101), [239](#block-239), [248](#block-248), [249](#block-249), [272](#block-272).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pchlx2c"></a>

### `PCHL,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Jump through HL.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [164](#block-164), [167](#block-167), [200](#block-200).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pick"></a>

### `PICK` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Copy an indexed parameter-stack cell; see the calling sequences for this dialect's index convention.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [89:8](#block-89) (native word / kernel binding).

**Source usage:** [89](#block-89), [184](#block-184), [272](#block-272).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-popx2c"></a>

### `POP,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Pop a native stack cell into the selected pair.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [115](#block-115), [117](#block-117), [132](#block-132), [144](#block-144), [145](#block-145), [159](#block-159), [167](#block-167), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [180](#block-180), [191](#block-191), [193](#block-193), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [200](#block-200), [203](#block-203), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [250](#block-250), [253](#block-253), [258](#block-258), [259](#block-259), [261](#block-261), [263](#block-263), [266](#block-266), [268](#block-268), [269](#block-269), [270](#block-270), [271](#block-271), [276](#block-276), [279](#block-279), [282](#block-282), [284](#block-284), [285](#block-285), [286](#block-286), [291](#block-291), [292](#block-292).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-popxx2c"></a>

### `POPX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Pop a native stack cell into IX/IY.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [117](#block-117), [118](#block-118), [120](#block-120), [125](#block-125), [173](#block-173), [180](#block-180), [196](#block-196), [203](#block-203), [208](#block-208), [238](#block-238), [239](#block-239), [244](#block-244), [245](#block-245), [247](#block-247), [251](#block-251), [252](#block-252), [259](#block-259), [265](#block-265), [266](#block-266), [268](#block-268), [270](#block-270).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-prot"></a>

### `PROT` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Reinstate host memory protection after bload's copy.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pushx2c"></a>

### `PUSH,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Push the selected register pair on the native stack.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [117](#block-117), [132](#block-132), [143](#block-143), [164](#block-164), [167](#block-167), [174](#block-174), [175](#block-175), [176](#block-176), [177](#block-177), [180](#block-180), [192](#block-192), [195](#block-195), [196](#block-196), [197](#block-197), [198](#block-198), [200](#block-200), [203](#block-203), [207](#block-207), [208](#block-208), [230](#block-230), [231](#block-231), [233](#block-233), [234](#block-234), [236](#block-236), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [247](#block-247), [250](#block-250), [251](#block-251), [252](#block-252), [253](#block-253), [258](#block-258), [259](#block-259), [261](#block-261), [264](#block-264), [265](#block-265), [266](#block-266), [269](#block-269), [270](#block-270), [271](#block-271), [276](#block-276), [279](#block-279), [282](#block-282), [284](#block-284), [285](#block-285), [286](#block-286), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-pushxx2c"></a>

### `PUSHX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Push IX/IY on the native stack.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [116](#block-116), [117](#block-117), [119](#block-119), [125](#block-125), [173](#block-173), [180](#block-180), [191](#block-191), [195](#block-195), [196](#block-196), [203](#block-203), [208](#block-208), [238](#block-238), [239](#block-239), [243](#block-243), [244](#block-244), [245](#block-245), [246](#block-246), [263](#block-263), [264](#block-264), [266](#block-266), [268](#block-268), [270](#block-270).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rx3e"></a>

### `R>` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Move the top return-stack value to the parameter stack in host TERSE.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [97](#block-97).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-ralrx2c"></a>

### `RALR,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Rotate a register left through carry.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [230](#block-230), [236](#block-236), [247](#block-247), [271](#block-271).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rarrx2c"></a>

### `RARR,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Rotate a register right through carry.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [207](#block-207), [231](#block-231), [234](#block-234), [242](#block-242).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rcx2c"></a>

### `RC,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Return if carry is set.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [126](#block-126), [263](#block-263).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-resx2c"></a>

### `RES,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Clear a register bit.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [123](#block-123).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-resxx2c"></a>

### `RESX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Clear a bit in indexed memory.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [117](#block-117), [120](#block-120), [173](#block-173), [190](#block-190), [197](#block-197), [198](#block-198), [199](#block-199), [230](#block-230), [238](#block-238).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-retx2c"></a>

### `RET,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Emit native RET.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [123](#block-123), [124](#block-124), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [163](#block-163), [164](#block-164), [165](#block-165), [166](#block-166), [173](#block-173), [174](#block-174), [176](#block-176), [177](#block-177), [190](#block-190), [191](#block-191), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [207](#block-207), [230](#block-230), [231](#block-231), [232](#block-232), [233](#block-233), [234](#block-234), [235](#block-235), [236](#block-236), [237](#block-237), [238](#block-238), [239](#block-239), [241](#block-241), [242](#block-242), [243](#block-243), [251](#block-251), [252](#block-252), [253](#block-253), [255](#block-255), [257](#block-257), [258](#block-258), [259](#block-259), [260](#block-260), [261](#block-261), [263](#block-263), [269](#block-269), [279](#block-279), [282](#block-282), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rncx2c"></a>

### `RNC,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Return if carry is clear.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [126](#block-126), [258](#block-258), [262](#block-262).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rnzx2c"></a>

### `RNZ,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Return if the zero flag is clear.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [116](#block-116), [119](#block-119), [122](#block-122), [126](#block-126), [175](#block-175), [258](#block-258), [262](#block-262), [263](#block-263), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rot"></a>

### `ROT` — reference

**Stack:** `( x y z -- y z x )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Rotate the top three stack cells.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [89:7](#block-89) (native word / kernel binding).

**Source usage:** [89](#block-89), [129](#block-129), [130](#block-130), [178](#block-178), [272](#block-272).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rrcx2c"></a>

### `RRC,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Rotate the accumulator right circularly in this dialect.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [207](#block-207).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-rzx2c"></a>

### `RZ,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Return if the zero flag is set.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [119](#block-119), [126](#block-126), [173](#block-173), [174](#block-174), [175](#block-175), [199](#block-199), [233](#block-233), [253](#block-253), [263](#block-263), [283](#block-283), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sbcdx2c"></a>

### `SBCD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Store BC in a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [167](#block-167), [173](#block-173), [194](#block-194), [195](#block-195), [198](#block-198).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sbix2c"></a>

### `SBI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Definition. Define object emitters for immediate IN and subtract-with-borrow instructions.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Declaration:** [98:11](#block-98) (definition).

**Source usage:** [98](#block-98), [126](#block-126), [262](#block-262).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sdedx2c"></a>

### `SDED,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Store DE in a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [120](#block-120), [143](#block-143), [160](#block-160), [173](#block-173), [177](#block-177), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-setx2c"></a>

### `SET,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Set a register bit.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [123](#block-123), [126](#block-126), [237](#block-237).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-setxx2c"></a>

### `SETX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Set a bit in indexed memory.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [120](#block-120), [193](#block-193), [198](#block-198), [231](#block-231), [255](#block-255).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-shldx2c"></a>

### `SHLD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Store HL in a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [117](#block-117), [118](#block-118), [119](#block-119), [122](#block-122), [123](#block-123), [124](#block-124), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [159](#block-159), [160](#block-160), [173](#block-173), [175](#block-175), [176](#block-176), [177](#block-177), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [200](#block-200), [236](#block-236), [238](#block-238), [262](#block-262), [263](#block-263), [269](#block-269), [271](#block-271), [281](#block-281), [282](#block-282), [291](#block-291), [292](#block-292).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-sixdx2c"></a>

### `SIXD,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Store IX in a direct memory cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [173](#block-173), [266](#block-266), [267](#block-267).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-srarx2c"></a>

### `SRAR,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Shift a register right retaining its sign (SRA).

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [242](#block-242).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-srlrx2c"></a>

### `SRLR,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Shift a register right with zero fill (SRL).

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [207](#block-207), [231](#block-231), [234](#block-234), [279](#block-279).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stax2c"></a>

### `STA,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Store A at a direct memory address.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [124](#block-124), [125](#block-125), [126](#block-126), [143](#block-143), [144](#block-144), [145](#block-145), [159](#block-159), [160](#block-160), [163](#block-163), [165](#block-165), [167](#block-167), [173](#block-173), [179](#block-179), [190](#block-190), [191](#block-191), [192](#block-192), [193](#block-193), [194](#block-194), [195](#block-195), [198](#block-198), [199](#block-199), [201](#block-201), [230](#block-230), [231](#block-231), [235](#block-235), [236](#block-236), [239](#block-239), [253](#block-253), [254](#block-254), [258](#block-258), [259](#block-259), [260](#block-260), [262](#block-262), [263](#block-263), [264](#block-264), [265](#block-265), [266](#block-266), [267](#block-267), [268](#block-268), [269](#block-269), [271](#block-271), [285](#block-285), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stcx2c"></a>

### `STC,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Set the carry flag.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [231](#block-231).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-stxx2c"></a>

### `STX,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Store a register into IX/IY plus the displacement.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [117](#block-117), [119](#block-119), [120](#block-120), [196](#block-196), [197](#block-197), [198](#block-198), [200](#block-200), [201](#block-201), [202](#block-202), [203](#block-203), [251](#block-251), [255](#block-255), [257](#block-257), [276](#block-276).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-subx2c"></a>

### `SUB,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Subtract an operand from A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [177](#block-177), [258](#block-258), [261](#block-261), [279](#block-279), [283](#block-283).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-suix2c"></a>

### `SUI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Subtract an immediate byte from A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [246](#block-246).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-swap"></a>

### `SWAP` — reference

**Stack:** `( x y -- y x )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Exchange the top two stack cells.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:4](#block-87) (native word / kernel binding).

**Source usage:** [87](#block-87), [100](#block-100), [121](#block-121), [169](#block-169), [248](#block-248), [249](#block-249), [272](#block-272), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-table"></a>

### `TABLE` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Declare a cell table accessed with the game's indexed table syntax.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [154](#block-154), [156](#block-156), [171](#block-171), [183](#block-183).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-then"></a>

### `THEN` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Immediate XC wrapper that resolves a saved target branch destination.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [100:8](#block-100) (definition).

**Source usage:** [34](#block-34), [98](#block-98), [100](#block-100), [101](#block-101), [121](#block-121), [123](#block-123), [127](#block-127), [128](#block-128), [129](#block-129), [130](#block-130), [131](#block-131), [132](#block-132), [157](#block-157), [158](#block-158), [161](#block-161), [162](#block-162), [168](#block-168), [169](#block-169), [170](#block-170), [171](#block-171), [179](#block-179), [181](#block-181), [182](#block-182), [183](#block-183), [184](#block-184), [212](#block-212), [236](#block-236), [238](#block-238), [239](#block-239), [240](#block-240), [249](#block-249), [305](#block-305), [306](#block-306).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-unprot"></a>

### `UNPROT` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Lift host memory protection around bload's copy.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-variable"></a>

### `VARIABLE` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Allocate/name a cell variable with the initial value in this dialect.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [141](#block-141), [142](#block-142), [291](#block-291), [304](#block-304).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-vptr"></a>

### `VPTR` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Variable allocation pointer; explicitly relocated by game variable/vector declarations.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [10](#block-10), [149](#block-149), [216](#block-216), [291](#block-291), [295](#block-295).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-word"></a>

### `WORD` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Host token/string parser used after selecting DELIM.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Source usage:** [99](#block-99).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-xchgx2c"></a>

### `XCHG,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Exchange DE and HL.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [123](#block-123), [164](#block-164), [167](#block-167), [200](#block-200), [230](#block-230), [231](#block-231), [233](#block-233), [241](#block-241), [242](#block-242), [244](#block-244), [279](#block-279), [283](#block-283), [284](#block-284), [285](#block-285).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-xor"></a>

### `XOR` — reference

**Stack:** `( a b -- result )`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Bitwise exclusive OR of two values.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [88:14](#block-88) (native word / kernel binding).

**Source usage:** [88](#block-88), [129](#block-129), [131](#block-131), [249](#block-249).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-xrax2c"></a>

### `XRA,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Exclusive-OR an operand with A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [114](#block-114), [115](#block-115), [116](#block-116), [117](#block-117), [118](#block-118), [119](#block-119), [120](#block-120), [122](#block-122), [124](#block-124), [126](#block-126), [144](#block-144), [167](#block-167), [176](#block-176), [192](#block-192), [193](#block-193), [195](#block-195), [196](#block-196), [198](#block-198), [199](#block-199), [201](#block-201), [202](#block-202), [230](#block-230), [231](#block-231), [233](#block-233), [236](#block-236), [239](#block-239), [253](#block-253), [259](#block-259), [260](#block-260), [262](#block-262), [263](#block-263), [265](#block-265), [266](#block-266), [283](#block-283), [285](#block-285), [286](#block-286), [287](#block-287), [288](#block-288).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-xrix2c"></a>

### `XRI,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Exclusive-OR an immediate byte with A.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [125](#block-125), [174](#block-174), [195](#block-195), [269](#block-269).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-xthlx2c"></a>

### `XTHL,` — assembler

**Stack:** `(see implementation)`. **DNA documentation:** Z80 Assembler.



**Function:** Exchange HL with the native top-of-stack cell.

**Implementation form:** postfix Z80 assembler emitter; actual instruction encoding and operands are described in the DNA *Z80 Assembler* document. Refer to source block uses for emitted instruction sites.

**Source usage:** [242](#block-242), [244](#block-244), [247](#block-247), [269](#block-269), [291](#block-291).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

<a id="word-zero"></a>

### `ZERO` — reference

**Stack:** `(see implementation)`. **DNA documentation:** TERSE Standard Glossary.



**Function:** Native cell-zeroing helper, used to clear paired score bytes; entry $00AD.

**Implementation:** target binding or inherited host word; native implementation and token dispatch are traced from the [Z80 source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) and [annotated dictionary](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md). This entry is not a newly defined colon body.

**Declaration:** [87:9](#block-87) (native word / kernel binding).

**Source usage:** [87](#block-87), [128](#block-128), [131](#block-131).

**Dependencies / callers:** follow the definition and source-use links above. Source occurrence is not equivalent to a decoded execution-cell caller graph; the [Z80 disassembly](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm) is the separate target-level evidence.

## Reference documents

- **TERSE Standard Glossary** (user-supplied 16-page DNA scan; ASCII-order standard vocabulary, stack-effect convention on page 1). Exact-spelling matches in the DNA documentation column.
- **Z80 Assembler** (user-supplied 16-page DNA document, *OP CODE FORMATS FOR TERSE ASSEMBLY*, starting page 3). Comma-suffixed assembly emitters.
- **TERSE Verbs** (user-supplied 15-page listing). Native utilities and floating-point word stubs; direct word matches only when the verb listing names the corresponding word.
- [Annotated TERSE block/word index](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/terse/README.md) and [native Z80 target source](https://github.com/lizard43/ExtraBases/blob/docs/extra-bases-terse-word-catalog-v20261122-0001/src/eb_disassembly.asm).

**Evidence boundary:** This document catalogs source-visible words and cross-references, distinguishing original game definitions from later reconstruction/XC material. Detailed byte-for-byte target-body matching and dynamic invocation frequencies remain separate verification work; neither is silently inferred from a matching word spelling.
