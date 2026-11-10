.class final Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    }
.end annotation


# static fields
.field private static final AL:I = 0x1c

.field private static final AS:I = 0x1b

.field private static final BEGIN_MACRO_PDF417_CONTROL_BLOCK:I = 0x3a0

.field private static final BEGIN_MACRO_PDF417_OPTIONAL_FIELD:I = 0x39b

.field private static final BYTE_COMPACTION_MODE_LATCH:I = 0x385

.field private static final BYTE_COMPACTION_MODE_LATCH_6:I = 0x39c

.field private static final ECI_CHARSET:I = 0x39f

.field private static final ECI_GENERAL_PURPOSE:I = 0x39e

.field private static final ECI_USER_DEFINED:I = 0x39d

.field private static final EXP900:[Ljava/math/BigInteger;

.field private static final LL:I = 0x1b

.field private static final MACRO_PDF417_OPTIONAL_FIELD_ADDRESSEE:I = 0x4

.field private static final MACRO_PDF417_OPTIONAL_FIELD_CHECKSUM:I = 0x6

.field private static final MACRO_PDF417_OPTIONAL_FIELD_FILE_NAME:I = 0x0

.field private static final MACRO_PDF417_OPTIONAL_FIELD_FILE_SIZE:I = 0x5

.field private static final MACRO_PDF417_OPTIONAL_FIELD_SEGMENT_COUNT:I = 0x1

.field private static final MACRO_PDF417_OPTIONAL_FIELD_SENDER:I = 0x3

.field private static final MACRO_PDF417_OPTIONAL_FIELD_TIME_STAMP:I = 0x2

.field private static final MACRO_PDF417_TERMINATOR:I = 0x39a

.field private static final MAX_NUMERIC_CODEWORDS:I = 0xf

.field private static final MIXED_CHARS:[C

.field private static final ML:I = 0x1c

.field private static final MODE_SHIFT_TO_BYTE_COMPACTION_MODE:I = 0x391

.field private static final NUMBER_OF_SEQUENCE_CODEWORDS:I = 0x2

.field private static final NUMERIC_COMPACTION_MODE_LATCH:I = 0x386

.field private static final PAL:I = 0x1d

.field private static final PL:I = 0x19

.field private static final PS:I = 0x1d

.field private static final PUNCT_CHARS:[C

.field private static final TEXT_COMPACTION_MODE_LATCH:I = 0x384


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 76
    nop

    .line 77
    const-string v0, ";<>@[\\]_`~!\r\t,:\n-.$/\"|*()?{}\'"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    .line 79
    nop

    .line 80
    const-string v0, "0123456789&\r\t,:#-.$/+%*=^"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    .line 89
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/math/BigInteger;

    .line 90
    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    const/4 v1, 0x0

    sget-object v2, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    aput-object v2, v0, v1

    .line 91
    const-wide/16 v0, 0x384

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    .line 92
    .local v0, "nineHundred":Ljava/math/BigInteger;
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    const/4 v2, 0x1

    aput-object v0, v1, v2

    .line 93
    const/4 v1, 0x2

    .local v1, "i":I
    :goto_0
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 94
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    add-int/lit8 v3, v1, -0x1

    aget-object v3, v2, v3

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    aput-object v3, v2, v1

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 96
    .end local v0    # "nineHundred":Ljava/math/BigInteger;
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    return-void
.end method

.method private static byteCompaction(I[ILjava/nio/charset/Charset;ILjava/lang/StringBuilder;)I
    .locals 18

    .line 519
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 520
    nop

    .line 521
    nop

    .line 522
    nop

    .line 524
    const-wide/16 v1, 0x384

    const/16 v3, 0x384

    const/4 v4, 0x6

    const/4 v6, 0x0

    sparse-switch p0, :sswitch_data_0

    move/from16 v2, p3

    goto/16 :goto_7

    :sswitch_0
    move/from16 v9, p3

    move v10, v6

    move v11, v10

    const-wide/16 v12, 0x0

    .line 579
    :goto_0
    aget v14, p1, v6

    if-ge v9, v14, :cond_3

    if-nez v10, :cond_3

    .line 580
    add-int/lit8 v14, v9, 0x1

    aget v9, p1, v9

    .line 581
    if-ge v9, v3, :cond_0

    .line 582
    add-int/lit8 v11, v11, 0x1

    .line 584
    mul-long/2addr v12, v1

    move-wide v15, v1

    int-to-long v1, v9

    add-long/2addr v12, v1

    move v9, v14

    goto :goto_1

    .line 586
    :cond_0
    move-wide v15, v1

    sparse-switch v9, :sswitch_data_1

    move v9, v14

    goto :goto_1

    .line 594
    :sswitch_1
    add-int/lit8 v14, v14, -0x1

    .line 595
    move v9, v14

    const/4 v10, 0x1

    .line 599
    :goto_1
    rem-int/lit8 v1, v11, 0x5

    if-nez v1, :cond_2

    if-lez v11, :cond_2

    .line 602
    move v1, v6

    :goto_2
    if-ge v1, v4, :cond_1

    .line 603
    rsub-int/lit8 v2, v1, 0x5

    mul-int/lit8 v2, v2, 0x8

    move/from16 v17, v6

    shr-long v5, v12, v2

    long-to-int v2, v5

    int-to-byte v2, v2

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 602
    add-int/lit8 v1, v1, 0x1

    move/from16 v6, v17

    goto :goto_2

    .line 605
    :cond_1
    move/from16 v17, v6

    .line 606
    move/from16 v11, v17

    const-wide/16 v12, 0x0

    goto :goto_3

    .line 599
    :cond_2
    move/from16 v17, v6

    .line 608
    :goto_3
    move-wide v1, v15

    move/from16 v6, v17

    goto :goto_0

    .line 611
    :cond_3
    move v2, v9

    goto/16 :goto_7

    .line 529
    :sswitch_2
    move-wide v15, v1

    move/from16 v17, v6

    new-array v1, v4, [I

    .line 530
    add-int/lit8 v2, p3, 0x1

    aget v5, p1, p3

    move v9, v6

    const-wide/16 v10, 0x0

    .line 531
    :goto_4
    aget v12, p1, v17

    if-ge v2, v12, :cond_6

    if-nez v6, :cond_6

    .line 532
    add-int/lit8 v12, v9, 0x1

    aput v5, v1, v9

    .line 534
    mul-long/2addr v10, v15

    int-to-long v7, v5

    add-long/2addr v10, v7

    .line 535
    add-int/lit8 v5, v2, 0x1

    aget v2, p1, v2

    .line 537
    sparse-switch v2, :sswitch_data_2

    .line 549
    rem-int/lit8 v7, v12, 0x5

    if-nez v7, :cond_5

    if-lez v12, :cond_5

    .line 552
    move/from16 v7, v17

    goto :goto_5

    .line 545
    :sswitch_3
    add-int/lit8 v5, v5, -0x1

    .line 546
    nop

    .line 547
    move v6, v5

    move v5, v2

    move v2, v6

    move v9, v12

    const/4 v6, 0x1

    goto :goto_4

    .line 552
    :goto_5
    if-ge v7, v4, :cond_4

    .line 553
    rsub-int/lit8 v8, v7, 0x5

    mul-int/lit8 v8, v8, 0x8

    shr-long v8, v10, v8

    long-to-int v8, v8

    int-to-byte v8, v8

    invoke-virtual {v0, v8}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 552
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 555
    :cond_4
    nop

    .line 556
    move v9, v5

    move v5, v2

    move v2, v9

    move/from16 v9, v17

    const-wide/16 v10, 0x0

    goto :goto_4

    .line 531
    :cond_5
    move v9, v5

    move v5, v2

    move v2, v9

    move v9, v12

    goto :goto_4

    .line 563
    :cond_6
    aget v4, p1, v17

    if-ne v2, v4, :cond_7

    if-ge v5, v3, :cond_7

    .line 564
    add-int/lit8 v3, v9, 0x1

    aput v5, v1, v9

    move v9, v3

    .line 570
    :cond_7
    move/from16 v6, v17

    :goto_6
    if-ge v6, v9, :cond_8

    .line 571
    aget v3, v1, v6

    int-to-byte v3, v3

    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 570
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 574
    :cond_8
    nop

    .line 611
    :goto_7
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    move-object/from16 v3, p2

    invoke-direct {v1, v0, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    return v2

    :sswitch_data_0
    .sparse-switch
        0x385 -> :sswitch_2
        0x39c -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x384 -> :sswitch_1
        0x385 -> :sswitch_1
        0x386 -> :sswitch_1
        0x39a -> :sswitch_1
        0x39b -> :sswitch_1
        0x39c -> :sswitch_1
        0x3a0 -> :sswitch_1
    .end sparse-switch

    :sswitch_data_2
    .sparse-switch
        0x384 -> :sswitch_3
        0x385 -> :sswitch_3
        0x386 -> :sswitch_3
        0x39a -> :sswitch_3
        0x39b -> :sswitch_3
        0x39c -> :sswitch_3
        0x3a0 -> :sswitch_3
    .end sparse-switch
.end method

.method static decode([ILjava/lang/String;)Lcom/google/zxing/common/DecoderResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    const/4 v2, 0x1

    shl-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 105
    sget-object v1, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 107
    nop

    .line 108
    aget v2, p0, v2

    .line 109
    new-instance v3, Lcom/google/zxing/pdf417/PDF417ResultMetadata;

    invoke-direct {v3}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;-><init>()V

    const/4 v4, 0x2

    .line 110
    :goto_0
    const/4 v5, 0x0

    aget v5, p0, v5

    if-ge v4, v5, :cond_1

    .line 111
    sparse-switch v2, :sswitch_data_0

    .line 149
    add-int/lit8 v4, v4, -0x1

    .line 150
    invoke-static {p0, v4, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v2

    goto :goto_1

    .line 139
    :sswitch_0
    invoke-static {p0, v4, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeMacroBlock([IILcom/google/zxing/pdf417/PDF417ResultMetadata;)I

    move-result v2

    .line 140
    goto :goto_1

    .line 126
    :sswitch_1
    add-int/lit8 v2, v4, 0x1

    aget v1, p0, v4

    .line 127
    invoke-static {v1}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByValue(I)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v1

    .line 128
    invoke-virtual {v1}, Lcom/google/zxing/common/CharacterSetECI;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    .line 129
    goto :goto_1

    .line 132
    :sswitch_2
    add-int/lit8 v2, v4, 0x2

    .line 133
    goto :goto_1

    .line 136
    :sswitch_3
    add-int/lit8 v2, v4, 0x1

    .line 137
    goto :goto_1

    .line 144
    :sswitch_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object p0

    throw p0

    .line 120
    :sswitch_5
    add-int/lit8 v2, v4, 0x1

    aget v4, p0, v4

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 121
    goto :goto_1

    .line 123
    :sswitch_6
    invoke-static {p0, v4, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result v2

    .line 124
    goto :goto_1

    .line 117
    :sswitch_7
    invoke-static {v2, p0, v1, v4, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[ILjava/nio/charset/Charset;ILjava/lang/StringBuilder;)I

    move-result v2

    .line 118
    goto :goto_1

    .line 113
    :sswitch_8
    invoke-static {p0, v4, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v2

    .line 114
    nop

    .line 153
    :goto_1
    array-length v4, p0

    if-ge v2, v4, :cond_0

    .line 154
    add-int/lit8 v4, v2, 0x1

    aget v2, p0, v2

    goto :goto_0

    .line 156
    :cond_0
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object p0

    throw p0

    .line 159
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-eqz p0, :cond_2

    .line 162
    new-instance p0, Lcom/google/zxing/common/DecoderResult;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0, v1, p1}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    .line 163
    invoke-virtual {p0, v3}, Lcom/google/zxing/common/DecoderResult;->setOther(Ljava/lang/Object;)V

    .line 164
    return-object p0

    .line 160
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object p0

    throw p0

    nop

    :sswitch_data_0
    .sparse-switch
        0x384 -> :sswitch_8
        0x385 -> :sswitch_7
        0x386 -> :sswitch_6
        0x391 -> :sswitch_5
        0x39a -> :sswitch_4
        0x39b -> :sswitch_4
        0x39c -> :sswitch_7
        0x39d -> :sswitch_3
        0x39e -> :sswitch_2
        0x39f -> :sswitch_1
        0x3a0 -> :sswitch_0
    .end sparse-switch
.end method

.method private static decodeBase900toBase10([II)Ljava/lang/String;
    .locals 5
    .param p0, "codewords"    # [I
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 706
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    .line 707
    .local v0, "result":Ljava/math/BigInteger;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x1

    if-ge v1, p1, :cond_0

    .line 708
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sub-int v4, p1, v1

    sub-int/2addr v4, v2

    aget-object v2, v3, v4

    aget v3, p0, v1

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 707
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 710
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v3

    .line 711
    .local v1, "resultString":Ljava/lang/String;
    move-object v1, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x31

    if-ne v3, v4, :cond_1

    .line 714
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 712
    :cond_1
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v2

    throw v2
.end method

.method static decodeMacroBlock([IILcom/google/zxing/pdf417/PDF417ResultMetadata;)I
    .locals 7
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "resultMetadata"    # Lcom/google/zxing/pdf417/PDF417ResultMetadata;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 170
    add-int/lit8 v0, p1, 0x2

    const/4 v1, 0x0

    aget v2, p0, v1

    if-gt v0, v2, :cond_5

    .line 174
    const/4 v0, 0x2

    new-array v2, v0, [I

    .line 175
    .local v2, "segmentIndexArray":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 176
    aget v4, p0, p1

    aput v4, v2, v3

    .line 175
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 178
    .end local v3    # "i":I
    :cond_0
    invoke-static {v2, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setSegmentIndex(I)V

    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 182
    .local v0, "fileId":Ljava/lang/StringBuilder;
    invoke-static {p0, p1, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 183
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setFileId(Ljava/lang/String;)V

    .line 185
    const/4 v3, -0x1

    .line 186
    .local v3, "optionalFieldsStart":I
    aget v4, p0, p1

    const/16 v5, 0x39b

    if-ne v4, v5, :cond_1

    .line 187
    add-int/lit8 v3, p1, 0x1

    .line 190
    :cond_1
    :goto_1
    aget v4, p0, v1

    if-ge p1, v4, :cond_2

    .line 191
    aget v4, p0, p1

    packed-switch v4, :pswitch_data_0

    .line 239
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 193
    :pswitch_0
    add-int/lit8 p1, p1, 0x1

    .line 194
    aget v4, p0, p1

    packed-switch v4, :pswitch_data_1

    .line 231
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 221
    :pswitch_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .local v4, "checksum":Ljava/lang/StringBuilder;
    add-int/lit8 v5, p1, 0x1

    invoke-static {p0, v5, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 223
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setChecksum(I)V

    .line 224
    goto :goto_1

    .line 226
    .end local v4    # "checksum":Ljava/lang/StringBuilder;
    :pswitch_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .local v4, "fileSize":Ljava/lang/StringBuilder;
    add-int/lit8 v5, p1, 0x1

    invoke-static {p0, v5, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 228
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-virtual {p2, v5, v6}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setFileSize(J)V

    .line 229
    goto :goto_1

    .line 206
    .end local v4    # "fileSize":Ljava/lang/StringBuilder;
    :pswitch_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .local v4, "addressee":Ljava/lang/StringBuilder;
    add-int/lit8 v5, p1, 0x1

    invoke-static {p0, v5, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 208
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setAddressee(Ljava/lang/String;)V

    .line 209
    goto :goto_1

    .line 201
    .end local v4    # "addressee":Ljava/lang/StringBuilder;
    :pswitch_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    .local v4, "sender":Ljava/lang/StringBuilder;
    add-int/lit8 v5, p1, 0x1

    invoke-static {p0, v5, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 203
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setSender(Ljava/lang/String;)V

    .line 204
    goto :goto_1

    .line 216
    .end local v4    # "sender":Ljava/lang/StringBuilder;
    :pswitch_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 217
    .local v4, "timestamp":Ljava/lang/StringBuilder;
    add-int/lit8 v5, p1, 0x1

    invoke-static {p0, v5, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 218
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-virtual {p2, v5, v6}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setTimestamp(J)V

    .line 219
    goto/16 :goto_1

    .line 211
    .end local v4    # "timestamp":Ljava/lang/StringBuilder;
    :pswitch_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 212
    .local v4, "segmentCount":Ljava/lang/StringBuilder;
    add-int/lit8 v5, p1, 0x1

    invoke-static {p0, v5, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 213
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setSegmentCount(I)V

    .line 214
    goto/16 :goto_1

    .line 196
    .end local v4    # "segmentCount":Ljava/lang/StringBuilder;
    :pswitch_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .local v4, "fileName":Ljava/lang/StringBuilder;
    add-int/lit8 v5, p1, 0x1

    invoke-static {p0, v5, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 198
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setFileName(Ljava/lang/String;)V

    .line 199
    goto/16 :goto_1

    .line 235
    .end local v4    # "fileName":Ljava/lang/StringBuilder;
    :pswitch_8
    add-int/lit8 p1, p1, 0x1

    .line 236
    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setLastSegment(Z)V

    .line 237
    goto/16 :goto_1

    .line 244
    :cond_2
    const/4 v1, -0x1

    if-eq v3, v1, :cond_4

    .line 245
    sub-int v1, p1, v3

    .line 246
    .local v1, "optionalFieldsLength":I
    invoke-virtual {p2}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->isLastSegment()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 248
    add-int/lit8 v1, v1, -0x1

    .line 250
    :cond_3
    add-int v4, v3, v1

    invoke-static {p0, v3, v4}, Ljava/util/Arrays;->copyOfRange([III)[I

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setOptionalData([I)V

    .line 253
    .end local v1    # "optionalFieldsLength":I
    :cond_4
    return p1

    .line 172
    .end local v0    # "fileId":Ljava/lang/StringBuilder;
    .end local v2    # "segmentIndexArray":[I
    .end local v3    # "optionalFieldsStart":I
    :cond_5
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    :pswitch_data_0
    .packed-switch 0x39a
        :pswitch_8
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private static decodeTextCompaction([I[IILjava/lang/StringBuilder;)V
    .locals 8
    .param p0, "textCompactionData"    # [I
    .param p1, "byteCompactionData"    # [I
    .param p2, "length"    # I
    .param p3, "result"    # Ljava/lang/StringBuilder;

    .line 338
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 339
    .local v0, "subMode":Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 340
    .local v1, "priorToShiftMode":Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    const/4 v2, 0x0

    .line 341
    .local v2, "i":I
    :goto_0
    if-ge v2, p2, :cond_7

    .line 342
    aget v3, p0, v2

    .line 343
    .local v3, "subModeCh":I
    const/4 v4, 0x0

    .line 344
    .local v4, "ch":C
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$1;->$SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v6

    aget v5, v5, v6

    const/16 v6, 0x1d

    const/16 v7, 0x1a

    packed-switch v5, :pswitch_data_0

    goto/16 :goto_6

    .line 476
    :pswitch_0
    move-object v0, v1

    .line 477
    if-ge v3, v6, :cond_0

    .line 478
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v4, v5, v3

    goto/16 :goto_6

    .line 480
    :cond_0
    sparse-switch v3, :sswitch_data_0

    goto/16 :goto_6

    .line 488
    :sswitch_0
    aget v5, p1, v2

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_6

    .line 483
    :sswitch_1
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 484
    goto/16 :goto_6

    .line 459
    :pswitch_1
    move-object v0, v1

    .line 460
    if-ge v3, v7, :cond_1

    .line 461
    add-int/lit8 v5, v3, 0x41

    int-to-char v4, v5

    goto/16 :goto_6

    .line 463
    :cond_1
    sparse-switch v3, :sswitch_data_1

    goto :goto_1

    .line 468
    :sswitch_2
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1

    .line 465
    :sswitch_3
    const/16 v4, 0x20

    .line 466
    goto/16 :goto_6

    .line 472
    :goto_1
    goto/16 :goto_6

    .line 442
    :pswitch_2
    if-ge v3, v6, :cond_2

    .line 443
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v4, v5, v3

    goto/16 :goto_6

    .line 445
    :cond_2
    sparse-switch v3, :sswitch_data_2

    goto :goto_2

    .line 451
    :sswitch_4
    aget v5, p1, v2

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 448
    :sswitch_5
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 449
    goto/16 :goto_6

    .line 455
    :goto_2
    goto/16 :goto_6

    .line 411
    :pswitch_3
    const/16 v5, 0x19

    if-ge v3, v5, :cond_3

    .line 412
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    aget-char v4, v5, v3

    goto/16 :goto_6

    .line 414
    :cond_3
    sparse-switch v3, :sswitch_data_3

    goto :goto_3

    .line 434
    :sswitch_6
    aget v5, p1, v2

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 430
    :sswitch_7
    move-object v1, v0

    .line 431
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 432
    goto/16 :goto_6

    .line 426
    :sswitch_8
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 427
    goto/16 :goto_6

    .line 422
    :sswitch_9
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 423
    goto :goto_6

    .line 419
    :sswitch_a
    const/16 v4, 0x20

    .line 420
    goto :goto_6

    .line 416
    :sswitch_b
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 417
    goto :goto_6

    .line 438
    :goto_3
    goto :goto_6

    .line 378
    :pswitch_4
    if-ge v3, v7, :cond_4

    .line 379
    add-int/lit8 v5, v3, 0x61

    int-to-char v4, v5

    goto :goto_6

    .line 381
    :cond_4
    sparse-switch v3, :sswitch_data_4

    goto :goto_4

    .line 400
    :sswitch_c
    aget v5, p1, v2

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 401
    goto :goto_6

    .line 403
    :sswitch_d
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_4

    .line 395
    :sswitch_e
    move-object v1, v0

    .line 396
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 397
    goto :goto_6

    .line 391
    :sswitch_f
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 392
    goto :goto_6

    .line 387
    :sswitch_10
    move-object v1, v0

    .line 388
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 389
    goto :goto_6

    .line 383
    :sswitch_11
    const/16 v4, 0x20

    .line 384
    goto :goto_6

    .line 407
    :goto_4
    goto :goto_6

    .line 347
    :pswitch_5
    if-ge v3, v7, :cond_5

    .line 349
    add-int/lit8 v5, v3, 0x41

    int-to-char v4, v5

    goto :goto_6

    .line 351
    :cond_5
    sparse-switch v3, :sswitch_data_5

    goto :goto_5

    .line 367
    :sswitch_12
    aget v5, p1, v2

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 368
    goto :goto_6

    .line 370
    :sswitch_13
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_5

    .line 363
    :sswitch_14
    move-object v1, v0

    .line 364
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 365
    goto :goto_6

    .line 359
    :sswitch_15
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 360
    goto :goto_6

    .line 356
    :sswitch_16
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 357
    goto :goto_6

    .line 353
    :sswitch_17
    const/16 v4, 0x20

    .line 354
    goto :goto_6

    .line 374
    :goto_5
    nop

    .line 494
    :goto_6
    if-eqz v4, :cond_6

    .line 496
    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 498
    :cond_6
    nop

    .end local v3    # "subModeCh":I
    .end local v4    # "ch":C
    add-int/lit8 v2, v2, 0x1

    .line 499
    goto/16 :goto_0

    .line 500
    :cond_7
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x1d -> :sswitch_1
        0x384 -> :sswitch_1
        0x391 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x1a -> :sswitch_3
        0x384 -> :sswitch_2
    .end sparse-switch

    :sswitch_data_2
    .sparse-switch
        0x1d -> :sswitch_5
        0x384 -> :sswitch_5
        0x391 -> :sswitch_4
    .end sparse-switch

    :sswitch_data_3
    .sparse-switch
        0x19 -> :sswitch_b
        0x1a -> :sswitch_a
        0x1b -> :sswitch_9
        0x1c -> :sswitch_8
        0x1d -> :sswitch_7
        0x384 -> :sswitch_8
        0x391 -> :sswitch_6
    .end sparse-switch

    :sswitch_data_4
    .sparse-switch
        0x1a -> :sswitch_11
        0x1b -> :sswitch_10
        0x1c -> :sswitch_f
        0x1d -> :sswitch_e
        0x384 -> :sswitch_d
        0x391 -> :sswitch_c
    .end sparse-switch

    :sswitch_data_5
    .sparse-switch
        0x1a -> :sswitch_17
        0x1b -> :sswitch_16
        0x1c -> :sswitch_15
        0x1d -> :sswitch_14
        0x384 -> :sswitch_13
        0x391 -> :sswitch_12
    .end sparse-switch
.end method

.method private static numericCompaction([IILjava/lang/StringBuilder;)I
    .locals 5
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 624
    const/4 v0, 0x0

    .line 625
    .local v0, "count":I
    const/4 v1, 0x0

    .line 627
    .local v1, "end":Z
    const/16 v2, 0xf

    new-array v2, v2, [I

    .line 629
    .local v2, "numericCodewords":[I
    :goto_0
    const/4 v3, 0x0

    aget v4, p0, v3

    if-ge p1, v4, :cond_4

    if-nez v1, :cond_4

    .line 630
    add-int/lit8 v4, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v4, "codeIndex":I
    aget p1, p0, p1

    .line 631
    .local p1, "code":I
    aget v3, p0, v3

    if-ne v4, v3, :cond_0

    .line 632
    const/4 v1, 0x1

    .line 634
    :cond_0
    const/16 v3, 0x384

    if-ge p1, v3, :cond_1

    .line 635
    aput p1, v2, v0

    .line 636
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 638
    :cond_1
    sparse-switch p1, :sswitch_data_0

    goto :goto_1

    .line 645
    :sswitch_0
    add-int/lit8 v4, v4, -0x1

    .line 646
    const/4 v1, 0x1

    .line 650
    :goto_1
    rem-int/lit8 v3, v0, 0xf

    if-eqz v3, :cond_2

    const/16 v3, 0x386

    if-eq p1, v3, :cond_2

    if-eqz v1, :cond_3

    :cond_2
    if-lez v0, :cond_3

    .line 655
    invoke-static {v2, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 656
    const/4 v0, 0x0

    .line 658
    .end local p1    # "code":I
    :cond_3
    move p1, v4

    goto :goto_0

    .line 659
    .end local v4    # "codeIndex":I
    .local p1, "codeIndex":I
    :cond_4
    return p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x384 -> :sswitch_0
        0x385 -> :sswitch_0
        0x39a -> :sswitch_0
        0x39b -> :sswitch_0
        0x39c -> :sswitch_0
        0x3a0 -> :sswitch_0
    .end sparse-switch
.end method

.method private static textCompaction([IILjava/lang/StringBuilder;)I
    .locals 8
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuilder;

    .line 268
    const/4 v0, 0x0

    aget v1, p0, v0

    sub-int/2addr v1, p1

    shl-int/lit8 v1, v1, 0x1

    new-array v1, v1, [I

    .line 270
    .local v1, "textCompactionData":[I
    aget v2, p0, v0

    sub-int/2addr v2, p1

    shl-int/lit8 v2, v2, 0x1

    new-array v2, v2, [I

    .line 272
    .local v2, "byteCompactionData":[I
    const/4 v3, 0x0

    .line 273
    .local v3, "index":I
    const/4 v4, 0x0

    .local v4, "end":Z
    const/4 v5, 0x0

    .line 274
    :goto_0
    aget v6, p0, v0

    if-ge p1, v6, :cond_1

    if-nez v4, :cond_1

    .line 275
    add-int/lit8 v6, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v6, "codeIndex":I
    aget p1, p0, p1

    .line 276
    .local v5, "code":I
    move v5, p1

    const/16 v7, 0x384

    if-ge p1, v7, :cond_0

    .line 277
    div-int/lit8 p1, v5, 0x1e

    aput p1, v1, v3

    .line 278
    add-int/lit8 p1, v3, 0x1

    rem-int/lit8 v7, v5, 0x1e

    aput v7, v1, p1

    .line 279
    add-int/lit8 v3, v3, 0x2

    move p1, v6

    goto :goto_0

    .line 281
    :cond_0
    sparse-switch v5, :sswitch_data_0

    move p1, v6

    goto :goto_1

    .line 302
    :sswitch_0
    const/16 p1, 0x391

    aput p1, v1, v3

    .line 303
    add-int/lit8 p1, v6, 0x1

    .end local v6    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    aget v5, p0, v6

    .line 304
    aput v5, v2, v3

    .line 305
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 292
    .end local p1    # "codeIndex":I
    .restart local v6    # "codeIndex":I
    :sswitch_1
    add-int/lit8 p1, v6, -0x1

    .line 293
    .end local v6    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v4, 0x1

    .line 294
    goto :goto_0

    .line 284
    .end local p1    # "codeIndex":I
    .restart local v6    # "codeIndex":I
    :sswitch_2
    add-int/lit8 p1, v3, 0x1

    .end local v3    # "index":I
    .local p1, "index":I
    aput v7, v1, v3

    .line 285
    move v3, p1

    move p1, v6

    goto :goto_0

    .line 309
    .end local v5    # "code":I
    .end local v6    # "codeIndex":I
    .restart local v3    # "index":I
    .local p1, "codeIndex":I
    :goto_1
    goto :goto_0

    .line 310
    :cond_1
    invoke-static {v1, v2, v3, p2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeTextCompaction([I[IILjava/lang/StringBuilder;)V

    .line 311
    return p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x384 -> :sswitch_2
        0x385 -> :sswitch_1
        0x386 -> :sswitch_1
        0x391 -> :sswitch_0
        0x39a -> :sswitch_1
        0x39b -> :sswitch_1
        0x39c -> :sswitch_1
        0x3a0 -> :sswitch_1
    .end sparse-switch
.end method
