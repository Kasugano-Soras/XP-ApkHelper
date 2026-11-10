"""Compare zip entries of two APKs (sizes / compression / content hashes)."""
import sys, zipfile, hashlib

a_path, b_path = sys.argv[1], sys.argv[2]
a = zipfile.ZipFile(a_path)
b = zipfile.ZipFile(b_path)

print("orig:", [(i.filename, i.compress_type, i.file_size) for i in a.infolist()])
print("new :", [(i.filename, i.compress_type, i.file_size) for i in b.infolist()])

for n in sorted(set(a.namelist()) & set(b.namelist())):
    da, db = a.read(n), b.read(n)
    print(f"{n:24s} same={da == db} len {len(da)}/{len(db)} "
          f"sha1 {hashlib.sha1(da).hexdigest()[:12]}/{hashlib.sha1(db).hexdigest()[:12]}")
