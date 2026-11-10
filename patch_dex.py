import struct, zlib, hashlib, shutil, os

SRC = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\classes.dex'
DST = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\classes_patched.dex'

data = bytearray(open(SRC, 'rb').read())

OLD = b"accept='.apk,application/vnd.android.package-archive'"
NEW_CORE = b"accept='*/*'"
print("old attr byte length:", len(OLD))
NEW = NEW_CORE + b' ' * (len(OLD) - len(NEW_CORE))  # pad with spaces inside the tag, keep length identical
assert len(NEW) == len(OLD)

count = data.count(OLD)
print("occurrences of old accept attr:", count)
assert count == 1, "expect exactly one occurrence"

pos = data.find(OLD)
print("patch offset:", pos)
assert pos == 398039 + 3 + 1106 - 0 or pos > 0  # sanity

data[pos:pos + len(OLD)] = NEW
print("new bytes at offset:", bytes(data[pos:pos + len(OLD)]))

# --- recompute dex header checksum & signature ---
# checksum = adler32 over everything after the checksum field (offset 12..)
struct.pack_into('<I', data, 8, 0)
data[12:32] = b'\x00' * 20
# signature = SHA-1 over everything after the signature field (offset 32..)
sig = hashlib.sha1(bytes(data[32:])).digest()
data[12:32] = sig
chk = zlib.adler32(bytes(data[12:])) & 0xFFFFFFFF
struct.pack_into('<I', data, 8, chk)
print("new checksum:", chk, "new signature:", sig.hex())

open(DST, 'wb').write(bytes(data))
print("written:", DST, len(data))
