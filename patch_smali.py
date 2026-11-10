"""Patch HttpUploadServer.smali for v1.1:
1) upload page headline text + file input accept filter
2) auto-fix the ".apk.1" suffix (WeChat renames downloaded APKs to apk.1)
"""
import io, sys

PATH = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\decode\smali\com\dsh\apkhelper\HttpUploadServer.smali'

NEW_HEADLINE = "选APK传到车机 Download即可安装，apk.1 自动改名"


def esc(text):
    """smali string literal: non-ASCII -> \\uXXXX"""
    out = []
    for ch in text:
        if ord(ch) < 0x80:
            out.append(ch)
        else:
            out.append('\\u%04x' % ord(ch))
    return ''.join(out)


src = io.open(PATH, encoding='utf-8').read()

old_h2 = r'<h2>\u4f20\u5230\u8f66\u673a Download</h2>'
new_h2 = '<h2>' + esc(NEW_HEADLINE) + '</h2>'
assert src.count(old_h2) == 2, src.count(old_h2)
src = src.replace(old_h2, new_h2)

old_accept = r"accept=\'.apk,application/vnd.android.package-archive\'"
new_accept = r"accept=\'*/*\'"
assert src.count(old_accept) == 2, src.count(old_accept)
src = src.replace(old_accept, new_accept)

# --- call the suffix fixer right after the upload file name is resolved ---
call_anchor = """    :goto_5
    new-instance v2, Ljava/io/File;
"""
assert src.count(call_anchor) == 1
call_patch = """    :goto_5
    invoke-static {v6}, Lcom/dsh/apkhelper/HttpUploadServer;->fixApkName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v2, Ljava/io/File;
"""
src = src.replace(call_anchor, call_patch)

# --- helper method: xxxx.apk.1 -> xxxx.apk ---
helper = """
.method private static fixApkName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".apk.1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_rename

    return-object p0

    :cond_rename
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

# virtual methods"""

assert src.count("\n# virtual methods") == 1
src = src.replace("\n# virtual methods", helper, 1)

io.open(PATH, 'w', encoding='utf-8', newline='\n').write(src)
print("patched:", PATH)
print("headline:", esc(NEW_HEADLINE))
