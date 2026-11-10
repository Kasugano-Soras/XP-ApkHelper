.class public final Lcom/google/zxing/qrcode/encoder/Encoder;
.super Ljava/lang/Object;
.source "Encoder.java"


# static fields
.field private static final ALPHANUMERIC_TABLE:[I

.field static final DEFAULT_BYTE_MODE_ENCODING:Ljava/lang/String; = "ISO-8859-1"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const/16 v0, 0x60

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    return-void

    :array_0
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        0x24
        -0x1
        -0x1
        -0x1
        0x25
        0x26
        -0x1
        -0x1
        -0x1
        -0x1
        0x27
        0x28
        -0x1
        0x29
        0x2a
        0x2b
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0x2c
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
        0x11
        0x12
        0x13
        0x14
        0x15
        0x16
        0x17
        0x18
        0x19
        0x1a
        0x1b
        0x1c
        0x1d
        0x1e
        0x1f
        0x20
        0x21
        0x22
        0x23
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method static append8BitBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V
    .locals 5
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 586
    :try_start_0
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 589
    .local v0, "bytes":[B
    nop

    .line 590
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, v0, v2

    .line 591
    .local v3, "b":B
    const/16 v4, 0x8

    invoke-virtual {p1, v3, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 590
    .end local v3    # "b":B
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 593
    :cond_0
    return-void

    .line 587
    .end local v0    # "bytes":[B
    :catch_0
    move-exception v0

    .line 588
    .local v0, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1, v0}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static appendAlphanumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V
    .locals 6
    .param p0, "content"    # Ljava/lang/CharSequence;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 559
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 560
    .local v0, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    const/4 v2, 0x0

    move v3, v2

    .line 561
    :goto_0
    if-ge v1, v0, :cond_3

    .line 562
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v4

    .line 563
    .local v2, "code1":I
    move v2, v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    .line 566
    add-int/lit8 v4, v1, 0x1

    if-ge v4, v0, :cond_1

    .line 567
    add-int/lit8 v4, v1, 0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v4

    .line 568
    .local v3, "code2":I
    move v3, v4

    if-eq v4, v5, :cond_0

    .line 572
    mul-int/lit8 v4, v2, 0x2d

    add-int/2addr v4, v3

    const/16 v5, 0xb

    invoke-virtual {p1, v4, v5}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 573
    nop

    .end local v3    # "code2":I
    add-int/lit8 v1, v1, 0x2

    .line 574
    goto :goto_0

    .line 569
    .restart local v3    # "code2":I
    :cond_0
    new-instance v4, Lcom/google/zxing/WriterException;

    invoke-direct {v4}, Lcom/google/zxing/WriterException;-><init>()V

    throw v4

    .line 576
    .end local v3    # "code2":I
    :cond_1
    const/4 v4, 0x6

    invoke-virtual {p1, v2, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 577
    nop

    .end local v2    # "code1":I
    add-int/lit8 v1, v1, 0x1

    .line 579
    goto :goto_0

    .line 564
    .restart local v2    # "code1":I
    :cond_2
    new-instance v3, Lcom/google/zxing/WriterException;

    invoke-direct {v3}, Lcom/google/zxing/WriterException;-><init>()V

    throw v3

    .line 580
    .end local v2    # "code1":I
    :cond_3
    return-void
.end method

.method static appendBytes(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V
    .locals 3
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "mode"    # Lcom/google/zxing/qrcode/decoder/Mode;
    .param p2, "bits"    # Lcom/google/zxing/common/BitArray;
    .param p3, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 516
    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder$1;->$SwitchMap$com$google$zxing$qrcode$decoder$Mode:[I

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 530
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Invalid mode: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 527
    :pswitch_0
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendKanjiBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;)V

    .line 528
    return-void

    .line 524
    :pswitch_1
    invoke-static {p0, p2, p3}, Lcom/google/zxing/qrcode/encoder/Encoder;->append8BitBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V

    .line 525
    return-void

    .line 521
    :pswitch_2
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendAlphanumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V

    .line 522
    return-void

    .line 518
    :pswitch_3
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendNumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V

    .line 519
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static appendECI(Lcom/google/zxing/common/CharacterSetECI;Lcom/google/zxing/common/BitArray;)V
    .locals 2
    .param p0, "eci"    # Lcom/google/zxing/common/CharacterSetECI;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;

    .line 625
    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->ECI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/Mode;->getBits()I

    move-result v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 627
    invoke-virtual {p0}, Lcom/google/zxing/common/CharacterSetECI;->getValue()I

    move-result v0

    const/16 v1, 0x8

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 628
    return-void
.end method

.method static appendKanjiBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;)V
    .locals 9
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 598
    :try_start_0
    const-string v0, "Shift_JIS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 601
    .local v0, "bytes":[B
    nop

    .line 602
    array-length v1, v0

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_4

    .line 605
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    .line 606
    .local v1, "maxI":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_3

    .line 607
    aget-byte v3, v0, v2

    and-int/lit16 v3, v3, 0xff

    .line 608
    .local v3, "byte1":I
    add-int/lit8 v4, v2, 0x1

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    .line 609
    .local v4, "byte2":I
    shl-int/lit8 v5, v3, 0x8

    or-int/2addr v5, v4

    .line 610
    .local v5, "code":I
    const/4 v6, -0x1

    .line 611
    .local v6, "subtracted":I
    const v7, 0x8140

    if-lt v5, v7, :cond_0

    const v8, 0x9ffc

    if-gt v5, v8, :cond_0

    .line 612
    sub-int v6, v5, v7

    goto :goto_1

    .line 613
    :cond_0
    const v7, 0xe040

    if-lt v5, v7, :cond_1

    const v7, 0xebbf

    if-gt v5, v7, :cond_1

    .line 614
    const v7, 0xc140

    sub-int v6, v5, v7

    .line 616
    :cond_1
    :goto_1
    const/4 v7, -0x1

    if-eq v6, v7, :cond_2

    .line 619
    shr-int/lit8 v7, v6, 0x8

    mul-int/lit16 v7, v7, 0xc0

    and-int/lit16 v8, v6, 0xff

    add-int/2addr v7, v8

    .line 620
    .local v7, "encoded":I
    const/16 v8, 0xd

    invoke-virtual {p1, v7, v8}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 606
    .end local v3    # "byte1":I
    .end local v4    # "byte2":I
    .end local v5    # "code":I
    .end local v6    # "subtracted":I
    .end local v7    # "encoded":I
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 617
    .restart local v3    # "byte1":I
    .restart local v4    # "byte2":I
    .restart local v5    # "code":I
    .restart local v6    # "subtracted":I
    :cond_2
    new-instance v7, Lcom/google/zxing/WriterException;

    const-string v8, "Invalid byte sequence"

    invoke-direct {v7, v8}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 622
    .end local v2    # "i":I
    .end local v3    # "byte1":I
    .end local v4    # "byte2":I
    .end local v5    # "code":I
    .end local v6    # "subtracted":I
    :cond_3
    return-void

    .line 603
    .end local v1    # "maxI":I
    :cond_4
    new-instance v1, Lcom/google/zxing/WriterException;

    const-string v2, "Kanji byte size not even"

    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 599
    .end local v0    # "bytes":[B
    :catch_0
    move-exception v0

    .line 600
    .local v0, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1, v0}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static appendLengthInfo(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V
    .locals 5
    .param p0, "numLetters"    # I
    .param p1, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p2, "mode"    # Lcom/google/zxing/qrcode/decoder/Mode;
    .param p3, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 502
    invoke-virtual {p2, p1}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v0

    .line 503
    .local v0, "numBits":I
    const/4 v1, 0x1

    shl-int v2, v1, v0

    if-ge p0, v2, :cond_0

    .line 506
    invoke-virtual {p3, p0, v0}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 507
    return-void

    .line 504
    :cond_0
    new-instance v2, Lcom/google/zxing/WriterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is bigger than "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    shl-int v4, v1, v0

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static appendModeInfo(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V
    .locals 2
    .param p0, "mode"    # Lcom/google/zxing/qrcode/decoder/Mode;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;

    .line 494
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Mode;->getBits()I

    move-result v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 495
    return-void
.end method

.method static appendNumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V
    .locals 7
    .param p0, "content"    # Ljava/lang/CharSequence;
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;

    .line 535
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 536
    .local v0, "length":I
    const/4 v1, 0x0

    .line 537
    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 538
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    .line 539
    .local v2, "num1":I
    add-int/lit8 v3, v1, 0x2

    if-ge v3, v0, :cond_0

    .line 541
    add-int/lit8 v3, v1, 0x1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    .line 542
    .local v3, "num2":I
    add-int/lit8 v4, v1, 0x2

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v4, v4, -0x30

    .line 543
    .local v4, "num3":I
    mul-int/lit8 v5, v2, 0x64

    mul-int/lit8 v6, v3, 0xa

    add-int/2addr v5, v6

    add-int/2addr v5, v4

    const/16 v6, 0xa

    invoke-virtual {p1, v5, v6}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 544
    nop

    .end local v3    # "num2":I
    .end local v4    # "num3":I
    add-int/lit8 v1, v1, 0x3

    .line 545
    goto :goto_0

    :cond_0
    add-int/lit8 v3, v1, 0x1

    if-ge v3, v0, :cond_1

    .line 547
    add-int/lit8 v3, v1, 0x1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    .line 548
    .restart local v3    # "num2":I
    mul-int/lit8 v4, v2, 0xa

    add-int/2addr v4, v3

    const/4 v5, 0x7

    invoke-virtual {p1, v4, v5}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 549
    nop

    .end local v3    # "num2":I
    add-int/lit8 v1, v1, 0x2

    .line 550
    goto :goto_0

    .line 552
    :cond_1
    const/4 v3, 0x4

    invoke-virtual {p1, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 553
    nop

    .end local v2    # "num1":I
    add-int/lit8 v1, v1, 0x1

    .line 555
    goto :goto_0

    .line 556
    :cond_2
    return-void
.end method

.method private static calculateBitsNeeded(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/Version;)I
    .locals 2
    .param p0, "mode"    # Lcom/google/zxing/qrcode/decoder/Mode;
    .param p1, "headerBits"    # Lcom/google/zxing/common/BitArray;
    .param p2, "dataBits"    # Lcom/google/zxing/common/BitArray;
    .param p3, "version"    # Lcom/google/zxing/qrcode/decoder/Version;

    .line 202
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    invoke-virtual {p0, p3}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static calculateMaskPenalty(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .locals 2
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .line 58
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule1(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v0

    .line 59
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule2(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    add-int/2addr v0, v1

    .line 60
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule3(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    add-int/2addr v0, v1

    .line 61
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule4(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    add-int/2addr v0, v1

    .line 58
    return v0
.end method

.method private static chooseMaskPattern(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .locals 5
    .param p0, "bits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p2, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p3, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 275
    const v0, 0x7fffffff

    .line 276
    .local v0, "minPenalty":I
    const/4 v1, -0x1

    .line 278
    .local v1, "bestMaskPattern":I
    const/4 v2, 0x0

    .local v2, "maskPattern":I
    const/4 v3, 0x0

    :goto_0
    const/16 v4, 0x8

    if-ge v2, v4, :cond_1

    .line 279
    invoke-static {p0, p1, p2, v2, p3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 280
    invoke-static {p3}, Lcom/google/zxing/qrcode/encoder/Encoder;->calculateMaskPenalty(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v4

    .line 281
    .local v3, "penalty":I
    move v3, v4

    if-ge v4, v0, :cond_0

    .line 282
    move v0, v3

    .line 283
    move v1, v2

    .line 278
    .end local v3    # "penalty":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 286
    .end local v2    # "maskPattern":I
    :cond_1
    return v1
.end method

.method public static chooseMode(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;
    .locals 1
    .param p0, "content"    # Ljava/lang/String;

    .line 217
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v0

    return-object v0
.end method

.method private static chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;
    .locals 6
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .line 225
    const-string v0, "Shift_JIS"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/Encoder;->isOnlyDoubleByteKanji(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->KANJI:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v0

    .line 229
    :cond_0
    const/4 v0, 0x0

    .line 230
    .local v0, "hasNumeric":Z
    const/4 v1, 0x0

    .line 231
    .local v1, "hasAlphanumeric":Z
    const/4 v2, 0x0

    .local v2, "i":I
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 232
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 233
    .local v3, "c":C
    move v3, v4

    const/16 v5, 0x30

    if-lt v4, v5, :cond_1

    const/16 v4, 0x39

    if-gt v3, v4, :cond_1

    .line 234
    const/4 v0, 0x1

    goto :goto_1

    .line 235
    :cond_1
    invoke-static {v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    .line 236
    const/4 v1, 0x1

    .line 231
    .end local v3    # "c":C
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 238
    :cond_2
    sget-object v4, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v4

    .line 241
    .end local v2    # "i":I
    :cond_3
    if-eqz v1, :cond_4

    .line 242
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->ALPHANUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2

    .line 244
    :cond_4
    if-eqz v0, :cond_5

    .line 245
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->NUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2

    .line 247
    :cond_5
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2
.end method

.method private static chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;
    .locals 3
    .param p0, "numInputBits"    # I
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 290
    const/4 v0, 0x1

    .local v0, "versionNum":I
    :goto_0
    const/16 v1, 0x28

    if-gt v0, v1, :cond_1

    .line 291
    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v1

    .line 292
    .local v1, "version":Lcom/google/zxing/qrcode/decoder/Version;
    invoke-static {p0, v1, p1}, Lcom/google/zxing/qrcode/encoder/Encoder;->willFit(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 293
    return-object v1

    .line 290
    .end local v1    # "version":Lcom/google/zxing/qrcode/decoder/Version;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 296
    .end local v0    # "versionNum":I
    :cond_1
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Data too big"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/encoder/QRCode;
    .locals 1
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 72
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/qrcode/encoder/QRCode;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/qrcode/encoder/QRCode;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/qrcode/encoder/QRCode;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 80
    nop

    .line 81
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    sget-object v2, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p2, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 82
    :goto_0
    if-eqz v2, :cond_1

    .line 83
    sget-object v3, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 82
    :cond_1
    const-string v3, "ISO-8859-1"

    .line 88
    :goto_1
    invoke-static {p0, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v4

    .line 92
    new-instance v5, Lcom/google/zxing/common/BitArray;

    invoke-direct {v5}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 95
    sget-object v6, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v4, v6, :cond_2

    if-eqz v2, :cond_2

    .line 96
    invoke-static {v3}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByName(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v2

    .line 97
    if-eqz v2, :cond_2

    .line 98
    invoke-static {v2, v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendECI(Lcom/google/zxing/common/CharacterSetECI;Lcom/google/zxing/common/BitArray;)V

    .line 103
    :cond_2
    if-eqz p2, :cond_3

    sget-object v2, Lcom/google/zxing/EncodeHintType;->GS1_FORMAT:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p2, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    :cond_3
    move v0, v1

    .line 104
    :goto_2
    if-eqz v0, :cond_4

    sget-object v0, Lcom/google/zxing/EncodeHintType;->GS1_FORMAT:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 106
    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_FIRST_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-static {v0, v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendModeInfo(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V

    .line 110
    :cond_4
    invoke-static {v4, v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendModeInfo(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V

    .line 114
    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 115
    invoke-static {p0, v4, v0, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendBytes(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V

    .line 118
    if-eqz p2, :cond_6

    sget-object v1, Lcom/google/zxing/EncodeHintType;->QR_VERSION:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 119
    sget-object v1, Lcom/google/zxing/EncodeHintType;->QR_VERSION:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 120
    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v1

    .line 121
    invoke-static {v4, v5, v0, v1}, Lcom/google/zxing/qrcode/encoder/Encoder;->calculateBitsNeeded(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v2

    .line 122
    invoke-static {v2, v1, p1}, Lcom/google/zxing/qrcode/encoder/Encoder;->willFit(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 125
    goto :goto_3

    .line 123
    :cond_5
    new-instance p0, Lcom/google/zxing/WriterException;

    const-string p1, "Data too big for requested version"

    invoke-direct {p0, p1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 126
    :cond_6
    invoke-static {p1, v4, v5, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->recommendVersion(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v1

    .line 129
    :goto_3
    new-instance v2, Lcom/google/zxing/common/BitArray;

    invoke-direct {v2}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 130
    invoke-virtual {v2, v5}, Lcom/google/zxing/common/BitArray;->appendBitArray(Lcom/google/zxing/common/BitArray;)V

    .line 132
    sget-object v3, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v4, v3, :cond_7

    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result p0

    goto :goto_4

    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    .line 133
    :goto_4
    invoke-static {p0, v1, v4, v2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendLengthInfo(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V

    .line 135
    invoke-virtual {v2, v0}, Lcom/google/zxing/common/BitArray;->appendBitArray(Lcom/google/zxing/common/BitArray;)V

    .line 137
    invoke-virtual {v1, p1}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object p0

    .line 138
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getTotalECCodewords()I

    move-result v3

    sub-int/2addr v0, v3

    .line 141
    invoke-static {v0, v2}, Lcom/google/zxing/qrcode/encoder/Encoder;->terminateBits(ILcom/google/zxing/common/BitArray;)V

    .line 144
    nop

    .line 145
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v3

    .line 147
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getNumBlocks()I

    move-result p0

    .line 144
    invoke-static {v2, v3, v0, p0}, Lcom/google/zxing/qrcode/encoder/Encoder;->interleaveWithECBytes(Lcom/google/zxing/common/BitArray;III)Lcom/google/zxing/common/BitArray;

    move-result-object p0

    .line 149
    new-instance v0, Lcom/google/zxing/qrcode/encoder/QRCode;

    invoke-direct {v0}, Lcom/google/zxing/qrcode/encoder/QRCode;-><init>()V

    .line 151
    invoke-virtual {v0, p1}, Lcom/google/zxing/qrcode/encoder/QRCode;->setECLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)V

    .line 152
    invoke-virtual {v0, v4}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMode(Lcom/google/zxing/qrcode/decoder/Mode;)V

    .line 153
    invoke-virtual {v0, v1}, Lcom/google/zxing/qrcode/encoder/QRCode;->setVersion(Lcom/google/zxing/qrcode/decoder/Version;)V

    .line 156
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v2

    .line 157
    new-instance v3, Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    invoke-direct {v3, v2, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;-><init>(II)V

    .line 160
    nop

    .line 161
    const/4 v2, -0x1

    if-eqz p2, :cond_8

    sget-object v4, Lcom/google/zxing/EncodeHintType;->QR_MASK_PATTERN:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 162
    sget-object v4, Lcom/google/zxing/EncodeHintType;->QR_MASK_PATTERN:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    .line 163
    invoke-static {p2}, Lcom/google/zxing/qrcode/encoder/QRCode;->isValidMaskPattern(I)Z

    move-result v4

    if-nez v4, :cond_9

    move p2, v2

    goto :goto_5

    .line 166
    :cond_8
    move p2, v2

    :cond_9
    :goto_5
    if-ne p2, v2, :cond_a

    .line 167
    invoke-static {p0, p1, v1, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMaskPattern(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result p2

    .line 169
    :cond_a
    invoke-virtual {v0, p2}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMaskPattern(I)V

    .line 172
    invoke-static {p0, p1, v1, p2, v3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 173
    invoke-virtual {v0, v3}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 175
    return-object v0
.end method

.method static generateECBytes([BI)[B
    .locals 5
    .param p0, "dataBytes"    # [B
    .param p1, "numEcBytesInBlock"    # I

    .line 476
    array-length v0, p0

    const/4 v1, 0x0

    .line 477
    .local v1, "numDataBytes":I
    move v1, v0

    add-int/2addr v0, p1

    new-array v0, v0, [I

    .line 478
    .local v0, "toEncode":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 479
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    aput v3, v0, v2

    .line 478
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 481
    .end local v2    # "i":I
    :cond_0
    new-instance v2, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;

    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->QR_CODE_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v2, v3}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    invoke-virtual {v2, v0, p1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->encode([II)V

    .line 483
    new-array v2, p1, [B

    .line 484
    .local v2, "ecBytes":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, p1, :cond_1

    .line 485
    add-int v4, v1, v3

    aget v4, v0, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 484
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 487
    .end local v3    # "i":I
    :cond_1
    return-object v2
.end method

.method static getAlphanumericCode(I)I
    .locals 1
    .param p0, "code"    # I

    .line 210
    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    array-length v0, v0

    if-ge p0, v0, :cond_0

    .line 211
    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    aget v0, v0, p0

    return v0

    .line 213
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method static getNumDataBytesAndNumECBytesForBlockID(IIII[I[I)V
    .locals 10
    .param p0, "numTotalBytes"    # I
    .param p1, "numDataBytes"    # I
    .param p2, "numRSBlocks"    # I
    .param p3, "blockID"    # I
    .param p4, "numDataBytesInBlock"    # [I
    .param p5, "numECBytesInBlock"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 357
    if-ge p3, p2, :cond_4

    .line 361
    rem-int v0, p0, p2

    .line 363
    .local v0, "numRsBlocksInGroup2":I
    sub-int v1, p2, v0

    .line 365
    .local v1, "numRsBlocksInGroup1":I
    div-int v2, p0, p2

    const/4 v3, 0x0

    move v4, v3

    .line 367
    .local v4, "numTotalBytesInGroup1":I
    move v4, v2

    add-int/lit8 v2, v2, 0x1

    .line 369
    .local v2, "numTotalBytesInGroup2":I
    div-int v5, p1, p2

    .line 371
    .local v3, "numDataBytesInGroup1":I
    move v3, v5

    add-int/lit8 v5, v5, 0x1

    .line 373
    .local v5, "numDataBytesInGroup2":I
    sub-int v6, v4, v3

    .line 375
    .local v6, "numEcBytesInGroup1":I
    sub-int v7, v2, v5

    .line 378
    .local v7, "numEcBytesInGroup2":I
    if-ne v6, v7, :cond_3

    .line 382
    add-int v8, v1, v0

    if-ne p2, v8, :cond_2

    .line 386
    add-int v8, v3, v6

    mul-int/2addr v8, v1

    add-int v9, v5, v7

    mul-int/2addr v9, v0

    add-int/2addr v8, v9

    if-ne p0, v8, :cond_1

    .line 394
    const/4 v8, 0x0

    if-ge p3, v1, :cond_0

    .line 395
    aput v3, p4, v8

    .line 396
    aput v6, p5, v8

    return-void

    .line 398
    :cond_0
    aput v5, p4, v8

    .line 399
    aput v7, p5, v8

    .line 401
    return-void

    .line 391
    :cond_1
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "Total bytes mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 383
    :cond_2
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "RS blocks mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 379
    :cond_3
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "EC bytes mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 358
    .end local v0    # "numRsBlocksInGroup2":I
    .end local v1    # "numRsBlocksInGroup1":I
    .end local v2    # "numTotalBytesInGroup2":I
    .end local v3    # "numDataBytesInGroup1":I
    .end local v4    # "numTotalBytesInGroup1":I
    .end local v5    # "numDataBytesInGroup2":I
    .end local v6    # "numEcBytesInGroup1":I
    .end local v7    # "numEcBytesInGroup2":I
    :cond_4
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Block ID too large"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static interleaveWithECBytes(Lcom/google/zxing/common/BitArray;III)Lcom/google/zxing/common/BitArray;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 413
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v0

    if-ne v0, p2, :cond_9

    .line 419
    nop

    .line 420
    nop

    .line 421
    nop

    .line 424
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(I)V

    .line 426
    const/4 v1, 0x0

    move v5, v1

    move v8, v5

    move v9, v8

    move v10, v9

    :goto_0
    if-ge v5, p3, :cond_0

    .line 427
    const/4 v2, 0x1

    new-array v6, v2, [I

    .line 428
    new-array v7, v2, [I

    .line 429
    move v2, p1

    move v3, p2

    move v4, p3

    invoke-static/range {v2 .. v7}, Lcom/google/zxing/qrcode/encoder/Encoder;->getNumDataBytesAndNumECBytesForBlockID(IIII[I[I)V

    .line 433
    aget p1, v6, v1

    .line 434
    new-array p2, p1, [B

    .line 435
    shl-int/lit8 p3, v8, 0x3

    invoke-virtual {p0, p3, p2, v1, p1}, Lcom/google/zxing/common/BitArray;->toBytes(I[BII)V

    .line 436
    aget p3, v7, v1

    invoke-static {p2, p3}, Lcom/google/zxing/qrcode/encoder/Encoder;->generateECBytes([BI)[B

    move-result-object p3

    .line 437
    new-instance v7, Lcom/google/zxing/qrcode/encoder/BlockPair;

    invoke-direct {v7, p2, p3}, Lcom/google/zxing/qrcode/encoder/BlockPair;-><init>([B[B)V

    invoke-interface {v0, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 439
    invoke-static {v9, p1}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 440
    array-length p1, p3

    invoke-static {v10, p1}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 441
    aget p1, v6, v1

    add-int/2addr v8, p1

    .line 426
    add-int/lit8 v5, v5, 0x1

    move p1, v2

    move p2, v3

    move p3, v4

    goto :goto_0

    .line 443
    :cond_0
    move v2, p1

    move v3, p2

    if-ne v3, v8, :cond_8

    .line 447
    new-instance p0, Lcom/google/zxing/common/BitArray;

    invoke-direct {p0}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 450
    move p1, v1

    :goto_1
    const/16 p2, 0x8

    if-ge p1, v9, :cond_3

    .line 451
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/qrcode/encoder/BlockPair;

    .line 452
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/encoder/BlockPair;->getDataBytes()[B

    move-result-object v3

    .line 453
    array-length v4, v3

    if-ge p1, v4, :cond_1

    .line 454
    aget-byte v3, v3, p1

    invoke-virtual {p0, v3, p2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 456
    :cond_1
    goto :goto_2

    .line 450
    :cond_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 459
    :cond_3
    nop

    :goto_3
    if-ge v1, v10, :cond_6

    .line 460
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/zxing/qrcode/encoder/BlockPair;

    .line 461
    invoke-virtual {p3}, Lcom/google/zxing/qrcode/encoder/BlockPair;->getErrorCorrectionBytes()[B

    move-result-object p3

    .line 462
    array-length v3, p3

    if-ge v1, v3, :cond_4

    .line 463
    aget-byte p3, p3, v1

    invoke-virtual {p0, p3, p2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 465
    :cond_4
    goto :goto_4

    .line 459
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 467
    :cond_6
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result p1

    if-ne v2, p1, :cond_7

    .line 472
    return-object p0

    .line 468
    :cond_7
    new-instance p1, Lcom/google/zxing/WriterException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Interleaving error: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " and "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 469
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " differ."

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 444
    :cond_8
    new-instance p0, Lcom/google/zxing/WriterException;

    const-string p1, "Data bytes does not match offset"

    invoke-direct {p0, p1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 414
    :cond_9
    new-instance p0, Lcom/google/zxing/WriterException;

    const-string p1, "Number of bits and data bytes does not match"

    invoke-direct {p0, p1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static isOnlyDoubleByteKanji(Ljava/lang/String;)Z
    .locals 5

    .line 253
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "Shift_JIS"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    nop

    .line 257
    array-length v1, p0

    .line 258
    rem-int/lit8 v2, v1, 0x2

    if-eqz v2, :cond_0

    .line 259
    return v0

    .line 261
    :cond_0
    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_4

    .line 262
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    .line 263
    const/16 v4, 0x81

    if-lt v3, v4, :cond_1

    const/16 v4, 0x9f

    if-le v3, v4, :cond_2

    :cond_1
    const/16 v4, 0xe0

    if-lt v3, v4, :cond_3

    const/16 v4, 0xeb

    if-gt v3, v4, :cond_3

    .line 261
    :cond_2
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 264
    :cond_3
    return v0

    .line 267
    :cond_4
    const/4 p0, 0x1

    return p0

    .line 254
    :catch_0
    move-exception p0

    .line 255
    return v0
.end method

.method private static recommendVersion(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/qrcode/decoder/Version;
    .locals 2
    .param p0, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p1, "mode"    # Lcom/google/zxing/qrcode/decoder/Mode;
    .param p2, "headerBits"    # Lcom/google/zxing/common/BitArray;
    .param p3, "dataBits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 190
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0

    invoke-static {p1, p2, p3, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->calculateBitsNeeded(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v0

    .line 191
    invoke-static {v0, p0}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0

    .line 194
    .local v0, "provisionalVersion":Lcom/google/zxing/qrcode/decoder/Version;
    invoke-static {p1, p2, p3, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->calculateBitsNeeded(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v1

    .line 195
    invoke-static {v1, p0}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v1

    return-object v1
.end method

.method static terminateBits(ILcom/google/zxing/common/BitArray;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 320
    shl-int/lit8 v0, p0, 0x3

    .line 321
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    if-gt v1, v0, :cond_5

    .line 325
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    if-ge v3, v0, :cond_0

    .line 326
    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    .line 325
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 330
    :cond_0
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    and-int/lit8 v2, v2, 0x7

    .line 331
    const/16 v3, 0x8

    if-lez v2, :cond_1

    .line 332
    nop

    :goto_1
    if-ge v2, v3, :cond_1

    .line 333
    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    .line 332
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 337
    :cond_1
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v2

    sub-int/2addr p0, v2

    .line 338
    nop

    :goto_2
    if-ge v1, p0, :cond_3

    .line 339
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_2

    const/16 v2, 0xec

    goto :goto_3

    :cond_2
    const/16 v2, 0x11

    :goto_3
    invoke-virtual {p1, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 338
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 341
    :cond_3
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result p0

    if-ne p0, v0, :cond_4

    .line 344
    return-void

    .line 342
    :cond_4
    new-instance p0, Lcom/google/zxing/WriterException;

    const-string p1, "Bits size does not equal capacity"

    invoke-direct {p0, p1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 322
    :cond_5
    new-instance p0, Lcom/google/zxing/WriterException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "data bits cannot fit in the QR Code"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " > "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static willFit(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Z
    .locals 5
    .param p0, "numInputBits"    # I
    .param p1, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p2, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    .line 306
    invoke-virtual {p1}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v0

    .line 308
    .local v0, "numBytes":I
    invoke-virtual {p1, p2}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object v1

    .line 309
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getTotalECCodewords()I

    move-result v1

    .line 311
    .local v1, "numEcBytes":I
    sub-int v2, v0, v1

    .line 312
    .local v2, "numDataBytes":I
    add-int/lit8 v3, p0, 0x7

    div-int/lit8 v3, v3, 0x8

    .line 313
    .local v3, "totalInputBytes":I
    if-lt v2, v3, :cond_0

    const/4 v4, 0x1

    return v4

    :cond_0
    const/4 v4, 0x0

    return v4
.end method
