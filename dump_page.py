import re

path = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\classes.dex'
data = open(path, 'rb').read()

# find the anchor and print surrounding raw bytes
anchor = b"Download</h2>"
i = data.find(anchor)
print("anchor offset:", i)
if i > 0:
    start = max(0, i - 2500)
    end = min(len(data), i + 3500)
    chunk = data[start:end]
    # split on NULs (string_item terminators) for readability
    for part in chunk.split(b'\x00'):
        # printable ascii runs
        for m in re.finditer(rb'[ -~]{3,}', part):
            print(repr(m.group().decode('ascii')))
    print("---- raw hexdump region around anchor ----")
    print(chunk[i - start - 60 : i - start + 300])
