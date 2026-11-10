import re, sys, io

data = open(r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\classes.dex','rb').read()

# ASCII strings
ascii_re = re.compile(rb'[ -~]{4,}')
asciis = ascii_re.findall(data)
# UTF-16LE strings (CJK included)
utf16_re = re.compile(rb'((?:[ -~]\x00)|(?:[\x00-\xff]\x4e)|(?:[\x00-\xff]\x5b)|(?:[\x00-\xff]\x60)){4,}')
utf16s = utf16_re.findall(data)

kw = sys.argv[1] if len(sys.argv)>1 else None

print("=== ASCII strings:", len(asciis), " UTF16 runs:", len(utf16s))
for s in asciis:
    t = s.decode('ascii', 'ignore')
    if kw and kw.lower() not in t.lower():
        continue
    print("A|", t)
for s in utf16s:
    try:
        t = s.decode('utf-16-le', 'ignore')
    except Exception:
        continue
    if kw and kw.lower() not in t.lower():
        continue
    print("U|", t)
