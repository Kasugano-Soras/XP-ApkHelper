.class public final Lcom/google/zxing/oned/Code39Writer;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "Code39Writer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method

.method private static toIntArray(I[I)V
    .locals 3
    .param p0, "a"    # I
    .param p1, "toReturn"    # [I

    .line 78
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x9

    if-ge v0, v1, :cond_1

    .line 79
    rsub-int/lit8 v1, v0, 0x8

    const/4 v2, 0x1

    shl-int v1, v2, v1

    and-int/2addr v1, p0

    .line 80
    .local v1, "temp":I
    if-eqz v1, :cond_0

    const/4 v2, 0x2

    :cond_0
    aput v2, p1, v0

    .line 78
    .end local v1    # "temp":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 82
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private static tryToConvertToExtendedMode(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "contents"    # Ljava/lang/String;

    .line 85
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 86
    .local v0, "length":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .local v1, "extendedContent":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    const/4 v3, 0x0

    :goto_0
    if-ge v2, v0, :cond_9

    .line 88
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 89
    .local v3, "character":C
    move v3, v4

    sparse-switch v4, :sswitch_data_0

    .line 105
    const/16 v4, 0x1a

    if-gt v3, v4, :cond_0

    .line 106
    const/16 v4, 0x24

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 107
    add-int/lit8 v4, v3, -0x1

    add-int/lit8 v4, v4, 0x41

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 102
    :sswitch_0
    const-string v4, "%W"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    goto/16 :goto_1

    .line 99
    :sswitch_1
    const-string v4, "%V"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    goto/16 :goto_1

    .line 96
    :sswitch_2
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 97
    goto/16 :goto_1

    .line 91
    :sswitch_3
    const-string v4, "%U"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    goto/16 :goto_1

    .line 108
    :cond_0
    const/16 v4, 0x20

    const/16 v5, 0x25

    if-ge v3, v4, :cond_1

    .line 109
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    add-int/lit8 v4, v3, -0x1b

    add-int/lit8 v4, v4, 0x41

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 111
    :cond_1
    const/16 v4, 0x2c

    const/16 v6, 0x2f

    if-le v3, v4, :cond_8

    if-eq v3, v6, :cond_8

    const/16 v4, 0x3a

    if-eq v3, v4, :cond_8

    .line 114
    const/16 v4, 0x39

    if-gt v3, v4, :cond_2

    .line 115
    add-int/lit8 v4, v3, -0x30

    add-int/lit8 v4, v4, 0x30

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 116
    :cond_2
    const/16 v4, 0x3f

    if-gt v3, v4, :cond_3

    .line 117
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 118
    add-int/lit8 v4, v3, -0x3b

    add-int/lit8 v4, v4, 0x46

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 119
    :cond_3
    const/16 v4, 0x5a

    if-gt v3, v4, :cond_4

    .line 120
    add-int/lit8 v4, v3, -0x41

    add-int/lit8 v4, v4, 0x41

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 121
    :cond_4
    const/16 v4, 0x5f

    if-gt v3, v4, :cond_5

    .line 122
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 123
    add-int/lit8 v4, v3, -0x5b

    add-int/lit8 v4, v4, 0x4b

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 124
    :cond_5
    const/16 v4, 0x7a

    if-gt v3, v4, :cond_6

    .line 125
    const/16 v4, 0x2b

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    add-int/lit8 v4, v3, -0x61

    add-int/lit8 v4, v4, 0x41

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 127
    :cond_6
    const/16 v4, 0x7f

    if-gt v3, v4, :cond_7

    .line 128
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 129
    add-int/lit8 v4, v3, -0x7b

    add-int/lit8 v4, v4, 0x50

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 131
    :cond_7
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Requested content contains a non-encodable character: \'"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 112
    :cond_8
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 113
    add-int/lit8 v4, v3, -0x21

    add-int/lit8 v4, v4, 0x41

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    .end local v3    # "character":C
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 138
    .end local v2    # "i":I
    :cond_9
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_3
        0x20 -> :sswitch_2
        0x2d -> :sswitch_2
        0x2e -> :sswitch_2
        0x40 -> :sswitch_1
        0x60 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public encode(Ljava/lang/String;)[Z
    .locals 13
    .param p1, "contents"    # Ljava/lang/String;

    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    .line 40
    .local v1, "length":I
    move v1, v0

    const-string v2, "Requested contents should be less than 80 digits long, but got "

    const/16 v3, 0x50

    if-gt v0, v3, :cond_4

    .line 45
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const-string v4, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%"

    if-ge v0, v1, :cond_2

    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 47
    if-gez v5, :cond_1

    .line 48
    invoke-static {p1}, Lcom/google/zxing/oned/Code39Writer;->tryToConvertToExtendedMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 49
    move-object p1, v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    .line 50
    move v1, v5

    if-gt v5, v3, :cond_0

    goto :goto_1

    .line 51
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " (extended full ASCII mode)"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 45
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 58
    .end local v0    # "i":I
    :cond_2
    :goto_1
    const/16 v0, 0x9

    new-array v0, v0, [I

    .line 59
    .local v0, "widths":[I
    mul-int/lit8 v2, v1, 0xd

    add-int/lit8 v2, v2, 0x19

    .line 60
    new-array v2, v2, [Z

    .line 61
    .local v2, "result":[Z
    const/16 v3, 0x94

    invoke-static {v3, v0}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 62
    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v2, v5, v0, v6}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    move-result v7

    .line 63
    .local v7, "pos":I
    filled-new-array {v6}, [I

    move-result-object v8

    .line 64
    .local v8, "narrowWhite":[I
    invoke-static {v2, v7, v8, v5}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    move-result v9

    add-int/2addr v7, v9

    .line 66
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_2
    if-ge v9, v1, :cond_3

    .line 67
    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    .line 68
    .local v10, "indexInString":I
    sget-object v11, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v11, v11, v10

    invoke-static {v11, v0}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 69
    invoke-static {v2, v7, v0, v6}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    move-result v11

    add-int/2addr v11, v7

    .line 70
    move v7, v11

    invoke-static {v2, v7, v8, v5}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    move-result v12

    add-int v7, v11, v12

    .line 66
    .end local v10    # "indexInString":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 72
    .end local v9    # "i":I
    :cond_3
    invoke-static {v3, v0}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 73
    invoke-static {v2, v7, v0, v6}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([ZI[IZ)I

    .line 74
    return-object v2

    .line 41
    .end local v0    # "widths":[I
    .end local v2    # "result":[Z
    .end local v7    # "pos":I
    .end local v8    # "narrowWhite":[I
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getSupportedWriteFormats()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation

    .line 34
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
