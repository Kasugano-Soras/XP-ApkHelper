"""Verify the 1.1 build: manifest, dex strings, page HTML, v1 digests, alignment."""
import sys, zipfile, struct, hashlib, base64, zlib, re
from html.parser import HTMLParser

APK = sys.argv[1]
EXPECT_HEADLINE = "选APK传到车机 Download即可安装，apk.1 自动改名"
EXPECT_ACCEPT = ".apk,.apk.1,application/vnd.android.package-archive,application/octet-stream"
EXPECT_REJECT = "只支持 .apk 或 .apk.1 文件"

z = zipfile.ZipFile(APK)
print("== entries ==")
for i in z.infolist():
    print(f"  {i.filename:28s} method={i.compress_type} size={i.file_size}")

# ---------- 1. manifest ----------
RES_ATTRS = {0x01010001: 'label', 0x01010003: 'name', 0x01010010: 'exported',
             0x0101020C: 'minSdkVersion', 0x0101021B: 'versionCode', 0x0101021C: 'versionName',
             0x01010270: 'targetSdkVersion'}
data = z.read('AndroidManifest.xml')


class StrPool:
    def __init__(self, buf, off):
        htype, hsize, size = struct.unpack_from('<HHI', buf, off)
        self.count, _, flags, str_start, _ = struct.unpack_from('<IIIII', buf, off + 8)
        self.utf8 = bool(flags & 0x100)
        self.buf = buf
        self.base = off + str_start
        self.offsets = list(struct.unpack_from('<%dI' % self.count, buf, off + hsize))

    def get(self, i):
        p = self.base + self.offsets[i]
        if self.utf8:
            for _ in range(2):
                p += 2 if self.buf[p] & 0x80 else 1
            # length was decoded above; simpler: decode rest until NUL
            end = p
            while self.buf[end] != 0:
                end += 1
            return self.buf[p:end].decode('utf-8', 'replace')
        v = struct.unpack_from('<H', self.buf, p)[0]
        p += 4 if v & 0x8000 else 2
        return self.buf[p:p + v * 2].decode('utf-16-le')


pool, rmap, manifest = None, [], {}
off = 8
while off < len(data):
    ctype, hsize, size = struct.unpack_from('<HHI', data, off)
    if ctype == 0x0001 and pool is None:
        pool = StrPool(data, off)
    elif ctype == 0x0180:
        rmap = list(struct.unpack_from('<%dI' % ((size - hsize) // 4), data, off + hsize))
    elif ctype == 0x0102:
        _, name = struct.unpack_from('<II', data, off + 16)
        astart, asize, acount = struct.unpack_from('<HHH', data, off + 24)
        if pool.get(name) == 'manifest':
            for k in range(acount):
                a = off + 16 + astart + k * asize
                _, aname, _ = struct.unpack_from('<III', data, a)
                _, _, dtype, dval = struct.unpack_from('<HBBI', data, a + 12)
                rid = rmap[aname] if aname < len(rmap) else None
                if rid is None:
                    key = pool.get(aname)
                else:
                    key = RES_ATTRS.get(rid, f'0x{rid:08x}')
                manifest[key] = pool.get(dval) if dtype == 0x03 else dval
    off += size
print("\n== manifest ==", manifest)
assert manifest['versionName'] == '1.1.1', manifest
assert manifest['versionCode'] == 2, manifest
assert manifest['package'] == 'com.dsh.apkhelper'

# ---------- 2. dex ----------
dex = z.read('classes.dex')
print("\n== dex header ==")
print("checksum:", struct.unpack_from('<I', dex, 8)[0], "== adler32:", zlib.adler32(dex[12:]) & 0xFFFFFFFF)
print("signature:", dex[12:32].hex()[:16], "== sha1:", hashlib.sha1(dex[32:]).hexdigest()[:16])
assert struct.unpack_from('<I', dex, 8)[0] == (zlib.adler32(dex[12:]) & 0xFFFFFFFF)
assert dex[12:32] == hashlib.sha1(dex[32:]).digest()

assert dex.count(b"accept='.apk,application/vnd.android.package-archive'") == 0, "old accept filter still present"
assert dex.count(b"accept='*/*'") == 0, "wildcard accept still present"
assert dex.count(("accept='" + EXPECT_ACCEPT + "'").encode()) >= 1, "accept filter not patched"
assert b"fixApkName" in dex
assert b"isApk" in dex, "suffix whitelist method missing"
assert EXPECT_REJECT.encode('utf-8') in dex, "reject message missing"
head = EXPECT_HEADLINE.encode('utf-8')   # dex string data is MUTF-8
assert dex.count(head) >= 1, "headline not found in dex"
print("old accept filter removed:", True)
print("new accept filter occurrences:", dex.count(("accept='" + EXPECT_ACCEPT + "'").encode()))
print("headline occurrences:", dex.count(head))
print("rename helper:", b"fixApkName" in dex, "| whitelist:", b"isApk" in dex,
      "| '.apk.1' literal:", b'.apk.1' in dex)

# ---------- 3. html page ----------
string_ids_size, string_ids_off = struct.unpack_from('<II', dex, 0x38)


def uleb(b, p):
    r = s = 0
    while True:
        v = b[p]; p += 1
        r |= (v & 0x7f) << s
        if not v & 0x80:
            return r, p
        s += 7


def mutf8(b, p, n):
    out = []; i = 0
    while i < n:
        a = b[p]
        if a < 0x80:
            out.append(a); p += 1
        elif a & 0xE0 == 0xC0:
            out.append(((a & 0x1f) << 6) | (b[p + 1] & 0x3f)); p += 2
        else:
            out.append(((a & 0xf) << 12) | ((b[p + 1] & 0x3f) << 6) | (b[p + 2] & 0x3f)); p += 3
        i += 1
    return ''.join(chr(c) for c in out)


page = None
for i in range(string_ids_size):
    o = struct.unpack_from('<I', dex, string_ids_off + 4 * i)[0]
    n, p = uleb(dex, o)
    t = mutf8(dex, p, n)
    if t.startswith('<!doctype'):
        page = t
        break
assert page, "page not found in string table"


class P(HTMLParser):
    def __init__(self):
        super().__init__()
        self.inputs, self.h2, self._in_h2, self.title, self._in_title = [], '', False, '', False

    def handle_starttag(self, tag, attrs):
        if tag == 'input':
            self.inputs.append(dict(attrs))
        self._in_h2 = self._in_h2 or tag == 'h2'
        self._in_title = self._in_title or tag == 'title'

    def handle_endtag(self, tag):
        if tag == 'h2':
            self._in_h2 = False
        if tag == 'title':
            self._in_title = False

    def handle_data(self, d):
        if self._in_h2:
            self.h2 += d
        if self._in_title:
            self.title += d


p = P()
p.feed(page)
print("\n== page ==")
print("title   :", p.title)
print("headline:", p.h2)
print("inputs  :", p.inputs)
assert p.h2 == EXPECT_HEADLINE, (p.h2, EXPECT_HEADLINE)
assert p.inputs[0].get('accept') == EXPECT_ACCEPT, p.inputs[0].get('accept')
assert p.inputs[0].get('type') == 'file'
assert '上传' in page and '/upload?name=' in page
assert EXPECT_REJECT in page, "client-side suffix check missing"
assert "f.name.toLowerCase()" in page

# ---------- 4. v1 digests + alignment ----------
print("\n== v1 MANIFEST.MF ==")
mf = z.read('META-INF/MANIFEST.MF').decode('utf-8').replace('\r\n ', '')
ok, checked = True, 0
for block in [b for b in mf.split('\r\n\r\n') if b.strip()]:
    lines = [l for l in block.split('\r\n') if l]
    name = next((l.split(': ', 1)[1] for l in lines if l.startswith('Name: ')), None)
    digest = next((l.split(': ', 1)[1] for l in lines if 'Digest' in l), None)
    if not name or not digest:
        continue
    same = base64.b64encode(hashlib.sha256(z.read(name)).digest()).decode() == digest
    ok = ok and same
    checked += 1
    print(f"  {name:24s} match={same}")
print("v1 digests ok:", ok, "entries checked:", checked)
assert ok

print("\n== alignment (stored entries) ==")
raw = open(APK, 'rb').read()
for i in z.infolist():
    if i.compress_type != 0:
        continue
    nlen, elen = struct.unpack_from('<HH', raw, i.header_offset + 26)
    data_off = i.header_offset + 30 + nlen + elen
    print(f"  {i.filename:24s} off={data_off} align4={data_off % 4 == 0}")
    assert data_off % 4 == 0

print("\n== hashes ==")
print("apk sha256:", hashlib.sha256(raw).hexdigest())
print("all checks passed")
