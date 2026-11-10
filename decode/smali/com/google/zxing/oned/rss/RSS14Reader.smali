.class public final Lcom/google/zxing/oned/rss/RSS14Reader;
.super Lcom/google/zxing/oned/rss/AbstractRSSReader;
.source "RSS14Reader.java"


# static fields
.field private static final FINDER_PATTERNS:[[I

.field private static final INSIDE_GSUM:[I

.field private static final INSIDE_ODD_TOTAL_SUBSET:[I

.field private static final INSIDE_ODD_WIDEST:[I

.field private static final OUTSIDE_EVEN_TOTAL_SUBSET:[I

.field private static final OUTSIDE_GSUM:[I

.field private static final OUTSIDE_ODD_WIDEST:[I


# instance fields
.field private final possibleLeftPairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;"
        }
    .end annotation
.end field

.field private final possibleRightPairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 39
    const/16 v0, 0x46

    const/16 v1, 0x7e

    const/4 v2, 0x1

    const/16 v3, 0xa

    const/16 v4, 0x22

    filled-new-array {v2, v3, v4, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_EVEN_TOTAL_SUBSET:[I

    .line 40
    const/16 v0, 0x30

    const/16 v1, 0x51

    const/4 v3, 0x4

    const/16 v4, 0x14

    filled-new-array {v3, v4, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_TOTAL_SUBSET:[I

    .line 41
    const/16 v0, 0x7df

    const/16 v1, 0xa9b

    const/4 v4, 0x0

    const/16 v5, 0xa1

    const/16 v6, 0x3c1

    filled-new-array {v4, v5, v6, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_GSUM:[I

    .line 42
    const/16 v0, 0x40c

    const/16 v1, 0x5ec

    const/16 v5, 0x150

    filled-new-array {v4, v5, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_GSUM:[I

    .line 43
    const/16 v0, 0x8

    const/4 v1, 0x6

    const/4 v5, 0x3

    filled-new-array {v0, v1, v3, v5, v2}, [I

    move-result-object v6

    sput-object v6, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_ODD_WIDEST:[I

    .line 44
    const/4 v6, 0x2

    filled-new-array {v6, v3, v1, v0}, [I

    move-result-object v7

    sput-object v7, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_WIDEST:[I

    .line 46
    const/16 v7, 0x9

    new-array v8, v7, [[I

    filled-new-array {v5, v0, v6, v2}, [I

    move-result-object v9

    aput-object v9, v8, v4

    const/4 v4, 0x5

    filled-new-array {v5, v4, v4, v2}, [I

    move-result-object v9

    aput-object v9, v8, v2

    const/4 v9, 0x7

    filled-new-array {v5, v5, v9, v2}, [I

    move-result-object v10

    aput-object v10, v8, v6

    filled-new-array {v5, v2, v7, v2}, [I

    move-result-object v10

    aput-object v10, v8, v5

    filled-new-array {v6, v9, v3, v2}, [I

    move-result-object v10

    aput-object v10, v8, v3

    filled-new-array {v6, v4, v1, v2}, [I

    move-result-object v3

    aput-object v3, v8, v4

    filled-new-array {v6, v5, v0, v2}, [I

    move-result-object v3

    aput-object v3, v8, v1

    filled-new-array {v2, v4, v9, v2}, [I

    move-result-object v1

    aput-object v1, v8, v9

    filled-new-array {v2, v5, v7, v2}, [I

    move-result-object v1

    aput-object v1, v8, v0

    sput-object v8, Lcom/google/zxing/oned/rss/RSS14Reader;->FINDER_PATTERNS:[[I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/AbstractRSSReader;-><init>()V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    .line 64
    return-void
.end method

.method private static addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V
    .locals 5
    .param p1, "pair"    # Lcom/google/zxing/oned/rss/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;",
            "Lcom/google/zxing/oned/rss/Pair;",
            ")V"
        }
    .end annotation

    .line 89
    .local p0, "possiblePairs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/oned/rss/Pair;>;"
    if-nez p1, :cond_0

    .line 90
    return-void

    .line 92
    :cond_0
    const/4 v0, 0x0

    .line 93
    .local v0, "found":Z
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/oned/rss/Pair;

    .line 94
    .local v2, "other":Lcom/google/zxing/oned/rss/Pair;
    move-object v2, v3

    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 95
    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/Pair;->incrementCount()V

    .line 96
    const/4 v0, 0x1

    .line 97
    goto :goto_1

    .line 99
    .end local v2    # "other":Lcom/google/zxing/oned/rss/Pair;
    :cond_1
    goto :goto_0

    .line 100
    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 101
    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 103
    :cond_3
    return-void
.end method

.method private adjustOddEvenCounts(ZI)V
    .locals 11
    .param p1, "outsideChar"    # Z
    .param p2, "numModules"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 353
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->sum([I)I

    move-result v0

    .line 354
    .local v0, "oddSum":I
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/common/detector/MathUtils;->sum([I)I

    move-result v1

    .line 356
    .local v1, "evenSum":I
    const/4 v2, 0x0

    .line 357
    .local v2, "incrementOdd":Z
    const/4 v3, 0x0

    .line 358
    .local v3, "decrementOdd":Z
    const/4 v4, 0x0

    .line 359
    .local v4, "incrementEven":Z
    const/4 v5, 0x0

    .line 361
    .local v5, "decrementEven":Z
    const/4 v6, 0x4

    if-eqz p1, :cond_3

    .line 362
    const/16 v7, 0xc

    if-le v0, v7, :cond_0

    .line 363
    const/4 v3, 0x1

    goto :goto_0

    .line 364
    :cond_0
    if-ge v0, v6, :cond_1

    .line 365
    const/4 v2, 0x1

    .line 367
    :cond_1
    :goto_0
    if-le v1, v7, :cond_2

    .line 368
    const/4 v5, 0x1

    goto :goto_2

    .line 369
    :cond_2
    if-ge v1, v6, :cond_7

    .line 370
    const/4 v4, 0x1

    goto :goto_2

    .line 373
    :cond_3
    const/16 v7, 0xb

    if-le v0, v7, :cond_4

    .line 374
    const/4 v3, 0x1

    goto :goto_1

    .line 375
    :cond_4
    const/4 v7, 0x5

    if-ge v0, v7, :cond_5

    .line 376
    const/4 v2, 0x1

    .line 378
    :cond_5
    :goto_1
    const/16 v7, 0xa

    if-le v1, v7, :cond_6

    .line 379
    const/4 v5, 0x1

    goto :goto_2

    .line 380
    :cond_6
    if-ge v1, v6, :cond_7

    .line 381
    const/4 v4, 0x1

    .line 385
    :cond_7
    :goto_2
    add-int v6, v0, v1

    sub-int/2addr v6, p2

    .line 386
    .local v6, "mismatch":I
    and-int/lit8 v7, v0, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-ne v7, p1, :cond_8

    move v7, v9

    goto :goto_3

    :cond_8
    move v7, v8

    .line 387
    .local v7, "oddParityBad":Z
    :goto_3
    and-int/lit8 v10, v1, 0x1

    if-ne v10, v9, :cond_9

    move v8, v9

    .line 401
    .local v8, "evenParityBad":Z
    :cond_9
    packed-switch v6, :pswitch_data_0

    .line 449
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 403
    :pswitch_0
    if-eqz v7, :cond_b

    .line 404
    if-nez v8, :cond_a

    .line 407
    const/4 v3, 0x1

    goto :goto_4

    .line 405
    :cond_a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 409
    :cond_b
    if-eqz v8, :cond_c

    .line 412
    const/4 v5, 0x1

    .line 414
    goto :goto_4

    .line 410
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 429
    :pswitch_1
    if-eqz v7, :cond_f

    .line 430
    if-eqz v8, :cond_e

    .line 434
    if-ge v0, v1, :cond_d

    .line 435
    const/4 v2, 0x1

    .line 436
    const/4 v5, 0x1

    goto :goto_4

    .line 438
    :cond_d
    const/4 v3, 0x1

    .line 439
    const/4 v4, 0x1

    goto :goto_4

    .line 431
    :cond_e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 442
    :cond_f
    if-nez v8, :cond_10

    goto :goto_4

    .line 443
    :cond_10
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 416
    :pswitch_2
    if-eqz v7, :cond_12

    .line 417
    if-nez v8, :cond_11

    .line 420
    const/4 v2, 0x1

    goto :goto_4

    .line 418
    :cond_11
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 422
    :cond_12
    if-eqz v8, :cond_19

    .line 425
    const/4 v4, 0x1

    .line 427
    nop

    .line 452
    :goto_4
    if-eqz v2, :cond_14

    .line 453
    if-nez v3, :cond_13

    .line 456
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v9

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->increment([I[F)V

    goto :goto_5

    .line 454
    :cond_13
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 458
    :cond_14
    :goto_5
    if-eqz v3, :cond_15

    .line 459
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v9

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->decrement([I[F)V

    .line 461
    :cond_15
    if-eqz v4, :cond_17

    .line 462
    if-nez v5, :cond_16

    .line 465
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v9

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->increment([I[F)V

    goto :goto_6

    .line 463
    :cond_16
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 467
    :cond_17
    :goto_6
    if-eqz v5, :cond_18

    .line 468
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v9

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenRoundingErrors()[F

    move-result-object v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->decrement([I[F)V

    .line 471
    :cond_18
    return-void

    .line 423
    :cond_19
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static checkChecksum(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Z
    .locals 4
    .param p0, "leftPair"    # Lcom/google/zxing/oned/rss/Pair;
    .param p1, "rightPair"    # Lcom/google/zxing/oned/rss/Pair;

    .line 147
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getChecksumPortion()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getChecksumPortion()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0x4f

    .line 148
    .local v0, "checkValue":I
    nop

    .line 149
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v1

    mul-int/lit8 v1, v1, 0x9

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v2

    add-int/2addr v1, v2

    const/4 v2, 0x0

    .line 150
    .local v2, "targetCheckValue":I
    move v2, v1

    const/16 v3, 0x48

    if-le v1, v3, :cond_0

    .line 151
    add-int/lit8 v2, v2, -0x1

    .line 153
    :cond_0
    const/16 v1, 0x8

    if-le v2, v1, :cond_1

    .line 154
    add-int/lit8 v2, v2, -0x1

    .line 156
    :cond_1
    if-ne v0, v2, :cond_2

    const/4 v1, 0x1

    return v1

    :cond_2
    const/4 v1, 0x0

    return v1
.end method

.method private static constructResult(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Lcom/google/zxing/Result;
    .locals 11
    .param p0, "leftPair"    # Lcom/google/zxing/oned/rss/Pair;
    .param p1, "rightPair"    # Lcom/google/zxing/oned/rss/Pair;

    .line 112
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x453af5

    mul-long/2addr v0, v2

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 113
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 115
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0xe

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 116
    .local v1, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xd

    rsub-int/lit8 v2, v2, 0xd

    .local v2, "i":I
    :goto_0
    const/16 v4, 0x30

    if-lez v2, :cond_0

    .line 117
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 119
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    const/4 v2, 0x0

    .line 122
    .local v2, "checkDigit":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v3, :cond_2

    .line 123
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v6

    sub-int/2addr v6, v4

    .line 124
    .local v6, "digit":I
    and-int/lit8 v7, v5, 0x1

    if-nez v7, :cond_1

    mul-int/lit8 v7, v6, 0x3

    goto :goto_2

    :cond_1
    move v7, v6

    :goto_2
    add-int/2addr v2, v7

    .line 122
    .end local v6    # "digit":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 126
    .end local v5    # "i":I
    :cond_2
    rem-int/lit8 v3, v2, 0xa

    const/16 v4, 0xa

    rsub-int/lit8 v3, v3, 0xa

    .line 127
    move v2, v3

    if-ne v3, v4, :cond_3

    .line 128
    const/4 v2, 0x0

    .line 130
    :cond_3
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v3

    .line 133
    .local v3, "leftPoints":[Lcom/google/zxing/ResultPoint;
    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v4

    .line 134
    .local v4, "rightPoints":[Lcom/google/zxing/ResultPoint;
    new-instance v5, Lcom/google/zxing/Result;

    .line 135
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/google/zxing/ResultPoint;

    const/4 v8, 0x0

    aget-object v9, v3, v8

    aput-object v9, v7, v8

    const/4 v9, 0x1

    aget-object v10, v3, v9

    aput-object v10, v7, v9

    const/4 v10, 0x2

    aget-object v8, v4, v8

    aput-object v8, v7, v10

    aget-object v8, v4, v9

    const/4 v9, 0x3

    aput-object v8, v7, v9

    sget-object v8, Lcom/google/zxing/BarcodeFormat;->RSS_14:Lcom/google/zxing/BarcodeFormat;

    const/4 v9, 0x0

    invoke-direct {v5, v6, v9, v7, v8}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 134
    return-object v5
.end method

.method private decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 190
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDataCharacterCounters()[I

    move-result-object v0

    .line 191
    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 193
    const/4 v2, 0x1

    if-eqz p3, :cond_0

    .line 194
    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object p2

    aget p2, p2, v1

    invoke-static {p1, p2, v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->recordPatternInReverse(Lcom/google/zxing/common/BitArray;I[I)V

    goto :goto_1

    .line 196
    :cond_0
    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object p2

    aget p2, p2, v2

    invoke-static {p1, p2, v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 198
    array-length p1, v0

    sub-int/2addr p1, v2

    move p2, v1

    :goto_0
    if-ge p2, p1, :cond_1

    .line 199
    aget v3, v0, p2

    .line 200
    aget v4, v0, p1

    aput v4, v0, p2

    .line 201
    aput v3, v0, p1

    .line 198
    add-int/lit8 p2, p2, 0x1

    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 205
    :cond_1
    :goto_1
    if-eqz p3, :cond_2

    const/16 p1, 0x10

    goto :goto_2

    :cond_2
    const/16 p1, 0xf

    .line 206
    :goto_2
    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->sum([I)I

    move-result p2

    int-to-float p2, p2

    int-to-float v3, p1

    div-float/2addr p2, v3

    .line 208
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v3

    .line 209
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v4

    .line 210
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v5

    .line 211
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenRoundingErrors()[F

    move-result-object v6

    .line 213
    move v7, v1

    :goto_3
    array-length v8, v0

    if-ge v7, v8, :cond_6

    .line 214
    aget v8, v0, v7

    int-to-float v8, v8

    div-float/2addr v8, p2

    .line 215
    const/high16 v9, 0x3f000000    # 0.5f

    add-float/2addr v9, v8

    float-to-int v9, v9

    .line 216
    if-gtz v9, :cond_3

    .line 217
    move v9, v2

    goto :goto_4

    .line 218
    :cond_3
    const/16 v10, 0x8

    if-le v9, v10, :cond_4

    .line 219
    move v9, v10

    .line 221
    :cond_4
    :goto_4
    div-int/lit8 v10, v7, 0x2

    .line 222
    and-int/lit8 v11, v7, 0x1

    if-nez v11, :cond_5

    .line 223
    aput v9, v3, v10

    .line 224
    int-to-float v9, v9

    sub-float/2addr v8, v9

    aput v8, v5, v10

    goto :goto_5

    .line 226
    :cond_5
    aput v9, v4, v10

    .line 227
    int-to-float v9, v9

    sub-float/2addr v8, v9

    aput v8, v6, v10

    .line 213
    :goto_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 231
    :cond_6
    invoke-direct {p0, p3, p1}, Lcom/google/zxing/oned/rss/RSS14Reader;->adjustOddEvenCounts(ZI)V

    .line 233
    nop

    .line 234
    nop

    .line 235
    array-length p1, v3

    sub-int/2addr p1, v2

    move p2, v1

    move v0, p2

    :goto_6
    if-ltz p1, :cond_7

    .line 236
    mul-int/lit8 p2, p2, 0x9

    .line 237
    aget v5, v3, p1

    add-int/2addr p2, v5

    .line 238
    aget v5, v3, p1

    add-int/2addr v0, v5

    .line 235
    add-int/lit8 p1, p1, -0x1

    goto :goto_6

    .line 240
    :cond_7
    nop

    .line 241
    nop

    .line 242
    array-length p1, v4

    sub-int/2addr p1, v2

    move v5, v1

    move v6, v5

    :goto_7
    if-ltz p1, :cond_8

    .line 243
    mul-int/lit8 v5, v5, 0x9

    .line 244
    aget v7, v4, p1

    add-int/2addr v5, v7

    .line 245
    aget v7, v4, p1

    add-int/2addr v6, v7

    .line 242
    add-int/lit8 p1, p1, -0x1

    goto :goto_7

    .line 247
    :cond_8
    mul-int/lit8 v5, v5, 0x3

    add-int/2addr p2, v5

    .line 249
    const/4 p1, 0x4

    if-eqz p3, :cond_a

    .line 250
    and-int/lit8 p3, v0, 0x1

    if-nez p3, :cond_9

    const/16 p3, 0xc

    if-gt v0, p3, :cond_9

    if-lt v0, p1, :cond_9

    .line 253
    sub-int/2addr p3, v0

    div-int/lit8 p3, p3, 0x2

    .line 254
    sget-object p1, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_ODD_WIDEST:[I

    aget p1, p1, p3

    .line 255
    rsub-int/lit8 v0, p1, 0x9

    .line 256
    invoke-static {v3, p1, v1}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result p1

    .line 257
    invoke-static {v4, v0, v2}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v0

    .line 258
    sget-object v1, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_EVEN_TOTAL_SUBSET:[I

    aget v1, v1, p3

    .line 259
    sget-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_GSUM:[I

    aget p3, v2, p3

    .line 260
    new-instance v2, Lcom/google/zxing/oned/rss/DataCharacter;

    mul-int/2addr p1, v1

    add-int/2addr p1, v0

    add-int/2addr p1, p3

    invoke-direct {v2, p1, p2}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v2

    .line 251
    :cond_9
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object p1

    throw p1

    .line 262
    :cond_a
    and-int/lit8 p3, v6, 0x1

    if-nez p3, :cond_b

    const/16 p3, 0xa

    if-gt v6, p3, :cond_b

    if-lt v6, p1, :cond_b

    .line 265
    sub-int/2addr p3, v6

    div-int/lit8 p3, p3, 0x2

    .line 266
    sget-object p1, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_WIDEST:[I

    aget p1, p1, p3

    .line 267
    rsub-int/lit8 v0, p1, 0x9

    .line 268
    invoke-static {v3, p1, v2}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result p1

    .line 269
    invoke-static {v4, v0, v1}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v0

    .line 270
    sget-object v1, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_TOTAL_SUBSET:[I

    aget v1, v1, p3

    .line 271
    sget-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_GSUM:[I

    aget p3, v2, p3

    .line 272
    new-instance v2, Lcom/google/zxing/oned/rss/DataCharacter;

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    add-int/2addr v0, p3

    invoke-direct {v2, v0, p2}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v2

    .line 263
    :cond_b
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object p1

    throw p1
.end method

.method private decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "ZI",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/oned/rss/Pair;"
        }
    .end annotation

    .line 161
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/oned/rss/RSS14Reader;->findFinderPattern(Lcom/google/zxing/common/BitArray;Z)[I

    move-result-object v1

    .line 162
    invoke-direct {p0, p1, p3, p2, v1}, Lcom/google/zxing/oned/rss/RSS14Reader;->parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ[I)Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v1

    .line 164
    if-nez p4, :cond_0

    move-object p4, v0

    goto :goto_0

    :cond_0
    sget-object v2, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    .line 165
    invoke-interface {p4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/google/zxing/ResultPointCallback;

    .line 167
    :goto_0
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p4, :cond_2

    .line 168
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v4

    .line 169
    aget v5, v4, v2

    aget v4, v4, v3

    add-int/2addr v5, v4

    sub-int/2addr v5, v3

    int-to-float v4, v5

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    .line 170
    if-eqz p2, :cond_1

    .line 172
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result p2

    sub-int/2addr p2, v3

    int-to-float p2, p2

    sub-float v4, p2, v4

    .line 174
    :cond_1
    new-instance p2, Lcom/google/zxing/ResultPoint;

    int-to-float p3, p3

    invoke-direct {p2, v4, p3}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    invoke-interface {p4, p2}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 177
    :cond_2
    invoke-direct {p0, p1, v1, v3}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object p2

    .line 178
    invoke-direct {p0, p1, v1, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object p1

    .line 179
    new-instance p3, Lcom/google/zxing/oned/rss/Pair;

    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result p4

    mul-int/lit16 p4, p4, 0x63d

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v2

    add-int/2addr p4, v2

    .line 180
    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result p2

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result p1

    mul-int/lit8 p1, p1, 0x4

    add-int/2addr p2, p1

    invoke-direct {p3, p4, p2, v1}, Lcom/google/zxing/oned/rss/Pair;-><init>(IILcom/google/zxing/oned/rss/FinderPattern;)V
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    return-object p3

    .line 182
    :catch_0
    move-exception p1

    .line 183
    return-object v0
.end method

.method private findFinderPattern(Lcom/google/zxing/common/BitArray;Z)[I
    .locals 13
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "rightFinderPattern"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 280
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDecodeFinderCounters()[I

    move-result-object v0

    const/4 v1, 0x0

    .line 281
    .local v1, "counters":[I
    move-object v1, v0

    const/4 v2, 0x0

    aput v2, v0, v2

    .line 282
    const/4 v0, 0x1

    aput v2, v1, v0

    .line 283
    const/4 v3, 0x2

    aput v2, v1, v3

    .line 284
    const/4 v4, 0x3

    aput v2, v1, v4

    .line 286
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v5

    .line 287
    .local v5, "width":I
    const/4 v6, 0x0

    .line 288
    .local v6, "isWhite":Z
    const/4 v7, 0x0

    .line 289
    .local v7, "rowOffset":I
    :goto_0
    if-ge v7, v5, :cond_0

    .line 290
    invoke-virtual {p1, v7}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v8

    xor-int/2addr v8, v0

    move v6, v8

    .line 291
    if-eq p2, v6, :cond_0

    .line 295
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 298
    :cond_0
    const/4 v8, 0x0

    .line 299
    .local v8, "counterPosition":I
    move v9, v7

    .line 300
    .local v9, "patternStart":I
    move v10, v7

    .local v10, "x":I
    :goto_1
    if-ge v10, v5, :cond_5

    .line 301
    invoke-virtual {p1, v10}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v11

    if-eq v11, v6, :cond_1

    .line 302
    aget v11, v1, v8

    add-int/2addr v11, v0

    aput v11, v1, v8

    goto :goto_4

    .line 304
    :cond_1
    if-ne v8, v4, :cond_3

    .line 305
    invoke-static {v1}, Lcom/google/zxing/oned/rss/RSS14Reader;->isFinderPattern([I)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 306
    filled-new-array {v9, v10}, [I

    move-result-object v0

    return-object v0

    .line 308
    :cond_2
    aget v11, v1, v2

    aget v12, v1, v0

    add-int/2addr v11, v12

    add-int/2addr v9, v11

    .line 309
    aget v11, v1, v3

    aput v11, v1, v2

    .line 310
    aget v11, v1, v4

    aput v11, v1, v0

    .line 311
    aput v2, v1, v3

    .line 312
    aput v2, v1, v4

    .line 313
    add-int/lit8 v8, v8, -0x1

    goto :goto_2

    .line 315
    :cond_3
    add-int/lit8 v8, v8, 0x1

    .line 317
    :goto_2
    aput v0, v1, v8

    .line 318
    if-nez v6, :cond_4

    move v11, v0

    goto :goto_3

    :cond_4
    move v11, v2

    :goto_3
    move v6, v11

    .line 300
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 321
    .end local v10    # "x":I
    :cond_5
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ[I)Lcom/google/zxing/oned/rss/FinderPattern;
    .locals 13
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "rowNumber"    # I
    .param p3, "right"    # Z
    .param p4, "startEnd"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 328
    const/4 v0, 0x0

    aget v1, p4, v0

    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v1

    .line 329
    .local v1, "firstIsBlack":Z
    aget v2, p4, v0

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    .line 331
    .local v2, "firstElementStart":I
    :goto_0
    if-ltz v2, :cond_0

    invoke-virtual {p1, v2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v4

    if-eq v1, v4, :cond_0

    .line 332
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 334
    :cond_0
    add-int/2addr v2, v3

    .line 335
    aget v4, p4, v0

    sub-int/2addr v4, v2

    .line 337
    .local v4, "firstCounter":I
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDecodeFinderCounters()[I

    move-result-object v5

    const/4 v6, 0x0

    .line 338
    .local v6, "counters":[I
    move-object v6, v5

    array-length v7, v6

    sub-int/2addr v7, v3

    invoke-static {v5, v0, v6, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 339
    aput v4, v6, v0

    .line 340
    sget-object v0, Lcom/google/zxing/oned/rss/RSS14Reader;->FINDER_PATTERNS:[[I

    invoke-static {v6, v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->parseFinderValue([I[[I)I

    move-result v8

    .line 341
    .local v8, "value":I
    move v0, v2

    .line 342
    .local v0, "start":I
    aget v5, p4, v3

    .line 343
    .local v5, "end":I
    if-eqz p3, :cond_1

    .line 345
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    sub-int/2addr v7, v3

    sub-int v0, v7, v0

    .line 346
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    sub-int/2addr v7, v3

    sub-int v5, v7, v5

    move v10, v0

    move v11, v5

    goto :goto_1

    .line 343
    :cond_1
    move v10, v0

    move v11, v5

    .line 348
    .end local v0    # "start":I
    .end local v5    # "end":I
    .local v10, "start":I
    .local v11, "end":I
    :goto_1
    new-instance v7, Lcom/google/zxing/oned/rss/FinderPattern;

    aget v0, p4, v3

    filled-new-array {v2, v0}, [I

    move-result-object v9

    move v12, p2

    invoke-direct/range {v7 .. v12}, Lcom/google/zxing/oned/rss/FinderPattern;-><init>(I[IIII)V

    return-object v7
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 8
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 70
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p1, p3}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;

    move-result-object v0

    .line 71
    .local v0, "leftPair":Lcom/google/zxing/oned/rss/Pair;
    iget-object v1, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-static {v1, v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V

    .line 72
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 73
    const/4 v1, 0x1

    invoke-direct {p0, p2, v1, p1, p3}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;

    move-result-object v2

    .line 74
    .local v2, "rightPair":Lcom/google/zxing/oned/rss/Pair;
    iget-object v3, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-static {v3, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V

    .line 75
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 76
    iget-object v3, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    move-object v5, v4

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/oned/rss/Pair;

    .line 77
    .local v4, "left":Lcom/google/zxing/oned/rss/Pair;
    move-object v4, v6

    invoke-virtual {v6}, Lcom/google/zxing/oned/rss/Pair;->getCount()I

    move-result v6

    if-le v6, v1, :cond_1

    .line 78
    iget-object v6, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/Pair;

    .line 79
    .local v5, "right":Lcom/google/zxing/oned/rss/Pair;
    move-object v5, v7

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/Pair;->getCount()I

    move-result v7

    if-le v7, v1, :cond_0

    invoke-static {v4, v5}, Lcom/google/zxing/oned/rss/RSS14Reader;->checkChecksum(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 80
    invoke-static {v4, v5}, Lcom/google/zxing/oned/rss/RSS14Reader;->constructResult(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Lcom/google/zxing/Result;

    move-result-object v1

    return-object v1

    .line 82
    .end local v5    # "right":Lcom/google/zxing/oned/rss/Pair;
    :cond_0
    goto :goto_1

    .line 84
    .end local v4    # "left":Lcom/google/zxing/oned/rss/Pair;
    :cond_1
    goto :goto_0

    .line 85
    :cond_2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method public reset()V
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 108
    iget-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 109
    return-void
.end method
