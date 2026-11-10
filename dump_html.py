import re

path = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\classes.dex'
data = open(path, 'rb').read()

print("=== ASCII strings with markup ===")
for m in re.finditer(rb'[ -~]{4,}', data):
    t = m.group().decode('ascii')
    if '<' in t or '>' in t or 'html' in t.lower():
        print("----", m.start(), "----")
        print(t)

print()
print("=== UTF-16LE runs with CJK ===")
for m in re.finditer(rb'(?:[ -~]\x00){4,}|(?:(?:[\x00-\xff]\x4e)|(?:[\x00-\xff]\x5b)|(?:[\x00-\xff]\x8b)|(?:[\x00-\xff]\x8f)){2,}', data):
    raw = m.group()
    if b'\x00' not in raw:
        continue
    try:
        t = raw.decode('utf-16-le')
    except Exception:
        continue
    if any('\u4e00' <= ch <= '\u9fff' for ch in t):
        print("----", m.start(), "----")
        print(t)
