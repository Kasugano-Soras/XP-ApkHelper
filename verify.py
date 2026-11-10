import zipfile, struct, hashlib, re, io, sys
from html.parser import HTMLParser

APK = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\signed\unsigned-aligned-signed.apk'
z = zipfile.ZipFile(APK)

print("== entries ==")
for i in z.infolist():
    print(f"  {i.filename:26s} method={i.compress_type} size={i.file_size}")

# 1) dex string table check straight from the signed apk
dex = z.read('classes.dex')
print("\n== dex ==")
print("checksum in header:", struct.unpack_from('<I', dex, 8)[0])
print("recomputed adler32:", __import__('zlib').adler32(dex[12:]) & 0xFFFFFFFF)
print("signature in header:", dex[12:32].hex())
print("recomputed sha1   :", hashlib.sha1(dex[32:]).hexdigest())

m = re.search(rb"accept='([^']*)'\s*>", dex)
print("accept attr in dex:", m.group(0)[:80] if m else "NOT FOUND")
print("accept value:", repr(m.group(1)) if m else None)

# extract whole page string from string table and validate html
string_ids_size, string_ids_off = struct.unpack_from('<II', dex, 0x38)


def uleb(b, p):
    r = 0; s = 0
    while True:
        v = b[p]; p += 1
        r |= (v & 0x7f) << s
        if not v & 0x80:
            break
        s += 7
    return r, p


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
    off = struct.unpack_from('<I', dex, string_ids_off + 4 * i)[0]
    n, p = uleb(dex, off)
    t = mutf8(dex, p, n)
    if t.startswith('<!doctype'):
        page = t
        break
print("\n== html page found ==", bool(page), "len:", len(page) if page else 0)


class P(HTMLParser):
    def __init__(self):
        super().__init__()
        self.inputs = []
        self.title = ''
        self._intitle = False

    def handle_starttag(self, tag, attrs):
        if tag == 'input':
            self.inputs.append(dict(attrs))
        if tag == 'title':
            self._intitle = True

    def handle_endtag(self, tag):
        if tag == 'title':
            self._intitle = False

    def handle_data(self, d):
        if self._intitle:
            self.title += d


p = P()
p.feed(page)
print("title:", p.title)
print("input tag attrs:", p.inputs)
assert p.inputs and p.inputs[0].get('type') == 'file'
assert p.inputs[0].get('accept') in ('*/*', None), p.inputs[0]

# 2) v1 manifest digest check for every entry
print("\n== v1 MANIFEST.MF digests ==")
mf = z.read('META-INF/MANIFEST.MF').decode('utf-8')
print(repr(mf[:400]))
# unfold continuation lines (72-byte wrapping uses a leading space)
joined = mf.replace('\r\n ', '')
blocks = [b for b in joined.split('\r\n\r\n') if b.strip()]
ok = True
checked = 0
for b in blocks:
    lines = [l for l in b.split('\r\n') if l]
    name = next((l.split(': ', 1)[1] for l in lines if l.startswith('Name: ')), None)
    digest = next((l.split(': ', 1)[1] for l in lines if 'Digest' in l), None)
    if not name or not digest:
        print("  skip block:", lines[:1])
        continue
    actual = __import__('base64').b64encode(hashlib.sha256(z.read(name)).digest()).decode()
    same = actual == digest
    ok = ok and same
    checked += 1
    print(f"  {name:24s} match={same}")
print("MANIFEST coverage ok:", ok, "| entries checked:", checked, "| zip entries:", len(z.infolist()))

# 3) APK Signature Scheme v2 block presence
raw = open(APK, 'rb').read()
idx = raw.rfind(b'APK Sig Block 42')
print("\n== v2 block ==", "found" if idx > 0 else "NOT FOUND", "at", hex(idx))
if idx > 0:
    # the block size is the 8 bytes right before the magic
    size = struct.unpack_from('<Q', raw, idx - 24)[0]
    print("block size field:", size)
    ids = b''
    start = idx - 24 - size
    print("speculated block start:", hex(start))

print("\n== manifest xml (package / sdk) ==")
ax = z.read('AndroidManifest.xml')
print("manifest size:", len(ax))
