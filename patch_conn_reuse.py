"""让 AdbShell.exec 复用同一条 adb 连接：一个 App 会话只握手一次。

约束：原方法 .locals 14，参数 p0/p1 正好落在 v14/v15，所以**不能加局部寄存器**
（加了 p0/p1 会被推到 v16+，所有 4bit 编码的指令全报 Invalid register）。
因此状态全部存静态字段：

- sSock / sOut / sIn  缓存的连接三件套
- sPort               缓存连接的端口
- sCurPort            本次调用端口（成功后才写进 sPort）
- sCmd                本次命令（异常时原样重试用）
- sReuse              本次是否走复用

流程：入口查缓存（端口一致且三件套齐全）→ 复用则跳过 connect/CNXN，
进循环前自己发一个 OPEN("shell:<cmd>")；收到 A_CLSE 正常收尾后把连接存回静态字段、
不再 close；读断/异常时清空缓存，复用连接上异常则用 sCmd 重试一次。
"""
import io

PATH = r"D:\DoubaoProjects\chats\2026-11-05\new-chat\小鹏p7安装器_分析\decode\smali\com\dsh\apkhelper\AdbShell.smali"
src = io.open(PATH, encoding='utf-8').read()

FIELDS = """
.field private static sSock:Ljava/net/Socket;

.field private static sOut:Ljava/io/DataOutputStream;

.field private static sIn:Ljava/io/DataInputStream;

.field private static sPort:I

.field private static sCurPort:I

.field private static sCmd:Ljava/lang/String;

.field private static sReuse:Z

"""

HEAD = """    sput-object p0, Lcom/dsh/apkhelper/AdbShell;->sCmd:Ljava/lang/String;

    sput p1, Lcom/dsh/apkhelper/AdbShell;->sCurPort:I

    const/4 v2, 0x0

    sput-boolean v2, Lcom/dsh/apkhelper/AdbShell;->sReuse:Z

    sget-object v2, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;

    sget v9, Lcom/dsh/apkhelper/AdbShell;->sPort:I

    if-eqz v2, :fresh_conn

    sget-object v3, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;

    if-eqz v3, :fresh_conn

    sget-object v1, Lcom/dsh/apkhelper/AdbShell;->sIn:Ljava/io/DataInputStream;

    if-eqz v1, :fresh_conn

    if-ne v9, p1, :fresh_conn

    const/4 v10, 0x1

    sput-boolean v10, Lcom/dsh/apkhelper/AdbShell;->sReuse:Z

    sget-object v2, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;

    sget-object p1, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;

    const v4, 0x4e584e43

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    move v6, v5

    move v7, v5

    move v8, v5

    goto/16 :conn_ready

    :fresh_conn
    const/4 v1, 0x0

"""

PREOPEN = """    :conn_ready
    sget-boolean v9, Lcom/dsh/apkhelper/AdbShell;->sReuse:Z

    if-eqz v9, :skip_preopen

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "shell:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\\u0000"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    const v10, 0x4e45504f

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-static {p1, v10, v11, v12, v9}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V

    move v6, v11

    :skip_preopen
"""

CACHE_SAVE = """    sput-object v2, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;

    sput-object p1, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;

    sput-object v1, Lcom/dsh/apkhelper/AdbShell;->sIn:Ljava/io/DataInputStream;

    sget v9, Lcom/dsh/apkhelper/AdbShell;->sCurPort:I

    sput v9, Lcom/dsh/apkhelper/AdbShell;->sPort:I

"""

DEAD = """    :dead_conn
    const/4 v9, 0x0

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sIn:Ljava/io/DataInputStream;

"""

CLEAR = """    const/4 v9, 0x0

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sIn:Ljava/io/DataInputStream;

    sget-boolean v9, Lcom/dsh/apkhelper/AdbShell;->sReuse:Z

    if-eqz v9, :no_retry

    sget-object v9, Lcom/dsh/apkhelper/AdbShell;->sCmd:Ljava/lang/String;

    sget v10, Lcom/dsh/apkhelper/AdbShell;->sCurPort:I

    invoke-static {v9, v10}, Lcom/dsh/apkhelper/AdbShell;->exec(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :no_retry
"""


def sub1(text, old, new, tag):
    assert text.count(old) == 1, "%s: count=%d" % (tag, text.count(old))
    return text.replace(old, new)


# 1) 新增静态字段
src = sub1(src, "\n\n# direct methods", FIELDS + "# direct methods", "static fields")

# 2) 入口：检查缓存
src = sub1(src,
           "    .line 40\n    const/4 v1, 0x0\n\n    :try_start_0",
           "    .line 40\n    const/4 v1, 0x0\n\n" + HEAD + "    :try_start_0",
           "entry")

# 3) 收发包循环前：复用连接时自己开通道
src = sub1(src,
           "    move v8, v7\n\n    .line 55",
           "    move v8, v7\n\n" + PREOPEN + "\n    .line 55",
           "preopen")

# 4) readFully 返回 null（连接断了）→ 清缓存
assert src.count("    goto/16 :goto_2\n") == 2, src.count("    goto/16 :goto_2\n")
src = src.replace("    goto/16 :goto_2\n", "    goto/16 :dead_conn\n")

# 5) 通道正常关闭：把连接存回缓存，并跳过后面的 dead 清理块
src = sub1(src,
           "    invoke-static {p1, v9, v12, v8, p0}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V\n\n    .line 86\n    nop",
           "    invoke-static {p1, v9, v12, v8, p0}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V\n\n"
           + CACHE_SAVE +
           "\n    .line 86\n    nop\n\n    goto/16 :goto_2",
           "cache save")

# 6) dead 清理块放在 :goto_2 前面（正常路径已用 goto 跳过）
src = sub1(src,
           "    .line 89\n    :goto_2",
           DEAD + "    .line 89\n    :goto_2",
           "dead block")

# 7) 成功路径不再关闭 socket
src = sub1(src,
           "    .line 94\n    :try_start_2\n    invoke-virtual {v2}, Ljava/net/Socket;->close()V\n    :try_end_2\n"
           "    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0\n\n    goto :goto_3\n\n"
           "    :catch_0\n    move-exception p1\n\n    .line 89\n    :goto_3",
           "    .line 89\n    :goto_3",
           "skip close")

# 8) 异常路径：清缓存（复用连接上失败则重试一次）
src = sub1(src,
           "    .line 91\n    :goto_5\n    :try_start_3",
           "    .line 91\n    :goto_5\n" + CLEAR + "    :try_start_3",
           "catch clear")

# 9) catchall 路径：清缓存
src = sub1(src,
           "    :goto_7\n    if-eqz v1, :cond_a",
           "    :goto_7\n    const/4 v2, 0x0\n\n"
           "    sput-object v2, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;\n\n"
           "    sput-object v2, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;\n\n"
           "    sput-object v2, Lcom/dsh/apkhelper/AdbShell;->sIn:Ljava/io/DataInputStream;\n\n"
           "    if-eqz v1, :cond_a",
           "catchall clear")

# 10) 方法声明加 synchronized（多线程同时安装时不会抢同一条连接）
src = sub1(src,
           ".method public static exec(Ljava/lang/String;I)Ljava/lang/String;",
           ".method public static declared-synchronized exec(Ljava/lang/String;I)Ljava/lang/String;",
           "synchronized")

io.open(PATH, 'w', encoding='utf-8', newline='\n').write(src)
print("patched ->", PATH)
print("sConn refs:", src.count("AdbShell;->sSock"), "| conn_ready:", src.count(":conn_ready"),
      "| fresh:", src.count(":fresh_conn"), "| dead:", src.count(":dead_conn"))
