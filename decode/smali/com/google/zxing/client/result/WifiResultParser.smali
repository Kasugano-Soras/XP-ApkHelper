.class public final Lcom/google/zxing/client/result/WifiResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "WifiResultParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 0

    .line 38
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/WifiResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/WifiParsedResult;

    move-result-object p1

    return-object p1
.end method

.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/WifiParsedResult;
    .locals 16
    .param p1, "result"    # Lcom/google/zxing/Result;

    .line 42
    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/WifiResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    .line 43
    .local v2, "rawText":Ljava/lang/String;
    move-object v2, v0

    const-string v3, "WIFI:"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_0

    .line 44
    return-object v3

    .line 46
    :cond_0
    const/4 v0, 0x5

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 47
    .end local v2    # "rawText":Ljava/lang/String;
    .local v0, "rawText":Ljava/lang/String;
    const-string v2, "S:"

    const/16 v4, 0x3b

    const/4 v5, 0x0

    invoke-static {v2, v0, v4, v5}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v2

    move-object v6, v1

    .line 48
    .local v6, "ssid":Ljava/lang/String;
    move-object v9, v2

    .end local v6    # "ssid":Ljava/lang/String;
    .local v9, "ssid":Ljava/lang/String;
    if-eqz v2, :cond_4

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 51
    const-string v2, "P:"

    invoke-static {v2, v0, v4, v5}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v10

    .line 52
    .local v10, "pass":Ljava/lang/String;
    const-string v2, "T:"

    invoke-static {v2, v0, v4, v5}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v2

    move-object v3, v1

    .line 53
    .local v3, "type":Ljava/lang/String;
    move-object v3, v2

    if-nez v2, :cond_1

    .line 54
    const-string v3, "nopass"

    move-object v8, v3

    goto :goto_0

    .line 53
    :cond_1
    move-object v8, v3

    .line 60
    .end local v3    # "type":Ljava/lang/String;
    .local v8, "type":Ljava/lang/String;
    :goto_0
    const/4 v2, 0x0

    .line 61
    .local v2, "hidden":Z
    const-string v3, "PH2:"

    invoke-static {v3, v0, v4, v5}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "phase2Method":Ljava/lang/String;
    const-string v6, "H:"

    invoke-static {v6, v0, v4, v5}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v6

    .line 63
    .local v1, "hValue":Ljava/lang/String;
    move-object v1, v6

    if-eqz v6, :cond_3

    .line 65
    if-nez v3, :cond_2

    const-string v6, "true"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    const-string v6, "false"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 68
    move-object v3, v1

    move v11, v2

    move-object v15, v3

    goto :goto_1

    .line 66
    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v2

    move v11, v2

    move-object v15, v3

    goto :goto_1

    .line 63
    :cond_3
    move v11, v2

    move-object v15, v3

    .line 72
    .end local v2    # "hidden":Z
    .end local v3    # "phase2Method":Ljava/lang/String;
    .local v11, "hidden":Z
    .local v15, "phase2Method":Ljava/lang/String;
    :goto_1
    const-string v2, "I:"

    invoke-static {v2, v0, v4, v5}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v12

    .line 73
    .local v12, "identity":Ljava/lang/String;
    const-string v2, "A:"

    invoke-static {v2, v0, v4, v5}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v13

    .line 74
    .local v13, "anonymousIdentity":Ljava/lang/String;
    const-string v2, "E:"

    invoke-static {v2, v0, v4, v5}, Lcom/google/zxing/client/result/WifiResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v14

    .line 76
    .local v14, "eapMethod":Ljava/lang/String;
    new-instance v7, Lcom/google/zxing/client/result/WifiParsedResult;

    invoke-direct/range {v7 .. v15}, Lcom/google/zxing/client/result/WifiParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v7

    .line 49
    .end local v1    # "hValue":Ljava/lang/String;
    .end local v8    # "type":Ljava/lang/String;
    .end local v10    # "pass":Ljava/lang/String;
    .end local v11    # "hidden":Z
    .end local v12    # "identity":Ljava/lang/String;
    .end local v13    # "anonymousIdentity":Ljava/lang/String;
    .end local v14    # "eapMethod":Ljava/lang/String;
    .end local v15    # "phase2Method":Ljava/lang/String;
    :cond_4
    return-object v3
.end method
