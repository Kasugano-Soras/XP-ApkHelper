"""给内嵌网页加一段 UA 判断：Android 上移除 accept，让厂商文件选择器不再过滤 APK。
两处 HTML（PAGE 字段 + handle() 内联副本）必须同步。"""
import io, sys

SMALI = r"D:\DoubaoProjects\chats\2026-11-05\new-chat\小鹏p7安装器_分析\decode\smali\com\dsh\apkhelper\HttpUploadServer.smali"

OLD = "<script>function up(){"
NEW = ("<script>if(navigator.userAgent.indexOf(\\'Android\\')>=0)"
       "{document.getElementById(\\'f\\').removeAttribute(\\'accept\\')}"
       "function up(){")

raw = io.open(SMALI, encoding="utf-8").read()
count = raw.count(OLD)
print("命中次数:", count)
assert count == 2, "应该正好两处 HTML，实际 %d" % count

raw = raw.replace(OLD, NEW)
io.open(SMALI, "w", encoding="utf-8", newline="\n").write(raw)
print("已写入，剩余待替换:", raw.count(OLD))
