"""Patch a binary AndroidManifest.xml (AXML): android:versionName and android:versionCode.

Usage: python patch_manifest.py <in.xml> <out.xml> <newVersionName> <newVersionCode>
"""
import sys, struct
import re

ATTR_VERSION_CODE = 0x0101021B
ATTR_VERSION_NAME = 0x0101021C

in_path, out_path, new_name, new_code = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
data = bytearray(open(in_path, 'rb').read())


class StrPool:
    def __init__(self, buf, off):
        htype, hsize, size = struct.unpack_from('<HHI', buf, off)
        assert htype == 0x0001, hex(htype)
        self.off = off
        self.count, self.style_count, flags, self.str_start, self.style_start = \
            struct.unpack_from('<IIIII', buf, off + 8)
        self.utf8 = bool(flags & 0x100)
        self.buf = buf
        self.offsets = list(struct.unpack_from('<%dI' % self.count, buf, off + hsize))

    def str_data_off(self, i):
        """absolute offset of the string payload (after the length prefix(es))"""
        p = self.off + self.str_start + self.offsets[i]
        if self.utf8:
            for _ in range(2):
                if self.buf[p] & 0x80:
                    p += 2
                else:
                    p += 1
            return p
        v = struct.unpack_from('<H', self.buf, p)[0]
        p += 4 if v & 0x8000 else 2
        return p


# locate chunks
pool = None
rmap = []
off = 8
while off < len(data):
    ctype, hsize, size = struct.unpack_from('<HHI', data, off)
    if ctype == 0x0001 and pool is None:
        pool = StrPool(data, off)
    elif ctype == 0x0180:
        n = (size - hsize) // 4
        rmap = list(struct.unpack_from('<%dI' % n, data, off + hsize))
        print("resource map entries:", len(rmap))
    elif ctype == 0x0102:
        _, name_idx = struct.unpack_from('<II', data, off + 16)
        attr_start, attr_size, attr_count = struct.unpack_from('<HHH', data, off + 24)
        for k in range(attr_count):
            a = off + 16 + attr_start + k * attr_size
            ns, aname, rawval = struct.unpack_from('<III', data, a)
            vsize, res0, dtype, dval = struct.unpack_from('<HBBI', data, a + 12)
            rid = rmap[aname] if aname < len(rmap) else None
            print(f"  attr name_idx={aname} rid=0x{rid:08x} type=0x{dtype:02x} data={dval}"
                  if rid else f"  attr name_idx={aname} type=0x{dtype:02x} data={dval}")
            if rid == ATTR_VERSION_CODE:
                print(f"versionCode: type=0x{dtype:02x} value={dval} -> {new_code}")
                struct.pack_into('<I', data, a + 16, new_code)
            elif rid == ATTR_VERSION_NAME:
                print(f"versionName: type=0x{dtype:02x} string_idx={dval}")
                if dtype == 0x03:
                    i = dval
                    p = pool.str_data_off(i)
                    # read encoded length of the current string payload
                    if pool.utf8:
                        n = struct.unpack_from('<B', data, p - 2)[0] \
                            if data[p - 2] & 0x80 == 0 else None
                    raw = new_name.encode('utf-8')
                    old_len = None
                    # detect payload length from the length prefixes
                    q = pool.off + pool.str_start + pool.offsets[i]
                    if pool.utf8:
                        l16, q2 = None, q
                        if data[q] & 0x80:
                            l16 = ((data[q] & 0x7F) << 8) | data[q + 1]
                            q += 2
                        else:
                            l16 = data[q]
                            q += 1
                        if data[q] & 0x80:
                            l8 = ((data[q] & 0x7F) << 8) | data[q + 1]
                            q += 2
                        else:
                            l8 = data[q]
                            q += 1
                        old_len = l8
                        print(f"  pool is UTF-8, old payload len={old_len}, new={len(raw)}")
                        assert old_len == len(raw), "length mismatch: would need pool rebuild"
                        data[q:q + old_len] = raw
                    else:
                        v = struct.unpack_from('<H', data, q)[0]
                        q += 4 if v & 0x8000 else 2
                        old_len = len(new_name)
                        assert v < 0x8000
                        data[q:q + v * 2] = new_name.encode('utf-16-le')
                        print(f"  pool is UTF-16, old len={v}, new={len(new_name)}")
                        assert v == len(new_name)
    off += size

open(out_path, 'wb').write(bytes(data))
print("written", out_path, len(data))
