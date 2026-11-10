import struct, sys

AXML = sys.argv[1] if len(sys.argv) > 1 else r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\AndroidManifest.xml'
data = open(AXML, 'rb').read()

RES_ATTRS = {
    0x01010001: 'android:label',
    0x01010003: 'android:name',
    0x01010010: 'android:exported',
    0x01010018: 'android:authorities',
    0x0101001D: 'android:debuggable',
    0x01010020: 'android:icon',
    0x0101020C: 'android:minSdkVersion',
    0x0101021B: 'android:versionCode',
    0x0101021C: 'android:versionName',
    0x01010270: 'android:targetSdkVersion',
    0x01010271: 'android:maxSdkVersion',
    0x0101021E: 'android:process',
    0x01010225: 'android:theme',
    0x010103EC: 'android:usesCleartextTraffic',
    0x0101049F: 'android:isSplitRequired',
    0x0101054C: 'android:requestLegacyExternalStorage',
}


class StrPool:
    def __init__(self, buf, off):
        self.buf = buf
        htype, hsize, size = struct.unpack_from('<HHI', buf, off)
        count, style_count, flags, strings_start, styles_start = struct.unpack_from('<IIIII', buf, off + 8)
        self.utf8 = bool(flags & 0x100)
        self.offsets = [struct.unpack_from('<I', buf, off + hsize + 4 * i)[0] for i in range(count)]
        self.base = off + strings_start
        self.cache = {}

    def get(self, i):
        if i in self.cache:
            return self.cache[i]
        if i < 0 or i >= len(self.offsets):
            return None
        p = self.base + self.offsets[i]
        if self.utf8:
            # utf16 len then utf8 len (both varint of 1-2 bytes)
            hl, p = self._len8(p)
            hl2, p = self._len8(p)
            raw = self.buf[p:p + hl2]
            s = raw.decode('utf-8', 'replace')
        else:
            hl, p = self._len16(p)
            raw = self.buf[p:p + hl * 2]
            s = raw.decode('utf-16-le', 'replace')
        self.cache[i] = s
        return s

    def _len8(self, p):
        v = self.buf[p]
        if v & 0x80:
            return ((v & 0x7F) << 8) | self.buf[p + 1], p + 2
        return v, p + 1

    def _len16(self, p):
        v = struct.unpack_from('<H', self.buf, p)[0]
        if v & 0x8000:
            return ((v & 0x7FFF) << 16) | struct.unpack_from('<H', self.buf, p + 2)[0], p + 4
        return v, p + 2


off = 8
pool = None
rmap = []
lines = []
depth = 0
while off < len(data):
    ctype, hsize, size = struct.unpack_from('<HHI', data, off)
    if ctype == 0x0001:
        pool = StrPool(data, off)
    elif ctype == 0x0180:
        n = (size - hsize) // 4
        rmap = list(struct.unpack_from('<%dI' % n, data, off + hsize))
    elif ctype == 0x0102:
        ns, name = struct.unpack_from('<II', data, off + 16)
        attr_start, attr_size, attr_count = struct.unpack_from('<HHH', data, off + 24)
        nm = pool.get(name)
        attrs = []
        for k in range(attr_count):
            aoff = off + 16 + attr_start + k * attr_size
            ans, aname, rawval = struct.unpack_from('<III', data, aoff)
            vsize, res0, dtype, dval = struct.unpack_from('<HBBI', data, aoff + 12)
            akey = aname
            if ans == 0xFFFFFFFF and 0 <= aname < len(rmap):
                aname_id = rmap[aname]
                aname_txt = RES_ATTRS.get(aname_id, 'attr#0x%08x' % aname_id)
            else:
                aname_txt = pool.get(aname)
            if dtype == 0x03:
                val = repr(pool.get(dval))
            elif dtype == 0x12:
                val = 'true' if dval else 'false'
            elif dtype in (0x10, 0x11):
                val = str(dval)
            elif dtype == 0x01:
                val = '@ref/0x%08x' % dval
            else:
                val = 'type0x%x:%d' % (dtype, dval)
            attrs.append('%s=%s' % (aname_txt, val))
        lines.append('  ' * depth + '<%s %s>' % (nm, ' '.join(attrs)))
        depth += 1
    elif ctype == 0x0103:
        depth -= 1
        ns, name = struct.unpack_from('<II', data, off + 16)
        lines.append('  ' * depth + '</%s>' % pool.get(name))
    off += size

print('\n'.join(lines))
