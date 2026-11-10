import struct, sys

DEX = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\classes.dex'
data = open(DEX, 'rb').read()

string_ids_size, string_ids_off = struct.unpack_from('<II', data, 0x38)
print("dex string count:", string_ids_size, "string_ids_off:", hex(string_ids_off))
print("header checksum:", struct.unpack_from('<I', data, 8)[0], "signature:", data[12:32].hex())


def uleb128(buf, pos):
    result = 0
    shift = 0
    while True:
        b = buf[pos]
        pos += 1
        result |= (b & 0x7F) << shift
        if b & 0x80 == 0:
            break
        shift += 7
    return result, pos


def read_mutf8(buf, pos, n):
    out = []
    i = 0
    while i < n:
        a = buf[pos]
        if a == 0:
            break
        if a < 0x80:
            out.append(a); pos += 1; i += 1
        elif a & 0xE0 == 0xC0:
            b = buf[pos + 1]
            v = ((a & 0x1F) << 6) | (b & 0x3F)
            if v != 0:
                out.append(v)
            else:
                out.append(0)
            pos += 2; i += 1
        else:
            b = buf[pos + 1]; c = buf[pos + 2]
            v = ((a & 0x0F) << 12) | ((b & 0x3F) << 6) | (c & 0x3F)
            out.append(v)
            pos += 3; i += 1
    return out, pos, i


strs = []
for i in range(string_ids_size):
    off = struct.unpack_from('<I', data, string_ids_off + 4 * i)[0]
    n, p = uleb128(data, off)
    cps, endp, consumed = read_mutf8(data, p, n)
    text = ''.join(chr(c) if c < 0xD800 or c > 0xDFFF else '' for c in cps)
    raw_len = endp - p
    strs.append({'idx': i, 'off': off, 'utf16': n, 'raw_len': raw_len, 'text': text})

# report entries of interest
print()
print("=== entries containing html / accept / declarative text ===")
for s in strs:
    t = s['text']
    if any(k in t for k in ('<', 'accept', 'Download', 'APK', 'apk', 'upload', 'button', 'title')) and len(t) > 2:
        if '<' in t or 'accept' in t or 'Download' in t:
            print(f"[{s['idx']}] off={s['off']} utf16={s['utf16']} rawlen={s['raw_len']}")
            print("   ", repr(t))

print()
print("=== all strings between page fragments (idx scan) ===")
lo = None
for s in strs:
    if s['text'].startswith('<!doctype'):
        lo = s['idx']
    if lo is not None and s['idx'] <= lo + 12:
        print(f"[{s['idx']}] utf16={s['utf16']} {s['text']!r}")
