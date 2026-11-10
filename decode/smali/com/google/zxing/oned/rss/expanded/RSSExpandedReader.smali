.class public final Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;
.super Lcom/google/zxing/oned/rss/AbstractRSSReader;
.source "RSSExpandedReader.java"


# static fields
.field private static final EVEN_TOTAL_SUBSET:[I

.field private static final FINDER_PATTERNS:[[I

.field private static final FINDER_PATTERN_SEQUENCES:[[I

.field private static final FINDER_PAT_A:I = 0x0

.field private static final FINDER_PAT_B:I = 0x1

.field private static final FINDER_PAT_C:I = 0x2

.field private static final FINDER_PAT_D:I = 0x3

.field private static final FINDER_PAT_E:I = 0x4

.field private static final FINDER_PAT_F:I = 0x5

.field private static final GSUM:[I

.field private static final MAX_PAIRS:I = 0xb

.field private static final SYMBOL_WIDEST:[I

.field private static final WEIGHTS:[[I


# instance fields
.field private final pairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation
.end field

.field private final rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;"
        }
    .end annotation
.end field

.field private final startEnd:[I

.field private startFromEven:Z


# direct methods
.method static constructor <clinit>()V
    .locals 35

    .line 57
    const/4 v0, 0x7

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x1

    filled-new-array {v0, v1, v2, v3, v4}, [I

    move-result-object v5

    sput-object v5, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->SYMBOL_WIDEST:[I

    .line 58
    const/16 v5, 0x68

    const/16 v6, 0xcc

    const/16 v7, 0x14

    const/16 v8, 0x34

    filled-new-array {v2, v7, v8, v5, v6}, [I

    move-result-object v5

    sput-object v5, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->EVEN_TOTAL_SUBSET:[I

    .line 59
    const/16 v5, 0xb84

    const/16 v6, 0xf94

    const/4 v8, 0x0

    const/16 v9, 0x15c

    const/16 v10, 0x56c

    filled-new-array {v8, v9, v10, v5, v6}, [I

    move-result-object v5

    sput-object v5, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->GSUM:[I

    .line 61
    const/4 v5, 0x6

    new-array v6, v5, [[I

    const/16 v9, 0x8

    filled-new-array {v4, v9, v2, v4}, [I

    move-result-object v10

    aput-object v10, v6, v8

    filled-new-array {v3, v5, v2, v4}, [I

    move-result-object v10

    aput-object v10, v6, v4

    filled-new-array {v3, v2, v5, v4}, [I

    move-result-object v10

    const/4 v11, 0x2

    aput-object v10, v6, v11

    filled-new-array {v3, v11, v9, v4}, [I

    move-result-object v10

    aput-object v10, v6, v3

    filled-new-array {v11, v5, v1, v4}, [I

    move-result-object v10

    aput-object v10, v6, v2

    const/16 v10, 0x9

    filled-new-array {v11, v11, v10, v4}, [I

    move-result-object v12

    aput-object v12, v6, v1

    sput-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERNS:[[I

    .line 70
    new-array v6, v9, [I

    fill-array-data v6, :array_0

    new-array v12, v9, [I

    fill-array-data v12, :array_1

    new-array v13, v9, [I

    fill-array-data v13, :array_2

    new-array v14, v9, [I

    fill-array-data v14, :array_3

    new-array v15, v9, [I

    fill-array-data v15, :array_4

    move/from16 v16, v1

    new-array v1, v9, [I

    fill-array-data v1, :array_5

    move/from16 v17, v7

    new-array v7, v9, [I

    fill-array-data v7, :array_6

    move/from16 v18, v2

    new-array v2, v9, [I

    fill-array-data v2, :array_7

    move/from16 v19, v3

    new-array v3, v9, [I

    fill-array-data v3, :array_8

    move/from16 v20, v11

    new-array v11, v9, [I

    fill-array-data v11, :array_9

    move/from16 v21, v4

    new-array v4, v9, [I

    fill-array-data v4, :array_a

    move/from16 v22, v8

    new-array v8, v9, [I

    fill-array-data v8, :array_b

    move/from16 v23, v10

    new-array v10, v9, [I

    fill-array-data v10, :array_c

    move/from16 v24, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_d

    move/from16 v25, v5

    new-array v5, v9, [I

    fill-array-data v5, :array_e

    move-object/from16 v26, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_f

    move-object/from16 v27, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_10

    move-object/from16 v28, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_11

    move-object/from16 v29, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_12

    move-object/from16 v30, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_13

    move-object/from16 v31, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_14

    move-object/from16 v32, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_15

    move-object/from16 v33, v0

    new-array v0, v9, [I

    fill-array-data v0, :array_16

    move/from16 v34, v9

    const/16 v9, 0x17

    new-array v9, v9, [[I

    aput-object v6, v9, v22

    aput-object v12, v9, v21

    aput-object v13, v9, v20

    aput-object v14, v9, v19

    aput-object v15, v9, v18

    aput-object v1, v9, v16

    aput-object v7, v9, v25

    aput-object v2, v9, v24

    aput-object v3, v9, v34

    aput-object v11, v9, v23

    const/16 v1, 0xa

    aput-object v4, v9, v1

    const/16 v2, 0xb

    aput-object v8, v9, v2

    const/16 v2, 0xc

    aput-object v10, v9, v2

    const/16 v2, 0xd

    aput-object v26, v9, v2

    const/16 v2, 0xe

    aput-object v5, v9, v2

    const/16 v2, 0xf

    aput-object v27, v9, v2

    const/16 v2, 0x10

    aput-object v28, v9, v2

    const/16 v2, 0x11

    aput-object v29, v9, v2

    const/16 v2, 0x12

    aput-object v30, v9, v2

    const/16 v2, 0x13

    aput-object v31, v9, v2

    aput-object v32, v9, v17

    const/16 v2, 0x15

    aput-object v33, v9, v2

    const/16 v2, 0x16

    aput-object v0, v9, v2

    sput-object v9, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    .line 103
    move/from16 v0, v25

    new-array v2, v0, [I

    fill-array-data v2, :array_17

    move/from16 v0, v24

    new-array v3, v0, [I

    fill-array-data v3, :array_18

    move/from16 v0, v34

    new-array v4, v0, [I

    fill-array-data v4, :array_19

    move/from16 v0, v23

    new-array v5, v0, [I

    fill-array-data v5, :array_1a

    new-array v0, v1, [I

    fill-array-data v0, :array_1b

    const/16 v6, 0xb

    new-array v6, v6, [I

    fill-array-data v6, :array_1c

    new-array v1, v1, [[I

    move/from16 v7, v22

    filled-new-array {v7, v7}, [I

    move-result-object v8

    aput-object v8, v1, v7

    move/from16 v8, v21

    filled-new-array {v7, v8, v8}, [I

    move-result-object v9

    aput-object v9, v1, v8

    move/from16 v9, v19

    move/from16 v10, v20

    filled-new-array {v7, v10, v8, v9}, [I

    move-result-object v11

    aput-object v11, v1, v10

    move/from16 v11, v18

    filled-new-array {v7, v11, v8, v9, v10}, [I

    move-result-object v7

    aput-object v7, v1, v9

    aput-object v2, v1, v11

    aput-object v3, v1, v16

    const/16 v25, 0x6

    aput-object v4, v1, v25

    const/16 v24, 0x7

    aput-object v5, v1, v24

    const/16 v34, 0x8

    aput-object v0, v1, v34

    const/16 v23, 0x9

    aput-object v6, v1, v23

    sput-object v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    return-void

    :array_0
    .array-data 4
        0x1
        0x3
        0x9
        0x1b
        0x51
        0x20
        0x60
        0x4d
    .end array-data

    :array_1
    .array-data 4
        0x14
        0x3c
        0xb4
        0x76
        0x8f
        0x7
        0x15
        0x3f
    .end array-data

    :array_2
    .array-data 4
        0xbd
        0x91
        0xd
        0x27
        0x75
        0x8c
        0xd1
        0xcd
    .end array-data

    :array_3
    .array-data 4
        0xc1
        0x9d
        0x31
        0x93
        0x13
        0x39
        0xab
        0x5b
    .end array-data

    :array_4
    .array-data 4
        0x3e
        0xba
        0x88
        0xc5
        0xa9
        0x55
        0x2c
        0x84
    .end array-data

    :array_5
    .array-data 4
        0xb9
        0x85
        0xbc
        0x8e
        0x4
        0xc
        0x24
        0x6c
    .end array-data

    :array_6
    .array-data 4
        0x71
        0x80
        0xad
        0x61
        0x50
        0x1d
        0x57
        0x32
    .end array-data

    :array_7
    .array-data 4
        0x96
        0x1c
        0x54
        0x29
        0x7b
        0x9e
        0x34
        0x9c
    .end array-data

    :array_8
    .array-data 4
        0x2e
        0x8a
        0xcb
        0xbb
        0x8b
        0xce
        0xc4
        0xa6
    .end array-data

    :array_9
    .array-data 4
        0x4c
        0x11
        0x33
        0x99
        0x25
        0x6f
        0x7a
        0x9b
    .end array-data

    :array_a
    .array-data 4
        0x2b
        0x81
        0xb0
        0x6a
        0x6b
        0x6e
        0x77
        0x92
    .end array-data

    :array_b
    .array-data 4
        0x10
        0x30
        0x90
        0xa
        0x1e
        0x5a
        0x3b
        0xb1
    .end array-data

    :array_c
    .array-data 4
        0x6d
        0x74
        0x89
        0xc8
        0xb2
        0x70
        0x7d
        0xa4
    .end array-data

    :array_d
    .array-data 4
        0x46
        0xd2
        0xd0
        0xca
        0xb8
        0x82
        0xb3
        0x73
    .end array-data

    :array_e
    .array-data 4
        0x86
        0xbf
        0x97
        0x1f
        0x5d
        0x44
        0xcc
        0xbe
    .end array-data

    :array_f
    .array-data 4
        0x94
        0x16
        0x42
        0xc6
        0xac
        0x5e
        0x47
        0x2
    .end array-data

    :array_10
    .array-data 4
        0x6
        0x12
        0x36
        0xa2
        0x40
        0xc0
        0x9a
        0x28
    .end array-data

    :array_11
    .array-data 4
        0x78
        0x95
        0x19
        0x4b
        0xe
        0x2a
        0x7e
        0xa7
    .end array-data

    :array_12
    .array-data 4
        0x4f
        0x1a
        0x4e
        0x17
        0x45
        0xcf
        0xc7
        0xaf
    .end array-data

    :array_13
    .array-data 4
        0x67
        0x62
        0x53
        0x26
        0x72
        0x83
        0xb6
        0x7c
    .end array-data

    :array_14
    .array-data 4
        0xa1
        0x3d
        0xb7
        0x7f
        0xaa
        0x58
        0x35
        0x9f
    .end array-data

    :array_15
    .array-data 4
        0x37
        0xa5
        0x49
        0x8
        0x18
        0x48
        0x5
        0xf
    .end array-data

    :array_16
    .array-data 4
        0x2d
        0x87
        0xc2
        0xa0
        0x3a
        0xae
        0x64
        0x59
    .end array-data

    :array_17
    .array-data 4
        0x0
        0x4
        0x1
        0x3
        0x3
        0x5
    .end array-data

    :array_18
    .array-data 4
        0x0
        0x4
        0x1
        0x3
        0x4
        0x5
        0x5
    .end array-data

    :array_19
    .array-data 4
        0x0
        0x0
        0x1
        0x1
        0x2
        0x2
        0x3
        0x3
    .end array-data

    :array_1a
    .array-data 4
        0x0
        0x0
        0x1
        0x1
        0x2
        0x2
        0x3
        0x4
        0x4
    .end array-data

    :array_1b
    .array-data 4
        0x0
        0x0
        0x1
        0x1
        0x2
        0x2
        0x3
        0x4
        0x5
        0x5
    .end array-data

    :array_1c
    .array-data 4
        0x0
        0x0
        0x1
        0x1
        0x2
        0x3
        0x3
        0x4
        0x4
        0x5
        0x5
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 55
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/AbstractRSSReader;-><init>()V

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    .line 119
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    .line 120
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    return-void
.end method

.method private adjustOddEvenCounts(I)V
    .locals 11
    .param p1, "numModules"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 672
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->sum([I)I

    move-result v0

    .line 673
    .local v0, "oddSum":I
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/common/detector/MathUtils;->sum([I)I

    move-result v1

    .line 675
    .local v1, "evenSum":I
    const/4 v2, 0x0

    .line 676
    .local v2, "incrementOdd":Z
    const/4 v3, 0x0

    .line 678
    .local v3, "decrementOdd":Z
    const/4 v4, 0x4

    const/16 v5, 0xd

    if-le v0, v5, :cond_0

    .line 679
    const/4 v3, 0x1

    goto :goto_0

    .line 680
    :cond_0
    if-ge v0, v4, :cond_1

    .line 681
    const/4 v2, 0x1

    .line 683
    :cond_1
    :goto_0
    const/4 v6, 0x0

    .line 684
    .local v6, "incrementEven":Z
    const/4 v7, 0x0

    .line 685
    .local v7, "decrementEven":Z
    if-le v1, v5, :cond_2

    .line 686
    const/4 v7, 0x1

    goto :goto_1

    .line 687
    :cond_2
    if-ge v1, v4, :cond_3

    .line 688
    const/4 v6, 0x1

    .line 691
    :cond_3
    :goto_1
    add-int v4, v0, v1

    sub-int/2addr v4, p1

    .line 692
    .local v4, "mismatch":I
    and-int/lit8 v5, v0, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-ne v5, v9, :cond_4

    move v5, v9

    goto :goto_2

    :cond_4
    move v5, v8

    .line 693
    .local v5, "oddParityBad":Z
    :goto_2
    and-int/lit8 v10, v1, 0x1

    if-nez v10, :cond_5

    move v8, v9

    .line 694
    .local v8, "evenParityBad":Z
    :cond_5
    packed-switch v4, :pswitch_data_0

    .line 742
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 696
    :pswitch_0
    if-eqz v5, :cond_7

    .line 697
    if-nez v8, :cond_6

    .line 700
    const/4 v3, 0x1

    goto :goto_3

    .line 698
    :cond_6
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 702
    :cond_7
    if-eqz v8, :cond_8

    .line 705
    const/4 v7, 0x1

    .line 707
    goto :goto_3

    .line 703
    :cond_8
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 722
    :pswitch_1
    if-eqz v5, :cond_b

    .line 723
    if-eqz v8, :cond_a

    .line 727
    if-ge v0, v1, :cond_9

    .line 728
    const/4 v2, 0x1

    .line 729
    const/4 v7, 0x1

    goto :goto_3

    .line 731
    :cond_9
    const/4 v3, 0x1

    .line 732
    const/4 v6, 0x1

    goto :goto_3

    .line 724
    :cond_a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 735
    :cond_b
    if-nez v8, :cond_c

    goto :goto_3

    .line 736
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 709
    :pswitch_2
    if-eqz v5, :cond_e

    .line 710
    if-nez v8, :cond_d

    .line 713
    const/4 v2, 0x1

    goto :goto_3

    .line 711
    :cond_d
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 715
    :cond_e
    if-eqz v8, :cond_15

    .line 718
    const/4 v6, 0x1

    .line 720
    nop

    .line 745
    :goto_3
    if-eqz v2, :cond_10

    .line 746
    if-nez v3, :cond_f

    .line 749
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v9

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->increment([I[F)V

    goto :goto_4

    .line 747
    :cond_f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 751
    :cond_10
    :goto_4
    if-eqz v3, :cond_11

    .line 752
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v9

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decrement([I[F)V

    .line 754
    :cond_11
    if-eqz v6, :cond_13

    .line 755
    if-nez v7, :cond_12

    .line 758
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v9

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->increment([I[F)V

    goto :goto_5

    .line 756
    :cond_12
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 760
    :cond_13
    :goto_5
    if-eqz v7, :cond_14

    .line 761
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v9

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenRoundingErrors()[F

    move-result-object v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decrement([I[F)V

    .line 763
    :cond_14
    return-void

    .line 716
    :cond_15
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

.method private checkChecksum()Z
    .locals 10

    .line 367
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    const/4 v2, 0x0

    move-object v3, v2

    .line 368
    .local v3, "firstPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    move-object v3, v0

    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v0

    .line 369
    .local v0, "checkCharacter":Lcom/google/zxing/oned/rss/DataCharacter;
    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v4

    move-object v5, v2

    .line 371
    .local v5, "firstCharacter":Lcom/google/zxing/oned/rss/DataCharacter;
    move-object v5, v4

    if-nez v4, :cond_0

    .line 372
    return v1

    .line 375
    :cond_0
    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v4

    .line 376
    .local v4, "checksum":I
    const/4 v6, 0x2

    .line 378
    .local v6, "s":I
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_0
    iget-object v8, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_2

    .line 379
    iget-object v8, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 380
    .local v8, "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v9

    add-int/2addr v4, v9

    .line 381
    add-int/lit8 v6, v6, 0x1

    .line 382
    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v9

    .line 383
    .local v2, "currentRightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    move-object v2, v9

    if-eqz v9, :cond_1

    .line 384
    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v9

    add-int/2addr v4, v9

    .line 385
    add-int/lit8 v6, v6, 0x1

    .line 378
    .end local v2    # "currentRightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    .end local v8    # "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 389
    .end local v7    # "i":I
    :cond_2
    rem-int/lit16 v4, v4, 0xd3

    .line 391
    add-int/lit8 v2, v6, -0x4

    mul-int/lit16 v2, v2, 0xd3

    add-int/2addr v2, v4

    .line 393
    .local v7, "checkCharacterValue":I
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v8

    if-ne v2, v8, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1
.end method

.method private checkRows(Ljava/util/List;I)Ljava/util/List;
    .locals 6
    .param p2, "currentRow"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 217
    .local p1, "collectedRows":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    move v0, p2

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 218
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 219
    .local v1, "row":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    iget-object v2, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 220
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 221
    .local v3, "collectedRow":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 222
    .end local v3    # "collectedRow":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    goto :goto_1

    .line 223
    :cond_0
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 225
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-static {v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isValidSequence(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 226
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkChecksum()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 227
    iget-object v2, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    return-object v2

    .line 230
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 231
    .local v2, "rs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    move-object v2, v3

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    add-int/lit8 v3, v0, 0x1

    :try_start_0
    invoke-direct {p0, v2, v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Ljava/util/List;I)Ljava/util/List;

    move-result-object v3
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 235
    :catch_0
    move-exception v3

    .line 217
    .end local v1    # "row":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    .end local v2    # "rs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 241
    .end local v0    # "i":I
    :cond_3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private checkRows(Z)Ljava/util/List;
    .locals 3
    .param p1, "reverse"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x19

    if-le v0, v1, :cond_0

    .line 191
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 192
    const/4 v0, 0x0

    return-object v0

    .line 195
    :cond_0
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 196
    if-eqz p1, :cond_1

    .line 197
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 200
    :cond_1
    const/4 v0, 0x0

    .line 202
    .local v0, "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Ljava/util/List;I)Ljava/util/List;

    move-result-object v1
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 205
    goto :goto_0

    .line 203
    :catch_0
    move-exception v1

    .line 207
    :goto_0
    if-eqz p1, :cond_2

    .line 208
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 211
    :cond_2
    return-object v0
.end method

.method static constructResult(Ljava/util/List;)Lcom/google/zxing/Result;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 350
    .local p0, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    invoke-static {p0}, Lcom/google/zxing/oned/rss/expanded/BitArrayBuilder;->buildBitArray(Ljava/util/List;)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    .line 352
    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->createDecoder(Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;

    move-result-object v0

    .line 353
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->parseInformation()Ljava/lang/String;

    move-result-object v0

    .line 355
    .local v0, "resultingString":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v2

    .line 356
    .local v2, "firstPoints":[Lcom/google/zxing/ResultPoint;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v3

    .line 358
    .local v3, "lastPoints":[Lcom/google/zxing/ResultPoint;
    new-instance v5, Lcom/google/zxing/Result;

    const/4 v6, 0x4

    new-array v6, v6, [Lcom/google/zxing/ResultPoint;

    aget-object v7, v2, v1

    aput-object v7, v6, v1

    aget-object v7, v2, v4

    aput-object v7, v6, v4

    const/4 v7, 0x2

    aget-object v1, v3, v1

    aput-object v1, v6, v7

    const/4 v1, 0x3

    aget-object v4, v3, v4

    aput-object v4, v6, v1

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->RSS_EXPANDED:Lcom/google/zxing/BarcodeFormat;

    const/4 v4, 0x0

    invoke-direct {v5, v0, v4, v6, v1}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v5
.end method

.method private findNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)V
    .locals 17
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "forcedOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 450
    .local p2, "previousPairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDecodeFinderCounters()[I

    move-result-object v2

    const/4 v3, 0x0

    move-object v4, v3

    .line 451
    .local v4, "counters":[I
    move-object v4, v2

    const/4 v5, 0x0

    aput v5, v2, v5

    .line 452
    const/4 v2, 0x1

    aput v5, v4, v2

    .line 453
    const/4 v6, 0x2

    aput v5, v4, v6

    .line 454
    const/4 v7, 0x3

    aput v5, v4, v7

    .line 456
    invoke-virtual {v1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    .line 459
    .local v8, "width":I
    if-ltz p3, :cond_0

    .line 460
    move/from16 v3, p3

    move-object/from16 v10, p2

    .local v3, "rowOffset":I
    goto :goto_0

    .line 461
    .end local v3    # "rowOffset":I
    :cond_0
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 462
    const/4 v3, 0x0

    move-object/from16 v10, p2

    .restart local v3    # "rowOffset":I
    goto :goto_0

    .line 464
    .end local v3    # "rowOffset":I
    :cond_1
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v9

    sub-int/2addr v9, v2

    move-object/from16 v10, p2

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 465
    .local v3, "lastPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v9

    aget v9, v9, v2

    move v3, v9

    .line 467
    .local v3, "rowOffset":I
    :goto_0
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v9

    rem-int/2addr v9, v6

    if-eqz v9, :cond_2

    move v9, v2

    goto :goto_1

    :cond_2
    move v9, v5

    .line 468
    .local v9, "searchingEvenPair":Z
    :goto_1
    iget-boolean v11, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    if-eqz v11, :cond_4

    .line 469
    if-nez v9, :cond_3

    move v11, v2

    goto :goto_2

    :cond_3
    move v11, v5

    :goto_2
    move v9, v11

    .line 472
    :cond_4
    const/4 v11, 0x0

    .line 473
    .local v11, "isWhite":Z
    :goto_3
    if-ge v3, v8, :cond_5

    .line 474
    invoke-virtual {v1, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v12

    .line 475
    xor-int/lit8 v13, v12, 0x1

    move v11, v13

    if-nez v12, :cond_5

    .line 478
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 481
    :cond_5
    const/4 v12, 0x0

    .line 482
    .local v12, "counterPosition":I
    move v13, v3

    .line 483
    .local v13, "patternStart":I
    move v14, v3

    .local v14, "x":I
    :goto_4
    if-ge v14, v8, :cond_c

    .line 484
    invoke-virtual {v1, v14}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v15

    if-eq v15, v11, :cond_6

    .line 485
    aget v15, v4, v12

    add-int/2addr v15, v2

    aput v15, v4, v12

    goto :goto_7

    .line 487
    :cond_6
    if-ne v12, v7, :cond_a

    .line 488
    if-eqz v9, :cond_7

    .line 489
    invoke-static {v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reverseCounters([I)V

    .line 492
    :cond_7
    invoke-static {v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isFinderPattern([I)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 493
    iget-object v6, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aput v13, v6, v5

    .line 494
    iget-object v5, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aput v14, v5, v2

    .line 495
    return-void

    .line 498
    :cond_8
    if-eqz v9, :cond_9

    .line 499
    invoke-static {v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reverseCounters([I)V

    .line 502
    :cond_9
    aget v15, v4, v5

    aget v16, v4, v2

    add-int v15, v15, v16

    add-int/2addr v13, v15

    .line 503
    aget v15, v4, v6

    aput v15, v4, v5

    .line 504
    aget v15, v4, v7

    aput v15, v4, v2

    .line 505
    aput v5, v4, v6

    .line 506
    aput v5, v4, v7

    .line 507
    add-int/lit8 v12, v12, -0x1

    goto :goto_5

    .line 509
    :cond_a
    add-int/lit8 v12, v12, 0x1

    .line 511
    :goto_5
    aput v2, v4, v12

    .line 512
    if-nez v11, :cond_b

    move v15, v2

    goto :goto_6

    :cond_b
    move v15, v5

    :goto_6
    move v11, v15

    .line 483
    :goto_7
    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    .line 515
    .end local v14    # "x":I
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method

.method private static getNextSecondBar(Lcom/google/zxing/common/BitArray;I)I
    .locals 1
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "initialPos"    # I

    .line 398
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 399
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v0

    .line 400
    .local v0, "currentPos":I
    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v0

    goto :goto_0

    .line 402
    .end local v0    # "currentPos":I
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v0

    .line 403
    .restart local v0    # "currentPos":I
    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v0

    .line 405
    :goto_0
    return v0
.end method

.method private static isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z
    .locals 1
    .param p0, "pattern"    # Lcom/google/zxing/oned/rss/FinderPattern;
    .param p1, "isOddPattern"    # Z
    .param p2, "leftChar"    # Z

    .line 667
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private static isPartialRow(Ljava/lang/Iterable;Ljava/lang/Iterable;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;)Z"
        }
    .end annotation

    .line 320
    .local p0, "pairs":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    .local p1, "rows":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 321
    .local v1, "r":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    const/4 v2, 0x1

    .line 322
    .local v2, "allFound":Z
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 323
    .local v4, "p":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    const/4 v5, 0x0

    .line 324
    .local v5, "found":Z
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 325
    .local v7, "pp":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v4, v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 326
    const/4 v5, 0x1

    .line 327
    goto :goto_3

    .line 329
    .end local v7    # "pp":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    :cond_0
    goto :goto_2

    .line 330
    :cond_1
    :goto_3
    if-nez v5, :cond_2

    .line 331
    const/4 v2, 0x0

    .line 332
    goto :goto_4

    .line 334
    .end local v4    # "p":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .end local v5    # "found":Z
    :cond_2
    goto :goto_1

    .line 335
    :cond_3
    :goto_4
    if-eqz v2, :cond_4

    .line 337
    const/4 v0, 0x1

    return v0

    .line 339
    .end local v1    # "r":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    .end local v2    # "allFound":Z
    :cond_4
    goto :goto_0

    .line 340
    :cond_5
    const/4 v0, 0x0

    return v0
.end method

.method private static isValidSequence(Ljava/util/List;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;)Z"
        }
    .end annotation

    .line 247
    .local p0, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_3

    aget-object v4, v0, v3

    .line 248
    .local v4, "sequence":[I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    array-length v6, v4

    if-gt v5, v6, :cond_2

    .line 249
    const/4 v5, 0x1

    .line 250
    .local v5, "stop":Z
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_1

    .line 251
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v7

    aget v8, v4, v6

    if-eq v7, v8, :cond_0

    .line 252
    const/4 v5, 0x0

    .line 253
    goto :goto_2

    .line 250
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 256
    .end local v6    # "j":I
    :cond_1
    :goto_2
    if-eqz v5, :cond_2

    .line 257
    const/4 v0, 0x1

    return v0

    .line 247
    .end local v4    # "sequence":[I
    .end local v5    # "stop":Z
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 263
    :cond_3
    return v2
.end method

.method private parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ)Lcom/google/zxing/oned/rss/FinderPattern;
    .locals 8

    .line 533
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p3, :cond_1

    .line 536
    iget-object p3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget p3, p3, v0

    sub-int/2addr p3, v1

    .line 538
    :goto_0
    if-ltz p3, :cond_0

    invoke-virtual {p1, p3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 539
    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    .line 542
    :cond_0
    add-int/2addr p3, v1

    .line 543
    iget-object p1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget p1, p1, v0

    sub-int/2addr p1, p3

    .line 544
    nop

    .line 545
    iget-object v2, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v2, v2, v1

    .line 547
    move v5, p3

    move v6, v2

    goto :goto_1

    .line 550
    :cond_1
    iget-object p3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget p3, p3, v0

    .line 552
    iget-object v2, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v2, v2, v1

    add-int/2addr v2, v1

    invoke-virtual {p1, v2}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v2

    .line 553
    iget-object p1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget p1, p1, v1

    sub-int p1, v2, p1

    move v5, p3

    move v6, v2

    .line 557
    :goto_1
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDecodeFinderCounters()[I

    move-result-object p3

    .line 558
    array-length v2, p3

    sub-int/2addr v2, v1

    invoke-static {p3, v0, p3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 560
    aput p1, p3, v0

    .line 563
    :try_start_0
    sget-object p1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERNS:[[I

    invoke-static {p3, p1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->parseFinderValue([I[[I)I

    move-result v3
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 566
    nop

    .line 567
    new-instance v2, Lcom/google/zxing/oned/rss/FinderPattern;

    filled-new-array {v5, v6}, [I

    move-result-object v4

    move v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/google/zxing/oned/rss/FinderPattern;-><init>(I[IIII)V

    return-object v2

    .line 564
    :catch_0
    move-exception v0

    .line 565
    const/4 p1, 0x0

    return-object p1
.end method

.method private static removePartialRows(Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;)V"
        }
    .end annotation

    .line 300
    .local p0, "pairs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    .local p1, "rows":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 301
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 302
    .local v1, "r":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    move-object v1, v2

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 303
    const/4 v2, 0x1

    .line 304
    .local v2, "allFound":Z
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 305
    .local v4, "p":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-interface {p0, v4}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 306
    const/4 v2, 0x0

    .line 307
    goto :goto_2

    .line 309
    .end local v4    # "p":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    :cond_0
    goto :goto_1

    .line 310
    :cond_1
    :goto_2
    if-eqz v2, :cond_2

    .line 312
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 315
    .end local v1    # "r":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    .end local v2    # "allFound":Z
    :cond_2
    goto :goto_0

    .line 316
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    :cond_3
    return-void
.end method

.method private static reverseCounters([I)V
    .locals 4
    .param p0, "counters"    # [I

    .line 519
    array-length v0, p0

    .line 520
    .local v0, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    div-int/lit8 v2, v0, 0x2

    if-ge v1, v2, :cond_0

    .line 521
    aget v2, p0, v1

    .line 522
    .local v2, "tmp":I
    sub-int v3, v0, v1

    add-int/lit8 v3, v3, -0x1

    aget v3, p0, v3

    aput v3, p0, v1

    .line 523
    sub-int v3, v0, v1

    add-int/lit8 v3, v3, -0x1

    aput v2, p0, v3

    .line 520
    .end local v2    # "tmp":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 525
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private storeRow(I)V
    .locals 7
    .param p1, "rowNumber"    # I

    .line 268
    const/4 v0, 0x0

    .line 269
    .local v0, "insertPos":I
    const/4 v1, 0x0

    .line 270
    .local v1, "prevIsSame":Z
    const/4 v2, 0x0

    .local v2, "nextIsSame":Z
    const/4 v3, 0x0

    .line 271
    :goto_0
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 272
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 273
    .local v3, "erow":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    move-object v3, v4

    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getRowNumber()I

    move-result v4

    if-le v4, p1, :cond_0

    .line 274
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->isEquivalent(Ljava/util/List;)Z

    move-result v2

    .line 275
    goto :goto_1

    .line 277
    :cond_0
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->isEquivalent(Ljava/util/List;)Z

    move-result v1

    .line 278
    nop

    .end local v3    # "erow":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    add-int/lit8 v0, v0, 0x1

    .line 279
    goto :goto_0

    .line 280
    :cond_1
    :goto_1
    if-nez v2, :cond_3

    if-nez v1, :cond_3

    .line 289
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v3, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isPartialRow(Ljava/lang/Iterable;Ljava/lang/Iterable;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 290
    return-void

    .line 293
    :cond_2
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    new-instance v4, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    iget-object v5, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    const/4 v6, 0x0

    invoke-direct {v4, v5, p1, v6}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;-><init>(Ljava/util/List;IZ)V

    invoke-interface {v3, v0, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 295
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v3, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->removePartialRows(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 296
    return-void

    .line 281
    :cond_3
    return-void
.end method


# virtual methods
.method decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 574
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDataCharacterCounters()[I

    move-result-object v0

    .line 575
    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 577
    const/4 v2, 0x1

    if-eqz p4, :cond_0

    .line 578
    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v3

    aget v3, v3, v1

    invoke-static {p1, v3, v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->recordPatternInReverse(Lcom/google/zxing/common/BitArray;I[I)V

    goto :goto_1

    .line 580
    :cond_0
    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v3

    aget v3, v3, v2

    invoke-static {p1, v3, v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 582
    array-length p1, v0

    sub-int/2addr p1, v2

    move v3, v1

    :goto_0
    if-ge v3, p1, :cond_1

    .line 583
    aget v4, v0, v3

    .line 584
    aget v5, v0, p1

    aput v5, v0, v3

    .line 585
    aput v4, v0, p1

    .line 582
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 590
    :cond_1
    :goto_1
    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->sum([I)I

    move-result p1

    int-to-float p1, p1

    const/high16 v3, 0x41880000    # 17.0f

    div-float/2addr p1, v3

    .line 593
    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v3

    aget v3, v3, v2

    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v4

    aget v4, v4, v1

    sub-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x41700000    # 15.0f

    div-float/2addr v3, v4

    .line 594
    sub-float v4, p1, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    div-float/2addr v4, v3

    const v3, 0x3e99999a    # 0.3f

    cmpl-float v4, v4, v3

    if-gtz v4, :cond_e

    .line 598
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v4

    .line 599
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v5

    .line 600
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v6

    .line 601
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenRoundingErrors()[F

    move-result-object v7

    .line 603
    move v8, v1

    :goto_2
    array-length v9, v0

    if-ge v8, v9, :cond_7

    .line 604
    aget v9, v0, v8

    int-to-float v9, v9

    const/high16 v10, 0x3f800000    # 1.0f

    mul-float/2addr v9, v10

    div-float/2addr v9, p1

    .line 605
    const/high16 v10, 0x3f000000    # 0.5f

    add-float/2addr v10, v9

    float-to-int v10, v10

    .line 606
    if-gtz v10, :cond_3

    .line 607
    cmpg-float v10, v9, v3

    if-ltz v10, :cond_2

    .line 610
    move v10, v2

    goto :goto_3

    .line 608
    :cond_2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object p1

    throw p1

    .line 611
    :cond_3
    const/16 v11, 0x8

    if-le v10, v11, :cond_5

    .line 612
    const v10, 0x410b3333    # 8.7f

    cmpl-float v10, v9, v10

    if-gtz v10, :cond_4

    .line 615
    move v10, v11

    goto :goto_3

    .line 613
    :cond_4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object p1

    throw p1

    .line 617
    :cond_5
    :goto_3
    div-int/lit8 v11, v8, 0x2

    .line 618
    and-int/lit8 v12, v8, 0x1

    if-nez v12, :cond_6

    .line 619
    aput v10, v4, v11

    .line 620
    int-to-float v10, v10

    sub-float/2addr v9, v10

    aput v9, v6, v11

    goto :goto_4

    .line 622
    :cond_6
    aput v10, v5, v11

    .line 623
    int-to-float v10, v10

    sub-float/2addr v9, v10

    aput v9, v7, v11

    .line 603
    :goto_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 627
    :cond_7
    const/16 p1, 0x11

    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->adjustOddEvenCounts(I)V

    .line 629
    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result p1

    const/4 v0, 0x4

    mul-int/2addr p1, v0

    const/4 v3, 0x2

    if-eqz p3, :cond_8

    move v6, v1

    goto :goto_5

    :cond_8
    move v6, v3

    :goto_5
    add-int/2addr p1, v6

    xor-int/lit8 v6, p4, 0x1

    add-int/2addr p1, v6

    sub-int/2addr p1, v2

    .line 631
    nop

    .line 632
    nop

    .line 633
    array-length v6, v4

    sub-int/2addr v6, v2

    move v7, v1

    move v8, v7

    :goto_6
    if-ltz v6, :cond_a

    .line 634
    invoke-static/range {p2 .. p4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 635
    sget-object v9, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    aget-object v9, v9, p1

    mul-int/lit8 v10, v6, 0x2

    aget v9, v9, v10

    .line 636
    aget v10, v4, v6

    mul-int/2addr v10, v9

    add-int/2addr v7, v10

    .line 638
    :cond_9
    aget v9, v4, v6

    add-int/2addr v8, v9

    .line 633
    add-int/lit8 v6, v6, -0x1

    goto :goto_6

    .line 640
    :cond_a
    nop

    .line 641
    array-length v6, v5

    sub-int/2addr v6, v2

    move v9, v1

    :goto_7
    if-ltz v6, :cond_c

    .line 642
    invoke-static/range {p2 .. p4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z

    move-result v10

    if-eqz v10, :cond_b

    .line 643
    sget-object v10, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    aget-object v10, v10, p1

    mul-int/lit8 v11, v6, 0x2

    add-int/2addr v11, v2

    aget v10, v10, v11

    .line 644
    aget v11, v5, v6

    mul-int/2addr v11, v10

    add-int/2addr v9, v11

    .line 641
    :cond_b
    add-int/lit8 v6, v6, -0x1

    goto :goto_7

    .line 647
    :cond_c
    add-int/2addr v7, v9

    .line 649
    and-int/lit8 p1, v8, 0x1

    if-nez p1, :cond_d

    const/16 p1, 0xd

    if-gt v8, p1, :cond_d

    if-lt v8, v0, :cond_d

    .line 653
    sub-int/2addr p1, v8

    div-int/2addr p1, v3

    .line 654
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->SYMBOL_WIDEST:[I

    aget v0, v0, p1

    .line 655
    rsub-int/lit8 v3, v0, 0x9

    .line 656
    invoke-static {v4, v0, v2}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v0

    .line 657
    invoke-static {v5, v3, v1}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v1

    .line 658
    sget-object v2, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->EVEN_TOTAL_SUBSET:[I

    aget v2, v2, p1

    .line 659
    sget-object v3, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->GSUM:[I

    aget p1, v3, p1

    .line 660
    mul-int/2addr v0, v2

    add-int/2addr v0, v1

    add-int/2addr v0, p1

    .line 662
    new-instance p1, Lcom/google/zxing/oned/rss/DataCharacter;

    invoke-direct {p1, v0, v7}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object p1

    .line 650
    :cond_d
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object p1

    throw p1

    .line 595
    :cond_e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object p1

    throw p1
.end method

.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 1
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
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 129
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 130
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    .line 132
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->constructResult(Ljava/util/List;)Lcom/google/zxing/Result;

    move-result-object v0
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 133
    :catch_0
    move-exception v0

    .line 137
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 138
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    .line 139
    invoke-virtual {p0, p1, p2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->constructResult(Ljava/util/List;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;
    .locals 5
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 150
    const/4 v0, 0x0

    .line 151
    .local v0, "done":Z
    :goto_0
    if-nez v0, :cond_1

    .line 153
    :try_start_0
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    iget-object v2, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {p0, p2, v2, p1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->retrieveNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 154
    :catch_0
    move-exception v1

    .line 155
    .local v1, "nfe":Lcom/google/zxing/NotFoundException;
    iget-object v2, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 159
    const/4 v0, 0x1

    .line 160
    .end local v1    # "nfe":Lcom/google/zxing/NotFoundException;
    :goto_1
    goto :goto_0

    .line 156
    .restart local v1    # "nfe":Lcom/google/zxing/NotFoundException;
    :cond_0
    throw v1

    .line 164
    .end local v1    # "nfe":Lcom/google/zxing/NotFoundException;
    :cond_1
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkChecksum()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 165
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    return-object v1

    .line 168
    :cond_2
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    .line 169
    .local v1, "tryStackedDecode":Z
    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->storeRow(I)V

    .line 170
    if-eqz v1, :cond_4

    .line 173
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Z)Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    .line 174
    .local v4, "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    move-object v4, v3

    if-eqz v3, :cond_3

    .line 175
    return-object v4

    .line 177
    :cond_3
    invoke-direct {p0, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Z)Ljava/util/List;

    move-result-object v2

    .line 178
    move-object v3, v2

    .end local v4    # "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    .local v3, "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    if-eqz v2, :cond_4

    .line 179
    return-object v3

    .line 183
    .end local v3    # "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    :cond_4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method

.method getRows()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;"
        }
    .end annotation

    .line 345
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    return-object v0
.end method

.method public reset()V
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 145
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 146
    return-void
.end method

.method retrieveNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .locals 8
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "rowNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;I)",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 411
    .local p2, "previousPairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 412
    .local v0, "isOddPattern":Z
    :goto_0
    iget-boolean v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    if-eqz v3, :cond_2

    .line 413
    if-nez v0, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    move v0, v3

    .line 418
    :cond_2
    const/4 v3, 0x1

    .line 419
    .local v3, "keepFinding":Z
    const/4 v4, -0x1

    .local v4, "forcedOffset":I
    const/4 v5, 0x0

    .line 421
    :cond_3
    invoke-direct {p0, p1, p2, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->findNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)V

    .line 422
    invoke-direct {p0, p1, p3, v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ)Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v6

    .line 423
    .local v5, "pattern":Lcom/google/zxing/oned/rss/FinderPattern;
    move-object v5, v6

    if-nez v6, :cond_4

    .line 424
    iget-object v6, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v6, v6, v2

    invoke-static {p1, v6}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getNextSecondBar(Lcom/google/zxing/common/BitArray;I)I

    move-result v4

    goto :goto_2

    .line 426
    :cond_4
    const/4 v3, 0x0

    .line 428
    :goto_2
    if-nez v3, :cond_3

    .line 433
    invoke-virtual {p0, p1, v5, v0, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v6

    .line 435
    .local v6, "leftChar":Lcom/google/zxing/oned/rss/DataCharacter;
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v1

    invoke-interface {p2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->mustBeLast()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 436
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 441
    :cond_5
    :try_start_0
    invoke-virtual {p0, p1, v5, v0, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v1
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    .local v1, "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    goto :goto_3

    .line 442
    .end local v1    # "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    :catch_0
    move-exception v1

    .line 443
    const/4 v1, 0x0

    .line 445
    .restart local v1    # "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    :goto_3
    new-instance v2, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-direct {v2, v6, v1, v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;-><init>(Lcom/google/zxing/oned/rss/DataCharacter;Lcom/google/zxing/oned/rss/DataCharacter;Lcom/google/zxing/oned/rss/FinderPattern;)V

    return-object v2
.end method
