#!/usr/bin/env python3
"""Extract the actual 1979-1980 TERSE source block dependency graph for baseball.

Scans the original numbered .terse source rather than relying on its prose
README. Emits a source-backed JSON graph and verifies critical scoring and
music primitives retained by the 1980 Z80 redesign.
"""
import json
import re
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/"src"/"terse"/"extra-bases.terse"
OUT=ROOT/"docs"/"terse-baseball-gameplay-graph.json"

def blocks(text):
    result={}
    for m in re.finditer(r"\+[-]+Block\s+(\d+)[-]+",text):
        number=int(m.group(1))
        begin=m.end()
        following=re.search(r"\+[-]+Block\s+\d+[-]+\+",text[begin:])
        stop=begin+following.start() if following else len(text)
        lines={}
        for match in re.finditer(r"^\s*(\d{1,2})\|(.*)$",text[begin:stop],re.M):
            lines[int(match.group(1))]=match.group(2).rstrip()
        result[number]=lines
    return result

CRITICAL={
  114:("CHKSCRTIME", "PLAYON", "VLENGTH", "SCRTIME"),
  134:("BALLSCORE", "COINSCORE"),
  140:("SAFESCORE", "OUTSCORE"),
  141:("MUSPC", "MUSIC"),
  143:("MUSCPU", "NOTETIMER", "PROCESS"),
}
def main():
    full=SRC.read_text()
    blockset=blocks(full)
    coverage=[]
    for block,expected in CRITICAL.items():
        assert block in blockset,f"missing original TERSE source block {block}"
        joined=" ".join(blockset[block].values()).upper()
        for word in expected:
            assert word.upper() in joined,f"block {block} has no {word}; check source revision"
        coverage.append({"block":block,"symbols":list(expected),
            "source_lines":[{"line":i,"source":v} for i,v in sorted(blockset[block].items())]})
    # Emit complete block-level source references, not inferred code ancestry.
    index={}
    for block,lines in blockset.items():
        joined=" ".join(lines.values())
        for token in ("CODE","BTABLE","CHKSCRTIME","STRIKESCORE","BALLSCORE",
                      "COINSCORE","FOULSCORE","OUTSCORE","MUSCPU","MUSPC",
                      "NOTETIMER","SCRTIME","PLAYON"):
            if re.search(r"\b"+token+r"\b",joined,re.I):
                index.setdefault(token,[]).append(block)
    OUT.write_text(json.dumps({"source":"src/terse/extra-bases.terse",
        "architecture":"1980 Z80 native/TERSE source, not 8080 bytecode",
        "scanned_blocks":len(blockset),"critical_source":coverage,
        "symbol_block_index":index},indent=2)+"\n")
    print(f"PASS TERSE native gameplay extraction: {len(blockset)} original numbered blocks, "
          f"{len(coverage)} validated control/music blocks, {len(index)} symbol groups")
if __name__=="__main__":main()
