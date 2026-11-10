.class public final Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;
.super Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.source "MultiFinderPatternFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;
    }
.end annotation


# static fields
.field private static final DIFF_MODSIZE_CUTOFF:F = 0.5f

.field private static final DIFF_MODSIZE_CUTOFF_PERCENT:F = 0.05f

.field private static final EMPTY_FP_2D_ARRAY:[[Lcom/google/zxing/qrcode/detector/FinderPattern;

.field private static final EMPTY_FP_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPattern;

.field private static final EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

.field private static final MAX_MODULE_COUNT_PER_EDGE:F = 180.0f

.field private static final MIN_MODULE_COUNT_PER_EDGE:F = 9.0f


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 51
    const/4 v0, 0x0

    new-array v1, v0, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    sput-object v1, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    .line 52
    new-array v1, v0, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    sput-object v1, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_FP_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 53
    new-array v0, v0, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    sput-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_FP_2D_ARRAY:[[Lcom/google/zxing/qrcode/detector/FinderPattern;

    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .locals 0
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "resultPointCallback"    # Lcom/google/zxing/ResultPointCallback;

    .line 90
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 91
    return-void
.end method

.method private selectMultipleBestPatterns()[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 100
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->getPossibleCenters()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    .line 101
    .local v2, "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    move-object v2, v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v3, 0x0

    .line 103
    .local v3, "size":I
    move v3, v0

    const/4 v4, 0x3

    if-lt v0, v4, :cond_d

    .line 111
    const/4 v0, 0x0

    const/4 v5, 0x1

    if-ne v3, v4, :cond_0

    .line 112
    new-array v1, v5, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    sget-object v4, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_FP_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-interface {v2, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v4, v1, v0

    return-object v1

    .line 116
    :cond_0
    new-instance v6, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;-><init>(Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$1;)V

    invoke-static {v2, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 133
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v6, "results":Ljava/util/List;, "Ljava/util/List<[Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    const/4 v7, 0x0

    .local v7, "i1":I
    const/4 v8, 0x0

    move-object v9, v1

    move-object v10, v9

    move v11, v7

    move v12, v8

    move-object v7, v10

    move-object v8, v7

    .end local v7    # "i1":I
    .local v11, "i1":I
    :goto_0
    add-int/lit8 v13, v3, -0x2

    if-ge v11, v13, :cond_b

    .line 136
    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 137
    .local v1, "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    move-object v1, v13

    if-eqz v13, :cond_a

    .line 141
    add-int/lit8 v13, v11, 0x1

    .local v13, "i2":I
    :goto_1
    add-int/lit8 v14, v3, -0x1

    if-ge v13, v14, :cond_9

    .line 142
    invoke-interface {v2, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 143
    .local v7, "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    move-object v7, v14

    if-eqz v14, :cond_8

    .line 148
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v14

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v15

    sub-float/2addr v14, v15

    .line 149
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v15

    move/from16 v16, v0

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v0

    invoke-static {v15, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    div-float/2addr v14, v0

    .line 150
    .local v14, "vModSize12":F
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v0

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v15

    sub-float/2addr v0, v15

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 151
    const/high16 v15, 0x3f000000    # 0.5f

    cmpl-float v0, v0, v15

    const v17, 0x3d4ccccd    # 0.05f

    if-lez v0, :cond_1

    cmpl-float v0, v14, v17

    if-ltz v0, :cond_1

    move-object/from16 v23, v1

    move-object v15, v2

    move/from16 v19, v5

    goto/16 :goto_5

    .line 157
    :cond_1
    add-int/lit8 v0, v13, 0x1

    .local v0, "i3":I
    :goto_2
    if-ge v0, v3, :cond_7

    .line 158
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 159
    .local v8, "p3":Lcom/google/zxing/qrcode/detector/FinderPattern;
    move-object/from16 v8, v18

    if-eqz v18, :cond_5

    .line 164
    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v18

    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v19

    sub-float v18, v18, v19

    .line 165
    move/from16 v19, v5

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v5

    move/from16 v20, v15

    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v15

    invoke-static {v5, v15}, Ljava/lang/Math;->min(FF)F

    move-result v5

    div-float v18, v18, v5

    .line 166
    .local v18, "vModSize23":F
    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v5

    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v15

    sub-float/2addr v5, v15

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 167
    cmpl-float v5, v5, v20

    if-lez v5, :cond_2

    cmpl-float v5, v18, v17

    if-ltz v5, :cond_2

    move-object/from16 v23, v1

    move-object v15, v2

    goto/16 :goto_4

    .line 173
    :cond_2
    new-array v5, v4, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v1, v5, v16

    aput-object v7, v5, v19

    const/4 v15, 0x2

    aput-object v8, v5, v15

    .line 174
    .local v9, "test":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    move-object v9, v5

    invoke-static {v5}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 177
    new-instance v5, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v5, v9}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    .line 178
    .local v10, "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    move-object v10, v5

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v5

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    invoke-static {v5, v15}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v5

    .line 179
    .local v5, "dA":F
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v4

    invoke-static {v15, v4}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v4

    .line 180
    .local v4, "dC":F
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    move/from16 v21, v0

    .end local v0    # "i3":I
    .local v21, "i3":I
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v0

    invoke-static {v15, v0}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v0

    .line 183
    .local v0, "dB":F
    add-float v15, v5, v0

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v22

    const/high16 v23, 0x40000000    # 2.0f

    mul-float v22, v22, v23

    div-float v15, v15, v22

    .line 184
    .local v12, "estimatedModuleCount":F
    move v12, v15

    const/high16 v22, 0x43340000    # 180.0f

    cmpl-float v15, v15, v22

    if-gtz v15, :cond_4

    const/high16 v15, 0x41100000    # 9.0f

    cmpg-float v15, v12, v15

    if-ltz v15, :cond_4

    .line 190
    sub-float v15, v5, v0

    invoke-static {v5, v0}, Ljava/lang/Math;->min(FF)F

    move-result v22

    div-float v15, v15, v22

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v15

    .line 191
    const v22, 0x3dcccccd    # 0.1f

    cmpl-float v15, v15, v22

    if-gez v15, :cond_3

    .line 196
    move-object/from16 v23, v1

    move-object v15, v2

    .end local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .local v15, "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .local v23, "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    float-to-double v1, v5

    move-wide/from16 v24, v1

    float-to-double v1, v5

    mul-double v1, v1, v24

    move-wide/from16 v24, v1

    float-to-double v1, v0

    move-wide/from16 v26, v1

    float-to-double v1, v0

    mul-double v1, v1, v26

    add-double v1, v24, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    .line 198
    .local v1, "dCpy":F
    sub-float v2, v4, v1

    invoke-static {v4, v1}, Ljava/lang/Math;->min(FF)F

    move-result v24

    div-float v2, v2, v24

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 200
    cmpl-float v2, v2, v22

    if-gez v2, :cond_6

    .line 205
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 191
    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .local v1, "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_3
    move-object/from16 v23, v1

    move-object v15, v2

    .end local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    goto :goto_3

    .line 184
    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_4
    move-object/from16 v23, v1

    move-object v15, v2

    .end local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    goto :goto_3

    .line 159
    .end local v4    # "dC":F
    .end local v5    # "dA":F
    .end local v8    # "p3":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v9    # "test":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v10    # "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .end local v12    # "estimatedModuleCount":F
    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v18    # "vModSize23":F
    .end local v21    # "i3":I
    .end local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .local v0, "i3":I
    .restart local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_5
    move/from16 v21, v0

    move-object/from16 v23, v1

    move/from16 v19, v5

    move/from16 v20, v15

    move-object v15, v2

    .line 157
    .end local v0    # "i3":I
    .end local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v21    # "i3":I
    .restart local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_6
    :goto_3
    add-int/lit8 v0, v21, 0x1

    move-object v2, v15

    move/from16 v5, v19

    move/from16 v15, v20

    move-object/from16 v1, v23

    const/4 v4, 0x3

    .end local v21    # "i3":I
    .restart local v0    # "i3":I
    goto/16 :goto_2

    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_7
    move/from16 v21, v0

    move-object/from16 v23, v1

    move-object v15, v2

    move/from16 v19, v5

    .end local v0    # "i3":I
    .end local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v21    # "i3":I
    .restart local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    goto :goto_4

    .line 143
    .end local v14    # "vModSize12":F
    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v21    # "i3":I
    .end local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_8
    move/from16 v16, v0

    move-object/from16 v23, v1

    move-object v15, v2

    move/from16 v19, v5

    .line 141
    .end local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v7    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :goto_4
    add-int/lit8 v13, v13, 0x1

    move-object v2, v15

    move/from16 v0, v16

    move/from16 v5, v19

    move-object/from16 v1, v23

    const/4 v4, 0x3

    goto/16 :goto_1

    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_9
    move/from16 v16, v0

    move-object/from16 v23, v1

    move-object v15, v2

    move/from16 v19, v5

    .end local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    goto :goto_5

    .line 137
    .end local v13    # "i2":I
    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v23    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_a
    move/from16 v16, v0

    move-object/from16 v23, v1

    move-object v15, v2

    move/from16 v19, v5

    .line 135
    .end local v1    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :goto_5
    add-int/lit8 v11, v11, 0x1

    move-object v2, v15

    move/from16 v0, v16

    move/from16 v5, v19

    move-object/from16 v1, v23

    const/4 v4, 0x3

    goto/16 :goto_0

    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_b
    move-object v15, v2

    .line 210
    .end local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v11    # "i1":I
    .restart local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c

    .line 211
    sget-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_FP_2D_ARRAY:[[Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-interface {v6, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    return-object v0

    .line 215
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 105
    .end local v6    # "results":Ljava/util/List;, "Ljava/util/List<[Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v15    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v2    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    :cond_d
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public findMulti(Ljava/util/Map;)[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
            "Lcom/google/zxing/qrcode/detector/FinderPatternInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 219
    .local p1, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    sget-object v2, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v0

    .line 220
    .local v2, "tryHarder":Z
    :goto_0
    invoke-virtual {p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->getImage()Lcom/google/zxing/common/BitMatrix;

    move-result-object v3

    const/4 v4, 0x0

    move-object v5, v4

    .line 221
    .local v5, "image":Lcom/google/zxing/common/BitMatrix;
    move-object v5, v3

    invoke-virtual {v3}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v3

    .line 222
    .local v3, "maxI":I
    invoke-virtual {v5}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v6

    .line 230
    .local v6, "maxJ":I
    mul-int/lit8 v7, v3, 0x3

    div-int/lit16 v7, v7, 0x184

    const/4 v8, 0x0

    .line 231
    .local v8, "iSkip":I
    move v8, v7

    const/4 v9, 0x3

    if-lt v7, v9, :cond_1

    if-nez v2, :cond_1

    goto :goto_1

    .line 232
    :cond_1
    const/4 v8, 0x3

    .line 235
    :goto_1
    const/4 v7, 0x5

    new-array v7, v7, [I

    .line 236
    .local v7, "stateCount":[I
    add-int/lit8 v9, v8, -0x1

    .local v9, "i":I
    :goto_2
    if-ge v9, v3, :cond_9

    .line 238
    invoke-static {v7}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->doClearCounts([I)V

    .line 239
    const/4 v10, 0x0

    .line 240
    .local v10, "currentState":I
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_3
    if-ge v11, v6, :cond_7

    .line 241
    invoke-virtual {v5, v11, v9}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 243
    and-int/lit8 v12, v10, 0x1

    if-ne v12, v1, :cond_2

    .line 244
    add-int/lit8 v10, v10, 0x1

    .line 246
    :cond_2
    aget v12, v7, v10

    add-int/2addr v12, v1

    aput v12, v7, v10

    goto :goto_4

    .line 248
    :cond_3
    and-int/lit8 v12, v10, 0x1

    if-nez v12, :cond_6

    .line 249
    const/4 v12, 0x4

    if-ne v10, v12, :cond_5

    .line 250
    invoke-static {v7}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->foundPatternCross([I)Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-virtual {p0, v7, v9, v11}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 252
    const/4 v10, 0x0

    .line 253
    invoke-static {v7}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->doClearCounts([I)V

    goto :goto_4

    .line 255
    :cond_4
    invoke-static {v7}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->doShiftCounts2([I)V

    .line 256
    const/4 v10, 0x3

    goto :goto_4

    .line 259
    :cond_5
    add-int/lit8 v10, v10, 0x1

    aget v12, v7, v10

    add-int/2addr v12, v1

    aput v12, v7, v10

    goto :goto_4

    .line 262
    :cond_6
    aget v12, v7, v10

    add-int/2addr v12, v1

    aput v12, v7, v10

    .line 240
    :goto_4
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 267
    .end local v11    # "j":I
    :cond_7
    invoke-static {v7}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->foundPatternCross([I)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 268
    invoke-virtual {p0, v7, v9, v6}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->handlePossibleCenter([III)Z

    .line 236
    .end local v10    # "currentState":I
    :cond_8
    add-int/2addr v9, v8

    goto :goto_2

    .line 271
    .end local v9    # "i":I
    :cond_9
    invoke-direct {p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->selectMultipleBestPatterns()[[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v1

    .line 272
    .local v1, "patternInfo":[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 273
    .local v9, "result":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPatternInfo;>;"
    array-length v10, v1

    :goto_5
    if-ge v0, v10, :cond_a

    aget-object v11, v1, v0

    .line 274
    .local v4, "pattern":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    move-object v4, v11

    invoke-static {v11}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 275
    new-instance v11, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v11, v4}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    .end local v4    # "pattern":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 278
    :cond_a
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 279
    sget-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    return-object v0

    .line 281
    :cond_b
    sget-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-interface {v9, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    return-object v0
.end method
