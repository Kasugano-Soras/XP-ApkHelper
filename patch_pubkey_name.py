"""把内置公钥串末尾的 \\u0000 和 root@localhost 前缀去掉，改成规矩的 dsh@car。"""
import io

SMALI = r"D:\DoubaoProjects\chats\2026-11-05\new-chat\小鹏p7安装器_分析\decode\smali\com\dsh\apkhelper\AdbShell.smali"
raw = io.open(SMALI, encoding="utf-8").read()

old1 = " root@localhost dsh@car\\u0000\""
new1 = " dsh@car\""
old2 = " root@localhost\""
new2 = " dsh@car\""

c1 = raw.count(old1)
c2 = raw.count(old2)
print("带 NUL 的串:", c1, " 字段里的孤立 root@localhost:", c2)
assert c1 == 1, c1
assert c2 == 1, c2

raw = raw.replace(old1, new1).replace(old2, new2)
io.open(SMALI, "w", encoding="utf-8", newline="\n").write(raw)
print("改完：剩余 root@localhost =", raw.count("root@localhost"), " 剩余 \\u0000 =", raw.count("\\u0000"))
