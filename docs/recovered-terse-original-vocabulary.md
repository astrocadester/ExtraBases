# Recovered original Extra Bases TERSE vocabulary

Extracted mechanically from the **original numbered TERSE source**,
not from later English documentation or the inferred 8080 opcode names.
These are actual developer declarations: CODE, BTABLE and VARIABLE.

Blocks inspected: 217; declarations: 130; unique kind/name pairs: 126.

| Native TERSE kind | Declaration count |
|---|---:|
| BTABLE | 22 |
| CODE | 106 |
| VARIABLE | 2 |

## Original source declarations

| Kind | Developer word | Block | Line | Original source fragment |
|---|---|---:|---:|---|
| CODE | DUP | 87 | 1 | 07D ROMHERE ! CODE DUP |
| CODE | DROP | 87 | 3 | 08A ROMHERE ! CODE DROP |
| CODE | SWAP | 87 | 4 | 08D ROMHERE ! CODE SWAP |
| CODE | B | 87 | 6 | 09A ROMHERE ! CODE B@ |
| CODE | B | 87 | 8 | 0A8 ROMHERE ! CODE B! |
| CODE | ZERO | 87 | 9 | 0AD ROMHERE ! CODE ZERO |
| CODE | B | 88 | 4 | 0E6 ROMHERE ! CODE B@+7 |
| CODE | AND | 88 | 12 | 0147 ROMHERE ! CODE AND |
| CODE | OR | 88 | 13 | 0152 ROMHERE ! CODE OR |
| CODE | XOR | 88 | 14 | 015D ROMHERE ! CODE XOR |
| CODE | BMOVE | 89 | 1 | 0168 ROMHERE ! CODE BMOVE |
| CODE | R | 89 | 2 | 01BF ROMHERE ! CODE R@ |
| CODE | OVER | 89 | 3 | 01C8 ROMHERE ! CODE OVER |
| CODE | SWAB | 89 | 4 | 01CF ROMHERE ! CODE SWAB |
| CODE | OUTP | 89 | 5 | 01D6 ROMHERE ! CODE OUTP |
| CODE | INP | 89 | 6 | 01DE ROMHERE ! CODE INP |
| CODE | ROT | 89 | 7 | 01E8 ROMHERE ! CODE ROT |
| CODE | PICK | 89 | 8 | 01EF ROMHERE ! CODE PICK |
| CODE | DI | 89 | 9 | 0243 ROMHERE ! CODE DI |
| CODE | EI | 89 | 10 | 0246 ROMHERE ! CODE EI |
| CODE | SWABN | 89 | 11 | 0249 ROMHERE ! CODE SWABN |
| CODE | NPICK | 89 | 12 | 0260 ROMHERE ! CODE NPICK |
| CODE | CHKSCRTIME | 114 | 5 | CODE CHKSCRTIME ( score process ) DI, |
| CODE | RESETRUNNERS | 115 | 2 | CODE RESETRUNNERS ( reset runners to order of on base ) |
| CODE | CHKCAUGHT | 116 | 2 | CODE CHKCAUGHT ( caught set in interrupt ) |
| CODE | THROWANIM | 119 | 3 | CODE THROWANIM ( sets up BLDST and player anim ) |
| CODE | THROWBALL | 122 | 5 | CODE THROWBALL FLDCLR LDA, A ANA, RNZ, ( finish scoring first ) |
| BTABLE | IODTBL | 123 | 7 | BTABLE IODTBL ( inning odds table ) |
| CODE | BATHIT | 124 | 1 | CODE BATHIT ( he hit it time to get em running ) |
| CODE | STARTMUSIC | 124 | 6 | CODE STARTMUSIC A XRA, STMUSIC STA, |
| CODE | OFLDTBL | 124 | 12 | CODE OFLDTBL OFTBLPA H LXI, A XRA, OFTOTBL STA, |
| CODE | BUTTONCHK | 125 | 1 | CODE BUTTONCHK ( reads buttons for swing run & pitch it ) |
| CODE | SENTRY | 132 | 4 | CODE SENTRY ( game loop ) B PUSH, |
| BTABLE | STRIKESCORE | 134 | 1 | BTABLE STRIKESCORE |
| BTABLE | BALLSCORE | 134 | 6 | BTABLE BALLSCORE |
| BTABLE | COINSCORE | 134 | 10 | BTABLE COINSCORE |
| BTABLE | FOULSCORE | 135 | 0 | ( FOUL,CHEERS,BAT CRACK ) HEX BTABLE FOULSCORE 0 VIBS |
| BTABLE | CHEERSSCORE | 135 | 5 | ( CROWD CHEER ) BTABLE CHEERSSCORE 35 MASTER 33 NOISE |
| BTABLE | CRACKSCORE | 135 | 11 | BTABLE CRACKSCORE 50 MASTER 3D NOISE |
| BTABLE | FENCESCORE | 135 | 14 | BTABLE FENCESCORE 48 MASTER 38 NOISE 4 CRACKSCORE LDPCC |
| BTABLE | TAKE-ME | 136 | 3 | { : ^ } EF ABVOLS 0F MCVOLS { ; } BTABLE TAKE-ME CMAJOR 0 VIBS |
| BTABLE | SIRENSCORE | 138 | 1 | BTABLE SIRENSCORE AB ABVOLS 0B MCVOLS |
| BTABLE | CANNONSCORE | 138 | 7 | ( HOMER CONT. ) BTABLE CANNONSCORE |
| BTABLE | SAFESCORE | 140 | 1 | BTABLE SAFESCORE |
| BTABLE | OUTSCORE | 140 | 5 | BTABLE OUTSCORE |
| VARIABLE | MUSPC | 141 | 1 | 0 VARIABLE MUSPC { : MASTER } 10 B, B, { ; } { : ATONE } 11 B, |
| BTABLE | ENDMUSIC | 141 | 15 | BTABLE ENDMUSIC QUIET --> |
| CODE | MUSCPU | 143 | 10 | CODE MUSCPU <ASSEMBLE |
| CODE | BMUSIC | 145 | 2 | CODE BMUSIC PRIORITY LDA, H POP, A ORA, 0=, IF, loadpc CALL, |
| CODE | EMUSIC | 145 | 4 | CODE EMUSIC 0 ENDMUSIC H LXI, loadpc CALL, 1 A MVI, NOTETIMER |
| CODE | PMUSIC | 145 | 6 | CODE PMUSIC H POP, loadpc CALL, 1 A MVI, MULTIPLE STA, |
| BTABLE | HMHTBL | 154 | 9 | BTABLE HMHTBL ( fence = 1 homer = 2 normal = 0 ) |
| CODE | HOMERCHK | 159 | 1 | CODE HOMERCHK ( chk for homer or fence hit ) |
| CODE | HITRUN | 167 | 2 | CODE HITRUN ( activate proper runners and set trwbase ) |
| CODE | TBALLPITCH | 177 | 1 | CODE TBALLPITCH ( loads pitch velocities ) |
| CODE | CLRBLST | 179 | 13 | CODE CLRBLST 30 A MVI, BALLS STA, STRIKES STA, NEXT |
| CODE | BALLERASE | 180 | 1 | CODE BALLERASE B PUSH, Y PUSHX, BLERASE CALL, |
| CODE | DEACTIVATE | 190 | 4 | CODE DEACTIVATE ( reset active bit in status ) |
| CODE | THWANMSET | 191 | 1 | CODE THWANMSET ( set up throw animation ) |
| CODE | ON1ST | 191 | 5 | CODE ON1ST X PUSHX, H POP, FLDON1ST SHLD, RET, |
| CODE | ON2ND | 191 | 6 | CODE ON2ND X PUSHX, H POP, FLDON2ND SHLD, RET, |
| CODE | ON3RD | 191 | 7 | CODE ON3RD X PUSHX, H POP, FLDON3RD SHLD, RET, |
| CODE | BLDST | 192 | 1 | CODE BLDST ( ball thrown or hit ) |
| CODE | FLDDST | 194 | 1 | CODE FLDDST ( fielders take position logic ) |
| CODE | OFFFDST | 195 | 2 | CODE OFFFDST ( all player off field control ) <ASSEMBLE |
| CODE | RUNDST | 196 | 3 | CODE RUNDST ( runner base running control ) <ASSEMBLE |
| CODE | OFMOTION | 199 | 1 | CODE OFMOTION ( set pc for ram pa table -tractor ball ) |
| CODE | WAITTHRW | 199 | 5 | CODE WAITTHRW ( sets flag for 1stbaseman to wait throw ) |
| CODE | BLMOTION | 199 | 8 | CODE BLMOTION ( set pc for ram pa table -tractor ball ) |
| CODE | OPCODECHK | 200 | 2 | CODE OPCODECHK ( called by plyactupdate ) <ASSEMBLE |
| CODE | LOADANM | 200 | 9 | CODE LOADANM ( loads magic & anm HL-top of playact table ) |
| CODE | ANMSEQLOAD | 201 | 1 | CODE ANMSEQLOAD ( finds proper anm seq by per=# ) |
| CODE | PACTLOAD | 201 | 6 | CODE PACTLOAD ( loads vect from plyact ) |
| CODE | PATFETCH | 202 | 1 | CODE PATFETCH ( loads actual pattern IX-vector ) |
| CODE | PLAYACT | 203 | 1 | CODE PLAYACT ( called in intterupt does update prc ) |
| CODE | FMIRROR | 207 | 7 | CODE FMIRROR B PUSH, 0C A MVI, XPAND OUT, |
| CODE | INFIELD | 208 | 2 | CODE INFIELD B PUSH, X PUSHX, |
| CODE | DSTCALC | 230 | 3 | CODE DSTCALC ( calc deltas to destination ) |
| CODE | DSTLD | 232 | 1 | CODE DSTLD |
| CODE | COMPHL | 233 | 2 | CODE COMPHL ( compliments HL ) |
| CODE | COMPDE | 233 | 4 | CODE COMPDE H PUSH, XCHG, ' COMPHL CALL, XCHG, H POP, RET, |
| CODE | EX | 234 | 1 | CODE EX C9 B, NEXT |
| CODE | DIVHLBY4 | 234 | 2 | CODE DIVHLBY4 ( divide HL by 4 ) |
| CODE | INDEXW | 234 | 7 | CODE INDEXW ( call routine A- disp HL- table add ) |
| CODE | MULTHLBY4 | 236 | 1 | CODE MULTHLBY4 |
| CODE | KILLOF | 236 | 4 | CODE KILLOF ( stop outfield tractor ball control ) |
| CODE | WAIT | 236 | 7 | CODE WAIT ( given A wait period stop every thing ) |
| CODE | SETACT | 237 | 1 | CODE SETACT ( sets avtive bit in status ) |
| CODE | INFLDACT | 237 | 5 | CODE INFLDACT ( set infielders active ) |
| CODE | OUTFLDACT | 237 | 7 | CODE OUTFLDACT ( sets outfielders active ) |
| CODE | ALLFLDACT | 237 | 9 | CODE ALLFLDACT ( sets all fielders active ) |
| CODE | PTAUTOTM | 238 | 4 | CODE PTAUTOTM ( pitch auto timer ) |
| CODE | FLSHOFF | 239 | 10 | CODE FLSHOFF B PUSH, A XRA, FLSHON STA, DI, FLSHWUP CALL, |
| CODE | WRITE | 244 | 5 | CODE WRITE ( write with X Y sizes ; pattern with no header ) |
| CODE | WRITR | 245 | 1 | CODE WRITR ( write with a relative pattern ) |
| CODE | CPOST | 246 | 4 | CODE cpost ( post an ascii-character on the screen ; see opt. ) |
| CODE | BCD | 250 | 1 | CODE BCD+ ( binary to decimal arithmatic ) |
| CODE | VWRITE | 251 | 1 | CODE VWRITE ( does reloff relabs patbrd from vector IX ) |
| CODE | VERASE | 252 | 1 | CODE VERASE ( does pattern board erase from vector IX ) |
| CODE | CHKGROUNDER | 253 | 5 | CODE CHKGROUNDER ( if grounder adjust ball direction ) |
| CODE | TIMER | 254 | 1 | CODE TIMER ( interrupt timer routine ) |
| CODE | PERSPECTIVE | 255 | 3 | CODE PERSPECTIVE ( pattern size determined by y ) |
| CODE | VECTOR | 257 | 1 | CODE VECTOR ( vectors and limit checks ) |
| CODE | BATHITCHK | 258 | 4 | CODE BATHITCHK ( check window for hit ) |
| CODE | BATWRITE | 259 | 3 | CODE BATWRITE ( xor bat from swingtype ) |
| CODE | BATSWING | 259 | 9 | CODE BATSWING ( swings bat if appropriate ) |
| CODE | BLPOSCHK | 262 | 1 | CODE BLPOSCHK |
| BTABLE | FIELD | 270 | 6 | BTABLE FIELD |
| CODE | CNLINE | 270 | 10 | CODE cnline ( calls vector line write ) |
| CODE | STRTLINE | 271 | 1 | CODE strtline ( given X Y sets up start of line ) |
| CODE | COUNT | 276 | 2 | ROMHERE @ 0E6 ROMHERE ! CODE COUNT ROMHERE ! |
| CODE | DO | 276 | 5 | ROMHERE @ 0176 ROMHERE ! CODE DO |
| CODE | LOOP | 276 | 6 | 0191 ROMHERE ! CODE LOOP |
| CODE | I | 276 | 7 | 01BF ROMHERE ! CODE I |
| BTABLE | PXT0 | 280 | 4 | BTABLE PXT0 0 , 0 , |
| BTABLE | PXT1 | 280 | 5 | BTABLE PXT1 80 B, 20 B, 8 B, 2 B, ( fixed white index 2 ) |
| BTABLE | MASK | 280 | 8 | BTABLE MASK 3F B, 0CF B, 0F3 B, 0FC B, |
| BTABLE | PXT3 | 280 | 9 | BTABLE PXT3 0C0 B, 30 B, 0C B, 3 B, |
| VARIABLE | IPNT | 291 | 2 | 0 VARIABLE IPNT |
| CODE | IEX | 291 | 11 | CODE IEX PSW POP, B POP, D POP, H POP, EXX, EXAF, |
| CODE | ISTART | 292 | 1 | CODE ISTART DI, H POP, IPNT SHLD, 8 A MVI, INMOD OUT, |
| CODE | DI | 292 | 4 | ROMHERE @ HEX 0243 ROMHERE ! CODE DI |
| CODE | EI | 292 | 5 | 0246 ROMHERE ! CODE EI 0249 ROMHERE ! CODE SWAN |
| CODE | SWAN | 292 | 5 | 0246 ROMHERE ! CODE EI 0249 ROMHERE ! CODE SWAN |
| CODE | FILL | 293 | 4 | ROMHERE @ HEX 0253 ROMHERE ! CODE FILL ROMHERE ! |
| CODE | NDUP | 294 | 1 | ROMHERE @ HEX 0260 ROMHERE ! CODE NDUP ROMHERE ! |
| CODE | RND | 295 | 2 | ROMHERE @ 0275 ROMHERE ! CODE RND ROMHERE ! |
| BTABLE | CHARACTERS | 296 | 1 | BTABLE characters ( FILL IN CHARACTER TABLES ) |
| BTABLE | SMALLFONT | 299 | 1 | BTABLE smallfont 00 B, 00 B, ( SPACE ) |
| CODE | EIDI | 304 | 6 | CODE EIDI EI, DI, NEXT |

This establishes the authentic post-transition **TERSE**
vocabulary available for semantic comparison with the modern,
inferred 26/28 native-command names. Shared words cannot be assumed
merely from their similar purpose: opcode and Z80 native call traces
must be checked separately.
