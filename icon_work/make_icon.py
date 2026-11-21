"""把 source.png（白标黑底）标准化成正方形 App 图标（纯 #000 底，无接缝）。

思路：用原图亮度作为白色标志的 alpha 通道（保留抗锯齿边缘），把背景压成纯黑，
再裁到内容包围盒、等比缩放居中到正方形安全区。这样不会出现「贴图方块」的色差接缝。

输出：
  icon_1024_square.png   1:1、标志居中、安全边距按图标规范
  icon_1024_rounded.png  同上 + 圆角（外部透明），桌面/商店预览用
  mipmap-*/ic_launcher.png  Android 各密度（48/72/96/144/192）
  store_512.png          商店用 512
"""
from pathlib import Path
from PIL import Image, ImageChops, ImageDraw

work = Path(__file__).resolve().parent
src = Image.open(work / "source.png").convert("RGB")
w, h = src.size

# 1) 亮度 → alpha，并把暗背景压掉（bg luma 约 8-14，阈值 18 起步）
lum = src.convert("L")
alpha = lum.point(lambda v: 0 if v <= 18 else min(255, int((v - 18) * 255 / (255 - 18))))
mark = Image.new("RGB", (w, h), (255, 255, 255))
mark.putalpha(alpha)

bbox = alpha.getbbox()
print("source:", src.size, "content bbox:", bbox, "corner luma:", lum.getpixel((5, 5)))
content = mark.crop(bbox)
cw, ch = content.size

# 2) 正方形画布 + 标志最长边占 72%
SIDE = 1024
FILL = 0.72
scale = (SIDE * FILL) / max(cw, ch)
new = (round(cw * scale), round(ch * scale))
content = content.resize(new, Image.LANCZOS)

canvas = Image.new("RGB", (SIDE, SIDE), (0, 0, 0))
canvas.paste(content, ((SIDE - new[0]) // 2, (SIDE - new[1]) // 2), content)
canvas.save(work / "icon_1024_square.png")

# 3) 圆角版
R = round(SIDE * 0.22)
rounded = canvas.convert("RGBA")
trim = Image.new("L", (SIDE, SIDE), 0)
ImageDraw.Draw(trim).rounded_rectangle([0, 0, SIDE - 1, SIDE - 1], radius=R, fill=255)
rounded.putalpha(ImageChops.multiply(rounded.getchannel("A"), trim))
rounded.save(work / "icon_1024_rounded.png")

# 4) 各密度
for name, px in {"mdpi": 48, "hdpi": 72, "xhdpi": 96, "xxhdpi": 144, "xxxhdpi": 192}.items():
    d = work / "mipmap" / name
    d.mkdir(parents=True, exist_ok=True)
    canvas.resize((px, px), Image.LANCZOS).save(d / "ic_launcher.png")

canvas.resize((512, 512), Image.LANCZOS).save(work / "store_512.png")
print("done", new, (work / "icon_1024_square.png").stat().st_size)
