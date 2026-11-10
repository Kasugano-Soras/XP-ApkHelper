"""Rewrite android:versionName in a binary AndroidManifest.xml (AXML).

Unlike patch_manifest.py this can change the string LENGTH: it rebuilds the
string pool in place (same string count, so every index stays valid) and
patches the outer chunk size.
"""
import sys, struct

UTF8_FLAG = 0x100
SORTED_FLAG = 0x0001
ATTR_VERSION_NAME = 0x0101021C


def decode_str(data, p, utf8):
    if utf8:
        if data[p] & 0x80:
            n16 = ((data[p] & 0x7F) << 8) | data[p + 1]; p += 2
        else:
            n16 = data[p]; p += 1
        if data[p] & 0x80:
            n8 = ((data[p] & 0x7F) << 8) | data[p + 1]; p += 2
        else:
            n8 = data[p]; p += 1
        return bytes(data[p:p + n8]).decode('utf-8')
    v = struct.unpack_from('<H', data, p)[0]
    if v & 0x8000:
        n = ((v & 0x7FFF) << 16) | struct.unpack_from('<H', data, p + 2)[0]; p += 4
    else:
        n = v; p += 2
    return bytes(data[p:p + n * 2]).decode('utf-16-le')


def encode_str(s, utf8):
    if utf8:
        b = s.encode('utf-8')
        n16 = len(s.encode('utf-16-le')) // 2
        pre = bytes([n16]) if n16 < 0x80 else struct.pack('<H', 0x8000 | n16)
        pre += bytes([len(b)]) if len(b) < 0x80 else struct.pack('<H', 0x8000 | len(b))
        return pre + b + b'\x00'
    b = s.encode('utf-16-le')
    n = len(b) // 2
    assert n < 0x8000
    # 原包的池里每个串都带一个 0x0000 终止符，aapt2 解析时按这个布局校验
    return struct.pack('<H', n) + b + b'\x00\x00'


in_path, out_path, new_name = sys.argv[1], sys.argv[2], sys.argv[3]
data = bytearray(open(in_path, 'rb').read())

# ---- locate string pool + resource map + versionName attribute ----
off, pool, rmap, name_idx, attr_pos = 8, None, [], None, None
while off < len(data):
    ctype, hsize, size = struct.unpack_from('<HHI', data, off)
    if ctype == 0x0001 and pool is None:
        count, style_count, flags, str_start, style_start = struct.unpack_from('<IIIII', data, off + 8)
        pool = dict(off=off, size=size, hsize=hsize, count=count, style_count=style_count,
                    flags=flags, str_start=str_start, style_start=style_start,
                    offsets=struct.unpack_from('<%dI' % count, data, off + hsize))
    elif ctype == 0x0180:
        n = (size - hsize) // 4
        rmap = list(struct.unpack_from('<%dI' % n, data, off + hsize))
    elif ctype == 0x0102:
        attr_start, attr_size, attr_count = struct.unpack_from('<HHH', data, off + 24)
        for k in range(attr_count):
            a = off + 16 + attr_start + k * attr_size
            ns, aname, rawval = struct.unpack_from('<III', data, a)
            vsize, res0, dtype, dval = struct.unpack_from('<HBBI', data, a + 12)
            rid = rmap[aname] if aname < len(rmap) else None
            if rid == ATTR_VERSION_NAME:
                name_idx, attr_pos = dval, a
    off += size

assert pool, "string pool not found"
assert name_idx is not None, "versionName attribute not found"
assert pool['style_count'] == 0, "style spans present, rebuild not implemented"
utf8 = bool(pool['flags'] & UTF8_FLAG)

strings = []
for o in pool['offsets']:
    strings.append(decode_str(data, pool['off'] + pool['str_start'] + o, utf8))
print("pool: count=%d utf8=%s size=%d" % (pool['count'], utf8, pool['size']))
print("versionName idx=%d old=%r new=%r" % (name_idx, strings[name_idx], new_name))
strings[name_idx] = new_name

# ---- rebuild pool (same count -> all indices still valid) ----
chunks = [encode_str(s, utf8) for s in strings]
offsets, pos = [], 0
for c in chunks:
    offsets.append(pos)
    pos += len(c)
pad = (-pos) % 4          # 字符串数据区按 4 字节对齐（原包同样有尾部填充）
chunks.append(b'\x00' * pad)
pos += pad
strings_start = pool['hsize'] + 4 * pool['count']
pool_size = strings_start + pos
flags = pool['flags'] & ~SORTED_FLAG
header = struct.pack('<HHI', 0x0001, pool['hsize'], pool_size)
header += struct.pack('<IIIII', pool['count'], 0, flags, strings_start, 0)
new_pool = header + struct.pack('<%dI' % pool['count'], *offsets) + b''.join(chunks)

rest = data[pool['off'] + pool['size']:]
out = bytearray(data[:pool['off']]) + new_pool + rest
old_hsize = struct.unpack_from('<H', data, 2)[0]
struct.pack_into('<HHI', out, 0, 0x0003, old_hsize, len(out))

open(out_path, 'wb').write(bytes(out))
print("written %s (%d -> %d bytes, pool %d -> %d)" % (out_path, len(data), len(out), pool['size'], pool_size))
