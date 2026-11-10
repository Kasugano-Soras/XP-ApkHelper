"""Rewrite the upload page headline (both copies in HttpUploadServer.smali)."""
import io

PATH = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\decode\smali\com\dsh\apkhelper\HttpUploadServer.smali'

OLD_HEADLINE = "选择APK传到车机 Download目录以安装，支持apk.1 自动重命名为正确后缀"
NEW_HEADLINE = "选APK传到车机 Download即可安装，apk.1 自动改名"


def esc(text):
    out = []
    for ch in text:
        out.append(ch if ord(ch) < 0x80 else '\\u%04x' % ord(ch))
    return ''.join(out)


src = io.open(PATH, encoding='utf-8').read()
old_h2 = '<h2>' + esc(OLD_HEADLINE) + '</h2>'
new_h2 = '<h2>' + esc(NEW_HEADLINE) + '</h2>'
assert src.count(old_h2) == 2, src.count(old_h2)
src = src.replace(old_h2, new_h2)
io.open(PATH, 'w', encoding='utf-8', newline='\n').write(src)
print("headline replaced 2x ->", NEW_HEADLINE)
print("smali literal:", esc(NEW_HEADLINE))
