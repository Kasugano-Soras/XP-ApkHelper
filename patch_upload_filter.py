"""Restrict uploads to .apk / .apk.1 without breaking the iOS file picker.

Two layers:
1. page JS: reject any other suffix before the upload starts (instant feedback)
2. server side: after the name is normalized, refuse and delete nothing - return 400
"""
import io

PATH = r'C:\Users\kougo\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析\decode\smali\com\dsh\apkhelper\HttpUploadServer.smali'

MSG = "只支持 .apk 或 .apk.1 文件"
NEW_ACCEPT = r"accept=\'.apk,.apk.1,application/vnd.android.package-archive,application/octet-stream\'"

OLD_ACCEPT = r"accept=\'*/*\'"
OLD_JS = r"if(!f){return}var x=new XMLHttpRequest();"


def esc(text):
    return ''.join(ch if ord(ch) < 0x80 else '\\u%04x' % ord(ch) for ch in text)


new_js = (r"if(!f){return}"
          r"var n=f.name.toLowerCase();"
          r"if(n.slice(-4)!=\'.apk\'&&n.slice(-6)!=\'.apk.1\')"
          r"{document.getElementById(\'s\').textContent=\'" + esc(MSG) + r"\';return}"
          r"var x=new XMLHttpRequest();")

src = io.open(PATH, encoding='utf-8').read()

assert src.count(OLD_ACCEPT) == 2, src.count(OLD_ACCEPT)
src = src.replace(OLD_ACCEPT, NEW_ACCEPT)

assert src.count(OLD_JS) == 2, src.count(OLD_JS)
src = src.replace(OLD_JS, new_js)

anchor = """    :goto_5
    invoke-static {v6}, Lcom/dsh/apkhelper/HttpUploadServer;->fixApkName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v2, Ljava/io/File;
"""
assert src.count(anchor) == 1, src.count(anchor)

guard = """    :goto_5
    invoke-static {v6}, Lcom/dsh/apkhelper/HttpUploadServer;->fixApkName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/dsh/apkhelper/HttpUploadServer;->isApk(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_apk_ok

    const-string v0, "text/plain; charset=utf-8"

    const-string v2, "MSG_PLACEHOLDER"

    sget-object v3, Lcom/dsh/apkhelper/HttpUploadServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    const/16 v3, 0x190

    invoke-direct {p0, v1, v3, v0, v2}, Lcom/dsh/apkhelper/HttpUploadServer;->respond(Ljava/io/OutputStream;ILjava/lang/String;[B)V

    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    return-void

    :cond_apk_ok
    new-instance v2, Ljava/io/File;
""".replace("MSG_PLACEHOLDER", esc(MSG))
src = src.replace(anchor, guard)

helper = """
.method private static isApk(Ljava/lang/String;)Z
    .locals 2

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".apk"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

# virtual methods"""
assert src.count("\n# virtual methods") == 1
src = src.replace("\n# virtual methods", helper, 1)

io.open(PATH, 'w', encoding='utf-8', newline='\n').write(src)
print("accept:", NEW_ACCEPT)
print("msg   :", esc(MSG))
print("js    :", new_js)
