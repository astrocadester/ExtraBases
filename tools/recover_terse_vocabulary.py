#!/usr/bin/env python3
"""Recover actual 1980 target TERSE vocabulary from numbered source records.

Output original CODE, BTABLE and VARIABLE definitions with exact block/line
provenance. Unlike the 1976/77/78 symbolic VM names, these word names ARE
preserved in the programmer's source. Distinguishes duplicate declarations.
"""
import json,re
from pathlib import Path
from collections import Counter,defaultdict
ROOT=Path(__file__).resolve().parents[1]
ORIG=ROOT/"src"/"terse"/"extra-bases.terse"
HEAD=re.compile(r"\+-+Block\s+(\d+)-+")
LINE=re.compile(r"^\s*(\d{1,2})\|(.*)$",re.M)
DEFS=re.compile(r"\b(CODE|BTABLE|VARIABLE)\s+([A-Z][A-Z0-9_-]*)\b",re.I)
def main():
    original=ORIG.read_text()
    heads=list(HEAD.finditer(original))
    found=[]
    for pos,m in enumerate(heads):
        number=int(m.group(1))
        chunk=original[m.end():heads[pos+1].start() if pos+1<len(heads) else len(original)]
        for line in LINE.finditer(chunk):
            lineno=int(line.group(1));raw=line.group(2).strip()
            # The original parenthesized prose comments are not executable.
            clean=re.sub(r"\([^)]*\)"," ",raw)
            for word in DEFS.finditer(clean):
                name=word.group(2).upper()
                kind=word.group(1).upper()
                if name in ("OF","THE","WITH"):continue
                found.append({"kind":kind,"name":name,"block":number,
                              "line":lineno,"source":raw[:180]})
    assert len(found)>=80,"missing original source vocabulary definitions"
    assert any(x["name"]=="CHKSCRTIME" and x["kind"]=="CODE" for x in found)
    assert any(x["name"]=="MUSCPU" and x["kind"]=="CODE" for x in found)
    for name in ("BALLSCORE","STRIKESCORE","OUTSCORE","SAFESCORE"):
        assert any(x["kind"]=="BTABLE" and x["name"]==name for x in found),name
    kinds=Counter(x["kind"] for x in found)
    inventory={"source":"src/terse/extra-bases.terse",
       "source_blocks":len(heads),"declarations":len(found),
       "unique_words":len(set((x["kind"],x["name"]) for x in found)),
       "by_kind":dict(kinds),"entries":found,
       "status":"Original TERSE developer word names, not inferred 8080 mnemonic names."}
    output=ROOT/"docs"
    (output/"recovered-terse-original-vocabulary.json").write_text(
        json.dumps(inventory,indent=2)+"\n")
    lines=["# Recovered original Extra Bases TERSE vocabulary","",
      "Extracted mechanically from the **original numbered TERSE source**,",
      "not from later English documentation or the inferred 8080 opcode names.",
      "These are actual developer declarations: CODE, BTABLE and VARIABLE.","",
      "Blocks inspected: "+str(len(heads))+
      "; declarations: "+str(len(found))+
      "; unique kind/name pairs: "+str(inventory["unique_words"])+".","",
      "| Native TERSE kind | Declaration count |",
      "|---|---:|"]
    for kind,count in sorted(kinds.items()):
        lines.append("| "+kind+" | "+str(count)+" |")
    lines+=["","## Original source declarations","",
       "| Kind | Developer word | Block | Line | Original source fragment |",
       "|---|---|---:|---:|---|"]
    for row in found:
        lines.append("| "+row["kind"]+" | "+row["name"]+" | "+
                     str(row["block"])+" | "+str(row["line"])+" | "+
                     row["source"].replace("|","\\|")+" |")
    lines+=["","This establishes the authentic post-transition **TERSE**",
      "vocabulary available for semantic comparison with the modern,",
      "inferred 26/28 native-command names. Shared words cannot be assumed",
      "merely from their similar purpose: opcode and Z80 native call traces",
      "must be checked separately.",""]
    (output/"recovered-terse-original-vocabulary.md").write_text("\n".join(lines))
    print("PASS actual TERSE word recoveries",len(found),dict(kinds),
        "across",len(heads),"numbered source blocks")
if __name__=="__main__":main()
