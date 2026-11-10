"""End-to-end check against the running upload server (adb-forwarded to 127.0.0.1:18080)."""
import sys, http.client, urllib.parse, hashlib

HOST, PORT = "127.0.0.1", 18080


def get_page():
    c = http.client.HTTPConnection(HOST, PORT, timeout=20)
    c.request("GET", "/")
    r = c.getresponse()
    body = r.read()
    c.close()
    return r.status, body.decode("utf-8")


def upload(name, payload):
    q = urllib.parse.quote(name, safe="")
    c = http.client.HTTPConnection(HOST, PORT, timeout=60)
    headers = {"Content-Length": str(len(payload)), "Content-Type": "application/octet-stream"}
    c.request("POST", "/upload?name=" + q, body=payload, headers=headers)
    r = c.getresponse()
    body = r.read()
    st = r.status
    c.close()
    return st, body.decode("utf-8", "replace")


status, page = get_page()
print("GET / ->", status)
for probe in ("<h2>", "accept=", "f.name.toLowerCase()"):
    i = page.find(probe)
    print(f"  {probe!r} @ {i}: ...{page[max(0, i - 20):i + 120]}...")

payload = bytes(range(256)) * 400  # ~100 KB, not a real apk, just content
print("\nsha256(payload):", hashlib.sha256(payload).hexdigest())

for name in ["微信下载包.apk.1", "普通文件.apk", "别的东西.apk.1", "说明文档.zip", "图片.jpg"]:
    st, resp = upload(name, payload)
    print(f"\nPOST name={name!r} -> {st}: {resp!r}")
