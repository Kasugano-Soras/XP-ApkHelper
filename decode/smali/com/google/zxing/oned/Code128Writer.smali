.class public final Lcom/google/zxing/oned/Code128Writer;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "Code128Writer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/oned/Code128Writer$CType;
    }
.end annotation


# static fields
.field private static final CODE_CODE_A:I = 0x65

.field private static final CODE_CODE_B:I = 0x64

.field private static final CODE_CODE_C:I = 0x63

.field private static final CODE_FNC_1:I = 0x66

.field private static final CODE_FNC_2:I = 0x61

.field private static final CODE_FNC_3:I = 0x60

.field private static final CODE_FNC_4_A:I = 0x65

.field private static final CODE_FNC_4_B:I = 0x64

.field private static final CODE_START_A:I = 0x67

.field private static final CODE_START_B:I = 0x68

.field private static final CODE_START_C:I = 0x69

.field private static final CODE_STOP:I = 0x6a

.field private static final ESCAPE_FNC_1:C = '\u00f1'

.field private static final ESCAPE_FNC_2:C = '\u00f2'

.field private static final ESCAPE_FNC_3:C = '\u00f3'

.field private static final ESCAPE_FNC_4:C = '\u00f4'


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method

.method private static chooseCode(Ljava/lang/CharSequence;II)I
    .locals 6
    .param p0, "value"    # Ljava/lang/CharSequence;
    .param p1, "start"    # I
    .param p2, "oldCode"    # I

    .line 225
    invoke-static {p0, p1}, Lcom/google/zxing/oned/Code128Writer;->findCType(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    move-result-object v0

    const/4 v1, 0x0

    .line 226
    .local v1, "lookahead":Lcom/google/zxing/oned/Code128Writer$CType;
    move-object v1, v0

    sget-object v2, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    const/16 v3, 0x65

    const/16 v4, 0x64

    if-ne v0, v2, :cond_1

    .line 227
    if-ne p2, v3, :cond_0

    .line 228
    return v3

    .line 230
    :cond_0
    return v4

    .line 232
    :cond_1
    sget-object v0, Lcom/google/zxing/oned/Code128Writer$CType;->UNCODABLE:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v1, v0, :cond_5

    .line 233
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_4

    .line 234
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/4 v2, 0x0

    .line 235
    .local v2, "c":C
    move v2, v0

    const/16 v5, 0x20

    if-lt v0, v5, :cond_3

    if-ne p2, v3, :cond_2

    const/16 v0, 0x60

    if-lt v2, v0, :cond_3

    const/16 v0, 0xf1

    if-lt v2, v0, :cond_2

    const/16 v0, 0xf4

    if-le v2, v0, :cond_3

    :cond_2
    goto :goto_0

    .line 237
    :cond_3
    return v3

    .line 240
    .end local v2    # "c":C
    :cond_4
    :goto_0
    return v4

    .line 242
    :cond_5
    if-ne p2, v3, :cond_6

    sget-object v0, Lcom/google/zxing/oned/Code128Writer$CType;->FNC_1:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v1, v0, :cond_6

    .line 243
    return v3

    .line 245
    :cond_6
    const/16 v0, 0x63

    if-ne p2, v0, :cond_7

    .line 246
    return v0

    .line 248
    :cond_7
    if-ne p2, v4, :cond_e

    .line 249
    sget-object v2, Lcom/google/zxing/oned/Code128Writer$CType;->FNC_1:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v1, v2, :cond_8

    .line 250
    return v4

    .line 253
    :cond_8
    add-int/lit8 v2, p1, 0x2

    invoke-static {p0, v2}, Lcom/google/zxing/oned/Code128Writer;->findCType(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    move-result-object v2

    .line 254
    move-object v1, v2

    sget-object v3, Lcom/google/zxing/oned/Code128Writer$CType;->UNCODABLE:Lcom/google/zxing/oned/Code128Writer$CType;

    if-eq v2, v3, :cond_d

    sget-object v2, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    if-eq v1, v2, :cond_d

    .line 257
    sget-object v2, Lcom/google/zxing/oned/Code128Writer$CType;->FNC_1:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v1, v2, :cond_a

    .line 258
    add-int/lit8 v2, p1, 0x3

    invoke-static {p0, v2}, Lcom/google/zxing/oned/Code128Writer;->findCType(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    move-result-object v2

    .line 259
    sget-object v3, Lcom/google/zxing/oned/Code128Writer$CType;->TWO_DIGITS:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v2, v3, :cond_9

    .line 260
    return v0

    .line 262
    :cond_9
    return v4

    .line 267
    :cond_a
    add-int/lit8 v2, p1, 0x4

    .line 268
    .local v2, "index":I
    :goto_1
    invoke-static {p0, v2}, Lcom/google/zxing/oned/Code128Writer;->findCType(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    move-result-object v3

    move-object v1, v3

    sget-object v5, Lcom/google/zxing/oned/Code128Writer$CType;->TWO_DIGITS:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v3, v5, :cond_b

    .line 269
    add-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 271
    :cond_b
    sget-object v3, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v1, v3, :cond_c

    .line 272
    return v4

    .line 274
    :cond_c
    return v0

    .line 255
    .end local v2    # "index":I
    :cond_d
    return v4

    .line 277
    :cond_e
    sget-object v2, Lcom/google/zxing/oned/Code128Writer$CType;->FNC_1:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v1, v2, :cond_f

    .line 278
    add-int/lit8 v2, p1, 0x1

    invoke-static {p0, v2}, Lcom/google/zxing/oned/Code128Writer;->findCType(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;

    move-result-object v1

    .line 280
    :cond_f
    sget-object v2, Lcom/google/zxing/oned/Code128Writer$CType;->TWO_DIGITS:Lcom/google/zxing/oned/Code128Writer$CType;

    if-ne v1, v2, :cond_10

    .line 281
    return v0

    .line 283
    :cond_10
    return v4
.end method

.method private static findCType(Ljava/lang/CharSequence;I)Lcom/google/zxing/oned/Code128Writer$CType;
    .locals 5
    .param p0, "value"    # Ljava/lang/CharSequence;
    .param p1, "start"    # I

    .line 203
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 204
    .local v0, "last":I
    if-lt p1, v0, :cond_0

    .line 205
    sget-object v1, Lcom/google/zxing/oned/Code128Writer$CType;->UNCODABLE:Lcom/google/zxing/oned/Code128Writer$CType;

    return-object v1

    .line 207
    :cond_0
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/4 v2, 0x0

    .line 208
    .local v2, "c":C
    move v2, v1

    const/16 v3, 0xf1

    if-ne v1, v3, :cond_1

    .line 209
    sget-object v1, Lcom/google/zxing/oned/Code128Writer$CType;->FNC_1:Lcom/google/zxing/oned/Code128Writer$CType;

    return-object v1

    .line 211
    :cond_1
    const/16 v1, 0x30

    if-lt v2, v1, :cond_4

    const/16 v3, 0x39

    if-gt v2, v3, :cond_4

    .line 214
    add-int/lit8 v4, p1, 0x1

    if-lt v4, v0, :cond_2

    .line 215
    sget-object v1, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    return-object v1

    .line 217
    :cond_2
    add-int/lit8 v4, p1, 0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 218
    move v2, v4

    if-lt v4, v1, :cond_3

    if-gt v2, v3, :cond_3

    .line 221
    sget-object v1, Lcom/google/zxing/oned/Code128Writer$CType;->TWO_DIGITS:Lcom/google/zxing/oned/Code128Writer$CType;

    return-object v1

    .line 219
    :cond_3
    sget-object v1, Lcom/google/zxing/oned/Code128Writer$CType;->ONE_DIGIT:Lcom/google/zxing/oned/Code128Writer$CType;

    return-object v1

    .line 212
    :cond_4
    sget-object v1, Lcom/google/zxing/oned/Code128Writer$CType;->UNCODABLE:Lcom/google/zxing/oned/Code128Writer$CType;

    return-object v1
.end method


# virtual methods
.method public encode(Ljava/lang/String;)[Z
    .locals 10

    .line 68
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 70
    if-lez v0, :cond_b

    const/16 v1, 0x50

    if-gt v0, v1, :cond_b

    .line 75
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 76
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 77
    packed-switch v3, :pswitch_data_0

    .line 84
    const/16 v4, 0x7f

    if-gt v3, v4, :cond_0

    goto :goto_1

    .line 82
    :pswitch_0
    nop

    .line 75
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 86
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bad character in input: "

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 91
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 92
    nop

    .line 93
    nop

    .line 94
    nop

    .line 95
    const/4 v3, 0x1

    move v4, v1

    move v5, v4

    move v6, v5

    move v7, v3

    .line 97
    :goto_2
    const/16 v8, 0x67

    if-ge v4, v0, :cond_7

    .line 99
    invoke-static {p1, v4, v6}, Lcom/google/zxing/oned/Code128Writer;->chooseCode(Ljava/lang/CharSequence;II)I

    move-result v9

    .line 103
    if-ne v9, v6, :cond_4

    .line 106
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    packed-switch v8, :pswitch_data_1

    .line 125
    packed-switch v6, :pswitch_data_2

    .line 138
    add-int/lit8 v8, v4, 0x2

    invoke-virtual {p1, v4, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 139
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 117
    :pswitch_1
    const/16 v8, 0x65

    if-ne v6, v8, :cond_2

    .line 118
    goto :goto_3

    .line 120
    :cond_2
    nop

    .line 122
    const/16 v8, 0x64

    goto :goto_3

    .line 114
    :pswitch_2
    nop

    .line 115
    const/16 v8, 0x60

    goto :goto_3

    .line 111
    :pswitch_3
    nop

    .line 112
    const/16 v8, 0x61

    goto :goto_3

    .line 108
    :pswitch_4
    nop

    .line 109
    const/16 v8, 0x66

    goto :goto_3

    .line 127
    :pswitch_5
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    add-int/lit8 v8, v8, -0x20

    .line 128
    if-gez v8, :cond_3

    .line 130
    add-int/lit8 v8, v8, 0x60

    goto :goto_3

    .line 134
    :pswitch_6
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    add-int/lit8 v8, v8, -0x20

    .line 135
    nop

    .line 143
    :cond_3
    :goto_3
    add-int/2addr v4, v3

    goto :goto_5

    .line 147
    :cond_4
    if-nez v6, :cond_5

    .line 149
    packed-switch v9, :pswitch_data_3

    .line 157
    nop

    .line 158
    const/16 v8, 0x69

    goto :goto_4

    .line 151
    :pswitch_7
    nop

    .line 152
    goto :goto_4

    .line 154
    :pswitch_8
    nop

    .line 155
    const/16 v8, 0x68

    goto :goto_4

    .line 162
    :cond_5
    move v8, v9

    .line 164
    :goto_4
    move v6, v9

    .line 168
    :goto_5
    sget-object v9, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v9, v9, v8

    invoke-interface {v2, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 171
    mul-int/2addr v8, v7

    add-int/2addr v5, v8

    .line 172
    if-eqz v4, :cond_6

    .line 173
    add-int/lit8 v7, v7, 0x1

    .line 175
    :cond_6
    goto :goto_2

    .line 178
    :cond_7
    rem-int/2addr v5, v8

    .line 179
    sget-object p1, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object p1, p1, v5

    invoke-interface {v2, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 182
    sget-object p1, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    const/16 v0, 0x6a

    aget-object p1, p1, v0

    invoke-interface {v2, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 185
    nop

    .line 186
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v0, v1

    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    .line 187
    array-length v5, v4

    move v6, v1

    :goto_7
    if-ge v6, v5, :cond_8

    aget v7, v4, v6

    .line 188
    add-int/2addr v0, v7

    .line 187
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    .line 190
    :cond_8
    goto :goto_6

    .line 193
    :cond_9
    new-array p1, v0, [Z

    .line 194
    nop

    .line 195
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    .line 196
    invoke-static {p1, v1, v2, v3}, Lcom/google/zxing/oned/Code128Writer;->appendPattern([ZI[IZ)I

    move-result v2

    add-int/2addr v1, v2

    .line 197
    goto :goto_8

    .line 199
    :cond_a
    return-object p1

    .line 71
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v1, "Contents length should be between 1 and 80 characters, but got "

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_data_0
    .packed-switch 0xf1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xf1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x64
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x64
        :pswitch_8
        :pswitch_7
    .end packed-switch
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

    .line 63
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
