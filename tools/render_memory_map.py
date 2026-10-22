#!/usr/bin/env python3
"""Render the Extra Bases Z80 address-space reference. Requires Pillow."""
from pathlib import Path
import textwrap
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1]
W = 1200
FONT_DIR = Path('/usr/share/fonts/truetype/dejavu')
def font(size, bold=False, mono=False):
    name = 'DejaVuSansMono' if mono else 'DejaVuSans'
    if bold: name += '-Bold'
    return ImageFont.truetype(str(FONT_DIR / (name + '.ttf')), size)
F = {k:font(*v) for k,v in {'title':(49,True),'h':(31,True),'body':(23,),'code':(20,False,True),'small':(19,),'chip':(22,True)}.items()}
im = Image.new('RGB', (W, 2400), '#10171f')
d = ImageDraw.Draw(im)
d.text((38,28),'EXTRA BASES',font=F['title'],fill='#f2f5f8')
d.text((40,94),'Z80 CPU ADDRESS SPACE  ·  BALLY / MIDWAY  ·  1980',font=F['small'],fill='#91adbf')
# Baseball diamond motif.
d.polygon([(1100,34),(1142,76),(1100,118),(1058,76)],outline='#e7bd68',width=3)
d.ellipse((1096,72,1104,80),fill='#e7bd68')
d.line((34,138,1166,138),fill='#7d8b96',width=1)
y=162

def wrap(text, chars=83):return textwrap.wrap(text,width=chars)
def card(address,title,color,summary,rows=(),code=(),chips=()):
    global y
    lines=wrap(summary)
    height=88+len(lines)*31+(len(rows)*52+18 if rows else 0)+(len(code)*28+34 if code else 0)+(238 if chips else 0)
    d.rounded_rectangle((34,y,1166,y+height),radius=24,fill=color,outline='#b6c2cc',width=1)
    d.text((62,y+22),address,font=F['code'],fill='#d6e3ec')
    d.text((315,y+17),title,font=F['h'],fill='#f3f6f9')
    yy=y+67
    for line in lines:d.text((62,yy),line,font=F['body'],fill='#d8e2eb');yy+=31
    if rows:
        yy+=10
        for addr,text,size in rows:
            d.rounded_rectangle((62,yy,1138,yy+44),radius=9,fill='#07151a',outline='#5fa997')
            d.text((79,yy+10),addr,font=F['code'],fill='#c7ddd4')
            d.text((286,yy+10),text,font=F['small'],fill='#d5e5e1')
            d.text((1020,yy+10),size,font=F['small'],fill='#87d8b4');yy+=52
    if chips:
        yy+=12
        for index,(name,addr,crc) in enumerate(chips):
            xx=64+(index%2)*548;cy=yy+(index//2)*108
            d.rounded_rectangle((xx,cy,xx+524,cy+94),radius=14,fill='#060c12',outline='#9f8abc')
            d.text((xx+20,cy+10),name,font=F['chip'],fill='#f0eff7')
            d.text((xx+20,cy+42),addr,font=F['code'],fill='#79b6d5')
            d.text((xx+280,cy+46),'CRC '+crc,font=F['small'],fill='#b1a9bd')
        yy+=238
    if code:
        yy+=10;d.rounded_rectangle((62,yy,1138,yy+len(code)*28+20),radius=12,fill='#060d13',outline='#94a6b2')
        for line in code:d.text((80,yy+10),line,font=F['code'],fill='#cddbe4');yy+=28
    y+=height+24

card('$8000–$FFFF','Unmapped / Open Bus','#343e49','The Extra Bases CPU map places its ROM and RAM in the lower 32 KB.',code=['UNMAPPED_START     equ $8000','UNMAPPED_END       equ $FFFF','UNMAPPED_SIZE      equ $8000'])
card('$7C00–$7FFF','Off-screen RAM / TERSE','#17533f','Runtime state and vector records share the upper part of the 16 KB video RAM. The Z80 stack starts at $7F80; the IX control stack starts at $8000.',rows=[('$7C00–$7CD9','Interrupt, random, music and game state','218 B'),('$7CDA–$7E6C','13 vector records × 31 bytes','403 B'),('$7E6D–$7FFF','Drawing state and stack workspace','403 B')],code=['DATA_STACK_TOP    equ $7F80','CONTROL_STACK_TOP equ $8000','VECTOR_BASE       equ $7CDA','VECTOR_LENGTH     equ $001F'])
card('$4000–$7BFF','Visible Framebuffer','#18576b','The $C0 vertical setting displays 192 scanlines. Each scanline occupies 80 bytes: 320 pixels at two bits per pixel.',code=['VIDEO_RAM_BASE    equ $4000','VISIBLE_END       equ $7BFF','SCANLINE_BYTES    equ $0050','VISIBLE_LINES     equ $00C0'])
card('$0000–$3FFF','Program ROM / Function Generator','#522c65','Reads fetch the four ROM devices. Writes enter the Function Generator and target video RAM at $4000 plus the write address.',chips=[('M761D · 4 KB','$3000–$3FFF','5173781A'),('M761C · 4 KB','$2000–$2FFF','BFF6C97E'),('M761B · 4 KB','$1000–$1FFF','4F28DFD6'),('M761A · 4 KB','$0000–$0FFF','34422147')],code=['PROGRAM_ROM_START equ $0000','PROGRAM_ROM_SIZE  equ $4000','MAGIC_DEST_BASE   equ $4000','TOKEN_TABLE       equ $3EA7'])
for label,text in [('Split access','ROM reads and Function Generator writes share $0000–$3FFF.'),('RAM ownership','$4000–$7FFF is one 16 KB RAM block; gameplay state shares video RAM.'),('TERSE registers','BC = token IP   ·   IY = $002B dispatcher   ·   IX = control stack')]:
    d.rounded_rectangle((34,y,1166,y+62),radius=12,fill='#060d13',outline='#8093a0')
    d.text((53,y+10),label,font=F['small'],fill='#f1c86d');d.text((53,y+34),text,font=font(17),fill='#c7d4de');y+=74
im=im.crop((0,0,W,y+12));(ROOT/'images').mkdir(exist_ok=True)
im.save(ROOT/'images/extra-bases-memory-map.png')
print(f'images/extra-bases-memory-map.png: {W} × {im.height}')

if __name__ == '__main__':
    pass
