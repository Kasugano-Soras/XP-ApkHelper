"""用 aapt2 给 APK 补建资源表（图标）并写入 versionName=1.20 / versionCode=6。

aapt2 link 产出带 resources.arsc + res/ + 二进制 AndroidManifest 的底座包；
再把 apktool 编好的 classes.dex 装进去，得到待签名 APK。
"""
import shutil
import subprocess
import sys
import zipfile
from pathlib import Path

work = Path(__file__).resolve().parent          # build/
proj = work.parent
BT = Path(r"D:\Android\Sdk\build-tools\36.0.0")
AAPT2 = BT / "aapt2.exe"
ANDROID_JAR = Path(r"D:\Android\Sdk\platforms\android-36\android.jar")

# aapt2 不认中文路径，资源与清单先落到纯 ASCII 的暂存目录
stage = Path(r"C:\Users\kougo\AppData\Local\Temp\apkhelper_aapt")
stage.mkdir(parents=True, exist_ok=True)

res_dir = stage / "res"
res_zip = stage / "res.zip"
base_apk = stage / "base-with-res.apk"
dex_apk = work / "apkhelper-1.20-test.apk"
out_apk = work / "apkhelper-1.20-unsigned.apk"
manifest_txt = stage / "AndroidManifest.xml"

# 1) 资源目录：只放图标
if res_dir.exists():
    shutil.rmtree(res_dir)
for dens in ["mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi"]:
    d = res_dir / f"mipmap-{dens}"
    d.mkdir(parents=True)
    shutil.copy2(proj / "icon_work" / "mipmap" / dens / "ic_launcher.png", d / "ic_launcher.png")
shutil.copy2(work / "AndroidManifest_1.20.xml", manifest_txt)

if res_zip.exists():
    res_zip.unlink()


def run(argv, label):
    p = subprocess.run(argv, capture_output=True, text=True, encoding="utf-8", errors="replace")
    print(f"[{label}] rc={p.returncode}")
    for stream in (p.stdout, p.stderr):
        if stream.strip():
            print(stream.strip())
    if p.returncode != 0:
        sys.exit(f"{label} 失败")


run([str(AAPT2), "compile", "--dir", str(res_dir), "-o", str(res_zip)], "aapt2 compile")
run([
    str(AAPT2), "link",
    "-o", str(base_apk),
    "--manifest", str(manifest_txt),
    "-I", str(ANDROID_JAR),
    str(res_zip),
], "aapt2 link")

# 2) 合并 classes.dex
with zipfile.ZipFile(base_apk) as z:
    names = z.namelist()
print("base entries:", names)

dex = None
with zipfile.ZipFile(dex_apk) as z:
    for name in z.namelist():
        if name == "classes.dex":
            dex = z.read(name)
if dex is None:
    sys.exit("apktool 产物里没有 classes.dex")

if out_apk.exists():
    out_apk.unlink()
with zipfile.ZipFile(base_apk) as src, zipfile.ZipFile(out_apk, "w") as dst:
    for name in src.namelist():
        if name.endswith("/"):
            continue
        # targetSdk>=30 要求 resources.arsc 不压缩；res/ 里的 png 也保持 store
        method = zipfile.ZIP_STORED if (name == "resources.arsc" or name.startswith("res/")) \
            else zipfile.ZIP_DEFLATED
        dst.writestr(zipfile.ZipInfo(name, date_time=(1980, 1, 1, 0, 0, 0)), src.read(name),
                     compress_type=method)
    dst.writestr("classes.dex", dex, compress_type=zipfile.ZIP_DEFLATED)

print("built:", out_apk, out_apk.stat().st_size)
