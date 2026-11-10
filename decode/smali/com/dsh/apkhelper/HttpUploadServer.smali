.class public Lcom/dsh/apkhelper/HttpUploadServer;
.super Ljava/lang/Object;
.source "HttpUploadServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dsh/apkhelper/HttpUploadServer$Listener;
    }
.end annotation


# static fields
.field private static final PAGE:Ljava/lang/String; = "<!doctype html><html><head><meta charset=utf-8><meta name=viewport content=\'width=device-width,initial-scale=1\'><title>\u4f20\u5230\u8f66\u673a</title><style>body{font-family:sans-serif;margin:0;padding:24px;background:#111;color:#eee}h2{margin:0 0 16px}#f{color:#eee}button{margin-top:16px;padding:12px 28px;font-size:16px;border:0;border-radius:8px;background:#2e7d32;color:#fff}#s{margin-top:16px;color:#9ccc65;white-space:pre-wrap}</style></head><body><h2>\u9009APK\u4f20\u5230\u8f66\u673a Download\u5373\u53ef\u5b89\u88c5\uff0capk.1 \u81ea\u52a8\u6539\u540d</h2><input id=f type=file accept=\'.apk,.apk.1,application/vnd.android.package-archive,application/octet-stream\'><br><button onclick=\'up()\'>\u4e0a\u4f20</button><div id=s></div><script>if(navigator.userAgent.indexOf(\'Android\')>=0){document.getElementById(\'f\').removeAttribute(\'accept\')}function up(){var f=document.getElementById(\'f\').files[0];if(!f){return}var n=f.name.toLowerCase();if(n.slice(-4)!=\'.apk\'&&n.slice(-6)!=\'.apk.1\'){document.getElementById(\'s\').textContent=\'\u53ea\u652f\u6301 .apk \u6216 .apk.1 \u6587\u4ef6\';return}var x=new XMLHttpRequest();x.open(\'POST\',\'/upload?name=\'+encodeURIComponent(f.name));x.upload.onprogress=function(e){document.getElementById(\'s\').textContent=(e.loaded/1048576).toFixed(1)+\' / \'+(e.total/1048576).toFixed(1)+\' MB\'};x.onload=function(){document.getElementById(\'s\').textContent=x.responseText};x.onerror=function(){document.getElementById(\'s\').textContent=\'\u4e0a\u4f20\u5931\u8d25\'};x.send(f)}</script></body></html>"

.field private static final UTF8:Ljava/nio/charset/Charset;


# instance fields
.field private final dest:Ljava/io/File;

.field private final listener:Lcom/dsh/apkhelper/HttpUploadServer$Listener;

.field private final port:I

.field private volatile running:Z

.field private server:Ljava/net/ServerSocket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/dsh/apkhelper/HttpUploadServer;->UTF8:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;ILcom/dsh/apkhelper/HttpUploadServer$Listener;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/dsh/apkhelper/HttpUploadServer;->dest:Ljava/io/File;

    .line 34
    iput p2, p0, Lcom/dsh/apkhelper/HttpUploadServer;->port:I

    .line 35
    iput-object p3, p0, Lcom/dsh/apkhelper/HttpUploadServer;->listener:Lcom/dsh/apkhelper/HttpUploadServer$Listener;

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/dsh/apkhelper/HttpUploadServer;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/dsh/apkhelper/HttpUploadServer;->loop()V

    return-void
.end method

.method private handle(Ljava/net/Socket;)V
    .locals 14

    .line 75
    const/16 v0, 0x4e20

    :try_start_0
    invoke-virtual {p1, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 76
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 77
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 79
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 80
    :goto_0
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    const/16 v4, 0x4000

    if-ge v3, v4, :cond_2

    .line 81
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 82
    if-gez v3, :cond_0

    goto :goto_1

    .line 83
    :cond_0
    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 84
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 85
    array-length v5, v3

    .line 86
    const/4 v6, 0x4

    if-lt v5, v6, :cond_1

    add-int/lit8 v6, v5, -0x4

    aget-byte v6, v3, v6

    const/16 v7, 0xd

    if-ne v6, v7, :cond_1

    add-int/lit8 v6, v5, -0x3

    aget-byte v6, v3, v6

    const/16 v8, 0xa

    if-ne v6, v8, :cond_1

    add-int/lit8 v6, v5, -0x2

    aget-byte v6, v3, v6

    if-ne v6, v7, :cond_1

    add-int/lit8 v5, v5, -0x1

    aget-byte v3, v3, v5

    if-ne v3, v8, :cond_1

    .line 88
    goto :goto_1

    .line 90
    :cond_1
    goto :goto_0

    .line 92
    :cond_2
    :goto_1
    new-instance v3, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    sget-object v5, Lcom/dsh/apkhelper/HttpUploadServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v2, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 93
    const-string v2, "\r\n"

    invoke-virtual {v3, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 94
    array-length v3, v2

    if-nez v3, :cond_3

    .line 95
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 96
    return-void

    .line 98
    :cond_3
    const/4 v3, 0x0

    aget-object v5, v2, v3

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 99
    array-length v6, v5

    const/4 v7, 0x2

    if-ge v6, v7, :cond_4

    .line 100
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 101
    return-void

    .line 103
    :cond_4
    aget-object v6, v5, v3

    .line 104
    const/4 v7, 0x1

    aget-object v5, v5, v7

    .line 106
    nop

    .line 107
    const-wide/16 v8, 0x0

    move-wide v10, v8

    :goto_2
    array-length v12, v2

    if-ge v7, v12, :cond_6

    .line 108
    aget-object v12, v2, v7

    invoke-virtual {v12}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    .line 109
    const-string v13, "content-length:"

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v12, :cond_5

    .line 111
    :try_start_1
    aget-object v12, v2, v7

    const/16 v13, 0xf

    invoke-virtual {v12, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 113
    goto :goto_3

    .line 112
    :catch_0
    move-exception v12

    .line 107
    :cond_5
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 117
    :cond_6
    :try_start_2
    const-string v2, "GET"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/16 v7, 0xc8

    if-eqz v2, :cond_7

    .line 118
    const-string v0, "text/html; charset=utf-8"

    const-string v2, "<!doctype html><html><head><meta charset=utf-8><meta name=viewport content=\'width=device-width,initial-scale=1\'><title>\u4f20\u5230\u8f66\u673a</title><style>body{font-family:sans-serif;margin:0;padding:24px;background:#111;color:#eee}h2{margin:0 0 16px}#f{color:#eee}button{margin-top:16px;padding:12px 28px;font-size:16px;border:0;border-radius:8px;background:#2e7d32;color:#fff}#s{margin-top:16px;color:#9ccc65;white-space:pre-wrap}</style></head><body><h2>\u9009APK\u4f20\u5230\u8f66\u673a Download\u5373\u53ef\u5b89\u88c5\uff0capk.1 \u81ea\u52a8\u6539\u540d</h2><input id=f type=file accept=\'.apk,.apk.1,application/vnd.android.package-archive,application/octet-stream\'><br><button onclick=\'up()\'>\u4e0a\u4f20</button><div id=s></div><script>if(navigator.userAgent.indexOf(\'Android\')>=0){document.getElementById(\'f\').removeAttribute(\'accept\')}function up(){var f=document.getElementById(\'f\').files[0];if(!f){return}var n=f.name.toLowerCase();if(n.slice(-4)!=\'.apk\'&&n.slice(-6)!=\'.apk.1\'){document.getElementById(\'s\').textContent=\'\u53ea\u652f\u6301 .apk \u6216 .apk.1 \u6587\u4ef6\';return}var x=new XMLHttpRequest();x.open(\'POST\',\'/upload?name=\'+encodeURIComponent(f.name));x.upload.onprogress=function(e){document.getElementById(\'s\').textContent=(e.loaded/1048576).toFixed(1)+\' / \'+(e.total/1048576).toFixed(1)+\' MB\'};x.onload=function(){document.getElementById(\'s\').textContent=x.responseText};x.onerror=function(){document.getElementById(\'s\').textContent=\'\u4e0a\u4f20\u5931\u8d25\'};x.send(f)}</script></body></html>"

    sget-object v3, Lcom/dsh/apkhelper/HttpUploadServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-direct {p0, v1, v7, v0, v2}, Lcom/dsh/apkhelper/HttpUploadServer;->respond(Ljava/io/OutputStream;ILjava/lang/String;[B)V

    .line 119
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 120
    return-void

    .line 123
    :cond_7
    const-string v2, "POST"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    const-string v2, "/upload"

    invoke-virtual {v5, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 124
    nop

    .line 125
    const-string v2, "?name="

    invoke-virtual {v5, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 126
    const-string v6, "upload.apk"

    if-ltz v2, :cond_8

    .line 127
    add-int/lit8 v2, v2, 0x6

    :try_start_3
    invoke-virtual {v5, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v5, "UTF-8"

    invoke-static {v2, v5}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    .line 126
    :cond_8
    move-object v2, v6

    .line 129
    :goto_4
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    .line 130
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_9

    goto :goto_5

    :cond_9
    move-object v6, v2

    .line 132
    :goto_5
    invoke-static {v6}, Lcom/dsh/apkhelper/HttpUploadServer;->fixApkName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/dsh/apkhelper/HttpUploadServer;->isApk(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_apk_ok

    const-string v0, "text/plain; charset=utf-8"

    const-string v2, "\u53ea\u652f\u6301 .apk \u6216 .apk.1 \u6587\u4ef6"

    sget-object v3, Lcom/dsh/apkhelper/HttpUploadServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    const/16 v3, 0x190

    invoke-direct {p0, v1, v3, v0, v2}, Lcom/dsh/apkhelper/HttpUploadServer;->respond(Ljava/io/OutputStream;ILjava/lang/String;[B)V

    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    return-void

    :cond_apk_ok
    new-instance v2, Ljava/io/File;

    iget-object v5, p0, Lcom/dsh/apkhelper/HttpUploadServer;->dest:Ljava/io/File;

    invoke-direct {v2, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 133
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 134
    new-array v2, v4, [B

    .line 135
    nop

    .line 136
    :goto_6
    cmp-long v4, v10, v8

    if-lez v4, :cond_b

    .line 137
    const-wide/16 v12, 0x4000

    invoke-static {v12, v13, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    long-to-int v4, v12

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 138
    if-gez v4, :cond_a

    goto :goto_7

    .line 139
    :cond_a
    invoke-virtual {v5, v2, v3, v4}, Ljava/io/FileOutputStream;->write([BII)V

    .line 140
    int-to-long v12, v4

    sub-long/2addr v10, v12

    .line 141
    goto :goto_6

    .line 142
    :cond_b
    :goto_7
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 144
    const-string v0, "text/plain; charset=utf-8"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5df2\u4fdd\u5b58\u5230 Download: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/dsh/apkhelper/HttpUploadServer;->UTF8:Ljava/nio/charset/Charset;

    .line 145
    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 144
    invoke-direct {p0, v1, v7, v0, v2}, Lcom/dsh/apkhelper/HttpUploadServer;->respond(Ljava/io/OutputStream;ILjava/lang/String;[B)V

    .line 146
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 147
    iget-object v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->listener:Lcom/dsh/apkhelper/HttpUploadServer$Listener;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->listener:Lcom/dsh/apkhelper/HttpUploadServer$Listener;

    invoke-interface {v0, v6}, Lcom/dsh/apkhelper/HttpUploadServer$Listener;->onUploaded(Ljava/lang/String;)V

    .line 148
    :cond_c
    return-void

    .line 151
    :cond_d
    const-string v0, "text/plain"

    const-string v2, "not found"

    sget-object v3, Lcom/dsh/apkhelper/HttpUploadServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    const/16 v3, 0x194

    invoke-direct {p0, v1, v3, v0, v2}, Lcom/dsh/apkhelper/HttpUploadServer;->respond(Ljava/io/OutputStream;ILjava/lang/String;[B)V

    .line 152
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 159
    goto :goto_8

    .line 153
    :catch_1
    move-exception v0

    .line 154
    iget-object v1, p0, Lcom/dsh/apkhelper/HttpUploadServer;->listener:Lcom/dsh/apkhelper/HttpUploadServer$Listener;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/dsh/apkhelper/HttpUploadServer;->listener:Lcom/dsh/apkhelper/HttpUploadServer$Listener;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handle: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/dsh/apkhelper/HttpUploadServer$Listener;->onLog(Ljava/lang/String;)V

    .line 156
    :cond_e
    :try_start_4
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 158
    goto :goto_8

    .line 157
    :catch_2
    move-exception p1

    .line 160
    :goto_8
    return-void
.end method

.method private loop()V
    .locals 4

    .line 63
    nop

    :goto_0
    iget-boolean v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->running:Z

    if-eqz v0, :cond_1

    .line 65
    :try_start_0
    iget-object v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 66
    invoke-direct {p0, v0}, Lcom/dsh/apkhelper/HttpUploadServer;->handle(Ljava/net/Socket;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 67
    :catch_0
    move-exception v0

    .line 68
    iget-boolean v1, p0, Lcom/dsh/apkhelper/HttpUploadServer;->running:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/dsh/apkhelper/HttpUploadServer;->listener:Lcom/dsh/apkhelper/HttpUploadServer$Listener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/dsh/apkhelper/HttpUploadServer;->listener:Lcom/dsh/apkhelper/HttpUploadServer$Listener;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "accept: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/dsh/apkhelper/HttpUploadServer$Listener;->onLog(Ljava/lang/String;)V

    .line 69
    :cond_0
    :goto_1
    goto :goto_0

    .line 71
    :cond_1
    return-void
.end method

.method private respond(Ljava/io/OutputStream;ILjava/lang/String;[B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HTTP/1.1 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0xc8

    if-ne p2, v1, :cond_0

    const-string p2, "OK"

    goto :goto_0

    :cond_0
    const-string p2, "Not Found"

    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "\r\nContent-Type: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\r\nContent-Length: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    array-length p3, p4

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\r\nCache-Control: no-store\r\nConnection: close\r\n\r\n"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 168
    sget-object p3, Lcom/dsh/apkhelper/HttpUploadServer;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, p3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write([B)V

    .line 169
    invoke-virtual {p1, p4}, Ljava/io/OutputStream;->write([B)V

    .line 170
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 171
    return-void
.end method


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

.method private static isApk(Ljava/lang/String;)Z
    .locals 2

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".apk"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

# virtual methods
.method public getPort()I
    .locals 1

    .line 39
    iget v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->port:I

    return v0
.end method

.method public start()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 43
    new-instance v0, Ljava/net/ServerSocket;

    iget v1, p0, Lcom/dsh/apkhelper/HttpUploadServer;->port:I

    invoke-direct {v0, v1}, Ljava/net/ServerSocket;-><init>(I)V

    iput-object v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->server:Ljava/net/ServerSocket;

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->running:Z

    .line 45
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/dsh/apkhelper/HttpUploadServer$1;

    invoke-direct {v2, p0}, Lcom/dsh/apkhelper/HttpUploadServer$1;-><init>(Lcom/dsh/apkhelper/HttpUploadServer;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 51
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 52
    return-void
.end method

.method public stop()V
    .locals 1

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->running:Z

    .line 57
    :try_start_0
    iget-object v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->server:Ljava/net/ServerSocket;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/dsh/apkhelper/HttpUploadServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :cond_0
    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    .line 60
    :goto_0
    return-void
.end method
