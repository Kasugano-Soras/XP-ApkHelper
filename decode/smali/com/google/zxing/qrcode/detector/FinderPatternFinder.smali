.class public Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.super Ljava/lang/Object;
.source "FinderPatternFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/qrcode/detector/FinderPatternFinder$EstimatedModuleComparator;
    }
.end annotation


# static fields
.field private static final CENTER_QUORUM:I = 0x2

.field protected static final MAX_MODULES:I = 0x61

.field protected static final MIN_SKIP:I = 0x3

.field private static final moduleComparator:Lcom/google/zxing/qrcode/detector/FinderPatternFinder$EstimatedModuleComparator;


# instance fields
.field private final crossCheckStateCount:[I

.field private hasSkipped:Z

.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final possibleCenters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/qrcode/detector/FinderPattern;",
            ">;"
        }
    .end annotation
.end field

.field private final resultPointCallback:Lcom/google/zxing/ResultPointCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 43
    new-instance v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$EstimatedModuleComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$EstimatedModuleComparator;-><init>(Lcom/google/zxing/qrcode/detector/FinderPatternFinder$1;)V

    sput-object v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->moduleComparator:Lcom/google/zxing/qrcode/detector/FinderPatternFinder$EstimatedModuleComparator;

    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "resultPointCallback"    # Lcom/google/zxing/ResultPointCallback;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    .line 65
    const/4 v0, 0x5

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    .line 66
    iput-object p2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    .line 67
    return-void
.end method

.method private static centerFromEnd([II)F
    .locals 3
    .param p0, "stateCount"    # [I
    .param p1, "end"    # I

    .line 175
    const/4 v0, 0x4

    aget v0, p0, v0

    sub-int v0, p1, v0

    const/4 v1, 0x3

    aget v1, p0, v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/4 v1, 0x2

    aget v1, p0, v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method private crossCheckDiagonal(II)Z
    .locals 10
    .param p1, "centerI"    # I
    .param p2, "centerJ"    # I

    .line 271
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v0

    .line 274
    .local v0, "stateCount":[I
    const/4 v1, 0x0

    .line 275
    .local v1, "i":I
    :goto_0
    const/4 v2, 0x2

    const/4 v3, 0x1

    if-lt p1, v1, :cond_0

    if-lt p2, v1, :cond_0

    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v5, p2, v1

    sub-int v6, p1, v1

    invoke-virtual {v4, v5, v6}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 276
    aget v4, v0, v2

    add-int/2addr v4, v3

    aput v4, v0, v2

    .line 277
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 279
    :cond_0
    aget v4, v0, v2

    const/4 v5, 0x0

    if-nez v4, :cond_1

    .line 280
    return v5

    .line 284
    :cond_1
    :goto_1
    if-lt p1, v1, :cond_2

    if-lt p2, v1, :cond_2

    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v6, p2, v1

    sub-int v7, p1, v1

    invoke-virtual {v4, v6, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-nez v4, :cond_2

    .line 285
    aget v4, v0, v3

    add-int/2addr v4, v3

    aput v4, v0, v3

    .line 286
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 288
    :cond_2
    aget v4, v0, v3

    if-nez v4, :cond_3

    .line 289
    return v5

    .line 293
    :cond_3
    :goto_2
    if-lt p1, v1, :cond_4

    if-lt p2, v1, :cond_4

    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v6, p2, v1

    sub-int v7, p1, v1

    invoke-virtual {v4, v6, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 294
    aget v4, v0, v5

    add-int/2addr v4, v3

    aput v4, v0, v5

    .line 295
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 297
    :cond_4
    aget v4, v0, v5

    if-nez v4, :cond_5

    .line 298
    return v5

    .line 301
    :cond_5
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    .line 302
    .local v4, "maxI":I
    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v6

    .line 305
    .local v6, "maxJ":I
    const/4 v1, 0x1

    .line 306
    :goto_3
    add-int v7, p1, v1

    if-ge v7, v4, :cond_6

    add-int v7, p2, v1

    if-ge v7, v6, :cond_6

    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v8, p2, v1

    add-int v9, p1, v1

    invoke-virtual {v7, v8, v9}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 307
    aget v7, v0, v2

    add-int/2addr v7, v3

    aput v7, v0, v2

    .line 308
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 311
    :cond_6
    :goto_4
    add-int v2, p1, v1

    const/4 v7, 0x3

    if-ge v2, v4, :cond_7

    add-int v2, p2, v1

    if-ge v2, v6, :cond_7

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v8, p2, v1

    add-int v9, p1, v1

    invoke-virtual {v2, v8, v9}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-nez v2, :cond_7

    .line 312
    aget v2, v0, v7

    add-int/2addr v2, v3

    aput v2, v0, v7

    .line 313
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 315
    :cond_7
    aget v2, v0, v7

    if-nez v2, :cond_8

    .line 316
    return v5

    .line 319
    :cond_8
    :goto_5
    add-int v2, p1, v1

    const/4 v7, 0x4

    if-ge v2, v4, :cond_9

    add-int v2, p2, v1

    if-ge v2, v6, :cond_9

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v8, p2, v1

    add-int v9, p1, v1

    invoke-virtual {v2, v8, v9}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 320
    aget v2, v0, v7

    add-int/2addr v2, v3

    aput v2, v0, v7

    .line 321
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 323
    :cond_9
    aget v2, v0, v7

    if-nez v2, :cond_a

    .line 324
    return v5

    .line 327
    :cond_a
    invoke-static {v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternDiagonal([I)Z

    move-result v2

    return v2
.end method

.method private crossCheckHorizontal(IIII)F
    .locals 11
    .param p1, "startJ"    # I
    .param p2, "centerI"    # I
    .param p3, "maxCount"    # I
    .param p4, "originalStateCountTotal"    # I

    .line 415
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    const/4 v1, 0x0

    .line 417
    .local v1, "image":Lcom/google/zxing/common/BitMatrix;
    move-object v1, v0

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    .line 418
    .local v0, "maxJ":I
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v2

    .line 420
    .local v2, "stateCount":[I
    move v3, p1

    .line 421
    .local v3, "j":I
    :goto_0
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ltz v3, :cond_0

    invoke-virtual {v1, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 422
    aget v6, v2, v4

    add-int/2addr v6, v5

    aput v6, v2, v4

    .line 423
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 425
    :cond_0
    const/high16 v6, 0x7fc00000    # Float.NaN

    if-gez v3, :cond_1

    .line 426
    return v6

    .line 428
    :cond_1
    :goto_1
    if-ltz v3, :cond_2

    invoke-virtual {v1, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-nez v7, :cond_2

    aget v7, v2, v5

    if-gt v7, p3, :cond_2

    .line 429
    aget v7, v2, v5

    add-int/2addr v7, v5

    aput v7, v2, v5

    .line 430
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 432
    :cond_2
    if-ltz v3, :cond_d

    aget v7, v2, v5

    if-gt v7, p3, :cond_d

    .line 435
    :goto_2
    const/4 v7, 0x0

    if-ltz v3, :cond_3

    invoke-virtual {v1, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_3

    aget v8, v2, v7

    if-gt v8, p3, :cond_3

    .line 436
    aget v8, v2, v7

    add-int/2addr v8, v5

    aput v8, v2, v7

    .line 437
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 439
    :cond_3
    aget v8, v2, v7

    if-le v8, p3, :cond_4

    .line 440
    return v6

    .line 443
    :cond_4
    add-int/lit8 v3, p1, 0x1

    .line 444
    :goto_3
    if-ge v3, v0, :cond_5

    invoke-virtual {v1, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 445
    aget v8, v2, v4

    add-int/2addr v8, v5

    aput v8, v2, v4

    .line 446
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 448
    :cond_5
    if-ne v3, v0, :cond_6

    .line 449
    return v6

    .line 451
    :cond_6
    :goto_4
    const/4 v8, 0x3

    if-ge v3, v0, :cond_7

    invoke-virtual {v1, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-nez v9, :cond_7

    aget v9, v2, v8

    if-ge v9, p3, :cond_7

    .line 452
    aget v9, v2, v8

    add-int/2addr v9, v5

    aput v9, v2, v8

    .line 453
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 455
    :cond_7
    if-eq v3, v0, :cond_c

    aget v9, v2, v8

    if-ge v9, p3, :cond_c

    .line 458
    :goto_5
    const/4 v9, 0x4

    if-ge v3, v0, :cond_8

    invoke-virtual {v1, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-eqz v10, :cond_8

    aget v10, v2, v9

    if-ge v10, p3, :cond_8

    .line 459
    aget v10, v2, v9

    add-int/2addr v10, v5

    aput v10, v2, v9

    .line 460
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 462
    :cond_8
    aget v10, v2, v9

    if-lt v10, p3, :cond_9

    .line 463
    return v6

    .line 468
    :cond_9
    aget v7, v2, v7

    aget v5, v2, v5

    add-int/2addr v7, v5

    aget v4, v2, v4

    add-int/2addr v7, v4

    aget v4, v2, v8

    add-int/2addr v7, v4

    aget v4, v2, v9

    add-int/2addr v7, v4

    .line 470
    .local v7, "stateCountTotal":I
    sub-int v4, v7, p4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x5

    if-lt v4, p4, :cond_a

    .line 471
    return v6

    .line 474
    :cond_a
    invoke-static {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-static {v2, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v4

    return v4

    :cond_b
    return v6

    .line 456
    .end local v7    # "stateCountTotal":I
    :cond_c
    return v6

    .line 433
    :cond_d
    return v6
.end method

.method private crossCheckVertical(IIII)F
    .locals 11
    .param p1, "startI"    # I
    .param p2, "centerJ"    # I
    .param p3, "maxCount"    # I
    .param p4, "originalStateCountTotal"    # I

    .line 343
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    const/4 v1, 0x0

    .line 345
    .local v1, "image":Lcom/google/zxing/common/BitMatrix;
    move-object v1, v0

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    .line 346
    .local v0, "maxI":I
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v2

    .line 349
    .local v2, "stateCount":[I
    move v3, p1

    .line 350
    .local v3, "i":I
    :goto_0
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ltz v3, :cond_0

    invoke-virtual {v1, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 351
    aget v6, v2, v4

    add-int/2addr v6, v5

    aput v6, v2, v4

    .line 352
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 354
    :cond_0
    const/high16 v6, 0x7fc00000    # Float.NaN

    if-gez v3, :cond_1

    .line 355
    return v6

    .line 357
    :cond_1
    :goto_1
    if-ltz v3, :cond_2

    invoke-virtual {v1, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-nez v7, :cond_2

    aget v7, v2, v5

    if-gt v7, p3, :cond_2

    .line 358
    aget v7, v2, v5

    add-int/2addr v7, v5

    aput v7, v2, v5

    .line 359
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 362
    :cond_2
    if-ltz v3, :cond_d

    aget v7, v2, v5

    if-gt v7, p3, :cond_d

    .line 365
    :goto_2
    const/4 v7, 0x0

    if-ltz v3, :cond_3

    invoke-virtual {v1, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_3

    aget v8, v2, v7

    if-gt v8, p3, :cond_3

    .line 366
    aget v8, v2, v7

    add-int/2addr v8, v5

    aput v8, v2, v7

    .line 367
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 369
    :cond_3
    aget v8, v2, v7

    if-le v8, p3, :cond_4

    .line 370
    return v6

    .line 374
    :cond_4
    add-int/lit8 v3, p1, 0x1

    .line 375
    :goto_3
    if-ge v3, v0, :cond_5

    invoke-virtual {v1, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 376
    aget v8, v2, v4

    add-int/2addr v8, v5

    aput v8, v2, v4

    .line 377
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 379
    :cond_5
    if-ne v3, v0, :cond_6

    .line 380
    return v6

    .line 382
    :cond_6
    :goto_4
    const/4 v8, 0x3

    if-ge v3, v0, :cond_7

    invoke-virtual {v1, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-nez v9, :cond_7

    aget v9, v2, v8

    if-ge v9, p3, :cond_7

    .line 383
    aget v9, v2, v8

    add-int/2addr v9, v5

    aput v9, v2, v8

    .line 384
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 386
    :cond_7
    if-eq v3, v0, :cond_c

    aget v9, v2, v8

    if-ge v9, p3, :cond_c

    .line 389
    :goto_5
    const/4 v9, 0x4

    if-ge v3, v0, :cond_8

    invoke-virtual {v1, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-eqz v10, :cond_8

    aget v10, v2, v9

    if-ge v10, p3, :cond_8

    .line 390
    aget v10, v2, v9

    add-int/2addr v10, v5

    aput v10, v2, v9

    .line 391
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 393
    :cond_8
    aget v10, v2, v9

    if-lt v10, p3, :cond_9

    .line 394
    return v6

    .line 399
    :cond_9
    aget v7, v2, v7

    aget v5, v2, v5

    add-int/2addr v7, v5

    aget v4, v2, v4

    add-int/2addr v7, v4

    aget v4, v2, v8

    add-int/2addr v7, v4

    aget v4, v2, v9

    add-int/2addr v7, v4

    .line 401
    .local v7, "stateCountTotal":I
    sub-int v4, v7, p4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x5

    mul-int/lit8 v5, p4, 0x2

    if-lt v4, v5, :cond_a

    .line 402
    return v6

    .line 405
    :cond_a
    invoke-static {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-static {v2, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v4

    return v4

    :cond_b
    return v6

    .line 387
    .end local v7    # "stateCountTotal":I
    :cond_c
    return v6

    .line 363
    :cond_d
    return v6
.end method

.method protected static doClearCounts([I)V
    .locals 1
    .param p0, "counts"    # [I

    .line 250
    const/4 v0, 0x0

    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([II)V

    .line 251
    return-void
.end method

.method protected static doShiftCounts2([I)V
    .locals 6
    .param p0, "stateCount"    # [I

    .line 254
    const/4 v0, 0x2

    aget v1, p0, v0

    const/4 v2, 0x0

    aput v1, p0, v2

    .line 255
    const/4 v1, 0x3

    aget v3, p0, v1

    const/4 v4, 0x1

    aput v3, p0, v4

    .line 256
    const/4 v3, 0x4

    aget v5, p0, v3

    aput v5, p0, v0

    .line 257
    aput v4, p0, v1

    .line 258
    aput v2, p0, v3

    .line 259
    return-void
.end method

.method private findRowSkip()I
    .locals 7

    .line 548
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 549
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gt v0, v2, :cond_0

    .line 550
    return v1

    .line 552
    :cond_0
    const/4 v0, 0x0

    .line 553
    .local v0, "firstConfirmedCenter":Lcom/google/zxing/ResultPoint;
    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 554
    .local v4, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    move-object v4, v5

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v5

    const/4 v6, 0x2

    if-lt v5, v6, :cond_2

    .line 555
    if-nez v0, :cond_1

    .line 556
    move-object v0, v4

    goto :goto_0

    .line 563
    :cond_1
    iput-boolean v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    .line 564
    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 565
    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    div-int/2addr v1, v6

    .line 564
    return v1

    .line 568
    .end local v4    # "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_2
    goto :goto_0

    .line 569
    :cond_3
    return v1
.end method

.method protected static foundPatternCross([I)Z
    .locals 7

    .line 184
    nop

    .line 185
    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    const/4 v3, 0x5

    if-ge v1, v3, :cond_1

    .line 186
    aget v3, p0, v1

    .line 187
    if-nez v3, :cond_0

    .line 188
    return v0

    .line 190
    :cond_0
    add-int/2addr v2, v3

    .line 185
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 192
    :cond_1
    const/4 v1, 0x7

    if-ge v2, v1, :cond_2

    .line 193
    return v0

    .line 195
    :cond_2
    int-to-float v1, v2

    const/high16 v2, 0x40e00000    # 7.0f

    div-float/2addr v1, v2

    .line 196
    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v1, v2

    .line 198
    aget v3, p0, v0

    int-to-float v3, v3

    sub-float v3, v1, v3

    .line 199
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpg-float v3, v3, v2

    if-gez v3, :cond_3

    const/4 v3, 0x1

    aget v4, p0, v3

    int-to-float v4, v4

    sub-float v4, v1, v4

    .line 200
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_3

    const/high16 v4, 0x40400000    # 3.0f

    mul-float v5, v1, v4

    const/4 v6, 0x2

    aget v6, p0, v6

    int-to-float v6, v6

    sub-float/2addr v5, v6

    .line 201
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    mul-float/2addr v4, v2

    cmpg-float v4, v5, v4

    if-gez v4, :cond_3

    const/4 v4, 0x3

    aget v4, p0, v4

    int-to-float v4, v4

    sub-float v4, v1, v4

    .line 202
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_3

    const/4 v4, 0x4

    aget p0, p0, v4

    int-to-float p0, p0

    sub-float/2addr v1, p0

    .line 203
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result p0

    cmpg-float p0, p0, v2

    if-gez p0, :cond_3

    return v3

    :cond_3
    nop

    .line 198
    return v0
.end method

.method protected static foundPatternDiagonal([I)Z
    .locals 7

    .line 212
    nop

    .line 213
    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    const/4 v3, 0x5

    if-ge v1, v3, :cond_1

    .line 214
    aget v3, p0, v1

    .line 215
    if-nez v3, :cond_0

    .line 216
    return v0

    .line 218
    :cond_0
    add-int/2addr v2, v3

    .line 213
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 220
    :cond_1
    const/4 v1, 0x7

    if-ge v2, v1, :cond_2

    .line 221
    return v0

    .line 223
    :cond_2
    int-to-float v1, v2

    const/high16 v2, 0x40e00000    # 7.0f

    div-float/2addr v1, v2

    .line 224
    const v2, 0x3faa9fbe    # 1.333f

    div-float v2, v1, v2

    .line 226
    aget v3, p0, v0

    int-to-float v3, v3

    sub-float v3, v1, v3

    .line 227
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpg-float v3, v3, v2

    if-gez v3, :cond_3

    const/4 v3, 0x1

    aget v4, p0, v3

    int-to-float v4, v4

    sub-float v4, v1, v4

    .line 228
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_3

    const/high16 v4, 0x40400000    # 3.0f

    mul-float v5, v1, v4

    const/4 v6, 0x2

    aget v6, p0, v6

    int-to-float v6, v6

    sub-float/2addr v5, v6

    .line 229
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    mul-float/2addr v4, v2

    cmpg-float v4, v5, v4

    if-gez v4, :cond_3

    const/4 v4, 0x3

    aget v4, p0, v4

    int-to-float v4, v4

    sub-float v4, v1, v4

    .line 230
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_3

    const/4 v4, 0x4

    aget p0, p0, v4

    int-to-float p0, p0

    sub-float/2addr v1, p0

    .line 231
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result p0

    cmpg-float p0, p0, v2

    if-gez p0, :cond_3

    return v3

    :cond_3
    nop

    .line 226
    return v0
.end method

.method private getCrossCheckStateCount()[I
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    invoke-static {v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->doClearCounts([I)V

    .line 236
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    return-object v0
.end method

.method private haveMultiplyConfirmedCenters()Z
    .locals 9

    .line 578
    nop

    .line 579
    nop

    .line 580
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 581
    iget-object v1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v2

    move v5, v3

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 582
    invoke-virtual {v6}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v7

    const/4 v8, 0x2

    if-lt v7, v8, :cond_0

    .line 583
    add-int/lit8 v4, v4, 0x1

    .line 584
    invoke-virtual {v6}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v6

    add-float/2addr v5, v6

    .line 586
    :cond_0
    goto :goto_0

    .line 587
    :cond_1
    const/4 v1, 0x3

    if-ge v4, v1, :cond_2

    .line 588
    return v2

    .line 594
    :cond_2
    int-to-float v0, v0

    div-float v0, v5, v0

    .line 595
    nop

    .line 596
    iget-object v1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 597
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v4

    sub-float/2addr v4, v0

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    add-float/2addr v3, v4

    .line 598
    goto :goto_1

    .line 599
    :cond_3
    const v0, 0x3d4ccccd    # 0.05f

    mul-float/2addr v5, v0

    cmpg-float v0, v3, v5

    if-gtz v0, :cond_4

    const/4 v0, 0x1

    return v0

    :cond_4
    return v2
.end method

.method private selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 618
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 619
    const/4 v2, 0x3

    if-lt v1, v2, :cond_a

    .line 624
    iget-object v1, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    sget-object v3, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->moduleComparator:Lcom/google/zxing/qrcode/detector/FinderPatternFinder$EstimatedModuleComparator;

    invoke-interface {v1, v3}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 626
    nop

    .line 627
    new-array v1, v2, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 629
    const/4 v5, 0x0

    const-wide v6, 0x7fefffffffffffffL    # Double.MAX_VALUE

    :goto_0
    iget-object v8, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x2

    sub-int/2addr v8, v9

    if-ge v5, v8, :cond_8

    .line 630
    iget-object v8, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 631
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v10

    .line 633
    add-int/lit8 v5, v5, 0x1

    move v11, v5

    :goto_1
    iget-object v12, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    const/4 v13, 0x1

    sub-int/2addr v12, v13

    if-ge v11, v12, :cond_7

    .line 634
    iget-object v12, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v12, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 635
    invoke-static {v8, v12}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->squaredDistance(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)D

    move-result-wide v14

    .line 637
    add-int/lit8 v11, v11, 0x1

    move v2, v11

    const/16 v16, 0x0

    :goto_2
    const-wide v17, 0x7fefffffffffffffL    # Double.MAX_VALUE

    iget-object v3, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_6

    .line 638
    iget-object v3, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 639
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v4

    .line 640
    const v19, 0x3fb33333    # 1.4f

    mul-float v19, v19, v10

    cmpl-float v4, v4, v19

    if-gtz v4, :cond_5

    .line 645
    nop

    .line 646
    invoke-static {v12, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->squaredDistance(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)D

    move-result-wide v19

    .line 647
    invoke-static {v8, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->squaredDistance(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)D

    move-result-wide v21

    .line 650
    cmpg-double v4, v14, v19

    if-gez v4, :cond_2

    .line 651
    cmpl-double v4, v19, v21

    if-lez v4, :cond_1

    .line 652
    cmpg-double v4, v14, v21

    if-gez v4, :cond_0

    .line 653
    nop

    .line 654
    nop

    .line 655
    nop

    .line 656
    move-wide/from16 v23, v14

    goto :goto_3

    .line 657
    :cond_0
    nop

    .line 658
    nop

    .line 659
    nop

    .line 660
    nop

    .line 661
    move-wide/from16 v23, v21

    move-wide/from16 v21, v14

    goto :goto_3

    .line 651
    :cond_1
    move-wide/from16 v23, v21

    move-wide/from16 v21, v19

    move-wide/from16 v19, v23

    move-wide/from16 v23, v14

    goto :goto_3

    .line 664
    :cond_2
    cmpg-double v4, v19, v21

    if-gez v4, :cond_4

    .line 665
    cmpg-double v4, v14, v21

    if-gez v4, :cond_3

    .line 666
    nop

    .line 667
    nop

    .line 668
    nop

    .line 669
    move-wide/from16 v23, v19

    move-wide/from16 v19, v21

    move-wide/from16 v21, v14

    goto :goto_3

    .line 670
    :cond_3
    nop

    .line 671
    nop

    .line 672
    nop

    .line 673
    nop

    .line 674
    move-wide/from16 v23, v19

    move-wide/from16 v19, v14

    goto :goto_3

    .line 676
    :cond_4
    nop

    .line 677
    nop

    .line 678
    move-wide/from16 v23, v21

    move-wide/from16 v21, v19

    move-wide/from16 v19, v14

    .line 687
    :goto_3
    const-wide/high16 v25, 0x4000000000000000L    # 2.0

    mul-double v21, v21, v25

    sub-double v21, v19, v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->abs(D)D

    move-result-wide v21

    mul-double v23, v23, v25

    sub-double v19, v19, v23

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->abs(D)D

    move-result-wide v19

    add-double v21, v21, v19

    .line 688
    cmpg-double v4, v21, v6

    if-gez v4, :cond_5

    .line 689
    nop

    .line 690
    aput-object v8, v1, v16

    .line 691
    aput-object v12, v1, v13

    .line 692
    aput-object v3, v1, v9

    move-wide/from16 v6, v21

    .line 637
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_2

    .line 633
    :cond_6
    goto/16 :goto_1

    .line 629
    :cond_7
    const/16 v16, 0x0

    const-wide v17, 0x7fefffffffffffffL    # Double.MAX_VALUE

    goto/16 :goto_0

    .line 698
    :cond_8
    const-wide v17, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpl-double v2, v6, v17

    if-eqz v2, :cond_9

    .line 702
    return-object v1

    .line 699
    :cond_9
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 621
    :cond_a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method private static squaredDistance(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)D
    .locals 8
    .param p0, "a"    # Lcom/google/zxing/qrcode/detector/FinderPattern;
    .param p1, "b"    # Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 606
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    float-to-double v0, v0

    .line 607
    .local v0, "x":D
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v2

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v3

    sub-float/2addr v2, v3

    float-to-double v2, v2

    .line 608
    .local v2, "y":D
    mul-double v4, v0, v0

    mul-double v6, v2, v2

    add-double/2addr v4, v6

    return-wide v4
.end method


# virtual methods
.method protected final clearCounts([I)V
    .locals 0
    .param p1, "counts"    # [I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 241
    invoke-static {p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->doClearCounts([I)V

    .line 242
    return-void
.end method

.method final find(Ljava/util/Map;)Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/qrcode/detector/FinderPatternInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 78
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    sget-object v2, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v0

    .line 79
    :goto_0
    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v2

    .line 80
    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v3

    .line 88
    mul-int/lit8 v4, v2, 0x3

    div-int/lit16 v4, v4, 0x184

    .line 89
    const/4 v5, 0x3

    if-lt v4, v5, :cond_1

    if-nez p1, :cond_1

    goto :goto_1

    .line 90
    :cond_1
    move v4, v5

    .line 93
    :goto_1
    nop

    .line 94
    const/4 p1, 0x5

    new-array p1, p1, [I

    .line 95
    add-int/lit8 v6, v4, -0x1

    move v7, v0

    :goto_2
    if-ge v6, v2, :cond_c

    if-nez v7, :cond_c

    .line 97
    invoke-static {p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->doClearCounts([I)V

    .line 98
    nop

    .line 99
    move v8, v0

    move v9, v8

    :goto_3
    if-ge v8, v3, :cond_a

    .line 100
    iget-object v10, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v10, v8, v6}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 102
    and-int/lit8 v10, v9, 0x1

    if-ne v10, v1, :cond_2

    .line 103
    add-int/lit8 v9, v9, 0x1

    .line 105
    :cond_2
    aget v10, p1, v9

    add-int/2addr v10, v1

    aput v10, p1, v9

    goto :goto_5

    .line 107
    :cond_3
    and-int/lit8 v10, v9, 0x1

    if-nez v10, :cond_9

    .line 108
    const/4 v10, 0x4

    if-ne v9, v10, :cond_8

    .line 109
    invoke-static {p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 110
    invoke-virtual {p0, p1, v6, v8}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v9

    .line 111
    if-eqz v9, :cond_6

    .line 114
    nop

    .line 115
    iget-boolean v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    const/4 v9, 0x2

    if-eqz v4, :cond_4

    .line 116
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v7

    goto :goto_4

    .line 118
    :cond_4
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->findRowSkip()I

    move-result v4

    .line 119
    aget v10, p1, v9

    if-le v4, v10, :cond_5

    .line 128
    aget v8, p1, v9

    sub-int/2addr v4, v8

    sub-int/2addr v4, v9

    add-int/2addr v6, v4

    .line 129
    add-int/lit8 v8, v3, -0x1

    .line 131
    :cond_5
    nop

    .line 138
    :goto_4
    nop

    .line 139
    invoke-static {p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->doClearCounts([I)V

    .line 140
    move v4, v9

    move v9, v0

    goto :goto_5

    .line 133
    :cond_6
    invoke-static {p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->doShiftCounts2([I)V

    .line 134
    nop

    .line 135
    move v9, v5

    goto :goto_5

    .line 141
    :cond_7
    invoke-static {p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->doShiftCounts2([I)V

    .line 142
    move v9, v5

    goto :goto_5

    .line 145
    :cond_8
    add-int/lit8 v9, v9, 0x1

    aget v10, p1, v9

    add-int/2addr v10, v1

    aput v10, p1, v9

    goto :goto_5

    .line 148
    :cond_9
    aget v10, p1, v9

    add-int/2addr v10, v1

    aput v10, p1, v9

    .line 99
    :goto_5
    add-int/2addr v8, v1

    goto :goto_3

    .line 152
    :cond_a
    invoke-static {p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 153
    invoke-virtual {p0, p1, v6, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v8

    .line 154
    if-eqz v8, :cond_b

    .line 155
    aget v4, p1, v0

    .line 156
    iget-boolean v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v8, :cond_b

    .line 158
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v7

    .line 95
    :cond_b
    add-int/2addr v6, v4

    goto/16 :goto_2

    .line 164
    :cond_c
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object p1

    .line 165
    invoke-static {p1}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 167
    new-instance v0, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v0, p1}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    return-object v0
.end method

.method protected final getImage()Lcom/google/zxing/common/BitMatrix;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    return-object v0
.end method

.method protected final getPossibleCenters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/zxing/qrcode/detector/FinderPattern;",
            ">;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    return-object v0
.end method

.method protected final handlePossibleCenter([III)Z
    .locals 10
    .param p1, "stateCount"    # [I
    .param p2, "i"    # I
    .param p3, "j"    # I

    .line 509
    const/4 v0, 0x0

    aget v1, p1, v0

    const/4 v2, 0x1

    aget v3, p1, v2

    add-int/2addr v1, v3

    const/4 v3, 0x2

    aget v4, p1, v3

    add-int/2addr v1, v4

    const/4 v4, 0x3

    aget v4, p1, v4

    add-int/2addr v1, v4

    const/4 v4, 0x4

    aget v4, p1, v4

    add-int/2addr v1, v4

    .line 511
    .local v1, "stateCountTotal":I
    invoke-static {p1, p3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v4

    .line 512
    .local v4, "centerJ":F
    float-to-int v5, v4

    aget v6, p1, v3

    invoke-direct {p0, p2, v5, v6, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckVertical(IIII)F

    move-result v5

    const/4 v6, 0x0

    .line 513
    .local v6, "centerI":F
    move v6, v5

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_3

    .line 515
    float-to-int v5, v4

    float-to-int v7, v6

    aget v3, p1, v3

    invoke-direct {p0, v5, v7, v3, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckHorizontal(IIII)F

    move-result v3

    .line 516
    move v4, v3

    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_3

    float-to-int v3, v6

    float-to-int v5, v4

    invoke-direct {p0, v3, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckDiagonal(II)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 517
    int-to-float v0, v1

    const/high16 v3, 0x40e00000    # 7.0f

    div-float/2addr v0, v3

    .line 518
    .local v0, "estimatedModuleSize":F
    const/4 v3, 0x0

    .line 519
    .local v3, "found":Z
    const/4 v5, 0x0

    .local v5, "index":I
    const/4 v7, 0x0

    :goto_0
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v5, v8, :cond_1

    .line 520
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 522
    .local v7, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    move-object v7, v8

    invoke-virtual {v8, v0, v6, v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->aboutEquals(FFF)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 523
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-virtual {v7, v6, v4, v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->combineEstimate(FFF)Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v9

    invoke-interface {v8, v5, v9}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 524
    const/4 v3, 0x1

    .line 525
    goto :goto_1

    .line 519
    .end local v7    # "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 528
    .end local v5    # "index":I
    :cond_1
    :goto_1
    if-nez v3, :cond_2

    .line 529
    new-instance v5, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-direct {v5, v4, v6, v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;-><init>(FFF)V

    .line 530
    .local v5, "point":Lcom/google/zxing/qrcode/detector/FinderPattern;
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 531
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    if-eqz v7, :cond_2

    .line 532
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    invoke-interface {v7, v5}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 535
    .end local v5    # "point":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_2
    return v2

    .line 538
    .end local v0    # "estimatedModuleSize":F
    .end local v3    # "found":Z
    :cond_3
    return v0
.end method

.method protected final handlePossibleCenter([IIIZ)Z
    .locals 1
    .param p1, "stateCount"    # [I
    .param p2, "i"    # I
    .param p3, "j"    # I
    .param p4, "pureBarcode"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 488
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v0

    return v0
.end method

.method protected final shiftCounts2([I)V
    .locals 0
    .param p1, "stateCount"    # [I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 246
    invoke-static {p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->doShiftCounts2([I)V

    .line 247
    return-void
.end method
