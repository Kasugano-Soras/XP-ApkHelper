.class public Lcom/dsh/apkhelper/AdbShell;
.super Ljava/lang/Object;
.source "AdbShell.java"


# static fields
.field private static final A_AUTH:I = 0x48545541

.field private static final A_CLSE:I = 0x45534c43

.field private static final A_CNXN:I = 0x4e584e43

.field private static final A_OKAY:I = 0x4b594f41

.field private static final A_OPEN:I = 0x4e45504f

.field private static final A_WRTE:I = 0x45545257

.field private static final PRIV_PEM:Ljava/lang/String; = "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCf64wqI1XbaQ7p\nV+niZ0nWSjlxUF0cxvbTfOtmywjb9dXNY/9sip/vb7esHpv1JuR+ansbsm87B6zy\nehWtCgKfMZSm3btr5Q6NkYKIw+Q2kqUfksPOTqe3+KWXKkTZehh5a3N1Sac4TRIy\nAOnX2uOOsm/Ao9fpN4i8BMDXgXrSRw5o7sypkXCWKlXJ4lKQLzhCjbH6EPP2tKxG\n9Io+LIErUVuc3Swy22X+fMAXB889q9se4vnw/3yfR4VCupN6BhnmheGG6UBClo5T\nEpwU25t7wcpTsBuxjE7CMCX+IAcGvzLtf8R3HuQKK/AsMkyLxuc2/PHzY1tVqSwt\nCxr1NAV1AgMBAAECggEAAZCTNEVYvXcbcX6N+AxlLU7YHYr5AkNTHnIiNoUFjutq\nnmIcWXJIytW3wRwikAVDppYBot1916DFWTEHHcSTjn20c+aHAzEAUbPLCG4MQVlx\neqvbtRzRaMwqyJ4eAte+Pg/mVw8zruoYI7udDiLi555I2CRyRCKqOJa+UU1/x2dt\nH1qqfOAh1SX3j8QoTriFF3OcOkEj6z2j3EIlWyC0Q3y5GhM34nAowegkgv0KNSQQ\n44jXfh0AGsYPUudS7gAe4qrH/Rh9w+qow/lPVwxD7DsDPzYzpkc5pZ+kxI54fxY6\ndoDmcFuon5e+aPafjALJV+nusnpae4qXeVveXZDSQQKBgQDQMOTheI4fCOjhBAzl\nOLBsuTfGCF/KnOAgBc7j5C8aYpSClUOJ8EvsuSLeCac67Zad1e76ZQ9jqPEVPBqi\n36evw0NyFcG7wGKMhM/4Q4L22uYmAcYJToyXj3zgOA3gCh4ZywkvJKj33vQtSRTm\nTex632FSdrRz6FWrSSRI/nNiQQKBgQDEpOklXHrm2RZ0x4rxbrgO6pCipDI9dY1y\nPvLnNyJF3zL7Pl13rjuPM6AtpvTpRkrsNAB2iD90kt27/fuHFE99SQTkqY1f0S3Y\nogQ8efmKYZt56b0D7EfnkGaqZanvRcvlCynbLrEDuOTsBiIWC2sZUwGt5Q8hwVUY\nHVo0f2kuNQKBgQC1x6thb4jwcjAcoRO9ZYUuOX8Ia7FwUQ+lBk1CULAMIr03U6s4\nGtfAZ1qZcuZQnrjfMbfLbEhGpXFzMBq10gExh5YxW+vfyriBp0mLpS8J6dIAp5XJ\n9IrvnvrTMD51O4BS1yQ6xJDAdSzRCbm06Z8tHjR0827WsatztpZ3Ia2PwQKBgQDB\nonoKVjSXmPEp8Uv6TcJkvcnKvdDTACxWcXITCBFxqEW1bUXwkdsIOhfinGLSSmuA\nh/xku+lwSyaY9ZJ3AyL7BaoR2Hvj/EEe7vso6hs1jsPgmq+La2GqvmC6Lf3WJW6P\njhybPjEEr06Ms8Vg28GMYFZo/AOYg53dbxniVAwoeQKBgF1JqsQ/f4a+w52JIMEX\nY1/rSR8AXcYEWMEi4GUAmKvGw+qPSDihSdbwC8o8xJUr1rKvRJNlrnsQEGP2A6gs\nvgGkiZDLgrMCRl4e3X1KS77R8GHuilF/9td9YNKEnnuXk+heSGOga/yaRiuIVumM\nczUNyVNp0oVyJaQKyW5BwLBp\n-----END PRIVATE KEY-----"

.field private static final PUB_KEY:Ljava/lang/String; = "QAAAACMdkcZ1BTT1GgstLKlVW2Pz8fw258aLTDIs8CsK5B53xH/tMr8GByD+JTDCToyxG7BTysF7m9sUnBJTjpZCQOmG4YXmGQZ6k7pChUeffP/w+eIe26s9zwcXwHz+ZdsyLN2cW1ErgSw+ivRGrLT28xD6sY1COC+QUuLJVSqWcJGpzO5oDkfSeoHXwAS8iDfp16PAb7KO49rX6QAyEk04p0l1c2t5GHrZRCqXpfi3p07Ow5IfpZI25MOIgpGNDuVru92mlDGfAgqtFXryrAc7b7Ibe2p+5Cb1mx6st2/vn4ps/2PN1fXbCMtm63zT9sYcXVBxOUrWSWfi6VfpDmnbVSMqjOuffMYjyrhpYgkur0E/dBdZl27/05J69LC1i70wZKotQ74QxBpc4IDB/vPkfuEEb4xFz+xqz8ycxGS0a/weUudYJmKiiSNZimymHOe/biVfb7OvNxGlgHdR3anJ5Pn4GjwjNI+9AYtf7HZMk9rzYly7Z7fSh67Zsi+Lx9VDa+NdJKwgmSzEem63BiunG+MSvwUE6FEIMPpNNskcmSJd1S/h07+52xqLd3Fsg8I0X7XyNBpOV4RqBpfErb3GdPuLPs0of0Ynsz4EfirTsoKwepnWn8OTgBM2+zyIiRO8N2f+DEpKqpsyntLhzfr6pXdPF/4d4nCby1UW/1uciMFrUir/VgEAAQA= dsh@car"

.field private static sSock:Ljava/net/Socket;

.field private static sOut:Ljava/io/DataOutputStream;

.field private static sIn:Ljava/io/DataInputStream;

.field private static sPort:I

.field private static sCurPort:I

.field private static sCmd:Ljava/lang/String;

.field private static sReuse:Z

# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized exec(Ljava/lang/String;I)Ljava/lang/String;
    .locals 14

    .line 38
    const-string v0, "UTF-8"

    .line 40
    const/4 v1, 0x0

    sput-object p0, Lcom/dsh/apkhelper/AdbShell;->sCmd:Ljava/lang/String;

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

    :try_start_0
    new-instance v2, Ljava/net/Socket;

    invoke-direct {v2}, Ljava/net/Socket;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 41
    :try_start_1
    new-instance v1, Ljava/net/InetSocketAddress;

    const-string v3, "127.0.0.1"

    invoke-direct {v1, v3, p1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 p1, 0xfa0

    invoke-virtual {v2, v1, p1}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 42
    const p1, 0x15f90

    invoke-virtual {v2, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 43
    new-instance p1, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 44
    new-instance v1, Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 46
    const-string v3, "host::"

    invoke-virtual {v3, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    const v4, 0x4e584e43    # 9.072519E8f

    const/high16 v5, 0x1000000

    const/16 v6, 0x1000

    invoke-static {p1, v4, v5, v6, v3}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V

    .line 48
    nop

    .line 49
    nop

    .line 50
    nop

    .line 51
    nop

    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    move v6, v5

    move v7, v6

    move v8, v7

    :conn_ready
    sget-boolean v9, Lcom/dsh/apkhelper/AdbShell;->sReuse:Z

    if-eqz v9, :skip_preopen

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "shell:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\u0000"

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

    .line 55
    :goto_0
    const/16 v9, 0x18

    invoke-static {v1, v9}, Lcom/dsh/apkhelper/AdbShell;->readFully(Ljava/io/InputStream;I)[B

    move-result-object v9

    .line 56
    if-nez v9, :cond_0

    goto/16 :dead_conn

    .line 57
    :cond_0
    invoke-static {v9, v5}, Lcom/dsh/apkhelper/AdbShell;->le32([BI)I

    move-result v10

    .line 58
    const/4 v11, 0x4

    invoke-static {v9, v11}, Lcom/dsh/apkhelper/AdbShell;->le32([BI)I

    move-result v11

    .line 59
    const/16 v12, 0xc

    invoke-static {v9, v12}, Lcom/dsh/apkhelper/AdbShell;->le32([BI)I

    move-result v9

    .line 60
    if-lez v9, :cond_1

    invoke-static {v1, v9}, Lcom/dsh/apkhelper/AdbShell;->readFully(Ljava/io/InputStream;I)[B

    move-result-object v9

    goto :goto_1

    :cond_1
    new-array v9, v5, [B

    .line 61
    :goto_1
    if-nez v9, :cond_2

    goto/16 :dead_conn

    .line 63
    :cond_2
    const/4 v12, 0x1

    if-ne v10, v4, :cond_3

    .line 64
    if-nez v6, :cond_8

    .line 65
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "shell:"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, "\u0000"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 66
    const v9, 0x4e45504f    # 8.2759366E8f

    invoke-static {p1, v9, v12, v5, v6}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V

    .line 67
    nop

    .line 68
    move v6, v12

    goto :goto_4

    .line 69
    :cond_3
    const v13, 0x48545541

    if-ne v10, v13, :cond_5

    .line 70
    if-ne v11, v12, :cond_8

    .line 71
    if-nez v7, :cond_4

    .line 72
    invoke-static {v9}, Lcom/dsh/apkhelper/AdbShell;->sign([B)[B

    move-result-object v7

    const/4 v9, 0x2

    invoke-static {p1, v13, v9, v5, v7}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V

    .line 73
    move v7, v12

    goto :goto_4

    .line 75
    :cond_4
    const-string v9, "QAAAACMdkcZ1BTT1GgstLKlVW2Pz8fw258aLTDIs8CsK5B53xH/tMr8GByD+JTDCToyxG7BTysF7m9sUnBJTjpZCQOmG4YXmGQZ6k7pChUeffP/w+eIe26s9zwcXwHz+ZdsyLN2cW1ErgSw+ivRGrLT28xD6sY1COC+QUuLJVSqWcJGpzO5oDkfSeoHXwAS8iDfp16PAb7KO49rX6QAyEk04p0l1c2t5GHrZRCqXpfi3p07Ow5IfpZI25MOIgpGNDuVru92mlDGfAgqtFXryrAc7b7Ibe2p+5Cb1mx6st2/vn4ps/2PN1fXbCMtm63zT9sYcXVBxOUrWSWfi6VfpDmnbVSMqjOuffMYjyrhpYgkur0E/dBdZl27/05J69LC1i70wZKotQ74QxBpc4IDB/vPkfuEEb4xFz+xqz8ycxGS0a/weUudYJmKiiSNZimymHOe/biVfb7OvNxGlgHdR3anJ5Pn4GjwjNI+9AYtf7HZMk9rzYly7Z7fSh67Zsi+Lx9VDa+NdJKwgmSzEem63BiunG+MSvwUE6FEIMPpNNskcmSJd1S/h07+52xqLd3Fsg8I0X7XyNBpOV4RqBpfErb3GdPuLPs0of0Ynsz4EfirTsoKwepnWn8OTgBM2+zyIiRO8N2f+DEpKqpsyntLhzfr6pXdPF/4d4nCby1UW/1uciMFrUir/VgEAAQA= dsh@car"

    .line 76
    invoke-virtual {v9, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    .line 75
    const/4 v10, 0x3

    invoke-static {p1, v13, v10, v5, v9}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V

    goto :goto_4

    .line 79
    :cond_5
    const v13, 0x4b594f41    # 1.4241601E7f

    if-ne v10, v13, :cond_6

    .line 80
    move v8, v11

    goto :goto_4

    .line 81
    :cond_6
    const v11, 0x45545257

    if-ne v10, v11, :cond_7

    .line 82
    new-instance v10, Ljava/lang/String;

    invoke-direct {v10, v9, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    new-array v9, v5, [B

    invoke-static {p1, v13, v12, v8, v9}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V

    goto :goto_4

    .line 84
    :cond_7
    const v9, 0x45534c43

    if-ne v10, v9, :cond_8

    .line 85
    new-array p0, v5, [B

    invoke-static {p1, v9, v12, v8, p0}, Lcom/dsh/apkhelper/AdbShell;->send(Ljava/io/DataOutputStream;III[B)V

    sput-object v2, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;

    sput-object p1, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;

    sput-object v1, Lcom/dsh/apkhelper/AdbShell;->sIn:Ljava/io/DataInputStream;

    sget v9, Lcom/dsh/apkhelper/AdbShell;->sCurPort:I

    sput v9, Lcom/dsh/apkhelper/AdbShell;->sPort:I


    .line 86
    nop

    goto/16 :goto_2

    :dead_conn
    const/4 v9, 0x0

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;

    sput-object v9, Lcom/dsh/apkhelper/AdbShell;->sIn:Ljava/io/DataInputStream;

    .line 89
    :goto_2
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    nop

    .line 89
    :goto_3
    return-object p0

    .line 88
    :cond_8
    :goto_4
    goto/16 :goto_0

    .line 93
    :catchall_0
    move-exception p0

    move-object v1, v2

    goto :goto_7

    .line 90
    :catch_1
    move-exception p0

    move-object v1, v2

    goto :goto_5

    :catch_2
    move-exception p0

    .line 91
    :goto_5
    const/4 v9, 0x0

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
    :try_start_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "ERR "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 93
    if-eqz v1, :cond_9

    .line 94
    :try_start_4
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_6

    :catch_3
    move-exception p1

    .line 91
    :cond_9
    :goto_6
    return-object p0

    .line 93
    :catchall_1
    move-exception p0

    :goto_7
    const/4 v2, 0x0

    sput-object v2, Lcom/dsh/apkhelper/AdbShell;->sSock:Ljava/net/Socket;

    sput-object v2, Lcom/dsh/apkhelper/AdbShell;->sOut:Ljava/io/DataOutputStream;

    sput-object v2, Lcom/dsh/apkhelper/AdbShell;->sIn:Ljava/io/DataInputStream;

    if-eqz v1, :cond_a

    .line 94
    :try_start_5
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_8

    :catch_4
    move-exception p1

    .line 96
    :cond_a
    :goto_8
    throw p0
.end method

.method private static le32([BI)I
    .locals 2

    .line 123
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr v0, p0

    return v0
.end method

.method private static loadKey()Ljava/security/PrivateKey;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    const-string v1, "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCf64wqI1XbaQ7p\nV+niZ0nWSjlxUF0cxvbTfOtmywjb9dXNY/9sip/vb7esHpv1JuR+ansbsm87B6zy\nehWtCgKfMZSm3btr5Q6NkYKIw+Q2kqUfksPOTqe3+KWXKkTZehh5a3N1Sac4TRIy\nAOnX2uOOsm/Ao9fpN4i8BMDXgXrSRw5o7sypkXCWKlXJ4lKQLzhCjbH6EPP2tKxG\n9Io+LIErUVuc3Swy22X+fMAXB889q9se4vnw/3yfR4VCupN6BhnmheGG6UBClo5T\nEpwU25t7wcpTsBuxjE7CMCX+IAcGvzLtf8R3HuQKK/AsMkyLxuc2/PHzY1tVqSwt\nCxr1NAV1AgMBAAECggEAAZCTNEVYvXcbcX6N+AxlLU7YHYr5AkNTHnIiNoUFjutq\nnmIcWXJIytW3wRwikAVDppYBot1916DFWTEHHcSTjn20c+aHAzEAUbPLCG4MQVlx\neqvbtRzRaMwqyJ4eAte+Pg/mVw8zruoYI7udDiLi555I2CRyRCKqOJa+UU1/x2dt\nH1qqfOAh1SX3j8QoTriFF3OcOkEj6z2j3EIlWyC0Q3y5GhM34nAowegkgv0KNSQQ\n44jXfh0AGsYPUudS7gAe4qrH/Rh9w+qow/lPVwxD7DsDPzYzpkc5pZ+kxI54fxY6\ndoDmcFuon5e+aPafjALJV+nusnpae4qXeVveXZDSQQKBgQDQMOTheI4fCOjhBAzl\nOLBsuTfGCF/KnOAgBc7j5C8aYpSClUOJ8EvsuSLeCac67Zad1e76ZQ9jqPEVPBqi\n36evw0NyFcG7wGKMhM/4Q4L22uYmAcYJToyXj3zgOA3gCh4ZywkvJKj33vQtSRTm\nTex632FSdrRz6FWrSSRI/nNiQQKBgQDEpOklXHrm2RZ0x4rxbrgO6pCipDI9dY1y\nPvLnNyJF3zL7Pl13rjuPM6AtpvTpRkrsNAB2iD90kt27/fuHFE99SQTkqY1f0S3Y\nogQ8efmKYZt56b0D7EfnkGaqZanvRcvlCynbLrEDuOTsBiIWC2sZUwGt5Q8hwVUY\nHVo0f2kuNQKBgQC1x6thb4jwcjAcoRO9ZYUuOX8Ia7FwUQ+lBk1CULAMIr03U6s4\nGtfAZ1qZcuZQnrjfMbfLbEhGpXFzMBq10gExh5YxW+vfyriBp0mLpS8J6dIAp5XJ\n9IrvnvrTMD51O4BS1yQ6xJDAdSzRCbm06Z8tHjR0827WsatztpZ3Ia2PwQKBgQDB\nonoKVjSXmPEp8Uv6TcJkvcnKvdDTACxWcXITCBFxqEW1bUXwkdsIOhfinGLSSmuA\nh/xku+lwSyaY9ZJ3AyL7BaoR2Hvj/EEe7vso6hs1jsPgmq+La2GqvmC6Lf3WJW6P\njhybPjEEr06Ms8Vg28GMYFZo/AOYg53dbxniVAwoeQKBgF1JqsQ/f4a+w52JIMEX\nY1/rSR8AXcYEWMEi4GUAmKvGw+qPSDihSdbwC8o8xJUr1rKvRJNlrnsQEGP2A6gs\nvgGkiZDLgrMCRl4e3X1KS77R8GHuilF/9td9YNKEnnuXk+heSGOga/yaRiuIVumM\nczUNyVNp0oVyJaQKyW5BwLBp\n-----END PRIVATE KEY-----"

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 148
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_1

    .line 149
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 150
    const-string v5, "-----"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    .line 151
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 153
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    .line 154
    const-string v1, "RSA"

    invoke-static {v1}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    new-instance v2, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v2, v0}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v1, v2}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v0

    return-object v0
.end method

.method private static put32([BII)V
    .locals 2

    .line 116
    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 117
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 118
    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 119
    add-int/lit8 p1, p1, 0x3

    shr-int/lit8 p2, p2, 0x18

    and-int/lit16 p2, p2, 0xff

    int-to-byte p2, p2

    aput-byte p2, p0, p1

    .line 120
    return-void
.end method

.method private static readFully(Ljava/io/InputStream;I)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    new-array v0, p1, [B

    .line 129
    const/4 v1, 0x0

    .line 130
    :goto_0
    if-ge v1, p1, :cond_1

    .line 131
    sub-int v2, p1, v1

    invoke-virtual {p0, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 132
    if-gez v2, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 133
    :cond_0
    add-int/2addr v1, v2

    .line 134
    goto :goto_0

    .line 135
    :cond_1
    return-object v0
.end method

.method private static send(Ljava/io/DataOutputStream;III[B)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 102
    invoke-virtual {v0, p4}, Ljava/util/zip/CRC32;->update([B)V

    .line 103
    array-length v1, p4

    const/16 v2, 0x18

    add-int/2addr v1, v2

    new-array v1, v1, [B

    .line 104
    const/4 v3, 0x0

    invoke-static {v1, v3, p1}, Lcom/dsh/apkhelper/AdbShell;->put32([BII)V

    .line 105
    const/4 v4, 0x4

    invoke-static {v1, v4, p2}, Lcom/dsh/apkhelper/AdbShell;->put32([BII)V

    .line 106
    const/16 p2, 0x8

    invoke-static {v1, p2, p3}, Lcom/dsh/apkhelper/AdbShell;->put32([BII)V

    .line 107
    const/16 p2, 0xc

    array-length p3, p4

    invoke-static {v1, p2, p3}, Lcom/dsh/apkhelper/AdbShell;->put32([BII)V

    .line 108
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide p2

    long-to-int p2, p2

    const/16 p3, 0x10

    invoke-static {v1, p3, p2}, Lcom/dsh/apkhelper/AdbShell;->put32([BII)V

    .line 109
    const/16 p2, 0x14

    not-int p1, p1

    invoke-static {v1, p2, p1}, Lcom/dsh/apkhelper/AdbShell;->put32([BII)V

    .line 110
    array-length p1, p4

    invoke-static {p4, v3, v1, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    invoke-virtual {p0, v1}, Ljava/io/DataOutputStream;->write([B)V

    .line 112
    invoke-virtual {p0}, Ljava/io/DataOutputStream;->flush()V

    .line 113
    return-void
.end method

.method private static sign([B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 139
    const-string v0, "SHA1withRSA"

    invoke-static {v0}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .line 140
    invoke-static {}, Lcom/dsh/apkhelper/AdbShell;->loadKey()Ljava/security/PrivateKey;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 141
    invoke-virtual {v0, p0}, Ljava/security/Signature;->update([B)V

    .line 142
    invoke-virtual {v0}, Ljava/security/Signature;->sign()[B

    move-result-object p0

    return-object p0
.end method
